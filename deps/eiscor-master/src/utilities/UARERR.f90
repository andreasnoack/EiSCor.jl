#include "eiscor.h"
subroutine UARERR(FILENAME,LINENUM,MESSAGE,INFO,NEWINFO) 

  implicit none

  ! input variables
  character(*), intent(in) :: FILENAME, MESSAGE
  integer, intent(inout) :: INFO
  integer, intent(in) :: NEWINFO, LINENUM 

  ! check INFO
  if (INFO.NE.0) then
    write(STDERR,*) "Error in "//FILENAME//" line:",LINENUM
    write(STDERR,*) MESSAGE
    write(STDERR,*) "INFO:",INFO
    write(STDERR,*) ""
    INFO = NEWINFO
    return
  end if
  
end subroutine UARERR 
