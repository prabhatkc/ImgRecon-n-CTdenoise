

LCD on LDCT acquisition
======================

The subroutines that appear in this file allow you to simulate 2D fan-beam CT scans with noise power spectrum aligned with those found in the Low-dose grand challenge (LDGC) repository. In addition to the dose levels found in the LDGC (i.e., normal and quarter doses), one can use our noise insertion method to acquire any other dose levels. Subsequently, one can denoise these scans and perform an error analysis - interms of low contrast detectability (LCD) - of the denoising method using a numerical model observer called the `CHO (Channelized Hoteling Observer) <https://github.com/DIDSR/VICTRE_MO>`_. 


First, we show that our object models and noise insertion parameters (heuristically determined) yield normal dose and quarter dose CT scans similar to those provided in the `LDGC dataset <https://wiki.cancerimagingarchive.net/pages/viewpage.action?pageId=52758026>`_. This is illustrated using 1D NPS. Finally, CHO is applied on simulated `MITA phantom <https://www.nema.org/standards/view/Computed-Tomography-Image-Quality-CTIQ-Low-Contrast-Detectability-LCD-Assessment-When-Using-Dose-Reduction-Technology>`_ scans at different dose levels to estimate contrast detectability w.r.t size and HU.

.. contents::

Downloads
---------

.. code-block:: bash

    $ cd ct-recon/digiNoise
    $ wget https://github.com/smuzd/LD-CT-simulation/blob/master/I0.mat?raw=true
    $ mv I0.mat\?raw\=true I0.mat
    $ mv I0* ./data/matfiles/ 
    $ cd ../..
    $ wget https://web.eecs.umich.edu/~fessler/irt/fessler.tgz
    $ tar -xvzf fessler.tgz
    $ mv ct-recon/error_analysis/cho_lcd/fbp2_window.m irt/fbp/
    $ mv irt ct-recon/ # move the irt package inside your ct-recon copy
    $ cd ct-recon/irt
    $ matlab

NPS validation against LDGC
---------------------------
In matlab

.. code-block:: matlab

    >> setup
    >> cd ../objmodels
    >> create_mita
    >> cd ../digiNoise
    >> demo_nps_val_on_ldgc


.. raw:: html

   <p><img src=".plots/ldgc_vs_ourSim_1d_nps.png" alt="nps fig" width="250"/></p>


CHO using LDGC parameters on simulated MITA scans
-------------------------------------------------

.. code-block:: matlab

    >> demo_mita_realizations
    >> cd ../error_analysis/cho_lcd/
    >> demo_lcd_cho_of_sim_ldgc


.. raw:: html

   <p><img src=".plots/_idx_1_auc.png" alt="nps fig" width="250"/></p>


References 
----------
1. McCollough, C., Chen, B., Holmes III, D. R., Duan, X., Yu, Z., Yu, L., Leng, S., & Fletcher, J. (2020). Low Dose CT Image and Projection Data (LDCT-and-Projection-data) (Version 4) [Data set]. The Cancer Imaging Archive. https://doi.org/10.7937/9NPB-2637

2. `MIRT <https://github.com/JeffFessler/mirt>`_.

3. Zeng, D., Huang, J., Bian, Z., Niu, S., Zhang, H., Feng, Q., Liang, Z. and Ma, J., 2015. A simple low-dose x-ray CT simulation from high-dose scan. IEEE transactions on nuclear science, 62(5), pp.2226-2233.

4. Yu, L., Shiung, M., Jondal, D. and McCollough, C.H., 2012. Development and validation of a practical lower-dose-simulation tool  for optimizing computed tomography scan protocols. Journal computer assisted tomography, 36(4), pp.477-487. 

5. `DIDSR MO <https://github.com/DIDSR/VICTRE_MO>`_.

