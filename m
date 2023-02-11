Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A029F69315E
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Feb 2023 14:49:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E6AD836;
	Sat, 11 Feb 2023 14:48:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E6AD836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676123342;
	bh=5BBBG/8p5Ra+uGC8+QAPSzfr6KC8Kojw4l3tlG08w0U=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ScAoRspLPxzca7LHLn1iZto4aOCzgW1adrN+e3ylm4LRrPzvegEdN7P8m71jDXFcr
	 /vWMuQi2QNuQ0aOSg+rIRPjeU/A0EV2DxAhHrp5QkizL0QD4mhLNjAimPXpkK27GD/
	 G7C+ziFuSHmB63rJfcjluLeRpLVB+BwJ2Vx9off0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E853F800B8;
	Sat, 11 Feb 2023 14:48:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD0C0F800E4; Sat, 11 Feb 2023 14:48:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44692F80094
	for <alsa-devel@alsa-project.org>; Sat, 11 Feb 2023 14:47:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44692F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=bkyse87j
Received: by mail-wm1-x32e.google.com with SMTP id
 s13-20020a05600c45cd00b003ddca7a2bcbso594232wmo.3
        for <alsa-devel@alsa-project.org>;
 Sat, 11 Feb 2023 05:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FPN1fIKNwenCr+g17limoc+6SEvzIeR24uuY13yy6Ts=;
        b=bkyse87jJ+x659elj3r0wDAD5+kWKv9NU4FubQREBpkpAkiuh6TyEwWJPXzxNVYodr
         YzD++4b/g95XW1ajFyB89vp12q+CWeoLCSMbMeonYl/JlMx6KuRKavDObNxSl9GnKD1s
         Cs7qQhxjycAy1+3vWQ78vshLP77gvoSczzUHJfy+raskrEN+TOZfokwnWyFOnJxA+SFx
         q2GsBuY7s6Zqbx3/n68KvoF7gk2NIOksBxDMBp2pWLuo6+7MVN00ErbASqQ9u2l114tU
         Xw4ZN/kTFT6oWAKq7XeN/9O0W+9n15whbe1lbAigXbY0X6ROcAzx5/SBqvxD1KtF52jl
         9frA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FPN1fIKNwenCr+g17limoc+6SEvzIeR24uuY13yy6Ts=;
        b=DgVbAyhzh7JSh18GiLtffeTM3PSY5yv3zQFaJpLmb4wm4zJuRFqnWy072nZtrCO0gf
         I7eYUdwo3a0wXEZl9Ep1MClgzQF8zk/1LSnVds9k04CuFYIWqjqcODL/1VGyuUhvGPqa
         Li8aaF4FlTACPGbYXl/z/rLpQonXycfkRwdQRLMM3YrvpTENM/Yr6qixxmXeWJI2vXVk
         jHeUJysvu47aKdEVBmAAMHOMItPWVSAGPnh3BvtoqLbyLfD+JCPTjC0FJMqBi9QorCnL
         ZD20doxgCS/+fk5Kx3QkBOFZtBhwqkaQrePAQJwMcLgGgLCYg7Gt3eRplbGDvT8LEyQh
         gYNA==
X-Gm-Message-State: AO0yUKUep/uL6C7x662w+Ft9xXKld1jnadjkHwqCmrrclMIL192xv88b
	hQCw5cEvf+1UBYWjlh2SeCxcKA==
X-Google-Smtp-Source: 
 AK7set9hAdDp/5L04rWBd+pLPbleynZB6ORfeOlNet5AwXo1WxJRr5lGolL4A1cLdRRm9x7g53qNaA==
X-Received: by 2002:a05:600c:1684:b0:3d0:761b:f86 with SMTP id
 k4-20020a05600c168400b003d0761b0f86mr15004606wmn.28.1676123278201;
        Sat, 11 Feb 2023 05:47:58 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 p24-20020a05600c1d9800b003dd1bd0b915sm11186536wms.22.2023.02.11.05.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 05:47:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: maxim,max98095: Convert to dtschema
Date: Sat, 11 Feb 2023 14:47:55 +0100
Message-Id: <20230211134755.86061-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NSWINGUGZORTCKSO2S53CVVICT3HJNGP
X-Message-ID-Hash: NSWINGUGZORTCKSO2S53CVVICT3HJNGP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NSWINGUGZORTCKSO2S53CVVICT3HJNGP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the Maxim Integrated MAX98095 audio codec bindings to DT schema.
Add missing sound-dai-cells during conversion.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/max98095.txt    | 22 --------
 .../bindings/sound/maxim,max98095.yaml        | 54 +++++++++++++++++++
 2 files changed, 54 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/max98095.txt
 create mode 100644 Documentation/devicetree/bindings/sound/maxim,max98095.yaml

diff --git a/Documentation/devicetree/bindings/sound/max98095.txt b/Documentation/devicetree/bindings/sound/max98095.txt
deleted file mode 100644
index 318a4c82f17f..000000000000
--- a/Documentation/devicetree/bindings/sound/max98095.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-MAX98095 audio CODEC
-
-This device supports I2C only.
-
-Required properties:
-
-- compatible : "maxim,max98095".
-
-- reg : The I2C address of the device.
-
-Optional properties:
-
-- clocks: The phandle of the master clock to the CODEC
-
-- clock-names: Should be "mclk"
-
-Example:
-
-max98095: codec@11 {
-	compatible = "maxim,max98095";
-	reg = <0x11>;
-};
diff --git a/Documentation/devicetree/bindings/sound/maxim,max98095.yaml b/Documentation/devicetree/bindings/sound/maxim,max98095.yaml
new file mode 100644
index 000000000000..77544a9e1587
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/maxim,max98095.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/maxim,max98095.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim Integrated MAX98095 audio codec
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - maxim,max98095
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: master clock
+
+  clock-names:
+    items:
+      - const: mclk
+
+  '#sound-dai-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        audio-codec@11 {
+            compatible = "maxim,max98095";
+            reg = <0x11>;
+            clocks = <&i2s0 0>;
+            clock-names = "mclk";
+        };
+    };
-- 
2.34.1

