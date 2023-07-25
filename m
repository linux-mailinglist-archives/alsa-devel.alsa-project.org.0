Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC817610D1
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 12:27:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87FCB14FE;
	Tue, 25 Jul 2023 12:26:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87FCB14FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690280828;
	bh=BTiU8Rb16Ffm7hFon33EFPy3riAwxPNqLIlE++J3JH4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T1PRk+7G35zVZkxdShjn/OPhiOtUnkc+cfbl6Yw8b+X+n0T7PBjhOKQQlwkFHoLyk
	 NMHCrhflGTevTaEuQLbJyQK5NqDo/14k3Jq19wQsAcY9JaPBos3TEEvM9ZTJ9U2OsA
	 P4k6jpv62+BMeCP5sWOD+3stosFRFS39UnN+KbX8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D76BF800C7; Tue, 25 Jul 2023 12:25:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4B07F8056F;
	Tue, 25 Jul 2023 12:25:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EEF4CF80564; Tue, 25 Jul 2023 12:25:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 352EDF80553
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 12:25:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 352EDF80553
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=aPL44a3i
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36P5SPLD027052;
	Tue, 25 Jul 2023 05:25:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=nWNqOcU/VMHg7wL8LXl6a9Ej1i0wpccto+Q/7hX0ess=; b=
	aPL44a3ivpBnxS8awI+5izrkfNvUJ2G0z9YrA7zYxeLhzrIMglGdN+7Ubm4n3qXm
	qoo7ST/dM6aFqiNZejgvNDQX7Y1x9N/isl18sll/0mfAWWwwUN6XIcjd82n6lZoc
	lchQtuswC0a3hVDwgJoaN6fMmkDsN0qzlqHO/a9fxhLmi7nV0/T4SuaXvNlh1Woq
	h/aCGH/KhiAIq+zsbS4Tc/XOA6HvjLI9LWzk8VKAQuXHYPrfNz8qUz0UsX1CGSQ8
	mou4JPx20nhvA/6aysJ/R7iN4Ei+GSqOuJW0gWurPqjESCi5jCgJ0hQO/Bba2Z6D
	Xg4nZ8HgINjdr+WnXNjv7A==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3s0cgxu6yv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 05:25:34 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 25 Jul
 2023 11:25:32 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Tue, 25 Jul 2023 11:25:32 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6B0093563;
	Tue, 25 Jul 2023 10:25:32 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>, <lee@kernel.org>, <vkoul@kernel.org>
CC: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <linus.walleij@linaro.org>,
        <lgirdwood@gmail.com>, <yung-chuan.liao@linux.intel.com>,
        <sanyog.r.kale@intel.com>, <pierre-louis.bossart@linux.intel.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 2/6] dt-bindings: mfd: cirrus,cs42l43: Add initial DT
 binding
Date: Tue, 25 Jul 2023 11:25:28 +0100
Message-ID: <20230725102532.2567580-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230725102532.2567580-1-ckeepax@opensource.cirrus.com>
References: <20230725102532.2567580-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: j7UVhkYebnb5tbKihZo0NrQAcNQ4lNfM
X-Proofpoint-GUID: j7UVhkYebnb5tbKihZo0NrQAcNQ4lNfM
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: MJXM4CU5RFLNGUI652ZKPBUE34WW42VD
X-Message-ID-Hash: MJXM4CU5RFLNGUI652ZKPBUE34WW42VD
X-MailFrom: prvs=2570f46236=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MJXM4CU5RFLNGUI652ZKPBUE34WW42VD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The CS42L43 is an audio CODEC with integrated MIPI SoundWire interface
(Version 1.2.1 compliant), I2C, SPI, and I2S/TDM interfaces designed
for portable applications. It provides a high dynamic range, stereo
DAC for headphone output, two integrated Class D amplifiers for
loudspeakers, and two ADCs for wired headset microphone input or
stereo line input. PDM inputs are provided for digital microphones.

Add a YAML DT binding document for this device.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v5.

Thanks,
Charles

 .../bindings/sound/cirrus,cs42l43.yaml        | 313 ++++++++++++++++++
 1 file changed, 313 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml
new file mode 100644
index 0000000000000..7a6de938b11d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml
@@ -0,0 +1,313 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cirrus,cs42l43.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cirrus Logic CS42L43 Audio CODEC
+
+maintainers:
+  - patches@opensource.cirrus.com
+
+description: |
+  The CS42L43 is an audio CODEC with integrated MIPI SoundWire interface
+  (Version 1.2.1 compliant), I2C, SPI, and I2S/TDM interfaces designed
+  for portable applications. It provides a high dynamic range, stereo
+  DAC for headphone output, two integrated Class D amplifiers for
+  loudspeakers, and two ADCs for wired headset microphone input or
+  stereo line input. PDM inputs are provided for digital microphones.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - cirrus,cs42l43
+
+  reg:
+    maxItems: 1
+
+  vdd-p-supply:
+    description:
+      Power supply for the high voltage interface.
+
+  vdd-a-supply:
+    description:
+      Power supply for internal analog circuits.
+
+  vdd-d-supply:
+    description:
+      Power supply for internal digital circuits. Can be internally supplied.
+
+  vdd-io-supply:
+    description:
+      Power supply for external interface and internal digital logic.
+
+  vdd-cp-supply:
+    description:
+      Power supply for the amplifier 3 and 4 charge pump.
+
+  vdd-amp-supply:
+    description:
+      Power supply for amplifier 1 and 2.
+
+  reset-gpios:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  interrupts:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 1
+
+  clocks:
+    items:
+      - description: Synchronous audio clock provided on mclk_in.
+
+  clock-names:
+    const: mclk
+
+  cirrus,bias-low:
+    type: boolean
+    description:
+      Select a 1.8V headset micbias rather than 2.8V.
+
+  cirrus,bias-sense-microamp:
+    description:
+      Current at which the headset micbias sense clamp will engage, 0 to
+      disable.
+    enum: [ 0, 14, 23, 41, 50, 60, 68, 86, 95 ]
+    default: 0
+
+  cirrus,bias-ramp-ms:
+    description:
+      Time in milliseconds the hardware allows for the headset micbias to
+      ramp up.
+    enum: [ 10, 40, 90, 170 ]
+    default: 170
+
+  cirrus,detect-us:
+    description:
+      Time in microseconds the type detection will run for. Long values will
+      cause more audible effects, but give more accurate detection.
+    enum: [ 20, 100, 1000, 10000, 50000, 75000, 100000, 200000 ]
+    default: 10000
+
+  cirrus,button-automute:
+    type: boolean
+    description:
+      Enable the hardware automuting of decimator 1 when a headset button is
+      pressed.
+
+  cirrus,buttons-ohms:
+    description:
+      Impedance in Ohms for each headset button, these should be listed in
+      ascending order.
+    minItems: 1
+    maxItems: 6
+
+  cirrus,tip-debounce-ms:
+    description:
+      Software debounce on tip sense triggering in milliseconds.
+    default: 0
+
+  cirrus,tip-invert:
+    type: boolean
+    description:
+      Indicates tip detect polarity, inverted implies open-circuit whilst the
+      jack is inserted.
+
+  cirrus,tip-disable-pullup:
+    type: boolean
+    description:
+      Indicates if the internal pullup on the tip detect should be disabled.
+
+  cirrus,tip-fall-db-ms:
+    description:
+      Time in milliseconds a falling edge on the tip detect should be hardware
+      debounced for. Note the falling edge is considered after the invert.
+    enum: [ 0, 125, 250, 500, 750, 1000, 1250, 1500 ]
+    default: 500
+
+  cirrus,tip-rise-db-ms:
+    description:
+      Time in milliseconds a rising edge on the tip detect should be hardware
+      debounced for. Note the rising edge is considered after the invert.
+    enum: [ 0, 125, 250, 500, 750, 1000, 1250, 1500 ]
+    default: 500
+
+  cirrus,use-ring-sense:
+    type: boolean
+    description:
+      Indicates if the ring sense should be used.
+
+  cirrus,ring-invert:
+    type: boolean
+    description:
+      Indicates ring detect polarity, inverted implies open-circuit whilst the
+      jack is inserted.
+
+  cirrus,ring-disable-pullup:
+    type: boolean
+    description:
+      Indicates if the internal pullup on the ring detect should be disabled.
+
+  cirrus,ring-fall-db-ms:
+    description:
+      Time in milliseconds a falling edge on the ring detect should be hardware
+      debounced for. Note the falling edge is considered after the invert.
+    enum: [ 0, 125, 250, 500, 750, 1000, 1250, 1500 ]
+    default: 500
+
+  cirrus,ring-rise-db-ms:
+    description:
+      Time in milliseconds a rising edge on the ring detect should be hardware
+      debounced for. Note the rising edge is considered after the invert.
+    enum: [ 0, 125, 250, 500, 750, 1000, 1250, 1500 ]
+    default: 500
+
+  pinctrl:
+    type: object
+    $ref: /schemas/pinctrl/pinctrl.yaml#
+    additionalProperties: false
+
+    properties:
+      gpio-controller: true
+
+      "#gpio-cells":
+        const: 2
+
+      gpio-ranges:
+        items:
+          - description: A phandle to the CODEC pinctrl node
+            minimum: 0
+          - const: 0
+          - const: 0
+          - const: 3
+
+    patternProperties:
+      "-state$":
+        oneOf:
+          - $ref: "#/$defs/cirrus-cs42l43-state"
+          - patternProperties:
+              "-pins$":
+                $ref: "#/$defs/cirrus-cs42l43-state"
+            additionalProperties: false
+
+  spi:
+    type: object
+    $ref: /schemas/spi/spi-controller.yaml#
+    unevaluatedProperties: false
+
+$defs:
+  cirrus-cs42l43-state:
+    type: object
+
+    allOf:
+      - $ref: /schemas/pinctrl/pincfg-node.yaml#
+      - $ref: /schemas/pinctrl/pinmux-node.yaml#
+
+    oneOf:
+      - required: [ groups ]
+      - required: [ pins ]
+
+    additionalProperties: false
+
+    properties:
+      groups:
+        enum: [ gpio1, gpio2, gpio3, asp, pdmout2, pdmout1, i2c, spi ]
+
+      pins:
+        enum: [ gpio1, gpio2, gpio3,
+                asp_dout, asp_fsync, asp_bclk,
+                pdmout2_clk, pdmout2_data, pdmout1_clk, pdmout1_data,
+                i2c_sda, i2c_scl,
+                spi_miso, spi_sck, spi_ssb ]
+
+      function:
+        enum: [ gpio, spdif, irq, mic-shutter, spk-shutter ]
+
+      drive-strength:
+        description: Set drive strength in mA
+        enum: [ 1, 2, 4, 8, 9, 10, 12, 16 ]
+
+      input-debounce:
+        description: Set input debounce in uS
+        enum: [ 0, 85 ]
+
+required:
+  - compatible
+  - reg
+  - vdd-p-supply
+  - vdd-a-supply
+  - vdd-io-supply
+  - vdd-cp-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        cs42l43: codec@1a {
+            compatible = "cirrus,cs42l43";
+            reg = <0x1a>;
+
+            vdd-p-supply = <&vdd5v0>;
+            vdd-a-supply = <&vdd1v8>;
+            vdd-io-supply = <&vdd1v8>;
+            vdd-cp-supply = <&vdd1v8>;
+            vdd-amp-supply = <&vdd5v0>;
+
+            reset-gpios = <&gpio 0>;
+
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            interrupt-parent = <&gpio>;
+            interrupts = <56 IRQ_TYPE_LEVEL_LOW>;
+
+            #sound-dai-cells = <1>;
+
+            clocks = <&clks 0>;
+            clock-names = "mclk";
+
+            cs42l43_pins: pinctrl {
+                gpio-controller;
+                #gpio-cells = <2>;
+                gpio-ranges = <&cs42l43_pins 0 0 3>;
+
+                pinctrl-names = "default";
+                pinctrl-0 = <&pinsettings>;
+
+                pinsettings: default-state {
+                    shutter-pins {
+                        groups = "gpio3";
+                        function = "mic-shutter";
+                    };
+                };
+            };
+
+            spi {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                cs-gpios = <&cs42l43_pins 1 0>;
+
+                sensor@0 {
+                    compatible = "bosch,bme680";
+                    reg = <0>;
+                    spi-max-frequency = <1400000>;
+                };
+            };
+        };
+    };
-- 
2.30.2

