Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 619347CCD86
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Oct 2023 22:09:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C48FEEBA;
	Tue, 17 Oct 2023 22:08:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C48FEEBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697573362;
	bh=h5tvhU6QoC0c0TLko1TwEhfTsX26/zLtkSoSr41pN9g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HY/xhAe/3U+weeOx3hmirI+De6PTOF8I+6LHAp08Q5hzIiTMM29S8FdZ9hjySgqLj
	 3mdNya1Np+4B1zUDCpfugyaZ44JGwSkVJizuGvpA22ujW8YEuwoYt2nwglcf6PtS6B
	 Ses3QiQJr01Lnixd9h7+ASJ5iQ1IF916TMRoMbOc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60210F806AC; Tue, 17 Oct 2023 22:03:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B794BF806A6;
	Tue, 17 Oct 2023 22:03:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66252F80679; Tue, 17 Oct 2023 22:02:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 99268F8019B
	for <alsa-devel@alsa-project.org>; Tue, 17 Oct 2023 22:01:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99268F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=hiMRSIr7
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39HGo1og012906;
	Tue, 17 Oct 2023 20:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=Kd7JVRVp+I+Xk7DXDTAeHHZpvD4f/oHbrP3CUMWtwu0=;
 b=hiMRSIr7RbWKDJXPpZkhPL+M9HXmsQ074xz2fR6Blzd3uGdgL6tZdujs5Q8IHBnbbt/j
 79Jb3bFrOBP9YGEOwonhd6rGiVltuguH6ow01WoImoox698sTxfP/4VMQjBpQgJVPyO9
 VbXt6BFC+t3JjkWBFCGTZ7qqA750oRe7gkhffK7h2GnXvrmMYJ7EMEhfTyTtQWigJ3RX
 XdcKKgkxWRNVa8hi8cZGaG/cD3GfxUP6r1soquruWSCF+rQbJoLrP1ASw6ce75agSQgl
 YgQ4ScrXvLh+j3TIp1oYlCgPO60BC5l7YKoC+lDrpY7zgdzym1tZTMy3IJ6L6aYg7aj9 iQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tsaf0u42k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 20:01:37 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 39HK1S2a027390
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 20:01:28 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Tue, 17 Oct 2023 13:01:27 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <bgoswami@quicinc.com>,
        <Thinh.Nguyen@synopsys.com>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v9 28/34] ASoC: qcom: qdsp6: Add support to track available
 USB PCM devices
Date: Tue, 17 Oct 2023 13:01:03 -0700
Message-ID: <20231017200109.11407-29-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231017200109.11407-1-quic_wcheng@quicinc.com>
References: <20231017200109.11407-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 2Tk-uyE0_F0qjFNQVrsmaSZboejwWAco
X-Proofpoint-ORIG-GUID: 2Tk-uyE0_F0qjFNQVrsmaSZboejwWAco
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-17_03,2023-10-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=894 malwarescore=0
 mlxscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310170170
Message-ID-Hash: QXYDKYEOE7CSUXK5OS3DON3GL5Q5BG7Z
X-Message-ID-Hash: QXYDKYEOE7CSUXK5OS3DON3GL5Q5BG7Z
X-MailFrom: quic_wcheng@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QXYDKYEOE7CSUXK5OS3DON3GL5Q5BG7Z/>
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
 sound/soc/qcom/qdsp6/q6usb.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index 329a7d4a3c01..d697cbe7f184 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -25,10 +25,18 @@
 
 #define SID_MASK	0xF
 
+struct q6usb_status {
+	unsigned int num_pcm;
+	unsigned int chip_index;
+	unsigned int pcm_index;
+};
+
 struct q6usb_port_data {
 	struct q6afe_usb_cfg usb_cfg;
 	struct snd_soc_usb *usb;
 	struct q6usb_offload priv;
+	unsigned long available_card_slot;
+	struct q6usb_status status[SNDRV_CARDS];
 	int active_idx;
 };
 
@@ -110,6 +118,14 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
 	if (connected) {
 		/* We only track the latest USB headset plugged in */
 		data->active_idx = sdev->card_idx;
+
+		set_bit(sdev->card_idx, &data->available_card_slot);
+		data->status[sdev->card_idx].num_pcm = sdev->num_playback;
+		data->status[sdev->card_idx].chip_index = sdev->chip_idx;
+	} else {
+		clear_bit(sdev->card_idx, &data->available_card_slot);
+		data->status[sdev->card_idx].num_pcm = 0;
+		data->status[sdev->card_idx].chip_index = 0;
 	}
 
 	return 0;
