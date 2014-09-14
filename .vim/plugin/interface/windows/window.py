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

  def toggle(self):
    winNum = self.getService()
    if winNum > 0:
      self.close()
    else:
      self.open()
