Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BFE81A969
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Dec 2023 23:49:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE2B31FE;
	Wed, 20 Dec 2023 23:49:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE2B31FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703112597;
	bh=8YEBwJty5d/XxzZG7HGGadc5+/YywJgoHwqmD3HhuGE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j6DM36Qq75Qw4QEPgV1lnC4HA0OVofPV5svQ65Z17S5NXjs9wU3Ne/JWug/jfIkaW
	 Z2McjYIUe9rANqse76l5SsgYwsxi0pqXVCL2jlToHhI6SDfNQvPQQqn9OKJdrSNyPN
	 zP7SLFx4Y09LGQLD3PALuIkB+/4sr85xMrMi1m6I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C522F8016E; Wed, 20 Dec 2023 23:47:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CAD08F805D4;
	Wed, 20 Dec 2023 23:47:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08BFBF80720; Wed, 20 Dec 2023 23:46:54 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A6D0F80567
	for <alsa-devel@alsa-project.org>; Wed, 20 Dec 2023 23:46:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A6D0F80567
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=jjK0AM62
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BKMgbEf031197;
	Wed, 20 Dec 2023 22:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=eMuCxRzjFJNCzXTHvKDH
	/OMHNktU6HnB8lTCQMc4++s=; b=jjK0AM627l9ydxnBTeYWDDRdA2WPPUCmEac1
	CYpppSZ/s2tUxHdtiZla6tUQIp9LNGggTE09NdeUe5PhHM0ZQibbofd3eQX0v1Y5
	eZaP/OC0hkGu8gLGZT27qNaWwbV6dAqq6bKywFGKtq7uD4Yld8gUKU/LbCZcgpDB
	/2HwWfrdlGlwjailM5Snrh+MWT4HAYTc5G+mv2nXTH30+q+GDVq5u0W40x08xz5c
	YPPyNsv0ymlFgeD+t1n0QCKOQnqn8qL/igeYr9gxLGfDhTRMlUE2Xt9lWrmVJGh6
	062mkMmFLpJ96xfZHA1XQ3+WkKLNd6VZdoJqTrULx7R7daPeQg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v3tmm2d5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Dec 2023 22:45:58 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 3BKMjwvQ008303
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Dec 2023 22:45:58 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 20 Dec 2023 14:45:57 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <gregkh@linuxfoundation.org>, <lgirdwood@gmail.com>,
        <andersson@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <konrad.dybcio@linaro.org>, <Thinh.Nguyen@synopsys.com>,
        <broonie@kernel.org>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <robh+dt@kernel.org>, <agross@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v11 14/41] dt-bindings: usb: xhci: Add num-hc-interrupters
 definition
Date: Wed, 20 Dec 2023 14:45:17 -0800
Message-ID: <20231220224544.18031-15-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231220224544.18031-1-quic_wcheng@quicinc.com>
References: <20231220224544.18031-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: g3V0QS7SarQUXzq-4aMU39bRL2o1P_1t
X-Proofpoint-ORIG-GUID: g3V0QS7SarQUXzq-4aMU39bRL2o1P_1t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 impostorscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=655 adultscore=0 malwarescore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312200163
Message-ID-Hash: RJYYKR6JJMBVGLMX4OZVZYZNQY43NZAZ
X-Message-ID-Hash: RJYYKR6JJMBVGLMX4OZVZYZNQY43NZAZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RJYYKR6JJMBVGLMX4OZVZYZNQY43NZAZ/>
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

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 Documentation/devicetree/bindings/usb/usb-xhci.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.yaml b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
index 180a261c3e8f..4238ae896ef6 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
@@ -29,6 +29,12 @@ properties:
     description: Interrupt moderation interval
     default: 5000
 
+  num-hc-interrupters:
+    description: Maximum number of interrupters to allocate
+    $ref: /schemas/types.yaml#/definitions/uint16
+    minimum: 1
+    maximum: 1024
+
 additionalProperties: true
 
 examples:
