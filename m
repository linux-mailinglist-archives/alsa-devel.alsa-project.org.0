Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7349152D941
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 17:51:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C8DF16DF;
	Thu, 19 May 2022 17:50:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C8DF16DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652975494;
	bh=3o5rCTf/AAs3KqSXA6OQvwvBGj1Ieu7t4Szha1nAMUU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qtE/+C6YaQ5YHLELQy1KsWNsg9IsNhhsR7lM3V9A8J6QTYrf0OK+p0enxcxCDA5cK
	 +N8iMhG4QBY8cPlm7apnb5je/V0shOJVUR62BtvXY7Ifyba0U8VSrf8SMiZEOBibgD
	 X+kKLmw/8q/DtFMzpshg+SFgTUJYKr+HpsxDNaNk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9399FF80559;
	Thu, 19 May 2022 17:44:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0CCCF805C5; Thu, 19 May 2022 17:44:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC485F80533
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 17:43:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC485F80533
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="DXzlzPfl"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JBHtah024228;
 Thu, 19 May 2022 10:43:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=MwXos4gS7oWRSJcalauxt79MQccyt3p5gNtwv3UIWLo=;
 b=DXzlzPflbyNTWDaw5M6J0bNBv77UKyztcW/qxv06bMkKIBMSPzsOmTBudRDXCidsaLC3
 jzAlrPCp/Hg9E1WrlYfXzYoOxeNzXcxodoH7YBs+vR3/jzNcvncWMQvDuwTRG3fxAbBz
 jXfVf9LN5V6zr8U0+vxAEXq+zkQGdgd0/D7GIO4kmEvuPxRi07n49yTLO6pkcLqHxKSx
 9KXmBNUIAlsjksng53cCIYkiqJszOZJPqSnqRtEobr10eTIKU1Tn1JaIzAoFJFWP0Qtw
 pAMjyER8YdfnvjQZaQZJmsPKvvcFHDXyMIegiMsU6CoTEVTYFA8U+gDcZnZhQW4Ok7xv 8g== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dm-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:33 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:19 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:19 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 91C3611D1;
 Thu, 19 May 2022 15:43:19 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 17/56] ASoC: qcom: Update to use set_fmt_new callback
Date: Thu, 19 May 2022 16:42:39 +0100
Message-ID: <20220519154318.2153729-18-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: -3_Zo-dySkerEjZ5-P2VyFgEGvCRm6BS
X-Proofpoint-ORIG-GUID: -3_Zo-dySkerEjZ5-P2VyFgEGvCRm6BS
X-Proofpoint-Spam-Reason: safe
Cc: cezary.rojewski@intel.com, heiko@sntech.de,
 kuninori.morimoto.gx@renesas.com, alsa-devel@alsa-project.org,
 nicolas.ferre@microchip.com, srinivas.kandagatla@linaro.org,
 peter.ujfalusi@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, daniel@zonque.org,
 kernel@pengutronix.de, shawnguo@kernel.org, jarkko.nikula@bitmer.com
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

As part of updating the core to directly tell drivers if they are clock
provider or consumer update these CPU side drivers to use the new direct
callback.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/qcom/apq8016_sbc.c            | 2 +-
 sound/soc/qcom/qdsp6/audioreach.c       | 4 ++--
 sound/soc/qcom/qdsp6/q6afe-dai.c        | 2 +-
 sound/soc/qcom/qdsp6/q6afe.c            | 6 +++---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
 sound/soc/qcom/sc7180.c                 | 2 +-
 sound/soc/qcom/sdm845.c                 | 6 +++---
 sound/soc/qcom/sm8250.c                 | 4 ++--
 8 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
index b0a4f7ca27515..e54b8961112f3 100644
--- a/sound/soc/qcom/apq8016_sbc.c
+++ b/sound/soc/qcom/apq8016_sbc.c
@@ -172,7 +172,7 @@ static int msm8916_qdsp6_dai_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 
-	snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_CBS_CFS);
+	snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
 	return apq8016_dai_init(rtd, qdsp6_dai_get_lpass_id(cpu_dai));
 }
 
diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 98c0efa1d0fec..01dac32c50fda 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -732,10 +732,10 @@ static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
 	intf_cfg->cfg.sd_line_idx = module->sd_line_idx;
 
 	switch (cfg->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBC_CFC:
+	case SND_SOC_DAIFMT_BP_FP:
 		intf_cfg->cfg.ws_src = CONFIG_I2S_WS_SRC_INTERNAL;
 		break;
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BC_FC:
 		/* CPU is slave */
 		intf_cfg->cfg.ws_src = CONFIG_I2S_WS_SRC_EXTERNAL;
 		break;
diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index 8bb7452b8f18c..8f8794cffc1c5 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -648,7 +648,7 @@ static const struct snd_soc_dai_ops q6hdmi_ops = {
 static const struct snd_soc_dai_ops q6i2s_ops = {
 	.prepare	= q6afe_dai_prepare,
 	.hw_params	= q6i2s_hw_params,
-	.set_fmt	= q6i2s_set_fmt,
+	.set_fmt_new	= q6i2s_set_fmt,
 	.shutdown	= q6afe_dai_shutdown,
 	.set_sysclk	= q6afe_mi2s_set_sysclk,
 };
diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 625724852a7fb..919e326b9462b 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -1328,11 +1328,11 @@ int q6afe_i2s_port_prepare(struct q6afe_port *port, struct q6afe_i2s_cfg *cfg)
 	pcfg->i2s_cfg.bit_width = cfg->bit_width;
 	pcfg->i2s_cfg.data_format = AFE_LINEAR_PCM_DATA;
 
-	switch (cfg->fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (cfg->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BP_FP:
 		pcfg->i2s_cfg.ws_src = AFE_PORT_CONFIG_I2S_WS_SRC_INTERNAL;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_BC_FC:
 		/* CPU is slave */
 		pcfg->i2s_cfg.ws_src = AFE_PORT_CONFIG_I2S_WS_SRC_EXTERNAL;
 		break;
diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index ce9e5646d8f3a..82ee52051f831 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -207,7 +207,7 @@ static const struct snd_soc_dai_ops q6i2s_ops = {
 	.shutdown	= q6apm_lpass_dai_shutdown,
 	.set_channel_map  = q6dma_set_channel_map,
 	.hw_params        = q6dma_hw_params,
-	.set_fmt	= q6i2s_set_fmt,
+	.set_fmt_new	= q6i2s_set_fmt,
 };
 
 static const struct snd_soc_component_driver q6apm_lpass_dai_component = {
diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index efccb5c0b3e00..f5f7c64b23a27 100644
--- a/sound/soc/qcom/sc7180.c
+++ b/sound/soc/qcom/sc7180.c
@@ -155,7 +155,7 @@ static int sc7180_snd_startup(struct snd_pcm_substream *substream)
 		}
 
 		snd_soc_dai_set_fmt(codec_dai,
-				    SND_SOC_DAIFMT_CBS_CFS |
+				    SND_SOC_DAIFMT_BC_FC |
 				    SND_SOC_DAIFMT_NB_NF |
 				    SND_SOC_DAIFMT_I2S);
 
diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 61fda790f3756..d8d35563af00f 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -316,8 +316,8 @@ static int sdm845_dai_init(struct snd_soc_pcm_runtime *rtd)
 
 static int sdm845_snd_startup(struct snd_pcm_substream *substream)
 {
-	unsigned int fmt = SND_SOC_DAIFMT_CBS_CFS;
-	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_CBS_CFS;
+	unsigned int fmt = SND_SOC_DAIFMT_BP_FP;
+	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_BC_FC;
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct sdm845_snd_data *data = snd_soc_card_get_drvdata(card);
@@ -356,7 +356,7 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
 		snd_soc_dai_set_sysclk(cpu_dai,
 			Q6AFE_LPASS_CLK_ID_QUAD_MI2S_IBIT,
 			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
-		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_CBS_CFS);
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
 
 
 		break;
diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 6e1184c8b672a..ce4a5713386a3 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -96,8 +96,8 @@ static int sm8250_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 
 static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 {
-	unsigned int fmt = SND_SOC_DAIFMT_CBS_CFS;
-	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_CBS_CFS;
+	unsigned int fmt = SND_SOC_DAIFMT_BP_FP;
+	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_BC_FC;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-- 
2.30.2

