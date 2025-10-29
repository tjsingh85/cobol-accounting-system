       IDENTIFICATION DIVISION.
       PROGRAM-ID. OperationsProgram.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  OPERATION-TYPE     PIC X(6).
       01  AMOUNT             PIC 9(6)V99.
       01  FINAL-BALANC       PIC 9(9)V99 VALUE 0.

       LINKAGE SECTION.
       01  PASSED-OPERATION   PIC X(6).

       PROCEDURE DIVISION USING PASSED-OPERATION.
           MOVE PASSED-OPERATION TO OPERATION-TYPE

           IF OPERATION-TYPE = 'TOTAL '
               CALL 'DataProgram' USING 'READ', FINAL-BALANC
               DISPLAY "Current balance: " FINAL-BALANC

           ELSE IF OPERATION-TYPE = 'CREDIT'
               DISPLAY "Enter credit amount: "
               ACCEPT AMOUNT
               CALL 'DataProgram' USING 'READ', FINAL-BALANC
               ADD AMOUNT TO FINAL-BALANC
               CALL 'DataProgram' USING 'WRITE', FINAL-BALANC
               DISPLAY "Amount credited. New balance: " FINAL-BALANC

           ELSE IF OPERATION-TYPE = 'DEBIT '
               DISPLAY "Enter debit amount: "
               ACCEPT AMOUNT
               CALL 'DataProgram' USING 'READ', FINAL-BALANC
               IF FINAL-BALANC >= AMOUNT
                   SUBTRACT AMOUNT FROM FINAL-BALANC
                   CALL 'DataProgram' USING 'WRITE', FINAL-BALANC
                   DISPLAY "Amount debited. New balance: " FINAL-BALANC
               ELSE
                   DISPLAY "Insufficient funds for this debit."
               END-IF
           END-IF
           GOBACK.
