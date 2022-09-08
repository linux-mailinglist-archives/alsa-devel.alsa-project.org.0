Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB8B5B1889
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 11:23:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C3E616DA;
	Thu,  8 Sep 2022 11:22:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C3E616DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662629029;
	bh=bWcOyd7iARt4JcemWaI+7kHGE+ZTizfkZpsA1SaSWaY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gE5uFOlI/w0qIzlgxUBfwEMhkzkw+ozaEB4WwZpt4fF0VMuUX79SsjlnGUO1DNGKN
	 eByaEqOiegvp8pPkZubR1iNOQSeDtFomuFcskM+5tcEzjGUBgkJtXnag6g3YKLqNBI
	 VbuFrHZyUj8/bEJAU836SqXZnm7K9QlHSHeGN6bg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94703F805A1;
	Thu,  8 Sep 2022 11:20:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94943F80580; Thu,  8 Sep 2022 11:20:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED65BF80551
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 11:20:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED65BF80551
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="V9vECv6N"
Received: by mail-lf1-x135.google.com with SMTP id k10so12090240lfm.4
 for <alsa-devel@alsa-project.org>; Thu, 08 Sep 2022 02:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=UnigltW7HBDxkosiCCcadrW+t3i6Pjf7KeooLvb5PMc=;
 b=V9vECv6NF6JD3PU+xEkw2+h4tws80yZDwcYTrRyCBsqpz9qvZImWMC2xT8E//qdkqK
 /pU0NSjKLiOjAiW41xuU0S8NUPzEG4gy3P6TdBlhULMmFkkqZdwSWMtueJOaYYdjo/5V
 s+lNYgyN46w8OnhWFEdBtZ106NhoMtTkIx6QeSLSlCNSfcObqdnkKkqn+Drgxcb2jXs/
 scjuRrxnCsY9QLM1t6eTbsQqZhsmgpXEdhOeIyOGjTJeKxHbL2eL3P6oO6z23kVX/Kpw
 bId5fEK0SnMkdd0AXuYAutYm1zozVHjWELAs82xdRwaegCGfFtQYf42t1sUYCjGCCROf
 Gjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=UnigltW7HBDxkosiCCcadrW+t3i6Pjf7KeooLvb5PMc=;
 b=1UzZmQCLMUsShwDhSStHud/kSM47xi6LNs2+rmgCVf6qxAWjCym7ZY7xdqlQepfnbc
 jYid7Xknh0vA2xxHRtdotkGu0ZouGBg+SIEE4HduMYd0iAPsXAShNEY8GWlhH9WwcxD9
 LOGNC9H2V56NMif7EfE9U0EAvGd6QhHlTt8+uuYNLra7V6E1HaFxYDtaNQsCmhZasDRE
 FwbShWhlvyXjg/MyYL3+CWOVKMVxoRrHSkGLpPOqeYCzJU+0waSQouxke1RxfZwjzWPv
 C0fxsk/jbWE8zUeoVGHWyB6ZIdVKzLuz5t5BPcHbz8M2PLeSjIeXHC9oGCJtfwWnuVMx
 QKXg==
X-Gm-Message-State: ACgBeo2ptb9VXujEYSRiLtev/bj3iHnk21Z0XmgCXVrY+vkytaCUPQrm
 Y5+McI3fwhpyhxfBCxgKfdCefw==
X-Google-Smtp-Source: AA6agR7KEAX43DIQclyV50FytzC43uokMwo5Qg5ImD3yjqwQFMpFbHZX+sK149deWktFfKmJ7/aLgQ==
X-Received: by 2002:a05:6512:3502:b0:493:e21:b77d with SMTP id
 h2-20020a056512350200b004930e21b77dmr2303022lfs.580.1662628801857; 
 Thu, 08 Sep 2022 02:20:01 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a056512211100b004946a758d21sm218219lfr.161.2022.09.08.02.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 02:20:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 09/14] ASoC: dt-bindings:: qcom,q6asm: convert to dtschema
Date: Thu,  8 Sep 2022 11:19:41 +0200
Message-Id: <20220908091946.44800-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220908091946.44800-1-krzysztof.kozlowski@linaro.org>
References: <20220908091946.44800-1-krzysztof.kozlowski@linaro.org>
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

Convert Qualcomm Audio Stream Manager (Q6ASM) bindings to DT schema.

The original bindings documented:
1. APR service node with compatibles: "qcom,q6asm" and
   "qcom,q6asm-v<MAJOR-NUMBER>.<MINOR-NUMBER>",
2. actual DAIs child node with compatible "qcom,q6asm-dais".

The conversion entirely drops (1) because the compatible is already
documented in bindings/soc/qcom/qcom,apr.yaml.  The
"qcom,q6asm-v<MAJOR-NUMBER>.<MINOR-NUMBER>" on the other hand is not
used at all - neither in existing DTS, nor in downstream sources - so
versions seems to be fully auto-detectable.

Another change done in conversion is adding "iommus" property, which is
already used in DTS and Linux driver.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Expected warning because the qcom,apr.yaml is being fixed in next commit:

  Documentation/devicetree/bindings/sound/qcom,q6asm.example.dtb: apr: service@7: 'dais' does not match any of the regexes: '^.*@[0-9a-f]+$', 'pinctrl-[0-9]+'
    From schema: /home/krzk/dev/linux/linux/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml

Changes since v2:
1. Rename to qcom,q6asm-dais.yaml (Rob)
2. Extend commit msg.

Changes since v1:
1. New patch.
---
 .../bindings/sound/qcom,q6asm-dais.yaml       | 112 ++++++++++++++++++
 .../devicetree/bindings/sound/qcom,q6asm.txt  |  70 -----------
 2 files changed, 112 insertions(+), 70 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6asm-dais.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,q6asm.txt

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6asm-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6asm-dais.yaml
new file mode 100644
index 000000000000..d17757c58a99
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,q6asm-dais.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,q6asm-dais.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Audio Stream Manager (Q6ASM)
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description:
+  Q6ASM is one of the APR audio services on Q6DSP. Each of its subnodes
+  represent a dai with board specific configuration.
+
+properties:
+  compatible:
+    enum:
+      - qcom,q6asm-dais
+
+  iommus:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^dai@[0-9]+$':
+    type: object
+    description:
+      Q6ASM Digital Audio Interface
+
+    properties:
+      reg:
+        maxItems: 1
+
+      direction:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2]
+        description: |
+          The direction of the dai stream::
+           - Q6ASM_DAI_TX_RX (0) for both tx and rx
+           - Q6ASM_DAI_TX (1) for only tx (Capture/Encode)
+           - Q6ASM_DAI_RX (2) for only rx (Playback/Decode)
+
+      is-compress-dai:
+        type: boolean
+        description:
+          Compress offload dai.
+
+    dependencies:
+      is-compress-dai: ['direction']
+
+    required:
+      - reg
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - "#sound-dai-cells"
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/qcom,apr.h>
+    #include <dt-bindings/sound/qcom,q6asm.h>
+
+    apr {
+        compatible = "qcom,apr-v2";
+        qcom,domain = <APR_DOMAIN_ADSP>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        service@7 {
+            compatible = "qcom,q6asm";
+            reg = <APR_SVC_ASM>;
+            qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+
+            dais {
+                compatible = "qcom,q6asm-dais";
+                iommus = <&apps_smmu 0x1821 0x0>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+                #sound-dai-cells = <1>;
+
+                dai@0 {
+                    reg = <0>;
+                };
+
+                dai@1 {
+                    reg = <1>;
+                };
+
+                dai@2 {
+                    reg = <2>;
+                    is-compress-dai;
+                    direction = <1>;
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/sound/qcom,q6asm.txt b/Documentation/devicetree/bindings/sound/qcom,q6asm.txt
deleted file mode 100644
index 0d0075125243..000000000000
--- a/Documentation/devicetree/bindings/sound/qcom,q6asm.txt
+++ /dev/null
@@ -1,70 +0,0 @@
-Qualcomm Audio Stream Manager (Q6ASM) binding
-
-Q6ASM is one of the APR audio service on Q6DSP.
-Please refer to qcom,apr.txt for details of the common apr service bindings
-used by the apr service device.
-
-- but must contain the following property:
-
-- compatible:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must be "qcom,q6asm-v<MAJOR-NUMBER>.<MINOR-NUMBER>".
-		    Or "qcom,q6asm" where the version number can be queried
-		    from DSP.
-		    example "qcom,q6asm-v2.0"
-
-= ASM DAIs (Digital Audio Interface)
-"dais" subnode of the ASM node represents dai specific configuration
-
-- compatible:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must be "qcom,q6asm-dais".
-
-- #sound-dai-cells
-	Usage: required
-	Value type: <u32>
-	Definition: Must be 1
-
-== ASM DAI is subnode of "dais" and represent a dai, it includes board specific
-configuration of each dai. Must contain the following properties.
-
-- reg
-	Usage: required
-	Value type: <u32>
-	Definition: Must be dai id
-
-- direction:
-	Usage: Required for Compress offload dais
-	Value type: <u32>
-	Definition: Specifies the direction of the dai stream
-			Q6ASM_DAI_TX_RX (0) for both tx and rx
-			Q6ASM_DAI_TX (1) for only tx (Capture/Encode)
-			Q6ASM_DAI_RX (2) for only rx (Playback/Decode)
-
-- is-compress-dai:
-	Usage: Required for Compress offload dais
-	Value type: <boolean>
-	Definition: present for Compress offload dais
-
-
-= EXAMPLE
-#include <dt-bindings/sound/qcom,q6asm.h>
-
-apr-service@7 {
-	compatible = "qcom,q6asm";
-	reg = <APR_SVC_ASM>;
-	q6asmdai: dais {
-		compatible = "qcom,q6asm-dais";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		#sound-dai-cells = <1>;
-
-		dai@0 {
-			reg = <0>;
-			direction = <Q6ASM_DAI_RX>;
-			is-compress-dai;
-		};
-	};
-};
-- 
2.34.1

