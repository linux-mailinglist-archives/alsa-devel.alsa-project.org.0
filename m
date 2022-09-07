Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B39BD5B01C0
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 12:20:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 691BB168F;
	Wed,  7 Sep 2022 12:19:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 691BB168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662546022;
	bh=HtihehoEYa0ZSU66O6ub8mwwKrXFm59xmFMZR4nPoFg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uJkIKljixi4HgmBnP+SqrcfVi61oTCnh0U8bX8MhZno+Y0zakATjnMZ/F5pIdROem
	 tDFWeDRzpx6BKL7s5IeRKNatLqNnnJpjMOdveHNyt1k0qTZMTZ0mjIc5nlF1A4vcO0
	 smiN8IdnIre+36maIyeF1zrCe+xj4uP7nkJSaTnM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A2E1F805BE;
	Wed,  7 Sep 2022 12:16:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36E18F8057D; Wed,  7 Sep 2022 12:16:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BE8AF80557
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 12:16:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BE8AF80557
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="n0Z9eIrN"
Received: by mail-lf1-x12d.google.com with SMTP id m15so2003455lfl.9
 for <alsa-devel@alsa-project.org>; Wed, 07 Sep 2022 03:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=baXMfYCB7PE60Npfbg3h15u6sSL53emte/DC7KwMEHU=;
 b=n0Z9eIrNYaQUl1F2pQluleBXgOygvZm9/qzU9Y17MRfzuta7/5Lz148J8JmrZdakzd
 nwind7DypVs18RYofRdwdp8SRm1D4MgJS7r4tLJGuoCZX1WprJDi8dD1r49Kd1wJPa/4
 qMQRrF0MzRktBLVlxK0y0VO0UqaWqt1oxd+Bzc18ES1hiLdD/T/WnfnYBjdCXmIgKZKl
 ymx9k3ZyUlekMR/hycoJVec1O/BVsbCCfiK4Og41c3CKnUUfnmslEHkzoYUcb8KY8545
 Q+62hN0hcOkUubKECvfjDC2+/hUYdHRHVVqgf3UT0c3ivAQxCP98LkADDxJh0ZBh3pfd
 VajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=baXMfYCB7PE60Npfbg3h15u6sSL53emte/DC7KwMEHU=;
 b=bg+K9g5SHB9YvD8A16BrtN3YPfTDsLjYR/hGFJa3aLqb142eIi9HCUHBraqQEPOIF7
 Nb8eucdbApoX3OCaWCtdAAi1c+6lN2FgASHqnC1iPXcrKBKpZTOKfHZ1VaC1u4yr6iTV
 u3OhySf5lyS0IE/7n6vc1f/dUYYH4pjw2ed6ac48DJvsgiPk9M3E+AeR3AX68uhOQ/Dp
 GqTI68vykf1vHHQ7lnXsGzrcjHOixws+2SeJkGX5PFVI4yzmAsJ588EtL6l14oB5rUrX
 qG5XRBtMlqqiYhEB6n530qyJJLwLVJy2hSX9wQPe6HyG0C48j+X9N72CxYNlQhMq5NVz
 kEMg==
X-Gm-Message-State: ACgBeo3w+kxp8pisejjw1/gmDuBphA4w6GHhoB/IoJMhs3l6fIZ1S/RY
 iT8MQQKQ34dDSja/V58PoCS16A==
X-Google-Smtp-Source: AA6agR5j0drCb5MJhH6/d7ItohGvjahLjxofqXFGdrA7NzK26DZdB7fIlJ5H0vrREookezeAJ+n7EA==
X-Received: by 2002:a05:6512:3d1a:b0:494:7983:8a04 with SMTP id
 d26-20020a0565123d1a00b0049479838a04mr921425lfv.164.1662545778494; 
 Wed, 07 Sep 2022 03:16:18 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a2ea169000000b0026ab0e480bcsm960734ljl.39.2022.09.07.03.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 03:16:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH v2 10/14] dt-bindings: soc: qcom: apr: correct service children
Date: Wed,  7 Sep 2022 12:15:52 +0200
Message-Id: <20220907101556.37394-11-krzysztof.kozlowski@linaro.org>
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

The APR bindings were not describing properly children nodes for DAIs.
None of the DTSes use unit addresses for the children, so correct the
nodes and reference their schema: clock-controller, dais and routing.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

---

Changes since v1:
1. Correct also sound/qcom,q6apm-dai.yaml (Rob)
---
 .../bindings/soc/qcom/qcom,apr.yaml           | 68 ++++++++++++++++---
 .../bindings/sound/qcom,q6apm-dai.yaml        | 10 +--
 .../sound/qcom,q6dsp-lpass-clocks.yaml        | 16 ++---
 .../sound/qcom,q6dsp-lpass-ports.yaml         | 16 ++---
 4 files changed, 66 insertions(+), 44 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
index 028c5d105adb..5b9b9c86e61f 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
@@ -97,6 +97,25 @@ patternProperties:
             3 = AMDB Service.
             4 = Voice processing manager.
 
+      clock-controller:
+        $ref: /schemas/sound/qcom,q6dsp-lpass-clocks.yaml#
+        description: Qualcomm DSP LPASS clock controller
+        unevaluatedProperties: false
+
+      dais:
+        type: object
+        oneOf:
+          - $ref: /schemas/sound/qcom,q6apm-dai.yaml#
+          - $ref: /schemas/sound/qcom,q6dsp-lpass-ports.yaml#
+          - $ref: /schemas/sound/qcom,q6asm.yaml#
+        unevaluatedProperties: false
+        description: Qualcomm DSP audio ports
+
+      routing:
+        # TODO: Waiting for Documentation/devicetree/bindings/sound/qcom,q6adm.txt
+        type: object
+        description: Qualcomm DSP LPASS audio routing
+
       qcom,protection-domain:
         $ref: /schemas/types.yaml#/definitions/string-array
         description: protection domain service name and path for apr service
@@ -107,17 +126,44 @@ patternProperties:
           "tms/servreg", "msm/modem/wlan_pd".
           "tms/servreg", "msm/slpi/sensor_pd".
 
-      '#address-cells':
-        const: 1
-
-      '#size-cells':
-        const: 0
-
-    patternProperties:
-      "^.*@[0-9a-f]+$":
-        type: object
-        description:
-          Service based devices like clock controllers or digital audio interfaces.
+    allOf:
+      - if:
+          properties:
+            compatible:
+              enum:
+                - qcom,q6afe
+        then:
+          properties:
+            dais:
+              properties:
+                compatible:
+                  const: qcom,q6afe-dais
+
+      - if:
+          properties:
+            compatible:
+              enum:
+                - qcom,q6apm
+        then:
+          properties:
+            dais:
+              properties:
+                compatible:
+                  enum:
+                    - qcom,q6apm-dais
+                    - qcom,q6apm-lpass-dais
+
+      - if:
+          properties:
+            compatible:
+              enum:
+                - qcom,q6asm
+        then:
+          properties:
+            dais:
+              properties:
+                compatible:
+                  const: qcom,q6asm-dais
 
     additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
index 5d972784321d..844d72b30969 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
@@ -16,16 +16,12 @@ properties:
   compatible:
     const: qcom,q6apm-dais
 
-  reg:
-    maxItems: 1
-
   iommus:
     maxItems: 1
 
 required:
   - compatible
   - iommus
-  - reg
 
 additionalProperties: false
 
@@ -41,13 +37,9 @@ examples:
           compatible = "qcom,q6apm";
           reg = <1>;
 
-          #address-cells = <1>;
-          #size-cells = <0>;
-
-          apm-dai@1 {
+          dais {
             compatible = "qcom,q6apm-dais";
             iommus = <&apps_smmu 0x1801 0x0>;
-            reg = <1>;
           };
         };
     };
diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml
index f83f00737a2f..604861d84ffa 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml
@@ -18,9 +18,6 @@ properties:
       - qcom,q6afe-clocks
       - qcom,q6prm-lpass-clocks
 
-  reg:
-    maxItems: 1
-
   '#clock-cells':
     const: 2
     description:
@@ -32,7 +29,6 @@ properties:
 
 required:
   - compatible
-  - reg
   - "#clock-cells"
 
 additionalProperties: false
@@ -46,11 +42,9 @@ examples:
         #size-cells = <0>;
         apr-service@4 {
             reg = <APR_SVC_AFE>;
-            #address-cells = <1>;
-            #size-cells = <0>;
-            clock-controller@2 {
+
+            clock-controller {
               compatible = "qcom,q6afe-clocks";
-              reg = <2>;
               #clock-cells = <2>;
             };
         };
@@ -66,11 +60,9 @@ examples:
         service@2 {
             reg = <GPR_PRM_MODULE_IID>;
             compatible = "qcom,q6prm";
-            #address-cells = <1>;
-            #size-cells = <0>;
-            clock-controller@2 {
+
+            clock-controller {
               compatible = "qcom,q6prm-lpass-clocks";
-              reg = <2>;
               #clock-cells = <2>;
             };
         };
diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
index dc7fba7b92d5..5e666d9fb388 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
@@ -18,9 +18,6 @@ properties:
       - qcom,q6afe-dais
       - qcom,q6apm-lpass-dais
 
-  reg:
-    maxItems: 1
-
   '#sound-dai-cells':
     const: 1
 
@@ -145,7 +142,6 @@ patternProperties:
 
 required:
   - compatible
-  - reg
   - "#sound-dai-cells"
   - "#address-cells"
   - "#size-cells"
@@ -161,11 +157,9 @@ examples:
         #size-cells = <0>;
         apr-service@4 {
             reg = <APR_SVC_AFE>;
-            #address-cells = <1>;
-            #size-cells = <0>;
-            q6afedai@1 {
+
+            dais {
               compatible = "qcom,q6afe-dais";
-              reg = <1>;
               #address-cells = <1>;
               #size-cells = <0>;
               #sound-dai-cells = <1>;
@@ -187,11 +181,9 @@ examples:
         service@1 {
             compatible = "qcom,q6apm";
             reg = <GPR_APM_MODULE_IID>;
-            #address-cells = <1>;
-            #size-cells = <0>;
-            q6apmdai@1 {
+
+            dais {
               compatible = "qcom,q6apm-lpass-dais";
-              reg = <1>;
               #address-cells = <1>;
               #size-cells = <0>;
               #sound-dai-cells = <1>;
-- 
2.34.1

