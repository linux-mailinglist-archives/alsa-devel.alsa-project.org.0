Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FFE4B34A5
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Feb 2022 12:28:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 012EF17F8;
	Sat, 12 Feb 2022 12:27:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 012EF17F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644665280;
	bh=uy3kd5buO6Qd335EgwcuOYe/wo9odZXDIQWpZVzDKz0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Va3yoKhMrRQm0dIECwN7mueza7I6pN4yQsqFGe/a/BNax7KRN1L4AaqhCXa7lL+hL
	 4S28tPmqiGGvVF3rdz/KlUKd3dbZGSrCqtCDHU17wf4Ser8h8yMu9vHU2891Sdgdd8
	 ijxgfdQ3feZBa/k8tjwYpatc0J9LO6KBTZPndzEo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3E22F80525;
	Sat, 12 Feb 2022 12:25:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A787DF80520; Sat, 12 Feb 2022 12:25:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34C97F8051E
 for <alsa-devel@alsa-project.org>; Sat, 12 Feb 2022 12:25:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34C97F8051E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="Z5LmG5mq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644665141; x=1676201141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=FFkY61nZpsiSvjL5f/R7EFLkcN0P29ZxCH0NiD7iQfk=;
 b=Z5LmG5mqSlSLTaHUf1jJV/9IrAiHD7RlrzkgdLgES3QeqE9buvC2hxF7
 2R702BDhKToIfxlMNX/SIn0AN3+13yqEx3rZCclBPr7pAbP+3pi/ZOomp
 TqPbyzVe8oTetZDH9HAuUBPyA+HS/10tU7ygKNMatc2ScYCAoMi7ks/K9 s=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 12 Feb 2022 03:25:38 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2022 03:25:37 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Sat, 12 Feb 2022 03:25:37 -0800
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sat, 12 Feb 2022 03:25:32 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@codeaurora.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <rohitkr@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>
Subject: [PATCH v11 04/10] ASoC: qcom: Add helper function to get dma control
 and lpaif handle
Date: Sat, 12 Feb 2022 16:54:47 +0530
Message-ID: <1644665093-4695-5-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644665093-4695-1-git-send-email-quic_srivasam@quicinc.com>
References: <1644665093-4695-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

Add support function to get dma control and lpaif handle to avoid
repeated code in platform driver

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/lpass-platform.c | 113 +++++++++++++++++++++++-----------------
 1 file changed, 66 insertions(+), 47 deletions(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index a44162c..5d77240 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -177,6 +177,49 @@ static int lpass_platform_pcmops_close(struct snd_soc_component *component,
 	return 0;
 }
 
+static void __lpass_get_lpaif_handle(struct snd_pcm_substream *substream,
+				     struct snd_soc_component *component,
+				     struct lpaif_dmactl **dmactl, int *id, struct regmap **map)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
+	struct snd_pcm_runtime *rt = substream->runtime;
+	struct lpass_pcm_data *pcm_data = rt->private_data;
+	struct lpass_variant *v = drvdata->variant;
+	int dir = substream->stream;
+	unsigned int dai_id = cpu_dai->driver->id;
+	struct lpaif_dmactl *l_dmactl = NULL;
+	struct regmap *l_map = NULL;
+	int l_id = 0;
+
+	switch (dai_id) {
+	case MI2S_PRIMARY ... MI2S_QUINARY:
+		if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+			l_id = pcm_data->dma_ch;
+			l_dmactl = drvdata->rd_dmactl;
+		} else {
+			l_dmactl = drvdata->wr_dmactl;
+			l_id = pcm_data->dma_ch - v->wrdma_channel_start;
+		}
+		l_map = drvdata->lpaif_map;
+		break;
+	case LPASS_DP_RX:
+		l_id = pcm_data->dma_ch;
+		l_dmactl = drvdata->hdmi_rd_dmactl;
+		l_map = drvdata->hdmiif_map;
+		break;
+	default:
+		break;
+	}
+	if (dmactl)
+		*dmactl = l_dmactl;
+	if (id)
+		*id = l_id;
+	if (map)
+		*map = l_map;
+}
+
 static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 					   struct snd_pcm_substream *substream,
 					   struct snd_pcm_hw_params *params)
@@ -191,21 +234,15 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 	unsigned int channels = params_channels(params);
 	unsigned int regval;
 	struct lpaif_dmactl *dmactl;
-	int id, dir = substream->stream;
+	int id;
 	int bitwidth;
 	int ret, dma_port = pcm_data->i2s_port + v->dmactl_audif_start;
 	unsigned int dai_id = cpu_dai->driver->id;
 
-	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
-		id = pcm_data->dma_ch;
-		if (dai_id == LPASS_DP_RX)
-			dmactl = drvdata->hdmi_rd_dmactl;
-		else
-			dmactl = drvdata->rd_dmactl;
-
-	} else {
-		dmactl = drvdata->wr_dmactl;
-		id = pcm_data->dma_ch - v->wrdma_channel_start;
+	__lpass_get_lpaif_handle(substream, component, &dmactl, &id, NULL);
+	if (!dmactl) {
+		dev_err(soc_runtime->dev, "failed to get dmactl handle\n");
+		return -EINVAL;
 	}
 
 	bitwidth = snd_pcm_format_width(format);
@@ -350,10 +387,11 @@ static int lpass_platform_pcmops_hw_free(struct snd_soc_component *component,
 	struct regmap *map;
 	unsigned int dai_id = cpu_dai->driver->id;
 
-	if (dai_id == LPASS_DP_RX)
-		map = drvdata->hdmiif_map;
-	else
-		map = drvdata->lpaif_map;
+	__lpass_get_lpaif_handle(substream, component, NULL, NULL, &map);
+	if (!map) {
+		dev_err(soc_runtime->dev, "failed to get dmactl handle\n");
+		return -EINVAL;
+	}
 
 	reg = LPAIF_DMACTL_REG(v, pcm_data->dma_ch, substream->stream, dai_id);
 	ret = regmap_write(map, reg, 0);
@@ -379,22 +417,12 @@ static int lpass_platform_pcmops_prepare(struct snd_soc_component *component,
 	int ret, id, ch, dir = substream->stream;
 	unsigned int dai_id = cpu_dai->driver->id;
 
-
 	ch = pcm_data->dma_ch;
-	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
-		if (dai_id == LPASS_DP_RX) {
-			dmactl = drvdata->hdmi_rd_dmactl;
-			map = drvdata->hdmiif_map;
-		} else {
-			dmactl = drvdata->rd_dmactl;
-			map = drvdata->lpaif_map;
-		}
 
-		id = pcm_data->dma_ch;
-	} else {
-		dmactl = drvdata->wr_dmactl;
-		id = pcm_data->dma_ch - v->wrdma_channel_start;
-		map = drvdata->lpaif_map;
+	__lpass_get_lpaif_handle(substream, component, &dmactl, &id, &map);
+	if (!dmactl) {
+		dev_err(soc_runtime->dev, "failed to get dmactl handle\n");
+		return -EINVAL;
 	}
 
 	ret = regmap_write(map, LPAIF_DMABASE_REG(v, ch, dir, dai_id),
@@ -444,25 +472,15 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 	struct lpaif_dmactl *dmactl;
 	struct regmap *map;
 	int ret, ch, id;
-	int dir = substream->stream;
 	unsigned int reg_irqclr = 0, val_irqclr = 0;
 	unsigned int  reg_irqen = 0, val_irqen = 0, val_mask = 0;
 	unsigned int dai_id = cpu_dai->driver->id;
 
 	ch = pcm_data->dma_ch;
-	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
-		id = pcm_data->dma_ch;
-		if (dai_id == LPASS_DP_RX) {
-			dmactl = drvdata->hdmi_rd_dmactl;
-			map = drvdata->hdmiif_map;
-		} else {
-			dmactl = drvdata->rd_dmactl;
-			map = drvdata->lpaif_map;
-		}
-	} else {
-		dmactl = drvdata->wr_dmactl;
-		id = pcm_data->dma_ch - v->wrdma_channel_start;
-		map = drvdata->lpaif_map;
+	__lpass_get_lpaif_handle(substream, component, &dmactl, &id, &map);
+	if (!dmactl) {
+		dev_err(soc_runtime->dev, "failed to get dmactl handle\n");
+		return -EINVAL;
 	}
 
 	switch (cmd) {
@@ -597,10 +615,11 @@ static snd_pcm_uframes_t lpass_platform_pcmops_pointer(
 	struct regmap *map;
 	unsigned int dai_id = cpu_dai->driver->id;
 
-	if (dai_id == LPASS_DP_RX)
-		map = drvdata->hdmiif_map;
-	else
-		map = drvdata->lpaif_map;
+	__lpass_get_lpaif_handle(substream, component, NULL, NULL, &map);
+	if (!map) {
+		dev_err(soc_runtime->dev, "failed to get dmactl handle\n");
+		return -EINVAL;
+	}
 
 	ch = pcm_data->dma_ch;
 
-- 
2.7.4

