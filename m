Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9729857528
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Feb 2024 05:11:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C1D414E1;
	Fri, 16 Feb 2024 05:11:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C1D414E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708056715;
	bh=t1coPPh7bbzlyKGY9pIOa0gr7cpdnnim0/QNGMX+sb8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Zjv7MMmBOk06Y3BX3lLI8lfBN1D5+h6sFi4F/29nrNdViEfrDyi6rJbWn/A/JwwUl
	 lsgugjyVsknkx9D6620jElZgaWXbzkTggCbjKzvdd1/0GYpfCiv0fMZq7a8uPoWec7
	 EUWjphcWZmtG5VcskVON9eJTF3x5B3KZlnIu0BZg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87866F8079B; Fri, 16 Feb 2024 05:02:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94AADF89795;
	Fri, 16 Feb 2024 05:02:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94776F896F0; Fri, 16 Feb 2024 05:01:55 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E9568F805C1
	for <alsa-devel@alsa-project.org>; Fri, 16 Feb 2024 04:59:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9568F805C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=PeNXsvGI
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41G2o3Q9031456;
	Fri, 16 Feb 2024 03:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=Y3ODRPL50F2IeY5dbnIP
	gWP9b5aWXN2Zf5kMYIz/EGs=; b=PeNXsvGIMVcLS4NatZ3ENe/BnzoO+iQUyg1+
	mP4BY2rkzYV9M3qw4RGXdMJ+PtiD4kCgxWsazejfZX6FC1cXPSrrd7IM/vTpl/NM
	PySgaMTL+v5BPx2VwV00Oa+KDMY3BrRc/EFdJKoL8ZfK3EIsS5sZfJvviiLmTqq8
	XaYJvAE+nj+w7TNVyRzh4ApvyhItcutdeNG3UtOyUdLFW+bYnJjXLDPFP/cjzCeo
	zr4mp9EcaqD7Md11OgPpKjBIJv0WlArB97fWBTgXE9JmrD/ib97Wj3Jx8RsjoXKk
	bRSjNO+3Ahlx7jUp0aVMjQlA2AKkGeP4vYqtZHLKgEWWvKwbtg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w9cd4aygm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 03:59:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 41G3xkA9029714
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 03:59:46 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 15 Feb 2024 19:59:45 -0800
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
Subject: [PATCH v16 47/50] ALSA: usb-audio: qcom: Use card and PCM index from
 QMI request
Date: Thu, 15 Feb 2024 19:59:20 -0800
Message-ID: <20240216035923.23392-48-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240216035923.23392-1-quic_wcheng@quicinc.com>
References: <20240216035923.23392-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: iRJmUpu5ELcdhbWW_Ml6rtFIgTvP7ht_
X-Proofpoint-ORIG-GUID: iRJmUpu5ELcdhbWW_Ml6rtFIgTvP7ht_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_02,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402160030
Message-ID-Hash: HNGLS7RYS3HF2M226YIHQJAAU6U6A7FS
X-Message-ID-Hash: HNGLS7RYS3HF2M226YIHQJAAU6U6A7FS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HNGLS7RYS3HF2M226YIHQJAAU6U6A7FS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Utilize the card and PCM index coming from the USB QMI stream request.
This field follows what is set by the ASoC USB backend, and could
potentially carry information about a specific device selected through the
ASoC USB backend.  The backend also has information about the last USB
sound device plugged in, so it can choose to select the last device plugged
in, accordingly.

Change-Id: I3083ab525f0cf1224814201036fd2ff8f9d44a34
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/usb/card.c                  | 21 +++++++++++++++++++++
 sound/usb/card.h                  |  1 +
 sound/usb/qcom/qc_audio_offload.c | 10 ++++------
 3 files changed, 26 insertions(+), 6 deletions(-)

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
index 2c8c51c8b1ea..68c8c5f12c1a 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -221,4 +221,5 @@ int snd_usb_unregister_platform_ops(void);
 
 struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
 			struct snd_pcm_hw_params *params, int direction);
+void snd_usb_rediscover_devices(void);
 #endif /* __USBAUDIO_CARD_H */
diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 6a25a390f8ae..5e7da9a033e5 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -107,8 +107,6 @@ struct uaudio_qmi_dev {
 	bool er_mapped;
 	/* reference count to number of possible consumers */
 	atomic_t qdev_in_use;
-	/* idx to last udev card number plugged in */
-	unsigned int last_card_num;
 };
 
 struct uaudio_dev {
@@ -1256,7 +1254,7 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 
 	pcm_dev_num = (req_msg->usb_token & QMI_STREAM_REQ_DEV_NUM_MASK) >> 8;
 	xfer_buf_len = req_msg->xfer_buff_size;
-	card_num = uaudio_qdev->last_card_num;
+	card_num = (req_msg->usb_token & QMI_STREAM_REQ_CARD_NUM_MASK) >> 16;
 
 	if (!uadev[card_num].ctrl_intf) {
 		dev_err(&subs->dev->dev, "audio ctrl intf info not cached\n");
@@ -1449,8 +1447,7 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
 
 	direction = (req_msg->usb_token & QMI_STREAM_REQ_DIRECTION);
 	pcm_dev_num = (req_msg->usb_token & QMI_STREAM_REQ_DEV_NUM_MASK) >> 8;
-	pcm_card_num = req_msg->enable ? uaudio_qdev->last_card_num :
-				ffs(uaudio_qdev->card_slot) - 1;
+	pcm_card_num = (req_msg->usb_token & QMI_STREAM_REQ_CARD_NUM_MASK) >> 16;
 	if (pcm_card_num >= SNDRV_CARDS) {
 		ret = -EINVAL;
 		goto response;
@@ -1658,7 +1655,6 @@ static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
 	sdev->num_capture = usb_qmi_get_pcm_num(chip, 1);
 	uadev[chip->card->number].sdev = sdev;
 
-	uaudio_qdev->last_card_num = chip->card->number;
 	snd_soc_usb_connect(usb_get_usb_backend(udev), sdev);
 
 	snd_usb_offload_create_ctl(chip);
@@ -1879,6 +1875,8 @@ static int __init qc_usb_audio_offload_init(void)
 	if (ret < 0)
 		goto release_qmi;
 
+	snd_usb_rediscover_devices();
+
 	return 0;
 
 release_qmi:
