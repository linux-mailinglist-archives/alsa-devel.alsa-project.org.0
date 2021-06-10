Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C243A3531
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Jun 2021 22:56:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94DB217C7;
	Thu, 10 Jun 2021 22:55:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94DB217C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623358583;
	bh=z+6s78gTdWXLUtYbUb3XuSKjqfhZROpRvsp/NrxQx1o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PzKszBEObu7yFMu0sxsV0gcuFHG5DAb8GTuCqyBdIeIEiCv+5B7twE3iBZ66iJLds
	 Mdhy0KDngECwKfs274Q0xr2GytP+eMWs72yF+gDOpWmgxAa8gOoblX0X0ZV0J+Ezog
	 x9TPuoTI9aaj3rNi1IN9/aZSa8lqJlsP2vBZVo8o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36070F804AB;
	Thu, 10 Jun 2021 22:54:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A665DF804CC; Thu, 10 Jun 2021 22:54:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27402F8020D
 for <alsa-devel@alsa-project.org>; Thu, 10 Jun 2021 22:54:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27402F8020D
IronPort-SDR: T2luj68Jh8HJ7XoHBIndMpN7lTBt3DfBPA/H3dMLDHraRI6kVOg8jbyUozOtgk+0OY5m6tZdhu
 0uBd6buFi3Dg==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="226812418"
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="226812418"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 13:53:51 -0700
IronPort-SDR: 62yT1wDb8rv3fbuuvEzFeWvgkrNR50MabqoG5bLO2pdd1WDvpqBNjDw5QZNh+aP7bHLcvVn2Jl
 SUgZDF82ZL8A==
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="620183629"
Received: from umedepal-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.170.65])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 13:53:51 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/8] ASoC: SOF: Intel: add kernel parameter to set DMI L1
 configuration
Date: Thu, 10 Jun 2021 15:53:22 -0500
Message-Id: <20210610205326.1176400-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610205326.1176400-1-pierre-louis.bossart@linux.intel.com>
References: <20210610205326.1176400-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

Exposing the DMI L1 configuration to users was in hindsight a bad
idea. It led to several errors reported by distributions which
selected it by mistake.

The Kconfig is now replaced with a kernel parameter that should only
be used by expert users for tests. In a follow-up patch, the DMI L1
configuration is enabled automatically to conform to hardware
programming sequences.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/Kconfig   | 10 ----------
 sound/soc/sof/intel/hda-pcm.c |  7 ++++++-
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index d9108b12740e..219cf0bf9633 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -249,16 +249,6 @@ config SND_SOC_SOF_HDA_PROBES
 	  Say Y if you want to enable probes.
 	  If unsure, select "N".
 
-config SND_SOC_SOF_HDA_ALWAYS_ENABLE_DMI_L1
-	bool "SOF Intel-HDA enable DMI Link L1"
-	help
-	  This option enables DMI L1 for both playback and capture
-	  and disables known workarounds for specific HDAudio platforms.
-	  Only use to look into power optimizations on platforms not
-	  affected by DMI L1 issues. This option is not recommended.
-	  Say Y if you want to enable DMI Link L1.
-	  If unsure, select "N".
-
 endif ## SND_SOC_SOF_HDA_COMMON
 
 config SND_SOC_SOF_HDA_LINK_BASELINE
diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
index 59220fa1def1..47ff2c757d0a 100644
--- a/sound/soc/sof/intel/hda-pcm.c
+++ b/sound/soc/sof/intel/hda-pcm.c
@@ -15,6 +15,7 @@
  * Hardware interface for generic Intel audio DSP HDA IP
  */
 
+#include <linux/moduleparam.h>
 #include <sound/hda_register.h>
 #include <sound/pcm_params.h>
 #include "../sof-audio.h"
@@ -27,6 +28,10 @@
 #define SDnFMT_BITS(x)	((x) << 4)
 #define SDnFMT_CHAN(x)	((x) << 0)
 
+static bool hda_always_enable_dmi_l1;
+module_param_named(always_enable_dmi_l1, hda_always_enable_dmi_l1, bool, 0444);
+MODULE_PARM_DESC(always_enable_dmi_l1, "SOF HDA always enable DMI l1");
+
 u32 hda_dsp_get_mult_div(struct snd_sof_dev *sdev, int rate)
 {
 	switch (rate) {
@@ -229,7 +234,7 @@ int hda_dsp_pcm_open(struct snd_sof_dev *sdev,
 	}
 
 	/* All playback and D0i3 compatible streams are DMI L1 capable */
-	if (IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_ALWAYS_ENABLE_DMI_L1) ||
+	if (hda_always_enable_dmi_l1 ||
 	    direction == SNDRV_PCM_STREAM_PLAYBACK ||
 	    spcm->stream[substream->stream].d0i3_compatible)
 		flags |= SOF_HDA_STREAM_DMI_L1_COMPATIBLE;
-- 
2.25.1

