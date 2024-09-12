Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EDF977263
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Sep 2024 21:48:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51F54EB1;
	Thu, 12 Sep 2024 21:48:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51F54EB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726170539;
	bh=Y5/uxZlOWMk5KNNRmzXgFDLOWfc/MymPO5Jt8+HOqrU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q7QWB3fFNOL5+IJWmGwNkpKmOCvwfl9Mn6sSVn6n56wycZ0URArp4APiXAsE0EpuQ
	 Su1Lt6D9lpXCaBFjJCZT+M0g7WazkJ+SdWjvxn7MwE6syb2KIvKFaFGYVNLIIbHhpU
	 SQ3YwALBU6Mx2YovXJfXjhoxJqVTEI5sUixyQPE4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07E33F89813; Thu, 12 Sep 2024 21:41:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F9DFF80682;
	Thu, 12 Sep 2024 21:41:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70EE2F805AD; Thu, 12 Sep 2024 21:40:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1BFF8F805C2
	for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2024 21:39:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BFF8F805C2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=SGKJ+mVA
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 48CHtCUw030301;
	Thu, 12 Sep 2024 19:39:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zf07zDWjnx7aQXd5TW1MIzOkUgL2dLXZMLqynSgsPCA=; b=SGKJ+mVA9Oedhu1e
	NWIE8+ohcLdlDZNlMZVZZdotKGDSG4bHEJPM2+XUJj0DeFkXxAKhz6RzkYK1jgHf
	P9ieqiM1nafdh4lJ0CUtfZda/hg+Al0R1TMBbBaUsseAkkPeK4f4rMvg1KnFIuqx
	Rc7uR/N9rDvzkGY7DmFf/j4KiAoVuBE8QgOqyoU5ZfThyKzsDowutHn3Q300UlFi
	0+dlUyanMRkGFlyWoVx4bukhImOmzHuQEzFw2DzJgU1kesX+dEqB1HpKGQ3lZ0+u
	LOLm7Knxjk2GzuI2Ahfh9vSwTopA/NQV+DJd8+zRj5utLiRCV61DWvTaOWXEe0fo
	ihJ0Gw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy51ed8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 19:39:56 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 48CJdthP009935
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 19:39:55 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Sep 2024 12:39:54 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>,
        <pierre-louis.bossart@linux.intel.com>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>
Subject: [PATCH v27 30/32] ALSA: usb-audio: Add USB offload route kcontrol
Date: Thu, 12 Sep 2024 12:39:33 -0700
Message-ID: <20240912193935.1916426-31-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912193935.1916426-1-quic_wcheng@quicinc.com>
References: <20240912193935.1916426-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: HCt_zsELa4Y5QoC49UaacMlcmQTWAA8w
X-Proofpoint-GUID: HCt_zsELa4Y5QoC49UaacMlcmQTWAA8w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409120144
Message-ID-Hash: C3UWNFKRCIGR2D2YW7OMSNLXR3PM5CTC
X-Message-ID-Hash: C3UWNFKRCIGR2D2YW7OMSNLXR3PM5CTC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C3UWNFKRCIGR2D2YW7OMSNLXR3PM5CTC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In order to allow userspace/applications know about USB offloading status,
expose a sound kcontrol that fetches information about which sound card
and PCM index the USB device is mapped to for supporting offloading.  In
the USB audio offloading framework, the ASoC BE DAI link is the entity
responsible for registering to the SOC USB layer.

It is expected for the USB SND offloading driver to add the kcontrol to the
sound card associated with the USB audio device.  An example output would
look like:

tinymix -D 1 get 'USB Offload Playback Route PCM#0'
-1, -1 (range -1->255)

This example signifies that there is no mapped ASoC path available for the
USB SND device.

tinymix -D 1 get 'USB Offload Playback Route PCM#0'
0, 0 (range -1->255)

This example signifies that the offload path is available over ASoC sound
card index#0 and PCM device#0.

The USB offload kcontrol will be added in addition to the existing
kcontrols identified by the USB SND mixer.  The kcontrols used to modify
the USB audio device specific parameters are still valid and expected to be
used.  These parameters are not mirrored to the ASoC subsystem.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/usb/Kconfig                 |  10 +++
 sound/usb/Makefile                |   2 +
 sound/usb/mixer_usb_offload.c     | 102 ++++++++++++++++++++++++++++++
 sound/usb/mixer_usb_offload.h     |  17 +++++
 sound/usb/qcom/Makefile           |   2 +-
 sound/usb/qcom/qc_audio_offload.c |   2 +
 6 files changed, 134 insertions(+), 1 deletion(-)
 create mode 100644 sound/usb/mixer_usb_offload.c
 create mode 100644 sound/usb/mixer_usb_offload.h

diff --git a/sound/usb/Kconfig b/sound/usb/Kconfig
index 5cc3eaf53e6b..e3fbf9541d0b 100644
--- a/sound/usb/Kconfig
+++ b/sound/usb/Kconfig
@@ -176,10 +176,20 @@ config SND_BCD2000
 	  To compile this driver as a module, choose M here: the module
 	  will be called snd-bcd2000.
 
+config SND_USB_OFFLOAD_MIXER
+	tristate "USB Audio Offload mixer control"
+	help
+	 Say Y to enable the USB audio offloading mixer controls.  This
+	 exposes an USB offload capable kcontrol to signal to applications
+	 about which platform sound card can support USB audio offload.
+	 The returning values specify the mapped ASoC card and PCM device
+	 the USB audio device is associated to.
+
 config SND_USB_AUDIO_QMI
 	tristate "Qualcomm Audio Offload driver"
 	depends on QCOM_QMI_HELPERS && SND_USB_AUDIO && USB_XHCI_SIDEBAND && SND_SOC_USB
 	select SND_PCM
+	select SND_USB_OFFLOAD_MIXER
 	help
 	  Say Y here to enable the Qualcomm USB audio offloading feature.
 
diff --git a/sound/usb/Makefile b/sound/usb/Makefile
index 54a06a2f73ca..2f19f854944c 100644
--- a/sound/usb/Makefile
+++ b/sound/usb/Makefile
@@ -36,3 +36,5 @@ obj-$(CONFIG_SND_USB_US122L) += snd-usbmidi-lib.o
 
 obj-$(CONFIG_SND) += misc/ usx2y/ caiaq/ 6fire/ hiface/ bcd2000/ qcom/
 obj-$(CONFIG_SND_USB_LINE6)	+= line6/
+
+obj-$(CONFIG_SND_USB_OFFLOAD_MIXER) += mixer_usb_offload.o
diff --git a/sound/usb/mixer_usb_offload.c b/sound/usb/mixer_usb_offload.c
new file mode 100644
index 000000000000..16e2fd634684
--- /dev/null
+++ b/sound/usb/mixer_usb_offload.c
@@ -0,0 +1,102 @@
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
+#include "usbaudio.h"
+#include "card.h"
+#include "helper.h"
+#include "mixer.h"
+
+#include "mixer_usb_offload.h"
+
+#define PCM_IDX(n)  ((n) & 0xffff)
+#define CARD_IDX(n) ((n) >> 16)
+
+static int
+snd_usb_offload_route_get(struct snd_kcontrol *kcontrol,
+			  struct snd_ctl_elem_value *ucontrol)
+{
+	struct device *sysdev = snd_kcontrol_chip(kcontrol);
+	int ret;
+
+	ret = snd_soc_usb_update_offload_route(sysdev,
+					       CARD_IDX(kcontrol->private_value),
+					       PCM_IDX(kcontrol->private_value),
+					       SNDRV_PCM_STREAM_PLAYBACK,
+					       ucontrol->value.integer.value);
+	if (ret < 0) {
+		ucontrol->value.integer.value[0] = -1;
+		ucontrol->value.integer.value[1] = -1;
+	}
+
+	return 0;
+}
+
+static int snd_usb_offload_route_info(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 2;
+	uinfo->value.integer.min = -1;
+	/* Arbitrary max value, as there is no 'limit' on number of PCM devices */
+	uinfo->value.integer.max = 0xff;
+
+	return 0;
+}
+
+static struct snd_kcontrol_new snd_usb_offload_mapped_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+	.access = SNDRV_CTL_ELEM_ACCESS_READ,
+	.info = snd_usb_offload_route_info,
+	.get = snd_usb_offload_route_get,
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
+	struct snd_kcontrol_new *chip_kctl;
+	struct snd_usb_substream *subs;
+	struct snd_usb_stream *as;
+	char ctl_name[37];
+	int ret;
+
+	list_for_each_entry(as, &chip->pcm_list, list) {
+		subs = &as->substream[SNDRV_PCM_STREAM_PLAYBACK];
+		if (!subs->ep_num)
+			continue;
+
+		chip_kctl = &snd_usb_offload_mapped_ctl;
+		chip_kctl->count = 1;
+		/*
+		 * Store the associated USB SND card number and PCM index for
+		 * the kctl.
+		 */
+		chip_kctl->private_value = as->pcm_index |
+					  chip->card->number << 16;
+		sprintf(ctl_name, "USB Offload Playback Route PCM#%d",
+			as->pcm_index);
+		chip_kctl->name = ctl_name;
+		ret = snd_ctl_add(chip->card, snd_ctl_new1(chip_kctl,
+				  udev->bus->sysdev));
+		if (ret < 0)
+			break;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_usb_offload_create_ctl);
diff --git a/sound/usb/mixer_usb_offload.h b/sound/usb/mixer_usb_offload.h
new file mode 100644
index 000000000000..3f6e2a8b19c8
--- /dev/null
+++ b/sound/usb/mixer_usb_offload.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __USB_OFFLOAD_MIXER_H
+#define __USB_OFFLOAD_MIXER_H
+
+#if IS_ENABLED(CONFIG_SND_USB_OFFLOAD_MIXER)
+int snd_usb_offload_create_ctl(struct snd_usb_audio *chip);
+#else
+static inline int snd_usb_offload_create_ctl(struct snd_usb_audio *chip)
+{
+	return 0;
+}
+#endif
+#endif /* __USB_OFFLOAD_MIXER_H */
diff --git a/sound/usb/qcom/Makefile b/sound/usb/qcom/Makefile
index a81c9b28d484..4005e8391ab9 100644
--- a/sound/usb/qcom/Makefile
+++ b/sound/usb/qcom/Makefile
@@ -1,2 +1,2 @@
 snd-usb-audio-qmi-objs := usb_audio_qmi_v01.o qc_audio_offload.o
-obj-$(CONFIG_SND_USB_AUDIO_QMI) += snd-usb-audio-qmi.o
\ No newline at end of file
+obj-$(CONFIG_SND_USB_AUDIO_QMI) += snd-usb-audio-qmi.o
diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index a7ad15404fd1..5b9262a116be 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -36,6 +36,7 @@
 #include "../helper.h"
 #include "../pcm.h"
 #include "../power.h"
+#include "../mixer_usb_offload.h"
 
 #include "usb_audio_qmi_v01.h"
 
@@ -1703,6 +1704,7 @@ static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
 		sdev->card_idx = chip->card->number;
 		sdev->chip_idx = chip->index;
 
+		snd_usb_offload_create_ctl(chip);
 		snd_soc_usb_connect(usb_get_usb_backend(udev), sdev);
 	}
 
