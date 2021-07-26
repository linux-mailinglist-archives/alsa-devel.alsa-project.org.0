Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B23463D699E
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 00:37:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3830A1DF9;
	Tue, 27 Jul 2021 00:37:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3830A1DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627339071;
	bh=DkPNH9Mwegb87+mmR0lITz7+DeDMqaKD1GBtmL6BnoM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hdtvw3vSucizCNIWHdRjzkKGMCerLpd0070b/Xq0Ek+CasF97/J+912A52fiTIlWo
	 tzD8/EZl82TcjcfnBIFI+Gki+dpxmx/jdYFfIxnKicZFEsVsXeKAf+ruLKbmIU4RJk
	 H4WYrIOqIaFbFe80szsyvTqfbrwGzQ7h0cE1xA/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9C39F80130;
	Tue, 27 Jul 2021 00:36:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B49D3F8025A; Tue, 27 Jul 2021 00:36:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EE55F80130
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 00:36:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EE55F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="KTJIfadH"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16QMZRiX008418; 
 Mon, 26 Jul 2021 17:36:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=KIeWfv4xvO3yYbS4lHFh9wmuxp7v1E/Yc7TYY5dOYvA=;
 b=KTJIfadHAfi0IHPPi9PGV3o6QxQQOjTCUIOlzabbcO8Hxc/gxor1PZky7FZs3FPprtb2
 CifYCRg//1D4QHydPUjhkanpiCgLoNddWI2fWa1f5RhGYPiSU9tE/wc/1q1Q6pTeZbpq
 /eXXh65ssLS7Yp5uU2h5NAgItMkfVUCY5WKRI4qYYEmtXHDlvTLXB/ZYgVKKM0B6YLSc
 7/UTRPEfLUTyk4zRdnWMkSbcpZ8PhtkWPnX3UM1uhVitOP7pKjjTdieMTKoKMFBnSdX3
 2/2zJ9sgqZHsKL1+VF4AIaIaXHvqQ9csAklLP+wtGYEP6z4lSdnULNAj1gF51nD79+Hk 0A== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3a233y85j0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 26 Jul 2021 17:36:05 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 26 Jul
 2021 23:36:03 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 26 Jul 2021 23:36:03 +0100
Received: from localhost.localdomain (macC02XQ1DJJG5K.ad.cirrus.com
 [141.131.65.67])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 032C22BA;
 Mon, 26 Jul 2021 22:36:01 +0000 (UTC)
From: David Rhodes <drhodes@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <ckeepax@opensource.cirrus.com>, 
 <brian.austin@cirrus.com>, <patches@opensource.cirrus.com>,
 <alsa-devel@alsa-project.org>, <david.rhodes@cirrus.com>
Subject: [PATCH v4 2/2] ASoC: cs35l41: Add bindings for CS35L41
Date: Mon, 26 Jul 2021 17:34:38 -0500
Message-ID: <20210726223438.1464333-3-drhodes@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726223438.1464333-1-drhodes@opensource.cirrus.com>
References: <20210726223438.1464333-1-drhodes@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: JNmaOesEqceWCA495ESy1CHgJEv7-QRs
X-Proofpoint-GUID: JNmaOesEqceWCA495ESy1CHgJEv7-QRs
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 mlxlogscore=999
 mlxscore=0 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2107260131
Cc: David Rhodes <drhodes@opensource.cirrus.com>
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

Devicetree binding documentation for CS35L41 driver

CS35L41 is a 11-V Boosted Mono Class D Amplifier with
DSP Speaker Protection and Equalization

Signed-off-by: David Rhodes <drhodes@opensource.cirrus.com>
---
 .../devicetree/bindings/sound/cs35l41.yaml    | 398 ++++++++++++++++++
 1 file changed, 398 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cs35l41.yaml

diff --git a/Documentation/devicetree/bindings/sound/cs35l41.yaml b/Documentation/devicetree/bindings/sound/cs35l41.yaml
new file mode 100644
index 000000000000..f9737664bd91
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cs35l41.yaml
@@ -0,0 +1,398 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cs35l41.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cirrus Logic CS35L41 Speaker Amplifier
+
+maintainers:
+  - david.rhodes@cirrus.com
+
+description: |
+  CS35L41 is a boosted mono Class D amplifier with DSP
+  speaker protection and equalization
+
+properties:
+  compatible:
+    enum:
+      - cirrus,cs35l40
+      - cirrus,cs35l41
+
+  reg:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    description:
+      The first cell indicating the audio interface.
+    const: 1
+
+  cirrus,boost-peak-milliamp:
+    description:
+      Boost-converter peak current limit in mA.
+      Configures the peak current by monitoring the current through the boost FET.
+      Range starts at 1600 mA and goes to a maximum of 4500 mA with increments
+      of 50 mA. See section 4.3.6 of the datasheet for details.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 1600
+    maximum: 4500
+    default: 4500
+
+  cirrus,boost-ind-nanohenry:
+    description:
+      Boost inductor value, expressed in nH. Valid
+      values include 1000, 1200, 1500 and 2200.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 1000
+    maximum: 2200
+
+  cirrus,boost-cap-microfarad:
+    description:
+      Total equivalent boost capacitance on the VBST
+      and VAMP pins, derated at 11 volts DC. The value must be rounded to the
+      nearest integer and expressed in uF.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+
+
+  cirrus,sclk-force-output:
+    description:
+      Audio serial port SCLK force
+      output control. Forces the SCLK to continue to drive even
+      if no ASP_TXn channels are enabled.
+    type: boolean
+
+  cirrus,lrclk-force-output:
+    description:
+      Audio serial port LRCLK force
+      output control. Forces the LRCLK to continue to drive even
+      if no ASP_TXn channels are enabled.
+    type: boolean
+
+  cirrus,right-channel-amp:
+    description:
+      Boolean to determine which channel
+      the amplifier is to receive the audio data on. If present the
+      amplifier receives data on the right channel of I2S data.
+      If not present the amplifier receives data on the left
+      channel of I2S data
+    type: boolean
+
+  cirrus,boost-ctl-millivolt:
+    description:
+      Boost Voltage Value. Configures the
+      boost converter's output voltage in mV. The range is from 2550 mV to
+      11000 mV with increments of 50 mV.  This will be the maximum voltage
+      in Class-H mode if 'classh-bst-max-limit' is set to 1, or the fixed
+      boost voltage if 'classh-bst-overide' is set to true.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 2550
+    maximum: 11000
+
+  cirrus,amp-gain-zc:
+    description:
+      Boolean to determine whether to use the amplifier
+      gain-change zero-crossing feature. If the feature is enabled, any
+      user-controlled amplifier gain change will occur on a zero-crossing point.
+      (Default) Disabled
+    type: boolean
+
+  cirrus,asp-sdout-hiz:
+    description:
+      Audio serial port SDOUT Hi-Z control. Sets the Hi-Z
+      configuration for SDOUT pin of amplifier.
+      0 = Logic 0 during unused slots, and while all transmit channels disabled
+      1 = Hi-Z during unused slots but logic 0 while all transmit channels disabled
+      2 = (Default) Logic 0 during unused slots, but Hi-Z while all transmit channels disabled
+      3 = Hi-Z during unused slots and while all transmit channels disabled
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 0
+    maximum: 3
+    default: 2
+
+  cirrus,temp-warn-threshold:
+    description:
+      Amplifier overtemperature warning threshold.
+      Configures the threshold at which the overtemperature warning condition occurs.
+      When the threshold is met, the ovetemperature warning attenuation is applied
+      and the TEMP_WARN_EINT interrupt status bit is set.
+      If TEMP_WARN_MASK = 0, INTb is asserted.
+      0 = 105C
+      1 = 115C
+      2 = 125C (Default)
+      3 = 135C
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 0
+    maximum: 3
+    default: 2
+
+  cirrus,hw-noise-gate-select:
+    description: Hardware Noise Gate feature. Each bit selects
+      a different block for detection.
+      000000 - All noise gating functionality disabled
+      xxxxx1 - Amplifier noise gating detection enabled
+      xxxx1x - Boost converter DCM detection enabled
+      xxx1xx - VMON low power mode detection enabled
+      xx1xxx - IMON low power mode detection enabled
+      x1xxxx - VP brownout prevention detection enabled
+      1xxxxx - VBST brownout prevention detection enabled
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 0
+    maximum: 63
+    default: 0
+
+  cirrus,hw-noise-gate-delay:
+    description: Time that the incoming audio signal must be
+      below the noise gate threshold prior to entering a noise gated state
+      0 = 5 ms
+      1 = 10 ms
+      2 = 25 ms
+      3 = 50 ms (default)
+      4 = 100 ms
+      5 = 250 ms
+      6 = 500 ms
+      7 = 1 s
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 0
+    maximum: 7
+    default: 3
+
+  cirrus,hw-noise-gate-threshold:
+    description: Threshold of audio signal input which the
+      noise gate considers the input audio to be at a low enough level to be
+      valid to enter a noise gating state of operation.
+      0 = 0.654 mVpk
+      1 = 0.328 mVpk
+      2 = 0.164 mVpk
+      3 = 0.082 mVpk (default)
+      4 = 0.041 mVpk
+      5 = 0.021 mVpk
+      6 = 0.010 mVpk
+      7 = True zero data (no LSB dither)
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 0
+    maximum: 7
+    default: 3
+
+  cirrus,dsp-noise-gate-enable:
+    description:
+      DSP Noise Gate feature. If present, noise gate feature will be enabled.
+    type: boolean
+
+  cirrus,dsp-noise-gate-threshold:
+    description:
+      Threshold of audio signal input which the
+      noise gate considers the input audio to be at a low enough level to be
+      valid to enter a noise gating state of operation.
+      0 = -66 dBFS
+      1 = -72 dBFS
+      2 = -78 dBFS
+      3 = -84 dBFS (default)
+      4 = -90 dBFS
+      5 = -96 dBFS
+      6 = -102 dBFS
+      7 = -108 dBFS
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 0
+    maximum: 7
+    default: 3
+
+  cirrus,dsp-noise-gate-delay:
+    description:
+      Time that the incoming audio signal must be
+      below the noise gate threshold prior to entering a noise gated state
+      0 = 5 ms
+      1 = 10 ms
+      2 = 25 ms
+      3 = 50 ms (default)
+      4 = 100 ms
+      5 = 250 ms
+      6 = 500 ms
+      7 = 1 s
+      8 = 5 s
+      9 = 10 s
+      10 = 20 s
+      11 = 30 s
+      12 = 40 s
+      13 = 50 s
+      14 = 60 s
+      15 = 120 s
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 0
+    maximum: 15
+    default: 3
+
+  cirrus,invert-class-d:
+    description:
+      Inverts the polarity of the audio signal output from
+      the Class-D amplifier.
+    type: boolean
+
+  classh-internal-algo:
+    description:
+      Sub-node for the Internal Class H Algorithm
+      See Section 4.4 Internal Class H Algorithm in the Datasheet.
+      If not used, the device manages the ClassH Algorithm internally.
+      It is strongly recommended that the Datasheet be referenced when adjusting
+      or using these Class H Algorithm controls over the internal Algorithm.
+      Serious damage can occur to the Device and surrounding components.
+      Unavailable for cs35l41l.
+    type:
+      boolean
+  cirrus,classh-bst-overide:
+    description:
+      Boolean which will disable Class H tracking and
+      set Boost voltage to the value in the 'boost-ctl-millivolt' property
+    type: boolean
+  cirrus,classh-bst-max-limit:
+    description:
+      Value set to the BST_CTL_LIM_EN field.
+      A value of 1 will limit the Class-H voltage to the value in the
+      'boost-ctl-millivolt' property.
+      0 = No Class-H limit (default)
+      1 = Class-H limited to 'boost-ctl-millivolt' value
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 0
+    maximum: 1
+  cirrus,classh-headroom:
+    description:
+      Class H algorithm headroom. Controls VBST headroom
+      in the max detection path of the Class H algorithm. Step size is 0.1 V.
+      Range is from -6.4V to +6.3V with 7-bit 2's complement representation.
+      0 = 0V
+      1 = 0.1V
+      2 = 0.2V
+      ===
+      11 = 1.1V (Default)
+      ===
+      62 = 6.2V
+      63 = 6.3V
+      64 = -6.4V
+      65 = -6.3V
+      ===
+      126 = -0.2V
+      127 = -0.1V
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 0
+    maximum: 127
+  cirrus,classh-release-rate:
+    description:
+      Class H release rate. Controls the amount of
+      time required before allowing consecutive release condition VBST supply
+      tracking updates. Step size is 5us with range from 20us to 1275us.
+      4 = 20us (Default)
+      5 = 25us
+      ===
+      254 = 1270us
+      255 = 1275us
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 4
+    maximum: 255
+  cirrus,classh-mem-depth:
+    description:
+      Class H memory depth. Controls the memory depth
+      used in the Class H algorithm for audio data buffering and analysis.
+      0 = 20.83 - 23.4 us
+      1 = 41.67 - 46.88 us
+      2 = 83.33 - 85.94 us
+      3 = 166.67 - 171.88 us
+      4 = 250.00 - 255.10 us
+      5 = 333.33 - 335.93 us (Default)
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 0
+    maximum: 5
+  cirrus,classh-wk-fet-thld:
+    description:
+      Weak-FET amplifier driver threshold.
+      Configures the signal threshold at which the PWM output stage enters weak-FET
+      operation. Step size is 0.05V. Range is from 0.05V to 0.7V.
+      1 = 0.05V
+      2 = 0.1V
+      3 = 0.15V
+      ===
+      13 = 0.65V
+      14 = 0.7V
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 1
+    maximum: 14
+  cirrus,classh-wk-fet-delay:
+    description:
+      Weak-Fet entry . Controls the delay in ms
+      before the Class H algorithm switches to the weak-FET voltage after the audio
+      falls and remains below the value specified in 'classh-wk-fet-thld'.
+      0 = 0ms
+      1 = 5ms
+      2 = 10ms
+      3 = 50ms
+      4 = 100ms (Default)
+      5 = 200ms
+      6 = 500ms
+      7 = 1000ms
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 0
+    maximum: 7
+  cirrus,gpio1-polarity-invert:
+    description:
+      Boolean which specifies whether the GPIO1
+      level is inverted. If this property is not present the level is not inverted.
+    type: boolean
+  cirrus,gpio1-output-enable:
+    description:
+      Boolean which specifies whether the GPIO1 pin
+      is configured as an output. If this property is not present the
+      pin will be configured as an input.
+    type: boolean
+  cirrus,gpio1-src-select:
+    description:
+      Configures the function of the GPIO1 pin.
+      Note that the options are different from the GPIO2 pin
+      0 = High Impedance (Default)
+      1 = GPIO
+      2 = Sync
+      3 = MCLK input
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 0
+    maximum: 3
+  cirrus,gpio2-polarity-invert:
+    description:
+      Boolean which specifies whether the GPIO2
+      level is inverted. If this property is not present the level is not inverted.
+    type: boolean
+  cirrus,gpio2-output-enable:
+    description:
+      Boolean which specifies whether the GPIO2 pin
+      is configured as an output. If this property is not present the
+      pin will be configured as an input.
+    type: boolean
+  cirrus,gpio2-src-select:
+    description:
+      Configures the function of the GPIO2 pin.
+      Note that the options are different from the GPIO1 pin.
+      0 = High Impedance (Default)
+      1 = GPIO
+      2 = Open Drain INTB
+      3 = MCLK input
+      4 = Push-pull INTB (active low)
+      5 = Push-pull INT (active high)
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 0
+    maximum: 5
+
+required:
+  - compatible
+  - cirrus,boost-peak-milliamp
+  - cirrus,boost-ind-nanohenry
+  - cirrus,boost-cap-microfarad
+
+unevaluatedProperties: false
+
+examples:
+  - |
+      cs35l41: cs35l41@2 {
+        compatible = "cirrus,cs35l41";
+        reg = <2>;
+        VA-supply = <&dummy_vreg>;
+        VP-supply = <&dummy_vreg>;
+        cirrus,boost-peak-milliamp = <4500>;
+        cirrus,boost-ind-nanohenry = <1000>;
+        cirrus,boost-cap-microfarad = <15>;
+      };
\ No newline at end of file
-- 
2.25.1

