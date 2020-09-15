Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0AC26A9D3
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Sep 2020 18:32:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 850BE16BE;
	Tue, 15 Sep 2020 18:31:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 850BE16BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600187542;
	bh=ClW+Jat0/Tu/8vmx4Yjw/bzIhMqCVhRNvkArkYJmYv4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PBrDZj6M4jWnEYl9+jZbW8ghWKL46bcKC5Jy1WkcP2wMB+29tnQh4pVTTzrLilgkV
	 WB9eHsZ41hPdI+xeMqYnf3jyrXAQJQx146CvuX1vNbczWl4bOmVoT7575ha/RnxpDE
	 QQpbt7OFOSuUQhTXQ48R76bYQYah5qFeFAMylBH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08E8DF802D2;
	Tue, 15 Sep 2020 18:30:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA1A4F8028B; Tue, 15 Sep 2020 18:30:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D875F800F1
 for <alsa-devel@alsa-project.org>; Tue, 15 Sep 2020 18:30:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D875F800F1
IronPort-SDR: 0Qb9nKbYF9DWuLflx4unqyU5KshLig9N9yrGOE50fg+gA/V8hfA2eyps6H8Tu9dlvyNVrpqGIL
 vzgPuzCmwJEw==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="177365829"
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="177365829"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2020 09:30:23 -0700
IronPort-SDR: xdXIvUYM5C7dkioDavWQhNZnVpXhr9M5uPedFYh7i/pIX6rK2N05Tp6+bf42is7SQPap+GtSdj
 KsqetkoVuQmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="302218608"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga003.jf.intel.com with ESMTP; 15 Sep 2020 09:30:18 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v5 00/13] ASoC: Intel: Catpt - Lynx and Wildcat point
Date: Tue, 15 Sep 2020 18:29:31 +0200
Message-Id: <20200915162944.16241-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, andriy.shevchenko@linux.intel.com,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, marcin.barlik@intel.com,
 zwisler@google.com, lgirdwood@gmail.com, tiwai@suse.com,
 filip.proborszcz@intel.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, michal.wasko@intel.com,
 cujomalainey@chromium.org, krzysztof.hejmowski@intel.com,
 ppapierkowski@habana.ai, vamshi.krishna.gopal@intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Implement support for Lynxpoint and Wildcat Point AudioDSP. Catpt
solution deprecates existing sound/soc/intel/haswell which is removed in
the following series. This cover-letter is followed by 'Developer's deep
dive' message schedding light on catpt's key concepts and areas
addressed.

Due to high range of errors and desynchronization from recommendations
set by Windows solution, re-write came as a lower-cost solution compared
to refactoring /haswell/ with several series of patches.

Series is dependent on linux-spi change:
spi: pxa2xx: Add SSC2 and SSPSP2 SSP registers
https://www.spinics.net/lists/linux-spi/msg23885.html
which has been already merged and is now part of linux-spi tree.


Special thanks go to Marcin Barlik and Piotr Papierkowski for sharing
their LPT/WPT AudioDSP architecture expertise as well as helping
backtrack its historical background.
My thanks go to Amadeusz Slawinski for reviews and improvements proposed
on and off the internal list. Most of internal diff below is his
contribution.
Krzysztof Hejmowski helped me setup my own Xtensa environment and
recompile LPT/WPT FW binary sources what sped up the development greatly.

This would not have been possible without help from these champions,
especially considering how quickly the catpt was written: 2 weeks
features, 3 weeks optimizations. Thank you.

Userspace-exposed members are compatible with what is exposed by
deprecated solution as well as FW binary being re-used thus no harm is
done. The only visible differences are: the newly added 'Loopback Mute'
kcontrol and volume support extending to quad from stereo.

On top of fixing erros and design flows, catpt also adds module reload,
dynamic SRAM memory allocation during PCM runtime and exposes missing
userspace API: 'Loopback Mute' kcontrol, quad volume controls and sysfs
fw-version entries. Event tracing is provided to easy solution
debugging.

Following are not included in this update and are scheduled as later
addition:
- fw logging
- module (library) support

Note: LPT power up/down sequences might get aligned with WPT once enough
testing is done as capabilities are shared for both DSPs.
Note #2: Both LPT and WPT power up/down sequences may get optimized in
future updates as thanks to help from the Windows team, most of nuances
behind why/what/when in regard to hw registers have been backtracked and
reviewed again.

Link to developer's deep dive message:
https://www.spinics.net/lists/alsa-devel/msg113563.html


Changes in v5:
Basically everything below is result of Andy's review. Thank you Andy
for taking time into this detailed review

- catpt now makes use of common linux/pxa2xx_ssp.h header file, removing
  redundant SSP register declarations in the process. As stated in the
  opening, this is dependent upon linux-spi change:
  spi: pxa2xx: Add SSC2 and SSPSP2 SSP registers

- updated Kconfig by removing DMADEVICES and adding COMPILE_TEST
  as optional depends-on
- updated all register macros definitions to be more safe against common
  arithmetics when specifying macro's parameters
- removed CONFIG_PM and CONFIG_PM_SLEEP usage in favor of __maybe_unused
- all 'if (ret < 0)' converted to simple 'if (ret)' whenever possible
- fixed erroneous check for platform_device_register_data within
  catpt_register_board()
- _SLAVE/_MASTER replaced with more inclusive _CONSUMER/_PROVIDER for
  enum catpt_ssp_mode
- catpt_acpi_probe() is now making use of high-level wrappers for
  ioremapping and resource assignment, reducing function's code size
- due to improved catpt_acpi_probe() behavior, catpt_acpi_remove() needs
  not to cast dma_free_coherent() any longer
- DMA source and destrination maxburst now of value 16, see:
https://www.spinics.net/lists/alsa-devel/msg114394.html

- simplified catpt_dsp_update_lpclock() as list_for_each_entry() is
  empty-safe by default
- dropped '_SSP_' from all names of all CATPT_SSP_SSXXX_DEFAULT macros
- catpt_updatel_pci now makes use of linux/pci.h and uapi/linux/pci.h
  constants such as: PCI_PM_CTRL_STATE_MASK and PCI_D3hot


Changes in v4:
https://www.spinics.net/lists/alsa-devel/msg113762.html
- fixed compilation with i386 kconfig (conflicting names)
- streamlined naming for SHIM and PCI registers to match SSP ones
  (SHIM_REG -> SHIM)
- catpt_component_probe removed and kcontrols again initializzed
  statically via snd_kcontrol_new array: this is to remove
  kctl->id.device shenanigans
- renamed catpt_set_ctlvol to catpt_set_dspvol - function name wasn't
  matching its purpose


Changes in v3:
- fixed IRAM mask usage in lpt_dsp_power_up (dsp.c)
- updated dbg message formatting in catpt_restore_fwimage as suggested
  by Andy
- fixed alignment for struct catpt_ssp_device_format
- catpt_set_ctlvol now verifies all-equal scenario based on all
  channels rather than just first two as requested by Amadeo
- fixed SPDX for registers.h


Changes in v2:
https://www.spinics.net/lists/alsa-devel/msg113660.html
- fixed SPDX formatting for all header files as well as pcm.c
- fixed size provided to memcpy() in fw_build_read() as reported by Mark
- renamed struct catpt_pdata to struct catpt_spec (cosmetic)
- fixed erroneous path in catpt_load_block: region is properly released
- trace.h events for updating registers have been removed and usages
  replaced by dev_dbg (SRAMPGE/ LPCS)

- as requested by Andy, struct resource has replaced struct catpt_mbank
  and struct catpt_mregion. This change cascaded into:

  - catpt_mbank_size and catpt_mregion_size replaced by resource_size
  - catpt_mregion_intersects replaced by resource_overlaps
  - all catpt_mbank_ and catpt_mregion_ handlers found in loader.c
    (_request, _reserve, _release, _extract, _split, _join) have been
    removed
  - __request_region and __release_region have been enlisted in their
    place
  - catpt_mregion_intersecting renamed to catpt_resource_overlapping
  - catpt_request_region helper has been provided to deal with -size
    based requests
      o haven't found direct replacements in resource.c/ ioport.h for
      both functions

  - catpt_mbank_create and catpt_mbank_remove renamed to catpt_sram_init
    and catpt_sram_free respectively
  - catpt_sram_init now returns void instead of int and has been
    converted to simple initialized. This change ultimately cascaded
    into:
      o both SRAM banks initialization being moved to catpt_dev_init
        from catpt_acpi_probe (device.c)
      o catpt_dev::spec is now initialized first, with catpt_dev_init
        following it soon after
      o catpt_acpi_probe erroneous path has been simplified as SRAM
        banks no longer need to be freed

  - catpt_sram_free now frees all resources via child -> sibling
    enumeration rather than region_list iteration
  - catpt_dsp_update_srampge and catpt_dsp_set_srampge now accept new
    argument: unsigned long mask. Caused by removal of catpt_mbank -
    mask is taken directly from catpt_dev::spec::d/iram_mask
  - trace.h events for catpt_mbank and catpt_mregion have been removed


Diff against last drop on internal list:
https://www.spinics.net/lists/alsa-devel/msg113549.html
- replaced spinlock with mutex for mregion allocation and release to
  address sleeping in atomic context warnings
- fixed coredump fw_hash dumping
- kcontrol values are now always stored regardless of stream of interest
  is running or not
- kcontrol values are now applied after stream is prepared instead of
  ignoring what has been set by user initially
- catpt_pdata instances have been renamed from hsw_ and bdw_ to lpt_ and
  wpt_ respectively
- reordered Makefile .o(s) (cosmetic)

Cezary Rojewski (13):
  ASoC: Intel: Add catpt device
  ASoC: Intel: catpt: Define DSP operations
  ASoC: Intel: catpt: Firmware loading and context restore
  ASoC: Intel: catpt: Implement IPC protocol
  ASoC: Intel: catpt: Add IPC messages
  ASoC: Intel: catpt: PCM operations
  ASoC: Intel: catpt: Event tracing
  ASoC: Intel: catpt: Simple sysfs attributes
  ASoC: Intel: Select catpt and deprecate haswell
  ASoC: Intel: haswell: Remove haswell-solution specific code
  ASoC: Intel: broadwell: Remove haswell-solution specific code
  ASoC: Intel: bdw-5650: Remove haswell-solution specific code
  ASoC: Intel: bdw-5677: Remove haswell-solution specific code

 sound/soc/intel/Kconfig             |   24 +-
 sound/soc/intel/Makefile            |    2 +-
 sound/soc/intel/boards/Kconfig      |    8 +-
 sound/soc/intel/boards/bdw-rt5650.c |   36 -
 sound/soc/intel/boards/bdw-rt5677.c |   33 -
 sound/soc/intel/boards/broadwell.c  |   33 -
 sound/soc/intel/boards/haswell.c    |   28 +-
 sound/soc/intel/catpt/Makefile      |    6 +
 sound/soc/intel/catpt/core.h        |  187 +++++
 sound/soc/intel/catpt/device.c      |  354 ++++++++
 sound/soc/intel/catpt/dsp.c         |  572 +++++++++++++
 sound/soc/intel/catpt/fs.c          |   79 ++
 sound/soc/intel/catpt/ipc.c         |  298 +++++++
 sound/soc/intel/catpt/loader.c      |  673 +++++++++++++++
 sound/soc/intel/catpt/messages.c    |  313 +++++++
 sound/soc/intel/catpt/messages.h    |  401 +++++++++
 sound/soc/intel/catpt/pcm.c         | 1212 +++++++++++++++++++++++++++
 sound/soc/intel/catpt/registers.h   |  178 ++++
 sound/soc/intel/catpt/trace.h       |   83 ++
 19 files changed, 4377 insertions(+), 143 deletions(-)
 create mode 100644 sound/soc/intel/catpt/Makefile
 create mode 100644 sound/soc/intel/catpt/core.h
 create mode 100644 sound/soc/intel/catpt/device.c
 create mode 100644 sound/soc/intel/catpt/dsp.c
 create mode 100644 sound/soc/intel/catpt/fs.c
 create mode 100644 sound/soc/intel/catpt/ipc.c
 create mode 100644 sound/soc/intel/catpt/loader.c
 create mode 100644 sound/soc/intel/catpt/messages.c
 create mode 100644 sound/soc/intel/catpt/messages.h
 create mode 100644 sound/soc/intel/catpt/pcm.c
 create mode 100644 sound/soc/intel/catpt/registers.h
 create mode 100644 sound/soc/intel/catpt/trace.h

-- 
2.17.1

