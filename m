Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A4162111C
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Nov 2022 13:41:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50DD982C;
	Tue,  8 Nov 2022 13:41:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50DD982C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667911319;
	bh=Wr3VyT2qIhuUDvpY+4JU0bajfJFKoVz/OhA7B0lukrs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DjCHipTmltOBoyyxcH+XF4ct8o4p9nSsZnjs9giQTcxlNxrW3eM790vkE45M6mfBP
	 H6R8PHl663x8Zu4ESxLfkZZhcKnybxJ0OvBnu6BnR1QdlqK4oXBUcqyRvQcfbUutoN
	 95rK+n8gwI8hL/Gt37mJTj2v7b8pZDleECb+O4q4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52477F80570;
	Tue,  8 Nov 2022 13:40:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D16EF80557; Tue,  8 Nov 2022 13:40:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS,URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled
 version=3.4.0
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12971F80557
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 13:40:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12971F80557
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="Uyj9WBeM"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A8AA9Ec022439; Tue, 8 Nov 2022 12:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=IcJP5SJpHzU6MuCeScJ1pVX1BiPU37XmPO0Z+2TQOzQ=;
 b=Uyj9WBeMJxsxVOfpNMcCCiKJ+Al6SvL3RGqoR2rGu5zReZZgutMDA5qmzSnKIrwaqNTR
 X3mMKEaBKICr/dlqXAuxTUZDgmFsz2R1NGcl+CNuRTZ2lJMvDEB+1zMaw504OBv1ebRX
 a+d83r+ukeDQfMjqUGjwj1uca5Qa+m2pFDihrBG3VtiPTVuErDPf1LWr0fZ7wLuGLhbW
 WuFL/L1vp7RiPDslbf9/VSjDe7XE/cazUnFXAGNN8PKSQnxBdrDxyAQZ8iQabunbo2KP
 UiKigP4pHqnly8mm/t6dnNajX0TzPbpwnfPhP116LEPL6r1qMBgkoPDe+tRi1cgEIoUK cA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kqfyms5h0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Nov 2022 12:40:06 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2A8Ce680031504
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 8 Nov 2022 12:40:06 GMT
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 8 Nov 2022 04:39:59 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <vkoul@kernel.org>, <agross@kernel.org>, <andersson@kernel.org>,
 <robh+dt@kernel.org>, <broonie@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <quic_rohkumar@quicinc.com>, <srinivas.kandagatla@linaro.org>,
 <dianders@chromium.org>, <swboyd@chromium.org>,
 <judyhsiao@chromium.org>, <alsa-devel@alsa-project.org>,
 <quic_rjendra@quicinc.com>, <konrad.dybcio@somainline.org>,
 <mka@chromium.org>
Subject: [PATCH v5 4/4] dt-bindings: soundwire: Convert text bindings to DT
 Schema
Date: Tue, 8 Nov 2022 18:09:16 +0530
Message-ID: <1667911156-19238-5-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1667911156-19238-1-git-send-email-quic_srivasam@quicinc.com>
References: <1667911156-19238-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: O97yZD7xZmiQRFwGQwoUQUDruuniSyAm
X-Proofpoint-GUID: O97yZD7xZmiQRFwGQwoUQUDruuniSyAm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211080073
Cc: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Convert soundwire text bindings to DT Schema format.

Update interrupt property items as per device tree,
as it is not appropriately described in text file.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Co-developed-by: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
Signed-off-by: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
---
Changes since V4:
  -- Update interrupt names in example.
  -- Fix blank lines.
  -- Remove dependecy patch info.
Changes since V3:
  -- Remove subnode description and add appropriate pattern properties.
  -- Add interrput names in example.
  -- update some properties description.
  -- Revert minIteams change in previous version.
  -- Rebase to latest code base.
Changes since V2:
  -- Update commit message.
  -- Add child node property.
  -- Change file name.
  -- Remove minIteams for few properties.
  -- Remove redundant required properties.
  -- Remove redundant description for wakeup-source property.
  -- Update interrupt property items.
Changes since V1:
  -- Remove the status field in example.
  -- Remove interrupt-names property in the required list.
  -- Add the wakeup-source property.	
 
 .../devicetree/bindings/soundwire/qcom,sdw.txt     | 215 ------------------
 .../bindings/soundwire/qcom,soundwire.yaml         | 244 +++++++++++++++++++++
 2 files changed, 244 insertions(+), 215 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
 create mode 100644 Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
deleted file mode 100644
index e0faed8..0000000
--- a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
+++ /dev/null
@@ -1,215 +0,0 @@
-Qualcomm SoundWire Controller Bindings
-
-
-This binding describes the Qualcomm SoundWire Controller along with its
-board specific bus parameters.
-
-- compatible:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must be "qcom,soundwire-v<MAJOR>.<MINOR>.<STEP>",
-		    Example:
-			"qcom,soundwire-v1.3.0"
-			"qcom,soundwire-v1.5.0"
-			"qcom,soundwire-v1.5.1"
-			"qcom,soundwire-v1.6.0"
-			"qcom,soundwire-v1.7.0"
-- reg:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: the base address and size of SoundWire controller
-		    address space.
-
-- interrupts:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: should specify the SoundWire Controller core and optional
-		    wake IRQ
-
-- interrupt-names:
-	Usage: Optional
-	Value type: boolean
-	Value type: <stringlist>
-	Definition: should be "core" for core and "wakeup" for wake interrupt.
-
-- wakeup-source:
-	Usage: Optional
-	Value type: boolean
-	Definition: should specify if SoundWire Controller is wake up capable.
-
-- clock-names:
-	Usage: required
-	Value type: <stringlist>
-	Definition: should be "iface" for SoundWire Controller interface clock
-
-- clocks:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: should specify the SoundWire Controller interface clock
-
-- #sound-dai-cells:
-	Usage: required
-	Value type: <u32>
-	Definition: must be 1 for digital audio interfaces on the controller.
-
-- qcom,dout-ports:
-	Usage: required
-	Value type: <u32>
-	Definition: must be count of data out ports
-
-- qcom,din-ports:
-	Usage: required
-	Value type: <u32>
-	Definition: must be count of data in ports
-
-- qcom,ports-offset1:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: should specify payload transport window offset1 of each
-		    data port. Out ports followed by In ports.
-		    Value of 0xFF indicates that this option is not implemented
-		    or applicable for the respective data port.
-		    More info in MIPI Alliance SoundWire 1.0 Specifications.
-
-- qcom,ports-offset2:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: should specify payload transport window offset2 of each
-		    data port. Out ports followed by In ports.
-		    Value of 0xFF indicates that this option is not implemented
-		    or applicable for the respective data port.
-		    More info in MIPI Alliance SoundWire 1.0 Specifications.
-
-- qcom,ports-sinterval-low:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: should be sample interval low of each data port.
-		    Out ports followed by In ports. Used for Sample Interval
-		    calculation.
-		    Value of 0xFF indicates that this option is not implemented
-		    or applicable for the respective data port.
-		    More info in MIPI Alliance SoundWire 1.0 Specifications.
-
-- qcom,ports-word-length:
-	Usage: optional
-	Value type: <prop-encoded-array>
-	Definition: should be size of payload channel sample.
-		    Value of 0xFF indicates that this option is not implemented
-		    or applicable for the respective data port.
-		    More info in MIPI Alliance SoundWire 1.0 Specifications.
-
-- qcom,ports-block-pack-mode:
-	Usage: optional
-	Value type: <prop-encoded-array>
-	Definition: should be 0 or 1 to indicate the block packing mode.
-		    0 to indicate Blocks are per Channel
-		    1 to indicate Blocks are per Port.
-		    Out ports followed by In ports.
-		    Value of 0xFF indicates that this option is not implemented
-		    or applicable for the respective data port.
-		    More info in MIPI Alliance SoundWire 1.0 Specifications.
-
-- qcom,ports-block-group-count:
-	Usage: optional
-	Value type: <prop-encoded-array>
-	Definition: should be in range 1 to 4 to indicate how many sample
-		    intervals are combined into a payload.
-		    Out ports followed by In ports.
-		    Value of 0xFF indicates that this option is not implemented
-		    or applicable for the respective data port.
-		    More info in MIPI Alliance SoundWire 1.0 Specifications.
-
-- qcom,ports-lane-control:
-	Usage: optional
-	Value type: <prop-encoded-array>
-	Definition: should be in range 0 to 7 to identify which	data lane
-		    the data port uses.
-		    Out ports followed by In ports.
-		    Value of 0xFF indicates that this option is not implemented
-		    or applicable for the respective data port.
-		    More info in MIPI Alliance SoundWire 1.0 Specifications.
-
-- qcom,ports-hstart:
-	Usage: optional
-	Value type: <prop-encoded-array>
-	Definition: should be number identifying lowerst numbered coloum in
-		    SoundWire Frame, i.e. left edge of the Transport sub-frame
-		    for each port. Values between 0 and 15 are valid.
-		    Out ports followed by In ports.
-		    Value of 0xFF indicates that this option is not implemented
-		    or applicable for the respective data port.
-		    More info in MIPI Alliance SoundWire 1.0 Specifications.
-
-- qcom,ports-hstop:
-	Usage: optional
-	Value type: <prop-encoded-array>
-	Definition: should be number identifying highest numbered coloum in
-		    SoundWire Frame, i.e. the right edge of the Transport
-		    sub-frame for each port. Values between 0 and 15 are valid.
-		    Out ports followed by In ports.
-		    Value of 0xFF indicates that this option is not implemented
-		    or applicable for the respective data port.
-		    More info in MIPI Alliance SoundWire 1.0 Specifications.
-
-- qcom,dports-type:
-	Usage: optional
-	Value type: <prop-encoded-array>
-	Definition: should be one of the following types
-		    0 for reduced port
-		    1 for simple ports
-		    2 for full port
-		    Out ports followed by In ports.
-		    Value of 0xFF indicates that this option is not implemented
-		    or applicable for the respective data port.
-		    More info in MIPI Alliance SoundWire 1.0 Specifications.
-
-- reset:
-	Usage: optional
-	Value type: <prop-encoded-array>
-	Definition: Should specify the SoundWire audio CSR reset controller interface,
-		    which is required for SoundWire version 1.6.0 and above.
-
-- reset-names:
-	Usage: optional
-	Value type: <stringlist>
-	Definition: should be "swr_audio_cgcr" for SoundWire audio CSR reset
-		    controller interface.
-
-Note:
-	More Information on detail of encoding of these fields can be
-found in MIPI Alliance SoundWire 1.0 Specifications.
-
-= SoundWire devices
-Each subnode of the bus represents SoundWire device attached to it.
-The properties of these nodes are defined by the individual bindings.
-
-= EXAMPLE
-The following example represents a SoundWire controller on DB845c board
-which has controller integrated inside WCD934x codec on SDM845 SoC.
-
-soundwire: soundwire@c85 {
-	compatible = "qcom,soundwire-v1.3.0";
-	reg = <0xc85 0x20>;
-	interrupts = <20 IRQ_TYPE_EDGE_RISING>;
-	clocks = <&wcc>;
-	clock-names = "iface";
-	resets = <&lpass_audiocc LPASS_AUDIO_SWR_TX_CGCR>;
-	reset-names = "swr_audio_cgcr";
-	#sound-dai-cells = <1>;
-	qcom,dports-type = <0>;
-	qcom,dout-ports	= <6>;
-	qcom,din-ports	= <2>;
-	qcom,ports-sinterval-low = /bits/ 8  <0x07 0x1F 0x3F 0x7 0x1F 0x3F 0x0F 0x0F>;
-	qcom,ports-offset1 = /bits/ 8 <0x01 0x02 0x0C 0x6 0x12 0x0D 0x07 0x0A >;
-	qcom,ports-offset2 = /bits/ 8 <0x00 0x00 0x1F 0x00 0x00 0x1F 0x00 0x00>;
-
-	/* Left Speaker */
-	left{
-		....
-	};
-
-	/* Right Speaker */
-	right{
-		....
-	};
-};
diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
new file mode 100644
index 0000000..4114c5c
--- /dev/null
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -0,0 +1,244 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soundwire/qcom,soundwire.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SoundWire Controller
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+  - Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
+
+description:
+  The Qualcomm SoundWire controller along with its board specific bus parameters.
+
+properties:
+  compatible:
+    enum:
+      - qcom,soundwire-v1.3.0
+      - qcom,soundwire-v1.5.0
+      - qcom,soundwire-v1.5.1
+      - qcom,soundwire-v1.6.0
+      - qcom,soundwire-v1.7.0
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: specify the SoundWire controller core.
+      - description: specify the Soundwire controller wake IRQ.
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: core
+      - const: wakeup
+
+  clocks:
+    items:
+      - description: iface clock
+
+  clock-names:
+    items:
+      - const: iface
+
+  resets:
+    items:
+      - description: SWR_AUDIO_CGCR RESET
+
+  reset-names:
+    items:
+      - const: swr_audio_cgcr
+
+  '#sound-dai-cells':
+    const: 1
+
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 0
+
+  wakeup-source: true
+
+  qcom,din-ports:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: count of data in ports
+
+  qcom,dout-ports:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: count of data out ports
+
+  qcom,ports-word-length:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description: Size of payload channel sample.
+                 Value of 0xFF indicates that this option is not implemented
+                 or applicable for the respective data port.
+                 More info in MIPI Alliance SoundWire 1.0 Specifications.
+    minItems: 3
+    maxItems: 5
+
+  qcom,ports-sinterval-low:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description: Sample interval low of each data port.
+                 Out ports followed by In ports. Used for Sample Interval
+                 calculation.
+                 Value of 0xFF indicates that this option is not implemented
+                 or applicable for the respective data port.
+                 More info in MIPI Alliance SoundWire 1.0 Specifications.
+    minItems: 3
+    maxItems: 8
+
+  qcom,ports-offset1:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description: Payload transport window offset1 of each
+                 data port. Out ports followed by In ports.
+                 Value of 0xFF indicates that this option is not implemented
+                 or applicable for the respective data port.
+                 More info in MIPI Alliance SoundWire 1.0 Specifications.
+    minItems: 3
+    maxItems: 8
+
+  qcom,ports-offset2:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description: Payload transport window offset2 of each
+                 data port. Out ports followed by In ports.
+                 Value of 0xFF indicates that this option is not implemented
+                 or applicable for the respective data port.
+                 More info in MIPI Alliance SoundWire 1.0 Specifications.
+    minItems: 3
+    maxItems: 8
+
+  qcom,ports-lane-control:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description: Identify which data lane the data port uses.
+                 Out ports followed by In ports.
+                 Value of 0xFF indicates that this option is not implemented
+                 or applicable for the respective data port.
+                 More info in MIPI Alliance SoundWire 1.0 Specifications.
+    minItems: 3
+    maxItems: 5
+
+  qcom,ports-block-pack-mode:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description: Indicate the block packing mode.
+                 0 to indicate Blocks are per Channel
+                 1 to indicate Blocks are per Port.
+                 Out ports followed by In ports.
+                 Value of 0xFF indicates that this option is not implemented
+                 or applicable for the respective data port.
+                 More info in MIPI Alliance SoundWire 1.0 Specifications.
+    minItems: 3
+    maxItems: 8
+
+  qcom,ports-hstart:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description: Identifying lowerst numbered coloum in
+                 SoundWire Frame, i.e. left edge of the Transport sub-frame
+                 for each port. Values between 0 and 15 are valid.
+                 Out ports followed by In ports.
+                 Value of 0xFF indicates that this option is not implemented
+                 or applicable for the respective data port.
+                 More info in MIPI Alliance SoundWire 1.0 Specifications.
+    minItems: 3
+    maxItems: 5
+
+  qcom,ports-hstop:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description: Identifying highest numbered coloum in
+                 SoundWire Frame, i.e. the right edge of the Transport
+                 sub-frame for each port. Values between 0 and 15 are valid.
+                 Out ports followed by In ports.
+                 Value of 0xFF indicates that this option is not implemented
+                 or applicable for the respective data port.
+                 More info in MIPI Alliance SoundWire 1.0 Specifications.
+    minItems: 3
+    maxItems: 5
+
+  qcom,ports-block-group-count:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description: In range 1 to 4 to indicate how many sample
+                 intervals are combined into a payload.
+                 Out ports followed by In ports.
+                 Value of 0xFF indicates that this option is not implemented
+                 or applicable for the respective data port.
+                 More info in MIPI Alliance SoundWire 1.0 Specifications.
+    minItems: 3
+    maxItems: 5
+
+  label:
+    maxItems: 1
+
+patternProperties:
+  "^.*@[0-9a-f],[0-9a-f]$":
+    type: object
+    description: Child nodes for a standalone audio codec or speaker amplifier IC.
+                 It has RX and TX Soundwire slave devices.
+    properties:
+      compatible:
+        pattern: "^sdw[0-9a-f]{1}[0-9a-f]{4}[0-9a-f]{4}[0-9a-f]{2}$"
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - '#sound-dai-cells'
+  - '#address-cells'
+  - '#size-cells'
+  - qcom,dout-ports
+  - qcom,din-ports
+  - qcom,ports-sinterval-low
+  - qcom,ports-offset1
+  - qcom,ports-offset2
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/qcom,lpassaudiocc-sc7280.h>
+
+    soundwire@3210000 {
+        compatible = "qcom,soundwire-v1.6.0";
+        reg = <0x03210000 0x2000>;
+
+        interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>,
+                     <&pdc 130 IRQ_TYPE_LEVEL_HIGH>;
+
+        interrupt-names = "core", "wakeup";
+
+        clocks = <&lpass_rx_macro>;
+        clock-names = "iface";
+
+        qcom,din-ports = <0>;
+        qcom,dout-ports = <5>;
+
+        resets = <&lpass_audiocc LPASS_AUDIO_SWR_RX_CGCR>;
+        reset-names = "swr_audio_cgcr";
+
+        qcom,ports-word-length =        /bits/ 8 <0x01 0x07 0x04 0xff 0xff>;
+        qcom,ports-sinterval-low =      /bits/ 8 <0x03 0x3f 0x1f 0x03 0x03>;
+        qcom,ports-offset1 =            /bits/ 8 <0x00 0x00 0x0b 0x01 0x01>;
+        qcom,ports-offset2 =            /bits/ 8 <0x00 0x00 0x0b 0x00 0x00>;
+        qcom,ports-lane-control =       /bits/ 8 <0x01 0x00 0x00 0x00 0x00>;
+        qcom,ports-block-pack-mode =    /bits/ 8 <0xff 0x00 0x01 0xff 0xff>;
+        qcom,ports-hstart =             /bits/ 8 <0xff 0x03 0xff 0xff 0xff>;
+        qcom,ports-hstop =              /bits/ 8 <0xff 0x06 0xff 0xff 0xff>;
+        qcom,ports-block-group-count =  /bits/ 8 <0xff 0xff 0xff 0xff 0x00>;
+
+        #sound-dai-cells = <1>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        codec@0,4 {
+            compatible = "sdw20217010d00";
+            reg = <0 4>;
+            qcom,rx-port-mapping = <1 2 3 4 5>;
+        };
+    };
-- 
2.7.4

