Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D57B28464C
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Oct 2020 08:51:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC69A176E;
	Tue,  6 Oct 2020 08:50:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC69A176E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601967097;
	bh=eIHiGn8ClsQW4HMCXu8UVvddPLZE0ZDua9qCIPfKidI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nCaM/v+DQILC3aNFh4kZF4LnPE760h7RdN3l9EgtPO88sPUuJSGnfR3am54ceLCxj
	 UUHEHdeSYJq0xi9WmVfR58H6s0Y9LQS60uFjxHV+BZXRPvqnWsiQewe7g6hrSOFyJ5
	 Q9sP7C4IK9JV3sCDLYPsEX8nZvnTMbDF0miUCXD0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85871F80253;
	Tue,  6 Oct 2020 08:49:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF627F80246; Tue,  6 Oct 2020 08:49:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C434F8015B
 for <alsa-devel@alsa-project.org>; Tue,  6 Oct 2020 08:49:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C434F8015B
IronPort-SDR: 2v4nClu72WZZ5pcVsMXAwZQwEYNeqI38cjUUGAk6NaeOqfds/FtXcu3OSdWn/VeXIru/Sz+pVx
 gOhfXhiyE+Kg==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="164458087"
X-IronPort-AV: E=Sophos;i="5.77,342,1596524400"; d="scan'208";a="164458087"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2020 23:49:45 -0700
IronPort-SDR: SHmMxtHZ903eKnU3I2ve0iDJqo3AnHBynfXZ1lwZNSzKq3TNb8kP2AeCASmJ+5DgBAIvh8Jiw5
 uKdZQz+0ve1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,342,1596524400"; d="scan'208";a="315491030"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 05 Oct 2020 23:49:40 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 00/13] ASoC: Intel: Remove obsolete solutions and components
Date: Tue,  6 Oct 2020 08:48:54 +0200
Message-Id: <20201006064907.16277-1-cezary.rojewski@intel.com>
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


Changes in v2:
- just a rebase so patch 04/13 applies cleanly
- left the tags as no actual changes done in between


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

