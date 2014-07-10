
CCC Mean of the values using SQUARED!!
      SUBROUTINE doptimch(x, nsize, cc, z)
        implicit double precision(a-h,m,o-z)
        implicit integer (n,i,j,l)
        dimension x(nsize)
        G0 =  1.792d00
        G1 = -1.944d00 
        G2 =  1.728d00
        G3 = -0.312d00
        G4 =  0.016d00
        G  =  3.250d00
        dsize = nsize
        z = 0.0d00
        dd = cc**2.0d00
        do 10 i=1,nsize
          y = x(i)/dd
CCCC          y = y*y
          if (y.lt.4.0d00) then
            y = y/2.0d00/G
          else if (y.lt.9.0d00) then
            y = ((G4/8.0d00)*(y**4.0d00) + (G3/6.0d00)*(y**3.0d00) 
     &          +(G2/4.0d00)*(y**2.0d00) + (G1/2.0d00)*y + G0)/G
          else
            y = 1.0d00
          endif
          z = z+y
 10     continue
        z = z/dsize
      return
      end

CC Just one value at time, SQUARED!!
      SUBROUTINE optimchi(x, cc, y)
        implicit double precision(a-h,o-z)
        implicit integer (n,i,j,l)
        G0 =  1.792d00
        G1 = -1.944d00 
        G2 =  1.728d00
        G3 = -0.312d00
        G4 =  0.016d00
        G  =  3.250d00
        y = x/(cc**2.0d00)
CC        y = y*y
        if (y.lt.4.0d00) then
          y = y/2.0d00/G
        else if (y.lt.9.0d00) then
          y = ((G4/8.0d00)*(y**4.0d00) + (G3/6.0d00)*(y**3.0d00) 
     &        +(G2/4.0d00)*(y**2.0d00) + (G1/2.0d00)*y + G0)/G
        else
          y = 1.0d00
        endif
      return
      end

      SUBROUTINE soptimch(x, nsize, cc)
        implicit double precision(a-h,o-z)
        implicit integer (n,i)
        dimension x(nsize)
        G0 =  1.792d00
        G1 = -1.944d00 
        G2 =  1.728d00
        G3 = -0.312d00
        G4 =  0.016d00
        G  =  3.250d00
        cc = cc**2.0d00
        do 10 i=1,nsize
          y = x(i)/cc
CCCC          y = y*y
          if (y.lt.4.0d00) then
            y = y/2.0d00/G
          else if (y.lt.9.0d00) then
            y = ((G4/8.0d00)*(y**4.0d00) + (G3/6.0d00)*(y**3.0d00) 
     &        +(G2/4.0d00)*(y**2.0d00) + (G1/2.0d00)*y + G0)/G
          else
            y = 1.0d00
          endif
          x(i) = y
 10     continue
      return
      end
