Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2A174939
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 10:37:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C2561AD8;
	Thu, 25 Jul 2019 10:36:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C2561AD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564043824;
	bh=8R0Llw+OsgfJq4+MZ34R1BNr92uE81xWHB7kLyJqZ7M=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BXz5VQFZtZXYVgReWdJlAJvBZVmmrgw59OI5GsKaJikJ7H2z2bUmZrEsFdN/5uu3Z
	 DWimtlh1GhOx7ziK5skhXl3767iRqrUQRq+N/dUuB95IRNkCswJ0K8gvvjOjPOfUmf
	 10fx3NBukzrMMjPBRUVANJ9tLVNa38fTOtBXYn14=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1F31F8045F;
	Thu, 25 Jul 2019 10:34:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F2F6F8048E; Thu, 25 Jul 2019 10:34:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E76BF8045F
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 10:34:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E76BF8045F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="f0RDgI/W"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6P8YZfX121585;
 Thu, 25 Jul 2019 03:34:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1564043675;
 bh=YrMbqmTkkhhJDvwi7sKzTuQ429LsrBmUiEv4WpARMK8=;
 h=From:To:CC:Subject:Date;
 b=f0RDgI/WN589zmljptu0Jn/7TIIOTxgvYbbCG51GgYd0s3RLe8p8V8UnLfeCLlQT+
 9kmVZGgz4mIgH/yZJjsBB5Mic3B+GJgm65z8PAc3oBVH6kKHDEXVN8KKcZL2ZPePlF
 jpqJjlypM+vB6B6AGopsbMelX0VLognYnuMIXkMU=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6P8YZOI073703
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 25 Jul 2019 03:34:35 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 25
 Jul 2019 03:34:35 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 25 Jul 2019 03:34:35 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6P8YXa4085621;
 Thu, 25 Jul 2019 03:34:33 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Thu, 25 Jul 2019 11:34:32 +0300
Message-ID: <20190725083432.7419-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, misael.lopez@ti.com, jsarha@ti.com
Subject: [alsa-devel] [PATCH] ASoC: ti: davinci-mcasp: Improve serializer
	handling in multi AXR setups
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

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
---
 sound/soc/ti/davinci-mcasp.c | 92 +++++++++++++++++++++---------------
 1 file changed, 53 insertions(+), 39 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 6a87455d7c42..7c2081b63a60 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -109,6 +109,7 @@ struct davinci_mcasp {
 
 	/* Used for comstraint setting on the second stream */
 	u32	channels;
+	u8	active_serializers[2];
 
 #ifdef CONFIG_GPIOLIB
 	struct gpio_chip gpio_chip;
@@ -814,6 +815,7 @@ static int mcasp_common_hw_param(struct davinci_mcasp *mcasp, int stream,
 	u8 rx_ser = 0;
 	u8 slots = mcasp->tdm_slots;
 	u8 max_active_serializers = (channels + slots - 1) / slots;
+	u8 max_rx_serializers, max_tx_serializers;
 	int active_serializers, numevt;
 	u32 reg;
 	/* Default configuration */
@@ -823,22 +825,28 @@ static int mcasp_common_hw_param(struct davinci_mcasp *mcasp, int stream,
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
@@ -885,7 +893,8 @@ static int mcasp_common_hw_param(struct davinci_mcasp *mcasp, int stream,
 		} else {
 			dma_data->maxburst = 0;
 		}
-		return 0;
+
+		goto out;
 	}
 
 	if (period_words % active_serializers) {
@@ -915,6 +924,9 @@ static int mcasp_common_hw_param(struct davinci_mcasp *mcasp, int stream,
 		numevt = 0;
 	dma_data->maxburst = numevt;
 
+out:
+	mcasp->active_serializers[stream] = active_serializers;
+
 	return 0;
 }
 
@@ -1154,6 +1166,37 @@ static int davinci_mcasp_hw_params(struct snd_pcm_substream *substream,
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
@@ -1188,37 +1231,6 @@ static int davinci_mcasp_hw_params(struct snd_pcm_substream *substream,
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
@@ -1405,12 +1417,13 @@ static int davinci_mcasp_startup(struct snd_pcm_substream *substream,
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
@@ -1471,6 +1484,7 @@ static void davinci_mcasp_shutdown(struct snd_pcm_substream *substream,
 	struct davinci_mcasp *mcasp = snd_soc_dai_get_drvdata(cpu_dai);
 
 	mcasp->substreams[substream->stream] = NULL;
+	mcasp->active_serializers[substream->stream] = 0;
 
 	if (mcasp->op_mode == DAVINCI_MCASP_DIT_MODE)
 		return;
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
