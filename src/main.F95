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
        WRITE (*,1000)
1000    FORMAT (1X, 'THIS PROGRAM PERFORMS A LEAST-SQUARES FIT OF AN ', /, &
          1X, 'INPUT DATA SET TO A STRAIGHT LINE. ENTER THE NAME', / &
          1X, 'OF THE FILE CONTAINING THE INPUT (X,Y) PAIRS:   ')

        READ (*,1010) filename
1010    FORMAT (A)        


        ! Open file
        OPEN (UNIT=IO_UNIT, FILE=filename, STATUS='OLD', IOSTAT=file_io_error_code)

        ! Verify the file opened correctly
ERROR:  IF (file_io_error_code > 0) THEN
          WRITE (*,*) '[ERROR] THE FILE COULD NOT BE OPENED. DOES IT EXIST? '

        ELSE IF (file_io_error_code < 0) THEN
          WRITE (*,*) '[ERROR] END OF FILE HAS BEEN REACHED. '

        ELSE
          WRITE (*,*) 'FILE OPENED SUCCESSFULLY. READING DATA...'


          ! Read input
          DO
            READ (IO_UNIT, *, IOSTAT=file_io_error_code) x, y

            ! Program returns an end of file error every time (errcode < 0)
            IF (file_io_error_code > 0) EXIT

            n = n + 1
            sum_x = sum_x + x
            sum_y = sum_y + y
            sum_x2 = sum_x2 + (x**2)
            sum_xy = sum_xy + (x * y)
          END DO


          ! Calculate slope and intercept
          x_bar = sum_x / REAL(n)
          y_bar = sum_y / REAL(n)

          slope = (sum_xy - (sum_x * y_bar)) / (sum_x2 - (sum_x * x_bar))

          y_int = y_bar - slope * x_bar


          ! Notify user
          WRITE (*,1030) slope, y_int, n
1030      FORMAT ('REGRESSION COEFFICIENTS FOR THE LEAST-SQUARES LINE: ', &
            /, 1X, ' SLOPE(m)     = ', F12.3, &
            /, 1X, ' INTERCEPT(b) = ', F12.3, &
            /, 1X, ' POINTS:      = ', I12)        


          ! Close the input file and quit
          CLOSE (UNIT=IO_UNIT)
        END IF ERROR
      END PROGRAM