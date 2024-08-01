Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8574943EAC
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 03:25:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B8693065;
	Thu,  1 Aug 2024 03:24:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B8693065
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722475487;
	bh=We2PXyGMDfnGoL4xXnM5bIUMn1vj5jh6gYcAzSzb8PA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SSqanl1K7msqrnaJ/jLhxySYxRDaXVDrcZD1O7rwtVydFDYW2lp+fnYo+6vkJMGIw
	 zoQpdV+njrfP/7j/TW8RzEYpzzJbMUtFWh/7ONiO/LrPVx1G9eLcGQjG2ebqiNjW5r
	 VnzsXZTDn1+P/5t2AUdslJDci1aZSwnRKZ1PAVq0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECCD5F80844; Thu,  1 Aug 2024 03:21:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DFEA8F80814;
	Thu,  1 Aug 2024 03:21:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34600F80580; Thu,  1 Aug 2024 03:18:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 69A17F80269
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 03:17:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69A17F80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=LR5AdAWZ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 46VDgOpX029572;
	Thu, 1 Aug 2024 01:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dWkbUsq8HJ7+0Yi3DGcFN1c1
	OEx7yBs1I+aB6rSpVZM=; b=LR5AdAWZGCpXV2z4kXsoaDu2aRH7sdU3eBnJf2mX
	Ja7jgPf7ptfC0Nwu/HUgIe66B5VV8bOTIi0kYfMqTm7wl4L+iakn8mxR1mOET3tb
	he1+NrnLvHr2oW22fMLW+Awfrct0zcyx+jT3B/1E0mtKewIg+4Ho0NQ40gh0XR7z
	XBiFw/OrwuCRnBpJ+ZCWxSLj7RZ/gKIpaxsOHKbdljvi2o8YwrF+HIiKyPpFN0rw
	Zu8MNuq0Lc1/WzsOnBczbvZGArnE1fwOLVRV51UKi1QqavZgAyckUsxon4zF3l0B
	O+D80Hu5hY+8LdFzOp75laUkjxc//hDHYD/3cxK9ZZWG5g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40pw446egf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 01:17:45 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 4711Hibs012381
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Aug 2024 01:17:44 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 31 Jul 2024 18:17:44 -0700
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
Subject: [PATCH v24 11/34] ASoC: usb: Fetch ASoC card and pcm device
 information
Date: Wed, 31 Jul 2024 18:17:07 -0700
Message-ID: <20240801011730.4797-12-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: sdH2EMAcWWkpWfEl5aEzAu-CG9UM2Hbl
X-Proofpoint-ORIG-GUID: sdH2EMAcWWkpWfEl5aEzAu-CG9UM2Hbl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_11,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408010005
Message-ID-Hash: XXKPFDSRACU574BOGU47WDN4JGIUTNZS
X-Message-ID-Hash: XXKPFDSRACU574BOGU47WDN4JGIUTNZS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XXKPFDSRACU574BOGU47WDN4JGIUTNZS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

USB SND needs to know how the USB offload path is being routed.  This would
allow for applications to open the corresponding sound card and pcm device
when it wants to take the audio offload path.  This callback should return
the mapped indexes based on the USB SND device information.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/soc-usb.h | 16 ++++++++++++++++
 sound/soc/soc-usb.c     | 28 ++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
index d6b576f971ae..a167e3de0a78 100644
--- a/include/sound/soc-usb.h
+++ b/include/sound/soc-usb.h
@@ -8,6 +8,11 @@
 
 #include <sound/soc.h>
 
+enum snd_soc_usb_kctl {
+	SND_SOC_USB_KCTL_CARD_ROUTE,
+	SND_SOC_USB_KCTL_PCM_ROUTE,
+};
+
 /**
  * struct snd_soc_usb_device
  * @card_idx - sound card index associated with USB device
@@ -32,6 +37,7 @@ struct snd_soc_usb_device {
  * @component - reference to ASoC component
  * @num_supported_streams - number of supported concurrent sessions
  * @connection_status_cb - callback to notify connection events
+ * @get_offload_dev - callback to fetch mapped ASoC device
  * @priv_data - driver data
  **/
 struct snd_soc_usb {
@@ -40,6 +46,8 @@ struct snd_soc_usb {
 	unsigned int num_supported_streams;
 	int (*connection_status_cb)(struct snd_soc_usb *usb,
 			struct snd_soc_usb_device *sdev, bool connected);
+	int (*get_offload_dev)(struct snd_soc_component *component,
+				int card, int pcm, enum snd_soc_usb_kctl route);
 	void *priv_data;
 };
 
@@ -51,6 +59,8 @@ void *snd_soc_usb_find_priv_data(struct device *dev);
 int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
 					struct snd_soc_jack *jack);
 int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component);
+int soc_usb_get_offload_device(struct device *dev, int card, int pcm,
+				enum snd_soc_usb_kctl route);
 
 struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
 					      int num_streams, void *data);
@@ -86,6 +96,12 @@ static inline int snd_soc_usb_disable_offload_jack(struct snd_soc_component *com
 	return -ENODEV;
 }
 
+static int soc_usb_get_offload_device(struct device *dev, int card, int pcm,
+					enum snd_soc_usb_kctl route)
+{
+	return -ENODEV;
+}
+
 static inline struct snd_soc_usb *snd_soc_usb_allocate_port(
 					      struct snd_soc_component *component,
 					      int num_streams, void *data)
diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
index fe2a75a28af4..3c217ac67c57 100644
--- a/sound/soc/soc-usb.c
+++ b/sound/soc/soc-usb.c
@@ -117,6 +117,34 @@ int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component)
 }
 EXPORT_SYMBOL_GPL(snd_soc_usb_disable_offload_jack);
 
+/**
+ * soc_usb_get_offload_device - Set active USB offload path
+ * @dev - USB device to get offload status
+ * @card - USB card index
+ * @pcm - USB PCM device index
+ *
+ * Fetch the current status for the USB SND card and PCM device indexes
+ * specified.
+ */
+int soc_usb_get_offload_device(struct device *dev, int card, int pcm,
+				enum snd_soc_usb_kctl route)
+{
+	struct snd_soc_usb *ctx;
+	int ret;
+
+	ctx = snd_soc_find_usb_ctx(dev);
+	if (!ctx)
+		return -ENODEV;
+
+	mutex_lock(&ctx_mutex);
+	if (ctx && ctx->get_offload_dev)
+		ret = ctx->get_offload_dev(ctx->component, card, pcm, route);
+	mutex_unlock(&ctx_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(soc_usb_get_offload_device);
+
 /**
  * snd_soc_usb_find_priv_data() - Retrieve private data stored
  * @dev: device reference
