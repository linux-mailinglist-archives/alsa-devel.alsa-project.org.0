Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D101467715
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Dec 2021 13:08:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 289CE2297;
	Fri,  3 Dec 2021 13:08:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 289CE2297
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638533338;
	bh=+sh0gHBmV7kGQ3cdMEblPZcWBYe9ZSmHMJfqWcLPidY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FtskI978SAtnu0ZMgs9dJitDW5gbEA2UcqkDj/iKePAtsOdwMiPU9a4E7VFkxv7Mj
	 B1kzoI206vtnc6VoGxAnblCfJvdkdQuJa010KImeluBbrDrmYHISzOuaHC3/9Q4VR0
	 OSuOvAcZhzKqmzEULXNYKtK4OJFt4HXTBIzm2E+Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81CAEF804AA;
	Fri,  3 Dec 2021 13:06:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1110EF8028D; Fri,  3 Dec 2021 13:06:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 263DEF8015B
 for <alsa-devel@alsa-project.org>; Fri,  3 Dec 2021 13:06:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 263DEF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="Ipy4/HbV"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1638533211; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=V1ss3A1UfqIO3ljWeKkXiH+3KmJmzsKx1MYncZY2RO8=;
 b=Ipy4/HbVBwO7P6/RwqzqbgsK3bqEQLZTWqgiErBdzshMpEbxTD9yzvM/xoObJWae6bsF5joP
 Rtw0icUdDimH/Unu5AZfRgx6dBXx+ETamJgQgbwTgA8Do9p3ymjmt6v2LNS40aIhrw0uedYw
 d94Xi3jmHhVjiE8Fr3FI3upUVbY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 61aa085a903341b2e4481d62 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 03 Dec 2021 12:06:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A3F15C43616; Fri,  3 Dec 2021 12:06:50 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7246BC43618;
 Fri,  3 Dec 2021 12:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 7246BC43618
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.com
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.com
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.com>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
Subject: [PATCH v7 2/2] ASoC: qcom: SC7280: Add machine driver
Date: Fri,  3 Dec 2021 17:36:23 +0530
Message-Id: <1638533183-19023-3-git-send-email-srivasam@codeaurora.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1638533183-19023-1-git-send-email-srivasam@codeaurora.com>
References: <1638533183-19023-1-git-send-email-srivasam@codeaurora.com>
Cc: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
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

From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>

Add new machine driver to register sound card on sc7280 based targets and
do the required configuration for lpass cpu dai and external codecs
connected over MI2S and soundwire interfaces.
Add support for audio jack detection, soundwire init and MBHC.

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 sound/soc/qcom/Kconfig  |  14 +++
 sound/soc/qcom/Makefile |   2 +
 sound/soc/qcom/lpass.h  |   1 +
 sound/soc/qcom/sc7280.c | 290 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 307 insertions(+)
 create mode 100644 sound/soc/qcom/sc7280.c

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index cc7c1de..932b082 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -152,4 +152,18 @@ config SND_SOC_SC7180
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
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 67ef497..c0f0247 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -16,6 +16,7 @@
 #include "lpass-hdmi.h"
 
 #define LPASS_AHBIX_CLOCK_FREQUENCY		131072000
+#define LPASS_MAX_PORTS			(LPASS_CDC_DMA_VA_TX8 + 1)
 #define LPASS_MAX_MI2S_PORTS			(8)
 #define LPASS_MAX_DMA_CHANNELS			(8)
 #define LPASS_MAX_HDMI_DMA_CHANNELS		(4)
diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
new file mode 100644
index 0000000..31a77eb
--- /dev/null
+++ b/sound/soc/qcom/sc7280.c
@@ -0,0 +1,290 @@
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
+							SND_JACK_HEADSET | SND_JACK_LINEOUT |
+							SND_JACK_MECHANICAL |
+							SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+							SND_JACK_BTN_2 | SND_JACK_BTN_3 |
+							SND_JACK_BTN_4 | SND_JACK_BTN_5,
+							&pdata->hs_jack, NULL, 0);
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
+
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
+				&pdata->hdmi_jack, NULL, 0);
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
+			sruntime = snd_soc_dai_get_sdw_stream(codec_dai, substream->stream);
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
+static const struct snd_soc_dapm_widget sc7280_snd_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
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
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

