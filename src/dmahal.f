C     As function mahalint inside function mahal (internals.R)

      subroutine dmahal(x,nvar,sigmainv,dtemp)
      double precision x(nvar),sigmainv(nvar,nvar)
      double precision dtemp

      dtemp=0.0d00
      do 200 j=1,nvar
        do 100 k=1,nvar
          dtemp=dtemp+x(j)*x(k)*sigmainv(j,k)
 100      continue
 200  continue
      return
      end

      subroutine dmahal2(x,sigmainv,dtemp)
      double precision x(2),sigmainv(2,2)
      double precision dtemp

      dtemp=0.0d00
      do 200 j=1,2
        do 100 k=1,2
          dtemp=dtemp+x(j)*x(k)*sigmainv(j,k)
 100      continue
 200  continue
      return
      end

      subroutine dmahalxy(x,y,sigmainv,dtemp)
      double precision x(2),y(2),sigmainv(2,2)
      double precision dtemp

      dtemp=0.0d00
      do 200 j=1,2
        do 100 k=1,2
          dtemp=dtemp+x(j)*y(k)*sigmainv(j,k)
 100      continue
 200  continue
      return
      end

CC      SUBROUTINE temp(x, y, sigmainv, dres)
CC      implicit double precision(a-h,o-z)
CC      implicit integer (n,i,j)
CC      dimension x(2), y(2), sigmainv(2,2)
CC      external dmahalxy
CC      call dmahalxy(x, y, sigmainv, dres)
CC      return
CC      end
