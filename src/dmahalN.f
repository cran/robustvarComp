C     As function mahal (internals.R)
C
      SUBROUTINE dmahalN (x, nsize, sigmainv, dm)
      implicit double precision(a-h,o-z)
      implicit integer (n,i,j)

      dimension x(nsize, 2), sigmainv(2,2)
      dimension x2(2), dm(nsize)
      do 10 i=1,nsize
        x2(1) = x(i,1)
        x2(2) = x(i,2)
        call dmahal2(x2, sigmainv, dm(i))
 10   continue
      return
      end
