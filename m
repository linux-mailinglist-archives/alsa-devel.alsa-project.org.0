Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A1124194C
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 12:02:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A28B166F;
	Tue, 11 Aug 2020 12:01:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A28B166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597140161;
	bh=K+HIqEaYCrW+G6oxsM73L8Gb0B5JkB5DmzQ3pSwr6lg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jigUNab8bAaKKbH6PTHBNhDA3ltE08WN+liHpvmyX/RRYTkRMMd/kVjXeg4ilp/m3
	 BcFcQ3acRnJ5xqyB2F6s11SFDzIZ7raFYlMGpBzjhpHhf2PRqwXgERgLKE5/Glxfpk
	 TOgXf/MuquTl/ynkrmOTJaaTEshwbhL00fkvU2LQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3420F80162;
	Tue, 11 Aug 2020 12:01:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92E56F80161; Tue, 11 Aug 2020 12:00:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37AF9F80118
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 12:00:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37AF9F80118
IronPort-SDR: 6QvbCgultxfyPARxUiFgFof07ehtrKZ4xtMuxU0XCCxN23V1aExsO/E9KbZVhuE8BM2Ib7fpbI
 FgUDOdGaBhow==
X-IronPort-AV: E=McAfee;i="6000,8403,9709"; a="152924758"
X-IronPort-AV: E=Sophos;i="5.75,460,1589266800"; d="scan'208";a="152924758"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2020 03:00:49 -0700
IronPort-SDR: BjHXHFsP/vkXVjrdf/Lp1FNResR8lxc+mZMqYJ3fz9CqVXOlFC0MKqoaXwXbaxz1zXkR0agMbN
 vmXzNEPAn87A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,460,1589266800"; d="scan'208";a="494625211"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 11 Aug 2020 03:00:45 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 00/13] ASoC: Intel: Catpt - Lynx and Wildcat point
Date: Tue, 11 Aug 2020 12:00:21 +0200
Message-Id: <20200811100034.6875-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, andriy.shevchenko@intel.com,
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

Changes in v2:
- fixed SPDX formatting for all header files as well as pcm.c
- fixed size used when memcping fs.c::fw_build_read as reported by Mark
- renamed struct catpt_pdata to struct catpt_spec (cosmetic)
- fixed erroneous patch in catpt_load_block: region if properly released
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

 sound/soc/intel/Kconfig             |   22 +-
 sound/soc/intel/Makefile            |    2 +-
 sound/soc/intel/boards/Kconfig      |    8 +-
 sound/soc/intel/boards/bdw-rt5650.c |   36 -
 sound/soc/intel/boards/bdw-rt5677.c |   33 -
 sound/soc/intel/boards/broadwell.c  |   33 -
 sound/soc/intel/boards/haswell.c    |   28 +-
 sound/soc/intel/catpt/Makefile      |    6 +
 sound/soc/intel/catpt/core.h        |  187 +++++
 sound/soc/intel/catpt/device.c      |  376 +++++++++
 sound/soc/intel/catpt/dsp.c         |  596 +++++++++++++
 sound/soc/intel/catpt/fs.c          |   79 ++
 sound/soc/intel/catpt/ipc.c         |  298 +++++++
 sound/soc/intel/catpt/loader.c      |  676 +++++++++++++++
 sound/soc/intel/catpt/messages.c    |  312 +++++++
 sound/soc/intel/catpt/messages.h    |  401 +++++++++
 sound/soc/intel/catpt/pcm.c         | 1194 +++++++++++++++++++++++++++
 sound/soc/intel/catpt/registers.h   |  191 +++++
 sound/soc/intel/catpt/trace.h       |   83 ++
 19 files changed, 4419 insertions(+), 142 deletions(-)
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

