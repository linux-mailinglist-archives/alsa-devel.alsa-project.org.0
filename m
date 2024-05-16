Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8393B8C712C
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2024 06:51:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5AE57F1;
	Thu, 16 May 2024 06:51:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5AE57F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715835110;
	bh=eibZuDmpAt5Cay0f0jdoNcYZEdLECRDg737MkeNFW10=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IIq9m9LU7rGxVvVtvtubfMW2c/p8O+WGaA0sLh5KxPSPq0j5Z0ibbgVJ2uczc53F2
	 YqlskFrw8vLqUHlTP2WWVF1w7C6KJQQaeq/XXA35fSXe0omVXlofWo6kjNRI6xrtLz
	 iwatBcUN709hJ6b5scQbXOiHqXTBgQWH5ENFqoqY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8BD8F806AA; Thu, 16 May 2024 06:50:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83EDFF80697;
	Thu, 16 May 2024 06:50:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31C7DF80605; Thu, 16 May 2024 06:49:54 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0394EF801F5
	for <alsa-devel@alsa-project.org>; Thu, 16 May 2024 06:48:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0394EF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=p5kW6vBf
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 44FL4cNa021777;
	Thu, 16 May 2024 04:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=D9AOm0VxffGdHdjeoQSXJE99gN2ZKagkI/qS2+07Aeg=; b=p5
	kW6vBfu1f3jRcj+ILlU7dORS9t01H3ix6Ai39lpzi4HruNkgxQYbnXSF2pfyC3qX
	wf27irY4JWPoeN/CIL8eis36LFDeFBeoxmxg/Hji+3G+FyVzuQvg4Bhvr8lYlO3W
	wL2TXyWngE6l6KaENprYH2PkgoSdzB6xX972woFf8NcE1EGN/FHodxfaqaR1uKmK
	ybGTuiI7cE9vAG9JIWtnOE2IEK7LOxl/sq+x4Rx4InGx00fAAbeX+sanu+vK4FEw
	RpG8KltzmdLw5TTmfxPncw50vNLrAicvBsAZ8pTwzXxEn26uQF8kpIgISKTs2c1N
	ZX1tsg+ZwQ1BBvYOLUmQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y45vbcre2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 04:48:52 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 44G4mp5Q020463
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 04:48:51 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 15 May 2024 21:48:46 -0700
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami
	<bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_rohkumar@quicinc.com>,
        <quic_pkumpatl@quicinc.com>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v4 1/7] ASoC: dt-bindings: document wcd937x Audio Codec
Date: Thu, 16 May 2024 10:17:55 +0530
Message-ID: <20240516044801.1061838-2-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240516044801.1061838-1-quic_mohs@quicinc.com>
References: <20240516044801.1061838-1-quic_mohs@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: P5UcYLMKTl1hzbgBCeIfZVfQd8DQKbKT
X-Proofpoint-ORIG-GUID: P5UcYLMKTl1hzbgBCeIfZVfQd8DQKbKT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_01,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160031
Message-ID-Hash: NISBYUKO2OINZX32FPU473CBSJ6UG4OL
X-Message-ID-Hash: NISBYUKO2OINZX32FPU473CBSJ6UG4OL
X-MailFrom: quic_mohs@quicinc.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NISBYUKO2OINZX32FPU473CBSJ6UG4OL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>

Document the Qualcomm WCD9370/WCD9375 Audio Codec and the
Soundwire devices than can be found on Qualcomm QCM6490 based platforms.

The Qualcomm WCD9370/WCD9375 Audio Codec communicates
with the host SoC over 2 Soundwire links to provide:
- 3 TX ADC paths with 4 differential AMIC inputs
- 6 DMIC inputs that are shared with AMIC input
- 4 Microphone BIAS
- RX paths with 4 PAs – HPHL/R, EAR and AUX
- Stereo Headphone output
- MBHC engine for Headset Detection

Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Co-developed-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
---
 .../bindings/sound/qcom,wcd937x-sdw.yaml      | 95 +++++++++++++++++++
 .../bindings/sound/qcom,wcd937x.yaml          | 80 ++++++++++++++++
 2 files changed, 175 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
new file mode 100644
index 000000000000..e11768340913
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wcd937x-sdw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SoundWire Slave devices on WCD9370/WCD9375
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  Qualcomm WCD9370/WCD9375 Codec is a standalone Hi-Fi audio codec IC.
+  It has RX and TX Soundwire slave devices. This bindings is for the
+  slave devices.
+
+properties:
+  compatible:
+    const: sdw20217010a00
+
+  reg:
+    maxItems: 1
+
+  qcom,tx-port-mapping:
+    description: |
+      Specifies static port mapping between device and host tx ports.
+      In the order of the device port index which are adc1_port, adc23_port,
+      dmic03_mbhc_port, dmic46_port.
+      Supports maximum 4 tx soundwire ports.
+
+      WCD9370 TX Port 1 (ADC1)               <=> SWR2 Port 2
+      WCD9370 TX Port 2 (ADC2, 3)            <=> SWR2 Port 2
+      WCD9370 TX Port 3 (DMIC0,1,2,3 & MBHC) <=> SWR2 Port 3
+      WCD9370 TX Port 4 (DMIC4,5,6,7)        <=> SWR2 Port 4
+
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 4
+    maxItems: 4
+    items:
+      oneOf:
+        - minimum: 1
+          maximum: 4
+
+  qcom,rx-port-mapping:
+    description: |
+      Specifies static port mapping between device and host rx ports.
+      In the order of device port index which are hph_port, clsh_port,
+      comp_port, lo_port, dsd port.
+      Supports maximum 5 rx soundwire ports.
+
+      WCD9370 RX Port 1 (HPH_L/R)       <==>    SWR1 Port 1 (HPH_L/R)
+      WCD9370 RX Port 2 (CLSH)          <==>    SWR1 Port 2 (CLSH)
+      WCD9370 RX Port 3 (COMP_L/R)      <==>    SWR1 Port 3 (COMP_L/R)
+      WCD9370 RX Port 4 (LO)            <==>    SWR1 Port 4 (LO)
+      WCD9370 RX Port 5 (DSD_L/R)       <==>    SWR1 Port 5 (DSD)
+
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 5
+    maxItems: 5
+    items:
+      oneOf:
+        - minimum: 1
+          maximum: 5
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    soundwire@3210000 {
+        reg = <0x03210000 0x2000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+        wcd937x_rx: codec@0,4 {
+            compatible = "sdw20217010a00";
+            reg  = <0 4>;
+            qcom,rx-port-mapping = <1 2 3 4 5>;
+        };
+    };
+
+    soundwire@3230000 {
+        reg = <0x03230000 0x2000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+        wcd937x_tx: codec@0,3 {
+            compatible = "sdw20217010a00";
+            reg  = <0 3>;
+            qcom,tx-port-mapping = <2 2 3 4>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
new file mode 100644
index 000000000000..5c76083691ea
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wcd937x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WCD9370/WCD9375 Audio Codec
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description:
+  Qualcomm WCD9370/WCD9375 Codec is a standalone Hi-Fi audio codec IC.
+  It has RX and TX Soundwire slave devices.
+
+allOf:
+  - $ref: dai-common.yaml#
+  - $ref: qcom,wcd93xx-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,wcd9370-codec
+      - items:
+          - const: qcom,wcd9375-codec
+          - const: qcom,wcd9370-codec
+
+  vdd-px-supply:
+    description: A reference to the 1.8V I/O supply
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    codec {
+        compatible = "qcom,wcd9370-codec";
+        pinctrl-names = "default", "sleep";
+        pinctrl-0 = <&wcd_reset_n>;
+        pinctrl-1 = <&wcd_reset_n_sleep>;
+        reset-gpios = <&tlmm 83 0>;
+        vdd-buck-supply = <&vreg_l17b_1p8>;
+        vdd-rxtx-supply = <&vreg_l18b_1p8>;
+        vdd-px-supply = <&vreg_l18b_1p8>;
+        vdd-mic-bias-supply = <&vreg_bob>;
+        qcom,micbias1-microvolt = <1800000>;
+        qcom,micbias2-microvolt = <1800000>;
+        qcom,micbias3-microvolt = <1800000>;
+        qcom,micbias4-microvolt = <1800000>;
+        qcom,rx-device = <&wcd937x_rx>;
+        qcom,tx-device = <&wcd937x_tx>;
+        #sound-dai-cells = <1>;
+    };
+
+    /* ... */
+
+    soundwire@3210000 {
+        reg = <0x03210000 0x2000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+        wcd937x_rx: codec@0,4 {
+            compatible = "sdw20217010a00";
+            reg  = <0 4>;
+            qcom,rx-port-mapping = <1 2 3 4 5>;
+        };
+    };
+
+    soundwire@3230000 {
+        reg = <0x03230000 0x2000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+        wcd937x_tx: codec@0,3 {
+            compatible = "sdw20217010a00";
+            reg  = <0 3>;
+            qcom,tx-port-mapping = <1 2 3 4>;
+        };
+    };
+...
-- 
2.25.1

