Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF5E2643D5
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 12:24:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95709169F;
	Thu, 10 Sep 2020 12:23:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95709169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599733446;
	bh=akUdMpUW2OXYEqdf2/7aQNm2t6TmXdCIgIssNs+ScYM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s0gkBsjK+PiHCO4XLifuqKPV/bcgWrRUQMytKuT93eZngrgBkPUKNwbgqWtv8CYTe
	 t7++EbLIjA91NBgA0QSfm48kNwr8k+HiwQ4Ucf9dF6u+iq6uMza6pfZLB7ajuF1bue
	 R0ol/Tu4olNVeKHvz9i3slMEw9rxVTfDq4wg3iI8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B214F80307;
	Thu, 10 Sep 2020 12:18:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBA36F802E2; Thu, 10 Sep 2020 12:18:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A31D0F802D2
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 12:17:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A31D0F802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="WYVUOP78"
Received: by mail-wr1-x443.google.com with SMTP id j2so6073536wrx.7
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 03:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fI1uS4bVeiqLJzCVRZUdfDt50/7TaI5DFX9s+uR8bi0=;
 b=WYVUOP78Ceudw8wHTgtD4OL6yrcyMzVLx+5nuP/mHNT7rUuEGgFqmySkdD0ytYlUIT
 8IgjAcg417KQYMvJIDwSxzKsz7FqCuvmkUrFNz51IQwXhGY+FNbNKw5WnIhfY91rHSyS
 YSVvD99v221/B9M+Qv1lOioQPPdkYuDzg2bium2d9z7uIBEBkXxiNe0clrX3eJhD0A+2
 cnaLBhbvyAnSiove7mSyx+rpAr3Pl3YvdQKSrmh3U7gz2oCM4PwecYyjoZxII4dHWiQf
 qtj/FZe/TBe6Z6q0Q6dNxfYnf8P4TNytw4F5+jUs6gDc3DV1wqKChJYyJ3M+A8b36pkL
 NA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fI1uS4bVeiqLJzCVRZUdfDt50/7TaI5DFX9s+uR8bi0=;
 b=Rz2JxwLpUyFZ1ry7WOHNIl/huJVIt/VZy1807U+UCOlO6xa+zib8j3Zx5SZnQsATix
 gqg/kOStU9KoxXQ08p9XJBnAlHflMXRfFT6uHgtjHLnoFanK5yUaJSJ0Oha78SHRAsfu
 FH+riim6pbcVsddlI6QbCd3nZoCnoElCj49CTySTzEU+TeC6iEGXUz6X411+mTVvC22W
 mi38Jrcv1LfXt9Mb8SvGXtXlzcdN4Hl0udrYRn4Da6HjGj4vO09grOBbOZ2o5ExQMT7k
 jScrbw/JpDQtZkSvzzh6C/6Dq4YNFTH3kbi0E08TJIosmHPI1IuEQs+9mbDDZzvOz1Ra
 3YRA==
X-Gm-Message-State: AOAM533RLXaC7TccLCH2b1oz8Gfepl4jlLAos8Ce7fRm7C7SXylizbOc
 osQgaQKg8s9wwpBrF5B65bVvbA==
X-Google-Smtp-Source: ABdhPJyDqSI3QwjTu46eo8utnMHXlAibRnHzADDlFuXxPCwSOFwTJn3ww+z5s6A933WGx+awyhPUFw==
X-Received: by 2002:a5d:4591:: with SMTP id p17mr8084131wrq.408.1599733077453; 
 Thu, 10 Sep 2020 03:17:57 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id m4sm8851731wro.18.2020.09.10.03.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 03:17:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 8/8] ASoC: q6dsp: q6afe-dai: add support to Codec DMA ports
Date: Thu, 10 Sep 2020 11:17:32 +0100
Message-Id: <20200910101732.23484-9-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200910101732.23484-1-srinivas.kandagatla@linaro.org>
References: <20200910101732.23484-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6afe-dai.c | 229 +++++++++++++++++++++++++++++++
 1 file changed, 229 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index 0168af849272..d58b86a98114 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -55,6 +55,48 @@
 		.remove = msm_dai_q6_dai_remove,			\
 	}
 
+#define Q6AFE_CDC_DMA_RX_DAI(did) {				\
+		.playback = {						\
+			.stream_name = #did" Playback",	\
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
+				SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
+				SNDRV_PCM_RATE_176400,			\
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |		\
+				   SNDRV_PCM_FMTBIT_S24_LE |		\
+				   SNDRV_PCM_FMTBIT_S32_LE,		\
+			.channels_min = 1,				\
+			.channels_max = 8,				\
+			.rate_min = 8000,				\
+			.rate_max = 176400,				\
+		},							\
+		.name = #did,						\
+		.ops = &q6dma_ops,					\
+		.id = did,						\
+		.probe = msm_dai_q6_dai_probe,				\
+		.remove = msm_dai_q6_dai_remove,			\
+	}
+
+#define Q6AFE_CDC_DMA_TX_DAI(did) {				\
+		.capture = {						\
+			.stream_name = #did" Capture",		\
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
+				SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
+				SNDRV_PCM_RATE_176400,			\
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |		\
+				   SNDRV_PCM_FMTBIT_S24_LE |		\
+				   SNDRV_PCM_FMTBIT_S32_LE,		\
+			.channels_min = 1,				\
+			.channels_max = 8,				\
+			.rate_min = 8000,				\
+			.rate_max = 176400,				\
+		},							\
+		.name = #did,						\
+		.ops = &q6dma_ops,					\
+		.id = did,						\
+		.probe = msm_dai_q6_dai_probe,				\
+		.remove = msm_dai_q6_dai_remove,			\
+	}
+
 struct q6afe_dai_priv_data {
 	uint32_t sd_line_mask;
 	uint32_t sync_mode;
@@ -307,6 +349,90 @@ static int q6tdm_hw_params(struct snd_pcm_substream *substream,
 
 	return 0;
 }
+
+static int q6dma_set_channel_map(struct snd_soc_dai *dai,
+				 unsigned int tx_num, unsigned int *tx_ch_mask,
+				 unsigned int rx_num, unsigned int *rx_ch_mask)
+{
+
+	struct q6afe_dai_data *dai_data = dev_get_drvdata(dai->dev);
+	struct q6afe_cdc_dma_cfg *cfg = &dai_data->port_config[dai->id].dma_cfg;
+	int ch_mask;
+	int rc = 0;
+
+	switch (dai->id) {
+	case WSA_CODEC_DMA_TX_0:
+	case WSA_CODEC_DMA_TX_1:
+	case WSA_CODEC_DMA_TX_2:
+	case VA_CODEC_DMA_TX_0:
+	case VA_CODEC_DMA_TX_1:
+	case VA_CODEC_DMA_TX_2:
+	case TX_CODEC_DMA_TX_0:
+	case TX_CODEC_DMA_TX_1:
+	case TX_CODEC_DMA_TX_2:
+	case TX_CODEC_DMA_TX_3:
+	case TX_CODEC_DMA_TX_4:
+	case TX_CODEC_DMA_TX_5:
+		if (!tx_ch_mask) {
+			dev_err(dai->dev, "tx slot not found\n");
+			return -EINVAL;
+		}
+
+		if (tx_num > AFE_PORT_MAX_AUDIO_CHAN_CNT) {
+			dev_err(dai->dev, "invalid tx num %d\n",
+				tx_num);
+			return -EINVAL;
+		}
+		ch_mask = *tx_ch_mask;
+
+		break;
+	case WSA_CODEC_DMA_RX_0:
+	case WSA_CODEC_DMA_RX_1:
+	case RX_CODEC_DMA_RX_0:
+	case RX_CODEC_DMA_RX_1:
+	case RX_CODEC_DMA_RX_2:
+	case RX_CODEC_DMA_RX_3:
+	case RX_CODEC_DMA_RX_4:
+	case RX_CODEC_DMA_RX_5:
+	case RX_CODEC_DMA_RX_6:
+	case RX_CODEC_DMA_RX_7:
+		/* rx */
+		if (!rx_ch_mask) {
+			dev_err(dai->dev, "rx slot not found\n");
+			return -EINVAL;
+		}
+		if (rx_num > AFE_PORT_MAX_AUDIO_CHAN_CNT) {
+			dev_err(dai->dev, "invalid rx num %d\n",
+				rx_num);
+			return -EINVAL;
+		}
+		ch_mask = *rx_ch_mask;
+
+		break;
+	default:
+		dev_err(dai->dev, "%s: invalid dai id 0x%x\n",
+			__func__, dai->id);
+		return -EINVAL;
+	}
+
+	cfg->active_channels_mask = ch_mask;
+
+	return rc;
+}
+
+static int q6dma_hw_params(struct snd_pcm_substream *substream,
+			   struct snd_pcm_hw_params *params,
+			   struct snd_soc_dai *dai)
+{
+	struct q6afe_dai_data *dai_data = dev_get_drvdata(dai->dev);
+	struct q6afe_cdc_dma_cfg *cfg = &dai_data->port_config[dai->id].dma_cfg;
+
+	cfg->bit_width = params_width(params);
+	cfg->sample_rate = params_rate(params);
+	cfg->num_channels = params_channels(params);
+
+	return 0;
+}
 static void q6afe_dai_shutdown(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
@@ -362,6 +488,10 @@ static int q6afe_dai_prepare(struct snd_pcm_substream *substream,
 		q6afe_tdm_port_prepare(dai_data->port[dai->id],
 					&dai_data->port_config[dai->id].tdm);
 		break;
+	case WSA_CODEC_DMA_RX_0 ... RX_CODEC_DMA_RX_7:
+		q6afe_cdc_dma_port_prepare(dai_data->port[dai->id],
+					   &dai_data->port_config[dai->id].dma_cfg);
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -430,6 +560,7 @@ static int q6afe_mi2s_set_sysclk(struct snd_soc_dai *dai,
 					     freq, dir);
 	case Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT ... Q6AFE_LPASS_CLK_ID_QUI_MI2S_OSR:
 	case Q6AFE_LPASS_CLK_ID_MCLK_1 ... Q6AFE_LPASS_CLK_ID_INT_MCLK_1:
+	case Q6AFE_LPASS_CLK_ID_WSA_CORE_MCLK ... Q6AFE_LPASS_CLK_ID_VA_CORE_2X_MCLK:
 		return q6afe_port_set_sysclk(port, clk_id,
 					     Q6AFE_LPASS_CLK_ATTRIBUTE_COUPLE_NO,
 					     Q6AFE_LPASS_CLK_ROOT_DEFAULT,
@@ -562,6 +693,29 @@ static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
 	{"PRI_MI2S_TX", NULL, "Primary MI2S Capture"},
 	{"SEC_MI2S_TX", NULL, "Secondary MI2S Capture"},
 	{"QUAT_MI2S_TX", NULL, "Quaternary MI2S Capture"},
+
+	{"WSA_CODEC_DMA_RX_0 Playback", NULL, "WSA_CODEC_DMA_RX_0"},
+	{"WSA_CODEC_DMA_TX_0", NULL, "WSA_CODEC_DMA_TX_0 Capture"},
+	{"WSA_CODEC_DMA_RX_1 Playback", NULL, "WSA_CODEC_DMA_RX_1"},
+	{"WSA_CODEC_DMA_TX_1", NULL, "WSA_CODEC_DMA_TX_1 Capture"},
+	{"WSA_CODEC_DMA_TX_2", NULL, "WSA_CODEC_DMA_TX_2 Capture"},
+	{"VA_CODEC_DMA_TX_0", NULL, "VA_CODEC_DMA_TX_0 Capture"},
+	{"VA_CODEC_DMA_TX_1", NULL, "VA_CODEC_DMA_TX_1 Capture"},
+	{"VA_CODEC_DMA_TX_2", NULL, "VA_CODEC_DMA_TX_2 Capture"},
+	{"RX_CODEC_DMA_RX_0 Playback", NULL, "RX_CODEC_DMA_RX_0"},
+	{"TX_CODEC_DMA_TX_0", NULL, "TX_CODEC_DMA_TX_0 Capture"},
+	{"RX_CODEC_DMA_RX_1 Playback", NULL, "RX_CODEC_DMA_RX_1"},
+	{"TX_CODEC_DMA_TX_1", NULL, "TX_CODEC_DMA_TX_1 Capture"},
+	{"RX_CODEC_DMA_RX_2 Playback", NULL, "RX_CODEC_DMA_RX_2"},
+	{"TX_CODEC_DMA_TX_2", NULL, "TX_CODEC_DMA_TX_2 Capture"},
+	{"RX_CODEC_DMA_RX_3 Playback", NULL, "RX_CODEC_DMA_RX_3"},
+	{"TX_CODEC_DMA_TX_3", NULL, "TX_CODEC_DMA_TX_3 Capture"},
+	{"RX_CODEC_DMA_RX_4 Playback", NULL, "RX_CODEC_DMA_RX_4"},
+	{"TX_CODEC_DMA_TX_4", NULL, "TX_CODEC_DMA_TX_4 Capture"},
+	{"RX_CODEC_DMA_RX_5 Playback", NULL, "RX_CODEC_DMA_RX_5"},
+	{"TX_CODEC_DMA_TX_5", NULL, "TX_CODEC_DMA_TX_5 Capture"},
+	{"RX_CODEC_DMA_RX_6 Playback", NULL, "RX_CODEC_DMA_RX_6"},
+	{"RX_CODEC_DMA_RX_7 Playback", NULL, "RX_CODEC_DMA_RX_7"},
 };
 
 static const struct snd_soc_dai_ops q6hdmi_ops = {
@@ -594,6 +748,14 @@ static const struct snd_soc_dai_ops q6tdm_ops = {
 	.hw_params        = q6tdm_hw_params,
 };
 
+static const struct snd_soc_dai_ops q6dma_ops = {
+	.prepare	= q6afe_dai_prepare,
+	.shutdown	= q6afe_dai_shutdown,
+	.set_sysclk	= q6afe_mi2s_set_sysclk,
+	.set_channel_map  = q6dma_set_channel_map,
+	.hw_params        = q6dma_hw_params,
+};
+
 static int msm_dai_q6_dai_probe(struct snd_soc_dai *dai)
 {
 	struct q6afe_dai_data *dai_data = dev_get_drvdata(dai->dev);
@@ -1128,6 +1290,28 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
 		.probe = msm_dai_q6_dai_probe,
 		.remove = msm_dai_q6_dai_remove,
 	},
+	Q6AFE_CDC_DMA_RX_DAI(WSA_CODEC_DMA_RX_0),
+	Q6AFE_CDC_DMA_TX_DAI(WSA_CODEC_DMA_TX_0),
+	Q6AFE_CDC_DMA_RX_DAI(WSA_CODEC_DMA_RX_1),
+	Q6AFE_CDC_DMA_TX_DAI(WSA_CODEC_DMA_TX_1),
+	Q6AFE_CDC_DMA_TX_DAI(WSA_CODEC_DMA_TX_2),
+	Q6AFE_CDC_DMA_TX_DAI(VA_CODEC_DMA_TX_0),
+	Q6AFE_CDC_DMA_TX_DAI(VA_CODEC_DMA_TX_1),
+	Q6AFE_CDC_DMA_TX_DAI(VA_CODEC_DMA_TX_2),
+	Q6AFE_CDC_DMA_RX_DAI(RX_CODEC_DMA_RX_0),
+	Q6AFE_CDC_DMA_TX_DAI(TX_CODEC_DMA_TX_0),
+	Q6AFE_CDC_DMA_RX_DAI(RX_CODEC_DMA_RX_1),
+	Q6AFE_CDC_DMA_TX_DAI(TX_CODEC_DMA_TX_1),
+	Q6AFE_CDC_DMA_RX_DAI(RX_CODEC_DMA_RX_2),
+	Q6AFE_CDC_DMA_TX_DAI(TX_CODEC_DMA_TX_2),
+	Q6AFE_CDC_DMA_RX_DAI(RX_CODEC_DMA_RX_3),
+	Q6AFE_CDC_DMA_TX_DAI(TX_CODEC_DMA_TX_3),
+	Q6AFE_CDC_DMA_RX_DAI(RX_CODEC_DMA_RX_4),
+	Q6AFE_CDC_DMA_TX_DAI(TX_CODEC_DMA_TX_4),
+	Q6AFE_CDC_DMA_RX_DAI(RX_CODEC_DMA_RX_5),
+	Q6AFE_CDC_DMA_TX_DAI(TX_CODEC_DMA_TX_5),
+	Q6AFE_CDC_DMA_RX_DAI(RX_CODEC_DMA_RX_6),
+	Q6AFE_CDC_DMA_RX_DAI(RX_CODEC_DMA_RX_7),
 };
 
 static int q6afe_of_xlate_dai_name(struct snd_soc_component *component,
@@ -1350,6 +1534,51 @@ static const struct snd_soc_dapm_widget q6afe_dai_widgets[] = {
 	SND_SOC_DAPM_AIF_OUT("QUIN_TDM_TX_7", NULL,
 						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("DISPLAY_PORT_RX", "NULL", 0, SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_AIF_IN("WSA_CODEC_DMA_RX_0", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("WSA_CODEC_DMA_TX_0", "NULL",
+		 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("WSA_CODEC_DMA_RX_1", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("WSA_CODEC_DMA_TX_1", "NULL",
+		 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("WSA_CODEC_DMA_TX_2", "NULL",
+		 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("VA_CODEC_DMA_TX_0", "NULL",
+		 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("VA_CODEC_DMA_TX_1", "NULL",
+		 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("VA_CODEC_DMA_TX_2", "NULL",
+		 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("RX_CODEC_DMA_RX_0", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("TX_CODEC_DMA_TX_0", "NULL",
+		 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("RX_CODEC_DMA_RX_1", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("TX_CODEC_DMA_TX_1", "NULL",
+		 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("RX_CODEC_DMA_RX_2", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("TX_CODEC_DMA_TX_2", "NULL",
+		 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("RX_CODEC_DMA_RX_3", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("TX_CODEC_DMA_TX_3", "NULL",
+		 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("RX_CODEC_DMA_RX_4", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("TX_CODEC_DMA_TX_4", "NULL",
+		 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("RX_CODEC_DMA_RX_5", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("TX_CODEC_DMA_TX_5", "NULL",
+		 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("RX_CODEC_DMA_RX_6", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("RX_CODEC_DMA_RX_7", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
 };
 
 static const struct snd_soc_component_driver q6afe_dai_component = {
-- 
2.21.0

