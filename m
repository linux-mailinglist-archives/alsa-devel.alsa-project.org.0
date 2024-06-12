Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C79904C1E
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 08:58:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14218B60;
	Wed, 12 Jun 2024 08:58:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14218B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718175520;
	bh=Q8AHuRyl3NL4B85ErKlKspLuUKAsq9kSwZcb3LJXnYg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vFza0sJprHL2jpg3nbPNqI3GolpQk3P6ELY4bN55Xfdw+zt/AIef3x0Z6nk3BwtYz
	 +ZSj6K8AA5iQROQEWoQPBRlNr1DN+fehp/117nylFlcN8610Blubo0lRXRbpluEG35
	 uaTwGPg7Jj40rD4qn9lfRFxbK8QHf/46WXt5koEE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4279FF805D4; Wed, 12 Jun 2024 08:58:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B0DDF805E2;
	Wed, 12 Jun 2024 08:58:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 154E1F805BE; Wed, 12 Jun 2024 08:57:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-0.0 required=5.0 tests=RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3EB16F80578
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 08:57:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EB16F80578
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6B0F31A123F;
	Wed, 12 Jun 2024 08:57:46 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D13331A0FFA;
	Wed, 12 Jun 2024 08:57:45 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 8A012181D0FD;
	Wed, 12 Jun 2024 14:57:43 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: viorel.suman@nxp.com
Subject: [PATCH 1/3] ASoC: fsl_sai: Add separate DAI for transmitter and
 receiver
Date: Wed, 12 Jun 2024 14:40:50 +0800
Message-Id: <1718174452-17596-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1718174452-17596-1-git-send-email-shengjiu.wang@nxp.com>
References: <1718174452-17596-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: Y6DGSBSKLQUZSAMG455OTUSHC22P2YZU
X-Message-ID-Hash: Y6DGSBSKLQUZSAMG455OTUSHC22P2YZU
X-MailFrom: shengjiu.wang@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y6DGSBSKLQUZSAMG455OTUSHC22P2YZU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The transmitter and receiver part of the SAI interface need to be
configured with different master/slave mode, especially to work
with the audiomix module.

+-------+               +-----------+
| SAI1  |   --TX-->     |           |
|       |   <--RX--     |           |
+-------+               |           |
                        | AUDIOMIX  |
+-------+               |           |
| SAI2  |   --TX-->     |           |
+-------+               +-----------+

The SAI1 TX is in master mode, but SAI1 RX is in slave mode.
So add another two DAIs for TX and RX separately. but only
defined fsl_sai_set_dai_fmt_tx() and fsl_sai_set_dai_fmt_rx()
ops function for current case, in the future, the other ops
function for TX and RX can be defined if required.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 141 +++++++++++++++++++++++++++++-----------
 sound/soc/fsl/fsl_sai.h |   4 +-
 2 files changed, 104 insertions(+), 41 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 0e2c31439670..d03b0172b8ad 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -357,18 +357,18 @@ static int fsl_sai_set_dai_fmt_tr(struct snd_soc_dai *cpu_dai,
 	case SND_SOC_DAIFMT_BP_FP:
 		val_cr2 |= FSL_SAI_CR2_BCD_MSTR;
 		val_cr4 |= FSL_SAI_CR4_FSD_MSTR;
-		sai->is_consumer_mode = false;
+		sai->is_consumer_mode[tx] = false;
 		break;
 	case SND_SOC_DAIFMT_BC_FC:
-		sai->is_consumer_mode = true;
+		sai->is_consumer_mode[tx] = true;
 		break;
 	case SND_SOC_DAIFMT_BP_FC:
 		val_cr2 |= FSL_SAI_CR2_BCD_MSTR;
-		sai->is_consumer_mode = false;
+		sai->is_consumer_mode[tx] = false;
 		break;
 	case SND_SOC_DAIFMT_BC_FP:
 		val_cr4 |= FSL_SAI_CR4_FSD_MSTR;
-		sai->is_consumer_mode = true;
+		sai->is_consumer_mode[tx] = true;
 		break;
 	default:
 		return -EINVAL;
@@ -400,6 +400,16 @@ static int fsl_sai_set_dai_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 	return ret;
 }
 
+static int fsl_sai_set_dai_fmt_tx(struct snd_soc_dai *cpu_dai, unsigned int fmt)
+{
+	return fsl_sai_set_dai_fmt_tr(cpu_dai, fmt, true);
+}
+
+static int fsl_sai_set_dai_fmt_rx(struct snd_soc_dai *cpu_dai, unsigned int fmt)
+{
+	return fsl_sai_set_dai_fmt_tr(cpu_dai, fmt, false);
+}
+
 static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
 {
 	struct fsl_sai *sai = snd_soc_dai_get_drvdata(dai);
@@ -412,7 +422,7 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
 	bool support_1_1_ratio = sai->verid.version >= 0x0301;
 
 	/* Don't apply to consumer mode */
-	if (sai->is_consumer_mode)
+	if (sai->is_consumer_mode[tx])
 		return 0;
 
 	/*
@@ -575,7 +585,7 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 		}
 	}
 
-	if (!sai->is_consumer_mode) {
+	if (!sai->is_consumer_mode[tx]) {
 		ret = fsl_sai_set_bclk(cpu_dai, tx, bclk);
 		if (ret)
 			return ret;
@@ -613,7 +623,7 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 	 * RCR5(TCR5) for playback(capture), or there will be sync error.
 	 */
 
-	if (!sai->is_consumer_mode && fsl_sai_dir_is_synced(sai, adir)) {
+	if (!sai->is_consumer_mode[tx] && fsl_sai_dir_is_synced(sai, adir)) {
 		regmap_update_bits(sai->regmap, FSL_SAI_xCR4(!tx, ofs),
 				   FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK |
 				   FSL_SAI_CR4_CHMOD_MASK,
@@ -683,7 +693,7 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 	 * FSD_MSTR bit for this specific case.
 	 */
 	if (sai->soc_data->mclk_with_tere && sai->mclk_direction_output &&
-	    !sai->is_consumer_mode)
+	    !sai->is_consumer_mode[tx])
 		regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx, ofs),
 				   FSL_SAI_CR4_FSD_MSTR, 0);
 
@@ -697,7 +707,7 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 
 	/* Enable FSD_MSTR after configuring word width */
 	if (sai->soc_data->mclk_with_tere && sai->mclk_direction_output &&
-	    !sai->is_consumer_mode)
+	    !sai->is_consumer_mode[tx])
 		regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx, ofs),
 				   FSL_SAI_CR4_FSD_MSTR, FSL_SAI_CR4_FSD_MSTR);
 
@@ -720,8 +730,8 @@ static int fsl_sai_hw_free(struct snd_pcm_substream *substream,
 	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx, ofs),
 			   FSL_SAI_CR3_TRCE_MASK, 0);
 
-	if (!sai->is_consumer_mode &&
-			sai->mclk_streams & BIT(substream->stream)) {
+	if (!sai->is_consumer_mode[tx] &&
+	    sai->mclk_streams & BIT(substream->stream)) {
 		clk_disable_unprepare(sai->mclk_clk[sai->mclk_id[tx]]);
 		sai->mclk_streams &= ~BIT(substream->stream);
 	}
@@ -759,7 +769,7 @@ static void fsl_sai_config_disable(struct fsl_sai *sai, int dir)
 	 * This is a hardware bug, and will be fix in the
 	 * next sai version.
 	 */
-	if (!sai->is_consumer_mode) {
+	if (!sai->is_consumer_mode[tx]) {
 		/* Software Reset */
 		regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), FSL_SAI_CSR_SR);
 		/* Clear SR bit to finish the reset */
@@ -914,6 +924,30 @@ static const struct snd_soc_dai_ops fsl_sai_pcm_dai_ops = {
 	.startup	= fsl_sai_startup,
 };
 
+static const struct snd_soc_dai_ops fsl_sai_pcm_dai_tx_ops = {
+	.probe		= fsl_sai_dai_probe,
+	.set_bclk_ratio	= fsl_sai_set_dai_bclk_ratio,
+	.set_sysclk	= fsl_sai_set_dai_sysclk,
+	.set_fmt	= fsl_sai_set_dai_fmt_tx,
+	.set_tdm_slot	= fsl_sai_set_dai_tdm_slot,
+	.hw_params	= fsl_sai_hw_params,
+	.hw_free	= fsl_sai_hw_free,
+	.trigger	= fsl_sai_trigger,
+	.startup	= fsl_sai_startup,
+};
+
+static const struct snd_soc_dai_ops fsl_sai_pcm_dai_rx_ops = {
+	.probe		= fsl_sai_dai_probe,
+	.set_bclk_ratio	= fsl_sai_set_dai_bclk_ratio,
+	.set_sysclk	= fsl_sai_set_dai_sysclk,
+	.set_fmt	= fsl_sai_set_dai_fmt_rx,
+	.set_tdm_slot	= fsl_sai_set_dai_tdm_slot,
+	.hw_params	= fsl_sai_hw_params,
+	.hw_free	= fsl_sai_hw_free,
+	.trigger	= fsl_sai_trigger,
+	.startup	= fsl_sai_startup,
+};
+
 static int fsl_sai_dai_resume(struct snd_soc_component *component)
 {
 	struct fsl_sai *sai = snd_soc_component_get_drvdata(component);
@@ -931,26 +965,55 @@ static int fsl_sai_dai_resume(struct snd_soc_component *component)
 	return 0;
 }
 
-static struct snd_soc_dai_driver fsl_sai_dai_template = {
-	.playback = {
-		.stream_name = "CPU-Playback",
-		.channels_min = 1,
-		.channels_max = 32,
-		.rate_min = 8000,
-		.rate_max = 2822400,
-		.rates = SNDRV_PCM_RATE_KNOT,
-		.formats = FSL_SAI_FORMATS,
+static struct snd_soc_dai_driver fsl_sai_dai_template[] = {
+	{
+		.name = "sai-tx-rx",
+		.playback = {
+			.stream_name = "CPU-Playback",
+			.channels_min = 1,
+			.channels_max = 32,
+			.rate_min = 8000,
+			.rate_max = 2822400,
+			.rates = SNDRV_PCM_RATE_KNOT,
+			.formats = FSL_SAI_FORMATS,
+		},
+		.capture = {
+			.stream_name = "CPU-Capture",
+			.channels_min = 1,
+			.channels_max = 32,
+			.rate_min = 8000,
+			.rate_max = 2822400,
+			.rates = SNDRV_PCM_RATE_KNOT,
+			.formats = FSL_SAI_FORMATS,
+		},
+		.ops = &fsl_sai_pcm_dai_ops,
+	},
+	{
+		.name = "sai-tx",
+		.playback = {
+			.stream_name = "CPU-Playback",
+			.channels_min = 1,
+			.channels_max = 32,
+				.rate_min = 8000,
+			.rate_max = 2822400,
+			.rates = SNDRV_PCM_RATE_KNOT,
+			.formats = FSL_SAI_FORMATS,
+		},
+		.ops = &fsl_sai_pcm_dai_tx_ops,
 	},
-	.capture = {
-		.stream_name = "CPU-Capture",
-		.channels_min = 1,
-		.channels_max = 32,
-		.rate_min = 8000,
-		.rate_max = 2822400,
-		.rates = SNDRV_PCM_RATE_KNOT,
-		.formats = FSL_SAI_FORMATS,
+	{
+		.name = "sai-rx",
+		.capture = {
+			.stream_name = "CPU-Capture",
+			.channels_min = 1,
+			.channels_max = 32,
+			.rate_min = 8000,
+			.rate_max = 2822400,
+			.rates = SNDRV_PCM_RATE_KNOT,
+			.formats = FSL_SAI_FORMATS,
+		},
+		.ops = &fsl_sai_pcm_dai_rx_ops,
 	},
-	.ops = &fsl_sai_pcm_dai_ops,
 };
 
 static const struct snd_soc_component_driver fsl_component = {
@@ -1399,15 +1462,15 @@ static int fsl_sai_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	memcpy(&sai->cpu_dai_drv, &fsl_sai_dai_template,
-	       sizeof(fsl_sai_dai_template));
+	memcpy(&sai->cpu_dai_drv, fsl_sai_dai_template,
+	       sizeof(*fsl_sai_dai_template) * ARRAY_SIZE(fsl_sai_dai_template));
 
 	/* Sync Tx with Rx as default by following old DT binding */
 	sai->synchronous[RX] = true;
 	sai->synchronous[TX] = false;
-	sai->cpu_dai_drv.symmetric_rate = 1;
-	sai->cpu_dai_drv.symmetric_channels = 1;
-	sai->cpu_dai_drv.symmetric_sample_bits = 1;
+	sai->cpu_dai_drv[0].symmetric_rate = 1;
+	sai->cpu_dai_drv[0].symmetric_channels = 1;
+	sai->cpu_dai_drv[0].symmetric_sample_bits = 1;
 
 	if (of_property_read_bool(np, "fsl,sai-synchronous-rx") &&
 	    of_property_read_bool(np, "fsl,sai-asynchronous")) {
@@ -1424,9 +1487,9 @@ static int fsl_sai_probe(struct platform_device *pdev)
 		/* Discard all settings for asynchronous mode */
 		sai->synchronous[RX] = false;
 		sai->synchronous[TX] = false;
-		sai->cpu_dai_drv.symmetric_rate = 0;
-		sai->cpu_dai_drv.symmetric_channels = 0;
-		sai->cpu_dai_drv.symmetric_sample_bits = 0;
+		sai->cpu_dai_drv[0].symmetric_rate = 0;
+		sai->cpu_dai_drv[0].symmetric_channels = 0;
+		sai->cpu_dai_drv[0].symmetric_sample_bits = 0;
 	}
 
 	sai->mclk_direction_output = of_property_read_bool(np, "fsl,sai-mclk-direction-output");
@@ -1505,7 +1568,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	}
 
 	ret = devm_snd_soc_register_component(dev, &fsl_component,
-					      &sai->cpu_dai_drv, 1);
+					      sai->cpu_dai_drv, ARRAY_SIZE(fsl_sai_dai_template));
 	if (ret)
 		goto err_pm_get_sync;
 
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 550df87b6a06..dadbd16ee394 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -282,7 +282,7 @@ struct fsl_sai {
 	struct clk *pll11k_clk;
 	struct resource *res;
 
-	bool is_consumer_mode;
+	bool is_consumer_mode[2];
 	bool is_lsb_first;
 	bool is_dsp_mode;
 	bool is_pdm_mode;
@@ -299,7 +299,7 @@ struct fsl_sai {
 	unsigned int bclk_ratio;
 
 	const struct fsl_sai_soc_data *soc_data;
-	struct snd_soc_dai_driver cpu_dai_drv;
+	struct snd_soc_dai_driver cpu_dai_drv[3];
 	struct snd_dmaengine_dai_dma_data dma_params_rx;
 	struct snd_dmaengine_dai_dma_data dma_params_tx;
 	struct fsl_sai_verid verid;
-- 
2.34.1

