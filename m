Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3D7170EB9
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Feb 2020 03:50:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1860B169A;
	Thu, 27 Feb 2020 03:49:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1860B169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582771835;
	bh=qF0ZPfq7qlffkpduY9ulBiHu5O8t2sg/MHawPNhNIF8=;
	h=From:To:Subject:Date:In-Reply-To:References:In-Reply-To:
	 References:Cc:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From;
	b=Js1K6ioJgdWf2xyPcm0cTOcrS31z0EQMsBKe7TDK3oGndMO61vJadXAdguHYtym9u
	 jzV8+8Tj7CMV+liMr7rWWAM21R47+T/ycyy4ZLgf2xCDocZ6fdkPCQavCAXjfpdYWZ
	 dMNyxbc8KvVf1SQhDup/jp46qvoOnl34pyoddqHo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3B1DF80278;
	Thu, 27 Feb 2020 03:48:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C179F80260; Thu, 27 Feb 2020 03:48:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB5C6F8013E
 for <alsa-devel@alsa-project.org>; Thu, 27 Feb 2020 03:48:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB5C6F8013E
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 86435208DC6;
 Thu, 27 Feb 2020 03:48:02 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 24979201CDF;
 Thu, 27 Feb 2020 03:47:55 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 74D0A402C4;
 Thu, 27 Feb 2020 10:47:46 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org
Subject: [PATCH v3 1/4] ASoC: fsl_asrc: Change asrc_width to asrc_format
Date: Thu, 27 Feb 2020 10:41:55 +0800
Message-Id: <ffd5ff2fd0e8ad03a97f6a640630cff767d73fa7.1582770784.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1582770784.git.shengjiu.wang@nxp.com>
References: <cover.1582770784.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1582770784.git.shengjiu.wang@nxp.com>
References: <cover.1582770784.git.shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

asrc_format is more inteligent variable, which is align
with the alsa definition snd_pcm_format_t.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc.c     | 23 +++++++++++------------
 sound/soc/fsl/fsl_asrc.h     |  4 ++--
 sound/soc/fsl/fsl_asrc_dma.c |  2 +-
 3 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 0dcebc24c312..2b6a1643573c 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -589,7 +589,6 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
 	unsigned int channels = params_channels(params);
 	unsigned int rate = params_rate(params);
 	struct asrc_config config;
-	snd_pcm_format_t format;
 	int ret;
 
 	ret = fsl_asrc_request_pair(channels, pair);
@@ -600,11 +599,6 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
 
 	pair->config = &config;
 
-	if (asrc_priv->asrc_width == 16)
-		format = SNDRV_PCM_FORMAT_S16_LE;
-	else
-		format = SNDRV_PCM_FORMAT_S24_LE;
-
 	config.pair = pair->index;
 	config.channel_num = channels;
 	config.inclk = INCLK_NONE;
@@ -612,11 +606,11 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		config.input_format   = params_format(params);
-		config.output_format  = format;
+		config.output_format  = asrc_priv->asrc_format;
 		config.input_sample_rate  = rate;
 		config.output_sample_rate = asrc_priv->asrc_rate;
 	} else {
-		config.input_format   = format;
+		config.input_format   = asrc_priv->asrc_format;
 		config.output_format  = params_format(params);
 		config.input_sample_rate  = asrc_priv->asrc_rate;
 		config.output_sample_rate = rate;
@@ -946,6 +940,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	int irq, ret, i;
 	u32 map_idx;
 	char tmp[16];
+	u32 width;
 
 	asrc_priv = devm_kzalloc(&pdev->dev, sizeof(*asrc_priv), GFP_KERNEL);
 	if (!asrc_priv)
@@ -1052,18 +1047,22 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = of_property_read_u32(np, "fsl,asrc-width",
-				   &asrc_priv->asrc_width);
+	ret = of_property_read_u32(np, "fsl,asrc-width", &width);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to get output width\n");
 		return ret;
 	}
 
-	if (asrc_priv->asrc_width != 16 && asrc_priv->asrc_width != 24) {
+	if (width != 16 && width != 24) {
 		dev_warn(&pdev->dev, "unsupported width, switching to 24bit\n");
-		asrc_priv->asrc_width = 24;
+		width = 24;
 	}
 
+	if (width == 24)
+		asrc_priv->asrc_format = SNDRV_PCM_FORMAT_S24_LE;
+	else
+		asrc_priv->asrc_format = SNDRV_PCM_FORMAT_S16_LE;
+
 	platform_set_drvdata(pdev, asrc_priv);
 	pm_runtime_enable(&pdev->dev);
 	spin_lock_init(&asrc_priv->lock);
diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
index 8a821132d9d0..4940fa0a7542 100644
--- a/sound/soc/fsl/fsl_asrc.h
+++ b/sound/soc/fsl/fsl_asrc.h
@@ -493,7 +493,7 @@ struct fsl_asrc_pair {
  * @channel_avail: non-occupied channel numbers
  * @clk_map: clock map for input/output clock
  * @asrc_rate: default sample rate for ASoC Back-Ends
- * @asrc_width: default sample width for ASoC Back-Ends
+ * @asrc_format: default sample format for ASoC Back-Ends
  * @regcache_cfg: store register value of REG_ASRCFG
  */
 struct fsl_asrc {
@@ -514,7 +514,7 @@ struct fsl_asrc {
 	unsigned char *clk_map[2];
 
 	int asrc_rate;
-	int asrc_width;
+	snd_pcm_format_t asrc_format;
 
 	u32 regcache_cfg;
 };
diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index 44e5924be870..f344360dcd24 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -230,7 +230,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 		return -EINVAL;
 	}
 
-	if (asrc_priv->asrc_width == 16)
+	if (asrc_priv->asrc_format == SNDRV_PCM_FORMAT_S16_LE)
 		buswidth = DMA_SLAVE_BUSWIDTH_2_BYTES;
 	else
 		buswidth = DMA_SLAVE_BUSWIDTH_4_BYTES;
-- 
2.21.0

