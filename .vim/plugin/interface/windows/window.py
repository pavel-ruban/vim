#!/usr/bin/python3.4
import sys
import vim

#import rpdb2
#rpdb2.start_embedded_debugger('789987')

class Window:
  width = 20
  orientation = 'botright'
  name = 'python'
  tag = 'service'
  data = 'hello!'

  # Open current window.
  def open(self):
    vim.command('%s %d split %s' % (self.orientation, self.width, self.name))
    vim.command('let w:tag = "%s"' % (self.tag))
    vim.command('setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap')
    self.content(self.data)

    return self

  # Replace current window content with new one.
  def content(self, content):
    winNum = self.getService()
    if winNum > 0:
      vim.command(str(winNum) + 'wincmd w | %d | exe "normal! i' + content + '" | exe "normal! ^"')
      self.data = content
      vim.command('wincmd p')
    return self

  # Close current window.
  def close(self):
    winNum = self.getService()
    if winNum > 0:
      vim.command('%d wincmd w' % (winNum))
      vim.command('exe "if exists(\'w:tag\') && w:tag == \'%s\' | close! | endif"' % (self.tag))
      vim.command('wincmd p')

    return self

  # Iterate all opened windows & find service window.
  def getService(self):
    winQty = vim.eval('winnr("$")')

    for i in range(1, int(winQty) + 1):
      isService = vim.eval('getwinvar(%d, "tag")' % (i))

      if len(isService) > 0 and isService == self.tag:
        return i

    return 0

  # Iterate all opened windows & find content window.
  def getActive(self):
    winQty = vim.eval('winnr("$")')

    for i in range(1, int(winQty) + 1):
      isActive = vim.eval('getwinvar(%d, "tag")' % (i))

      if len(isActive) > 0 and isActive == 'active':
        return i

    return 0

  # Checks whether active window exists if not - set new active
  def ensureActiveIsExists(self):
    #print('start active check')
    if not self.getActive():
        winQty = vim.eval('winnr("$")')
        winnr = vim.eval('winnr()')

        #print('active window is missing %i %i' % (int(winQty), int(winnr)))

        if not winQty:
            return

        elif winQty == 1:
            #print('set active window')
            vim.command('let w:tag = "active"')

        else:

            for i in range(1, int(winQty) + 1):
                #print('checking window is %i' % i)

                if i == winnr:
                    continue

                if vim.eval('WindowNumValidate(%i)' % (i)):
                    #print('set active window is %i' % i)
                    vim.command('call setwinvar(%i, "tag", "active")' % i)
                    break

  def toggle(self):
    winNum = self.getService()
    if winNum > 0:
      self.close()
    else:
      self.open()
