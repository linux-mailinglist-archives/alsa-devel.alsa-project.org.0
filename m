Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F05B78CE95
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 23:11:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA570DED;
	Tue, 29 Aug 2023 23:10:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA570DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693343487;
	bh=W/bLkAB5LoBmkaYNHeK9QY7s772M9iTOlR5zGxG8Phc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BBuf/oRCc9eXE5g5oT0cpBMq7UAFsP0g/vLHLrwTP22j5SJxEJ3+YUsvfnVuNqo9W
	 93ih6EDEmIXc0f69V8J3b/6fuXXToAVj3Mwh5Aay8rfLt6k3hn3JLTgbgoaxA6lQSF
	 qDV524osRHPk0zGPcAGMTK3wlOAvy6VjZiBqkt5U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E7EBF80558; Tue, 29 Aug 2023 23:08:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 719D9F8055A;
	Tue, 29 Aug 2023 23:08:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C726F805D8; Tue, 29 Aug 2023 23:07:49 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 24116F804F3
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 23:07:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24116F804F3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=VufTgBTL
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37TJFoiR020273;
	Tue, 29 Aug 2023 21:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=x8A4twoNnUA6dF3/4DuR2LoY41AUSvgrs+ekzYaTuY0=;
 b=VufTgBTLJMTKdafojiL8tzRYyJFDLIRMyWnbJIkQjh3/lInT2kHunoeTJFpD8PwEVCjK
 8uqGCxk5VFQPLhkCC+31g/rA1bVOAx9Xu8MDwrKCS04sd3PrlachMoN9XCH4LH1bC0nQ
 vo+GEVbXzdbBdTpe/qrt3Q+ea2Siq38ldWMtteoP4xDE6d7O7vFBXRdoe6OmtGID1vUE
 2C1p1ubMJ/Yn3G0P8cYfrmC1MCwcBjf2syjbVUgw2FVx9kEmgTdy4stsqpnY9YTQC7BS
 fy/lu8d0x79y+wTYaeXV6jzUtjUgrBFjEzs/ty2vG/F4FxSYTFk8fxuX++/N7XbDmo8Q Hw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ss2xbaxu4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Aug 2023 21:07:12 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 37TL7BaK005879
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Aug 2023 21:07:11 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 29 Aug 2023 14:07:11 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
        <agross@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <quic_jackp@quicinc.com>,
        <quic_plai@quicinc.com>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v5 14/32] dt-bindings: usb: xhci: Add num-hc-interrupters
 definition
Date: Tue, 29 Aug 2023 14:06:39 -0700
Message-ID: <20230829210657.9904-15-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230829210657.9904-1-quic_wcheng@quicinc.com>
References: <20230829210657.9904-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: HcieELqdVJ8tMcGjykKcCcw71pngVsKv
X-Proofpoint-GUID: HcieELqdVJ8tMcGjykKcCcw71pngVsKv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_15,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 mlxlogscore=566 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2308290182
Message-ID-Hash: Y33SZ6UQJM3RGTKCMZT5CW2CWTUV3RQ5
X-Message-ID-Hash: Y33SZ6UQJM3RGTKCMZT5CW2CWTUV3RQ5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y33SZ6UQJM3RGTKCMZT5CW2CWTUV3RQ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the definition for how many interrupts the XHCI host controller should
allocate.  XHCI can potentially support up to 1024 interrupters, which
implementations may want to limit.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 Documentation/devicetree/bindings/usb/usb-xhci.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.yaml b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
index 180a261c3e8f..2c05757cef01 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
@@ -29,6 +29,10 @@ properties:
     description: Interrupt moderation interval
     default: 5000
 
+  num-hc-interrupters:
+    description: Maximum number of interrupters to allocate
+    $ref: /schemas/types.yaml#/definitions/uint16
+
 additionalProperties: true
 
 examples:
