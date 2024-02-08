Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACF884ED44
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Feb 2024 00:23:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7563D86F;
	Fri,  9 Feb 2024 00:23:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7563D86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707434616;
	bh=3t+oyyObCLNtDcTqp0pGT8TPY42C27S0xw+SlfeDuZ0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fNqZGSjqGfREETdkT8ufGjxFbP/fdX3qK9ojeUY3A07o10ZAW9foZbYMmpDbGLyT6
	 jiJFQsQZC3Ic4OXeAPIbajKfOeU4FUz+G93ajpHO+q4ncqVZcZHIeztTtSOYp317Sf
	 Ny941bAMuJqDqcApCQxopltGrZ7JdpKlpjW5NplM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19CFDF897D2; Fri,  9 Feb 2024 00:16:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5D0BF897DB;
	Fri,  9 Feb 2024 00:16:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3ABBF80C58; Fri,  9 Feb 2024 00:15:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CCC6FF805B5
	for <alsa-devel@alsa-project.org>; Fri,  9 Feb 2024 00:14:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCC6FF805B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=K2hj+YZu
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 418NEIaf017497;
	Thu, 8 Feb 2024 23:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=DYlDaoMzMP8hhWYbnbuV
	llKnwKPUMw5nutuR92LPe2U=; b=K2hj+YZu+y4JlOqaF68U0RvHAMROkv4naoV0
	GtSSs8VXS38a8RiWCPNi69+sbnM/heSuhxDVp+ftlWMhwMjYOywgigyI6m2hezOT
	eF/N1TA5L01gGlvm1OFkNJWaVeWivpODNs1qJ0EB4F/+y/Sj1PttjtzE9i1a3uQ4
	i3SqQ1ygSD69d5cvGAblj19ZSslQYeKpRV9eaDfl7s/d8by2CwnURsN3+ueXs1wU
	LLt39ke/NuZ9DnRPci5YMcQoSU5hhvWc7wSmXdW3A7HAxzkhw8heJXtTad1+osHg
	Z0cOGCnuLkjs8MAMhg0zuxG5RZlnwOZmtyX3XX99WPCRacf89A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w4sudj9yk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Feb 2024 23:14:27 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 418NEQQw009243
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Feb 2024 23:14:26 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 8 Feb 2024 15:14:26 -0800
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
Subject: [PATCH v14 39/53] ALSA: usb-audio: qcom: Populate PCM and USB chip
 information
Date: Thu, 8 Feb 2024 15:13:52 -0800
Message-ID: <20240208231406.27397-40-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240208231406.27397-1-quic_wcheng@quicinc.com>
References: <20240208231406.27397-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: AgMmo6ObVps9fInl0heZldMqQcOSiLcZ
X-Proofpoint-ORIG-GUID: AgMmo6ObVps9fInl0heZldMqQcOSiLcZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-08_11,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 bulkscore=0 phishscore=0
 mlxlogscore=678 clxscore=1015 priorityscore=1501 adultscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402080131
Message-ID-Hash: 7AS4VSAGGOC4SPOL53XYQZHPGV42WXPC
X-Message-ID-Hash: 7AS4VSAGGOC4SPOL53XYQZHPGV42WXPC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7AS4VSAGGOC4SPOL53XYQZHPGV42WXPC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently, only the index to the USB SND card array is passed to the USB
backend.  Pass through more information, specifically the USB SND card
number and the number of PCM devices available.  This allows for the DPCM
backend to determine what USB resources are available during situations,
such as USB audio offloading.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/usb/qcom/qc_audio_offload.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 31c0cf5916a0..17cee0cf2ff5 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -172,6 +172,21 @@ enum usb_qmi_audio_format {
 	USB_QMI_PCM_FORMAT_U32_BE,
 };
 
+static int usb_qmi_get_pcm_num(struct snd_usb_audio *chip, int direction)
+{
+	struct snd_usb_substream *subs = NULL;
+	struct snd_usb_stream *as;
+	int count = 0;
+
+	list_for_each_entry(as, &chip->pcm_list, list) {
+		subs = &as->substream[direction];
+		if (subs->ep_num)
+			count++;
+	}
+
+	return count;
+}
+
 static enum usb_qmi_audio_device_speed_enum_v01
 get_speed_info(enum usb_device_speed udev_speed)
 {
@@ -1626,6 +1641,8 @@ static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
 
 	sdev->card_idx = chip->card->number;
 	sdev->chip_idx = chip->index;
+	sdev->num_playback = usb_qmi_get_pcm_num(chip, 0);
+	sdev->num_capture = usb_qmi_get_pcm_num(chip, 1);
 	uadev[chip->card->number].sdev = sdev;
 
 	uaudio_qdev->last_card_num = chip->card->number;
