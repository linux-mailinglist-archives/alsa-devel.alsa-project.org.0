Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CCC78CE9E
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 23:13:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0A11E75;
	Tue, 29 Aug 2023 23:12:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0A11E75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693343598;
	bh=7EQv5LDN/auo45T1+Td4Stfz1qaUxVxQ1Z4fDIT5nPw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CItjE7oTQkfUP7Q25I65t0ByfnvvqPtIstNKkqZ/XOCAYwCQJ37sjQ53lGg4lff+H
	 u1S78q1ffeRtcZ/LP84fhXu/nB1rGEMvUc5pXA/QEpVufBYzHjxZMc50yaCnVB6dey
	 xO2pSvW6EkTVO15YFVHTIMxElR/r/qvNrWoa23rg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBED7F805C2; Tue, 29 Aug 2023 23:08:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6AE4F8057A;
	Tue, 29 Aug 2023 23:08:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85BEEF80608; Tue, 29 Aug 2023 23:08:08 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4AC81F8055C
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 23:07:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AC81F8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=pFwHqq+b
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37TKu4Ja005249;
	Tue, 29 Aug 2023 21:07:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=0HP3bHaoegNTa50F/fzhzdjgnBxlXCSBiA5Yu/y92ts=;
 b=pFwHqq+boiyoVlALFck+KZulumMqYYv3Z1gLtsVjQpP6tBYufGHI6CAZtumUctBlhjDf
 94kxxL8kyrx9FRgZSjpodywBckyGojmlIZSl9ssG02VA6QuGPqHEBulalyj5HResqOwz
 0tFFQAqoaNcJ1xeVWnHmn7jvTSSTgErt4AzmE0YcQAqfOUquerL8NlAmOjyO3C8rE/uS
 ak5KvfIa0QoBV70Jk55lV9qhKWgn2CglMnYQgUMcUVKg0hvnHFQ3HLkMq30GcTpsTiej
 8J8FVmaREX42Xdg+bZlcUZ1iOJ/e9Au8AG6D4NLfzo9aXSQs3erx22ceo0SCiM4XqCU/ LA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ssmcv8hb8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Aug 2023 21:07:15 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 37TL7EBM000613
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Aug 2023 21:07:14 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 29 Aug 2023 14:07:14 -0700
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
Subject: [PATCH v5 23/32] ASoC: dt-bindings: Add Q6USB backend
Date: Tue, 29 Aug 2023 14:06:48 -0700
Message-ID: <20230829210657.9904-24-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 1PwhrPKB_3htOps9zz2YpcVOTQ1uRK3Z
X-Proofpoint-GUID: 1PwhrPKB_3htOps9zz2YpcVOTQ1uRK3Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_14,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=896 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308290181
Message-ID-Hash: PY7PXQSSIORYPQWZACH5S2MNCG6KHJLW
X-Message-ID-Hash: PY7PXQSSIORYPQWZACH5S2MNCG6KHJLW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PY7PXQSSIORYPQWZACH5S2MNCG6KHJLW/>
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

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 .../bindings/sound/qcom,q6usb-dais.yaml       | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml
new file mode 100644
index 000000000000..72254d7e70d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,q6usb-dais.yaml#
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
+  qcom,usb-audio-intr-num:
+    description:
+      Desired XHCI interrupter number to use.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - "#sound-dai-cells"
+  - qcom,usb-audio-intr-num
+
+additionalProperties: false
+
+examples:
+  - |
+    dais {
+      compatible = "qcom,q6usb";
+      #sound-dai-cells = <1>;
+      iommus = <&apps_smmu 0x180f 0x0>;
+      qcom,usb-audio-intr-num = <2>;
+    };
