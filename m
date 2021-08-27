Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 630093F945E
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Aug 2021 08:24:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD66516D6;
	Fri, 27 Aug 2021 08:23:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD66516D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630045472;
	bh=NRLilQBX6upR7K9xd0F+U7yhfyJVIDa1sBPbqFPBU4o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ENH309qP/O4bTlJlsSMJOIm1S4+v9MtW+KnTSayI39hIuMpc7ouywoWn4LYid433o
	 QLvbvSyVgbOzNaSCDmnsDgNshMzvFkpyjVCHy3L55VBNFOlw9gfnw1aXUlOuirMM6f
	 WQOH/hwDoUo6pFmKEvq9944E11+fFm8b4HWwFg3w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A55DF80054;
	Fri, 27 Aug 2021 08:23:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9C27F80129; Fri, 27 Aug 2021 08:23:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60255F800EE
 for <alsa-devel@alsa-project.org>; Fri, 27 Aug 2021 08:23:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60255F800EE
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 55FD1200FE7;
 Fri, 27 Aug 2021 08:23:04 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id DBF18200E4B;
 Fri, 27 Aug 2021 08:23:03 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 6E4D8183AC8B;
 Fri, 27 Aug 2021 14:23:02 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: fsl_rpmsg: add soc specific data structure
Date: Fri, 27 Aug 2021 14:00:38 +0800
Message-Id: <1630044038-19036-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
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

Each platform has different supported rates and
formats, so add soc specific data for each platform.
This soc specific data is attached with compatible string.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
---
changes in v2:
- remove checking rpmsg->soc_data is NULL
- add Reviewed-by Fabio

 sound/soc/fsl/fsl_rpmsg.c | 46 +++++++++++++++++++++++++++++++++++----
 sound/soc/fsl/fsl_rpmsg.h | 12 ++++++++++
 2 files changed, 54 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c
index d60f4dac6c1b..07abad7fe372 100644
--- a/sound/soc/fsl/fsl_rpmsg.c
+++ b/sound/soc/fsl/fsl_rpmsg.c
@@ -138,11 +138,42 @@ static const struct snd_soc_component_driver fsl_component = {
 	.name           = "fsl-rpmsg",
 };
 
+static const struct fsl_rpmsg_soc_data imx7ulp_data = {
+	.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+		 SNDRV_PCM_RATE_48000,
+	.formats = SNDRV_PCM_FMTBIT_S16_LE,
+};
+
+static const struct fsl_rpmsg_soc_data imx8mm_data = {
+	.rates = SNDRV_PCM_RATE_KNOT,
+	.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |
+		   SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_DSD_U8 |
+		   SNDRV_PCM_FMTBIT_DSD_U16_LE | SNDRV_PCM_FMTBIT_DSD_U32_LE,
+};
+
+static const struct fsl_rpmsg_soc_data imx8mn_data = {
+	.rates = SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |
+		 SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_88200 |
+		 SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_176400 |
+		 SNDRV_PCM_RATE_192000,
+	.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |
+		   SNDRV_PCM_FMTBIT_S32_LE,
+};
+
+static const struct fsl_rpmsg_soc_data imx8mp_data = {
+	.rates = SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |
+		 SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_88200 |
+		 SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_176400 |
+		 SNDRV_PCM_RATE_192000,
+	.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |
+		   SNDRV_PCM_FMTBIT_S32_LE,
+};
+
 static const struct of_device_id fsl_rpmsg_ids[] = {
-	{ .compatible = "fsl,imx7ulp-rpmsg-audio"},
-	{ .compatible = "fsl,imx8mm-rpmsg-audio"},
-	{ .compatible = "fsl,imx8mn-rpmsg-audio"},
-	{ .compatible = "fsl,imx8mp-rpmsg-audio"},
+	{ .compatible = "fsl,imx7ulp-rpmsg-audio", .data = &imx7ulp_data},
+	{ .compatible = "fsl,imx8mm-rpmsg-audio", .data = &imx8mm_data},
+	{ .compatible = "fsl,imx8mn-rpmsg-audio", .data = &imx8mn_data},
+	{ .compatible = "fsl,imx8mp-rpmsg-audio", .data = &imx8mp_data},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_rpmsg_ids);
@@ -157,6 +188,13 @@ static int fsl_rpmsg_probe(struct platform_device *pdev)
 	if (!rpmsg)
 		return -ENOMEM;
 
+	rpmsg->soc_data = of_device_get_match_data(&pdev->dev);
+
+	fsl_rpmsg_dai.playback.rates = rpmsg->soc_data->rates;
+	fsl_rpmsg_dai.capture.rates = rpmsg->soc_data->rates;
+	fsl_rpmsg_dai.playback.formats = rpmsg->soc_data->formats;
+	fsl_rpmsg_dai.capture.formats = rpmsg->soc_data->formats;
+
 	if (of_property_read_bool(np, "fsl,enable-lpa")) {
 		rpmsg->enable_lpa = 1;
 		rpmsg->buffer_size = LPA_LARGE_BUFFER_SIZE;
diff --git a/sound/soc/fsl/fsl_rpmsg.h b/sound/soc/fsl/fsl_rpmsg.h
index 4f5b49eb18d8..b04086fbf828 100644
--- a/sound/soc/fsl/fsl_rpmsg.h
+++ b/sound/soc/fsl/fsl_rpmsg.h
@@ -6,6 +6,16 @@
 #ifndef __FSL_RPMSG_H
 #define __FSL_RPMSG_H
 
+/*
+ * struct fsl_rpmsg_soc_data
+ * @rates: supported rates
+ * @formats: supported formats
+ */
+struct fsl_rpmsg_soc_data {
+	int rates;
+	u64 formats;
+};
+
 /*
  * struct fsl_rpmsg - rpmsg private data
  *
@@ -15,6 +25,7 @@
  * @pll8k: parent clock for multiple of 8kHz frequency
  * @pll11k: parent clock for multiple of 11kHz frequency
  * @card_pdev: Platform_device pointer to register a sound card
+ * @soc_data: soc specific data
  * @mclk_streams: Active streams that are using baudclk
  * @force_lpa: force enable low power audio routine if condition satisfy
  * @enable_lpa: enable low power audio routine according to dts setting
@@ -27,6 +38,7 @@ struct fsl_rpmsg {
 	struct clk *pll8k;
 	struct clk *pll11k;
 	struct platform_device *card_pdev;
+	const struct fsl_rpmsg_soc_data *soc_data;
 	unsigned int mclk_streams;
 	int force_lpa;
 	int enable_lpa;
-- 
2.17.1

