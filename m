Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 243E5847F8D
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Feb 2024 03:53:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EBEA14FD;
	Sat,  3 Feb 2024 03:52:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EBEA14FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706928788;
	bh=UemOCUX9OC/jB7lWASuqhcBieye2GhhUA69QsoWo44I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gTk9v+Q1XFBk1tWW5zcQfpzF22/Tl5Ptkc26QRJoCMp+MrOi1plKnuVkDKTzch0X6
	 GxjcWHGSgTDNsD51HAkvyuslhx0swcIYIAG79mH6jlaFOQwLc5oaSPon50ECsUBkOD
	 agrsjrcvGmhkjunyjZb5eKg2r7K1ZHg3mr9v+s8U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1732CF89946; Sat,  3 Feb 2024 03:41:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6146F8060F;
	Sat,  3 Feb 2024 03:41:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FE0FF898ED; Sat,  3 Feb 2024 03:40:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D58A9F806D9
	for <alsa-devel@alsa-project.org>; Sat,  3 Feb 2024 03:38:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D58A9F806D9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=bOvbcF9l
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4132c63H024009;
	Sat, 3 Feb 2024 02:38:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=5vmvA/j8Eq+r73ofFDYJ
	664BV9DDh9rA330ASd5d/Rg=; b=bOvbcF9lEfc2DnRmzYzQ5zh+DDW4e8DwKtTs
	mWTBMQpYUOdDF3ISJCNAu0G5i9QVCBDjB1A4cjq0n8tjIpUC7LIlemAO7DsRn5RI
	RMR3MgaqFm6y8KpZJi+VzbMQimdmGI4xvyzgRKFHCynzCh5EPqk8kqKqUj4ESKcv
	Tn0DpcGmWaLFOg5oTV2gsm0k92EDsU+Rrd5XpYDpkRAxL0oxVUMaofrMsyyero2L
	cw9DIa4rFzjXUJGI1CwOX25XMSv8y1oyd0tCwEuuInNdj1l3kI06iuTA3UWT/mKd
	30O7uzJxSo9WKGdrxgYgB1KgkV6l4RY7qpCvF/ktSFjlgw3jTQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w0pwjjujb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 Feb 2024 02:38:05 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 4132bXsf008647
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 3 Feb 2024 02:37:33 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 2 Feb 2024 18:37:32 -0800
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
Subject: [PATCH v13 52/53] ASoC: qcom: Populate SoC components string
Date: Fri, 2 Feb 2024 18:36:44 -0800
Message-ID: <20240203023645.31105-53-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240203023645.31105-1-quic_wcheng@quicinc.com>
References: <20240203023645.31105-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: jjtMxWjlG0ucgCNvJnglWa15LLs-FZGM
X-Proofpoint-ORIG-GUID: jjtMxWjlG0ucgCNvJnglWa15LLs-FZGM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-02_16,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402030015
Message-ID-Hash: HPLIEAKUCAF3JEZUGCYADTUAAF4G7HD3
X-Message-ID-Hash: HPLIEAKUCAF3JEZUGCYADTUAAF4G7HD3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HPLIEAKUCAF3JEZUGCYADTUAAF4G7HD3/>
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
 sound/soc/qcom/common.c | 22 ++++++++++++++++++++++
 sound/soc/qcom/common.h |  1 +
 sound/soc/qcom/sm8250.c |  3 +++
 3 files changed, 26 insertions(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index c81a52f64ef8..bd83ac3f2638 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -258,4 +258,26 @@ int qcom_snd_usb_offload_jack_setup(struct snd_soc_pcm_runtime *rtd,
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
diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index fca3046c8674..8546723e0aa8 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -11,4 +11,5 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_soc_jack *jack, bool *jack_setup);
 int qcom_snd_usb_offload_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_soc_jack *jack, bool *jack_setup);
+int qcom_snd_add_components_string(struct snd_soc_pcm_runtime *rtd);
 #endif
diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 52136897cc92..2a5384dd5988 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -38,6 +38,9 @@ static int sm8250_snd_init(struct snd_soc_pcm_runtime *rtd)
 						&data->usb_offload_jack_setup);
 	else
 		ret = qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
+
+	qcom_snd_add_components_string(rtd);
+
 	return ret;
 }
 
