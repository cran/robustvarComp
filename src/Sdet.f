       SUBROUTINE sdet(sigma, np, jl, sigmadet)
      implicit double precision(a-h,o-z)
      implicit integer (n,j,l)

      dimension sigma(np,np), sigmadet(jl)

      jlindex = 0
      do 10 j=1,(np-1)
        do 20 l=(j+1),np
          jlindex = jlindex+1
          sigmadet(jlindex) = sigma(j,j)*sigma(l,l)
     &                      - sigma(j,l)*sigma(l,j)
 20     continue
 10   continue
      return
      end
