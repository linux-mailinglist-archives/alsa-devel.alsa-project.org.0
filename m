Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A28852504
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 02:05:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C21FE7D;
	Tue, 13 Feb 2024 02:05:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C21FE7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707786313;
	bh=/CBCu7xtzLoC6vN95Vv2nxS4gvDbU4mm+K3QyU75FAU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gANGo73Xxor3V+UJmR+I1DWzERkmRw7lyKJ6H+3CL6nNCISIu6oCNif/1uqThAUJl
	 lw9i20dc3f3EJ7j8Zey4S3Ata0sfrJCqiO20us/FZMKpNBUtj6urojlR2CEPaHH+yP
	 Kj35/w9y/eG5icIalRmGOPWSZo9g9jSzoDgIPW/E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A873BF89869; Tue, 13 Feb 2024 01:57:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C83EF89872;
	Tue, 13 Feb 2024 01:57:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A9C0F89674; Tue, 13 Feb 2024 01:56:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7D5AF805AF
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 01:54:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7D5AF805AF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=Bz1dLKH6
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41CMULkP014138;
	Tue, 13 Feb 2024 00:54:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=Rknx4yFlGtTVBQ/y80iN
	V/1i6qwGSOJ39GzerqlUVGA=; b=Bz1dLKH6BPpIVv16JP7teGrtUFFG30o9T9cj
	cns5AnVjp4haZCEVHFaiDhzzHREL1AIUMegSljuvsk17dc4RlBYwyj5eUUkoeUoU
	yGNiDUTygkGPYTRx1RFw4BY1dAG+uAF4GBoGh3ewy9PMUS0HZzw7NSI/kv0h6dGt
	L4kVTI/mJA2oFYOvfU0zEhcHAfdA/9xCHAuN1N8LmgGuxSV4zo22YpTEwexeo/N3
	PDQgeu6dEyiv1POqBNIrXjbDkU06ztU3S6sanuGMaIgB/MsGHNCby0652vyPMmWY
	3kUkwIYy0C8otLcwHrH2S8SJMqK3Q0B48fyqLUABmy+tmq6jtA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w7s390kbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 00:54:44 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 41D0shMi030059
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 00:54:43 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 12 Feb 2024 16:54:43 -0800
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
Subject: [PATCH v15 38/50] ASoC: qcom: qdsp6: Add support to track available
 USB PCM devices
Date: Mon, 12 Feb 2024 16:54:10 -0800
Message-ID: <20240213005422.3121-39-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240213005422.3121-1-quic_wcheng@quicinc.com>
References: <20240213005422.3121-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: QyEi1xdc81R80fnhXLHwtalCXmHLLtDx
X-Proofpoint-GUID: QyEi1xdc81R80fnhXLHwtalCXmHLLtDx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_20,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 spamscore=0 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=948 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402130005
Message-ID-Hash: XJRHSG7VKHXL4PUP5BCWBXF5UCV3YLNP
X-Message-ID-Hash: XJRHSG7VKHXL4PUP5BCWBXF5UCV3YLNP
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The USB backend should know about which sound resources are being shared
between the ASoC and USB SND paths.  This can be utilized to properly
select and maintain the offloading devices.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/soc/qcom/qdsp6/q6usb.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index 833a57deb321..e539b411c35e 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -27,11 +27,18 @@
 
 #define Q6_USB_SID_MASK	0xF
 
+struct q6usb_status {
+	struct snd_soc_usb_device *sdev;
+	unsigned int pcm_index;
+};
+
 struct q6usb_port_data {
 	struct q6afe_usb_cfg usb_cfg;
 	struct snd_soc_usb *usb;
 	struct q6usb_offload priv;
 	int active_usb_chip_idx;
+	unsigned long available_card_slot;
+	struct q6usb_status status[SNDRV_CARDS];
 };
 
 static const struct snd_soc_dapm_widget q6usb_dai_widgets[] = {
@@ -113,6 +120,12 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
 	if (connected) {
 		/* We only track the latest USB headset plugged in */
 		data->active_usb_chip_idx = sdev->card_idx;
+
+		set_bit(sdev->card_idx, &data->available_card_slot);
+		data->status[sdev->card_idx].sdev = sdev;
+	} else {
+		clear_bit(sdev->card_idx, &data->available_card_slot);
+		data->status[sdev->card_idx].sdev = NULL;
 	}
 
 	return 0;
