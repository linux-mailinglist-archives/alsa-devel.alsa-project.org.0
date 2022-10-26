Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3646560E5A8
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 18:45:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B8183AE3;
	Wed, 26 Oct 2022 18:44:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B8183AE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666802706;
	bh=Nh0NO2g9u65+BN8klaBhFNnmBX/CEPSabFEE33aPCBM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VExnqBwG+3TT+J/Nf/F9eDaSIoS7RuohT2v3n5xxqjCV1PHxzdQJJyWmA8dQFgqD2
	 7T8Ao8g4lm1W0+KCg5N4X5FMUSqP7CbRZ3liea0weF975xZjrf9jea7/RBXuiMMusY
	 68VCdR92+On87ifr0e6+ES5mUCjuuPpZWnz5MI+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33DA5F80553;
	Wed, 26 Oct 2022 18:43:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99B32F80240; Wed, 26 Oct 2022 18:43:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36ED5F80240
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 18:43:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36ED5F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="DnaSniz7"
Received: by mail-qk1-x72a.google.com with SMTP id z30so10961736qkz.13
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 09:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BIA0TAnjcVDeqXmtPoACZFO0zgCM9Z55/uYMEChmV1k=;
 b=DnaSniz76YewGQnj5EPw1fXqIqAMb0oJN8iiXLcbefMKhjPfPPHbH6bqRqpd2R2RQj
 EB9Wc6g/4HWkAhM7l90AwCxoYAmmzb2ksp9Cy/SjPSJAkUTGdzanA+wNDaCztMH5GdZ0
 +cR9SkfGoB76vHIPt/VZejcBEew7qolcfqHe0EFsK57Lu43L7pnJ/un0Vyzu+aecznBf
 av4EFWZFoZutYrnjJHxY2id52VVEAuJn2PUnQIBTHMo8eUusXOcjz9fqqtGY7E+817CM
 tRDrNGwU1YMjQcB81ccd7O6vRdP3f1UYupBvxTwFVdvEwGz1nckWr0jRr8Qc1LgTlex+
 7FHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BIA0TAnjcVDeqXmtPoACZFO0zgCM9Z55/uYMEChmV1k=;
 b=vxxO5V73C5T3aQTQNfoWN953bEXhR7ZKILIf6/1wCkoxKMlFe7HtuXJ2Jm4FP0++S/
 9ZwEpKL764D6YoIRjOICgJq1gNlXEHUAbBjgzxrGgi38kgXvreh3C4Nmxuka09ONsdQT
 tNsAE6e2C3We0kP95KcdYVvy5dGg/qToo/MVVufcyO0YXiyOK/6ROavPY4URkZOKK0OY
 jRcqKBYxkP8FiRwtgpIjPb0UzbDcd0er6KWSkPivf5p9v1gxXLGlo4nxJFhSlscjiH3E
 ZKjdhN+6iNkATsq/UGgZ0GPdvqM1QvxwnK/U3/drMd6y0nYcsLBV853JAY8rO/x4RiPV
 uuqQ==
X-Gm-Message-State: ACrzQf13jxqAo24Uqbp5w6h/KPzOUGkgtrPuLWB9L916ZGYolw3xTL2m
 m5yuZmL53TCdYjPYFPo7T99FFQ==
X-Google-Smtp-Source: AMsMyM7HETuiwIYKBMytIbgqH9N83uGDN9wZHZlSpMqnIT3Rvsr5r+Cmv0bqKVDzeSHP/bedqZpM0A==
X-Received: by 2002:a37:2e84:0:b0:6cf:8dd4:7adc with SMTP id
 u126-20020a372e84000000b006cf8dd47adcmr32039987qkh.723.1666802602997; 
 Wed, 26 Oct 2022 09:43:22 -0700 (PDT)
Received: from krzk-bin.. ([64.57.193.93]) by smtp.gmail.com with ESMTPSA id
 j6-20020a37c246000000b006eed47a1a1esm3989938qkm.134.2022.10.26.09.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 09:43:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 2/3] dt-bindings: slimbus: qcom,slim: convert to DT schema
Date: Wed, 26 Oct 2022 12:43:14 -0400
Message-Id: <20221026164315.39038-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026164315.39038-1-krzysztof.kozlowski@linaro.org>
References: <20221026164315.39038-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

Convert the Qualcomm SoC SLIMbus controller bindings to DT Schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/slimbus/qcom,slim.yaml           | 86 +++++++++++++++++++
 .../bindings/slimbus/slim-qcom-ctrl.txt       | 36 --------
 2 files changed, 86 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/slimbus/qcom,slim.yaml
 delete mode 100644 Documentation/devicetree/bindings/slimbus/slim-qcom-ctrl.txt

diff --git a/Documentation/devicetree/bindings/slimbus/qcom,slim.yaml b/Documentation/devicetree/bindings/slimbus/qcom,slim.yaml
new file mode 100644
index 000000000000..883bda58ca97
--- /dev/null
+++ b/Documentation/devicetree/bindings/slimbus/qcom,slim.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/slimbus/qcom,slim.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SoC SLIMbus controller
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description:
+  SLIMbus controller used when applications processor controls SLIMbus master
+  component.
+
+allOf:
+  - $ref: slimbus.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,apq8064-slim
+      - const: qcom,slim
+
+  reg:
+    items:
+      - description: Physical address of controller register blocks
+      - description: SLEW RATE register
+
+  reg-names:
+    items:
+      - const: ctrl
+      - const: slew
+
+  clocks:
+    items:
+      - description: Interface clock for this controller
+      - description: Interrupt for controller core's BAM
+
+  clock-names:
+    items:
+      - const: iface
+      - const: core
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-msm8960.h>
+    #include <dt-bindings/clock/qcom,lcc-msm8960.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        slim@28080000 {
+            compatible = "qcom,apq8064-slim", "qcom,slim";
+            reg = <0x28080000 0x2000>, <0x80207c 4>;
+            reg-names = "ctrl", "slew";
+            interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&lcc SLIMBUS_SRC>, <&lcc AUDIO_SLIMBUS_CLK>;
+            clock-names = "iface", "core";
+            #address-cells = <2>;
+            #size-cells = <0>;
+
+            audio-codec@1,0 {
+                compatible = "slim217,60";
+                reg = <1 0>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/slimbus/slim-qcom-ctrl.txt b/Documentation/devicetree/bindings/slimbus/slim-qcom-ctrl.txt
deleted file mode 100644
index 6d955e129f90..000000000000
--- a/Documentation/devicetree/bindings/slimbus/slim-qcom-ctrl.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-Qualcomm SLIMbus controller
-This controller is used if applications processor driver controls SLIMbus
-master component.
-
-Required properties:
-
- - reg : Offset and length of the register region(s) for the device
- - reg-names : Register region name(s) referenced in reg above
-	 Required register resource entries are:
-	 "ctrl": Physical address of controller register blocks
- 	 "slew": required for "qcom,apq8064-slim" SOC.
- - compatible : should be "qcom,<SOC-NAME>-slim" for SOC specific compatible
- 		followed by "qcom,slim" for fallback.
- - interrupts : Interrupt number used by this controller
- - clocks : Interface and core clocks used by this SLIMbus controller
- - clock-names : Required clock-name entries are:
-	"iface" : Interface clock for this controller
-	"core" : Interrupt for controller core's BAM
-
-Example:
-
-	slim@28080000 {
-		compatible = "qcom,apq8064-slim", "qcom,slim";
-		reg = <0x28080000 0x2000>, <0x80207C 4>;
-		reg-names = "ctrl", "slew";
-		interrupts = <0 33 0>;
-		clocks = <&lcc SLIMBUS_SRC>, <&lcc AUDIO_SLIMBUS_CLK>;
-		clock-names = "iface", "core";
-		#address-cells = <2>;
-		#size-cell = <0>;
-
-		wcd9310: audio-codec@1,0{
-			compatible = "slim217,60";
-			reg = <1 0>;
-		};
-	};
-- 
2.34.1

