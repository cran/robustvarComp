
CCC Mean of the values using SQUARED!!
      SUBROUTINE drockech(x, nsize, np, dq, z)
        implicit double precision(a-h,m,o-z)
        implicit integer (n,i,j,l)
        dimension x(nsize)
        parameter(dzero=0.0d00)
        parameter(dmezzo=0.5d00)
        parameter(duno=1.0d00)
        parameter(ddue=2.0d00)
        parameter(dtre=3.0d00)
        parameter(dquattro=4.0d00)
        dp = np
        dsize = nsize
        z = dzero
        dg = dq/dp - duno
        if (dg.gt.duno) then
          dg = duno
        endif
        do 10 i=1,nsize
          w = x(i)
          y = dzero
          if (w.le.(duno-dg)) then
            y = dzero
          elseif (w.gt.(duno+dg)) then
            y = duno
          else
            y = ((w-duno)/(dquattro*dg))*
     &         (dtre-((w-duno)/dg)**ddue)+dmezzo
          endif
          z = z+y
 10     continue
        z = z/dsize
      return
      end

CC Just one value at time, SQUARED!!
      SUBROUTINE rockechi(x, np, dq, y)
        implicit double precision(a-h,o-z)
        implicit integer (n,i,j,l)
        parameter(dzero=0.0d00)
        parameter(dmezzo=0.5d00)
        parameter(duno=1.0d00)
        parameter(ddue=2.0d00)
        parameter(dtre=3.0d00)
        parameter(dquattro=4.0d00)
        dp = np
        dg = dq/dp - duno
        if (dg.gt.duno) then
          dg = duno
        endif
        if (x.lt.(duno-dg)) then
          y = dzero
        elseif (x.gt.(duno+dg)) then
          y = duno
        else
          y = ((x-duno)/(dquattro*dg))*
     &       (dtre-((x-duno)/dg)**ddue)+dmezzo
        endif
      return
      end

      SUBROUTINE srockech(x, nsize, np, dq)
        implicit double precision(a-h,m,o-z)
        implicit integer (n,i,j,l)
        dimension x(nsize)
        parameter(dzero=0.0d00)
        parameter(dmezzo=0.5d00)
        parameter(duno=1.0d00)
        parameter(ddue=2.0d00)
        parameter(dtre=3.0d00)
        parameter(dquattro=4.0d00)
        dp = np
        dsize = nsize
        dg = dq/dp - duno
        if (dg.gt.duno) then
          dg = duno
        endif
        do 10 i=1,nsize
          w = x(i)
          y = dzero
          if (w.lt.(duno-dg)) then
            y = dzero
          elseif (w.gt.(duno+dg)) then
            y = duno
          else
            y = ((w-duno)/(dquattro*dg))*
     &          (dtre-((w-duno)/dg)**ddue)+dmezzo
          endif
          x(i) = y
 10     continue
      return
      end
