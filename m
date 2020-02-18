Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BAB1628D0
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 15:46:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A141169B;
	Tue, 18 Feb 2020 15:45:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A141169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582037208;
	bh=YJEH8i8A7EUmJ3cUG479qQLMICxgc9tvNwL4dytleNU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aptWBzg/Tzkw5pQ4gI++qJXqCENScFyGgPztaE8FRAvRqqEhWGW/Zt2dm3unrzMWV
	 tNu8FNPTg+eqd51qn2bp+Mk4V0sp1F5IpHKxLNXiXxWN8yjJyhFu6r/0X02vo0k+VT
	 NrGN0ebjZvqoyxAZOWeG36jnb1tGuXtFWUIX1SU0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA823F802E0;
	Tue, 18 Feb 2020 15:40:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C657FF80291; Tue, 18 Feb 2020 15:40:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85543F80279
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 15:40:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85543F80279
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2020 06:40:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,456,1574150400"; d="scan'208";a="235549885"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga003.jf.intel.com with ESMTP; 18 Feb 2020 06:40:15 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v5 9/9] ASoC: SOF: Intel: Add Probe compress CPU DAIs
Date: Tue, 18 Feb 2020 15:39:24 +0100
Message-Id: <20200218143924.10565-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200218143924.10565-1-cezary.rojewski@intel.com>
References: <20200218143924.10565-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, lgirdwood@gmail.com,
 tiwai@suse.com, vkoul@kernel.org, broonie@kernel.org
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

Declare extraction CPU DAI as well as sof_probe_compr_ops. FE DAIs can
link against these new CPU DAI to create new compress devices.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---

Changes in v4:
- Relocated probe-compress related code from /sof/pcm.c directly to
  /sof/compress.c as requested by Daniel


 sound/soc/sof/compress.c      |  5 +++++
 sound/soc/sof/compress.h      |  2 ++
 sound/soc/sof/intel/hda-dai.c | 28 ++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.h     |  6 ++++++
 sound/soc/sof/pcm.c           |  7 +++++++
 5 files changed, 48 insertions(+)

diff --git a/sound/soc/sof/compress.c b/sound/soc/sof/compress.c
index e87cc81a0599..7354dc6a49cf 100644
--- a/sound/soc/sof/compress.c
+++ b/sound/soc/sof/compress.c
@@ -13,6 +13,11 @@
 #include "ops.h"
 #include "probe.h"
 
+struct snd_compr_ops sof_probe_compressed_ops = {
+	.copy		= sof_probe_compr_copy,
+};
+EXPORT_SYMBOL(sof_probe_compressed_ops);
+
 int sof_probe_compr_open(struct snd_compr_stream *cstream,
 		struct snd_soc_dai *dai)
 {
diff --git a/sound/soc/sof/compress.h b/sound/soc/sof/compress.h
index dccc9e008f81..800f163603e1 100644
--- a/sound/soc/sof/compress.h
+++ b/sound/soc/sof/compress.h
@@ -13,6 +13,8 @@
 
 #include <sound/compress_driver.h>
 
+extern struct snd_compr_ops sof_probe_compressed_ops;
+
 int sof_probe_compr_open(struct snd_compr_stream *cstream,
 		struct snd_soc_dai *dai);
 int sof_probe_compr_free(struct snd_compr_stream *cstream,
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 9c6e3f990ee3..ed5e7d2c0d43 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -399,6 +399,19 @@ static const struct snd_soc_dai_ops hda_link_dai_ops = {
 	.trigger = hda_link_pcm_trigger,
 	.prepare = hda_link_pcm_prepare,
 };
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_PROBES)
+#include "../compress.h"
+
+static struct snd_soc_cdai_ops sof_probe_compr_ops = {
+	.startup	= sof_probe_compr_open,
+	.shutdown	= sof_probe_compr_free,
+	.set_params	= sof_probe_compr_set_params,
+	.trigger	= sof_probe_compr_trigger,
+	.pointer	= sof_probe_compr_pointer,
+};
+
+#endif
 #endif
 
 /*
@@ -460,5 +473,20 @@ struct snd_soc_dai_driver skl_dai[] = {
 	.name = "Alt Analog CPU DAI",
 	.ops = &hda_link_dai_ops,
 },
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_PROBES)
+{
+	.name = "Probe Extraction CPU DAI",
+	.compress_new = snd_soc_new_compress,
+	.cops = &sof_probe_compr_ops,
+	.capture = {
+		.stream_name = "Probe Extraction",
+		.channels_min = 1,
+		.channels_max = 8,
+		.rates = SNDRV_PCM_RATE_48000,
+		.rate_min = 48000,
+		.rate_max = 48000,
+	},
+},
+#endif
 #endif
 };
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index ca44ecb76534..537c0a930a15 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -349,7 +349,13 @@
 
 /* Number of DAIs */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_PROBES)
+#define SOF_SKL_NUM_DAIS		16
+#else
 #define SOF_SKL_NUM_DAIS		15
+#endif
+
 #else
 #define SOF_SKL_NUM_DAIS		8
 #endif
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index db3df02c7398..b239bbff4b5c 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -16,6 +16,9 @@
 #include "sof-priv.h"
 #include "sof-audio.h"
 #include "ops.h"
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
+#include "compress.h"
+#endif
 
 /* Create DMA buffer page table for DSP */
 static int create_page_table(struct snd_soc_component *component,
@@ -787,6 +790,10 @@ void snd_sof_new_platform_drv(struct snd_sof_dev *sdev)
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_COMPRESS)
 	pd->compr_ops = &sof_compressed_ops;
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
+	/* override cops when probe support is enabled */
+	pd->compr_ops = &sof_probe_compressed_ops;
 #endif
 	pd->pcm_construct = sof_pcm_new;
 	pd->ignore_machine = drv_name;
-- 
2.17.1

