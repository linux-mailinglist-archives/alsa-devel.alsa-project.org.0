Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 593CF62598E
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 12:38:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F4188165E;
	Fri, 11 Nov 2022 12:37:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F4188165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668166688;
	bh=goX/mDOnYFB1SbtztB32FIWESKbUl5UGVWUVVanHiXY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S3OC8Yks8w/GsF9PduNlFL2JmvJQSLsjEKZ22toZOABfQ4o4ldFmRkQmfEJsj8rB9
	 IAB4eYTbcybqtEvTq5ZiXv3ViEySe/GvmaqRfhwcZYKkBhKPci4Mbi6iBrJAq8l5CU
	 pOovdisXLbNDgBSdhmnjfpKQD8NMF15I/lOUOgSw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E3ECF80536;
	Fri, 11 Nov 2022 12:36:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51DD3F8055A; Fri, 11 Nov 2022 12:36:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4443BF800CC
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 12:36:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4443BF800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="LXbPVuet"
Received: by mail-lj1-x22f.google.com with SMTP id b9so4223274ljr.5
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 03:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iso5JkYpW6A/jFTmsvAqcjCGN6f9RRbfN9V5NFqceLU=;
 b=LXbPVuetFmLz/utAf11ouZCa4kV24qXPKUpeSNelWVl0B6ejXUZpjeKWSlEwluruEV
 BmZk9vtldLG4J9gWoE2FfuptSUoE0Yd0pjmUlU+d/DYju9SbH+tpUXp+nVWOZ3hvOox5
 5kPGHAhHd5Vm6Rnl9eBkGSmnHDA2Z6OUge+sqngmG8beRQBPSdO/RtfiabGBRgS/TP20
 XXdF6oSI2nI336sGhLmvjTD43e4Y/mh6M9CqS9P5CV1xtu92Fql7EsRlfEen+R9yvtVP
 5mIM4LuKFazVAmQWay6FprRf3g2LJpDAmWlAic48BFqBoyNI4x0FrdhdfSvwzNJn9cP1
 ahAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iso5JkYpW6A/jFTmsvAqcjCGN6f9RRbfN9V5NFqceLU=;
 b=ShRvbHz4ixdJnKgJ/T++7Uue846Hy+U9rSHrrQtz7yt9Id1aUGtJNH4ER+uHGjXXBt
 o2udkCj8ox7P198TCfMgFpYhLXICT8QniZvh7x1LgR0VqxtNjQ+QG0jh8vPv3f0QwwKr
 MCb27hlOrlux/ZqlwIzyprdIBzxuepy50RvRTqtrykriDcgispnegQrgID55H1l3tc2m
 fp4GQn2bMoik2Bklu3wCxkjDVLGCNtlPDRmd+rgwI8KuN7jEXjWopzTElGLy1rMVAYZS
 g94a7n/TQ135eGzxiyGGv9eeMiQV/2WTRlLksVnsuBs9PbDoTiHg0fVx+rvCGLmTALoz
 IOnQ==
X-Gm-Message-State: ANoB5pnTkMN8WzA6rPK+JpauU3QZX7UgUTQGL+BC0GHLOgn7AA1h58EL
 V6F7c6KD97l4SB9jWTDRgpUZNA==
X-Google-Smtp-Source: AA0mqf7GKT3b2MaA1VA0vBY4OKP49a33B0Dv599vH91Aps2pvQn2vG05P5Ni1PhiEmUzPc0ZWj9yGA==
X-Received: by 2002:a2e:b711:0:b0:278:a461:cb7d with SMTP id
 j17-20020a2eb711000000b00278a461cb7dmr507235ljo.246.1668166573304; 
 Fri, 11 Nov 2022 03:36:13 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 bi30-20020a0565120e9e00b004acb2adfa1fsm274970lfb.307.2022.11.11.03.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 03:36:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 04/10] ASoC: dt-bindings: qcom, q6apm: Split to separate schema
Date: Fri, 11 Nov 2022 12:35:41 +0100
Message-Id: <20221111113547.100442-5-krzysztof.kozlowski@linaro.org>
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

The APR/GPR bindings with services got complicated so move out the Q6APM
service to its own binding.  Previously the compatible was documented in
qcom,apr.yaml.  Move most of the examples from its children to this new
file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

