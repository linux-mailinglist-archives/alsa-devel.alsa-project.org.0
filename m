Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A47B5B01B9
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 12:19:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BABC6168D;
	Wed,  7 Sep 2022 12:18:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BABC6168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662545960;
	bh=wRY7jSkBc0yg+EgohT3Cmj7DdTFNXqAIwSINO6Hq1NI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HSMPi65KfqHsqevLCi2nXxR2/pFKPkd8bnpjJX4KdIneKRbzzHlZbFldflTmU/SCO
	 L6Mg9d3OTBA3Qx58RpTav5w0+VBaRnPprYoD9rBMyhETVY6rU1CMCjpFpJKmGZCEvU
	 GlojKuZ/goyrofE5fjbmzvbAex+9c0derWVvUSSg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 786ABF80118;
	Wed,  7 Sep 2022 12:16:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 701C6F805B3; Wed,  7 Sep 2022 12:16:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 858B4F80552
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 12:16:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 858B4F80552
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="s83OHZJo"
Received: by mail-lf1-x135.google.com with SMTP id w8so21620090lft.12
 for <alsa-devel@alsa-project.org>; Wed, 07 Sep 2022 03:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=gkNG+qHcrxb6dHeMWe1c0FIspCIqhs0hG0rU1YpvATQ=;
 b=s83OHZJoA4t36RGSXtm/7aHzlM/OXF8ldYpfRpox214Y6tSCM7GwXrfgT49cnokNWk
 EuBkHCAPX3OPaz9wwqtQk9D2waxBNUZyQKUNMn3aNCVmMv3HDrj/HOpeBlJ50MQRqw5i
 pzN8HRE9KJ8mGJddaRIjHf8XyriPROm89ln7JJWlLapAtfNh8CDmTrHZ8ihb3NiQO56y
 48cNHW5uTjsuIpp7mz8mXAwNkfmwcs96T0mRrfmY99Ld1Er8fofT+9us5C/fqhzAqr9I
 ByMBpGFMIBO/wXSN0iV0ZRv7LJL1PcsqTZVDEv1jk/inMamA4XaSrHlvjj/CiU147zwc
 7cWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=gkNG+qHcrxb6dHeMWe1c0FIspCIqhs0hG0rU1YpvATQ=;
 b=Ml18ZvjMe1PgLFlqtPvnYlDwDpKyDhWRy2qjukKImoYdP7eySMLJO9VuzS55bXOFq2
 MqSZNB6aCJlT8EEDBRawJoH6WcsUDEiyYm6XLG1M9GlYDhtWZMFWqTPGRIKX+A4iD6hl
 x/GWoRv4sWTWE1pRvqE5vNONYs5/ZEt54z9wXLOHece3d7HZzJjCVgtjqLFTeGLOjQj/
 WtIOSSNnJ5ssdoMWslDzwEPyXRmKaiNTwl9ozo7B7Gmye/nNmoQGBd71cRK66cFlO2dS
 4D1hLGSKTlygYIP8Rotwms9xvG3+0ADTvTgVJMG6o4cZEe963ER4kdV0F4E5nKktTtPN
 QrFg==
X-Gm-Message-State: ACgBeo2DyutkTt1jAMRQ7Ikch46pCqEsv8/oSiCwsnrwZS8lhZUACPQ4
 X61i+VMKp9lpYEcboEKK5qhSuw==
X-Google-Smtp-Source: AA6agR4ntjNiwe+YhhQH3At+XwAWpn0ItRcjKRzCu/35uda2S2LdIV7HOkJdZ33CCjcTs4j8GWRc9Q==
X-Received: by 2002:a05:6512:131f:b0:494:5d2f:c34b with SMTP id
 x31-20020a056512131f00b004945d2fc34bmr891828lfu.324.1662545777101; 
 Wed, 07 Sep 2022 03:16:17 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a2ea169000000b0026ab0e480bcsm960734ljl.39.2022.09.07.03.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 03:16:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH v2 09/14] ASoC: dt-bindings:: qcom,q6asm: convert to dtschema
Date: Wed,  7 Sep 2022 12:15:51 +0200
Message-Id: <20220907101556.37394-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220907101556.37394-1-krzysztof.kozlowski@linaro.org>
References: <20220907101556.37394-1-krzysztof.kozlowski@linaro.org>
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Expected warning because the qcom,apr.yaml is being fixed in next commit:

  Documentation/devicetree/bindings/sound/qcom,q6asm.example.dtb: apr: service@7: 'dais' does not match any of the regexes: '^.*@[0-9a-f]+$', 'pinctrl-[0-9]+'
    From schema: /home/krzk/dev/linux/linux/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml

Changes since v1:
1. New patch.
---
 .../devicetree/bindings/sound/qcom,q6asm.txt  |  70 -----------
 .../devicetree/bindings/sound/qcom,q6asm.yaml | 112 ++++++++++++++++++
 2 files changed, 112 insertions(+), 70 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,q6asm.txt
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6asm.yaml

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
diff --git a/Documentation/devicetree/bindings/sound/qcom,q6asm.yaml b/Documentation/devicetree/bindings/sound/qcom,q6asm.yaml
new file mode 100644
index 000000000000..505bd64a0717
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,q6asm.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,q6asm.yaml#
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
-- 
2.34.1

