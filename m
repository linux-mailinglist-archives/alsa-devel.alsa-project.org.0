Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 038C32C78E0
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Nov 2020 12:44:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76352181F;
	Sun, 29 Nov 2020 12:44:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76352181F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606650294;
	bh=1l/uWuBDDcthJrss/8baVoZx9uZI+zhVgFPesya9QJ4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JXJubpKc6IthNPhlZWNwbnknR/HGnKO4BWs5X7I85CXGMRVFOg0FHkObTy8Sjxntf
	 hYDnZiHFY8v2F8Mh/9uOB6PvRe4BirupwCKEMly/FTX8Fk4DnfVmEAsqm7nx4+wYum
	 j1+0wNxLZ/Q/uf5YkWhrUcTRXDnK8PI9S2FUWgMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9C9EF802BE;
	Sun, 29 Nov 2020 12:43:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58A60F80277; Sun, 29 Nov 2020 12:43:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=PRX_BODYSUB_1,
 RCVD_IN_MSPIKE_H4, RCVD_IN_MSPIKE_WL, SPF_HELO_PASS,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EB78F8007E
 for <alsa-devel@alsa-project.org>; Sun, 29 Nov 2020 12:43:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EB78F8007E
IronPort-SDR: qSCYoLGHVhd4WwrMARfrSaNX10ME03McLaiEC41oJpkDycG3f9e0g3ddK0qCwABiKgC/XiUfJm
 8yrr5a3pLcUA==
X-IronPort-AV: E=McAfee;i="6000,8403,9819"; a="151779967"
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; d="scan'208";a="151779967"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2020 03:43:03 -0800
IronPort-SDR: Qawjd+88XOYqtTuNMLZWEm7RyUEyTqRN6yUAYibYEj99MFt03UzyyPEBblOZx9Z7JtRdn+riqY
 BOF/w1uTvs5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; d="scan'208";a="480261576"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga004.jf.intel.com with ESMTP; 29 Nov 2020 03:43:01 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] ASoC: Intel: Skylake: Fix HDAudio and DMIC for v5.4
Date: Sun, 29 Nov 2020 12:41:40 +0100
Message-Id: <20201129114148.13772-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 tiwai@suse.com, broonie@kernel.org, mateusz.gorski@linux.intel.com
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

First six of the backport address numerous problems troubling HDAudio
configuration users for Skylake driver. Upstream series:
"ASoC: Intel: Skylake: Fix HDaudio and Dmic" [1] provides the
explanation and reasoning behind it. These have been initialy pushed
into v5.7-rc1 via: "sound updates for 5.7-rc1" [2] by Takashi.

Last two patches are from: "Add support for different DMIC
configurations" [3] which focuses on HDAudio with DMIC configuration.
Patch: "ASoC: Intel: Skylake: Add alternative topology binary name"
of the mentioned series has already been merged to v5.4.y -stable and
thus it's not included here.

Fixes target mainly Skylake and Kabylake based platforms, released
in 2015-2016 period.

[1]: https://lore.kernel.org/alsa-devel/20200305145314.32579-1-cezary.rojewski@intel.com/
[2]: https://lore.kernel.org/lkml/s5htv22uso8.wl-tiwai@suse.de/
[3]: https://lore.kernel.org/alsa-devel/20200427132727.24942-1-mateusz.gorski@linux.intel.com/

Cezary Rojewski (6):
  ASoC: Intel: Skylake: Remove superfluous chip initialization
  ASoC: Intel: Skylake: Select hda configuration permissively
  ASoC: Intel: Skylake: Enable codec wakeup during chip init
  ASoC: Intel: Skylake: Shield against no-NHLT configurations
  ASoC: Intel: Allow for ROM init retry on CNL platforms
  ASoC: Intel: Skylake: Await purge request ack on CNL

Mateusz Gorski (2):
  ASoC: Intel: Multiple I/O PCM format support for pipe
  ASoC: Intel: Skylake: Automatic DMIC format configuration according to
    information from NHLT

 include/uapi/sound/skl-tplg-interface.h |   2 +
 sound/soc/intel/skylake/bxt-sst.c       |   3 -
 sound/soc/intel/skylake/cnl-sst.c       |  35 ++++--
 sound/soc/intel/skylake/skl-nhlt.c      |   3 +-
 sound/soc/intel/skylake/skl-sst-dsp.h   |   2 +
 sound/soc/intel/skylake/skl-topology.c  | 159 +++++++++++++++++++++++-
 sound/soc/intel/skylake/skl-topology.h  |   1 +
 sound/soc/intel/skylake/skl.c           |  29 ++---
 8 files changed, 204 insertions(+), 30 deletions(-)

-- 
2.17.1

