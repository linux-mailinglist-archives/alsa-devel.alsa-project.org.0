Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA46629822
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 13:06:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 966A116C6;
	Tue, 15 Nov 2022 13:05:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 966A116C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668513984;
	bh=IX9ULaTupGb+iGD48Q2/MjRzTcT+6jzRb7GK5s2HsYc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TLLiS6inyigd4dX8EU3/qyUKoI/WgMQmgp3HMkbMStladah5+72zz720lF5PDi12a
	 VFTTAtLrtmkfTzJNxaK0RMtgdo7ofQHjrjDEwP0v1s1/EBwAWfzzMZPVRj94F15u6n
	 li4LoNV9wGgGCyyB9pP/S9imAl/gwKfISrFJ9V3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AF1FF805B4;
	Tue, 15 Nov 2022 13:03:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8AAAF805B2; Tue, 15 Nov 2022 13:03:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E416BF804DA
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 13:02:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E416BF804DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="g+qfShLU"
Received: by mail-lf1-x135.google.com with SMTP id d6so24041476lfs.10
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 04:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RcmcIw/aoAY1FZoJ9/HC3cRwB98JOHeI75J1MhSGCew=;
 b=g+qfShLUo2LcjPN37+QJFvvM6HOfjcpebHHs3phTNmQ++jagmE2hVKe059ZJ8eIhJo
 uA1SJ9LaL+Ts/TvM8zdLa4hIU4rtoha67wRcaqNCsUPRiySxf8oYdcDYyxJuxn+HdnYM
 WaIR/Shar2GFUkui1AzEJP+eaNZpSN0S3WQ5R6/0nuyMXydR0sINrbs42DuR0n9W7G7j
 WeId26+kF7e9mX7wqAfpyXIaNzW2d3HRowZRm2nFAhg6kM0wF+go8lTXnxi1ZZx9rHsu
 3hiEtpHqW2tFGNu6oruAbQemBXPuINDtuCAPSmcRA5yWBI9vSgoy5y5T4/7+o5R6LvqM
 ishA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RcmcIw/aoAY1FZoJ9/HC3cRwB98JOHeI75J1MhSGCew=;
 b=z8nJ39ud0fbbg9z19ovS9d93bbzzluDiYdkMXzuwobz9jNWw27sPc7/h9FmpphmJLW
 HeAG0PXdwujs/7eYGjrBsL1uE+xHEK1whlnLsBxLu9K1nhZp1c7z5jYYPFWGpCtTKHMt
 sPNu0v/ImI/WNJztskexiXu8XPUQGwSbJhOQdr9aw9JPwhFOTG1md5D7qXRTKtrAXUVh
 jvn5QEqBcjK36YGJmKR9MpURLMwge/IzEYPnKE8kLcu5RGj6KkHvEr+lSjuiBjFlElMd
 baaH5QmRf7Sq2nQcZhjtZQPa7ee1fZJPn06wY+fLTag8c94iFrnKdmERHfiTU4mModUE
 613A==
X-Gm-Message-State: ANoB5pnBqmeWYDoPkXfIxbly88gpYiEc8C3sQBYwNBHyudVDB7xY9ZIS
 MuZQiBIpHYkxjAnQ3afTSRE8WA==
X-Google-Smtp-Source: AA0mqf7xRuGkBbvLbDme2sRQQB7T7oFo2vBw1rzAMcKHBMUvDVvvO3WRtyIkW6ZMG5MN6t8MS2NRwQ==
X-Received: by 2002:a05:6512:313b:b0:4a2:27f0:46a5 with SMTP id
 p27-20020a056512313b00b004a227f046a5mr5943056lfd.611.1668513774167; 
 Tue, 15 Nov 2022 04:02:54 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 i13-20020ac25d2d000000b004b0b2212315sm2176233lfb.121.2022.11.15.04.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 04:02:53 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/11] ASoC: dt-bindings: qcom,
 q6asm: Split to separate schema
Date: Tue, 15 Nov 2022 13:02:31 +0100
Message-Id: <20221115120235.167812-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115120235.167812-1-krzysztof.kozlowski@linaro.org>
References: <20221115120235.167812-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: quic_plai@quicinc.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 quic_srivasam@quicinc.com
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

Cc: quic_srivasam@quicinc.com
Cc: quic_plai@quicinc.com
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

