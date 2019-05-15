import pymysql
import pymysql.cursors
import random
import azure.cognitiveservices.speech as speechsdk


#TODO ajouter la librairie difflib


# Creates an instance of a speech config with specified subscription key and service region.
# Replace with your own subscription key and service region (e.g., "westus").
speech_key, service_region = "a2591d3a8359420eaf24cb8e4534aa03", "francecentral"
speech_config = speechsdk.SpeechConfig(subscription=speech_key, region=service_region, speech_recognition_language ="fr-FR")

# Creates a recognizer with the given settings
speech_recognizer = speechsdk.SpeechRecognizer(speech_config=speech_config)

print("Say something...")


# Starts speech recognition, and returns after a single utterance is recognized. The end of a
# single utterance is determined by listening for silence at the end or until a maximum of 15
# seconds of audio is processed.  The task returns the recognition text as result.
# Note: Since recognize_once() returns only a single utterance, it is suitable only for single
# shot recognition like command or query.
# For long-running multi-utterance recognition, use start_continuous_recognition() instead.
result = speech_recognizer.recognize_once()

# Checks result.
if result.reason == speechsdk.ResultReason.RecognizedSpeech:
    print("Recognized: {}".format(result.text))
elif result.reason == speechsdk.ResultReason.NoMatch:
    print("No speech could be recognized: {}".format(result.no_match_details))
elif result.reason == speechsdk.ResultReason.Canceled:
    cancellation_details = result.cancellation_details
    print("Speech Recognition canceled: {}".format(cancellation_details.reason))
    if cancellation_details.reason == speechsdk.CancellationReason.Error:
        print("Error details: {}".format(cancellation_details.error_details))


GREETING_INPUTS = ("bonjour", "salut", "yo", "salutations", "sup","hey",)
GREETING_RESPONSES = ["Bonjour", "Yo", "Salut!", "Salutations", "hey"]

def greeting(sentence):
    """If user's input is a greeting, return a greeting response"""
    for word in sentence.split():
        if word.lower() in GREETING_INPUTS:
            return random.choice(GREETING_RESPONSES)

dico={"nom": ['toblome ', 'coste', 'vavrille', 'oroudjian', 'kettab', 'dentand', 'ros', 'flaus', 'champredon', 'scheurer', 'guseynov', 'arethens', 'tin', 'fulleringer', 'merel', 'mai'],
      "prenom":['kodjo ', 'christine', 'nory', 'haikouhi', 'bachir', 'arthur', 'hugo', 'théo', 'marina', 'timothée', 'rustam', 'emmanuel', 'william', 'adrien', 'caroline', 'dao'],
      "date_naissance":['date','Date','naissance','birthday', 'anniversaire','né','date','née'],
      "lat":['lieu','vacance','lat','lattitude','paradis'],
      "lon":['lieu','vacance','longitude','Longitude','paradis'],
      "pygame_id":['jeu','pygame'],
      "astro":['astrologique','astro','signe'],
      "telephone":['phone','phonetel','06','07','tel','telephone','téléphone','ordiphone','cellulaire','smartphone','keitai','denwa','num','numéro'],
      "email":['mail','mèl','mél','mel','adresse de messagerie','messagerie électronique','@','email']
      }

def ditSImotRECONNU(motaCHERCHER):

    for cles, valeurs in dico.items():
        for mots in valeurs:
            if motaCHERCHER == mots:
                return True

def donnelemotCLEF(motaCHERCHER):

    for cles, valeurs in dico.items():
        for mots in valeurs:
            if motaCHERCHER == mots:
                return cles


def makeListe(s):
    l = s.split()
    return l

def selectRequest(data, dataTable, whereCol = "NULL", whereVal = "NULL" ):

    connection = pymysql.connect(host='localhost',
                                 user='pypromo',
                                 password='123',
                                 db='chatbot',
                                 charset='utf8mb4',
                                 cursorclass=pymysql.cursors.DictCursor)

    try:

        with connection.cursor() as cursor:
            if whereCol == "NULL":
                sql = """SELECT `%s` FROM `%s`""" % (data, dataTable)
            else:
                sql = """SELECT `%s` FROM `%s` WHERE `%s` = '%s'""" % (data, dataTable, whereCol, whereVal)
            cursor.execute(sql)
            dataList = cursor.fetchall()
            list = []
            for elt in dataList:
                list.append(elt[data])
            return list


    finally:
        connection.close()



def bobot(result):
    while 1:
        requetesur = ""
        question = result.text.rstrip(".")
        question = question.lower()
        ListeMots = makeListe(question)
        ListeInfosDemand = []
        ListeTypeInfosDemand = []
        CompteurdINFOS = 0
        nomintero=""

        if(greeting(question)!=None):
            return greeting(question)
        if question != "q":
            print(question)
            for mot in ListeMots:
                if ditSImotRECONNU(mot) == True:
                    paramrequet = donnelemotCLEF(mot)
                    if paramrequet == "prenom":
                        nomintero= mot.capitalize()

            for mot in ListeMots:
                if ditSImotRECONNU(mot) == True:
                    paramrequet = donnelemotCLEF(mot)
                    if paramrequet != "prenom" and nomintero != "":
                        CompteurdINFOS = CompteurdINFOS + 1
                        ListeTypeInfosDemand.append(paramrequet)
                        infosurNOM = selectRequest(paramrequet, "Students", "prenom", nomintero)
                        for i in infosurNOM:
                            ListeInfosDemand.append(i)

            ListeRepBOT = []
            for i in range(0, CompteurdINFOS):
                RepBOT="{}: {}".format(ListeTypeInfosDemand[i],ListeInfosDemand[i])
                ListeRepBOT.append(RepBOT)
            StringRepBot = ", ".join(ListeRepBOT)
            if CompteurdINFOS == 1:
                return "Tu as demandé {} info sur {}, la voici : ".format(CompteurdINFOS, nomintero) + StringRepBot
            elif CompteurdINFOS > 1:
                return "Tu as demandé {} infos sur {}, les voici : ".format(CompteurdINFOS, nomintero) + StringRepBot
            else:
                return "En quoi puis-je t'aider ? "

        else:
            return "Ciao"

if __name__ == '__main__':
    test = bobot(result)
    print(test)