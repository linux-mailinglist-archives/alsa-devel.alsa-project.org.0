Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 562C174F1F
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 15:21:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6DA21DF8;
	Thu, 25 Jul 2019 15:20:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6DA21DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564060906;
	bh=jlCB3E//GHL9PXm25WZ5bMU11dcDAt6y3GALxTtltYE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=MOleSKhLxTS06hpI1bMAnBNtAISMqIky1YsesELCG0Csju77HQHDf0sC8rYQ2c5v+
	 lhNROY0cUl4q5RDjl6SAXXDneKRKYM/mT67vjTq8n2Yrwy93CG9ATwuzIk1NrFD6w8
	 1ePQ+G1UfpU70BBuAxavJTCSU9VVnZUNXG6RjuPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CA65F80482;
	Thu, 25 Jul 2019 15:19:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2D28F80448; Thu, 25 Jul 2019 15:19:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B77EF80448
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 15:19:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B77EF80448
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="MoCYNciF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=nSL5yACaQZNEdL81xCYxexoXfF8JSC6AgEDxXHTkkGg=; b=MoCYNciFhkj8
 72TCbs5eTPulV1/YMH84JPw0lS6W4/j3LgZp4ZbzfYwdv+uv/RGYOEx3lV5SlFchcjTjxUz8kv36M
 Dchik2eP4o1KJVmXSW0XRuBKf059IlZYh5dBS84+9+TONHgU0/+6+VDFYOGKh7EintkIFlDwPiTgg
 X7K5Q=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hqdeY-0002rS-LU; Thu, 25 Jul 2019 13:19:26 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 124B72742B60; Thu, 25 Jul 2019 14:19:26 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
In-Reply-To: <20190725083432.7419-1-peter.ujfalusi@ti.com>
X-Patchwork-Hint: ignore
Message-Id: <20190725131926.124B72742B60@ypsilon.sirena.org.uk>
Date: Thu, 25 Jul 2019 14:19:26 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 lgirdwood@gmail.com, jsarha@ti.com, misael.lopez@ti.com
Subject: [alsa-devel] Applied "ASoC: ti: davinci-mcasp: Improve serializer
	handling in multi AXR setups" to the asoc tree
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

The patch

   ASoC: ti: davinci-mcasp: Improve serializer handling in multi AXR setups

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From b7989e271e9f7fd4edb4166cd2a79b980c4b6136 Mon Sep 17 00:00:00 2001
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Thu, 25 Jul 2019 11:34:32 +0300
Subject: [PATCH] ASoC: ti: davinci-mcasp: Improve serializer handling in multi
 AXR setups

When multiple serializers are used we need to track the number of
serializers used by the other stream direction to avoid killing data lines
when the first stream used more serializers than the second would need.
We are still protected against the case when the second stream uses more
serializers which had affected the running stream as well.

To take advantage of the improved serializer logic we need to modify the
channel constraints rule as well to allow the use of multiple serializers
for the second stream as additional ones will not affect the FS/BCLK on
the bus.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Link: https://lore.kernel.org/r/20190725083432.7419-1-peter.ujfalusi@ti.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/ti/davinci-mcasp.c | 92 +++++++++++++++++++++---------------
 1 file changed, 53 insertions(+), 39 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 09ba3d3c70a0..c3a2c53fdb3a 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -109,6 +109,7 @@ struct davinci_mcasp {
 
 	/* Used for comstraint setting on the second stream */
 	u32	channels;
+	u8	active_serializers[2];
 
 #ifdef CONFIG_GPIOLIB
 	struct gpio_chip gpio_chip;
@@ -813,6 +814,7 @@ static int mcasp_common_hw_param(struct davinci_mcasp *mcasp, int stream,
 	u8 rx_ser = 0;
 	u8 slots = mcasp->tdm_slots;
 	u8 max_active_serializers = (channels + slots - 1) / slots;
+	u8 max_rx_serializers, max_tx_serializers;
 	int active_serializers, numevt;
 	u32 reg;
 	/* Default configuration */
@@ -822,22 +824,28 @@ static int mcasp_common_hw_param(struct davinci_mcasp *mcasp, int stream,
 	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		mcasp_set_reg(mcasp, DAVINCI_MCASP_TXSTAT_REG, 0xFFFFFFFF);
 		mcasp_clr_bits(mcasp, DAVINCI_MCASP_XEVTCTL_REG, TXDATADMADIS);
+		max_tx_serializers = max_active_serializers;
+		max_rx_serializers =
+			mcasp->active_serializers[SNDRV_PCM_STREAM_CAPTURE];
 	} else {
 		mcasp_set_reg(mcasp, DAVINCI_MCASP_RXSTAT_REG, 0xFFFFFFFF);
 		mcasp_clr_bits(mcasp, DAVINCI_MCASP_REVTCTL_REG, RXDATADMADIS);
+		max_tx_serializers =
+			mcasp->active_serializers[SNDRV_PCM_STREAM_PLAYBACK];
+		max_rx_serializers = max_active_serializers;
 	}
 
 	for (i = 0; i < mcasp->num_serializer; i++) {
 		mcasp_set_bits(mcasp, DAVINCI_MCASP_XRSRCTL_REG(i),
 			       mcasp->serial_dir[i]);
 		if (mcasp->serial_dir[i] == TX_MODE &&
-					tx_ser < max_active_serializers) {
+					tx_ser < max_tx_serializers) {
 			mcasp_mod_bits(mcasp, DAVINCI_MCASP_XRSRCTL_REG(i),
 				       mcasp->dismod, DISMOD_MASK);
 			set_bit(PIN_BIT_AXR(i), &mcasp->pdir);
 			tx_ser++;
 		} else if (mcasp->serial_dir[i] == RX_MODE &&
-					rx_ser < max_active_serializers) {
+					rx_ser < max_rx_serializers) {
 			clear_bit(PIN_BIT_AXR(i), &mcasp->pdir);
 			rx_ser++;
 		} else {
@@ -884,7 +892,8 @@ static int mcasp_common_hw_param(struct davinci_mcasp *mcasp, int stream,
 		} else {
 			dma_data->maxburst = 0;
 		}
-		return 0;
+
+		goto out;
 	}
 
 	if (period_words % active_serializers) {
@@ -914,6 +923,9 @@ static int mcasp_common_hw_param(struct davinci_mcasp *mcasp, int stream,
 		numevt = 0;
 	dma_data->maxburst = numevt;
 
+out:
+	mcasp->active_serializers[stream] = active_serializers;
+
 	return 0;
 }
 
@@ -1153,6 +1165,37 @@ static int davinci_mcasp_hw_params(struct snd_pcm_substream *substream,
 	int period_size = params_period_size(params);
 	int ret;
 
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_U8:
+	case SNDRV_PCM_FORMAT_S8:
+		word_length = 8;
+		break;
+
+	case SNDRV_PCM_FORMAT_U16_LE:
+	case SNDRV_PCM_FORMAT_S16_LE:
+		word_length = 16;
+		break;
+
+	case SNDRV_PCM_FORMAT_U24_3LE:
+	case SNDRV_PCM_FORMAT_S24_3LE:
+		word_length = 24;
+		break;
+
+	case SNDRV_PCM_FORMAT_U24_LE:
+	case SNDRV_PCM_FORMAT_S24_LE:
+		word_length = 24;
+		break;
+
+	case SNDRV_PCM_FORMAT_U32_LE:
+	case SNDRV_PCM_FORMAT_S32_LE:
+		word_length = 32;
+		break;
+
+	default:
+		printk(KERN_WARNING "davinci-mcasp: unsupported PCM format");
+		return -EINVAL;
+	}
+
 	ret = davinci_mcasp_set_dai_fmt(cpu_dai, mcasp->dai_fmt);
 	if (ret)
 		return ret;
@@ -1187,37 +1230,6 @@ static int davinci_mcasp_hw_params(struct snd_pcm_substream *substream,
 	if (ret)
 		return ret;
 
-	switch (params_format(params)) {
-	case SNDRV_PCM_FORMAT_U8:
-	case SNDRV_PCM_FORMAT_S8:
-		word_length = 8;
-		break;
-
-	case SNDRV_PCM_FORMAT_U16_LE:
-	case SNDRV_PCM_FORMAT_S16_LE:
-		word_length = 16;
-		break;
-
-	case SNDRV_PCM_FORMAT_U24_3LE:
-	case SNDRV_PCM_FORMAT_S24_3LE:
-		word_length = 24;
-		break;
-
-	case SNDRV_PCM_FORMAT_U24_LE:
-	case SNDRV_PCM_FORMAT_S24_LE:
-		word_length = 24;
-		break;
-
-	case SNDRV_PCM_FORMAT_U32_LE:
-	case SNDRV_PCM_FORMAT_S32_LE:
-		word_length = 32;
-		break;
-
-	default:
-		printk(KERN_WARNING "davinci-mcasp: unsupported PCM format");
-		return -EINVAL;
-	}
-
 	davinci_config_channel_size(mcasp, word_length);
 
 	if (mcasp->op_mode == DAVINCI_MCASP_IIS_MODE)
@@ -1404,12 +1416,13 @@ static int davinci_mcasp_startup(struct snd_pcm_substream *substream,
 	max_channels *= tdm_slots;
 	/*
 	 * If the already active stream has less channels than the calculated
-	 * limnit based on the seirializers * tdm_slots, we need to use that as
-	 * a constraint for the second stream.
-	 * Otherwise (first stream or less allowed channels) we use the
-	 * calculated constraint.
+	 * limit based on the seirializers * tdm_slots, and only one serializer
+	 * is in use we need to use that as a constraint for the second stream.
+	 * Otherwise (first stream or less allowed channels or more than one
+	 * serializer in use) we use the calculated constraint.
 	 */
-	if (mcasp->channels && mcasp->channels < max_channels)
+	if (mcasp->channels && mcasp->channels < max_channels &&
+	    ruledata->serializers == 1)
 		max_channels = mcasp->channels;
 	/*
 	 * But we can always allow channels upto the amount of
@@ -1470,6 +1483,7 @@ static void davinci_mcasp_shutdown(struct snd_pcm_substream *substream,
 	struct davinci_mcasp *mcasp = snd_soc_dai_get_drvdata(cpu_dai);
 
 	mcasp->substreams[substream->stream] = NULL;
+	mcasp->active_serializers[substream->stream] = 0;
 
 	if (mcasp->op_mode == DAVINCI_MCASP_DIT_MODE)
 		return;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
