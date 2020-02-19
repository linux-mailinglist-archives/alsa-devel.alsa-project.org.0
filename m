Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBDF16387B
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 01:22:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77EDA16EC;
	Wed, 19 Feb 2020 01:21:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77EDA16EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582071755;
	bh=hLwBTsKxXffyR7SFKAARP74ux3moEFbT18oflpeAsiU=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=UJ00amBrMvgVOaZu9ap1aTrP2HzDVK7/tA8Tkp6JqHwyI4OesmuaMY3UvZb0q/DoC
	 +DYFojpZEC0NRK2xj88YsCpm2y2nxgDj6NWKUvtD7Jy4l6bUec2g8UpTKO8+X79/Im
	 LIvlyN7yGguZX/Z4EOzxa20gFWnmXDpKkl2DTUKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9585EF80348;
	Wed, 19 Feb 2020 01:10:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AE7CF80346; Wed, 19 Feb 2020 01:10:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 8D0B7F80343
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 01:10:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D0B7F80343
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1BEEFEC;
 Tue, 18 Feb 2020 16:10:34 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6579B3F68F;
 Tue, 18 Feb 2020 16:10:34 -0800 (PST)
Date: Wed, 19 Feb 2020 00:10:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Applied "ASoC: SOF: Intel: Add Probe compress CPU DAIs" to the asoc
 tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

The patch

   ASoC: SOF: Intel: Add Probe compress CPU DAIs

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 70368106467cd8c420176bf3ab0acc797f6584bf Mon Sep 17 00:00:00 2001
From: Cezary Rojewski <cezary.rojewski@intel.com>
Date: Tue, 18 Feb 2020 15:39:24 +0100
Subject: [PATCH] ASoC: SOF: Intel: Add Probe compress CPU DAIs

Declare extraction CPU DAI as well as sof_probe_compr_ops. FE DAIs can
link against these new CPU DAI to create new compress devices.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200218143924.10565-10-cezary.rojewski@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
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
2.20.1

