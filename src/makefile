
# Makefile Author: 	Jose Fernando Lopez Fernandez
# 					28-June-2017

# Compiler Information

CC        := gFortran
CFLAGS    := -Og -ggdb -std=f2003 -Wall -Wextra -pedantic-errors -Winteger-division -Werror -fcheck=all

	# Compiler Flags
	# 		DBCFLAGS --> Debug-build compiler flags
	# 		RLCFLAGS --> Release-build compiler flags

	# 		[ERRORS/WARNGINGS]
	# -Wall Enables commonly used warning options pertaining to usage that we
    # 		recommend avoiding and that we believe are easy to avoid. This currently
    # 		includes ‘-Waliasing’, ‘-Wampersand’, ‘-Wconversion’, ‘-Wsurprising’,
    # 		‘-Wc-binding-type’, ‘-Wintrinsics-std’, ‘-Wtabs’, ‘-Wintrinsic-shadow’,
    # 		‘-Wline-truncation’, ‘-Wtarget-lifetime’, ‘-Winteger-division’,
    # 		‘-Wreal-q-constant’, ‘-Wunused’ and ‘-Wundefined-do-loop’.

    # -Wextra Enables some warning options for usages of language features
    # 		  which may be problematic. This currently includes 'Wcompare-reals'
    # 		  and '-Wunused-parameter'

    # -pedantic-errors Issue errors for uses of extension to Fortran 95.

    # -Winteger-division Warn if a constant integer division truncates its result.
    #  					 As an example, 3/5 evaluates to 0.

    # -Werror Turns all warnings into errors.

    # -fcheck=all Enable the generation of run-time checks; the argument shall be a comma-
    #  			  delimited list. Prefixing a check with 'no-' disables it if it was activated
    # 			  by a previous specification
    #
    # 			  'all' Enable all run-time test of '-fcheck'

    # -ggdb	Produce debugging information for use by GDB. This means to use the most
    # 		expressive format availab.e, including GDB extensions if at all possible.

    # -0g   Optimize debugging experience. '-0g' enables optimizations that do not
    # 	    interfere with debugging. It should be the optimization level of choice for the
    # 		standard edit-compile-debug cycle, offering a reasonable level of optimization
    # 		while maintaining a fast compilation and a good debugging experience.

# Program Information
PROGRAM     := test

SRCS        := $(wildcard *.F95)
OBJS        := $(patsubst %.F95,%.o,$(SRCS))


# Compilation Information

$(PROGRAM): $(OBJS)
	$(CC) $(CFLAGS) -o $(PROGRAM) $(OBJS)

$(OBJS): $(SRCS)
	$(CC) -c $(CFLAGS) $(SRCS)

clean:
	rm -rf $(OBJS)
	rm -rf $(PROGRAM)