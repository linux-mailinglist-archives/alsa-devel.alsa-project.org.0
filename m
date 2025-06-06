Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D23AD42F3
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Jun 2025 21:34:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 819C7601D6;
	Tue, 10 Jun 2025 21:34:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 819C7601D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749584077;
	bh=L7qGxXV8eZiD5/jyQOHC+rZAPECQCH1J988p+BGY234=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WlUiBKMwnKSwIINUSEmD8ukkiXog1iARqXLh+fG5oMBNJICDuk0VKsTilpdNieMBZ
	 SNEFX8U3ez3ORQisCodSxLbgWaA43YBlQxtreQESnpQtR0bj0WteOqFB2qtc+gEh4x
	 LJwPY9/7OFsYRT8eUP6SneOSRhO45ycXRtuRfIPU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE1C2F8063A; Tue, 10 Jun 2025 21:33:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C63B0F8063B;
	Tue, 10 Jun 2025 21:33:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64B79F80100; Fri,  6 Jun 2025 08:52:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 488DCF800E4
	for <alsa-devel@alsa-project.org>; Fri,  6 Jun 2025 08:52:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 488DCF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=Jr4ifuEC
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5566qMoc134076;
	Fri, 6 Jun 2025 01:52:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749192742;
	bh=oUkWrCM4AdO9JKlqFqQG1TcKELCtTBQ0XyUehDOp7AE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Jr4ifuEC84xeAszlpaogD3zaTYpusAUaUpumg8SzmhXBRUu3gwA3tdnUPvkEuCw01
	 nYd0egjKlPQjPMnZ2gSE9nW0JCZBiYPIgTOI7HgOtB06MWjo8vqa6gMnr6AimKG0R5
	 W1sl6PyIeZJelNmZ7io10cSJmyyVLsauhMuW3/Bs=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5566qMWr3323139
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 6 Jun 2025 01:52:22 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 6
 Jun 2025 01:52:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 6 Jun 2025 01:52:22 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com
 [172.24.149.200])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5566q4Of677113;
	Fri, 6 Jun 2025 01:52:18 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <tiwai@suse.de>,
        <alsa-devel@alsa-project.org>, <baojun.xu@ti.com>, <jesse-ji@ti.com>,
        <shenghao-ding@ti.com>, <liam.r.girdwood@intel.com>, <navada@ti.com>,
        <v-hampiholi@ti.com>, <niranjan.hy@ti.com>
Subject: [PATCH v1 2/4] Asoc: tac5x1x: document tac5x1x codec
Date: Fri, 6 Jun 2025 12:21:34 +0530
Message-ID: <20250606065136.1821-3-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20250606065136.1821-1-niranjan.hy@ti.com>
References: <20250606065136.1821-1-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-MailFrom: niranjan.hy@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ARQACESFBQUCEBGTPMK6DJRQFI44CTCJ
X-Message-ID-Hash: ARQACESFBQUCEBGTPMK6DJRQFI44CTCJ
X-Mailman-Approved-At: Tue, 10 Jun 2025 19:33:03 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ARQACESFBQUCEBGTPMK6DJRQFI44CTCJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tac5x1x family are series of low-power and high performance
mono/stereo audio codecs consists of ADC and DAC combinations.
The family consist of Codecs(DAC & ADC), ADC only and DAC only
configurations. The documentation explains the list of devices
in the family, their power supply configurations and gpio
configuration options available for various functionality.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 .../devicetree/bindings/sound/ti,tac5x1x.yaml | 222 ++++++++++++++++++
 1 file changed, 222 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tac5x1x.yaml

diff --git a/Documentation/devicetree/bindings/sound/ti,tac5x1x.yaml b/Documentation/devicetree/bindings/sound/ti,tac5x1x.yaml
new file mode 100644
index 000000000000..b5f3f09a0465
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,tac5x1x.yaml
@@ -0,0 +1,222 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+# Copyright (C) 2025 Texas Instruments Incorporated
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,tac5x1x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TAC5X1X Codec
+
+description: |
+  TAC5X1X are series of low-power and high performance mono or stereo
+  audio codecs, as well as multiple inputs and outputs programmable in
+  single-ended or fully differential configurations. Device supports both
+  Microphone and Line In input on ADC Channel. DAC Output can be configured
+  for either Line Out or Head Phone Load.
+
+  The serial control bus supports SPI or I2C protocols, while the serial audio
+  data bus is programmable for I2S, left/right-justified, DSP, or TDM modes.
+
+  Specification about the codecs can be found at:
+    https://www.ti.com/lit/gpn/taa5212
+    https://www.ti.com/lit/gpn/taa5412-q1
+    https://www.ti.com/lit/gpn/tac5111
+    https://www.ti.com/lit/gpn/tac5112
+    https://www.ti.com/lit/gpn/tac5211
+    https://www.ti.com/lit/gpn/tac5212
+    https://www.ti.com/lit/gpn/tac5311-q1
+    https://www.ti.com/lit/gpn/tac5312-q1
+    https://www.ti.com/lit/gpn/tac5411-q1
+    https://www.ti.com/lit/gpn/tac5412-q1
+    https://www.ti.com/lit/gpn/tad5112
+    https://www.ti.com/lit/gpn/tad5212
+
+maintainers:
+  - Niranjan H Y <niranjan.hy@ti.com>
+  - Kevin Lu <kevin-lu@ti.com>
+
+properties:
+  compatible:
+    enum:
+      - ti,taa5212
+      - ti,taa5412
+      - ti,tac5111
+      - ti,tac5112
+      - ti,tac5211
+      - ti,tac5212
+      - ti,tac5311
+      - ti,tac5312
+      - ti,tac5411
+      - ti,tac5412
+      - ti,tad5112
+      - ti,tad5212
+
+  reg:
+    maxItems: 1
+
+  ti,vref:
+    description: VREF required voltage. If node is omitted then VREF is powered down.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    oneOf:
+      - const: 0
+        description: VREF output is powered to 2.75V.
+      - const: 1
+        description: VREF output is powered to 2.5V.
+      - const: 2
+        description: VREF output is powered to 1.375V.
+
+  ti,micbias-vg:
+    description: MicBias required voltage. If node is omitted then MicBias is powered down.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    oneOf:
+      - const: 0
+        description: MICBIAS output is same as the VREF output
+      - const: 1
+        description: MICBIAS output is 0.5 times the VREF output
+      - const: 3
+        description: MICBIAS output is same as the AVDD
+
+  avdd-supply:
+    description: Analog DAC voltage.
+
+  iovdd-supply:
+    description: I/O voltage.
+
+  ti,gpios-func:
+    description: |
+      Array indicating the GPIO1, GPIO2, GPO1 Functionality in the same order.
+      Each integer elemnent in the array represent the following
+      - 0  TAC5X1X_GPIO_DISABLE        - GPIO is Disabled
+      - 1  TAC5X1X_GPIO_GPI            - General Purpose Input
+      - 2  ADC3XXX_GPIO_GPO            - General Purpose Output
+      - 3  TAC5X1X_GPIO_IRQ            - Chip Interrupt
+      - 4  TAC5X1X_GPIO_PDMCLK         - PDM CLK Output
+      - 5  TAC5X1X_GPIO_P_DOUT         - Primary ASI DOUT
+      - 6  TAC5X1X_GPIO_P_DOUT2        - Primary ASI DOUT2
+      - 7  TAC5X1X_GPIO_S_DOUT         - Secondary ASI DOUT
+      - 8  TAC5X1X_GPIO_S_DOUT2        - Secondary ASI DOUT2
+      - 9  TAC5X1X_GPIO_S_BCLK         - Secondary BCLK Output
+      - 10 TAC5X1X_GPIO_S_FSYNC       - Secondary FSYNC Output
+      - 11 TAC5X1X_GPIO_CLKOUT        - General Purpose Output
+      - 12 TAC5X1X_GPIO_DOUT_MUX
+      - 13 TAC5X1X_GPIO_DAISY_OUT
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 3
+    maxItems: 3
+
+  ti,gpios-drive:
+    description: |
+      Array indicating the GPIO1, GPIO2, GPO1 Driver values
+      Each number in the array indicate the following driver values.
+      - 0 # Hi-Z Output
+      - 1 # Drive active low and active High
+      - 2 # Drive active low and weak High
+      - 3 # Drive acive low and Hi-Z
+      - 4 # Drive weak low and active High
+      - 5 # Drive Hi-Z and active High
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 3
+    maxItems: 3
+
+  ti,gpi1-func:
+    description: GPI1 Functionality
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 # TAC5X1X_GPIO_DISABLE       - I/O buffers powered down and not used
+      - 1 # TAC5X1X_GPIO_GPI          - General purpose input
+    default: 0
+
+  '#sound-dai-cells':
+    const: 0
+
+  clocks:
+    maxItems: 1
+
+  ti,gpa-gpio:
+    description: GPA using GPIO1 configuration
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 # GPA using GPIO1 is disabled
+      - 1 # GPA using GPIO1
+    default: 0
+
+  ti,in-ch-en:
+    description: Enable Input channel diagnostics for TAC54XX and TAC53XX device.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 # Disable input channel diagnostics
+      - 1 # Enable input channel diagnostics
+
+  ti,out-ch-en:
+    description: Enable Output channel diagnostics for TAC54XX and TAC53XX device
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 # Disable Output channel diagnostics
+      - 1 # Enable Output channel Diagnostics
+
+  ti,incl-se-inm:
+    description: INxM pin Diagnostics Scan Selection for Single Ended Configuration
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 # INxM pin Diagnostics Scan Selection for Single Ended excluded for diagnosis
+      - 1 # INxM pin Diagnostics Scan Selection for Single Ended included for diagnosis
+
+  ti,incl-ac-coup:
+    description: AC coupled channels pins Scan Selection for Diagnostics
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 # AC coupled channels pins Scan Selection for Diagnostics exluded for diagnosis
+      - 1 # AC coupled channels pins Scan Selection for Diagnostics included for diagnosis
+
+  ti,micbias-threshold:
+    description: Micbias Low and High threshold values for TAC54XX and TAC53XX series
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    maxItems: 2
+    minItems: 2
+    items:
+      minimum: 72
+      maximum: 162
+
+  ti,gpa-threshold:
+    description: GPA Low and High threshold Values
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    maxItems: 2
+    minItems: 2
+    items:
+      minimum: 75
+      maximum: 186
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      tac5x1x: tac5x1x@52 {
+        compatible = "ti,tac5212";
+        reg = <0x52>;
+        #sound-dai-cells = <0>;
+        avdd-supply = <&vdd_3v3_reg>;
+        iovdd-supply = <&vdd_3v3_reg>;
+        ti,vref = <0>;
+        ti,micbias-vg = <3>;
+        ti,gpi1-func = <0>;
+        ti,gpios-func = <4>, <1>, <0>;
+        ti,gpios-drive = <0>, <0>, <0>;
+        ti,gpa-gpio = <0>;
+        ti,in-ch-en = <1>;
+        ti,out-ch-en = <1>;
+        ti,incl-ac-coup = <0>;
+        ti,incl-se-inm = <0>;
+        ti,gpa-threshold = <75>, <186>;
+      };
+    };
+...
-- 
2.45.2

