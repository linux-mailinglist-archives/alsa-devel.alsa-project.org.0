Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 455488B2C8A
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 00:02:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC81514E2;
	Fri, 26 Apr 2024 00:02:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC81514E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714082565;
	bh=+5mctwiPbGJWIC8A878mTRFjfB1bsvH1gd7x5+K/epQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B9nBIJbS26TjqSaLHuOAiO886P9FJ1ehA9nAhdg2XI3vvw992ni3+3aU/q533P1Bt
	 NVcOkdxR0s+qp1EczQBVEiB1Y+tvC+JKYNyUxpFGgPQVk58EchogU99k6t680KKAku
	 W8uP4N60S/S39l10IfQxPLZRL6oMsh4p5yvYLSiQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8538F8982F; Thu, 25 Apr 2024 23:55:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E2BCF89845;
	Thu, 25 Apr 2024 23:55:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 260DAF80809; Thu, 25 Apr 2024 23:54:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AC707F805B4
	for <alsa-devel@alsa-project.org>; Thu, 25 Apr 2024 23:51:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC707F805B4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=M+o8lX3r
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43PLcY7h021747;
	Thu, 25 Apr 2024 21:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=5uoGJwSD9C2YGZyRc+IK
	0V5FTPw3VvdAlOyGPREG8wI=; b=M+o8lX3rIs/NI4mJZZogyS30JFnPC5md+NJv
	krxvQq4Vmk+2LoyT0L+yQj4IzjtsZ0zZwpUwQqq9K5azK/ot1NNaDrJ5Z1B5+dbx
	VlEclfMfWGxL8UOOdsEHzeUxuYmekKDVA/ijUekx/HUZQrBXR5xo/k40MoQ2Pk8c
	Uxa+4CJmppPh2LIr8xaFutJhKR74xY/CsHRqb9Y6DrMkK27o6D5yi2KCito0lzLs
	XygGcR7RezPew9hPtnM6y+GhDF2Te7olxfFHSYYlPJmTpUK2FteavfoSYVKtAQBt
	jQJVma59yyRKZMUjWanllDtXtz9ES6KBEAUBn1P7bnfolgCw8g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqengktbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:51:48 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 43PLpmSE015500
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:51:48 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 25 Apr 2024 14:51:47 -0700
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
Subject: [PATCH v20 40/41] ASoC: qcom: Populate SoC components string
Date: Thu, 25 Apr 2024 14:51:24 -0700
Message-ID: <20240425215125.29761-41-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: EcL9enN48hUF8Wul_5x1oHqsgIFlzaYN
X-Proofpoint-ORIG-GUID: EcL9enN48hUF8Wul_5x1oHqsgIFlzaYN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_21,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250159
Message-ID-Hash: GS6WAJQWU4UUDDKDFEIS4DEFF5T3O2TE
X-Message-ID-Hash: GS6WAJQWU4UUDDKDFEIS4DEFF5T3O2TE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GS6WAJQWU4UUDDKDFEIS4DEFF5T3O2TE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For userspace to know about certain capabilities of the current platform
card, add tags to the components string that it can use to enable support
for that audio path.  In case of USB offloading, the "usboffldplybk: 1" tag
is added to the string.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/soc/qcom/sm8250.c            |  3 +++
 sound/soc/qcom/usb_offload_utils.c | 22 ++++++++++++++++++++++
 sound/soc/qcom/usb_offload_utils.h |  6 ++++++
 3 files changed, 31 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index a4e87dfb1b93..5e3007e2e061 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -39,6 +39,9 @@ static int sm8250_snd_init(struct snd_soc_pcm_runtime *rtd)
 						&data->usb_offload_jack_setup);
 	else
 		ret = qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
+
+	qcom_snd_add_components_string(rtd);
+
 	return ret;
 }
 
diff --git a/sound/soc/qcom/usb_offload_utils.c b/sound/soc/qcom/usb_offload_utils.c
index 0be05c1f87a9..8b137e1593e5 100644
--- a/sound/soc/qcom/usb_offload_utils.c
+++ b/sound/soc/qcom/usb_offload_utils.c
@@ -26,4 +26,26 @@ int qcom_snd_usb_offload_jack_setup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_usb_offload_jack_setup);
+
+int qcom_snd_add_components_string(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_card *card = rtd->card;
+	const char *prev = card->components;
+
+	switch (cpu_dai->id) {
+	case USB_RX:
+		card->components = devm_kasprintf(card->dev, GFP_KERNEL, "%s %s",
+					  card->components,
+					  snd_soc_usb_get_components_tag(true));
+	default:
+		break;
+	}
+
+	if (prev && prev != card->components)
+		devm_kfree(card->dev, prev);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_add_components_string);
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/qcom/usb_offload_utils.h b/sound/soc/qcom/usb_offload_utils.h
index 283e81f57f43..03780a12a326 100644
--- a/sound/soc/qcom/usb_offload_utils.h
+++ b/sound/soc/qcom/usb_offload_utils.h
@@ -10,11 +10,17 @@
 #if IS_ENABLED(CONFIG_SND_SOC_QCOM_OFFLOAD_UTILS)
 int qcom_snd_usb_offload_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_soc_jack *jack, bool *jack_setup);
+int qcom_snd_add_components_string(struct snd_soc_pcm_runtime *rtd);
 #else
 static inline int qcom_snd_usb_offload_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_soc_jack *jack, bool *jack_setup)
 {
 	return -ENODEV;
 }
+
+static inline int qcom_snd_add_components_string(struct snd_soc_pcm_runtime *rtd)
+{
+	return -ENODEV;
+}
 #endif /* IS_ENABLED(CONFIG_SND_SOC_QCOM_OFFLOAD_UTILS) */
 #endif /* __QCOM_SND_USB_OFFLOAD_UTILS_H__ */
