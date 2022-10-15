Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 120285FF910
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Oct 2022 09:51:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F5507D46;
	Sat, 15 Oct 2022 09:50:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F5507D46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665820304;
	bh=2au5im0mhF4Of/0ZBDr/n6fchLaXnax/lJ++yMs+TuU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ro56YxHnLrS9d0iFWBqaXhyfJkRkEILOA/2ANabBO/YF+eAPfLXzAcf+YE+AWecJL
	 sBEZsmDcI6yAN3XFLyip5c/wpNIJ7wdE8a6OJYwkdiOiUc4TykY07vMmkM1HUkiLB5
	 fd/+rB/oxNiaRzFKyKyhH8EuSczzGF0ABGCsBiWg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D287F800C1;
	Sat, 15 Oct 2022 09:50:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 845EAF801F5; Sat, 15 Oct 2022 09:50:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51714F80086
 for <alsa-devel@alsa-project.org>; Sat, 15 Oct 2022 09:50:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51714F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="lRlN3FeB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29F7YrSO029613;
 Sat, 15 Oct 2022 07:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=F23YjbuDGcrGHCQRskp9JybpBpW1/tFFRt7e3Br/QJY=;
 b=lRlN3FeBslJ7dfv1XSGEL+Dv5RiHtvK00Z+8MniZidO1CgrJtnhegVoDvyRyBL+fqFgI
 HT+U21961g+m145kg+ybBPPF1toa4Xxw1U327FQVLUUDBqqSpsDiXf0T0wTy7iZmK7G8
 4jH7fxw/dVV6b02i1A9rKRlhxHuBFY5ia7zqfOiww68+Ef/nGHkmRyuQRhuHVclEsYEG
 Y2HDzrIm/SGIvHBR2mm7UZUpjsTehDa4VAripEgUd8j4uAApFigHdwYxLpTnnm5rWjGM
 ph4ZWx9CNwe51EquT+C7Qc//qk2M/+gDt1sUoiAaHtWijwJzYigBUnK1QFNufbM09eDZ lQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k7kvg8jy5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Oct 2022 07:50:38 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29F7obvo006528
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Oct 2022 07:50:37 GMT
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Sat, 15 Oct 2022 00:50:31 -0700
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <vkoul@kernel.org>, <agross@kernel.org>, <andersson@kernel.org>,
 <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <quic_plai@quicinc.com>, <bgoswami@quicinc.com>, <perex@perex.cz>,
 <tiwai@suse.com>, <srinivas.kandagatla@linaro.org>,
 <quic_rohkumar@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <swboyd@chromium.org>,
 <judyhsiao@chromium.org>
Subject: [RESEND] dt-bindings: soundwire: Convert text file to yaml format
Date: Sat, 15 Oct 2022 13:20:16 +0530
Message-ID: <1665820216-32598-1-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: VFSlm7dQJEsOlItnMKMY3UhfVscI0RY4
X-Proofpoint-GUID: VFSlm7dQJEsOlItnMKMY3UhfVscI0RY4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-15_03,2022-10-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210150043
Cc: Ratna Deepthi Kudaravalli <quic_rkudarv@quicinc.com>,
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

Update soundwire bindings with yaml formats.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Co-developed-by: Ratna Deepthi Kudaravalli <quic_rkudarv@quicinc.com>
Signed-off-by: Ratna Deepthi Kudaravalli <quic_rkudarv@quicinc.com>
---
 .../devicetree/bindings/soundwire/qcom,sdw.txt     | 214 ---------------------
 .../devicetree/bindings/soundwire/qcom,sdw.yaml    | 185 ++++++++++++++++++
 2 files changed, 185 insertions(+), 214 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
 create mode 100644 Documentation/devicetree/bindings/soundwire/qcom,sdw.yaml

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
deleted file mode 100644
index c85c257..0000000
--- a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
+++ /dev/null
@@ -1,214 +0,0 @@
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
diff --git a/Documentation/devicetree/bindings/soundwire/qcom,sdw.yaml b/Documentation/devicetree/bindings/soundwire/qcom,sdw.yaml
new file mode 100644
index 0000000..bf8f6c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/soundwire/qcom,sdw.yaml
@@ -0,0 +1,185 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soundwire/qcom,sdw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SoundWire Controller
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+  - Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
+
+description:
+  This binding describes the Qualcomm SoundWire controller along with its
+  board specific bus parameters.
+
+properties:
+  compatible:
+    enum:
+      - qcom,soundwire-v1.3.0
+      - qcom,soundwire-v1.5.0
+      - qcom,soundwire-v1.5.1
+      - qcom,soundwire-v1.6.0
+
+  reg:
+    items:
+      - description: the base address and size of SoundWire controller
+                   address space.
+
+  interrupts:
+    items:
+      - description: specify the SoundWire controller core and optional
+                   wake IRQ.
+
+  interrupt-names:
+    items:
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
+    description: size of payload channel sample.
+    minItems: 5
+    maxItems: 5
+
+  qcom,ports-sinterval-low:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description: sample interval low of each data port.
+    minItems: 5
+    maxItems: 5
+
+  qcom,ports-offset1:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description: payload transport window offset1 of each data port.
+    minItems: 5
+    maxItems: 5
+
+  qcom,ports-offset2:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description: payload transport window offset2 of each data port.
+    minItems: 5
+    maxItems: 5
+
+  qcom,ports-lane-control:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description: identify which data lane the data port uses.
+    minItems: 5
+    maxItems: 5
+
+  qcom,ports-block-pack-mode:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description: indicate the block packing mode.
+    minItems: 5
+    maxItems: 5
+
+  qcom,ports-hstart:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description: identifying lowerst numbered coloum in SoundWire frame.
+    minItems: 5
+    maxItems: 5
+
+  qcom,ports-hstop:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description: identifying highest numbered coloum in SoundWire frame.
+    minItems: 5
+    maxItems: 5
+
+  qcom,ports-block-group-count:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description: indicate how many sample intervals are combined into a payload.
+    minItems: 5
+    maxItems: 5
+
+required:
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - '#sound-dai-cells'
+  - '#address-cells'
+  - '#size-cells'
+  - qcom,dout-ports
+  - qcom,din-ports
+  - qcom,ports-word-length
+  - qcom,ports-sinterval-low
+  - qcom,ports-offset1
+  - qcom,ports-offset2
+  - qcom,ports-lane-control
+  - qcom,ports-block-pack-mode
+  - qcom,ports-hstart
+  - qcom,ports-block-group-count
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
+        interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
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
+        status = "disabled";
+    };
-- 
2.7.4

