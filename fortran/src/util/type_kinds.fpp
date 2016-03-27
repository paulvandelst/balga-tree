!
! type_kinds
!
! Module to hold specification kinds for variable declarations
!

module type_kinds
  implicit none

  private
  public :: byte, short, long, llong, ip
  public :: single, double, quad, fp


  ! Integer kinds
  integer, parameter :: byte  = selected_int_kind(1)
  integer, parameter :: short = selected_int_kind(4)
  integer, parameter :: long  = selected_int_kind(8)
  integer, parameter :: llong = selected_int_kind(16)
  ! ...generic integer kind
#ifndef INT_SIZE
#define INT_SIZE 4  /* Default 4-byte long */
#endif
#if INT_SIZE == 1
  integer, parameter :: ip = byte
#elif INT_SIZE == 2
  integer, parameter :: ip = short
#elif INT_SIZE == 8
  integer, parameter :: ip = llong
#else
  integer, parameter :: ip = long
#endif


  ! Real kinds
  integer, parameter :: single = selected_real_kind(6)
  integer, parameter :: double = selected_real_kind(15)
  integer, parameter :: quad   = selected_real_kind(20)
  ! ...generic real kind
#ifndef REAL_SIZE
#define REAL_SIZE 8  /* Default 8-byte double */
#endif
#if REAL_SIZE == 4
  integer, parameter :: fp = single
#elif REAL_SIZE == 16
  integer, parameter :: fp = quad
#else
  integer, parameter :: fp = double
#endif

end module type_kinds
