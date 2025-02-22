.. index:: ! grdpaste
.. include:: module_core_purpose.rst_

********
grdpaste
********

|grdpaste_purpose|

Synopsis
--------

.. include:: common_SYN_OPTs.rst_

**gmt grdpaste** *file_a.nc file_b.nc*
|-G|\ *outfile.nc*
[ |-S| ]
[ |SYN_OPT-V| ]
[ |SYN_OPT-f| ]
[ |SYN_OPT--| ]

|No-spaces|

Description
-----------

**grdpaste** will combine *file_a.nc* and *file_b.nc* into
*outfile.nc* by pasting them together along their common edge. Files
*file_a.nc* and *file_b.nc* must have the same grid spacings and registration, and must have one
edge in common. If in doubt, check with :doc:`grdinfo` and use :doc:`grdcut`
and/or :doc:`grdsample` if necessary to prepare the edge joint. **Note**: For
geographical grids, you may have to use **-f** to handle periodic longitudes
unless the input grids are properly recognized as such via their meta-data.
For stitching multiple grids, see :doc:`grdblend` instead.

Required Arguments
------------------

*file_a.nc*
    One of two files to be pasted together.
*file_b.nc*
    The other of two files to be pasted together.

.. _-G:

**-G**\ *outfile.nc*
    The name for the combined output. (See :ref:`Grid File Formats <grd_inout_full>`).

Optional Arguments
------------------

.. _-S:

**-S**
    Just prints a code number and a description of the sides at which the grids are pasted.
	No pasting actually happens. -G is ignored. This option is useful for externals that want to
    reimplement the grdpaste utility since it doesn't work form them (*e.g.* Julia and GMTMEX).

.. |Add_-V| replace:: |Add_-V_links|
.. include:: explain_-V.rst_
    :start-after: **Syntax**
    :end-before: **Description**

.. |Add_-f| unicode:: 0x20 .. just an invisible code
.. include:: explain_-f.rst_

.. include:: explain_help.rst_

Examples
--------

.. include:: explain_example.rst_

Suppose file_a.nc is 150E - 180E and 0 - 30N, and file_b.nc is 150E -
180E, -30S - 0, then you can make outfile.nc which will be 150 - 180 and
-30S - 30N by:

::

  gmt grdpaste file_a.nc file_b.nc -Goutfile.nc -V -fg

See Also
--------

:doc:`gmt`, :doc:`grdblend`,
:doc:`grdclip`,
:doc:`grdcut`,
:doc:`grdinfo`,
:doc:`grdsample`
