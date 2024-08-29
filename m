Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BB4965012
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2024 21:50:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC331F55;
	Thu, 29 Aug 2024 21:50:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC331F55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724961055;
	bh=7VvEI5tVKTuZOdE1RPfQR1J/kfWt+4/5pdJh7/hCIKA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SGbaZXrKcI64y5NftHjLAATjSI1SUtxLcl2OulthB0Hn9hcL3m25xMrn/tIemBwpi
	 O1W65Phod1mw3jargzHH0eRhaBjQVcQGyjGbOu0RKsVwf17QG0Y7c23Uy8fcnmIoEq
	 bVP81tplnCz5RIqebwbng2yBhtWoj4GbJEdIF9w8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FD13F897FE; Thu, 29 Aug 2024 21:43:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6F52F89805;
	Thu, 29 Aug 2024 21:43:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA7E1F805E9; Thu, 29 Aug 2024 21:42:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E6E64F805A0
	for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2024 21:41:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6E64F805A0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=MAJe8S3D
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 47TIH5Tm028956;
	Thu, 29 Aug 2024 19:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/m/fWcv6m+pycm1SCAT+kAEj5wv4ufFmgsS4RSYMq5I=; b=MAJe8S3DYIaW2ZOn
	JnBLiDguW03HCq68KMHjsoks1d8ODpR9Em2oIBFFqIHMYcPfACv41S3zi8iKJpRE
	hTVzJKugQJbM0NtcLKVeRidByZg9CV27QeiQBC543Y+GSmZRq9fjgLJqGwJ7h29L
	5G3TzcVu52wCZzkJ0ROKsl0yEKebYXkHeR5b0xzqT+npJJ1XrzZBGVsemEnKFwmX
	7hCZ36yxDkd1VZisG0/HaTJ5Eb3deaD+RbnC3L5oFvmQUQu+uUcDdD/LKX3dA+7c
	MBR+1gEVjjUrQRC9E+QHJY2CSDNh/q9Zt6C9LYVPKBenC/WwD2I/qg8Bu2aP8aD4
	5gomuQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41ax4mg6hj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 19:41:29 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 47TJfSDB016270
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 19:41:28 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 Aug 2024 12:41:27 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>
Subject: [PATCH v26 14/33] ASoC: usb: Create SOC USB SND jack kcontrol
Date: Thu, 29 Aug 2024 12:40:46 -0700
Message-ID: <20240829194105.1504814-15-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
References: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: wPSe-U3C_8LPAHsnq1vyPvOQdWl1cNc6
X-Proofpoint-ORIG-GUID: wPSe-U3C_8LPAHsnq1vyPvOQdWl1cNc6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_06,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=798
 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290139
Message-ID-Hash: KJAY344KP4L6ZWNNL7446IJULME3NGQL
X-Message-ID-Hash: KJAY344KP4L6ZWNNL7446IJULME3NGQL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KJAY344KP4L6ZWNNL7446IJULME3NGQL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Expose API for creation of a jack control for notifying of available
devices that are plugged in/discovered, and that support offloading.  This
allows for control names to be standardized across implementations of USB
audio offloading.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/soc-usb.h | 17 +++++++++++
 sound/soc/soc-usb.c     | 62 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 78 insertions(+), 1 deletion(-)

diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
index b550ee87b748..5c788cbfa82e 100644
--- a/include/sound/soc-usb.h
+++ b/include/sound/soc-usb.h
@@ -6,6 +6,8 @@
 #ifndef __LINUX_SND_SOC_USB_H
 #define __LINUX_SND_SOC_USB_H
 
+#include <sound/soc.h>
+
 /**
  * struct snd_soc_usb_device
  * @card_idx - sound card index associated with USB device
@@ -54,6 +56,10 @@ int snd_soc_usb_connect(struct device *usbdev, struct snd_soc_usb_device *sdev);
 int snd_soc_usb_disconnect(struct device *usbdev, struct snd_soc_usb_device *sdev);
 void *snd_soc_usb_find_priv_data(struct device *dev);
 
+int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
+				   struct snd_soc_jack *jack);
+int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component);
+
 struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
 					      void *data);
 void snd_soc_usb_free_port(struct snd_soc_usb *usb);
@@ -84,6 +90,17 @@ static inline void *snd_soc_usb_find_priv_data(struct device *dev)
 	return NULL;
 }
 
+static inline int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
+						 struct snd_soc_jack *jack)
+{
+	return 0;
+}
+
+static inline int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component)
+{
+	return 0;
+}
+
 static inline struct snd_soc_usb *
 snd_soc_usb_allocate_port(struct snd_soc_component *component, void *data)
 {
diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
index 8ade2060d8fe..3d5354298206 100644
--- a/sound/soc/soc-usb.c
+++ b/sound/soc/soc-usb.c
@@ -4,8 +4,10 @@
  */
 #include <linux/of.h>
 #include <linux/usb.h>
-#include <sound/soc.h>
+
+#include <sound/jack.h>
 #include <sound/soc-usb.h>
+
 #include "../usb/card.h"
 
 static DEFINE_MUTEX(ctx_mutex);
@@ -57,6 +59,64 @@ static struct snd_soc_usb *snd_soc_find_usb_ctx(struct device *dev)
 	return ctx ? ctx : NULL;
 }
 
+/* SOC USB sound kcontrols */
+/**
+ * snd_soc_usb_setup_offload_jack() - Create USB offloading jack
+ * @component: USB DPCM backend DAI component
+ * @jack: jack structure to create
+ *
+ * Creates a jack device for notifying userspace of the availability
+ * of an offload capable device.
+ *
+ * Returns 0 on success, negative on error.
+ *
+ */
+int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
+				   struct snd_soc_jack *jack)
+{
+	int ret;
+
+	ret = snd_soc_card_jack_new(component->card, "USB Offload Jack",
+				    SND_JACK_USB, jack);
+	if (ret < 0) {
+		dev_err(component->card->dev, "Unable to add USB offload jack\n");
+		return ret;
+	}
+
+	ret = snd_soc_component_set_jack(component, jack, NULL);
+	if (ret) {
+		dev_err(component->card->dev, "Failed to set jack: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_setup_offload_jack);
+
+/**
+ * snd_soc_usb_disable_offload_jack() - Disables USB offloading jack
+ * @component: USB DPCM backend DAI component
+ *
+ * Disables the offload jack device, so that further connection events
+ * won't be notified.
+ *
+ * Returns 0 on success, negative on error.
+ *
+ */
+int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component)
+{
+	int ret;
+
+	ret = snd_soc_component_set_jack(component, NULL, NULL);
+	if (ret) {
+		dev_err(component->card->dev, "Failed to disable jack: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_disable_offload_jack);
+
 /**
  * snd_soc_usb_find_priv_data() - Retrieve private data stored
  * @dev: device reference
