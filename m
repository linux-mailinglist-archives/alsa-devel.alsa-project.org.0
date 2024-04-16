Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCFB8A6433
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Apr 2024 08:42:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89795EAB;
	Tue, 16 Apr 2024 08:42:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89795EAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713249745;
	bh=aBlkdSjjwVkn6//EzAZb+PqCL3tCH8kR8KEGC9EkKyw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YTbu0YAPfafk9R+qJwWxlsnL5CJbZCWcwRGJuXLSkt3yQ4KJcJSkdQBhjbNTE/O3F
	 IGvGk7Tkut7WwMRfsNSt/8UdjGshMKeEOv2DM9+bVkiM/6O56S1vs0HLfV+39jiNbS
	 3Y8Remilb1dC+Mo1alWbxbWe6QnL0aGRWviR7j9I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A3CCF805B2; Tue, 16 Apr 2024 08:41:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7A6CF805CB;
	Tue, 16 Apr 2024 08:41:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D6FFF80494; Tue, 16 Apr 2024 08:36:50 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B14F5F80236
	for <alsa-devel@alsa-project.org>; Tue, 16 Apr 2024 08:36:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B14F5F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=YaQEM8R6
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43FNxX6v030411;
	Tue, 16 Apr 2024 06:36:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=9+RJitawOeTrE7hwBxtMXPaSL78gHxQpd8eAZUxLrmk=; b=Ya
	QEM8R6UCywlF4lOBKdocStQpIeGjoTLVtZwBtPmKYdZdg2YUpXGp1ybobBJ2HwES
	ywJOgkYXGbWB0U2Y06FNlmeEZs2Zg6IE/N/p9eQu8yr4xsXyp09NMnJ/ECq/dbRO
	Da3hZlL1J+ejX1xZy8InUjCOsFi1hPSEnH1GIbtVayqtFhh5vBgQ8tV7MqQZWc9K
	i2Kbw2yLupY4WStUYkC1UWniPWPRm0fr8442HTV6umogFQiAjkJcA9ybYl62FzSp
	rwCx0p+x8bTAtYrTIX0LCh8VA3ELjQyRHZAPgTze9T+oAyuvR8AzrafDIU1ilheA
	my4vAQBnkbf3isQiU34Q==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xh7t1smrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Apr 2024 06:36:37 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 43G6aald027625
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Apr 2024 06:36:36 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 15 Apr 2024 23:36:32 -0700
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
Subject: [PATCH v2 1/8] ASoC: dt-bindings: wcd937x: add bindings for wcd937x
Date: Tue, 16 Apr 2024 12:05:53 +0530
Message-ID: <20240416063600.309747-2-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240416063600.309747-1-quic_mohs@quicinc.com>
References: <20240416063600.309747-1-quic_mohs@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: DqB9GiCLlwfat3oD66CuI-2fAJ7h7G9_
X-Proofpoint-GUID: DqB9GiCLlwfat3oD66CuI-2fAJ7h7G9_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_04,2024-04-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404160039
Message-ID-Hash: ESW6T7UJAZTLESHWCHGC3TSHBIBVZP7N
X-Message-ID-Hash: ESW6T7UJAZTLESHWCHGC3TSHBIBVZP7N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ESW6T7UJAZTLESHWCHGC3TSHBIBVZP7N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>

Qualcomm WCD9370/WCD9375 Codec is a standalone Hi-Fi audio codec IC
connected over SoundWire. This device has two SoundWire device RX and
TX respectively, supporting 3 x ADCs, ClassH, Ear, Aux PA, 2xHPH,
6 DMICs, MBHC.

Co-developed-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
---
 .../bindings/sound/qcom,wcd937x.yaml          | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
new file mode 100644
index 000000000000..b45f823af04f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wcd937x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WCD9370 Audio Codec
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  Qualcomm WCD9370 Codec is a standalone Hi-Fi audio codec IC.
+  It has RX and TX Soundwire slave devices.
+
+properties:
+  compatible:
+    enum:
+      - qcom,wcd9370-codec
+
+  reset-gpios:
+    description: GPIO spec for reset line to use
+    maxItems: 1
+
+  vdd-buck-supply:
+    description: A reference to the 1.8V buck supply
+
+  vdd-rxtx-supply:
+    description: A reference to the 1.8V rx supply
+
+  vdd-px-supply:
+    description: A reference to the 1.8V I/O supply
+
+  vdd-mic-bias-supply:
+    description: A reference to the 3.8V mic bias supply
+
+  qcom,tx-device:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: A reference to Soundwire tx device phandle
+
+  qcom,rx-device:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: A reference to Soundwire rx device phandle
+
+  qcom,micbias1-microvolt:
+    description: micbias1 voltage
+    minimum: 1800000
+    maximum: 2850000
+
+  qcom,micbias2-microvolt:
+    description: micbias2 voltage
+    minimum: 1800000
+    maximum: 2850000
+
+  qcom,micbias3-microvolt:
+    description: micbias3 voltage
+    minimum: 1800000
+    maximum: 2850000
+
+  '#sound-dai-cells':
+    const: 1
+
+required:
+  - compatible
+  - reset-gpios
+  - qcom,tx-device
+  - qcom,rx-device
+  - qcom,micbias1-microvolt
+  - qcom,micbias2-microvolt
+  - qcom,micbias3-microvolt
+  - "#sound-dai-cells"
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
+        qcom,rx-device = <&wcd937x_rx>;
+        qcom,tx-device = <&wcd937x_tx>;
+        #sound-dai-cells = <1>;
+    };
+
+    /* ... */
+
+    soundwire@3210000 {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        reg = <0x03210000 0x2000>;
+        wcd937x_rx: codec@0,4 {
+            compatible = "sdw20217010a00";
+            reg  = <0 4>;
+            qcom,rx-port-mapping = <1 2 3 4 5>;
+        };
+    };
+
+    soundwire@3230000 {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        reg = <0x03230000 0x2000>;
+        wcd937x_tx: codec@0,3 {
+            compatible = "sdw20217010a00";
+            reg  = <0 3>;
+            qcom,tx-port-mapping = <2 3 4 5>;
+        };
+    };
+
+...
-- 
2.25.1

