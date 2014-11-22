Vim Adjust Scroll
=================

This plugin attempts to automatically adjust your Vim viewport so that about
1/3 of the text you're looking at is above and 2/3 of the text is below your
cursor.

This is achieved by scrolling automatically whenever:

    * You open another file
    * You jump a large distance in the current buffer

Take a look at the source if you're curious to how it works!

Installing
----------

For NeoBundle_ add the following to your `.vimrc`::

    NeoBundle 'dbakker/vim-adjustscroll'

For Pathogen_, execute::

    cd ~/.vim/bundle
    git clone https://github.com/dbakker/vim-adjustscroll
    vim +Helptags +q

That's pretty much it!

License
=======

Copyright (c) Daan Bakker. Distributed under the same terms as Vim itself. See `:help license`.

.. _Pathogen: https://github.com/tpope/vim-pathogen
.. _NeoBundle: https://github.com/Shougo/neobundle.vim
