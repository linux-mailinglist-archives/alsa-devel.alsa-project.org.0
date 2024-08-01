Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 425B0943E84
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 03:24:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDB212F90;
	Thu,  1 Aug 2024 03:23:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDB212F90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722475421;
	bh=r8ezgd/Gmc5A7vJyIKzsQe/Jd6XDu0X6ef4rKrjqv4k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C2Ry8VaPmRbgCY6MgT9VOdjob3agclRNGW4di2qsk2N6zBHdyvGYnJxj98XLF9p66
	 5qXfSB2u9c3Vik0iXZdBXQTgS8rlnf7lkS57UvZMEfDdwPZLyFVGHoUrFwrPkTuHFI
	 9Ei1VX3Q7Gn3fGDIsaQlh8pgOWt1cQVZBWaxPKkg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 449A3F8070C; Thu,  1 Aug 2024 03:21:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83F50F806E2;
	Thu,  1 Aug 2024 03:21:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCAF6F80588; Thu,  1 Aug 2024 03:18:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06AE2F80579
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 03:17:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06AE2F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=dCTBFzHN
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 46VDMNfP024000;
	Thu, 1 Aug 2024 01:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TtSFz3KykgXNQPcTeqAGcPRM
	SpuLyxaV/c5izHrloGo=; b=dCTBFzHNxw4yLNky2bpOwiL7Kspc/6dA5ClRm+W2
	D5lyVir9JIXU8wJRnuusmlVi8l1dBt8bolCbeKyRyt/EIIn7qt/BQF+yVdDtt726
	VyqFx60NwYjDV3wvZtwPisRCv/h9WqfIqDPXp5PWeI2Gh8a4jeXzL5OkJHBzEnHv
	DZ37zXQpiIYF0qVYR0qh5BOoco/ILMR/R9I9gcCr4crP2uLKdqXW0p3RRxXjvAC0
	gX4HCr8eyYD6lVWyu/jW7u1NXaMQOzKqITs5x6s8o0s8E/2EXD3fSbU6e05np8O8
	ldlE6MruExkbzv4u71TOevZOo1uuwYBPyrNtvidw/5gKFQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40pw456g11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 01:17:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 4711HkF0020154
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Aug 2024 01:17:46 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 31 Jul 2024 18:17:46 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <broonie@kernel.org>, <lgirdwood@gmail.com>, <krzk+dt@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <gregkh@linuxfoundation.org>, <robh@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v24 18/34] ASoC: qcom: qdsp6: Add headphone jack for offload
 connection status
Date: Wed, 31 Jul 2024 18:17:14 -0700
Message-ID: <20240801011730.4797-19-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240801011730.4797-1-quic_wcheng@quicinc.com>
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 7om5ZiYWEK0ZmUjLk1DfeSvQWei8eahG
X-Proofpoint-ORIG-GUID: 7om5ZiYWEK0ZmUjLk1DfeSvQWei8eahG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_11,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408010005
Message-ID-Hash: FJN5YPCI25YRI32EIAPX3EU36NAJFDIU
X-Message-ID-Hash: FJN5YPCI25YRI32EIAPX3EU36NAJFDIU
X-MailFrom: quic_wcheng@quicinc.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FJN5YPCI25YRI32EIAPX3EU36NAJFDIU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The headphone jack framework has a well defined infrastructure for
notifying userspace entities through input devices.  Expose a jack device
that carries information about if an offload capable device is connected.
Applications can further identify specific offloading information through
other SND kcontrols.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/soc/qcom/Kconfig             |  5 +++
 sound/soc/qcom/Makefile            |  2 ++
 sound/soc/qcom/qdsp6/q6usb.c       | 40 +++++++++++++++++++++
 sound/soc/qcom/sm8250.c            | 23 +++++++++++-
 sound/soc/qcom/usb_offload_utils.c | 56 ++++++++++++++++++++++++++++++
 sound/soc/qcom/usb_offload_utils.h | 29 ++++++++++++++++
 6 files changed, 154 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/qcom/usb_offload_utils.c
 create mode 100644 sound/soc/qcom/usb_offload_utils.h

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index a1beafe2b1dd..e5284a93cf9a 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -118,9 +118,14 @@ config SND_SOC_QDSP6_PRM
 	tristate
 	select SND_SOC_QDSP6_PRM_LPASS_CLOCKS
 
+config SND_SOC_QCOM_OFFLOAD_UTILS
+	tristate
+
 config SND_SOC_QDSP6_USB
     tristate "SoC ALSA USB offloading backing for QDSP6"
     depends on SND_SOC_USB
+    select SND_SOC_QCOM_OFFLOAD_UTILS
+
     help
       Adds support for USB offloading for QDSP6 ASoC
       based platform sound cards.  This will enable the
diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
index 16db7b53ddac..985ce2ae286b 100644
--- a/sound/soc/qcom/Makefile
+++ b/sound/soc/qcom/Makefile
@@ -30,6 +30,7 @@ snd-soc-sc8280xp-y := sc8280xp.o
 snd-soc-qcom-common-y := common.o
 snd-soc-qcom-sdw-y := sdw.o
 snd-soc-x1e80100-y := x1e80100.o
+snd-soc-qcom-offload-utils-objs := usb_offload_utils.o
 
 obj-$(CONFIG_SND_SOC_STORM) += snd-soc-storm.o
 obj-$(CONFIG_SND_SOC_APQ8016_SBC) += snd-soc-apq8016-sbc.o
@@ -42,6 +43,7 @@ obj-$(CONFIG_SND_SOC_SM8250) += snd-soc-sm8250.o
 obj-$(CONFIG_SND_SOC_QCOM_COMMON) += snd-soc-qcom-common.o
 obj-$(CONFIG_SND_SOC_QCOM_SDW) += snd-soc-qcom-sdw.o
 obj-$(CONFIG_SND_SOC_X1E80100) += snd-soc-x1e80100.o
+obj-$(CONFIG_SND_SOC_QCOM_OFFLOAD_UTILS) += snd-soc-qcom-offload-utils.o
 
 #DSP lib
 obj-$(CONFIG_SND_SOC_QDSP6) += qdsp6/
diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index 9a46532e8c16..36c441d621fb 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -14,6 +14,7 @@
 #include <linux/slab.h>
 
 #include <sound/asound.h>
+#include <sound/jack.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/q6usboffload.h>
@@ -30,6 +31,7 @@
 struct q6usb_port_data {
 	struct q6afe_usb_cfg usb_cfg;
 	struct snd_soc_usb *usb;
+	struct snd_soc_jack *hs_jack;
 	struct q6usb_offload priv;
 	struct mutex mutex;
 	struct list_head devices;
@@ -135,14 +137,51 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
 	mutex_lock(&data->mutex);
 	if (connected) {
 		/* Selects the latest USB headset plugged in for offloading */
+		if (data->hs_jack && list_empty(&data->devices))
+			snd_jack_report(data->hs_jack->jack, 1);
+
 		list_add_tail(&sdev->list, &data->devices);
 	} else {
 		list_del(&sdev->list);
+
+		if (data->hs_jack && list_empty(&data->devices))
+			snd_jack_report(data->hs_jack->jack, 0);
 	}
 	mutex_unlock(&data->mutex);
 
 	return 0;
 }
+static void q6usb_component_disable_jack(struct q6usb_port_data *data)
+{
+	/* Offload jack has already been disabled */
+	if (!data->hs_jack)
+		return;
+
+	snd_jack_report(data->hs_jack->jack, 0);
+	data->hs_jack = NULL;
+}
+
+static void q6usb_component_enable_jack(struct q6usb_port_data *data,
+				struct snd_soc_jack *jack)
+{
+	snd_jack_report(jack->jack, !list_empty(&data->devices) ? 1 : 0);
+	data->hs_jack = jack;
+}
+
+static int q6usb_component_set_jack(struct snd_soc_component *component,
+			struct snd_soc_jack *jack, void *priv)
+{
+	struct q6usb_port_data *data = dev_get_drvdata(component->dev);
+
+	mutex_lock(&data->mutex);
+	if (jack)
+		q6usb_component_enable_jack(data, jack);
+	else
+		q6usb_component_disable_jack(data);
+	mutex_unlock(&data->mutex);
+
+	return 0;
+}
 
 static int q6usb_component_probe(struct snd_soc_component *component)
 {
@@ -171,6 +210,7 @@ static void q6usb_component_remove(struct snd_soc_component *component)
 
 static const struct snd_soc_component_driver q6usb_dai_component = {
 	.probe = q6usb_component_probe,
+	.set_jack = q6usb_component_set_jack,
 	.remove = q6usb_component_remove,
 	.name = "q6usb-dai-component",
 	.dapm_widgets = q6usb_dai_widgets,
diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index a15dafb99b33..a132a814ceb4 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -12,6 +12,7 @@
 #include <linux/input-event-codes.h>
 #include "qdsp6/q6afe.h"
 #include "common.h"
+#include "usb_offload_utils.h"
 #include "sdw.h"
 
 #define DRIVER_NAME		"sm8250"
@@ -22,14 +23,33 @@ struct sm8250_snd_data {
 	struct snd_soc_card *card;
 	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
 	struct snd_soc_jack jack;
+	struct snd_soc_jack usb_offload_jack;
+	bool usb_offload_jack_setup;
 	bool jack_setup;
 };
 
 static int sm8250_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	int ret;
+
+	if (cpu_dai->id == USB_RX)
+		ret = qcom_snd_usb_offload_jack_setup(rtd, &data->usb_offload_jack,
+						&data->usb_offload_jack_setup);
+	else
+		ret = qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
+	return ret;
+}
+
+static void sm8250_snd_exit(struct snd_soc_pcm_runtime *rtd)
+{
+	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+
+	if (cpu_dai->id == USB_RX)
+		qcom_snd_usb_offload_jack_remove(rtd, &data->usb_offload_jack_setup);
 
-	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 }
 
 static int sm8250_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
@@ -129,6 +149,7 @@ static void sm8250_add_be_ops(struct snd_soc_card *card)
 	for_each_card_prelinks(card, i, link) {
 		if (link->no_pcm == 1) {
 			link->init = sm8250_snd_init;
+			link->exit = sm8250_snd_exit;
 			link->be_hw_params_fixup = sm8250_be_hw_params_fixup;
 			link->ops = &sm8250_be_ops;
 		}
diff --git a/sound/soc/qcom/usb_offload_utils.c b/sound/soc/qcom/usb_offload_utils.c
new file mode 100644
index 000000000000..2d35d87d1519
--- /dev/null
+++ b/sound/soc/qcom/usb_offload_utils.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <linux/module.h>
+#include <sound/jack.h>
+#include <sound/soc-usb.h>
+
+#include "usb_offload_utils.h"
+
+int qcom_snd_usb_offload_jack_setup(struct snd_soc_pcm_runtime *rtd,
+			    struct snd_soc_jack *jack, bool *jack_setup)
+{
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	int ret = 0;
+
+	if (cpu_dai->id != USB_RX)
+		return -EINVAL;
+
+	if (!*jack_setup) {
+		ret = snd_soc_usb_setup_offload_jack(codec_dai->component, jack);
+		if (ret)
+			return ret;
+	}
+
+	*jack_setup = true;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_usb_offload_jack_setup);
+
+int qcom_snd_usb_offload_jack_remove(struct snd_soc_pcm_runtime *rtd,
+					bool *jack_setup)
+{
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	int ret = 0;
+
+	if (cpu_dai->id != USB_RX)
+		return -EINVAL;
+
+	if (*jack_setup) {
+		ret = snd_soc_usb_disable_offload_jack(codec_dai->component);
+		if (ret)
+			return ret;
+	}
+
+	*jack_setup = false;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_usb_offload_jack_remove);
+MODULE_DESCRIPTION("ASoC Q6 USB offload controls");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/qcom/usb_offload_utils.h b/sound/soc/qcom/usb_offload_utils.h
new file mode 100644
index 000000000000..d44f78569b47
--- /dev/null
+++ b/sound/soc/qcom/usb_offload_utils.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#ifndef __QCOM_SND_USB_OFFLOAD_UTILS_H__
+#define __QCOM_SND_USB_OFFLOAD_UTILS_H__
+
+#include <sound/soc.h>
+
+#if IS_ENABLED(CONFIG_SND_SOC_QCOM_OFFLOAD_UTILS)
+int qcom_snd_usb_offload_jack_setup(struct snd_soc_pcm_runtime *rtd,
+			    struct snd_soc_jack *jack, bool *jack_setup);
+
+int qcom_snd_usb_offload_jack_remove(struct snd_soc_pcm_runtime *rtd,
+					bool *jack_setup);
+#else
+static inline int qcom_snd_usb_offload_jack_setup(struct snd_soc_pcm_runtime *rtd,
+			    struct snd_soc_jack *jack, bool *jack_setup)
+{
+	return -ENODEV;
+}
+
+static inline int qcom_snd_usb_offload_jack_remove(struct snd_soc_pcm_runtime *rtd,
+							bool *jack_setup)
+{
+	return -ENODEV;
+}
+#endif /* IS_ENABLED(CONFIG_SND_SOC_QCOM_OFFLOAD_UTILS) */
+#endif /* __QCOM_SND_USB_OFFLOAD_UTILS_H__ */
