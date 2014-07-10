      SUBROUTINE dosstepr(x, nsize, scale, bb, np, dq, tol)
      implicit double precision(a-h,o-z)
      implicit integer (n,i,j)
      logical neverdown
      dimension x(nsize), y(nsize)
      external drockech

      itermax = ceiling(-(dlog(tol)/dlog(2.0d00))
     &        + dlog(scale)/dlog(2.0d00))+20
      i = 1
      step = scale
      neverdown = .TRUE.
      dsize = nsize
      dp = np
      bb = bb*(1-dp/dsize)
      if (dp.gt.dsize) then
        scale = 0.0d00
        return
      endif
      dloss = 0.0d00
 300  if (i.le.itermax) then
        do 200 j=1,nsize
          y(j) = x(j)/scale
 200    continue
        call drockech(y, nsize, np, dq, dloss)
        if (dloss.gt.bb) then
          if (neverdown) then
            scale = 2.0d00*scale
            step = scale
          else
            scale = scale+step/(2.0d00**i)
            i = i + 1
          endif
        else
          neverdown = .FALSE.
          scale = scale-step/(2.0d00**i)
          i = i + 1
        endif
        goto 300
      endif 
      return
      end
