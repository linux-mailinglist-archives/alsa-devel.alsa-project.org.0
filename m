Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAAC999653
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2024 02:11:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D66BB71;
	Fri, 11 Oct 2024 02:10:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D66BB71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728605466;
	bh=ltXX8jP7pn8uVpu5KSPpn79cIYm5HfBGTiCUp+UHg9k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RoK62gNuap+tUiqmdbs9SbLLwmaIGIbLndnFi/FWnd/GtouUvOCmBuIhuYBRTrlDS
	 xBntsauxZKs47yqd2FbO3M3j8GHKCjWHKZPu6mmBjADkHyM7WdmxsZbCe5PCYujU3k
	 S2xVXdQN/w6YOF6d7z0UOLiqIIA1L0r8jxN/MdHE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D298AF805FE; Fri, 11 Oct 2024 02:08:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A08DF8076B;
	Fri, 11 Oct 2024 02:08:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C765F805E0; Fri, 11 Oct 2024 02:07:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8765F805A8
	for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2024 02:07:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8765F805A8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=MBfEdBIk
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 49ACE2VE010428;
	Fri, 11 Oct 2024 00:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AN6ZcvMWlqNjOXpEc6FdiWAhkqYqJERCJ3muWeL5xeM=; b=MBfEdBIkYwZiBjYl
	CSXMtMtf9oKIl0fkzffS9qVBbTxNwzy3CpSIYKllLHt1dasDRmeOIVhWv8+9v+Vq
	q78YGkbtdLd2NgerDdmino2bUqFbtb+5mgCkTL2zsKDKTs7+ScywjOqM4skKMp+F
	HgXGUgtZom6x2V7eZIUt3goIMnVhei4AJGZTRB3gwOqAp2blmuCwZkkAA79/g2sL
	CB/5M82PtLwA2cjvV7dkHhJZF4ETM1pezaCKGEDqhTeXNyfOD0V1qq3kLpVuxsR2
	FH3K40YyOY/eFqwQxAmJp6XtsLpE3PcOiqGjbjuCJVKJwMuOQAvPxhQut4ufk6Dn
	Sr7/LQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425tn150vw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 00:07:07 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 49B07653020021
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 00:07:06 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 17:07:06 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>,
        <pierre-louis.bossart@linux.intel.com>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>
Subject: [PATCH v28 07/32] usb: host: xhci-plat: Set XHCI max interrupters if
 property is present
Date: Thu, 10 Oct 2024 17:05:59 -0700
Message-ID: <20241011000650.2585600-15-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241011000650.2585600-1-quic_wcheng@quicinc.com>
References: <20241011000650.2585600-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 2hfbzmCMQCB-NQfuhBr1Bl-lArDvQFyQ
X-Proofpoint-GUID: 2hfbzmCMQCB-NQfuhBr1Bl-lArDvQFyQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100159
Message-ID-Hash: FJTHKC74VP3QBM6IAJSIPH6R5MINW75H
X-Message-ID-Hash: FJTHKC74VP3QBM6IAJSIPH6R5MINW75H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FJTHKC74VP3QBM6IAJSIPH6R5MINW75H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some platforms may want to limit the number of XHCI interrupters allocated.
This is passed to xhci-plat as a device property.  Ensure that this is read
and the max_interrupters field is set.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-plat.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 3d071b875308..1c12cadc02a1 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -258,6 +258,8 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 
 		device_property_read_u32(tmpdev, "imod-interval-ns",
 					 &xhci->imod_interval);
+		device_property_read_u16(tmpdev, "num-hc-interrupters",
+					 &xhci->max_interrupters);
 	}
 
 	/*
