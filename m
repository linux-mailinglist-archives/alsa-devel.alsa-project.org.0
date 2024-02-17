Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA178858BD0
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Feb 2024 01:29:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C8EE1A2D;
	Sat, 17 Feb 2024 01:29:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C8EE1A2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708129751;
	bh=8rL7gpr+KMGK5h66C78Gj6lXk/y7QT7KtlvsJ5lLGT4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OwVtP5DnoFGIyeFPDu64VCP8Qlk1D1Gq5NhCvZC6mj90/AlwAbyZ5zgxWC6rd08Jw
	 tREnYbQAPw7ISQNnhQhPc+50V++q94t+77gJ54X51vmFkucYHfxRaRLh89KHRRu6HW
	 eWuqN+C+dn2Z4+NAOtUtEwkHAxAZO1Evg96yMv7g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BAA50F8069F; Sat, 17 Feb 2024 01:23:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9985CF896B6;
	Sat, 17 Feb 2024 01:23:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55607F804CC; Sat, 17 Feb 2024 01:13:01 +0100 (CET)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C284DF805BA
	for <alsa-devel@alsa-project.org>; Sat, 17 Feb 2024 01:10:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C284DF805BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=g+goq07v
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41GKoGuq005859;
	Sat, 17 Feb 2024 00:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=R9awlAMukK9rQwp2tpzL
	wlf3jRryKK5BOUc5K2fhYe4=; b=g+goq07vlWlCYwl1GumphtEdYkHJXIzYTwr+
	9hf7N5RXMCr6KnwJzQAIUwVNlzDpY565rPjKr21bMfUW6KpnHVvFnPPkL15anzyQ
	mSsk7ji50vsGNoFM48czrP3D+PA6dFhuMv5ttekSTGnqfDdoilBzXlWl7AXSokJ8
	FRsvqCkk+x+fqUIyokG4rvuV6gzH30+ReT5AZk5Qe3CY/wN4STCWDYYNeodSvh2A
	z1Jzs/aWBKTgknK2cvbq7ESGrMEVyqAm0G8LU7pIzawlrwY06Hrh/2xpDG4lCbVi
	uiXz0MaeiHFY9yPEyG5uf7Z6yuVwFluEte3/GkJcrs0BUnuU9w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w9fkfcv5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Feb 2024 00:10:44 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 41H0AhO1029141
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Feb 2024 00:10:43 GMT
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
Subject: [PATCH v17 47/51] ALSA: usb-audio: Allow for rediscovery of connected
 USB SND devices
Date: Fri, 16 Feb 2024 16:10:13 -0800
Message-ID: <20240217001017.29969-48-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: _JhfinMOp0gSYJTIWFwxKoJdaD17xpXg
X-Proofpoint-GUID: _JhfinMOp0gSYJTIWFwxKoJdaD17xpXg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_23,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 suspectscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402160189
Message-ID-Hash: CO626XGET7ZUNV4TQ7SPAYW3OFHHL7U5
X-Message-ID-Hash: CO626XGET7ZUNV4TQ7SPAYW3OFHHL7U5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CO626XGET7ZUNV4TQ7SPAYW3OFHHL7U5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In case of notifying SND platform drivers of connection events, some of
these use cases, such as offloading, require an ASoC USB backend device to
be initialized before the events can be handled.  If the USB backend device
has not yet been probed, this leads to missing initial USB audio device
connection events.

Expose an API that traverses the usb_chip array for connected devices, and
to call the respective connection callback registered to the SND platform
driver.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/usb/card.c                  | 21 +++++++++++++++++++++
 sound/usb/card.h                  |  4 ++++
 sound/usb/qcom/qc_audio_offload.c |  2 ++
 3 files changed, 27 insertions(+)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 1ad99a462038..8364c5b8fbbf 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -186,6 +186,27 @@ struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
 }
 EXPORT_SYMBOL_GPL(snd_usb_find_suppported_substream);
 
+/*
+ * in case the platform driver was not ready at the time of USB SND
+ * device connect, expose an API to discover all connected USB devices
+ * so it can populate any dependent resources/structures.
+ */
+void snd_usb_rediscover_devices(void)
+{
+	int i;
+
+	guard(mutex)(&register_mutex);
+
+	if (!platform_ops || !platform_ops->connect_cb)
+		return;
+
+	for (i = 0; i < SNDRV_CARDS; i++) {
+		if (usb_chip[i])
+			platform_ops->connect_cb(usb_chip[i]);
+	}
+}
+EXPORT_SYMBOL_GPL(snd_usb_rediscover_devices);
+
 /*
  * disconnect streams
  * called from usb_audio_disconnect()
diff --git a/sound/usb/card.h b/sound/usb/card.h
index 0b14f7f4c743..003a6e2b4b23 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -222,11 +222,15 @@ int snd_usb_unregister_platform_ops(void);
 #if IS_ENABLED(CONFIG_SND_USB_AUDIO)
 struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
 				struct snd_pcm_hw_params *params, int direction);
+void snd_usb_rediscover_devices(void);
 #else
 static struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
 				struct snd_pcm_hw_params *params, int direction)
 {
 	return NULL;
 }
+
+void snd_usb_rediscover_devices(void)
+{ }
 #endif /* IS_ENABLED(CONFIG_SND_USB_AUDIO) */
 #endif /* __USBAUDIO_CARD_H */
diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 6a25a390f8ae..9695bf0ac1cd 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1879,6 +1879,8 @@ static int __init qc_usb_audio_offload_init(void)
 	if (ret < 0)
 		goto release_qmi;
 
+	snd_usb_rediscover_devices();
+
 	return 0;
 
 release_qmi:
