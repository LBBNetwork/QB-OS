DECLARE SUB lolepicprg ()
DECLARE SUB SimpDos ()
DECLARE SUB RunPrg ()
DECLARE SUB SIMPUtils ()
DECLARE SUB FirstrunSUB ()
DECLARE SUB HELP ()
' Codename QBOS

OPEN "FIRST.RUN" FOR INPUT AS #4
WHILE NOT EOF(4)
LINE INPUT #4, Firstrun$
WEND
CLOSE #4

IF Firstrun$ = "no" THEN FirstrunSUB

login:
CLS
PRINT "Codename QB-OS Alpha 5 (Accessory build)"
PRINT ""
PRINT "This OS is under develompent; features may be added or removed."
PRINT ""
BEEP
1 INPUT "Username: ", Username$
INPUT "Password: ", Password$

OPEN "LOGON.LGN" FOR INPUT AS #1
WHILE NOT EOF(1)
LINE INPUT #1, LGNUsername$
WEND
CLOSE #1

OPEN "L0GON.LGN" FOR INPUT AS #2
WHILE NOT EOF(2)
LINE INPUT #2, LGNPassword$
WEND
CLOSE #2

IF Username$ <> LGNUsername$ THEN
PRINT "Invalid logon"
PRINT ""
GOTO 1
END IF

IF Password$ <> LGNPassword$ THEN
PRINT "Invalid logon"
PRINT ""
GOTO 1
END IF


3 REM main kernel
CLS
'COLOR 7, 9: PRINT CURDIR$; : COLOR 7, 0: VIEW PRINT 2 TO 24
'FOR i = 100 TO 10 STEP -1: NEXT
PRINT "It's always a good idea to type HELP so you can find out all the commands"
4 PRINT "("; Username$; ")"; CURDIR$; : INPUT " ", commnd$

SELECT CASE LCASE$(commnd$)
CASE ""
GOTO 4

CASE "cd"
INPUT "Directory to change to: ", changedir$
SELECT CASE changedir$
CASE ""
GOTO 4
CASE ELSE
CHDIR changedir$
END SELECT
GOTO 4

CASE "shutoff"
    INPUT "Is it time to shut down? ", shutoff$
    SELECT CASE LCASE$(LEFT$(shutoff$, 1))
    CASE "y"
    PRINT "Codename QB-OS Alpha 5 (Accessory build)"
    PRINT "(c) 2010 Little Beige Box software"
    PRINT "http://thefrozenflame.uni.cc"
    END
        CASE "n"
        PRINT ""
        GOTO 4
            CASE ELSE
            PRINT ""
            GOTO 4
END SELECT

CASE "help"
HELP
btm:
CLS
GOTO 4

CASE "simpdos"
SimpDos
GOTO 4

CASE "texted"
PRINT "We were going to have a text editor... Codebugs ate the code :("
PRINT ""
GOTO 4

CASE "lolepic"
DoEpileptic:
INPUT "Do you have epilepsy? ", lolepic$
    SELECT CASE LEFT$(LCASE$(lolepic$), 1)
    CASE "y"
    PRINT ""
    GOTO 4

    CASE "n"
    lolepicprg
    PRINT ""
    GOTO 4
    CASE ELSE
    GOSUB DoEpileptic
    END SELECT

CASE "cls"
CLS
GOTO 4

CASE "musplay"
GOTO 4

CASE "ver"
PRINT "Codename QB-OS Alpha 5 (Accessory build)"
PRINT ""
GOTO 4

CASE "mfile:del"
5 INPUT "File to delete: ", del$
    SELECT CASE LCASE$(del$)
    CASE "logon.lgn"
    PRINT "You cannot delete a system component"
    PRINT ""
    GOTO 5
        CASE "l0gon.lgn"
        PRINT "You cannot delete a system component"
        PRINT ""
        GOTO 5
            CASE ELSE
            KILL del$
            PRINT "File was deleted"
            PRINT ""
            GOTO 4
    END SELECT

CASE "mfile:make"
PRINT "This feature currently removed because of codebugs."
PRINT ""
GOTO 4

CASE "mkdir"
dirmake:
PRINT ""
INPUT "Directory to create: ", dirmake$
    SELECT CASE dirmake$
    CASE ""
    PRINT "Cannot name a directory nothing"
    GOSUB dirmake
        CASE ELSE
        MKDIR dirmake$
        GOTO 4
            END SELECT

CASE "dir"
FILES
GOTO 4

CASE "remdir"
remove:
INPUT "Directory to remove: ", dirrem$
    SELECT CASE dirrem$
    CASE ""
    PRINT "Cannot remove nothing"
    GOSUB remove
        CASE ELSE
        RMDIR dirrem$
        GOTO 4
            END SELECT

CASE "init"
PRINT "INIT removed until it can format drives..."
PRINT ""
GOTO 4

CASE "logout"
INPUT "Do you want to logout? ", logoutnao$

    SELECT CASE LCASE$(LEFT$(logoutnao$, 1))
    CASE "y"
    GOSUB login
        CASE "n"
        PRINT ""
        GOTO 4
            CASE ELSE
            PRINT ""
            GOTO 4
                END SELECT

CASE "about"
PRINT "Codename QB-OS Alpha 4 (Code reset)"
PRINT "An OS made in QuickBASIC to prove how powerful it is :)"
PRINT "Thanks muchly to usotsuki (http://usotsuki.info) for helping with code"
PRINT "Dedicated to anyone who uses any form of BASIC as a main language"
PRINT "And BetaArchive.co.uk"
PRINT ""
GOTO 4

CASE ELSE
PRINT commnd$; " Unknown command"
PRINT ""
GOTO 4

END SELECT

SUB FirstrunSUB
CLS
PRINT "It seems you are running Codename QB-OS for the first time."
PRINT "To begin using Codename QB-OS, you must have a username and password."
INPUT "What would you like your username to be? ", WhatUser$
INPUT "What would you like your password to be? ", WhatPass$
OPEN "LOGON.LGN" FOR OUTPUT AS #1
PRINT #1, WhatUser$
CLOSE #1

OPEN "L0GON.LGN" FOR OUTPUT AS #2
PRINT #2, WhatPass$
CLOSE #2

KILL "FIRST.RUN"
OPEN "FIRST.RUN" FOR OUTPUT AS #4
PRINT #4, "yes"
CLOSE #4

EXIT SUB
END SUB

SUB HELP
CLS
PRINT "This help system won't be finished until the OS is complete."
PRINT "However, here are the commands supported in QBOS Alpha 4:"
PRINT "cd"
PRINT "cls"
PRINT "mkdir"
PRINT "remdir"
PRINT "shutoff"
PRINT "init"
PRINT "mfile:del"
PRINT "mfile:make"
PRINT "logout"
PRINT ""
PRINT "Accessories:"
PRINT "simpdos"
PRINT "lolepic"
PRINT "musplay"
DO: LOOP UNTIL INKEY$ = CHR$(13)
EXIT SUB
END SUB

SUB lolepicprg

DO
FOR n = 0 TO 15
COLOR n, INT(RND * 8)
PRINT "LOL EPIC";
NEXT n
LOOP UNTIL INKEY$ = CHR$(13)

EXIT SUB

END SUB

SUB musplay
CLS
PRINT "This program not yet avalible"
END SUB

SUB RunPrg
PRINT "Codename QB-OS does not currently support running programs."
PRINT "This will come in Beta 1 of Codename QB-OS."
PRINT "(ENTER to continue)"
DO: LOOP UNTIL INKEY$ = CHR$(13)
EXIT SUB

END SUB

SUB SimpDos
' simpDOS shell for codename QB-OS
Begin:
CLS

COLOR 0, 7: PRINT "QB-OS Shell"; : COLOR 7, 7: PRINT "ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ"; : COLOR 0, 7: PRINT "Main Menu"; : COLOR 7, 0
LOCATE 4, 25: PRINT "Welcome, please choose a task:"
LOCATE 5, 25: PRINT "ออออออออออออออออออออออออออออออ"
LOCATE 6, 25: PRINT "1. Launch program"
LOCATE 7, 25: PRINT "2. Run a utility (placeholder)"
LOCATE 8, 25: PRINT "ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ"
LOCATE 9, 25: PRINT "3. About the QB-OS shell"
LOCATE 10, 25: PRINT "4. Exit"
LOCATE 11, 25: PRINT "ออออออออออออออออออออออออออออออ"
LOCATE 12, 25: INPUT "Task number: ", TaskNum$

SELECT CASE TaskNum$
CASE "1"
RunPrg
GOSUB Begin
CASE "2"
SIMPUtils
GOSUB Begin
CASE "3"
CASE "4"
CLS
EXIT SUB
CASE ELSE
LOCATE 13, 25: PRINT "Invalid or unknown task number (Press ENTER)"
DO: LOOP UNTIL INKEY$ = CHR$(13)
GOSUB Begin
END SELECT

END SUB

SUB SIMPUtils
simpbegin:
CLS

COLOR 0, 7: PRINT "QB-OS Shell"; : COLOR 7, 7: PRINT "ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ"; : COLOR 0, 7: PRINT "Utilities"; : COLOR 7, 0
LOCATE 4, 25: PRINT "Please choose a utility:"
LOCATE 5, 25: PRINT "ออออออออออออออออออออออออออออออ"
LOCATE 6, 25: PRINT "1. Format disk"
LOCATE 7, 25: PRINT "2. Manage files"
LOCATE 8, 25: PRINT "3. Back to main menu"
LOCATE 9, 25: PRINT "ออออออออออออออออออออออออออออออ"
LOCATE 10, 25: INPUT "Utility number: ", utilnum$


SELECT CASE utilnum$
CASE "1"
PRINT ""
PRINT "QB-OS does not currently support formatting disks."
PRINT "(ENTER to continue)"
DO: LOOP UNTIL INKEY$ = CHR$(13)
GOSUB simpbegin


CASE "2"
PRINT "feature to be added, enter to continue"
DO: LOOP UNTIL INKEY$ = CHR$(13)
GOSUB simpbegin

CASE "3"
EXIT SUB

CASE ELSE
LOCATE 10, 25: PRINT "Invalid or unknown utility number"
DO: LOOP UNTIL INKEY$ = CHR$(13)


END SELECT
END SUB

