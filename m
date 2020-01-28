Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E226014B30B
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 11:52:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B74B1665;
	Tue, 28 Jan 2020 11:51:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B74B1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580208746;
	bh=R5FrKdVtfjdAfW0w6FYizieXf1WWh9N94m0to6j6qaQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DbNTaWKd6PKYdlZdS9XKcroqPafyOEU6n9yr8W5dWHAocdcnqmt2Ot0BoTlCuWOgz
	 b0Ympwl7OF1VtvJuiwiN+XeB8MLgCkVKUI/aYTD1W9FoHRAUs9en965oHzb5biCH4b
	 99X4YuARjYbzwAvgoJLbuW0hnl7spEZSO52IQLeo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07E72F802F7;
	Tue, 28 Jan 2020 11:44:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED4E6F802DD; Tue, 28 Jan 2020 11:44:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E905DF8028E
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 11:44:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E905DF8028E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 02:44:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,373,1574150400"; d="scan'208";a="429292938"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 28 Jan 2020 02:44:24 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 28 Jan 2020 11:43:56 +0100
Message-Id: <20200128104356.16570-12-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200128104356.16570-1-cezary.rojewski@intel.com>
References: <20200128104356.16570-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH v3 11/11] ASoC: SOF: Intel: Add Probe compress
	CPU DAIs
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Declare extraction CPU DAI as well as sof_probe_compr_ops. FE DAIs can
link against these new CPU DAI to create new compress devices.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 28 ++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.h     |  6 ++++++
 sound/soc/sof/pcm.c           | 11 ++++++++++-
 3 files changed, 44 insertions(+), 1 deletion(-)

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
index 80aaf4172e34..955775c4fcda 100644
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
index 314f3095c12f..d423fb404a3d 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -756,6 +756,15 @@ static void sof_pcm_remove(struct snd_soc_component *component)
 	snd_soc_tplg_component_remove(component, SND_SOC_TPLG_INDEX_ALL);
 }
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
+#include "compress.h"
+
+struct snd_compr_ops sof_compressed_ops = {
+	.copy		= sof_probe_compr_copy,
+};
+EXPORT_SYMBOL(sof_compressed_ops);
+#endif
+
 void snd_sof_new_platform_drv(struct snd_sof_dev *sdev)
 {
 	struct snd_soc_component_driver *pd = &sdev->plat_drv;
@@ -775,7 +784,7 @@ void snd_sof_new_platform_drv(struct snd_sof_dev *sdev)
 	pd->trigger = sof_pcm_trigger;
 	pd->pointer = sof_pcm_pointer;
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMPRESS)
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
 	pd->compr_ops = &sof_compressed_ops;
 #endif
 	pd->pcm_construct = sof_pcm_new;
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
