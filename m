Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A9996500D
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2024 21:50:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECC3885D;
	Thu, 29 Aug 2024 21:49:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECC3885D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724961001;
	bh=Gx78dVZPi6zqeiFdZlVe5kyrEbBXxgAVc+WTPad6N64=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fKPVuLiwgJ0cGwVkwfjFEFSB560TZFJNAjSX4+jocMdBTKTxUKot+9R9kOgya0k1f
	 QqVA/ti8LZkhT2UFPKzJNU2sZcUjigUhOMXUjocTFT5yRX0m2nDAIWnYOd0lWfdBQg
	 Pzv811VwEVdHLvCGGZJe1QSB4CUbIVVgjQd2hA2w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2376F897AE; Thu, 29 Aug 2024 21:43:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A604F897AA;
	Thu, 29 Aug 2024 21:43:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CCF3F805CB; Thu, 29 Aug 2024 21:42:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC879F805D2
	for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2024 21:41:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC879F805D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=eIc/WXqA
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 47TH7D46023319;
	Thu, 29 Aug 2024 19:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VAp/YzHcakSvk64Sq0sPNXYs9XlsMZu1xWybjwi7XY4=; b=eIc/WXqA23ka90Fb
	8eo3Rmxt65xuWIkHn/jvEOz63vt3hKCOT5SwbK8F3rebkPABH6//bQWDU4g5+Umz
	S4qUeGZMcAm0gJumApDpqW1VV+fcuL542PO4x930JW4ZushmrHK4RawLkljZ17cm
	GTzVNkXXW4Mg/YxyeCL9q3bI2VZxlzsN/Oa4gKhXPCatVLZHdIvKuTlymy8bb36w
	VmJ8O7jLNq6XpKV1MIGz5N8hzFa5/M7qo44ffvEX0nycpitIEMbXHBYlGhz9vgx5
	ROfLOxLPRr3R/iGpwH9Ehv0LDsV3YnKYhC+ik47cAnzK8Cbs/rAWQ/08I7F4ioG4
	2/q9Rw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41a612mddm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 19:41:35 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 47TJfXLc019344
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 19:41:33 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 Aug 2024 12:41:33 -0700
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
Subject: [PATCH v26 32/33] ALSA: usb-audio: Allow for rediscovery of connected
 USB SND devices
Date: Thu, 29 Aug 2024 12:41:04 -0700
Message-ID: <20240829194105.1504814-33-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: 6E4MPE58EDVhReuEx7iQBcJqo_WU8u2f
X-Proofpoint-ORIG-GUID: 6E4MPE58EDVhReuEx7iQBcJqo_WU8u2f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_06,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 mlxlogscore=999 adultscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290139
Message-ID-Hash: MNAWIBVXH65G3MCK3FSBY2FSN2ELOC26
X-Message-ID-Hash: MNAWIBVXH65G3MCK3FSBY2FSN2ELOC26
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MNAWIBVXH65G3MCK3FSBY2FSN2ELOC26/>
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
 sound/usb/card.h                  |  2 ++
 sound/usb/qcom/qc_audio_offload.c |  2 ++
 3 files changed, 25 insertions(+)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 7f120aa006c0..b1255e7c02de 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -155,6 +155,27 @@ int snd_usb_unregister_platform_ops(void)
 }
 EXPORT_SYMBOL_GPL(snd_usb_unregister_platform_ops);
 
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
  * Checks to see if requested audio profile, i.e sample rate, # of
  * channels, etc... is supported by the substream associated to the
diff --git a/sound/usb/card.h b/sound/usb/card.h
index d8b8522e1613..94404c24d240 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -222,4 +222,6 @@ snd_usb_find_suppported_substream(int card_idx, struct snd_pcm_hw_params *params
 
 int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops);
 int snd_usb_unregister_platform_ops(void);
+
+void snd_usb_rediscover_devices(void);
 #endif /* __USBAUDIO_CARD_H */
diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 5b9262a116be..2dc651cd3d05 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1929,6 +1929,8 @@ static int __init qc_usb_audio_offload_init(void)
 	if (ret < 0)
 		goto release_qmi;
 
+	snd_usb_rediscover_devices();
+
 	return 0;
 
 release_qmi:
