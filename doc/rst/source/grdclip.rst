.. index:: ! grdclip
.. include:: module_core_purpose.rst_

*******
grdclip
*******

|grdclip_purpose|

Synopsis
--------

.. include:: common_SYN_OPTs.rst_

**gmt grdclip** *ingrid* |-G|\ *outgrid*
[ |SYN_OPT-R| ]
[ |-S|\ **a**\ *high/above* ]
[ |-S|\ **b**\ *low/below* ] [ |-S|\ **i**\ *low/high/between* ] [ |-S|\ **r**\ *old/new* ]
[ |SYN_OPT-V| ]
[ |SYN_OPT--| ]

|No-spaces|

Description
-----------

**grdclip** will set values < *low* to *below* and/or values > *high* to
*above*. You can also specify one or more intervals where all values should be
set to *between*, or replace individual values.  Such operations are useful
when you want all of a continent or an ocean to fall
into one color or gray shade in image processing, when clipping of the
range of data values is required, or for reclassification of data values.
*above*, *below*, *between*, *old* and *new* can be any number or even NaN
(Not a Number). You must choose at least one of the |-S| options. Use
**-R** to only extract a subset of the *ingrid* file.

Required Arguments
------------------

.. |Add_ingrid| replace:: The input 2-D binary grid file.
.. include:: explain_grd_inout.rst_
    :start-after: ingrid-syntax-begins
    :end-before: ingrid-syntax-ends

.. _-G:

.. |Add_outgrid| replace:: Give the name of the output grid file.
.. include:: /explain_grd_inout.rst_
    :start-after: outgrid-syntax-begins
    :end-before: outgrid-syntax-ends

Optional Arguments
------------------

.. |Add_-R| replace:: Using the |-R| option will select a subsection of *ingrid* grid. If this subsection
    exceeds the boundaries of the grid, only the common region will be extracted. |Add_-R_links|
.. include:: explain_-R.rst_
    :start-after: **Syntax**
    :end-before: **Description**

.. _-S:

**-Sa**\ *high/above*
    Set all data[i] > *high* to *above*.
**-Sb**\ *low/below*
    Set all data[i] < *low* to *below*.
**-Si**\ *low/high/between*
    Set all data[i] >= *low* and <= *high* to *between*.
    Repeat the option for as many intervals as are needed.
**-Sr**\ *old/new*
    Set all data[i] == *old* to *new*.  This is mostly useful when
    your data are known to be integer values.  Repeat the option
    for as many replacements as are needed.

.. |Add_-V| replace:: |Add_-V_links|
.. include:: explain_-V.rst_
    :start-after: **Syntax**
    :end-before: **Description**

.. include:: explain_help.rst_

Examples
--------

.. include:: explain_example.rst_

To set all values > 0 to NaN and all values < 0 to 0 in the remote file AFR.nc:

::

  gmt grdclip @AFR.nc -Gnew_AFR.nc -Sa0/NaN -Sb0/0 -V

To reclassify all values in the 25-30 range to 99, those in 35-39 to 55,
exchange 17 for 11 and all values < 10 to 0 in file classes.nc, try

::

  gmt grdclip classes.nc -Gnew_classes.nc -Si25/30/99 -Si35/39/55 -Sr17/11 -Sb10/0 -V

See Also
--------

:doc:`gmt`,
:doc:`grdfill`,
:doc:`grdlandmask`,
:doc:`grdmask`, :doc:`grdmath`,
:doc:`grd2xyz`, :doc:`xyz2grd`
