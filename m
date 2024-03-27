Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A027388DC9E
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 12:34:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF97F2C24;
	Wed, 27 Mar 2024 12:34:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF97F2C24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711539279;
	bh=ZmZY4klLx60T3u+pxYJnT+s1JREgAnxFC27meQibGHo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OwwOSPJPDO9TB3SfCu962JFSC4Uq9lL7B5iDYJdpYgZwSYLyeDTNO8H4QDkVtrMm7
	 UViQ5V1fDCUQxzytaZ8oHVxI2w2sgsajv2TlXqHTHM2qHDgYHqDLR2MWn17kIyJXpc
	 vajUA5UxfqdKWBRKoJUsMFYayg4MbLdQhwvw5OyU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11C7BF805D5; Wed, 27 Mar 2024 12:33:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47333F80570;
	Wed, 27 Mar 2024 12:33:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5028F802DB; Wed, 27 Mar 2024 12:33:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF29AF80093
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 12:33:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF29AF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=YA8pe27b
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42RAZM3E023786;
	Wed, 27 Mar 2024 11:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=snMIH5GFrI8kPEs9bEqq+/1eqkN3sd/QEbs6jLOH8UM=; b=YA
	8pe27bBy/A0E3nofalczo9lW+2+2S6ZxOeNx6C+3PxJ4zQK8sglAZJwxsfIauj/6
	Nvny/QjrImQN2BcemXkpSZUZv5bI9lnNheKIrgj2Ln2IEBbDJLv/FvIEM65+O+ev
	TzcDX8NzGwlp2yaPcdXDta9fHKG3Ch3GgjiMeHhLYLmPscelqoE1dAHv+FDAp6qB
	qpPPj6pF6fqAs3Y8hKSmmhcvA9tq6aOUvZVmWiE1JzQ4IsWH47J8wJLQl5EYwodr
	eCGfQvL9qlydHxNzlhEj0kN7hJeBjRe6F/QuXaDa6QCirrVcGmVj7TWcsmEitWuu
	YQNbq9yvr55yuvOEJ90g==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x4hu2r4e4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Mar 2024 11:33:34 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 42RBXXLw000457
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Mar 2024 11:33:33 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 27 Mar 2024 04:33:29 -0700
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <bgoswami@quicinc.com>,
        <broonie@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <lgirdwood@gmail.com>, <tiwai@suse.com>, <quic_rohkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
CC: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v1 2/2] ASoC: qcom: qcm6490: Add machine driver for qcm6490
Date: Wed, 27 Mar 2024 17:02:28 +0530
Message-ID: <20240327113228.1706975-3-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240327113228.1706975-1-quic_mohs@quicinc.com>
References: <20240327113228.1706975-1-quic_mohs@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: iKC408_5rAsw8AZoUPNKKH92s9V9FzS3
X-Proofpoint-GUID: iKC408_5rAsw8AZoUPNKKH92s9V9FzS3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-27_08,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403270078
Message-ID-Hash: 6SSCLVEZUG7R7WRZSWLM6VJ4BZZVJK5Z
X-Message-ID-Hash: 6SSCLVEZUG7R7WRZSWLM6VJ4BZZVJK5Z
X-MailFrom: quic_mohs@quicinc.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6SSCLVEZUG7R7WRZSWLM6VJ4BZZVJK5Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add machine driver for qcm6490 SoC.

This initial supports which includes WSA883x Speakers with onboard DMIC
connected to internal LPASS codec via VA macros respectively and also
WCD937x based headset.

Add compatible for sound card on Qualcomm qcs6490 boards.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
---
 sound/soc/qcom/Kconfig   |  13 +++
 sound/soc/qcom/Makefile  |   2 +
 sound/soc/qcom/qcm6490.c | 173 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 188 insertions(+)
 create mode 100644 sound/soc/qcom/qcm6490.c

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index 762491d6f2f2..0bc536766872 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -151,6 +151,19 @@ config SND_SOC_MSM8996
 	  APQ8096 SoC-based systems.
 	  Say Y if you want to use audio device on this SoCs
 
+config SND_SOC_QCM6490
+	tristate "SoC Machine driver for QCM6490 boards"
+	depends on QCOM_APR && SOUNDWIRE
+	depends on COMMON_CLK
+	select SND_SOC_QDSP6
+	select SND_SOC_QCOM_COMMON
+	select SND_SOC_QCOM_SDW
+	help
+	  Add support for audio on Qualcomm Technologies Inc.
+	  QCM6490 SoC-based systems.
+	  To compile this driver say Y or M if you want to
+	  use audio device on this SoCs.
+
 config SND_SOC_SDM845
 	tristate "SoC Machine driver for SDM845 boards"
 	depends on QCOM_APR && I2C && SOUNDWIRE
diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
index 34f3fcb8ee9a..feb2c164be69 100644
--- a/sound/soc/qcom/Makefile
+++ b/sound/soc/qcom/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_SND_SOC_LPASS_SC7280) += snd-soc-lpass-sc7280.o
 snd-soc-storm-objs := storm.o
 snd-soc-apq8016-sbc-objs := apq8016_sbc.o
 snd-soc-apq8096-objs := apq8096.o
+snd-soc-qcm6490-objs := qcm6490.o
 snd-soc-sc7180-objs := sc7180.o
 snd-soc-sc7280-objs := sc7280.o
 snd-soc-sdm845-objs := sdm845.o
@@ -34,6 +35,7 @@ snd-soc-x1e80100-objs := x1e80100.o
 obj-$(CONFIG_SND_SOC_STORM) += snd-soc-storm.o
 obj-$(CONFIG_SND_SOC_APQ8016_SBC) += snd-soc-apq8016-sbc.o
 obj-$(CONFIG_SND_SOC_MSM8996) += snd-soc-apq8096.o
+obj-$(CONFIG_SND_SOC_QCM6490) += snd-soc-qcm6490.o
 obj-$(CONFIG_SND_SOC_SC7180) += snd-soc-sc7180.o
 obj-$(CONFIG_SND_SOC_SC7280) += snd-soc-sc7280.o
 obj-$(CONFIG_SND_SOC_SC8280XP) += snd-soc-sc8280xp.o
diff --git a/sound/soc/qcom/qcm6490.c b/sound/soc/qcom/qcm6490.c
new file mode 100644
index 000000000000..5b0dc95963f5
--- /dev/null
+++ b/sound/soc/qcom/qcm6490.c
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <linux/input.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of_device.h>
+#include <sound/core.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <sound/pcm.h>
+#include <linux/soundwire/sdw.h>
+#include <sound/jack.h>
+#include <sound/pcm_params.h>
+#include "lpass.h"
+#include "qdsp6/q6afe.h"
+#include "common.h"
+#include "sdw.h"
+
+struct qcm6490_snd_data {
+	bool stream_prepared[AFE_PORT_MAX];
+	struct snd_soc_card *card;
+	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
+	struct snd_soc_jack jack;
+	bool jack_setup;
+};
+
+static int qcm6490_snd_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct qcm6490_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+
+	switch (cpu_dai->id) {
+	case TX_CODEC_DMA_TX_3:
+	case LPASS_CDC_DMA_TX3:
+	case RX_CODEC_DMA_RX_0:
+		return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
+	case VA_CODEC_DMA_TX_0:
+	case WSA_CODEC_DMA_RX_0:
+		return 0;
+	default:
+		dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__, cpu_dai->id);
+	}
+
+	return -EINVAL;
+}
+
+static int qcm6490_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
+				      struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_interval *rate = hw_param_interval(params,
+					SNDRV_PCM_HW_PARAM_RATE);
+	struct snd_interval *channels = hw_param_interval(params,
+					SNDRV_PCM_HW_PARAM_CHANNELS);
+
+	rate->min = 48000;
+	rate->max = 48000;
+	channels->min = 2;
+	channels->max = 2;
+	switch (cpu_dai->id) {
+	case TX_CODEC_DMA_TX_0:
+	case TX_CODEC_DMA_TX_1:
+	case TX_CODEC_DMA_TX_2:
+	case TX_CODEC_DMA_TX_3:
+		channels->min = 1;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int qcm6490_snd_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct qcm6490_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
+
+	return qcom_snd_sdw_hw_params(substream, params, &pdata->sruntime[cpu_dai->id]);
+}
+
+static int qcm6490_snd_prepare(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct qcm6490_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
+
+	return qcom_snd_sdw_prepare(substream, sruntime,
+				    &data->stream_prepared[cpu_dai->id]);
+}
+
+static int qcm6490_snd_hw_free(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct qcm6490_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
+
+	return qcom_snd_sdw_hw_free(substream, sruntime,
+				    &data->stream_prepared[cpu_dai->id]);
+}
+
+static const struct snd_soc_ops qcm6490_be_ops = {
+	.hw_params = qcm6490_snd_hw_params,
+	.hw_free = qcm6490_snd_hw_free,
+	.prepare = qcm6490_snd_prepare,
+};
+
+static void qcm6490_add_be_ops(struct snd_soc_card *card)
+{
+	struct snd_soc_dai_link *link;
+	int i;
+
+	for_each_card_prelinks(card, i, link) {
+		if (link->no_pcm == 1) {
+			link->init = qcm6490_snd_init;
+			link->be_hw_params_fixup = qcm6490_be_hw_params_fixup;
+			link->ops = &qcm6490_be_ops;
+		}
+	}
+}
+
+static int qcm6490_platform_probe(struct platform_device *pdev)
+{
+	struct snd_soc_card *card;
+	struct qcm6490_snd_data *data;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
+	if (!card)
+		return -ENOMEM;
+	card->owner = THIS_MODULE;
+	/* Allocate the private data */
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	card->dev = dev;
+	dev_set_drvdata(dev, card);
+	snd_soc_card_set_drvdata(card, data);
+	ret = qcom_snd_parse_of(card);
+	if (ret)
+		return ret;
+
+	card->driver_name = of_device_get_match_data(dev);
+	qcm6490_add_be_ops(card);
+	return devm_snd_soc_register_card(dev, card);
+}
+
+static const struct of_device_id snd_qcm6490_dt_match[] = {
+	{.compatible = "qcom,qcm6490-sndcard", "qcm6490"},
+	{.compatible = "qcom,qcs6490-sndcard", "qcs6490"},
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, snd_qcm6490_dt_match);
+
+static struct platform_driver snd_qcm6490_driver = {
+	.probe  = qcm6490_platform_probe,
+	.driver = {
+		.name = "snd-qcm6490",
+		.of_match_table = snd_qcm6490_dt_match,
+	},
+};
+module_platform_driver(snd_qcm6490_driver);
+MODULE_DESCRIPTION("qcm6490 ASoC Machine Driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

