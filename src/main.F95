      ! Author: Stephen J. Chapman
      ! Publisher: McGraw-Hill Education
      ! Book: Fortran for Scientists and Engineers 1998/2003


      ! Linear Regression Calcultion Program


      PROGRAM mcmd
      IMPLICIT NONE

        ! Data dictionary: declaring constants
        INTEGER, PARAMETER :: IO_UNIT = 25

        ! Data dictionary: declaring variable types, definitions, and units
        INTEGER :: file_io_error_code                 ! Status flag from IO operations
        INTEGER :: n = 0                              ! Number of input data pairs

        REAL :: slope                                 ! Slope of the line
        REAL :: sum_x = 0.                            ! Sum of all input X values
        REAL :: sum_x2 = 0.                           ! Sum of all input X values squared
        REAL :: sum_xy = 0.                           ! Sum of all input X*Y values
        REAL :: sum_y = 0.                            ! Sum of all input Y values
        REAL :: x                                     ! An input X value
        REAL :: x_bar                                 ! Average X value
        REAL :: y                                     ! An input Y value
        REAL :: y_bar                                 ! Average Y value
        REAL :: y_int                                 ! Y-axis intercept of the line

        CHARACTER(len=24) :: filename                 ! Input file name (less than 24 chars)


        ! Prompt user to enter the name of the input file
        WRITE (*,*) 'PLEASE ENTER FILE TO READ: '
        READ (*,*) filename

1000    FORMAT (' ', 'FILENAME: ', A)
        WRITE (*,1000) filename

        ! Open file
        OPEN (UNIT=IO_UNIT, FILE=filename, STATUS='OLD', IOSTAT=file_io_error_code)

        IF (file_io_error_code > 0) THEN
          WRITE (*,*) '[ERROR] THE FILE COULD NOT BE OPENED. DOES IT EXIST? '
        ELSE IF (file_io_error_code < 0) THEN
          WRITE (*,*) '[ERROR] END OF FILE HAS BEEN REACHED. '
        ELSE
          WRITE (*,*) 'FILE OPENED SUCCESSFULLY. '
        END IF

        CLOSE (UNIT=IO_UNIT)

      END PROGRAM