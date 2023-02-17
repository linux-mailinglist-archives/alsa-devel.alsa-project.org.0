Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B8069AF05
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 16:07:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FE07F48;
	Fri, 17 Feb 2023 16:06:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FE07F48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676646458;
	bh=7cTxXsKpBmta+jYVd9bCTzz8gFhlHV8/avn2IqAt16U=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ioi0XBnt2aqVs7ezHQjwtJJogmMj7iT3OmieeGKdM4LTLj9AKkQgtSOKa3hv7Nm3Z
	 ZAT0jBt0dpuN4ofjV5VH9mSajLwhTCKCTTIV0WoS6H56nGTQwv4KSgnJeHOnz/Z9xt
	 tVr+LwITZVcBeHaF+usthXZ2E+eI8OyC7/UUIbqw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7319DF800E4;
	Fri, 17 Feb 2023 16:06:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52AD4F801C0; Fri, 17 Feb 2023 16:06:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07374F800B6
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 16:06:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07374F800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=rzKbDKDF
Received: by mail-ed1-x532.google.com with SMTP id h14so5641082edz.10
        for <alsa-devel@alsa-project.org>;
 Fri, 17 Feb 2023 07:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BVUO1aupwuc3SgbflJXaaYp+FkC1sn4UMeGDXbO6xHU=;
        b=rzKbDKDFnboK8nfAzvrMTvJw6Y/TCnHtmj9dSm3gBcZw0H7LD1DGg32N+3QxYOeC6V
         MSVe/+QCQ+QI8h6J+w5yWvR1qrK1d9IOLRF5J9BdQxpni7QON4pQcGDedOorfkCeeg2C
         sZGGyIF/Ue4MSwysYFNPPNyuVrD3Sg0jwZdTCXIdSE5u/8Sv/7HNJSln6ZW/v2W721VW
         +KcVLOxbEK8+axr0Rb9YHX7ARvLTVHD872g4BSEPPd6lSbTk3dL+IQH9I+o0REaJLaZH
         eVEOqL8cqFSRxWTuy6Ok+uxUD8b5pMbduELxj6+MxiTz+xcUeFlTYmXWFF3FefP8RSYU
         rosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BVUO1aupwuc3SgbflJXaaYp+FkC1sn4UMeGDXbO6xHU=;
        b=iRiQA8/wlWuNTi0WmKrtE2nENPafsHGKVOux/7IaOSvgNIjaISa4N4ueeCDcCSDLns
         sDXRMey56wq4y5WgQJTYdgxXPdjr5nMemXuBMg4CjGoVK+ScRqPx3Jfm45PKu+wB61D4
         IXU9s4Z7X/vXJ2g5muB2nEo9EHRfIvJ3I9EmOTZhaPU0dQFEkjqAcgbQBrBaQUYlUV//
         bRBDCosy6tH2KfXs6WuJYHOe5rwHQ7XLWTH0bDDhykKXk0jSZXtFEoyItBHy8unnLV7l
         jwWz4IvCfjuhGaZnJn9PDmQS4g239jyWDSQoZvpBh7zEHr9pB29HrACd7t6/PkzKlFGj
         RSgg==
X-Gm-Message-State: AO0yUKW5s5jMvQwZE5xSY2zZZOclIVSg99d0XYC0sl/22OQPuKlTJuZm
	YxEbDkBe1cczZE9zADT/yAXRKQ==
X-Google-Smtp-Source: 
 AK7set/MvpCwrmh0RJ26YKS8BemE7jtkrXyaF5g1Kn3SlB6NSMddMwdN2RsYzr6IDqPTECc1uZs1rA==
X-Received: by 2002:a17:906:f75b:b0:88c:a43d:81bc with SMTP id
 jp27-20020a170906f75b00b0088ca43d81bcmr8775238ejb.58.1676646394818;
        Fri, 17 Feb 2023 07:06:34 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 fx15-20020a170906b74f00b008b14ba6c954sm2221303ejb.194.2023.02.17.07.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 07:06:34 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	- <patches@opensource.cirrus.com>,
	Adrien Grassein <adrien.grassein@gmail.com>,
	Randy Li <ayaka@soulik.info>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/3] ASoC: dt-bindings: wlf,wm8960: Convert to dtschema
Date: Fri, 17 Feb 2023 16:06:25 +0100
Message-Id: <20230217150627.779764-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XIGYDGLYKCVCH5HBMFVCCKX3DYZUIIYE
X-Message-ID-Hash: XIGYDGLYKCVCH5HBMFVCCKX3DYZUIIYE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XIGYDGLYKCVCH5HBMFVCCKX3DYZUIIYE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the Wolfson WM8960 audio codecs bindings to DT schema.

Changes against original binding:
1. Document clocks and clock-names - already present in DTS and used
   by Linux driver.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

One DTS warning still remains:
  uniphier-pxs2-gentil.dtb: wm8960@1a: Unevaluated properties are not allowed ('port@0' was unexpected)

I am not sure if this is correct usage of endpoints. I would assume the
codec should be used only as DAI.
---
 .../devicetree/bindings/sound/wlf,wm8960.yaml | 88 +++++++++++++++++++
 .../devicetree/bindings/sound/wm8960.txt      | 42 ---------
 2 files changed, 88 insertions(+), 42 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8960.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wm8960.txt

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8960.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8960.yaml
new file mode 100644
index 000000000000..ee8eba7f0104
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8960.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/wlf,wm8960.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Wolfson WM8960 audio codec
+
+maintainers:
+  - patches@opensource.cirrus.com
+
+properties:
+  compatible:
+    const: wlf,wm8960
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: mclk
+
+  '#sound-dai-cells':
+    const: 0
+
+  wlf,capless:
+    type: boolean
+    description:
+      If present, OUT3 pin will be enabled and disabled together with HP_L and
+      HP_R pins in response to jack detect events.
+
+  wlf,gpio-cfg:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    maxItems: 2
+    description: |
+      A list of GPIO configuration register values.
+       - gpio-cfg[0]: ALRCGPIO of R9 (Audio interface)
+       - gpio-cfg[1]: {GPIOPOL:GPIOSEL[2:0]} of R48 (Additional Control 4).
+
+  wlf,hp-cfg:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    maxItems: 3
+    description: |
+      A list of headphone jack detect configuration register values:
+       - hp-cfg[0]: HPSEL[1:0] of R48 (Additional Control 4).
+       - hp-cfg[1]: {HPSWEN:HPSWPOL} of R24 (Additional Control 2).
+       - hp-cfg[2]: {TOCLKSEL:TOEN} of R23 (Additional Control 1).
+
+  wlf,shared-lrclk:
+    type: boolean
+    description:
+      If present, the LRCM bit of R24 (Additional control 2) gets set,
+      indicating that ADCLRC and DACLRC pins will be disabled only when ADC
+      (Left and Right) and DAC (Left and Right) are disabled.
+      When WM8960 works on synchronize mode and DACLRC pin is used to supply
+      frame clock, it will no frame clock for captrue unless enable DAC to
+      enable DACLRC pin. If shared-lrclk is present, no need to enable DAC for
+      captrue.
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: dai-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        audio-codec@1a {
+            compatible = "wlf,wm8960";
+            reg = <0x1a>;
+            clocks = <&clks 0>;
+            clock-names = "mclk";
+            #sound-dai-cells = <0>;
+            wlf,hp-cfg = <3 2 3>;
+            wlf,gpio-cfg = <1 3>;
+            wlf,shared-lrclk;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/sound/wm8960.txt b/Documentation/devicetree/bindings/sound/wm8960.txt
deleted file mode 100644
index 85d3b287108c..000000000000
--- a/Documentation/devicetree/bindings/sound/wm8960.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-WM8960 audio CODEC
-
-This device supports I2C only.
-
-Required properties:
-
-  - compatible : "wlf,wm8960"
-
-  - reg : the I2C address of the device.
-
-Optional properties:
-  - wlf,shared-lrclk: This is a boolean property. If present, the LRCM bit of
-	R24 (Additional control 2) gets set, indicating that ADCLRC and DACLRC pins
-	will be disabled only when ADC (Left and Right) and DAC (Left and Right)
-	are disabled.
-	When wm8960 works on synchronize mode and DACLRC pin is used to supply
-	frame clock, it will no frame clock for captrue unless enable DAC to enable
-	DACLRC pin. If shared-lrclk is present, no need to enable DAC for captrue.
-
-  - wlf,capless: This is a boolean property. If present, OUT3 pin will be
-	enabled and disabled together with HP_L and HP_R pins in response to jack
-	detect events.
-
-  - wlf,hp-cfg: A list of headphone jack detect configuration register values.
-		The list must be 3 entries long.
-		hp-cfg[0]: HPSEL[1:0] of R48 (Additional Control 4).
-		hp-cfg[1]: {HPSWEN:HPSWPOL} of R24 (Additional Control 2).
-		hp-cfg[2]: {TOCLKSEL:TOEN} of R23 (Additional Control 1).
-
-  - wlf,gpio-cfg: A list of GPIO configuration register values.
-		  The list must be 2 entries long.
-		  gpio-cfg[0]: ALRCGPIO of R9 (Audio interface)
-		  gpio-cfg[1]: {GPIOPOL:GPIOSEL[2:0]} of R48 (Additional Control 4).
-
-Example:
-
-wm8960: codec@1a {
-	compatible = "wlf,wm8960";
-	reg = <0x1a>;
-
-	wlf,shared-lrclk;
-};
-- 
2.34.1

