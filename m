Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7B4858BC2
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Feb 2024 01:27:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91DB82097;
	Sat, 17 Feb 2024 01:27:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91DB82097
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708129675;
	bh=LtZV5CUXs48ixayeIGQ76IReB2d+LrWonLDPetBVXE0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sn+5SMP4jaD3X33h7c/2dZxWNzmD0iWQRP90z595hN9ZlZ+8iLpZIbS3Jg9ZgnQ7W
	 hwAmjOpcqkE9bqwrKatA+9R/GysGvNqX9Fz8Svg7VmQM+EvHLkdeEs5S1+ZhgiD0AT
	 15j/CCqDDRsFPc+sCntMrPlBVawy26pKnf2a7TLM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B926F8962D; Sat, 17 Feb 2024 01:23:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F034F80C77;
	Sat, 17 Feb 2024 01:23:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11F70F8015B; Sat, 17 Feb 2024 01:13:01 +0100 (CET)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7AF29F805BE
	for <alsa-devel@alsa-project.org>; Sat, 17 Feb 2024 01:10:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AF29F805BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=or+aix3h
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41H065j5020996;
	Sat, 17 Feb 2024 00:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=HUDTdfzQUbpe9qfiFp0b
	KWsasPQJ9GQd8pkL2h1cGwI=; b=or+aix3hT9BP3goeJNPDZrnnXSqUNTd1A8w/
	8wBTipogKwm1tiOLdAZFUPrZ0n7qwFj5pdZLvitzNmCuz+3Mr5Eno0R5cA8Lc98V
	pXDyX9SASikKR8wqaeCyNSPfAEpPPUNWjq2K9kkhH1SG1Z+mowj36qUJhjmHNVaU
	b/5fpcyYRPlFzZ+SyCQmP6B+T3atIxFEXo8I5ISF632Vi5mxuXt2rs1atYiIL9+G
	9pBgQjHNyb9iZ9UNJHFTYJrOZxqLQ8WqxlweMhxEPpD/N344xhFmeyZ1C9UvJVJc
	xcfi3Ft9FB5DD+6KDzTNhvvEgF38WgPoNPq2/ut5WBt4BIB+lg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wa6nk9e63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Feb 2024 00:10:43 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 41H0Agu0017454
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Feb 2024 00:10:42 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 16 Feb 2024 16:10:42 -0800
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
Subject: [PATCH v17 45/51] ASoC: usb: Fetch ASoC sound card information
Date: Fri, 16 Feb 2024 16:10:11 -0800
Message-ID: <20240217001017.29969-46-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240217001017.29969-1-quic_wcheng@quicinc.com>
References: <20240217001017.29969-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Z2opX41IYutNUmUNrEkAxgDHGGSlB4cJ
X-Proofpoint-ORIG-GUID: Z2opX41IYutNUmUNrEkAxgDHGGSlB4cJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_23,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxscore=0 adultscore=0
 clxscore=1015 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402160189
Message-ID-Hash: WXPF2SV4ESHZAE5EOBTTQMKX7JQZ62TW
X-Message-ID-Hash: WXPF2SV4ESHZAE5EOBTTQMKX7JQZ62TW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WXPF2SV4ESHZAE5EOBTTQMKX7JQZ62TW/>
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
