Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2316033F109
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Mar 2021 14:20:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3F1B18BA;
	Wed, 17 Mar 2021 14:19:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3F1B18BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615987232;
	bh=fLvToFk8Y7D3IGikkAjP32DL4ZlEE34On7bxjLpwk04=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oIqVx9Sb+7G3UiZzh46N18x8mojLZr2JU/btUBeWWq3JQeZqJtr66VSNO8RMng3sQ
	 17sCwAgXrlfyoLPhkMC++v3PG3nQb3c6ny4bKa6EecNqFnOkexkPt6/VXc6e9O199G
	 XCU/g3XJ3o77yx858NbyBN54hgI4INFiFGCqu8I4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEA3FF8023C;
	Wed, 17 Mar 2021 14:19:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52018F8023C; Wed, 17 Mar 2021 14:18:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A82BF8013F
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 14:18:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A82BF8013F
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D8C1E1A06D7;
 Wed, 17 Mar 2021 14:18:43 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 40C771A06F2;
 Wed, 17 Mar 2021 14:18:37 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id AC28D4029D;
 Wed, 17 Mar 2021 14:18:28 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] ASoC: fsl-asoc-card: Add support for WM8958 codec
Date: Wed, 17 Mar 2021 21:05:02 +0800
Message-Id: <1615986303-27959-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
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

WM8958 codec is used on some i.MX based platform.
So add it support in this generic driver.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/Kconfig         |  2 ++
 sound/soc/fsl/fsl-asoc-card.c | 17 +++++++++++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index c71c6024320b..0917d65d6921 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -310,6 +310,8 @@ config SND_SOC_FSL_ASOC_CARD
 	select SND_SOC_FSL_ESAI
 	select SND_SOC_FSL_SAI
 	select SND_SOC_FSL_SSI
+	select SND_SOC_WM8994
+	select MFD_WM8994
 	help
 	 ALSA SoC Audio support with ASRC feature for Freescale SoCs that have
 	 ESAI/SAI/SSI and connect with external CODECs such as WM8962, CS42888,
diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index f62f81ceab0d..c62bfd1c3ac7 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -25,6 +25,7 @@
 #include "../codecs/sgtl5000.h"
 #include "../codecs/wm8962.h"
 #include "../codecs/wm8960.h"
+#include "../codecs/wm8994.h"
 
 #define CS427x_SYSCLK_MCLK 0
 
@@ -37,12 +38,14 @@
 /**
  * struct codec_priv - CODEC private data
  * @mclk_freq: Clock rate of MCLK
+ * @free_freq: Clock rate of MCLK for hw_free()
  * @mclk_id: MCLK (or main clock) id for set_sysclk()
  * @fll_id: FLL (or secordary clock) id for set_sysclk()
  * @pll_id: PLL id for set_pll()
  */
 struct codec_priv {
 	unsigned long mclk_freq;
+	unsigned long free_freq;
 	u32 mclk_id;
 	u32 fll_id;
 	u32 pll_id;
@@ -235,10 +238,10 @@ static int fsl_asoc_card_hw_free(struct snd_pcm_substream *substream)
 	priv->streams &= ~BIT(substream->stream);
 
 	if (!priv->streams && codec_priv->pll_id && codec_priv->fll_id) {
-		/* Force freq to be 0 to avoid error message in codec */
+		/* Force freq to be free_freq to avoid error message in codec */
 		ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(rtd, 0),
 					     codec_priv->mclk_id,
-					     0,
+					     codec_priv->free_freq,
 					     SND_SOC_CLOCK_IN);
 		if (ret) {
 			dev_err(dev, "failed to switch away from FLL: %d\n", ret);
@@ -665,6 +668,15 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBS_CFS;
 		priv->card.dapm_routes = audio_map_rx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_rx);
+	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8958")) {
+		codec_dai_name = "wm8994-aif1";
+		priv->dai_fmt |= SND_SOC_DAIFMT_CBM_CFM;
+		priv->codec_priv.mclk_id = WM8994_FLL_SRC_MCLK1;
+		priv->codec_priv.fll_id = WM8994_SYSCLK_FLL1;
+		priv->codec_priv.pll_id = WM8994_FLL1;
+		priv->codec_priv.free_freq = priv->codec_priv.mclk_freq;
+		priv->card.dapm_routes = NULL;
+		priv->card.num_dapm_routes = 0;
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret = -EINVAL;
@@ -882,6 +894,7 @@ static const struct of_device_id fsl_asoc_card_dt_ids[] = {
 	{ .compatible = "fsl,imx-audio-mqs", },
 	{ .compatible = "fsl,imx-audio-wm8524", },
 	{ .compatible = "fsl,imx-audio-si476x", },
+	{ .compatible = "fsl,imx-audio-wm8958", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_asoc_card_dt_ids);
-- 
2.27.0

