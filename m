Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8566123EBEC
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 13:08:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBA6A1663;
	Fri,  7 Aug 2020 13:08:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBA6A1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596798536;
	bh=IZmfZx/lH3R626BAtUDcYiXg16bCBUp4ULtEUPYmSss=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sbZk+hSabT+/SCLYLKus3ISkSKP4O9p5cIwncCLNk1K2qCcwLxOVDfNi6d2vpBBvx
	 c64wVUpriMXk44zZ8PdRu9Upjm/6SsvqrMQJiOe93I1vBMi3WF8FMjYxvNB5mLH3gS
	 pz6qHVXnnQ+Jg+viuDSuo2Uq3Htx7azwEFA08jdw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA3D8F80234;
	Fri,  7 Aug 2020 13:07:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 790F4F80234; Fri,  7 Aug 2020 13:07:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64F98F801F7
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 13:07:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64F98F801F7
IronPort-SDR: o4lMNgPII8UCJJOVwq6RIMzU5ttkLSHGxf/B8Y+EGH2WPeISj5DqIV8JRC/R4hRHezF0YTtPpd
 CvPgaFwB9oFg==
X-IronPort-AV: E=McAfee;i="6000,8403,9705"; a="214585444"
X-IronPort-AV: E=Sophos;i="5.75,445,1589266800"; d="scan'208";a="214585444"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2020 04:07:04 -0700
IronPort-SDR: dHZGTLFX+edN6cqXHmu0/eaBbTu+j0QM6WBSFiVeo3aJxAIGvgO6OZIgXfyBVJvE7RYVDlax8E
 DSwRn6yLVFRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,445,1589266800"; d="scan'208";a="333513924"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga007.jf.intel.com with ESMTP; 07 Aug 2020 04:07:00 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/13] ASoC: Intel: Catpt - Lynx and Wildcat point
Date: Fri,  7 Aug 2020 13:06:36 +0200
Message-Id: <20200807110649.17114-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, andriy.shevchenko@intel.com,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, marcin.barlik@intel.com,
 zwisler@google.com, lgirdwood@gmail.com, tiwai@suse.com,
 filip.proborszcz@intel.com, broonie@kernel.org, michal.wasko@intel.com,
 cujomalainey@chromium.org, ppapierkowski@habana.ai,
 vamshi.krishna.gopal@intel.com
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
on and off the internal list. Most of diff below is his contribution.
Krzysztof Hejmowski helped me setup my own Xtensa environment and
recompile LPT/WPT FW binary sources what sped up the development greatly.

This would not have been possible without help from these champions,
especially considering how quickly the catpt was written: 2 weeks
features, 3 weeks optimizations. Thank you.

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
 sound/soc/intel/catpt/core.h        |  224 +++++
 sound/soc/intel/catpt/device.c      |  389 +++++++++
 sound/soc/intel/catpt/dsp.c         |  590 +++++++++++++
 sound/soc/intel/catpt/fs.c          |   79 ++
 sound/soc/intel/catpt/ipc.c         |  298 +++++++
 sound/soc/intel/catpt/loader.c      |  837 +++++++++++++++++++
 sound/soc/intel/catpt/messages.c    |  312 +++++++
 sound/soc/intel/catpt/messages.h    |  402 +++++++++
 sound/soc/intel/catpt/pcm.c         | 1194 +++++++++++++++++++++++++++
 sound/soc/intel/catpt/registers.h   |  191 +++++
 sound/soc/intel/catpt/trace.h       |  169 ++++
 19 files changed, 4711 insertions(+), 142 deletions(-)
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

