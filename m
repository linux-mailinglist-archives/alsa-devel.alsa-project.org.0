Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB7068F867
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 20:53:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BE85836;
	Wed,  8 Feb 2023 20:53:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BE85836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675886030;
	bh=V2dJFYTb5nu2v7TI1e8DptVg0c+/cgO6ycrEYrkxDMo=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=sGG4ZWpLH/GXXlirPD22CN43PedtDj4PaObWjoPt48g2KZ7tfR9xqB2RqPELyvmwS
	 kZHhvKlACq393QRj1c1AHF4sbA3RU1r85FPOqe4iDOkcG2P/4cW95Zt4K7kor8aBVA
	 iBaf3X1yknaQ2k7mc3pRXnYQfEc+YaDqob996bFs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E9A8F8010B;
	Wed,  8 Feb 2023 20:52:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83322F8012B; Wed,  8 Feb 2023 20:52:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6129F8001E
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 20:52:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6129F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=kKboVST4
Received: by mail-wr1-x42e.google.com with SMTP id bu23so2101521wrb.8
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Feb 2023 11:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JgOLrIxw478TszPSA22GkyU3krXzi5JVOGpN1U33AS4=;
        b=kKboVST4NQdGkT8Ypq7h8LlV57fxLzCbFiW2grIN1o4gYZ6tuiEyJv51kfgQ1dULq+
         9a+AffPc8TsY/Hau/r/nGUi2X4QRtIEeZ7MzHmr3PkIHxzlkzeeIMfaxSztkcOZJT+Cb
         fpyEHij7+pTbDYArwPdYcQL8yPV61kwPpat8vmPWvdHPl1OGeHgJ1A9l+VIM4FjTWS33
         LKX9ur6aVI3xqf1VQFhDaZFqY1UVSVQmU+P3yTwoTkRCFkXI8XZnnZig4IxgcyvyBb1Z
         IBQyed9JtGms+l5iJ9DMyP6aJFf5IqeMU7eInZ316guyjodZ6OL/ir8eFpfwLtHOMayZ
         o/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JgOLrIxw478TszPSA22GkyU3krXzi5JVOGpN1U33AS4=;
        b=JdPx0HijxRR5lhz0Blc2FlWX1zrbXbZ/eIb/mZNyL+s0b31k2MPNp9UO65ATtvK4od
         IfIMSwRrfYv8k9IYg7UG+i/oo48cvtXpbCF7SHegWFYTcZzWPWEWNb0s4V/suUl7Fj0g
         hMDGl9dILMv4C7HT3CPUXiLSRiGbcRyMxHfq8I4gKu9vec9U3ZdXUzP4P+PgcVBnTB8K
         Yp/ZD/VvTsgXfF4oh0Qgm5EirNVSo0aRwiRza2iK2CvGm1UOa31LulUVoFVk0Gl2A9y7
         C5RvExCzhJkm7Qln9k/G1P/bJMVZQlaasQY+QScMAVMzQfHBAZn7fVhcUrgPdwh25gCp
         CQ1w==
X-Gm-Message-State: AO0yUKXTrnvAnWu5jpsyQJbYJ5bb4aiKUR9wEb6fEQQ2eYbEHGM0MavO
	gAkp7MpWzh0fPW3csfEOwZVJUw==
X-Google-Smtp-Source: 
 AK7set/qjDqL6WEi5Gky24qlt+xu9BP3mvxSWxkmnIQUS2zRv4WdUsC6xUdG/LFkfsLwkYAM2p49og==
X-Received: by 2002:a5d:5091:0:b0:2c3:d032:5b29 with SMTP id
 a17-20020a5d5091000000b002c3d0325b29mr2255500wrt.12.1675885959219;
        Wed, 08 Feb 2023 11:52:39 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 d16-20020adffbd0000000b002c3ea5ebc73sm7735042wrs.101.2023.02.08.11.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 11:52:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	- <patches@opensource.cirrus.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: dt-bindings: wlf,wm8994: Convert to dtschema
Date: Wed,  8 Feb 2023 20:52:35 +0100
Message-Id: <20230208195235.453774-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2HX2OA3FTPUGF4GTAP3NGR3KATHAJM2S
X-Message-ID-Hash: 2HX2OA3FTPUGF4GTAP3NGR3KATHAJM2S
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2HX2OA3FTPUGF4GTAP3NGR3KATHAJM2S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the Wolfson WM1811/WM8994/WM8958 audio codecs bindings to DT
schema.

Changes against original binding:
1. Add missing LDO1VDD-supply and LDO2VDD-supply.
2. Use "gpios" suffix for wlf,ldo1ena and wlf,ldo2ena (Linux kernel's
   gpiolib already looks for both variants).
3. Do not require AVDD1-supply and DCVDD-supply, because at least on
   Arndale board with Exynos5250 these are being supplied by internal
   LDOs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Add LDO2VDD-supply.
2. Do not require AVDD1-supply on WM8994.
3. Move requiring of common supplies to top-level "required:".

DTS is being corrected here:
https://lore.kernel.org/linux-samsung-soc/20230208172634.404452-1-krzysztof.kozlowski@linaro.org/T/#t
---
 .../devicetree/bindings/sound/wlf,wm8994.yaml | 194 ++++++++++++++++++
 .../devicetree/bindings/sound/wm8994.txt      | 112 ----------
 2 files changed, 194 insertions(+), 112 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8994.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wm8994.txt

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml
new file mode 100644
index 000000000000..8f045de02850
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml
@@ -0,0 +1,194 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/wlf,wm8994.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Wolfson WM1811/WM8994/WM8958 audio codecs
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+  - patches@opensource.cirrus.com
+
+description: |
+  These devices support both I2C and SPI (configured with pin strapping on the
+  board).
+
+  Pins on the device (for linking into audio routes):
+  IN1LN, IN1LP, IN2LN, IN2LP:VXRN, IN1RN, IN1RP, IN2RN, IN2RP:VXRP, SPKOUTLP,
+  SPKOUTLN, SPKOUTRP, SPKOUTRN, HPOUT1L, HPOUT1R, HPOUT2P, HPOUT2N, LINEOUT1P,
+  LINEOUT1N, LINEOUT2P, LINEOUT2N.
+
+properties:
+  compatible:
+    enum:
+      - wlf,wm1811
+      - wlf,wm8994
+      - wlf,wm8958
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: MCLK1
+      - const: MCLK2
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+    description:
+      The first cell is the IRQ number. The second cell is the flags, encoded
+      as the trigger masks.
+
+  AVDD1-supply: true
+  AVDD2-supply: true
+  CPVDD-supply: true
+  DBVDD-supply: true
+  DBVDD1-supply: true
+  DBVDD2-supply: true
+  DBVDD3-supply: true
+  DCVDD-supply: true
+  LDO1VDD-supply: true
+  LDO2VDD-supply: true
+  SPKVDD1-supply: true
+  SPKVDD2-supply: true
+
+  '#sound-dai-cells':
+    const: 0
+
+  wlf,gpio-cfg:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    maxItems: 11
+    description:
+      A list of GPIO configuration register values. If absent, no configuration
+      of these registers is performed. If any value is over 0xffff then the
+      register will be left as default. If present 11 values must be supplied.
+
+  wlf,micbias-cfg:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    maxItems: 2
+    description:
+      Two MICBIAS register values for WM1811 or WM8958.  If absent the register
+      defaults will be used.
+
+  wlf,ldo1ena-gpios:
+    maxItems: 1
+    description:
+      Control of LDO1ENA input to device.
+
+  wlf,ldo2ena-gpios:
+    maxItems: 1
+    description:
+      Control of LDO2ENA input to device.
+
+  wlf,lineout1-se:
+    type: boolean
+    description:
+      LINEOUT1 is in single ended mode.
+
+  wlf,lineout2-se:
+    type: boolean
+    description:
+      INEOUT2 is in single ended mode.
+
+  wlf,lineout1-feedback:
+    type: boolean
+    description:
+      LINEOUT1 has common mode feedback connected.
+
+  wlf,lineout2-feedback:
+    type: boolean
+    description:
+      LINEOUT2 has common mode feedback connected.
+
+  wlf,ldoena-always-driven:
+    type: boolean
+    description:
+      LDOENA is always driven.
+
+  wlf,spkmode-pu:
+    type: boolean
+    description:
+      Enable the internal pull-up resistor on the SPKMODE pin.
+
+  wlf,csnaddr-pd:
+    type: boolean
+    description:
+      Enable the internal pull-down resistor on the CS/ADDR pin.
+
+required:
+  - compatible
+  - reg
+  - AVDD2-supply
+  - CPVDD-supply
+  - SPKVDD1-supply
+  - SPKVDD2-supply
+
+allOf:
+  - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          enum:
+            - wlf,wm1811
+            - wlf,wm8958
+    then:
+      properties:
+        DBVDD-supply: false
+        LDO2VDD-supply: false
+      required:
+        - DBVDD1-supply
+        - DBVDD2-supply
+        - DBVDD3-supply
+    else:
+      properties:
+        DBVDD1-supply: false
+        DBVDD2-supply: false
+        DBVDD3-supply: false
+      required:
+        - DBVDD-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        audio-codec@1a {
+            compatible = "wlf,wm1811";
+            reg = <0x1a>;
+            clocks = <&i2s0 0>;
+            clock-names = "MCLK1";
+
+            AVDD2-supply = <&main_dc_reg>;
+            CPVDD-supply = <&main_dc_reg>;
+            DBVDD1-supply = <&main_dc_reg>;
+            DBVDD2-supply = <&main_dc_reg>;
+            DBVDD3-supply = <&main_dc_reg>;
+            LDO1VDD-supply = <&main_dc_reg>;
+            SPKVDD1-supply = <&main_dc_reg>;
+            SPKVDD2-supply = <&main_dc_reg>;
+
+            wlf,ldo1ena-gpios = <&gpb0 0 GPIO_ACTIVE_HIGH>;
+            wlf,ldo2ena-gpios = <&gpb0 1 GPIO_ACTIVE_HIGH>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/sound/wm8994.txt b/Documentation/devicetree/bindings/sound/wm8994.txt
deleted file mode 100644
index 8fa947509c10..000000000000
--- a/Documentation/devicetree/bindings/sound/wm8994.txt
+++ /dev/null
@@ -1,112 +0,0 @@
-WM1811/WM8994/WM8958 audio CODEC
-
-These devices support both I2C and SPI (configured with pin strapping
-on the board).
-
-Required properties:
-
-  - compatible : One of "wlf,wm1811", "wlf,wm8994" or "wlf,wm8958".
-
-  - reg : the I2C address of the device for I2C, the chip select
-          number for SPI.
-
-  - gpio-controller : Indicates this device is a GPIO controller.
-  - #gpio-cells : Must be 2. The first cell is the pin number and the
-    second cell is used to specify optional parameters (currently unused).
-
-  - power supplies for the device, as covered in
-    Documentation/devicetree/bindings/regulator/regulator.txt, depending
-    on compatible:
-    - for wlf,wm1811 and wlf,wm8958:
-      AVDD1-supply, AVDD2-supply, DBVDD1-supply, DBVDD2-supply, DBVDD3-supply,
-      DCVDD-supply, CPVDD-supply, SPKVDD1-supply, SPKVDD2-supply
-    - for wlf,wm8994:
-      AVDD1-supply, AVDD2-supply, DBVDD-supply, DCVDD-supply, CPVDD-supply,
-      SPKVDD1-supply, SPKVDD2-supply
-
-Optional properties:
-
-  - interrupts : The interrupt line the IRQ signal for the device is
-    connected to.  This is optional, if it is not connected then none
-    of the interrupt related properties should be specified.
-  - interrupt-controller : These devices contain interrupt controllers
-    and may provide interrupt services to other devices if they have an
-    interrupt line connected.
-  - #interrupt-cells: the number of cells to describe an IRQ, this should be 2.
-    The first cell is the IRQ number.
-    The second cell is the flags, encoded as the trigger masks from
-    Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
-
-  - clocks : A list of up to two phandle and clock specifier pairs
-  - clock-names : A list of clock names sorted in the same order as clocks.
-                  Valid clock names are "MCLK1" and "MCLK2".
-
-  - wlf,gpio-cfg : A list of GPIO configuration register values. If absent,
-    no configuration of these registers is performed. If any value is
-    over 0xffff then the register will be left as default. If present 11
-    values must be supplied.
-
-  - wlf,micbias-cfg : Two MICBIAS register values for WM1811 or
-    WM8958.  If absent the register defaults will be used.
-
-  - wlf,ldo1ena : GPIO specifier for control of LDO1ENA input to device.
-  - wlf,ldo2ena : GPIO specifier for control of LDO2ENA input to device.
-
-  - wlf,lineout1-se : If present LINEOUT1 is in single ended mode.
-  - wlf,lineout2-se : If present LINEOUT2 is in single ended mode.
-
-  - wlf,lineout1-feedback : If present LINEOUT1 has common mode feedback
-    connected.
-  - wlf,lineout2-feedback : If present LINEOUT2 has common mode feedback
-    connected.
-
-  - wlf,ldoena-always-driven : If present LDOENA is always driven.
-
-  - wlf,spkmode-pu : If present enable the internal pull-up resistor on
-    the SPKMODE pin.
-
-  - wlf,csnaddr-pd : If present enable the internal pull-down resistor on
-    the CS/ADDR pin.
-
-Pins on the device (for linking into audio routes):
-
-  * IN1LN
-  * IN1LP
-  * IN2LN
-  * IN2LP:VXRN
-  * IN1RN
-  * IN1RP
-  * IN2RN
-  * IN2RP:VXRP
-  * SPKOUTLP
-  * SPKOUTLN
-  * SPKOUTRP
-  * SPKOUTRN
-  * HPOUT1L
-  * HPOUT1R
-  * HPOUT2P
-  * HPOUT2N
-  * LINEOUT1P
-  * LINEOUT1N
-  * LINEOUT2P
-  * LINEOUT2N
-
-Example:
-
-wm8994: codec@1a {
-	compatible = "wlf,wm8994";
-	reg = <0x1a>;
-
-	gpio-controller;
-	#gpio-cells = <2>;
-
-	lineout1-se;
-
-	AVDD1-supply = <&regulator>;
-	AVDD2-supply = <&regulator>;
-	CPVDD-supply = <&regulator>;
-	DBVDD-supply = <&regulator>;
-	DCVDD-supply = <&regulator>;
-	SPKVDD1-supply = <&regulator>;
-	SPKVDD2-supply = <&regulator>;
-};
-- 
2.34.1

