Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB36C7279C8
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 10:16:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB2826C0;
	Thu,  8 Jun 2023 10:16:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB2826C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686212212;
	bh=pfvepxRd3f5BN6Nnf5WW+7KlUBf6JtFCO8LN8xlt4zU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RZISGG34OQolGHA5Ld4UoVAcbRLXiWdYHbW9wLKFld6gN/P5dLpI4nEd9dqGnBLwn
	 M0sZS5Fsz38Yt0t89gCqTnbl3BMdmH+eFSx3DnzYMR0B3qjwwCGCUCooTq0DzBOqSc
	 XJBofllpz8zcqf1hJkidFa3QMpi6YTBv4ravgfNE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F40DF80290; Thu,  8 Jun 2023 10:16:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5E76F8016C;
	Thu,  8 Jun 2023 10:16:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACC2CF80199; Thu,  8 Jun 2023 10:15:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA248F80130
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 10:15:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA248F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256
 header.s=key1 header.b=Ih4f8EIH;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com
 header.a=rsa-sha256 header.s=key1 header.b=FRdLuFo2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1686212153; x=1717748153;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=47TWQkV5kWTX8iyB2NH/f3PVGU4VqhK3gIY7B4/vtaQ=;
  b=Ih4f8EIHEUW/0o18UX/yNpMcyjd218AvwtcfjNRUO2U2XXBB6PgO9mnn
   YdFxePuxxUKB/F4nBr3pRqjncXQ4+IfEOicJk1CM79BG/NYUxuz5k/kN0
   2fMYThmAH6zXBCp5Ee02S5BiNIDAk5Vhjd2DZ+s0Gb0YIvO8HJC7MTgXD
   GpIhjpgBHnhS/Xx/QwXoFWGra+Ce7+urjcGaCRh6YcFY8jYnelS0tbjZz
   pKvwhPYZ93/pWNbZNHjUxTHT1ztyG270gLFnxsQFF+6Xa/rITkfXBKjR9
   rerwQF8DUYW8WV59oT83QpGrK2kf6P55pWD/nWhmRXhNNkeENVa4Utpu3
   A==;
X-IronPort-AV: E=Sophos;i="6.00,226,1681164000";
   d="scan'208";a="31343660"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 08 Jun 2023 10:15:51 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 08 Jun 2023 10:15:51 +0200
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Thu, 08 Jun 2023 10:15:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1686212151; x=1717748151;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=47TWQkV5kWTX8iyB2NH/f3PVGU4VqhK3gIY7B4/vtaQ=;
  b=FRdLuFo2eolIUKw25xwA5KFMI1xKAQk3KFiFnKBWBDeIcJ5DoV8QT8b+
   xsIiHeg5XPU6/OHnA0wjkL9Sw4v3teyXDE3UZcJGUNgngxNK8KYzhBDgI
   fhY+IytdG7d2jFufzZtIgSfq16lPYbKNW2p5G2SrglS6WFYP6IwR/M1xt
   ty3lyC0nerM3jT4e+Gf07Ly/sQvADQmBRCzVGFSHBq1HyQvRo3kQL8noI
   XWYoZxYZhfV2GtVJXg3DBkpPOXjdXBEqpvO06cRP6pnDybSYKeHPvOcp9
   zRoDIRPa4QQkrINiFglFJW/l6hGuNkiGn5ZhqVNE0vJqvUi9fxBRGAMOh
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,226,1681164000";
   d="scan'208";a="31343659"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 08 Jun 2023 10:15:51 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 4627C280087;
	Thu,  8 Jun 2023 10:15:51 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/1] ASoC: dt-bindings: tlv320aic32x4: convert to DT schema
 format
Date: Thu,  8 Jun 2023 10:15:47 +0200
Message-Id: <20230608081547.442763-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: THVGCSISOFNNAZDBDAEZKRTXGZOUYZJT
X-Message-ID-Hash: THVGCSISOFNNAZDBDAEZKRTXGZOUYZJT
X-MailFrom: alexander.stein@ew.tq-group.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/THVGCSISOFNNAZDBDAEZKRTXGZOUYZJT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the binding to DT schema format.
Since commit 514b044cba667 ("ASoC: tlv320aic32x4: Model PLL in CCF")
clocks & clock-names = "mclk" is mandatory, it has been added to required
properties as well. '#sound-dai-cells' is added for reference from
simple-audio-card.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
There is no in-tree user for aic32x4-gpio-func, so I just converted the
bindings to YAML and skipped introducing a dt-binding header for
defining the constants.

 .../bindings/sound/tlv320aic32x4.txt          |  42 -------
 .../bindings/sound/tlv320aic32x4.yaml         | 103 ++++++++++++++++++
 2 files changed, 103 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/tlv320aic32x4.txt
 create mode 100644 Documentation/devicetree/bindings/sound/tlv320aic32x4.yaml

diff --git a/Documentation/devicetree/bindings/sound/tlv320aic32x4.txt b/Documentation/devicetree/bindings/sound/tlv320aic32x4.txt
deleted file mode 100644
index 0b4e21bde5bc1..0000000000000
--- a/Documentation/devicetree/bindings/sound/tlv320aic32x4.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-Texas Instruments - tlv320aic32x4 Codec module
-
-The tlv320aic32x4 serial control bus communicates through I2C protocols
-
-Required properties:
- - compatible - "string" - One of:
-	"ti,tlv320aic32x4" TLV320AIC3204
-	"ti,tlv320aic32x6" TLV320AIC3206, TLV320AIC3256
-	"ti,tas2505" TAS2505, TAS2521
- - reg: I2C slave address
- - *-supply: Required supply regulators are:
-    "iov" - digital IO power supply
-    "ldoin" - LDO power supply
-    "dv" - Digital core power supply
-    "av" - Analog core power supply
-    If you supply ldoin, dv and av are optional. Otherwise they are required
-   See regulator/regulator.txt for more information about the detailed binding
-   format.
-
-Optional properties:
- - reset-gpios: Reset-GPIO phandle with args as described in gpio/gpio.txt
- - clocks/clock-names: Clock named 'mclk' for the master clock of the codec.
-   See clock/clock-bindings.txt for information about the detailed format.
- - aic32x4-gpio-func - <array of 5 int>
-	- Types are defined in include/sound/tlv320aic32x4.h
-
-
-Example:
-
-codec: tlv320aic32x4@18 {
-	compatible = "ti,tlv320aic32x4";
-	reg = <0x18>;
-	clocks = <&clks 201>;
-	clock-names = "mclk";
-	aic32x4-gpio-func= <
-			0xff /* AIC32X4_MFPX_DEFAULT_VALUE */
-			0xff /* AIC32X4_MFPX_DEFAULT_VALUE */
-			0x04 /* MFP3 AIC32X4_MFP3_GPIO_ENABLED */
-			0xff /* AIC32X4_MFPX_DEFAULT_VALUE */
-			0x08 /* MFP5 AIC32X4_MFP5_GPIO_INPUT */
-		>;
-};
diff --git a/Documentation/devicetree/bindings/sound/tlv320aic32x4.yaml b/Documentation/devicetree/bindings/sound/tlv320aic32x4.yaml
new file mode 100644
index 0000000000000..ebf84cdcb68d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tlv320aic32x4.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2019 Texas Instruments Incorporated
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/tlv320aic32x4.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TLV320AIC32x4 Stereo Audio codec
+
+maintainers:
+  - Alexander Stein <alexander.stein@ew.tq-group.com>
+
+description: |
+  The TLV320AIC32x4 audio codec can be accessed using I2C or SPI
+
+properties:
+  compatible:
+    enum:
+      - ti,tas2505
+      - ti,tlv320aic32x4
+      - ti,tlv320aic32x6
+
+  reg:
+    description: |
+      I2C address or SPI chip select of the device
+
+  clocks:
+    items:
+      - description: Master clock
+
+  clock-names:
+    items:
+      - const: mclk
+
+  av-supply:
+    description: Analog core power supply
+
+  dv-supply:
+    description: Digital core power supply
+
+  iov-supply:
+    description: Digital IO power supply
+
+  ldoin-supply:
+    description: LDO power supply
+
+  reset-gpios:
+    maxItems: 1
+    description: |
+      GPIO used for hardware reset
+
+  '#sound-dai-cells':
+    const: 0
+
+  aic32x4-gpio-func:
+    description: |
+       GPIO function configuration for pins MFP1-MFP5.
+       Types are defined in include/sound/tlv320aic32x4.h
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 5
+    maxItems: 5
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - iov-supply
+
+additionalProperties: false
+
+allOf:
+  - if:
+      not:
+        required:
+          - ldoin-supply
+    then:
+      required:
+        - av-supply
+        - dv-supply
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      codec: tlv320aic32x4@18 {
+        compatible = "ti,tlv320aic32x4";
+        reg = <0x18>;
+        iov-supply = <&reg_3v3>;
+        ldoin-supply = <&reg_3v3>;
+        clocks = <&clks 201>;
+        clock-names = "mclk";
+        aic32x4-gpio-func= <
+          0xff /* AIC32X4_MFPX_DEFAULT_VALUE */
+          0xff /* AIC32X4_MFPX_DEFAULT_VALUE */
+          0x04 /* MFP3 AIC32X4_MFP3_GPIO_ENABLED */
+          0xff /* AIC32X4_MFPX_DEFAULT_VALUE */
+          0x08 /* MFP5 AIC32X4_MFP5_GPIO_INPUT */
+        >;
+      };
+    };
-- 
2.34.1

