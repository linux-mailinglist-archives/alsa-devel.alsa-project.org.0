Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3210A5EE035
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Sep 2022 17:24:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C902D164D;
	Wed, 28 Sep 2022 17:23:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C902D164D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664378679;
	bh=Nh0NO2g9u65+BN8klaBhFNnmBX/CEPSabFEE33aPCBM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kmajInFAtte/SJuyIB1kwrwzfXf8OKr6pXborAXjDzJrGsQZuxIBXeY6dy+greKTf
	 l2DqFghxSIt/LDVEzkc6t1J00kN4OcfeoWGwuwQV/hon7MB2QFUoqIBrIqU4HfbSSP
	 TtpPnCsW1B1kXBfAJjQTwVbtg2EL6T1z7Bu858jc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFD90F8058C;
	Wed, 28 Sep 2022 17:21:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAB96F80551; Wed, 28 Sep 2022 17:20:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BFBFF80549
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 17:20:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BFBFF80549
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="HUVIrwJl"
Received: by mail-lf1-x12e.google.com with SMTP id g1so3267641lfu.12
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 08:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=BIA0TAnjcVDeqXmtPoACZFO0zgCM9Z55/uYMEChmV1k=;
 b=HUVIrwJlbnWC7POZbUuq+jawZ0pCLLKkdhQ3Sh6xcMy6lbIlMorHLq1LMkUHCaXBSF
 ZrReqg/oB8K+ev35Is83p3IEFbT5fxx7j6jpS+sCsC+B8DVdEu954I3L/TmX185bRvKz
 gH6fOuxZhoTvGP8xLj9kWhMTVV65wGdbk0ALcpbiiIZsr3oyVL5oZ9nP29s0yMzlGjh5
 dcasR4sZ0YjbLofO5zxnW0ExCizB5BUyjqAncvt1iZ8v6U57+P+1p6q7A0UrEzeymo3/
 owzq4L72aGyoxHP7OubyUeEUA7r5IDUBFzSd6Yo97mpxk2IRG6XduzHRMz2euEavQnVf
 wBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=BIA0TAnjcVDeqXmtPoACZFO0zgCM9Z55/uYMEChmV1k=;
 b=mCsO14f854jSxjBk0mb8ozDCczb9L+otMs4SLIfCc8WfV5qTIi2fdD5pAzrBWfMhmr
 +Ou0/ML+dQ+9PGLA2XGZZmRRosE17GRPucqTM9EPAREncMBiAcW4zb6gtNreniXew6P5
 uRKAVOUUbek1PEZF4AWU1WeLL7jvTczOfmR35L37GrIqcDenxGpSELzF1tnx+VGPi+v5
 UYyPSIuMoKkO10mVD0g8TrAbCRR4hrqtFqvdX1ZBXw7pPNaDmXKSZTprz0sCNmnvQUgV
 mQbXrulGazizQyFhR3AR0EMMnAYOZ4IG6xoopKDhrmdL3gv+/YkUF//xsjZlo9qqW0ch
 2yTg==
X-Gm-Message-State: ACrzQf1VXpvj64FTPKPXxcdczNab0j4NYEvbEM5584b+zD4cONf8b19A
 EEoC+PBNGYIAi050udQCAvcmmQ==
X-Google-Smtp-Source: AMsMyM6rOb4+Z/xY3QPevQEAUk/nnJsmWhq1eHI2OR3T6Ao9NDzM8pnBJePg8hOoi4WsWLfHsGHQnA==
X-Received: by 2002:ac2:5a49:0:b0:49f:f620:b81b with SMTP id
 r9-20020ac25a49000000b0049ff620b81bmr12966051lfn.307.1664378444747; 
 Wed, 28 Sep 2022 08:20:44 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a056512048200b00497a41b3a42sm503023lfq.88.2022.09.28.08.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 08:20:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 10/11] dt-bindings: slimbus: qcom,
 slim: convert to DT schema
Date: Wed, 28 Sep 2022 17:20:26 +0200
Message-Id: <20220928152027.489543-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220928152027.489543-1-krzysztof.kozlowski@linaro.org>
References: <20220928152027.489543-1-krzysztof.kozlowski@linaro.org>
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

