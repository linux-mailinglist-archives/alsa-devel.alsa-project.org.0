Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C53D5282A18
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Oct 2020 12:04:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5289818A2;
	Sun,  4 Oct 2020 12:03:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5289818A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601805875;
	bh=2Mx47GxWBo7CuyxSrlT/YXAAojhXbpjfHsw/lG0CxM8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=r1jl1P8IHCR4Mxk1/wws7EIUcrwifasdq+kP00Wl2OexJ4LkhzGDAWZaCthrZ2BKP
	 8EbK97cYsth67v3+nvli/QM0Tk67B/9cFw3DheUVOm41dUh+uUleIzNfit5+Y8MhP2
	 Yl9OKwNQJKft2EC06ANPHGP+oE6QuNNtpGQBvARQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F47EF802DF;
	Sun,  4 Oct 2020 12:02:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2802F80292; Sun,  4 Oct 2020 12:02:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C080CF80121
 for <alsa-devel@alsa-project.org>; Sun,  4 Oct 2020 12:01:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C080CF80121
IronPort-SDR: Bvw6qtM4rsBHFuEkSRfeN01coDsZYI8AvGl2jEXJRsedJh7yfpfuJ6aaIUV+aFdp/r7amuW3Sz
 r1ACb258egAQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9763"; a="150905741"
X-IronPort-AV: E=Sophos;i="5.77,335,1596524400"; d="scan'208";a="150905741"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2020 03:01:40 -0700
IronPort-SDR: By/TojOW2bQhFaUw2Fn+mYgaE9jKGoIJZJGyPEBA9VqXsa30pEtbrxrZuaQLqet6Tmz9oV8G2Z
 1NHt4KBzM7dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,335,1596524400"; d="scan'208";a="340527820"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 04 Oct 2020 03:01:34 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/13] ASoC: Intel: Remove obsolete solutions and
Date: Sun,  4 Oct 2020 12:01:15 +0200
Message-Id: <20201004100128.5842-1-cezary.rojewski@intel.com>
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

Follow up to catpt series as mentioned in:
[PATCH v10 00/14] ASoC: Intel: Catpt - Lynx and Wildcat point
https://www.spinics.net/lists/alsa-devel/msg116440.html

As catpt is a direct replacement to sound/soc/intel/haswell, it leaves a
lot of code redudant. The second legacy solution - baytrail - is
deprecated for a long time by sound/soc/intel/atom with SOF flavor
available too.

This series addresses the redudancy and removes obsolete code. Along
with the legacy solutions, all orphaned components are removed too.

As a consequence, further cleanups are unlocked: sound/soc/intel/skylake
becomes the sole user of processing code found in
sound/soc/intel/common. Those are not part of this series.

Cezary Rojewski (13):
  ASoC: Intel: Remove haswell solution
  ASoC: Intel: Remove max98090 support for baytrail solution
  ASoC: Intel: Remove rt5640 support for baytrail solution
  ASoC: Intel: Remove baytrail solution
  ASoC: Intel: Remove SST ACPI component
  ASoC: Intel: Remove SST firmware components
  ASoC: Intel: Skylake: Unassign ram_read and read_write ops
  ASoC: Intel: Remove unused DSP operations
  ASoC: Intel: Remove unused DSP interface fields
  ASoC: Intel: Remove SST-legacy specific constants
  ASoC: Intel: Make atom components independent of sst-dsp
  ASoC: Intel: Remove sst_pdata structure
  ASoC: Intel: Remove sst_dsp_get_thread_context

 include/sound/soc-acpi-intel-match.h          |    1 -
 include/trace/events/hswadsp.h                |  385 ---
 sound/soc/intel/Kconfig                       |   26 -
 sound/soc/intel/Makefile                      |    1 -
 sound/soc/intel/atom/sst/sst.c                |    1 -
 sound/soc/intel/atom/sst/sst.h                |    7 +
 sound/soc/intel/atom/sst/sst_acpi.c           |    1 -
 sound/soc/intel/atom/sst/sst_drv_interface.c  |    3 -
 sound/soc/intel/atom/sst/sst_ipc.c            |    1 -
 sound/soc/intel/atom/sst/sst_loader.c         |    1 -
 sound/soc/intel/atom/sst/sst_pvt.c            |    1 -
 sound/soc/intel/atom/sst/sst_stream.c         |    1 -
 sound/soc/intel/baytrail/Makefile             |    5 -
 sound/soc/intel/baytrail/sst-baytrail-dsp.c   |  358 ---
 sound/soc/intel/baytrail/sst-baytrail-ipc.c   |  772 ------
 sound/soc/intel/baytrail/sst-baytrail-ipc.h   |   64 -
 sound/soc/intel/baytrail/sst-baytrail-pcm.c   |  459 ----
 sound/soc/intel/boards/Kconfig                |   25 -
 sound/soc/intel/boards/Makefile               |    4 -
 sound/soc/intel/boards/byt-max98090.c         |  182 --
 sound/soc/intel/boards/byt-rt5640.c           |  224 --
 sound/soc/intel/boards/bytcht_es8316.c        |    1 -
 sound/soc/intel/boards/bytcr_rt5640.c         |    1 -
 sound/soc/intel/common/Makefile               |    4 -
 .../intel/common/soc-acpi-intel-byt-match.c   |   15 -
 sound/soc/intel/common/sst-acpi.c             |  236 --
 sound/soc/intel/common/sst-dsp-priv.h         |  284 +--
 sound/soc/intel/common/sst-dsp.c              |  162 --
 sound/soc/intel/common/sst-dsp.h              |  222 --
 sound/soc/intel/common/sst-firmware.c         | 1273 ----------
 sound/soc/intel/common/sst-ipc.c              |   27 -
 sound/soc/intel/common/sst-ipc.h              |    3 -
 sound/soc/intel/haswell/Makefile              |    5 -
 sound/soc/intel/haswell/sst-haswell-dsp.c     |  705 ------
 sound/soc/intel/haswell/sst-haswell-ipc.c     | 2222 -----------------
 sound/soc/intel/haswell/sst-haswell-ipc.h     |  527 ----
 sound/soc/intel/haswell/sst-haswell-pcm.c     | 1369 ----------
 sound/soc/intel/skylake/bxt-sst.c             |    2 -
 sound/soc/intel/skylake/cnl-sst.c             |    4 +-
 sound/soc/intel/skylake/skl-sst-dsp.c         |    2 +-
 sound/soc/intel/skylake/skl-sst-ipc.c         |    2 +-
 sound/soc/intel/skylake/skl-sst.c             |    2 -
 42 files changed, 11 insertions(+), 9579 deletions(-)
 delete mode 100644 include/trace/events/hswadsp.h
 delete mode 100644 sound/soc/intel/baytrail/Makefile
 delete mode 100644 sound/soc/intel/baytrail/sst-baytrail-dsp.c
 delete mode 100644 sound/soc/intel/baytrail/sst-baytrail-ipc.c
 delete mode 100644 sound/soc/intel/baytrail/sst-baytrail-ipc.h
 delete mode 100644 sound/soc/intel/baytrail/sst-baytrail-pcm.c
 delete mode 100644 sound/soc/intel/boards/byt-max98090.c
 delete mode 100644 sound/soc/intel/boards/byt-rt5640.c
 delete mode 100644 sound/soc/intel/common/sst-acpi.c
 delete mode 100644 sound/soc/intel/common/sst-firmware.c
 delete mode 100644 sound/soc/intel/haswell/Makefile
 delete mode 100644 sound/soc/intel/haswell/sst-haswell-dsp.c
 delete mode 100644 sound/soc/intel/haswell/sst-haswell-ipc.c
 delete mode 100644 sound/soc/intel/haswell/sst-haswell-ipc.h
 delete mode 100644 sound/soc/intel/haswell/sst-haswell-pcm.c

-- 
2.17.1

