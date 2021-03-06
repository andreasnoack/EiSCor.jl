#include "eiscor.h"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
! testZUHFQR
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
! This program tests the subroutine ZUHFQR. The following tests are run:
!
! 1) Compute roots of unity and checks the residuals for various powers of 2
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
program testZUHFQR

  implicit none
  
  ! compute variables
  integer, parameter :: MPOW = 9
  integer, parameter :: N = 2**MPOW
  integer :: ii, INFO, jj, M
  real(8) :: WORK(5*N)
  complex(8) :: Hold(N,N), H(N,N), Z(N,N)
  integer :: ITS(N-1)
  real(8) :: tol
  
  ! print banner
  print*,""
  print*,"Test for ZUHFQR:"
  
  ! loop through powers of 2
  do jj=1,MPOW
  
    ! set current degree
    M = 2**jj
  
    ! initialize H to be an upper hessenberg permutation matrix
    H = cmplx(0d0,0d0,kind=8)
    do ii=1,M-1
      H(ii+1,ii) = cmplx(1d0,0d0,kind=8)
    end do
    H(1,M) = cmplx(1d0,0d0,kind=8)
    Hold = H
    
    ! call dohfqr
    call ZUHFQR('I',M,H(1:M,1:M),Z(1:M,1:M),ITS,WORK,INFO)
    
    ! check INFO
    if (INFO.NE.0) then
      print*,"FAILED"
      stop
    end if
    
    ! compute residual matrix
    Hold(1:M,1:M) = matmul(Hold(1:M,1:M),Z(1:M,1:M))-matmul(Z(1:M,1:M),H(1:M,1:M))
    
    ! set tolerance
    tol = max(10d0,dble(M))*epsilon(1d0)
    
    ! check maximum entry
    if (maxval(abs(Hold(1:M,1:M))) >= tol) then
      print*,"FAILED"
      stop
    end if  
 
  end do
  
  ! print success
  print*,'PASSED'
     
end program testZUHFQR
