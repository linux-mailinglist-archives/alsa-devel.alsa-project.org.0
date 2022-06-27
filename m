Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0649655B93E
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 12:45:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80D50163B;
	Mon, 27 Jun 2022 12:45:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80D50163B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656326754;
	bh=76sH1KjVO8GpyCWgi4rHGCIt41xVn3VeSkjKr8YdX8g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GwpyPz7i9tbPtY+vYOGmjmN2erB3tYoPyV5aDQeY2NzsSX3fSPOkOpTWT4eVBxmz6
	 QTnYFm+x5htDDFAydAG7hNFPCyXXjyoo/tGm5XAiheVHDssjytaGwxGne2PvyVOjq7
	 QXvKpDEQnSxU3gQgEsTs3/rYacwYC33gdD05PVz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 070E0F800E9;
	Mon, 27 Jun 2022 12:44:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55AEDF800E9; Mon, 27 Jun 2022 12:44:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADC41F800E9
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 12:44:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADC41F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="KzjD1Lsa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1656326688; x=1687862688;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=lx+sq5BrYtlEATfMj2qSuWCQq/LYicVL0fuwLFTf85k=;
 b=KzjD1Lsab89olZghTusrjZFPDNzPJx1iu5dFadtzGk5+9F1EkB3xtU/2
 b0Nd4WFlYAxxXEe61/8iQUfCpYJAMlbKZXhbYXpnFS3Blj+SStWzP4u09
 Qs2EeFivwd/kcUgsOZd+bYs8uKXi9bkwb36Mfh0iDci0n/brhK720IESH I=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 27 Jun 2022 03:44:44 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 03:44:43 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 27 Jun 2022 03:44:42 -0700
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 27 Jun 2022 03:44:37 -0700
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@quicinc.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <quic_rohkumar@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>, <swboyd@chromium.org>,
 <judyhsiao@chromium.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2] ASoC: qcom: Add driver support for audioreach solution
Date: Mon, 27 Jun 2022 16:14:22 +0530
Message-ID: <1656326662-14524-1-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

Add Machine driver support for audioreach solution, which uses
ADSP in SC7280 based paltforms.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
---
Changes Since V1:
    -- Remove audioreach compatible name.
    -- Remove dt-binding patch.

 sound/soc/qcom/sc7280.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
index 34cdb99..da7469a 100644
--- a/sound/soc/qcom/sc7280.c
+++ b/sound/soc/qcom/sc7280.c
@@ -19,9 +19,11 @@
 #include "../codecs/rt5682s.h"
 #include "common.h"
 #include "lpass.h"
+#include "qdsp6/q6afe.h"
 
 #define DEFAULT_MCLK_RATE              19200000
 #define RT5682_PLL_FREQ (48000 * 512)
+#define MI2S_BCLK_RATE		1536000
 
 struct sc7280_snd_data {
 	struct snd_soc_card card;
@@ -79,6 +81,7 @@ static int sc7280_headset_init(struct snd_soc_pcm_runtime *rtd)
 	case MI2S_PRIMARY:
 	case LPASS_CDC_DMA_RX0:
 	case LPASS_CDC_DMA_TX3:
+	case TX_CODEC_DMA_TX_3:
 		for_each_rtd_codec_dais(rtd, i, codec_dai) {
 			rval = snd_soc_component_set_jack(component, &pdata->hs_jack, NULL);
 			if (rval != 0 && rval != -ENOTSUPP) {
@@ -164,10 +167,14 @@ static int sc7280_init(struct snd_soc_pcm_runtime *rtd)
 	switch (cpu_dai->id) {
 	case MI2S_PRIMARY:
 	case LPASS_CDC_DMA_TX3:
+	case TX_CODEC_DMA_TX_3:
 		return sc7280_headset_init(rtd);
 	case LPASS_CDC_DMA_RX0:
 	case LPASS_CDC_DMA_VA_TX0:
 	case MI2S_SECONDARY:
+	case RX_CODEC_DMA_RX_0:
+	case SECONDARY_MI2S_RX:
+	case VA_CODEC_DMA_TX_0:
 		return 0;
 	case LPASS_DP_RX:
 		return sc7280_hdmi_init(rtd);
@@ -195,6 +202,10 @@ static int sc7280_snd_hw_params(struct snd_pcm_substream *substream,
 	switch (cpu_dai->id) {
 	case LPASS_CDC_DMA_TX3:
 	case LPASS_CDC_DMA_RX0:
+	case RX_CODEC_DMA_RX_0:
+	case SECONDARY_MI2S_RX:
+	case TX_CODEC_DMA_TX_3:
+	case VA_CODEC_DMA_TX_0:
 		for_each_rtd_codec_dais(rtd, i, codec_dai) {
 			sruntime = snd_soc_dai_get_stream(codec_dai, substream->stream);
 			if (sruntime != ERR_PTR(-ENOTSUPP))
@@ -245,6 +256,9 @@ static int sc7280_snd_prepare(struct snd_pcm_substream *substream)
 	switch (cpu_dai->id) {
 	case LPASS_CDC_DMA_RX0:
 	case LPASS_CDC_DMA_TX3:
+	case RX_CODEC_DMA_RX_0:
+	case TX_CODEC_DMA_TX_3:
+	case VA_CODEC_DMA_TX_0:
 		return sc7280_snd_swr_prepare(substream);
 	default:
 		break;
@@ -263,6 +277,9 @@ static int sc7280_snd_hw_free(struct snd_pcm_substream *substream)
 	switch (cpu_dai->id) {
 	case LPASS_CDC_DMA_RX0:
 	case LPASS_CDC_DMA_TX3:
+	case RX_CODEC_DMA_RX_0:
+	case TX_CODEC_DMA_TX_3:
+	case VA_CODEC_DMA_TX_0:
 		if (sruntime && data->stream_prepared[cpu_dai->id]) {
 			sdw_disable_stream(sruntime);
 			sdw_deprepare_stream(sruntime);
@@ -291,6 +308,10 @@ static void sc7280_snd_shutdown(struct snd_pcm_substream *substream)
 					       SNDRV_PCM_STREAM_PLAYBACK);
 		}
 		break;
+	case SECONDARY_MI2S_RX:
+		snd_soc_dai_set_sysclk(cpu_dai, Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT,
+					       0, SNDRV_PCM_STREAM_PLAYBACK);
+		break;
 	default:
 		break;
 	}
@@ -298,14 +319,26 @@ static void sc7280_snd_shutdown(struct snd_pcm_substream *substream)
 
 static int sc7280_snd_startup(struct snd_pcm_substream *substream)
 {
+	unsigned int fmt = SND_SOC_DAIFMT_CBS_CFS;
+	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_CBS_CFS;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret = 0;
 
 	switch (cpu_dai->id) {
 	case MI2S_PRIMARY:
 		ret = sc7280_rt5682_init(rtd);
 		break;
+	case SECONDARY_MI2S_RX:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
+
+		snd_soc_dai_set_sysclk(cpu_dai, Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
 	default:
 		break;
 	}
-- 
2.7.4

