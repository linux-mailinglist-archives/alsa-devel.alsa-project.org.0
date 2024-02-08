Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CEC84EC67
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Feb 2024 00:15:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F309C84D;
	Fri,  9 Feb 2024 00:15:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F309C84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707434130;
	bh=AUzYa+W3vXThhkfZrkvq18z95m/MUhJSaK13Esrt9IU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uJTtp5IKVLtaeF5uIAlHKm515ltL+cLylfpTkzNUcTbL51ZbMBeiJNa/W6SbGwUC/
	 kOqHATCmeKQ7Lnu0s+pH5K+hhlCVIY5sqos5Lw5XAg3WX5XdZDocf/QoK4hKpdG02K
	 cV2+FIZVHeA0/I5q/sqBEEoOUHqdwvu0ngBBtQOQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05EFCF805F5; Fri,  9 Feb 2024 00:14:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E1F7F80607;
	Fri,  9 Feb 2024 00:14:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A52EF805BA; Fri,  9 Feb 2024 00:14:32 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A064AF800EE
	for <alsa-devel@alsa-project.org>; Fri,  9 Feb 2024 00:14:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A064AF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=F8n6wV8j
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 418Mqt56008173;
	Thu, 8 Feb 2024 23:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=jumcsyHAMPRdK6BBRrtX
	rViYw1o9e9jHI3H7NDZD9Tc=; b=F8n6wV8jo+3D4QCffSq7/J+CRknaj8BZan6H
	2vdUiWpqscI0/NfaYSGm+ykyvuspkiZ0VT3wwpqeCRrEihJJGdo5du54zYJ9pDmd
	0VkDAklAesRtj3IxJDOSfUQXyPz6MiqIZjlFqW7H7OFxACOkf2igx0A8EAUhJD2B
	YwfsfK3s9vwIchro7lznOQKxAF4nGVJCSy1CCChHzq+D/1z/Ot4KmTGI4BDHGKCf
	rtpjLiWM6drs9M0wv1W3+dyO2sUQlveN6i3ADBHCQl5Qg2B/ESk0jK2clEImVWwd
	ObuWTOGN5xZho6cSIsFdHfUzWx5L9m/MgosNPZEGL9It62hnYQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w4sns2aan-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Feb 2024 23:14:17 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 418NEGtP022030
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Feb 2024 23:14:16 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 8 Feb 2024 15:14:16 -0800
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
        <alsa-devel@alsa-project.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v14 02/53] xhci: fix off by one check when adding a secondary
 interrupter.
Date: Thu, 8 Feb 2024 15:13:15 -0800
Message-ID: <20240208231406.27397-3-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: VLcCHzYUv4yxZ_dA3mNz8QIsNh7SR_HZ
X-Proofpoint-GUID: VLcCHzYUv4yxZ_dA3mNz8QIsNh7SR_HZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-08_11,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402080131
Message-ID-Hash: VV3NML7GHADRXJZLQV2ND65DV4YDCESJ
X-Message-ID-Hash: VV3NML7GHADRXJZLQV2ND65DV4YDCESJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VV3NML7GHADRXJZLQV2ND65DV4YDCESJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Mathias Nyman <mathias.nyman@linux.intel.com>

The sanity check of interrupter index when adding a new interrupter is
off by one. intr_num needs to be smaller than xhci->max_interrupter to
fit the array of interrupters.

Luckily this doesn't cause any real word harm as xhci_add_interrupter()
is always called with a intr_num value smaller than xhci->max_interrupters
in any current kernel.

Should not be needed for stable as 6.7 kernel and older only supports
one interrupter, with intr_num always being zero.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-usb/e9771296-586d-456a-ac24-a82de79bb2e6@moroto.mountain/
Fixes: 4bf398e15aa4 ("xhci: split allocate interrupter into separate alloacte and add parts")
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Link: https://lore.kernel.org/r/20240125152737.2983959-3-mathias.nyman@linux.intel.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index d00d4d937236..a7716202a8dd 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2322,7 +2322,7 @@ xhci_add_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
 	u64 erst_base;
 	u32 erst_size;
 
-	if (intr_num > xhci->max_interrupters) {
+	if (intr_num >= xhci->max_interrupters) {
 		xhci_warn(xhci, "Can't add interrupter %d, max interrupters %d\n",
 			  intr_num, xhci->max_interrupters);
 		return -EINVAL;
