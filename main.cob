       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAIN.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  USER-CHOICE       PIC 9 VALUE 0.
       01  CONTINUE-FLAG     PIC X(3) VALUE 'YES'.

       PROCEDURE DIVISION.
       MAIN-LOGIC.
           PERFORM UNTIL CONTINUE-FLAG = 'NO'
               DISPLAY "--------------------------------"
               DISPLAY "Account Management System"
               DISPLAY "1. View Balance"
               DISPLAY "2. Credit Account"
               DISPLAY "3. Debit Account"
               DISPLAY "4. Exit"
               DISPLAY "--------------------------------"
               DISPLAY "Enter your choice (1-4): "
               ACCEPT USER-CHOICE

               EVALUATE USER-CHOICE
                   WHEN 1
                       CALL 'OperationsProgram' USING 'TOTAL '
                   WHEN 2
                       CALL 'OperationsProgram' USING 'CREDIT'
                   WHEN 3
                       CALL 'OperationsProgram' USING 'DEBIT '
                   WHEN 4
                       MOVE 'NO' TO CONTINUE-FLAG
                   WHEN OTHER
                       DISPLAY "Invalid choice, please select 1-4."
               END-EVALUATE
           END-PERFORM
           DISPLAY "Exiting the program. Goodbye!"
           STOP RUN.
