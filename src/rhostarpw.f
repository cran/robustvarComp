      SUBROUTINE rhospw(x, jl, nsize, scale, cc, ipsi, a)
        implicit double precision(a-h,o-z)
        implicit integer (n,i)
        dimension x(jl,nsize), scale(jl), a(jl)
        G0 =  1.792d00
        G1 = -1.944d00 
        G2 =  1.728d00
        G3 = -0.312d00
        G4 =  0.016d00
        G  =  3.250d00
        cc = cc**2.0d00
        dsize = nsize
        do 10 jlindex=1,jl
          a(jlindex) = 0.0d00
          do 20 i=1,nsize
            y = x(jlindex,i)/scale(jlindex)
            y = y/cc
CCCC          y = y*y
            if (ipsi.eq.1) then
              if (y.lt.1.0d00) then
                y = y * (3 + y * (-3 + y))
              else
                y = 1.0d00
              endif
            else if (ipsi.eq.3) then
              if (y.lt.4.0d00) then
                y = y/2.0d00/G
              else if (y.lt.9.0d00) then
                y = ((G4/8.0d00)*(y**4.0d00) + (G3/6.0d00)*(y**3.0d00) 
     &              +(G2/4.0d00)*(y**2.0d00) + (G1/2.0d00)*y + G0)/G
              else
                y = 1.0d00
              endif
            endif
            a(jlindex) = a(jlindex)+y
 20       continue
          a(jlindex) = a(jlindex)/dsize
 10     continue
      return
      end
