
CCC Mean of the values using SQUARED!!
      SUBROUTINE dtukeych(x, nsize, cc, z)
        implicit double precision(a-h,m,o-z)
        implicit integer (n,i,j,l)
        dimension x(nsize)
        dsize = nsize
        z = 0.0d00
        dd = cc**2.0d00
        do 10 i=1,nsize
          y = x(i)/dd
CCCC          y = y*y
          if (y.lt.1.0d00) then
            y = y * (3.0d00 + y * (-3.0d00 + y))
          else
            y = 1.0d00
          endif
          z = z+y
 10     continue
        z = z/dsize
      return
      end

CC Just one value at time, SQUARED!!
      SUBROUTINE tukeychi(x, cc, y)
        implicit double precision(a-h,o-z)
        implicit integer (n,i,j,l)
        y = x/(cc**2.0d00)
CC        y = y*y
        if (y.lt.1.0d00) then
          y = y * (3.0d00 + y * (-3.0d00 + y))
        else
          y = 1.0d00
        endif
      return
      end

      SUBROUTINE stukeych(x, nsize, cc)
        implicit double precision(a-h,o-z)
        implicit integer (n,i)
        dimension x(nsize)
        cc = cc**2.0d00
        do 10 i=1,nsize
          y = x(i)/cc
CCCC          y = y*y
          if (y.lt.1.0d00) then
            y = y * (3.0d00 + y * (-3.0d00 + y))
          else
            y = 1.0d00
          endif
          x(i) = y
 10     continue
      return
      end
