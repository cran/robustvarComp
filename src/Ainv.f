C     As function Ainv (internals.R)

      subroutine dinv(x, y)
      double precision x(2,2), y(2,2)
      double precision dx
      dx = x(1,1)*x(2,2)-x(1,2)*x(2,1)
      y(1,1) = x(2,2)/dx
      y(2,2) = x(1,1)/dx
      y(1,2) = -x(1,2)/dx
      y(2,1) = -x(2,1)/dx
      return
      end

C     As function Ainvstar (internals.R)
      subroutine dinvstar(x, y)
      double precision x(2,2), y(2,2)
      double precision dx
      dx = x(1,1)*x(2,2)-x(1,2)*x(2,1)
      dx = dsqrt(dx)
      y(1,1) = x(2,2)/dx
      y(2,2) = x(1,1)/dx
      y(1,2) = -x(1,2)/dx
      y(2,1) = -x(2,1)/dx
      return
      end
