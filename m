Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0498AD847
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Apr 2024 01:00:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 943441667;
	Tue, 23 Apr 2024 01:00:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 943441667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713826814;
	bh=SLayrMPrKCeX3mTJTZZw4ERHQvhGxVB9sd/XJS5bt1s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UQoYLOKHzqbGApD6QEotCgACIWPGaaDlmtghXNsbJvE51S51CyUYXtrYJ+OP4y1gZ
	 bjl6iTMD3xXbTanA59PqBD1JC/4m7dpSPl353G7WgTAO/4QuRbn6AK1kTl88vhnOnw
	 Uo4Tvo+IRwBcIwXh/c9Q4kD/W8KsDqML2IoAWWqI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58D70F8988B; Tue, 23 Apr 2024 00:51:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B443EF8988F;
	Tue, 23 Apr 2024 00:51:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A82FDF89764; Tue, 23 Apr 2024 00:51:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E032FF805B4
	for <alsa-devel@alsa-project.org>; Tue, 23 Apr 2024 00:49:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E032FF805B4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=XFRjQYv8
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43MLgous013878;
	Mon, 22 Apr 2024 22:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=WE4eMHV9NquhxKSBZAOh
	+jR3lIlYYdfEvIV5PbHAVjw=; b=XFRjQYv80imCVT9e+WpbH/geU8MZuCYc6JeK
	VUYzXMmUFieKeluYVOMOMuP9LapshMjBUHbU60JRIOwUL14wPG0t2mPo98deLje8
	0UVFvbm3do4oRVq1bfimFW6sH+yDpApmmmNnKnTCAOq023OWjR9xw88Npwgoqrto
	n1yPUpGEhRARl0RLx4mIwBnAsdSkrhJy9Mlarj0HQ9I74t9exGbZP2iE2T3thabd
	SjkAvjHG6SFbtA9t78xlfqabB/tB+G746teXyzRyqvYgqO1DS87bMkUni/gDf3im
	EOhyrpKMA7dyn5dzKFTq8SpOVkgUKRlnW5ttBgKTlH/YDYC6/A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xnmuvhu4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 22:49:49 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 43MMnOYR003476
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 22:49:24 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 22 Apr 2024 15:49:23 -0700
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
Subject: [PATCH v19 27/41] ALSA: usb-audio: qcom: Populate PCM and USB chip
 information
Date: Mon, 22 Apr 2024 15:48:52 -0700
Message-ID: <20240422224906.15868-28-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240422224906.15868-1-quic_wcheng@quicinc.com>
References: <20240422224906.15868-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: a7jn_C8sXHD6vTkDYCZPAwZ7xuHLRoCa
X-Proofpoint-ORIG-GUID: a7jn_C8sXHD6vTkDYCZPAwZ7xuHLRoCa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_16,2024-04-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 mlxlogscore=810 clxscore=1015 priorityscore=1501
 mlxscore=0 suspectscore=0 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404220096
Message-ID-Hash: YZAQBAO32HUHNXBUESRZHI2UDFP6RJKD
X-Message-ID-Hash: YZAQBAO32HUHNXBUESRZHI2UDFP6RJKD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YZAQBAO32HUHNXBUESRZHI2UDFP6RJKD/>
List-Archive: <>
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
index db68c6c605eb..4deec0b6fc08 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -170,6 +170,21 @@ enum usb_qmi_audio_format {
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
@@ -1638,6 +1653,8 @@ static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
 
 	sdev->card_idx = chip->card->number;
 	sdev->chip_idx = chip->index;
+	sdev->num_playback = usb_qmi_get_pcm_num(chip, 0);
+	sdev->num_capture = usb_qmi_get_pcm_num(chip, 1);
 	uadev[chip->card->number].sdev = sdev;
 
 	uaudio_qdev->last_card_num = chip->card->number;
