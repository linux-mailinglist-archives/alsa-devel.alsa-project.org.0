Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E48FE60E5A5
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 18:44:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85CE93AF5;
	Wed, 26 Oct 2022 18:43:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85CE93AF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666802684;
	bh=VgJORuMQrOS+H0kKOMAfJr9/SBKJetZbG5BTIYUM5Sw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FNvn/p/bEnRgtKBdlBhfDHG0MEk/+5i1RDWfRx2wAVQRegom8hvhjtvDeXT6AHveH
	 5mk33dyQpyEKm5ogGPsN6IEEO4+iPaKHtEsDGwRoAVT9ppvu7dj3XO+yNZDXLwjXFq
	 txQYCjgKc9nR//btQLm9luKmuCQLzOGSxe1An8gs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69A6AF80240;
	Wed, 26 Oct 2022 18:43:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97DE6F804B4; Wed, 26 Oct 2022 18:43:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B75DAF8016C
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 18:43:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B75DAF8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="UmtCcKD4"
Received: by mail-qt1-x834.google.com with SMTP id a24so10313535qto.10
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 09:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ap86oaX2me6LTIfHjN4MG9KcHVBwjDqudIZuJpAwdCI=;
 b=UmtCcKD4KAPnaB2ke6wYCS13xUHB24tXh8DiLOfjGIFkhzqDAiYkLoijyVH6bvtsdN
 G+paNpE9WfDbFaws+qf/yo2UJPMDAxKjYrwVQ67FdnOeBJqEcI3utIBJFUT50PMx7eSI
 424VVhMC81YL2Xnp2MPXuwVdsD/y/ece7QA08tA+udUlutE70e0DnnNaRobtHeEZIkMi
 T0gEqEEqH0u5fpi91wRFOBv2966MuC58YThD/u8PeEi06+xoOb7qE1DLvRLxlLp70piQ
 Dch1+VBt7Qjmd9rvckF8fM7lNZCf2qXLY+Kco8xAKGTD5HB349qhEcPOpk8fsQKtf9l1
 o55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ap86oaX2me6LTIfHjN4MG9KcHVBwjDqudIZuJpAwdCI=;
 b=ll9UPG9EJmW5b9+XsHV03MDpm8JLGtZDkuH7Z0+dwaArXgj7MmAtypMQ5ulf+OwlSX
 B+NsbkUpPAPcdWE5T3TpT46AbFp0+/aChSKpgsn+cpVIpbojx1LxAKUad5YsntD7OvPk
 RdAor3NeedWme/hG5+/jHBHEDyUwNinR6JYkm0Q6l+pJgQh+ANbrMdE1Y3DDUJudOxFt
 HeSheSzw/9o/i1+PMXeLilsf1w8TmldaEPogYkz6YAlD+TuVrHOk9o8mf2tavMZYTCNR
 r9C4Dmb4GbyYyKF4IeemOvI5mTeKLXPNEb3iABMNeopvxaBhrVf/pU838NTfzQi6/e21
 KwpA==
X-Gm-Message-State: ACrzQf1fMeSYriUVyyqQcESszqTZPjAUc3QrUlEjiV1aQzURSCyE7A7v
 e1a7nMc2vE+/j9X8BwYC0tknrw==
X-Google-Smtp-Source: AMsMyM7mzANluI1ojMSrgWhKzF9ZFo0jBVVdvaI8FpeHTJXfky9mEFQ+e/VN2xn18XU2F2Hsu9kJAg==
X-Received: by 2002:a05:622a:178e:b0:39c:c9ac:b4ad with SMTP id
 s14-20020a05622a178e00b0039cc9acb4admr38620979qtk.82.1666802606807; 
 Wed, 26 Oct 2022 09:43:26 -0700 (PDT)
Received: from krzk-bin.. ([64.57.193.93]) by smtp.gmail.com with ESMTPSA id
 j6-20020a37c246000000b006eed47a1a1esm3989938qkm.134.2022.10.26.09.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 09:43:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 3/3] dt-bindings: slimbus: qcom,
 slim-ngd: convert to DT schema
Date: Wed, 26 Oct 2022 12:43:15 -0400
Message-Id: <20221026164315.39038-4-krzysztof.kozlowski@linaro.org>
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

Convert the Qualcomm SoC SLIMBus Non Generic Device (NGD) controller
bindings to DT Schema.

During conversion add iommus already present in DTS and extend the
example based on SDM845.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/slimbus/qcom,slim-ngd.yaml       | 120 ++++++++++++++++++
 .../bindings/slimbus/slim-ngd-qcom-ctrl.txt   |  82 ------------
 2 files changed, 120 insertions(+), 82 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/slimbus/qcom,slim-ngd.yaml
 delete mode 100644 Documentation/devicetree/bindings/slimbus/slim-ngd-qcom-ctrl.txt

diff --git a/Documentation/devicetree/bindings/slimbus/qcom,slim-ngd.yaml b/Documentation/devicetree/bindings/slimbus/qcom,slim-ngd.yaml
new file mode 100644
index 000000000000..abf61c15246e
--- /dev/null
+++ b/Documentation/devicetree/bindings/slimbus/qcom,slim-ngd.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SoC SLIMBus Non Generic Device (NGD) Controller
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description:
+  SLIMBus NGD controller is a light-weight driver responsible for communicating
+  with SLIMBus slaves directly over the bus using messaging interface and
+  communicating with master component residing on ADSP for bandwidth and
+  data-channel management
+
+properties:
+  compatible:
+    enum:
+      - qcom,slim-ngd-v1.5.0        # for MSM8996
+      - qcom,slim-ngd-v2.1.0        # for SDM845
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+  interrupts:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+patternProperties:
+  "^slim@[0-9a-f]+$":
+    type: object
+    $ref: slimbus.yaml#
+    description:
+      Each subnode represents an instance of NGD
+
+    properties:
+      reg:
+        maxItems: 1
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - dmas
+  - dma-names
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    slim-ngd@171c0000 {
+        compatible = "qcom,slim-ngd-v2.1.0";
+        reg = <0x171c0000 0x2c000>;
+        interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
+
+        dmas = <&slimbam 3>, <&slimbam 4>;
+        dma-names = "rx", "tx";
+        iommus = <&apps_smmu 0x1806 0x0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        slim@1 {
+            reg = <1>;
+            #address-cells = <2>;
+            #size-cells = <0>;
+
+            codec@1,0 {
+                compatible = "slim217,250";
+                reg = <1 0>;
+                slim-ifc-dev = <&wcd9340_ifd>;
+
+                #sound-dai-cells = <1>;
+
+                interrupts-extended = <&tlmm 54 IRQ_TYPE_LEVEL_HIGH>;
+                interrupt-controller;
+                #interrupt-cells = <1>;
+
+                #clock-cells = <0>;
+                clock-frequency = <9600000>;
+                clock-output-names = "mclk";
+                qcom,micbias1-microvolt = <1800000>;
+                qcom,micbias2-microvolt = <1800000>;
+                qcom,micbias3-microvolt = <1800000>;
+                qcom,micbias4-microvolt = <1800000>;
+
+                #address-cells = <1>;
+                #size-cells = <1>;
+
+                reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
+
+                /* Rest of the WCD9340 codec */
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/slimbus/slim-ngd-qcom-ctrl.txt b/Documentation/devicetree/bindings/slimbus/slim-ngd-qcom-ctrl.txt
deleted file mode 100644
index 7c3d9eb6af5d..000000000000
--- a/Documentation/devicetree/bindings/slimbus/slim-ngd-qcom-ctrl.txt
+++ /dev/null
@@ -1,82 +0,0 @@
-Qualcomm SLIMBus Non Generic Device (NGD) Controller binding
-
-SLIMBus NGD controller is a light-weight driver responsible for communicating
-with SLIMBus slaves directly over the bus using messaging interface and
-communicating with master component residing on ADSP for bandwidth and
-data-channel management
-
-- compatible:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must be "qcom,slim-ngd-v<MAJOR>.<MINOR>.<STEP>"
-	must be one of the following.
-	"qcom,slim-ngd-v1.5.0" for MSM8996
-	"qcom,slim-ngd-v2.1.0" for SDM845
-
-- reg:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: must specify the base address and size of the controller
-		    register space.
-- dmas
-	Usage: required
-	Value type: <array of phandles>
-	Definition: List of rx and tx dma channels
-
-- dma-names
-	Usage: required
-	Value type: <stringlist>
-	Definition: must be "rx" and "tx".
-
-- interrupts:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: must list controller IRQ.
-
-#address-cells
-	Usage: required
-	Value type: <u32>
-	Definition: Should be 1, reflecting the instance id of ngd.
-
-#size-cells
-	Usage: required
-	Value type: <u32>
-	Definition: Should be 0
-
-= NGD Devices
-Each subnode represents an instance of NGD, must contain the following
-properties:
-
-- reg:
-	Usage: required
-	Value type: <u32>
-	Definition: Should be instance id of ngd.
-
-#address-cells
-	Usage: required
-	Refer to slimbus/bus.txt for details of the common SLIMBus bindings.
-
-#size-cells
-	Usage: required
-	Refer to slimbus/bus.txt for details of the common SLIMBus bindings.
-
-= EXAMPLE
-
-slim@91c0000 {
-	compatible = "qcom,slim-ngd-v1.5.0";
-	reg = <0x91c0000 0x2c000>;
-	interrupts = <0 163 0>;
-	dmas =	<&slimbam 3>, <&slimbam 4>;
-	dma-names = "rx", "tx";
-	#address-cells = <1>;
-	#size-cells = <0>;
-	ngd@1 {
-		reg = <1>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		codec@1 {
-			compatible = "slim217,1a0";
-			reg  = <1 0>;
-		};
-	};
-};
-- 
2.34.1

