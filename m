Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1EA4B0DE9
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 13:52:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EAC818EE;
	Thu, 10 Feb 2022 13:52:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EAC818EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644497575;
	bh=3kgjpZnhZgsA+eDdLfobfStB0JPMyCnUlNaGCAeCP7s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Om5o0cmAVIkQnI5TP9Q5Xpe+6K0uPJTfRxaneQLdK40ri514ht7eaZdUSMLS7bm6G
	 jtZYxc1Irg3JXfafGw4kl2Typj8ZsObYWoYXyrvrjZ1y7fh4a2XuHGUVcuH5Gvo866
	 vk+eJIMAyjDbdnF3hhNlqQmPClG+PMU5HNrBNutM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6776AF80516;
	Thu, 10 Feb 2022 13:51:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D7EAF804AB; Thu, 10 Feb 2022 13:51:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3208F804AB
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 13:51:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3208F804AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="tvN+KnBs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644497477; x=1676033477;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=CtfKZgjswOE5qA2x4o23nBJL1zD+uEdwDe3VnUg3YVQ=;
 b=tvN+KnBs3bFfRC8Dg80Yv1hNKndMyJXt/QL4n7cpxMCWNlJn/vfex9MS
 3jS4DqsZ/I7eTqRe7sDnWj37NiLIZdf0+Dq3/cht7fNtxC+oE2x7OArsT
 s6vU3RNiQnAmfb6flLbyPS/stK7NowderN0ZV0HuTTQ6YdpFV2Emundu+ w=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 10 Feb 2022 04:51:07 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 04:51:06 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 10 Feb 2022 04:50:52 -0800
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 10 Feb 2022 04:50:46 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <plai@codeaurora.org>,
 <bgoswami@codeaurora.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <rohitkr@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>
Subject: [PATCH v9 3/3] ASoC: qcom: SC7280: Add machine driver
Date: Thu, 10 Feb 2022 18:20:15 +0530
Message-ID: <1644497415-25291-4-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644497415-25291-1-git-send-email-quic_srivasam@quicinc.com>
References: <1644497415-25291-1-git-send-email-quic_srivasam@quicinc.com>
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

Add new machine driver to register sound card on sc7280 based targets and
do the required configuration for lpass cpu dai and external codecs
connected over MI2S and soundwire interfaces.
Add support for audio jack detection, soundwire init and MBHC.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
---
 sound/soc/qcom/Kconfig  |  14 +++
 sound/soc/qcom/Makefile |   2 +
 sound/soc/qcom/sc7280.c | 284 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 300 insertions(+)
 create mode 100644 sound/soc/qcom/sc7280.c

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index cf3e151..dd5949e 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -176,4 +176,18 @@ config SND_SOC_SC7180
 	  SC7180 SoC-based systems.
 	  Say Y if you want to use audio device on this SoCs.
 
+config SND_SOC_SC7280
+	tristate "SoC Machine driver for SC7280 boards"
+	depends on I2C && SOUNDWIRE || COMPILE_TEST
+	select SND_SOC_QCOM_COMMON
+	select SND_SOC_LPASS_SC7280
+	select SND_SOC_MAX98357A
+	select SND_SOC_WCD938X
+	select SND_SOC_LPASS_RX_MACRO
+	select SND_SOC_LPASS_TX_MACRO
+	help
+	  Add support for audio on Qualcomm Technologies Inc.
+	  SC7280 SoC-based systems.
+	  Say Y or M if you want to use audio device on this SoCs.
+
 endif #SND_SOC_QCOM
diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
index 1600ae5..625aec6 100644
--- a/sound/soc/qcom/Makefile
+++ b/sound/soc/qcom/Makefile
@@ -19,6 +19,7 @@ snd-soc-storm-objs := storm.o
 snd-soc-apq8016-sbc-objs := apq8016_sbc.o
 snd-soc-apq8096-objs := apq8096.o
 snd-soc-sc7180-objs := sc7180.o
+snd-soc-sc7280-objs := sc7280.o
 snd-soc-sdm845-objs := sdm845.o
 snd-soc-sm8250-objs := sm8250.o
 snd-soc-qcom-common-objs := common.o
@@ -27,6 +28,7 @@ obj-$(CONFIG_SND_SOC_STORM) += snd-soc-storm.o
 obj-$(CONFIG_SND_SOC_APQ8016_SBC) += snd-soc-apq8016-sbc.o
 obj-$(CONFIG_SND_SOC_MSM8996) += snd-soc-apq8096.o
 obj-$(CONFIG_SND_SOC_SC7180) += snd-soc-sc7180.o
+obj-$(CONFIG_SND_SOC_SC7280) += snd-soc-sc7280.o
 obj-$(CONFIG_SND_SOC_SDM845) += snd-soc-sdm845.o
 obj-$(CONFIG_SND_SOC_SM8250) += snd-soc-sm8250.o
 obj-$(CONFIG_SND_SOC_QCOM_COMMON) += snd-soc-qcom-common.o
diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
new file mode 100644
index 0000000..bd0bf9c
--- /dev/null
+++ b/sound/soc/qcom/sc7280.c
@@ -0,0 +1,284 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
+//
+// ALSA SoC Machine driver for sc7280
+
+#include <linux/input.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <sound/core.h>
+#include <sound/jack.h>
+#include <sound/pcm.h>
+#include <sound/soc.h>
+#include <linux/soundwire/sdw.h>
+
+#include "common.h"
+#include "lpass.h"
+
+struct sc7280_snd_data {
+	struct snd_soc_card card;
+	struct sdw_stream_runtime *sruntime[LPASS_MAX_PORTS];
+	struct snd_soc_jack hs_jack;
+	struct snd_soc_jack hdmi_jack;
+	bool jack_setup;
+	bool stream_prepared[LPASS_MAX_PORTS];
+};
+
+static void sc7280_jack_free(struct snd_jack *jack)
+{
+	struct snd_soc_component *component = jack->private_data;
+
+	snd_soc_component_set_jack(component, NULL, NULL);
+}
+
+static int sc7280_headset_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct sc7280_snd_data *pdata = snd_soc_card_get_drvdata(card);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_component *component = codec_dai->component;
+	struct snd_jack *jack;
+	int rval, i;
+
+	if (!pdata->jack_setup) {
+		rval = snd_soc_card_jack_new(card, "Headset Jack",
+					     SND_JACK_HEADSET | SND_JACK_LINEOUT |
+					     SND_JACK_MECHANICAL |
+					     SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+					     SND_JACK_BTN_2 | SND_JACK_BTN_3 |
+					     SND_JACK_BTN_4 | SND_JACK_BTN_5,
+					     &pdata->hs_jack, NULL, 0);
+
+		if (rval < 0) {
+			dev_err(card->dev, "Unable to add Headset Jack\n");
+			return rval;
+		}
+
+		jack = pdata->hs_jack.jack;
+
+		snd_jack_set_key(jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+		snd_jack_set_key(jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
+		snd_jack_set_key(jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
+		snd_jack_set_key(jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
+
+		jack->private_data = component;
+		jack->private_free = sc7280_jack_free;
+		pdata->jack_setup = true;
+	}
+	switch (cpu_dai->id) {
+	case LPASS_CDC_DMA_RX0:
+	case LPASS_CDC_DMA_TX3:
+		for_each_rtd_codec_dais(rtd, i, codec_dai) {
+			rval = snd_soc_component_set_jack(component, &pdata->hs_jack, NULL);
+			if (rval != 0 && rval != -ENOTSUPP) {
+				dev_err(card->dev, "Failed to set jack: %d\n", rval);
+				return rval;
+			}
+		}
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int sc7280_hdmi_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct sc7280_snd_data *pdata = snd_soc_card_get_drvdata(card);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_component *component = codec_dai->component;
+	struct snd_jack *jack;
+	int rval;
+
+	rval = snd_soc_card_jack_new(card, "HDMI Jack",	SND_JACK_LINEOUT,
+				     &pdata->hdmi_jack, NULL, 0);
+
+	if (rval < 0) {
+		dev_err(card->dev, "Unable to add HDMI Jack\n");
+		return rval;
+	}
+
+	jack = pdata->hdmi_jack.jack;
+	jack->private_data = component;
+	jack->private_free = sc7280_jack_free;
+
+	return snd_soc_component_set_jack(component, &pdata->hdmi_jack, NULL);
+}
+
+static int sc7280_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+
+	switch (cpu_dai->id) {
+	case LPASS_CDC_DMA_TX3:
+		return sc7280_headset_init(rtd);
+	case LPASS_CDC_DMA_RX0:
+	case LPASS_CDC_DMA_VA_TX0:
+	case MI2S_SECONDARY:
+		return 0;
+	case LPASS_DP_RX:
+		return sc7280_hdmi_init(rtd);
+	default:
+		dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__, cpu_dai->id);
+	}
+
+	return -EINVAL;
+}
+
+static int sc7280_snd_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *codec_dai;
+	const struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct sc7280_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
+	struct sdw_stream_runtime *sruntime;
+	int i;
+
+	snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_CHANNELS, 2, 2);
+	snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_RATE, 48000, 48000);
+
+	switch (cpu_dai->id) {
+	case LPASS_CDC_DMA_TX3:
+	case LPASS_CDC_DMA_RX0:
+		for_each_rtd_codec_dais(rtd, i, codec_dai) {
+			sruntime = snd_soc_dai_get_stream(codec_dai, substream->stream);
+			if (sruntime != ERR_PTR(-ENOTSUPP))
+				pdata->sruntime[cpu_dai->id] = sruntime;
+		}
+		break;
+	}
+
+	return 0;
+}
+
+static int sc7280_snd_swr_prepare(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	const struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct sc7280_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
+	int ret;
+
+	if (!sruntime)
+		return 0;
+
+	if (data->stream_prepared[cpu_dai->id]) {
+		sdw_disable_stream(sruntime);
+		sdw_deprepare_stream(sruntime);
+		data->stream_prepared[cpu_dai->id] = false;
+	}
+
+	ret = sdw_prepare_stream(sruntime);
+	if (ret)
+		return ret;
+
+	ret = sdw_enable_stream(sruntime);
+	if (ret) {
+		sdw_deprepare_stream(sruntime);
+		return ret;
+	}
+	data->stream_prepared[cpu_dai->id] = true;
+
+	return ret;
+}
+
+static int sc7280_snd_prepare(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	const struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+
+	switch (cpu_dai->id) {
+	case LPASS_CDC_DMA_RX0:
+	case LPASS_CDC_DMA_TX3:
+		return sc7280_snd_swr_prepare(substream);
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int sc7280_snd_hw_free(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct sc7280_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	const struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
+
+	switch (cpu_dai->id) {
+	case LPASS_CDC_DMA_RX0:
+	case LPASS_CDC_DMA_TX3:
+		if (sruntime && data->stream_prepared[cpu_dai->id]) {
+			sdw_disable_stream(sruntime);
+			sdw_deprepare_stream(sruntime);
+			data->stream_prepared[cpu_dai->id] = false;
+		}
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static const struct snd_soc_ops sc7280_ops = {
+	.hw_params = sc7280_snd_hw_params,
+	.hw_free = sc7280_snd_hw_free,
+	.prepare = sc7280_snd_prepare,
+};
+
+static int sc7280_snd_platform_probe(struct platform_device *pdev)
+{
+	struct snd_soc_card *card;
+	struct sc7280_snd_data *data;
+	struct device *dev = &pdev->dev;
+	struct snd_soc_dai_link *link;
+	int ret, i;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	card = &data->card;
+	snd_soc_card_set_drvdata(card, data);
+
+	card->owner = THIS_MODULE;
+	card->driver_name = "SC7280";
+	card->dev = dev;
+
+	ret = qcom_snd_parse_of(card);
+	if (ret)
+		return ret;
+
+	for_each_card_prelinks(card, i, link) {
+		link->init = sc7280_init;
+		link->ops = &sc7280_ops;
+	}
+
+	return devm_snd_soc_register_card(dev, card);
+}
+
+static const struct of_device_id sc7280_snd_device_id[]  = {
+	{ .compatible = "google,sc7280-herobrine" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, sc7280_snd_device_id);
+
+static struct platform_driver sc7280_snd_driver = {
+	.probe = sc7280_snd_platform_probe,
+	.driver = {
+		.name = "msm-snd-sc7280",
+		.of_match_table = sc7280_snd_device_id,
+		.pm = &snd_soc_pm_ops,
+	},
+};
+module_platform_driver(sc7280_snd_driver);
+
+MODULE_DESCRIPTION("sc7280 ASoC Machine Driver");
+MODULE_LICENSE("GPL");
-- 
2.7.4

