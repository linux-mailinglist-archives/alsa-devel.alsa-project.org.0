Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1103EAD95
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Aug 2021 01:22:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F29718F2;
	Fri, 13 Aug 2021 01:21:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F29718F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628810562;
	bh=M1g/jm66PvDVBmoxUdLnJjJbwapvx8Ns5BaN42UHFus=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GDq8BwFqq/ILC26Skqi2hmJ7qziNtJrzUaM1V40AUgh/uOqv6RgtSf5yj1oso1Zqx
	 tRiV9AeOMBdqkkZP9GCxEwpoi0oOx9fxly3KwVJTGvVyDjn47S5K5nidFO3DldhEKV
	 SQ7jWEurZTe/SWv0hws8iTWv2qNZ94HxqRaLskrE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9262F804E5;
	Fri, 13 Aug 2021 01:20:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7A37F804E5; Fri, 13 Aug 2021 01:20:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 498F4F8025D
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 01:20:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 498F4F8025D
X-IronPort-AV: E=McAfee;i="6200,9189,10074"; a="202629478"
X-IronPort-AV: E=Sophos;i="5.84,317,1620716400"; d="scan'208";a="202629478"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2021 16:20:00 -0700
X-IronPort-AV: E=Sophos;i="5.84,317,1620716400"; d="scan'208";a="507949894"
Received: from evanklei-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.77.110])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2021 16:19:59 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 4/4] ASoC: SOF: Intel: make DMI L1 selection more robust
Date: Thu, 12 Aug 2021 18:19:40 -0500
Message-Id: <20210812231940.172547-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210812231940.172547-1-pierre-louis.bossart@linux.intel.com>
References: <20210812231940.172547-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

Exposing the DMI L1 configuration as a kernel Kconfig option was in
hindsight a really bad idea. It led to several errors reported by
distributions which selected it by mistake.

The Kconfig is now replaced with a kernel parameter. Since DMI L1
entry is incompatible with pause on a capture stream, the latter is
disabled when the kernel parameter is set.

Experimental results show an increased residency in higher C states
and a significant decrease of system power consumption for "work from
home" usages such as VoIP calls.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/Kconfig   | 10 ----------
 sound/soc/sof/intel/hda-pcm.c | 17 ++++++++++++++---
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index ef8cf95b0edc..88b6176af021 100644
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
index 59220fa1def1..cc8ddef37f37 100644
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
@@ -216,6 +221,7 @@ int hda_dsp_pcm_open(struct snd_sof_dev *sdev,
 		     struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_component *scomp = sdev->component;
 	struct hdac_ext_stream *dsp_stream;
 	struct snd_sof_pcm *spcm;
@@ -228,9 +234,14 @@ int hda_dsp_pcm_open(struct snd_sof_dev *sdev,
 		return -EINVAL;
 	}
 
-	/* All playback and D0i3 compatible streams are DMI L1 capable */
-	if (IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_ALWAYS_ENABLE_DMI_L1) ||
-	    direction == SNDRV_PCM_STREAM_PLAYBACK ||
+	/*
+	 * All playback streams are DMI L1 capable, capture streams need
+	 * pause push/release to be disabled
+	 */
+	if (hda_always_enable_dmi_l1 && direction == SNDRV_PCM_STREAM_CAPTURE)
+		runtime->hw.info &= ~SNDRV_PCM_INFO_PAUSE;
+
+	if (hda_always_enable_dmi_l1 ||
 	    spcm->stream[substream->stream].d0i3_compatible)
 		flags |= SOF_HDA_STREAM_DMI_L1_COMPATIBLE;
 
-- 
2.25.1

