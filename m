Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF9195D6FC
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2024 22:08:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E80F47F4;
	Fri, 23 Aug 2024 22:07:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E80F47F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724443688;
	bh=0MJS8UeMpuXcDwnxeJSxD4KAUtp1EpDdAN5SuzBWIq8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EYWCJ0YPmWSCCFcdBB9WPVRju9iCgKKNejCdOPfdUxJjsWO3sy8U72UBd8gS3MZgT
	 22/mrqhG0E3Zzm0R0JyNUIsuByb9RhHvauecUmNRccneDVPw6MZgf3KnFDnGUuksGX
	 LEuYKF7sjOGA8X8AjjKvAMYGpTPpmko8E0BPQcf4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71948F806F0; Fri, 23 Aug 2024 22:05:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF174F806E8;
	Fri, 23 Aug 2024 22:05:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1737F80580; Fri, 23 Aug 2024 22:02:19 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A0963F8058C
	for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2024 22:01:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0963F8058C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=P7WsXg1L
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 47NAQ9vN019828;
	Fri, 23 Aug 2024 20:01:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fwoK+cn40eMnrjglUoPoHYbi
	xjSEVmH70XhslNYScKM=; b=P7WsXg1L56XDmddW5MXN2m1kQBlmeOj9H1OaeNaa
	36eadIqnvtlnu7jvWLUKHDDMmRSmNYqG/LlGKupmaP8jJOgh0KnhuKkXLgpLqY7Q
	fTI0XHf0cy9uUsOQ80t6PprKLVAUVSgVh+dVlyYjCacC1w+ZXWNxA21QJ7QkfRbh
	hdKv3GQ3SR9A+qGVd/Ats5v7iNrKIJZPAfIx6g3puwdmRHXWtjoSQ7eZMCs99nNc
	2EziM+JcCeEAJZ5Xkvwc0NjmOBpsJ50XMDkZeZhgwuAoz5td+cyp1CORFJn1HQ6V
	Y699WgtJoOwLF2WdwLyvoe77mYUpccmUOrUrQxHVwBzPNQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 415bkwgy6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 20:01:18 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 47NK1HK3001660
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 20:01:17 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 23 Aug 2024 13:01:17 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>
Subject: [PATCH v25 14/33] ASoC: usb: Create SOC USB SND jack kcontrol
Date: Fri, 23 Aug 2024 13:00:42 -0700
Message-ID: <20240823200101.26755-15-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240823200101.26755-1-quic_wcheng@quicinc.com>
References: <20240823200101.26755-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: _S9qeXq5gy9Zb40gkFUg8CMX98-qCNO8
X-Proofpoint-GUID: _S9qeXq5gy9Zb40gkFUg8CMX98-qCNO8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_16,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 mlxscore=0 mlxlogscore=796 bulkscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408230147
Message-ID-Hash: JV4OWPGP5KSHMNPXYIGTVLA2CEIBNNGH
X-Message-ID-Hash: JV4OWPGP5KSHMNPXYIGTVLA2CEIBNNGH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JV4OWPGP5KSHMNPXYIGTVLA2CEIBNNGH/>
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
index ef667b3672bf..3ad15e9b8e15 100644
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
@@ -52,6 +54,10 @@ int snd_soc_usb_connect(struct device *usbdev, struct snd_soc_usb_device *sdev);
 int snd_soc_usb_disconnect(struct device *usbdev, struct snd_soc_usb_device *sdev);
 void *snd_soc_usb_find_priv_data(struct device *dev);
 
+int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
+					struct snd_soc_jack *jack);
+int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component);
+
 struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
 					      void *data);
 void snd_soc_usb_free_port(struct snd_soc_usb *usb);
@@ -82,6 +88,17 @@ static inline void *snd_soc_usb_find_priv_data(struct device *dev)
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
 static inline struct snd_soc_usb *snd_soc_usb_allocate_port(
 					      struct snd_soc_component *component,
 					      void *data)
diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
index c5646daa7cda..90266fd7a7ff 100644
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
+					struct snd_soc_jack *jack)
+{
+	int ret;
+
+	ret = snd_soc_card_jack_new(component->card, "USB Offload Jack",
+					SND_JACK_USB, jack);
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
