Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 860AB62981A
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 13:05:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 234051694;
	Tue, 15 Nov 2022 13:04:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 234051694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668513925;
	bh=v0gjD8Y6nIa5Um3c/jihGjxv4ojs5ijYWFB+yXnaYII=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DTB9zb0yr09ICrAjYpF/MybQV/tP7Li2xOS2e5UDfXaYSPlGymHgJ3m2O/F+eNoSq
	 oBihfwgeQFoM63FaB1HGyYs5+2IvCzvmY2mcZ16xv2W7wlobhvtGcXSWji3zept27E
	 cf+l2cuMaw1vDa6KyblYmA25XpLJr8Cfdx4RxM80=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0DA1F8057E;
	Tue, 15 Nov 2022 13:03:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEC76F8056F; Tue, 15 Nov 2022 13:02:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A346F8016D
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 13:02:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A346F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="EvegI737"
Received: by mail-lf1-x133.google.com with SMTP id j16so24022880lfe.12
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 04:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mhFQwDZN5tKwjWiBCGVlIG1S7K2/rpG/m674X3+lJKs=;
 b=EvegI737vrbQhgSyJLIHL1krdI+z+24UywT80kcn6a1GsEnibbvC/pwMF24JxHW85G
 85/86KRy9xZZ5WsSDGgpIuIf91KGNFgQEo1jU1URVPbP8QvLwMYJW23mqc/KoJJMCV42
 QuSww7Hl647mCYMV6/1RZX6Jx2KwwiqcQnb0B7ueXyUiKJPW5enLxzf2jLdN9hFzZp55
 ecdqNG5W25vMc0a+c1DRx3zUY1CnLyxVS25/TfXw4cdr4XJJVSFehFWh15ReKG8dpyvd
 yQLFvt6KQcsehry2ZiVGUSGc1tzvusm/hTloql/zNAmniN8Mca4OYu6fqt/gJ7YptUMD
 1Pmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mhFQwDZN5tKwjWiBCGVlIG1S7K2/rpG/m674X3+lJKs=;
 b=F4ShTxcVADUSzkv7/HSjFDVBySLM/F9pRRd8JYfpKQRMl45PLG05z8kMWBHp9XmVQU
 73hOBVXEYQvXSpYsv34uxrO7NTKuHp4ZZJyuX1XMv2j3AmMsPfCRczsnIju/662n9UBA
 bGVCvf4PW3hOSzWuHT4QgCTli34EmGxIZ2K2GXw3MEaPoCkbxqd3lrbzh0r5GrojQuud
 XJTjwVV148WEeD/bwbpvgAWn6MGg6xn0+0woM0PDs0q8i/mmlWgy+Vx31DD0t1bvI+E3
 Ik1mAtIiSknFa5Ct0ZoNl502Gpj5D8PaE9yMuj6jh7m9HLDK86d2MuACDU6VkNLbaMCt
 Z3uQ==
X-Gm-Message-State: ANoB5plxrnGzUauz11YAoc6yUN8JrSswmNS5VYJzQE/Y0ucKRiA+3uvl
 DvLj4WV74hiRdRqhHY0hK2T5aw==
X-Google-Smtp-Source: AA0mqf5Avjze8mJqpmB/otxRNftLEtkt0pNU9EgD3UC/DTHK4bAdhHeRlo0WGXs0v9Syhhvw9l9iyw==
X-Received: by 2002:ac2:5487:0:b0:4a2:4b1b:6ad9 with SMTP id
 t7-20020ac25487000000b004a24b1b6ad9mr6206908lfk.296.1668513771211; 
 Tue, 15 Nov 2022 04:02:51 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 i13-20020ac25d2d000000b004b0b2212315sm2176233lfb.121.2022.11.15.04.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 04:02:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/11] ASoC: dt-bindings: qcom,
 q6apm: Split to separate schema
Date: Tue, 15 Nov 2022 13:02:29 +0100
Message-Id: <20221115120235.167812-6-krzysztof.kozlowski@linaro.org>
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

The APR/GPR bindings with services got complicated so move out the Q6APM
service to its own binding.  Previously the compatible was documented in
qcom,apr.yaml.  Move most of the examples from its children to this new
file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: quic_srivasam@quicinc.com
Cc: quic_plai@quicinc.com
---
 .../bindings/sound/qcom,q6apm-dai.yaml        | 19 ++-----
 .../devicetree/bindings/sound/qcom,q6apm.yaml | 51 +++++++++++++++++++
 2 files changed, 54 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6apm.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
index 24f7bf2bfd95..73a4afad5a74 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
@@ -27,20 +27,7 @@ additionalProperties: false
 
 examples:
   - |
-    #include <dt-bindings/soc/qcom,gpr.h>
-    gpr {
-        compatible = "qcom,gpr";
-        #address-cells = <1>;
-        #size-cells = <0>;
-        qcom,domain = <GPR_DOMAIN_ID_ADSP>;
-
-        service@1 {
-            compatible = "qcom,q6apm";
-            reg = <1>;
-
-            dais {
-                compatible = "qcom,q6apm-dais";
-                iommus = <&apps_smmu 0x1801 0x0>;
-            };
-        };
+    dais {
+        compatible = "qcom,q6apm-dais";
+        iommus = <&apps_smmu 0x1801 0x0>;
     };
diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
new file mode 100644
index 000000000000..7acb832aa557
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Audio Process Manager (Q6APM)
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
+      - qcom,q6apm
+
+  dais:
+    type: object
+    $ref: /schemas/sound/qcom,q6apm-dai.yaml#
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
+    #include <dt-bindings/soc/qcom,gpr.h>
+
+    gpr {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        service@1 {
+            reg = <GPR_APM_MODULE_IID>;
+            compatible = "qcom,q6apm";
+            qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+
+            dais {
+                compatible = "qcom,q6apm-dais";
+                iommus = <&apps_smmu 0x1801 0x0>;
+            };
+        };
+    };
-- 
2.34.1

