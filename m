Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1550C8152BE
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Dec 2023 22:58:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42400E84;
	Fri, 15 Dec 2023 22:57:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42400E84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702677481;
	bh=Q9v7m21SznsQRBxoPQiAbg8VdmmvPkGv0cpZczE0uEo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r/wzjAgmjY+WzkE2UjEZ93UK/C24tlX2ILCatrgmVwTMkamiRFsZfK8oGVF8Zx3IH
	 vFmFqtS2EgReZCm3mOadX2V0l0GZShwNFIJ9d9JFa9jZIvAHcBA86fwSCWGlIvOpDx
	 xDkNSi/lNSAQMyy+YnazYY7jTeHY6qATkdOjDkNk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 893FBF8971F; Fri, 15 Dec 2023 22:53:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53C7AF89716;
	Fri, 15 Dec 2023 22:53:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24B79F80563; Fri, 15 Dec 2023 22:51:50 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3179CF8057C
	for <alsa-devel@alsa-project.org>; Fri, 15 Dec 2023 22:50:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3179CF8057C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=NDrlnAam
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BFKvdnk020873;
	Fri, 15 Dec 2023 21:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=VRemWOXPXiXIlDmi9y+G
	Tnchb7p3I7IDu6uqBmXbsdI=; b=NDrlnAamURQieEklDgc7H+gQm9sdX9f4hoi5
	1lgndqa8pA6uBG3v++dp2eKv9LnV8nvoXbo+RDHdgse7Gw622pXmrtHsZb0gUJue
	zWx86yCuQG6AxRPBHhG2Jl/gEgYQPXsI3K/yfdus5JgJlUAFbq/FMxhzajreMYhx
	8tBmxx90hEedzIngkdae3FfpRJwRaG9ySnE5S0z2Vo/zjhdaUrWRSrRmhlLCMCN/
	vaXv+s/o+MC8/t1/wcP1+JlarrgPLTdD3gHgqxugw79cUyEOugsE8X01QH6PeNfu
	2TS1Zd7Up++9dzPaJ/L3eFIFOjXVrVj2Gx1JkvTEauaTmSRWfw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v0w1989gw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 21:50:14 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 3BFLoDjf012357
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 21:50:13 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 15 Dec 2023 13:50:13 -0800
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
Subject: [PATCH v10 25/41] ASoC: dt-bindings: Add Q6USB backend
Date: Fri, 15 Dec 2023 13:49:39 -0800
Message-ID: <20231215214955.12110-26-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231215214955.12110-1-quic_wcheng@quicinc.com>
References: <20231215214955.12110-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 0qvsCN4R9MAAFTM-4afJ4OLVnL5ZEAuy
X-Proofpoint-ORIG-GUID: 0qvsCN4R9MAAFTM-4afJ4OLVnL5ZEAuy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 mlxlogscore=988 suspectscore=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312150152
Message-ID-Hash: WN2G2UAAKNVXEJLUM7AJ7RZBPUZG4GZ7
X-Message-ID-Hash: WN2G2UAAKNVXEJLUM7AJ7RZBPUZG4GZ7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WN2G2UAAKNVXEJLUM7AJ7RZBPUZG4GZ7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a dt-binding to describe the definition of enabling the Q6 USB backend
device for audio offloading.  The node carries information, which is passed
along to the QC USB SND class driver counterpart.  These parameters will be
utilized during QMI stream enable requests.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 .../devicetree/bindings/sound/qcom,q6usb.yaml | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6usb.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6usb.yaml b/Documentation/devicetree/bindings/sound/qcom,q6usb.yaml
new file mode 100644
index 000000000000..37161d2aa96e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,q6usb.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,q6usb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm ASoC DPCM USB backend DAI
+
+maintainers:
+  - Wesley Cheng <quic_wcheng@quicinc.com>
+
+description:
+  The USB port is a supported AFE path on the Q6 DSP.  This ASoC DPCM
+  backend DAI will communicate the required settings to initialize the
+  XHCI host controller properly for enabling the offloaded audio stream.
+  Parameters defined under this node will carry settings, which will be
+  passed along during the QMI stream enable request and configuration of
+  the XHCI host controller.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - qcom,q6usb
+
+  iommus:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 1
+
+  qcom,usb-audio-intr-idx:
+    description:
+      Desired XHCI interrupter number to use.  Depending on the audio DSP
+      on the platform, it will operate on a specific XHCI interrupter.
+    $ref: /schemas/types.yaml#/definitions/uint16
+    maximum: 8
+
+required:
+  - compatible
+  - "#sound-dai-cells"
+  - qcom,usb-audio-intr-idx
+
+additionalProperties: false
+
+examples:
+  - |
+    dais {
+      compatible = "qcom,q6usb";
+      #sound-dai-cells = <1>;
+      iommus = <&apps_smmu 0x180f 0x0>;
+      qcom,usb-audio-intr-idx = /bits/ 16 <2>;
+    };
