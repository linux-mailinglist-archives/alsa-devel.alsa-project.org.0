Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C136B1787
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Mar 2023 01:06:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBC6318AD;
	Thu,  9 Mar 2023 01:05:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBC6318AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678320372;
	bh=M09MkbliSWWoZGEQiSJq8s4Oj+PYMyJAHGupvOzr8Ag=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MzHxphXP0gqxRdVsz3sF0Vwl0/TljiE3lxS1WzNRGWSuFhUrVe6SmxPuzxqewhRTl
	 LX/Q7pfYElvLecedva4CilOcUz7WSYrYqJRLQoHglObd3tAz4eDf2g9EzsmNyhwbF4
	 HUjvX3ahZtPJoYUXFkmSUwQwjjcsWArQe3+ylGVY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7E05F80600;
	Thu,  9 Mar 2023 00:59:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43EC4F805C1; Thu,  9 Mar 2023 00:59:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9E2AF80557
	for <alsa-devel@alsa-project.org>; Thu,  9 Mar 2023 00:58:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9E2AF80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=oYtzkW1A
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 328K8Avu017405;
	Wed, 8 Mar 2023 23:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=0Cb4kpHPUQsn2sdakstI25sJvfLYrwtdEAZ3IGoRd+8=;
 b=oYtzkW1AXIH0kfPjZpfSx63fTLKaK7WaomATVLF/XcUK+OrAamKf+1/MO4Ywft8fRBGQ
 bMkigKmytOJMzbUtr+gGiCN/vjTsIRYSgdBBBQ2oQ/8UrluSmScu7/mFStHuhdshGeMv
 KN9GDqOcS3FSnbk1IxjX8xQZxb9rwdt2ReC3OWy6Qb/6IvDbyTj3NAISvQeoIoiUqoWI
 2+R6oW+WQq+dezwJh+5KP64qwXFJiYOtKX+N7IMerYw5yqvoaMjG4SyHU3wrP3GCVjPY
 65K49OPr62XtKeMnQt5wHtXiaqu0KZPm/JOUUY8Lr7HX7yfC/KWqGKn7P53k9MYM7cA7 vw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p6vnah88u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Mar 2023 23:58:13 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 328NwDe6016313
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Mar 2023 23:58:13 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Wed, 8 Mar 2023 15:58:12 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzysztof.kozlowski+dt@linaro.org>, <agross@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <bgoswami@quicinc.com>,
        <andersson@kernel.org>, <robh+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <tiwai@suse.com>
Subject: [PATCH v3 27/28] sound: usb: card: Allow for rediscovery of connected
 USB SND devices
Date: Wed, 8 Mar 2023 15:57:50 -0800
Message-ID: <20230308235751.495-28-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230308235751.495-1-quic_wcheng@quicinc.com>
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: tbAGHuJxD45blQGUq_vyv07IC4r-k_pr
X-Proofpoint-ORIG-GUID: tbAGHuJxD45blQGUq_vyv07IC4r-k_pr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_15,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 mlxlogscore=999 impostorscore=0 mlxscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303080200
Message-ID-Hash: FYJZWT4ECCKLDX3ADXCYQS4BZU6ILYDT
X-Message-ID-Hash: FYJZWT4ECCKLDX3ADXCYQS4BZU6ILYDT
X-MailFrom: quic_wcheng@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com,
 Wesley Cheng <quic_wcheng@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FYJZWT4ECCKLDX3ADXCYQS4BZU6ILYDT/>
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
 sound/usb/card.c | 19 +++++++++++++++++++
 sound/usb/card.h |  2 ++
 2 files changed, 21 insertions(+)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index e51461ac33cd..25267c1cc64e 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -170,6 +170,25 @@ struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
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
+	mutex_lock(&register_mutex);
+	for (i = 0; i < SNDRV_CARDS; i++) {
+		if (usb_chip[i])
+			if (platform_ops && platform_ops->connect_cb)
+				platform_ops->connect_cb(usb_chip[i]);
+	}
+	mutex_unlock(&register_mutex);
+}
+EXPORT_SYMBOL_GPL(snd_usb_rediscover_devices);
+
 /*
  * disconnect streams
  * called from usb_audio_disconnect()
diff --git a/sound/usb/card.h b/sound/usb/card.h
index 922868d2dccd..7bbaee87a48a 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -219,6 +219,7 @@ int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops);
 int snd_usb_unregister_platform_ops(void);
 struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
 			struct snd_pcm_hw_params *params, int direction);
+void snd_usb_rediscover_devices(void);
 #else
 int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops)
 {
@@ -235,5 +236,6 @@ struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
 {
 	return NULL;
 }
+void snd_usb_rediscover_devices(void) { }
 #endif /* IS_ENABLED(CONFIG_SND_USB_AUDIO) */
 #endif /* __USBAUDIO_CARD_H */
