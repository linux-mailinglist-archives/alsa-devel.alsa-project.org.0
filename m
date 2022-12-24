Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F337B655A9C
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Dec 2022 16:43:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88B89B9B9;
	Sat, 24 Dec 2022 16:42:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88B89B9B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671896620;
	bh=qs1HtR41DKmzvbXr38da6U7rQemq9fr8f3GeCaPQHbc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cogzW5KmR3UTmLPjcVsDRgEn9tVE6/0oK2jxEEwvzvsC1TwOVzmQCaAhznA3mW5Qx
	 N4fDJs6toMWJnmLafhGIEQX3KMiCt+hg8+mUz+OVbTJhT6/LIZQ1tKE6uztJ9yfQZm
	 jeK6Akpomk1MGsxqI4sgu9VWUlnQhL5poZ9IVE3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AB87F80245;
	Sat, 24 Dec 2022 16:42:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C118EF80496; Sat, 24 Dec 2022 16:42:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E426EF8032B
 for <alsa-devel@alsa-project.org>; Sat, 24 Dec 2022 16:42:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E426EF8032B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Tu4Cn/+B
Received: by mail-lf1-x12d.google.com with SMTP id bp15so10677769lfb.13
 for <alsa-devel@alsa-project.org>; Sat, 24 Dec 2022 07:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B5CHbg+8b24jKcyqMjIgkeB+fm8k5OGLCytCdmtDF84=;
 b=Tu4Cn/+Bfo24LQKjYhx6hQjfaVH2XkiYAWLSLXtJzX51Hf9SJ3RuYQDdDX4ttZJ1T2
 e94Bb3HuIYU9MnvWYHSIWuuMHizHj7YlM32orCoG7rrCnkvXO3jg4UsNix7Ote/aJyxa
 jdq6uLohW+SHjtZLH9c1WuZpXC0m4viJVRE8+NFSYTZD7o2qy62Ow4d9L0CMsp+MUKox
 jL1jqVQWyD36UA7tI4YZnOMaS5iRCkvfwLrYY/Zoo4YR4r0DTjK5xO/z5HMHZVq4EOSU
 5YMci66YvKAY/1SbEtp00YrilTS3Rj3Pt+Vj8uvgq/jrO56mttgnTp6oIphvKmqJWa0e
 vWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B5CHbg+8b24jKcyqMjIgkeB+fm8k5OGLCytCdmtDF84=;
 b=Ro6K606B79crJnjVq+6o01Dc4feslAe0NQCTuSP2X7Gp72XcxP3QGf0r5tvtglwOqv
 MSGyKaR6EoQQSeuUzYY2w++RUlXnWXlPlI4P5+zvV0zm6TgOtKwbUpdZXg3Cm9n6CsS0
 wUpsbp/GyP+u4Q/jolJL6TVMoiqCUhyazEowJTxG4rKHlnmUH78Po2Zd/wKzrpLb/FAb
 VRs+BBWDOvTRO8xWaj6grq3D6b/mx7li72Y+E2dj2yPrIwzERPSecE5H9mJUCJPpvc6n
 HGHm7mxaZY32MWL/fXJiPizReZ3xUhMwGG4tDsa/26nfbA1ADoOWowhhjIi7CSYQqyJK
 Ev5g==
X-Gm-Message-State: AFqh2kpar0q5a61VEBFE5qE3wGqfcG3JZkIOiNu+zwBq0PRXCEDLfFbn
 kcH7XcW8oNPXhS6XpUcWogetjA==
X-Google-Smtp-Source: AMrXdXtwLkq5JjJtX7uA0W5OuWnCMwaKAklXGhAKpIPUbnZS/ecaOwe4cZr6IggAtCbXCFd9FNqITw==
X-Received: by 2002:a05:6512:1582:b0:4b6:e494:a98d with SMTP id
 bp2-20020a056512158200b004b6e494a98dmr4545398lfb.44.1671896534235; 
 Sat, 24 Dec 2022 07:42:14 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 c14-20020ac25f6e000000b004b5821219fbsm987035lfc.60.2022.12.24.07.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 07:42:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: dt-bindings: cirrus,
 cs35l41: cleanup $ref and example
Date: Sat, 24 Dec 2022 16:42:10 +0100
Message-Id: <20221224154210.43356-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224154210.43356-1-krzysztof.kozlowski@linaro.org>
References: <20221224154210.43356-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Non-functional cleanup:
1. Drop unneeded quotes form $ref,
2. Example: Use generic node name, use define for GPIO flag, adjust
   indentation to consistent 4-space style.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/cirrus,cs35l41.yaml        | 40 ++++++++++---------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml
index 919d7f16f24c..18fb471aa891 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml
@@ -45,7 +45,7 @@ properties:
       Configures the peak current by monitoring the current through the boost FET.
       Range starts at 1600 mA and goes to a maximum of 4500 mA with increments
       of 50 mA. See section 4.3.6 of the datasheet for details.
-    $ref: "/schemas/types.yaml#/definitions/uint32"
+    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 1600
     maximum: 4500
     default: 4500
@@ -54,7 +54,7 @@ properties:
     description:
       Boost inductor value, expressed in nH. Valid
       values include 1000, 1200, 1500 and 2200.
-    $ref: "/schemas/types.yaml#/definitions/uint32"
+    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 1000
     maximum: 2200
 
@@ -63,7 +63,7 @@ properties:
       Total equivalent boost capacitance on the VBST
       and VAMP pins, derated at 11 volts DC. The value must be rounded to the
       nearest integer and expressed in uF.
-    $ref: "/schemas/types.yaml#/definitions/uint32"
+    $ref: /schemas/types.yaml#/definitions/uint32
 
   cirrus,asp-sdout-hiz:
     description:
@@ -73,7 +73,7 @@ properties:
       1 = Hi-Z during unused slots but logic 0 while all transmit channels disabled
       2 = (Default) Logic 0 during unused slots, but Hi-Z while all transmit channels disabled
       3 = Hi-Z during unused slots and while all transmit channels disabled
-    $ref: "/schemas/types.yaml#/definitions/uint32"
+    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 0
     maximum: 3
     default: 2
@@ -87,7 +87,7 @@ properties:
       enable boost voltage.
       0 = Internal Boost
       1 = External Boost
-    $ref: "/schemas/types.yaml#/definitions/uint32"
+    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 0
     maximum: 1
 
@@ -112,7 +112,7 @@ properties:
       1 = GPIO
       2 = Sync
       3 = MCLK input
-    $ref: "/schemas/types.yaml#/definitions/uint32"
+    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 0
     maximum: 3
 
@@ -139,7 +139,7 @@ properties:
       3 = MCLK input
       4 = Push-pull INTB (active low)
       5 = Push-pull INT (active high)
-    $ref: "/schemas/types.yaml#/definitions/uint32"
+    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 0
     maximum: 5
 
@@ -179,21 +179,23 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
+
     spi {
         #address-cells = <1>;
         #size-cells = <0>;
 
-        cs35l41: cs35l41@2 {
-          #sound-dai-cells = <1>;
-          compatible = "cirrus,cs35l41";
-          reg = <2>;
-          VA-supply = <&dummy_vreg>;
-          VP-supply = <&dummy_vreg>;
-          reset-gpios = <&gpio 110 0>;
-
-          cirrus,boost-type = <0>;
-          cirrus,boost-peak-milliamp = <4500>;
-          cirrus,boost-ind-nanohenry = <1000>;
-          cirrus,boost-cap-microfarad = <15>;
+        cs35l41: speaker-amp@2 {
+            #sound-dai-cells = <1>;
+            compatible = "cirrus,cs35l41";
+            reg = <2>;
+            VA-supply = <&dummy_vreg>;
+            VP-supply = <&dummy_vreg>;
+            reset-gpios = <&gpio 110 GPIO_ACTIVE_HIGH>;
+
+            cirrus,boost-type = <0>;
+            cirrus,boost-peak-milliamp = <4500>;
+            cirrus,boost-ind-nanohenry = <1000>;
+            cirrus,boost-cap-microfarad = <15>;
         };
     };
-- 
2.34.1

