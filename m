Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 403517C4695
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Oct 2023 02:26:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F8B9A4A;
	Wed, 11 Oct 2023 02:25:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F8B9A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696983960;
	bh=UlLT/O3/HByWEkiraO2d34EgSyy75IDRaj2lGyy9tXc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZA2RlQf169pJc0BuCCzfKCN3Y6ymfPKkVivL4TIs9KDiMfWWekM9cr+WFYWc9tTp0
	 crAvhX1cAnWyNxQldU50/0u+dNheWxIOyK6hHbSTT7ad+6lQHtzuFHVN1dPwH4yRL2
	 YZ/GmRmXOCF4nkUnQ9kBANN+egVu849+rptadd94=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D376EF805EC; Wed, 11 Oct 2023 02:23:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB0A1F805EB;
	Wed, 11 Oct 2023 02:23:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98AFCF805E4; Wed, 11 Oct 2023 02:23:18 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 66215F8055A
	for <alsa-devel@alsa-project.org>; Wed, 11 Oct 2023 02:22:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66215F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=KBCYDHR/
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39AN8rUD031574;
	Wed, 11 Oct 2023 00:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=aiIxeXlTVe3WUSnGjZgKcL6gjJlYw1TLcNa8U6pmNOQ=;
 b=KBCYDHR/x8pNiJ7Van20TfgEAeJF+sBRNT5chW08GbyDs+qGrry0VmM01nSNZ6xgyNAs
 U8D06dKJFI7wiWpdQxLBg2fEXJVoRTrp8QKCkp4NuSFPripc+BANzonnKlWgZ7uyOyUC
 m8hd7PaUnc7SSUcxIfbpu88fQcdfr+OCsVT1F2jCJfid+ehKid8H+ZEWHH4ftwhVQQkF
 2z1Caz5O9SKCb/yo2Y6M6qeeRqyAiNYx/qQ2bVvp17H+iov1szS5uD7NllVG9tG9liaI
 TG3fq5BQzRvMtoOURGu0ZKkWpK6vJ2k9CxDCOcVM2sD+Gkc9BknvrCtQii8C0tgZQAR1 yQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tmr4qk13h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 00:22:33 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 39B0MXuh007860
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 00:22:33 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 10 Oct 2023 17:22:32 -0700
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
Subject: [PATCH v8 14/34] dt-bindings: usb: dwc3: Limit num-hc-interrupters
 definition
Date: Tue, 10 Oct 2023 17:21:26 -0700
Message-ID: <20231011002146.1821-15-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231011002146.1821-1-quic_wcheng@quicinc.com>
References: <20231011002146.1821-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: x4lHgFBlqe6qS0mLE4PgCTfkEJOTwnaP
X-Proofpoint-GUID: x4lHgFBlqe6qS0mLE4PgCTfkEJOTwnaP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-10_19,2023-10-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=736
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310110001
Message-ID-Hash: KULIFOEONT4Y7UK2VYVN7SU5COKHB6FA
X-Message-ID-Hash: KULIFOEONT4Y7UK2VYVN7SU5COKHB6FA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KULIFOEONT4Y7UK2VYVN7SU5COKHB6FA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Ensure that the number of XHCI secondary interrupters defined for a DWC3
based implementation is limited to 8.  XHCI in general can potentially
support up to 1024 interrupters.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
index d81c2e849ca9..3e9141e8a005 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
@@ -433,6 +433,10 @@ properties:
     items:
       enum: [1, 4, 8, 16, 32, 64, 128, 256]
 
+  num-hc-interrupters:
+    maximum: 8
+    default: 1
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
     description:
