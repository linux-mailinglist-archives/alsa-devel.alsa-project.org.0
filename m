Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAE45E7F92
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 18:19:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C28283D;
	Fri, 23 Sep 2022 18:18:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C28283D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663949988;
	bh=YceyM8HesMqU2OcAjU8ON0ThqcVevwLHIkuQjkih/zg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TBliDTPou7QMc6GejRbmtbgWdwHfNh1VXZhfqFFWeOEkiShG8i6S/rlQxa5/HpAJ0
	 37qJV1M5uI09dc7YQkGHztodGWAzRh8Iqwg7nu9O/NbFQQ6x1uvvmu/QzN86uSIml1
	 ikTI+XFrxa8pVQ9VxAZ4naTn5Wvss2TvblLJ9WuU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F7CEF8058C;
	Fri, 23 Sep 2022 18:16:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CAB91F80568; Fri, 23 Sep 2022 18:16:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AA52F80124
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 18:16:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AA52F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="heAO9fXa"
Received: by mail-lf1-x12e.google.com with SMTP id u18so1040146lfo.8
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 09:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Y26y447ZUu1UA/YFiP/jpdxnrW5X4XPXwhMFolSfH4Q=;
 b=heAO9fXaSqpqsZJ4/K+Dhrm3dxAAVAzQlV4VH3vD+EPJr7Dm8ESjs7YuGccLjJ2dLM
 yzxuZXUrFmwl1cmYsLhudRifz3fXsfyL/No8toH7oqYxG4BbAtBKuutdXE/s+VzOmJY2
 mTjauiRTtqfNweqnVXj30KGjwaobTfJArG+qXusNoZ/iQwnAwmOJLPGxXpUsooYdMuWx
 9Cd71uR0vDnfq/lTZrfVx6usFqQiUqxKGQFPWh/LEAKVwmNCYslBhrGe/HisKyjHV7Xq
 IMtuGi85ySyta5BAtqJ8Opu4iXAukxihtvhFKLHx4pLAu3d5FjeKOs32jk6Naqj101j5
 hHWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Y26y447ZUu1UA/YFiP/jpdxnrW5X4XPXwhMFolSfH4Q=;
 b=05DZrvfHtjtzjg0FUr0Qfcp5wRB3GIwMNclZGgmVzbyZfuqPttW+Oc8kvOSb0KmQJ3
 5cIuL/m7TIJymIjzWju7TqIXKZZaSt/O/kunnorBkI8Kj/jwNzh9TfI4Tqnu5dd6j3UH
 I4gfKfSbkKUke4ztunl3FM39ecShr/RvhRYvxEH0COHLHLXXC2VZbrFk3AtH9XljShJ3
 2l+YwRr1P0vudMUp4fmgU+dGtKzeaInfx4QvCF6U5LCD4O3W9MubMzu2tNlnbRTs0b78
 iZyU3aqZHQT4y76UJjX8fF2tsbOrO0TMiWnkYDvAIWEjt74PXbc5R9eV1vAv9/XTsmYQ
 K7sQ==
X-Gm-Message-State: ACrzQf2bIhanO04EBhrfstk8p9O+g7b77JqGqXsl+tA9LqYoowGmuq92
 FAvaABwBrj3EIwWXhKpBl3XmhQ==
X-Google-Smtp-Source: AMsMyM4hfaeYiggwtqqGuXTfoAmqbc4jHyycxViHXY6ewrvXRtS20UC3Vfid1Q13cxaxsAGxBxczxQ==
X-Received: by 2002:a05:6512:2294:b0:49e:f3d0:4cef with SMTP id
 f20-20020a056512229400b0049ef3d04cefmr3426470lfu.183.1663949776984; 
 Fri, 23 Sep 2022 09:16:16 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 f9-20020ac25cc9000000b00492f45cbbfcsm1493491lfq.302.2022.09.23.09.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 09:16:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH 10/11] dt-bindings: slimbus: qcom,slim: convert to DT schema
Date: Fri, 23 Sep 2022 18:14:52 +0200
Message-Id: <20220923161453.469179-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923161453.469179-1-krzysztof.kozlowski@linaro.org>
References: <20220923161453.469179-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

