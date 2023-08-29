Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF05878CE91
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 23:10:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FB84A4D;
	Tue, 29 Aug 2023 23:09:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FB84A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693343429;
	bh=WqxNjN0T0Qefe6aJfmx9LMEkVRgzMDdkUP+FS4t1qiY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rH41LYufMPCXufSyOUUwjBzyuXwKeMAJV26BQpGltfo04OGo/jg7/ai9n1pPlLyZQ
	 7CoUf1zrTFFo2HEtmRL6+IfT1eb6BwuanAwutArTjhD+yA62RWyaedhDQ+EWVhQGMs
	 HZZ+GWhGmb3Yp6xLSMKjrq5W+YL/z+QKwaXtxjHM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF49EF805EB; Tue, 29 Aug 2023 23:07:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29432F8057E;
	Tue, 29 Aug 2023 23:07:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69AF7F805CB; Tue, 29 Aug 2023 23:07:43 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 981E5F8025F
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 23:07:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 981E5F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=oZJ4gGoJ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37TKf3Wg021256;
	Tue, 29 Aug 2023 21:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=OQF7b9QgtG+XrfHB8YoGl3d3bHwtNZWp9D0tklgpySQ=;
 b=oZJ4gGoJHxOI+4DxWnvLAFTviBKYOoeNwAzkfMv6Rn0zKuX+lM1uaXTj2of6ntJzwbZE
 +7wmpU7Ump7AgcKFMyVX+vahC3ELzOsGGcb3/8ah18kXOEU+K8tBP92CGU2AA5+vdc/l
 aMN8cyZu6fhXQ/u0wn6OhV8CnCZ/R44CHfawhpVNv22U0Qlp2Bcp0rj8ybAKuPBKoiii
 YxStWizJlXsGzFEXOIQwNR3oTpiUfLFvf9rsxwutaAl+S2myTUZJXU6LOageOBUk2lc0
 FgMA2B3Fw71xue1aQMoOsps3Q5U3UApD5zZaVrAIoI6jVN/DaL9V7QaabnsWDK4Ajkky Eg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ss05233e1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Aug 2023 21:07:12 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 37TL7B9o000592
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
Subject: [PATCH v5 13/32] dt-bindings: usb: dwc3: Add snps,num-hc-interrupters
 definition
Date: Tue, 29 Aug 2023 14:06:38 -0700
Message-ID: <20230829210657.9904-14-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: QlAxm28dZV2wiUVoMfnuUidsRVAVdG90
X-Proofpoint-GUID: QlAxm28dZV2wiUVoMfnuUidsRVAVdG90
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_14,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=777 mlxscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2308290181
Message-ID-Hash: WTV5LDPUMUR4E6VCKTNRQLZVCN47FZ2A
X-Message-ID-Hash: WTV5LDPUMUR4E6VCKTNRQLZVCN47FZ2A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WTV5LDPUMUR4E6VCKTNRQLZVCN47FZ2A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a new definition for specifying how many XHCI secondary interrupters
can be allocated.  XHCI in general can potentially support up to 1024
interrupters, which some uses may want to limit depending on how many
users utilize the interrupters.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 .../devicetree/bindings/usb/snps,dwc3.yaml          | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
index a696f23730d3..596762ef9b9f 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
@@ -376,6 +376,19 @@ properties:
     items:
       enum: [1, 4, 8, 16, 32, 64, 128, 256]
 
+  snps,num-hc-interrupters:
+    description:
+      Defines the maximum number of XHCI host controller interrupters that can
+      be supported.  The XHCI host controller has support to allocate multiple
+      event rings, which can be assigned to different clients/users.  The DWC3
+      controller has a maximum of 8 interrupters.  If this is not defined then
+      the value will be defaulted to 1.  This parameter is used only when
+      operating in host mode.
+    $ref: /schemas/types.yaml#/definitions/uint8
+    minimum: 1
+    maximum: 8
+    default: 1
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
     description:
