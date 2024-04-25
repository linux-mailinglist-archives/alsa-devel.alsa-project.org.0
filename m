Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 083D58B2C81
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 00:02:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A3C2DEC;
	Fri, 26 Apr 2024 00:02:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A3C2DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714082541;
	bh=AN/XgXmoDQDKQCkIKxg7LAaiRm5YSKCvNyan7MC6Bmo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lzEaaNby4Lhn8TcjWnegG8jItewh3kyFhYQ107ElpcB5Nt+0vsM50lxWwSnCQwUAN
	 jU19J8917naaQIS7Iv4QnjvmTYkNAXD6+vXott4YmblB79bloyHXaZ0jNK/Vi1zEH1
	 0JApHFyUbDb3x04b/a88tTRt1OKL/mN9TXVVKR+I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EE8EF897ED; Thu, 25 Apr 2024 23:55:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4770DF897F5;
	Thu, 25 Apr 2024 23:55:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C58D0F806E3; Thu, 25 Apr 2024 23:54:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0303F805B0
	for <alsa-devel@alsa-project.org>; Thu, 25 Apr 2024 23:51:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0303F805B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=hviN/5WJ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43PLf4fq022983;
	Thu, 25 Apr 2024 21:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=+gRV719uqSc7oMUSU9Bc
	8q0Q3IEefQWBi7497D++R6I=; b=hviN/5WJWUmG2uCKACI+bvS6vb//MWHOgEeH
	yvFXCJ5kvyUysapblKEGwytgdzzvVtc9paBnKP44kKvfg9rgiycwiGvAvXjUp1W2
	l9/HoVsNEihZ0YB0FstCR1dHSvP/jPZQ6Oq1+si935viOnyYKoxxmY2ylRb7nu7J
	B+ajYw1QOdYqKRGWlAHPj9w/0BOKnmrdGoe7wXXVx084l3B31OL94eXAGM6/Zt41
	w7DHoWjtI4nOO4RqCKynnG1/5eNp6gHc2NPtdVvcs/AcVFl6/heB7TAg3oj1Vei8
	+99T51iJ5T9MkAKuRmGcAJ/bJQvkyD+yG18klvu4HCS4R2bNTw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqenkks45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:51:48 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 43PLplVY008051
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:51:47 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 25 Apr 2024 14:51:46 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v20 36/41] ALSA: usb-audio: Add USB offloading capable
 kcontrol
Date: Thu, 25 Apr 2024 14:51:20 -0700
Message-ID: <20240425215125.29761-37-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240425215125.29761-1-quic_wcheng@quicinc.com>
References: <20240425215125.29761-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: FnV47REiXYbGCHFe6mgzdp8o-6yZ6-oH
X-Proofpoint-GUID: FnV47REiXYbGCHFe6mgzdp8o-6yZ6-oH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_21,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250159
Message-ID-Hash: YPFIOFHYA5U5RUVWUXQKTO75AN3RMUBY
X-Message-ID-Hash: YPFIOFHYA5U5RUVWUXQKTO75AN3RMUBY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YPFIOFHYA5U5RUVWUXQKTO75AN3RMUBY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In order to allow userspace/applications know about USB offloading status,
expose a sound kcontrol that fetches information about which sound card
index is associated with the ASoC platform card supporting offloading.  In
the USB audio offloading framework, the ASoC BE DAI link is the entity
responsible for registering to the SOC USB layer.  SOC USB will expose more
details about the current offloading status, which includes the USB sound
card and USB PCM device indexes currently being used.

It is expected for the USB offloading driver to add the kcontrol to the
sound card associated with the USB audio device.  An example output would
look like:

tinymix -D 1 get 'USB Offload Playback Capable Card'
0 (range -1->32)

Ths example signifies that card#0 has an USB offload capable path
available.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/usb/Kconfig                  | 10 +++++
 sound/usb/qcom/Makefile            |  6 ++-
 sound/usb/qcom/mixer_usb_offload.c | 65 ++++++++++++++++++++++++++++++
 sound/usb/qcom/mixer_usb_offload.h | 17 ++++++++
 sound/usb/qcom/qc_audio_offload.c  |  3 ++
 5 files changed, 100 insertions(+), 1 deletion(-)
 create mode 100644 sound/usb/qcom/mixer_usb_offload.c
 create mode 100644 sound/usb/qcom/mixer_usb_offload.h

diff --git a/sound/usb/Kconfig b/sound/usb/Kconfig
index 5cc3eaf53e6b..1228be3c1f83 100644
--- a/sound/usb/Kconfig
+++ b/sound/usb/Kconfig
@@ -176,6 +176,16 @@ config SND_BCD2000
 	  To compile this driver as a module, choose M here: the module
 	  will be called snd-bcd2000.
 
+config SND_USB_QC_OFFLOAD_MIXER
+	bool "Qualcomm USB Audio Offload mixer control"
+	help
+	 Say Y to enable the Qualcomm USB audio offloading mixer controls.
+	 This exposes an USB offload capable kcontrol to signal to
+	 applications about which platform sound card can support USB
+	 audio offload.  This can potentially be used to fetch further
+	 information about the offloading status from the platform sound
+	 card.
+
 config SND_USB_AUDIO_QMI
 	tristate "Qualcomm Audio Offload driver"
 	depends on QCOM_QMI_HELPERS && SND_USB_AUDIO && USB_XHCI_SIDEBAND && SND_SOC_USB
diff --git a/sound/usb/qcom/Makefile b/sound/usb/qcom/Makefile
index a81c9b28d484..eada5cd7b71f 100644
--- a/sound/usb/qcom/Makefile
+++ b/sound/usb/qcom/Makefile
@@ -1,2 +1,6 @@
 snd-usb-audio-qmi-objs := usb_audio_qmi_v01.o qc_audio_offload.o
-obj-$(CONFIG_SND_USB_AUDIO_QMI) += snd-usb-audio-qmi.o
\ No newline at end of file
+obj-$(CONFIG_SND_USB_AUDIO_QMI) += snd-usb-audio-qmi.o
+
+ifneq ($(CONFIG_SND_USB_QC_OFFLOAD_MIXER),)
+snd-usb-audio-qmi-objs += mixer_usb_offload.o
+endif
\ No newline at end of file
diff --git a/sound/usb/qcom/mixer_usb_offload.c b/sound/usb/qcom/mixer_usb_offload.c
new file mode 100644
index 000000000000..cd6e5600e795
--- /dev/null
+++ b/sound/usb/qcom/mixer_usb_offload.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/usb.h>
+
+#include <sound/core.h>
+#include <sound/control.h>
+#include <sound/soc-usb.h>
+
+#include "../card.h"
+#include "../mixer.h"
+#include "../usbaudio.h"
+
+#include "mixer_usb_offload.h"
+
+static int
+snd_usb_offload_available_get(struct snd_kcontrol *kcontrol,
+		      struct snd_ctl_elem_value *ucontrol)
+{
+	struct device *sysdev = snd_kcontrol_chip(kcontrol);
+	int ret;
+
+	ret = snd_soc_usb_device_offload_available(sysdev);
+	ucontrol->value.integer.value[0] = ret < 0 ? -1 : ret;
+
+	return ret < 0 ? ret : 0;
+}
+
+static int snd_usb_offload_available_info(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = -1;
+	uinfo->value.integer.max = SNDRV_CARDS;
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new snd_usb_offload_available_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+	.access = SNDRV_CTL_ELEM_ACCESS_READ,
+	.name = "USB Offload Playback Capable Card",
+	.info = snd_usb_offload_available_info,
+	.get = snd_usb_offload_available_get,
+};
+
+/**
+ * snd_usb_offload_create_ctl() - Add USB offload bounded mixer
+ * @chip - USB SND chip device
+ *
+ * Creates a sound control for a USB audio device, so that applications can
+ * query for if there is an available USB audio offload path, and which
+ * card is managing it.
+ */
+int snd_usb_offload_create_ctl(struct snd_usb_audio *chip)
+{
+	struct usb_device *udev = chip->dev;
+
+	return snd_ctl_add(chip->card,
+			   snd_ctl_new1(&snd_usb_offload_available_ctl,
+					udev->bus->sysdev));
+}
diff --git a/sound/usb/qcom/mixer_usb_offload.h b/sound/usb/qcom/mixer_usb_offload.h
new file mode 100644
index 000000000000..0efda52e92b6
--- /dev/null
+++ b/sound/usb/qcom/mixer_usb_offload.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __USB_OFFLOAD_MIXER_H
+#define __USB_OFFLOAD_MIXER_H
+
+#if IS_ENABLED(CONFIG_SND_USB_QC_OFFLOAD_MIXER)
+int snd_usb_offload_create_ctl(struct snd_usb_audio *chip);
+#else
+static inline int snd_usb_offload_create_ctl(struct snd_usb_audio *chip)
+{
+	return -ENODEV;
+}
+#endif
+#endif /* __USB_OFFLOAD_MIXER_H */
diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 4deec0b6fc08..6a25a390f8ae 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -37,6 +37,7 @@
 #include "../pcm.h"
 #include "../power.h"
 
+#include "mixer_usb_offload.h"
 #include "usb_audio_qmi_v01.h"
 
 /* Stream disable request timeout during USB device disconnect */
@@ -1660,6 +1661,8 @@ static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
 	uaudio_qdev->last_card_num = chip->card->number;
 	snd_soc_usb_connect(usb_get_usb_backend(udev), sdev);
 
+	snd_usb_offload_create_ctl(chip);
+
 	mutex_unlock(&chip->mutex);
 	mutex_unlock(&qdev_mutex);
 
