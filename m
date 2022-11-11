Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C5B62598D
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 12:38:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A6991672;
	Fri, 11 Nov 2022 12:37:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A6991672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668166679;
	bh=2JI4Tcj+TJe+eKybEg1SGoOPLvv9cSjDgWK2VOIYX0w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZiPeXA7y/0zJpRuA0/sgHGNhpesSOv+mG05W7076WzDSI6JS7QNqUudfK5cV+WY3k
	 XZ/EpCyZin1l4wM/34JqLyV2LVt2wVBDcbdkZDwnm9g57GXTRatMbqQ8cuP3Mt2Pp2
	 HIPkj3otgrRUW5GJoKkOdtQQ3qQ7m6PZyxAYv6DE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53BDEF80249;
	Fri, 11 Nov 2022 12:36:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4247DF80566; Fri, 11 Nov 2022 12:36:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC027F800F8
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 12:36:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC027F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="UFFAwcOs"
Received: by mail-lf1-x136.google.com with SMTP id d6so7889492lfs.10
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 03:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rVPXDxLMfpz8g27snic+eN+xSUqcTU7lGiltIX5KJbs=;
 b=UFFAwcOs+vDUyqFQ5OFeB+zkQYPlvSThzl452QSBVB/r7V2GtVBOn5pdWYJcl3CK48
 It2u3B4evYX1mwdc4wXIa1W1aNazcHRJ7ka7BzFiL6I1yCzQiwVrGdzm3Le6kXk6hxdQ
 9AWPl232CZhUgPEYCe8OEjNJ+NkFv7kFWV7OCCX0ZpaD1OgdzWauwwlFqL5/WWQStXbM
 3KJwrAcb/+CdE7E6dysZsM8dYzDrN6o+MuTue00mR52XNcAYYOz0CbFfoYawCT1Nqrod
 5Qoc7hYuBiE3PkRPQUxiKXv1durc29aeC4+NBeJLABEukudmF9z7pIJ5p6pqd4Tja0Wn
 53Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rVPXDxLMfpz8g27snic+eN+xSUqcTU7lGiltIX5KJbs=;
 b=a8lYuA+2+TapvJa3Qtu6pSmBKaekCyHcgQy2nEeA5msrdv+3j+viU3NAGp4lC9YfKp
 Bi4GF+Sa5G0VwHW6bfcbjQPr1IOCpwjtHco+oVb1kDFQRAvS7Ng1iQxOjQ0pBT6YLmPT
 GpURNsn9SRY6zuAgTrJWDAqEM0ptgO3yECL/eD8ZbTn97rrqObG3XcMGt+EFXBDNOhdO
 y3sl7ZLz8+Ua0oJY3ms/vnvbQzPbEhI15SIPDSDymD6KhX9IrtzXjyllXAl+Wiy8ClRG
 DgxPjSflNMMHbhOBkfSjkP8KlUA7FkMFByOqAmBmZoLk3EieQ4NdFwqj4QTI8UG0FVFA
 qQqw==
X-Gm-Message-State: ANoB5pkNjPJid3Vd+6luZ9lnr5WFa0zWX04IPuMIgo6HEt6Op6whkspB
 dAcQwHBGyPJFO7jZJNh3a19YLg==
X-Google-Smtp-Source: AA0mqf4HVcEm/1Udsx3H6f2tWIC7EjVaSIWojrY2XDxS5usQfZ7iO5evHyW0tJfWapeUrRYL7c7mYg==
X-Received: by 2002:a05:6512:b92:b0:4a7:66ba:df18 with SMTP id
 b18-20020a0565120b9200b004a766badf18mr581923lfv.208.1668166575518; 
 Fri, 11 Nov 2022 03:36:15 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 bi30-20020a0565120e9e00b004acb2adfa1fsm274970lfb.307.2022.11.11.03.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 03:36:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 06/10] ASoC: dt-bindings: qcom, q6asm: Split to separate schema
Date: Fri, 11 Nov 2022 12:35:43 +0100
Message-Id: <20221111113547.100442-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111113547.100442-1-krzysztof.kozlowski@linaro.org>
References: <20221111113547.100442-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Patrick Lai <plai@qti.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Srinivasa Rao Mandadapu <srivasam@qti.qualcomm.com>
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

The APR/GPR bindings with services got complicated so move out the Q6ASM
service to its own binding.  Previously the compatible was documented in
qcom,apr.yaml.  Move most of the examples from its children to this new
file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/qcom,q6asm-dais.yaml       | 48 +++++--------
 .../devicetree/bindings/sound/qcom,q6asm.yaml | 68 +++++++++++++++++++
 2 files changed, 84 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6asm.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6asm-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6asm-dais.yaml
index 8deb8ffb143b..0110b38f6de9 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6asm-dais.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6asm-dais.yaml
@@ -73,40 +73,24 @@ additionalProperties: false
 
 examples:
   - |
-    #include <dt-bindings/soc/qcom,apr.h>
-    #include <dt-bindings/sound/qcom,q6asm.h>
-
-    apr {
-        compatible = "qcom,apr-v2";
-        qcom,domain = <APR_DOMAIN_ADSP>;
+    dais {
+        compatible = "qcom,q6asm-dais";
+        iommus = <&apps_smmu 0x1821 0x0>;
         #address-cells = <1>;
         #size-cells = <0>;
+        #sound-dai-cells = <1>;
+
+        dai@0 {
+            reg = <0>;
+        };
+
+        dai@1 {
+            reg = <1>;
+        };
 
-        service@7 {
-            compatible = "qcom,q6asm";
-            reg = <APR_SVC_ASM>;
-            qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-
-            dais {
-                compatible = "qcom,q6asm-dais";
-                iommus = <&apps_smmu 0x1821 0x0>;
-                #address-cells = <1>;
-                #size-cells = <0>;
-                #sound-dai-cells = <1>;
-
-                dai@0 {
-                    reg = <0>;
-                };
-
-                dai@1 {
-                    reg = <1>;
-                };
-
-                dai@2 {
-                    reg = <2>;
-                    is-compress-dai;
-                    direction = <1>;
-                };
-            };
+        dai@2 {
+            reg = <2>;
+            is-compress-dai;
+            direction = <1>;
         };
     };
diff --git a/Documentation/devicetree/bindings/sound/qcom,q6asm.yaml b/Documentation/devicetree/bindings/sound/qcom,q6asm.yaml
new file mode 100644
index 000000000000..cb49f9667cca
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,q6asm.yaml
@@ -0,0 +1,68 @@
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
+allOf:
+  - $ref: /schemas/soc/qcom/qcom,apr-services.yaml#
+
+properties:
+  compatible:
+    enum:
+      - qcom,q6asm
+
+  dais:
+    type: object
+    $ref: /schemas/sound/qcom,q6asm-dais.yaml#
+    unevaluatedProperties: false
+    description: Qualcomm DSP audio ports
+
+required:
+  - compatible
+  - dais
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/qcom,apr.h>
+
+    apr {
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

