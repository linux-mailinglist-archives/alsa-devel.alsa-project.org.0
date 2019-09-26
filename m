Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9669BBEA30
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2019 03:34:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15ABC1718;
	Thu, 26 Sep 2019 03:33:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15ABC1718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569461661;
	bh=6Z1B8c3kAtZA81/CXuxHVWaXJq1iqE+o1vjrpVxuUWY=;
	h=From:To:Date:In-Reply-To:References:In-Reply-To:References:
	 Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From;
	b=NWhZggVLVLhbmor5pyGXoHvQiPBoCpjvDvetX4Cfhn2/qOKrFCcfghwaON2/KIVpE
	 F98spDrTOWyp+qgHvDiQy520Bb4zgLqQ6trClMafrSY3KGmA52VFWJZhFqyfLQNsiX
	 Z8Fd/R9qgXgf76D9/YyoSH1LR0xTRqen448unPaM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F97CF805F7;
	Thu, 26 Sep 2019 03:31:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C995F8045F; Thu, 26 Sep 2019 03:31:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3BF1F80138
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 03:31:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3BF1F80138
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B7ABC1A04DF;
 Thu, 26 Sep 2019 03:31:42 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id EFAC11A0929;
 Thu, 26 Sep 2019 03:31:35 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 21E4E402DE;
 Thu, 26 Sep 2019 09:31:28 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org,
 lars@metafoo.de
Date: Thu, 26 Sep 2019 09:29:48 +0800
Message-Id: <7937c1404ee327ce141cb03b3575b02ea01a740c.1569387932.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569387932.git.shengjiu.wang@nxp.com>
References: <cover.1569387932.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1569387932.git.shengjiu.wang@nxp.com>
References: <cover.1569387932.git.shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [alsa-devel] [PATCH V5 1/4] ASoC: fsl_asrc: Use in(out)put_format
	instead of in(out)put_word_width
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

snd_pcm_format_t is more formal than enum asrc_word_width, which has
two property, width and physical width, which is more accurate than
enum asrc_word_width. So it is better to use in(out)put_format
instead of in(out)put_word_width.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 sound/soc/fsl/fsl_asrc.c | 56 +++++++++++++++++++++++++++-------------
 sound/soc/fsl/fsl_asrc.h |  4 +--
 2 files changed, 40 insertions(+), 20 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index cfa40ef6b1ca..4d3804a1ea55 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -265,6 +265,8 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
 	struct asrc_config *config = pair->config;
 	struct fsl_asrc *asrc_priv = pair->asrc_priv;
 	enum asrc_pair_index index = pair->index;
+	enum asrc_word_width input_word_width;
+	enum asrc_word_width output_word_width;
 	u32 inrate, outrate, indiv, outdiv;
 	u32 clk_index[2], div[2];
 	int in, out, channels;
@@ -283,9 +285,32 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
 		return -EINVAL;
 	}
 
-	/* Validate output width */
-	if (config->output_word_width == ASRC_WIDTH_8_BIT) {
-		pair_err("does not support 8bit width output\n");
+	switch (snd_pcm_format_width(config->input_format)) {
+	case 8:
+		input_word_width = ASRC_WIDTH_8_BIT;
+		break;
+	case 16:
+		input_word_width = ASRC_WIDTH_16_BIT;
+		break;
+	case 24:
+		input_word_width = ASRC_WIDTH_24_BIT;
+		break;
+	default:
+		pair_err("does not support this input format, %d\n",
+			 config->input_format);
+		return -EINVAL;
+	}
+
+	switch (snd_pcm_format_width(config->output_format)) {
+	case 16:
+		output_word_width = ASRC_WIDTH_16_BIT;
+		break;
+	case 24:
+		output_word_width = ASRC_WIDTH_24_BIT;
+		break;
+	default:
+		pair_err("does not support this output format, %d\n",
+			 config->output_format);
 		return -EINVAL;
 	}
 
@@ -383,8 +408,8 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
 	/* Implement word_width configurations */
 	regmap_update_bits(asrc_priv->regmap, REG_ASRMCR1(index),
 			   ASRMCR1i_OW16_MASK | ASRMCR1i_IWD_MASK,
-			   ASRMCR1i_OW16(config->output_word_width) |
-			   ASRMCR1i_IWD(config->input_word_width));
+			   ASRMCR1i_OW16(output_word_width) |
+			   ASRMCR1i_IWD(input_word_width));
 
 	/* Enable BUFFER STALL */
 	regmap_update_bits(asrc_priv->regmap, REG_ASRMCR(index),
@@ -497,13 +522,13 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_soc_dai *dai)
 {
 	struct fsl_asrc *asrc_priv = snd_soc_dai_get_drvdata(dai);
-	int width = params_width(params);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct fsl_asrc_pair *pair = runtime->private_data;
 	unsigned int channels = params_channels(params);
 	unsigned int rate = params_rate(params);
 	struct asrc_config config;
-	int word_width, ret;
+	snd_pcm_format_t format;
+	int ret;
 
 	ret = fsl_asrc_request_pair(channels, pair);
 	if (ret) {
@@ -513,15 +538,10 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
 
 	pair->config = &config;
 
-	if (width == 16)
-		width = ASRC_WIDTH_16_BIT;
-	else
-		width = ASRC_WIDTH_24_BIT;
-
 	if (asrc_priv->asrc_width == 16)
-		word_width = ASRC_WIDTH_16_BIT;
+		format = SNDRV_PCM_FORMAT_S16_LE;
 	else
-		word_width = ASRC_WIDTH_24_BIT;
+		format = SNDRV_PCM_FORMAT_S24_LE;
 
 	config.pair = pair->index;
 	config.channel_num = channels;
@@ -529,13 +549,13 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
 	config.outclk = OUTCLK_ASRCK1_CLK;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		config.input_word_width   = width;
-		config.output_word_width  = word_width;
+		config.input_format   = params_format(params);
+		config.output_format  = format;
 		config.input_sample_rate  = rate;
 		config.output_sample_rate = asrc_priv->asrc_rate;
 	} else {
-		config.input_word_width   = word_width;
-		config.output_word_width  = width;
+		config.input_format   = format;
+		config.output_format  = params_format(params);
 		config.input_sample_rate  = asrc_priv->asrc_rate;
 		config.output_sample_rate = rate;
 	}
diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
index c60075112570..38af485bdd22 100644
--- a/sound/soc/fsl/fsl_asrc.h
+++ b/sound/soc/fsl/fsl_asrc.h
@@ -342,8 +342,8 @@ struct asrc_config {
 	unsigned int dma_buffer_size;
 	unsigned int input_sample_rate;
 	unsigned int output_sample_rate;
-	enum asrc_word_width input_word_width;
-	enum asrc_word_width output_word_width;
+	snd_pcm_format_t input_format;
+	snd_pcm_format_t output_format;
 	enum asrc_inclk inclk;
 	enum asrc_outclk outclk;
 };
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
