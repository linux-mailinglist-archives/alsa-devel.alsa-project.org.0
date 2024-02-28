Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CF286A5F4
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Feb 2024 02:47:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 300AA847;
	Wed, 28 Feb 2024 02:47:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 300AA847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709084854;
	bh=LtZV5CUXs48ixayeIGQ76IReB2d+LrWonLDPetBVXE0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Jdh2l2IHa/9Myc5V3X+aUjgCvZF7O+AF4PoQ4vhL0iEJ2KScIrF/uadfUczjIx3J0
	 p37/0NnOh1RqsW0FFh+WjGM62n6+tYZMvWFbffF/nIeTdT5LP6IpgDvlwxoFh0O9C+
	 h9SAeP8gj5RRl4NV64mREG0ZSK9s52lZdgPOg4PI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5605F806E2; Wed, 28 Feb 2024 02:39:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BE3B7F8985E;
	Wed, 28 Feb 2024 02:39:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CBDBF896EE; Wed, 28 Feb 2024 02:38:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3F84F805B1
	for <alsa-devel@alsa-project.org>; Wed, 28 Feb 2024 02:36:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3F84F805B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=ZZGNk4Va
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41S10EuP015306;
	Wed, 28 Feb 2024 01:36:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=HUDTdfzQUbpe9qfiFp0b
	KWsasPQJ9GQd8pkL2h1cGwI=; b=ZZGNk4VaRRu4hDAvHOqfMFaZ5PxrLTTyEHF+
	hKfioQ1ChGo0vMj64YFIaog3AEeMgxIhWGcpVKxGzII3seuIUDJ3+FWsFrNi98AP
	RMdouEpjXEmCCSe+j0saaY8WjVq4mWceAlaM8zxeeFJ9N0dq3hsUeblhhjRb9WM/
	AiNjN8xIxDSR/71WaHkEdA5/1nkdgl0XZfovbHRX+66O++EQdOO2RW7YDx84/EV8
	HkY0b/LUn63skCezIObCSUg8SJMKyAH9xuk+i2cDHdvG/h7SMaxzZw8ekzVh03SK
	mtt56MZV8LBqbzK7iHoAdeAeyWWjW/BEz56G3d9dj601NFx91Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3whccwa6gx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 01:36:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 41S1adrB001677
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 01:36:39 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 27 Feb 2024 17:36:38 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
        <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v18 35/41] ASoC: usb: Fetch ASoC sound card information
Date: Tue, 27 Feb 2024 17:36:13 -0800
Message-ID: <20240228013619.29758-36-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240228013619.29758-1-quic_wcheng@quicinc.com>
References: <20240228013619.29758-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 2pTa5gabKYa7DwGr4EHj5gvNvFyXnycA
X-Proofpoint-ORIG-GUID: 2pTa5gabKYa7DwGr4EHj5gvNvFyXnycA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-27_11,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402280011
Message-ID-Hash: QZSBCY7LNAFWZY2F4YOQAZ5GUQCOQSFN
X-Message-ID-Hash: QZSBCY7LNAFWZY2F4YOQAZ5GUQCOQSFN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QZSBCY7LNAFWZY2F4YOQAZ5GUQCOQSFN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For USB sound to expose mixer controls to fetch information about the ASoC
sound card, add an API that returns the platform sound card number that is
registered with SOC USB.  Knowing this allows for applications to further
query about the offload status.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/soc-usb.h |  6 ++++++
 sound/soc/soc-usb.c     | 26 ++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
index 3137f538270f..56df503c4ecf 100644
--- a/include/sound/soc-usb.h
+++ b/include/sound/soc-usb.h
@@ -85,6 +85,7 @@ int snd_soc_usb_find_format(int card_idx, struct snd_pcm_hw_params *params,
 int snd_soc_usb_connect(struct device *usbdev, struct snd_soc_usb_device *sdev);
 int snd_soc_usb_disconnect(struct device *usbdev, struct snd_soc_usb_device *sdev);
 void *snd_soc_usb_find_priv_data(struct device *dev);
+int snd_soc_usb_device_offload_available(struct device *dev);
 
 int snd_soc_usb_prepare_session(struct snd_soc_usb *usb, int card_idx, int pcm_idx);
 int snd_soc_usb_shutdown_session(struct snd_soc_usb *usb, int session_id);
@@ -128,6 +129,11 @@ static inline void *snd_soc_usb_find_priv_data(struct device *dev)
 	return NULL;
 }
 
+static inline int snd_soc_usb_device_offload_available(struct device *dev)
+{
+	return -ENODEV;
+}
+
 static inline int snd_soc_usb_prepare_session(struct snd_soc_usb *usb, int card_idx,
 						int pcm_idx)
 {
diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
index 27c76a33da32..53c4e399909e 100644
--- a/sound/soc/soc-usb.c
+++ b/sound/soc/soc-usb.c
@@ -457,6 +457,32 @@ int snd_soc_usb_find_format(int card_idx, struct snd_pcm_hw_params *params,
 }
 EXPORT_SYMBOL_GPL(snd_soc_usb_find_format);
 
+/**
+ * snd_soc_usb_device_offload_available() - Fetch BE DAI link sound card
+ * @dev: the device to find in SOC USB
+ *
+ * Finds the component linked to a specific SOC USB instance, and returns
+ * the sound card number for the platform card supporting offloading.
+ *
+ */
+int snd_soc_usb_device_offload_available(struct device *dev)
+{
+	struct snd_soc_usb *ctx;
+	struct device_node *node;
+
+	node = snd_soc_find_phandle(dev);
+	if (IS_ERR(node))
+		return -ENODEV;
+
+	ctx = snd_soc_find_usb_ctx(node);
+	of_node_put(node);
+	if (!ctx)
+		return -ENODEV;
+
+	return ctx->component->card->snd_card->number;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_device_offload_available);
+
 /**
  * snd_soc_usb_allocate_port() - allocate a SOC USB device
  * @component: USB DPCM backend DAI component
