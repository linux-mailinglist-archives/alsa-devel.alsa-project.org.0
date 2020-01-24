Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E88148EA7
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jan 2020 20:22:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6274D168B;
	Fri, 24 Jan 2020 20:21:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6274D168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579893724;
	bh=o1M1xBXM99hy0KfJr0QvV8kIRV6vbFjxdGWqL94DKmQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W2K7VxSQZzk++nvLfb+f9JfDS7DX+fRM9qRfZ3OpGExGp+qSsAc2p0jtosDabVPEK
	 hay5YzNwllXonlRrL3Eyn5pp3kauhr6NJiL7cwA+1AbDKLuuX15sRgRz7xHiUeH+QM
	 /ND/9Q/B3ykBsLCsee4AsyootIwQM4V3gZx1QfGY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41E87F80328;
	Fri, 24 Jan 2020 20:12:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E608F802A9; Fri, 24 Jan 2020 20:12:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE203F800F5
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 20:12:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE203F800F5
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jan 2020 11:04:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,358,1574150400"; d="scan'208";a="260337240"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga002.fm.intel.com with ESMTP; 24 Jan 2020 11:04:39 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 24 Jan 2020 20:04:12 +0100
Message-Id: <20200124190413.18154-12-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200124190413.18154-1-cezary.rojewski@intel.com>
References: <20200124190413.18154-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 11/12] ASoC: SOF: Intel: Add Probe compress CPU
	DAIs
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
index 9eb86311a34c..f107a5134028 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -354,7 +354,13 @@
 
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
index c3b1d2f7672f..701882edc62f 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -764,6 +764,15 @@ static void sof_pcm_remove(struct snd_soc_component *component)
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
@@ -783,7 +792,7 @@ void snd_sof_new_platform_drv(struct snd_sof_dev *sdev)
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
