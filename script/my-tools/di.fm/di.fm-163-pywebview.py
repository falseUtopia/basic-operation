
#  Copyright (c) 2021. falseUtopia All rights reserved.
#  Licensed under BSD license
#
#  https://github.com/falseUtopia/basic-operation
#

import webview

if __name__ == '__main__':
    window = webview.create_window(title='DI.FM',
                                   url='https://mp.music.163.com/5c8764e4ff3225d6738f615c/index.html?channe1Id=1060',
                                   resizable=False,
                                   width=300,
                                   height=560)

    webview.start(
        user_agent='Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Mobile Safari/537.36',
        debug=False,
        gui='cef')
