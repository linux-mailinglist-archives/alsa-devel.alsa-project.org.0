Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE349996E5
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2024 02:16:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 156B114E7;
	Fri, 11 Oct 2024 02:16:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 156B114E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728605803;
	bh=IkMCCmmayPEOkLVBZv1cFnxPTwhINuoT5uWbQVxY0J8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=euGYkt0k65rQgigeTjL+Y78FO7Glv8b/X5fX6UyWDAfHnwp+2AKoNGBfIRzNPv1NQ
	 neBHJGJmkzWcH0M0VQibvinXhS+Kw1QhKpyIsJdH8zTXfTlnqvZjwwNUKyYMSm4PkJ
	 MCSoq53+JhIVF8lBsa/tHu9aPlPeBIU4OC5x+6P0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06FECF897B9; Fri, 11 Oct 2024 02:10:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E92AFF897C8;
	Fri, 11 Oct 2024 02:10:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D415F8068A; Fri, 11 Oct 2024 02:07:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D625F80496
	for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2024 02:07:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D625F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=irewCfpQ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 49ACVLfK026795;
	Fri, 11 Oct 2024 00:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8f3ltJ7kTNBqD63IJWPrINYxMdkP2wD5fAwRcNzFY10=; b=irewCfpQkxYznFm+
	27jcMGvEfdi4NmBD7FMHVoO+gPpbO4R1moyjq3QZTVT3fWol1boYtCYybCsbScEV
	HG3Tk5Bka5x9pZAdB3Q8tjrbv4qj7tMZh8b8pn2vmevjdWxUUXK6O/WuwmY61mQg
	XqfLoywiv4Nqffg9RAZRs5x73VFZhPqhGAphTrqsshWy34TN/RSfpkloGrLWmzjU
	5CcFyZRRm2yXWd1lUoHAJjLgZwQbj32qJZsHySR1yd2Fkq+8ryKuoqGSpWIJu2P3
	Z0MAv/FHJwSO8Vgfx214YlJaUK2z8hTakxcS9rNcK6RdePC+apAgsRh4gh1JN4x9
	HH9AaQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425c8qydrf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 00:07:13 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 49B07CRK015313
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 00:07:12 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 17:07:11 -0700
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
Subject: [PATCH v28 17/33] ASoC: usb: Create SOC USB SND jack kcontrol
Date: Thu, 10 Oct 2024 17:06:18 -0700
Message-ID: <20241011000650.2585600-34-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241011000650.2585600-1-quic_wcheng@quicinc.com>
References: <20241011000650.2585600-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: jUgQjHyHxfVU8diU6yNl3t7q_X1IRIWO
X-Proofpoint-ORIG-GUID: jUgQjHyHxfVU8diU6yNl3t7q_X1IRIWO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 mlxlogscore=960 malwarescore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410100159
Message-ID-Hash: PJ423OOM55ZJV3QQ376WSQC4QPMLRCDA
X-Message-ID-Hash: PJ423OOM55ZJV3QQ376WSQC4QPMLRCDA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PJ423OOM55ZJV3QQ376WSQC4QPMLRCDA/>
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

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/soc-usb.h | 23 +++++++++++
 sound/soc/soc-usb.c     | 89 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 112 insertions(+)

diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
index db9ff0b4191d..587ea07a8cf5 100644
--- a/include/sound/soc-usb.h
+++ b/include/sound/soc-usb.h
@@ -56,6 +56,12 @@ int snd_soc_usb_connect(struct device *usbdev, struct snd_soc_usb_device *sdev);
 int snd_soc_usb_disconnect(struct device *usbdev, struct snd_soc_usb_device *sdev);
 void *snd_soc_usb_find_priv_data(struct device *usbdev);
 
+int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
+				   struct snd_soc_jack *jack);
+int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component);
+int snd_soc_usb_enable_offload_jack(struct snd_soc_component *component,
+				    struct snd_soc_jack *jack);
+
 struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
 					      void *data);
 void snd_soc_usb_free_port(struct snd_soc_usb *usb);
@@ -86,6 +92,23 @@ static inline void *snd_soc_usb_find_priv_data(struct device *usbdev)
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
+static inline int snd_soc_usb_enable_offload_jack(struct snd_soc_component *component,
+						  struct snd_soc_jack *jack)
+{
+	return 0;
+}
+
 static inline struct snd_soc_usb *
 snd_soc_usb_allocate_port(struct snd_soc_component *component, void *data)
 {
diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
index c63033468e4a..ab914878e101 100644
--- a/sound/soc/soc-usb.c
+++ b/sound/soc/soc-usb.c
@@ -4,7 +4,10 @@
  */
 #include <linux/of.h>
 #include <linux/usb.h>
+
+#include <sound/jack.h>
 #include <sound/soc-usb.h>
+
 #include "../usb/card.h"
 
 static DEFINE_MUTEX(ctx_mutex);
@@ -56,6 +59,92 @@ static struct snd_soc_usb *snd_soc_find_usb_ctx(struct device *dev)
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
+		dev_err(component->card->dev, "Unable to add USB offload jack: %d\n",
+			ret);
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
+/**
+ * snd_soc_usb_enable_offload_jack() - Enables USB offloading jack
+ * @component: USB DPCM backend DAI component
+ * @jack: offload jack to enable
+ *
+ * Enables the offload jack device, so that further connection events
+ * will be notified.  This is the complement to
+ * snd_soc_usb_disable_offload_jack().
+ *
+ * Returns 0 on success, negative on error.
+ *
+ */
+int snd_soc_usb_enable_offload_jack(struct snd_soc_component *component,
+				    struct snd_soc_jack *jack)
+{
+	int ret;
+
+	ret = snd_soc_component_set_jack(component, jack, NULL);
+	if (ret) {
+		dev_err(component->card->dev, "Failed to enable jack: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_enable_offload_jack);
+
 /**
  * snd_soc_usb_find_priv_data() - Retrieve private data stored
  * @usbdev: device reference
