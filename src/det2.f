C     As function det2 (internals.R)

      subroutine det2(x, y)
        double precision x(2,2)
        double precision y
        y = x(1,1)*x(2,2)-x(1,2)*x(2,1)
      return
      end
