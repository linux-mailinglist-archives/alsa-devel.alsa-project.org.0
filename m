Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D73115B1891
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 11:24:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C98116C2;
	Thu,  8 Sep 2022 11:23:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C98116C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662629083;
	bh=ogObb53p2UXdqmUyclBUM6WC/yDQhVd2/5YqWLvkD0c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dZdj6Qh/5wp/Ox6OA3JOiMykmnP82Hx17Wd/k+qruQX4AE/RrYs3gQuYYEdI6/yKa
	 Mww42KNgZfn5I8E7JJX0+m6w2hX9xXfSqu8HJ3zZNmrtkn5lfrVpHYKTLy/3M0//sU
	 3ns/1O9XUjrAp+SJw+Ye2oh9L4beV46n9keJ+aTw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11D35F805B5;
	Thu,  8 Sep 2022 11:20:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DBB6F805B1; Thu,  8 Sep 2022 11:20:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 515BBF80571
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 11:20:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 515BBF80571
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="IpKv+R3Q"
Received: by mail-lf1-x12e.google.com with SMTP id z25so26729615lfr.2
 for <alsa-devel@alsa-project.org>; Thu, 08 Sep 2022 02:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=9MbuWpDTtjtmqpKe+N4No2bThn68b0sGoqMDMfgx8e8=;
 b=IpKv+R3QjzYhZA5hEPJlwuy9uLr7N/B/3RQ85hWss0Rgo7r0KZ+uzJg7r3UhgeUaWg
 EGQVDJTXejEpXDQUzXUVWt/r+pWIlKEWQkjbpTcabo+HTTPfo0DSjtmx+ZxW6m7wrhij
 EIF1VMgzQhhD5XKWIrLgR98uo9nooStafZ8+wrTnbj6dYBxO8W4Pab/WTe34RXsgX1F3
 Gu6bVBaUFJJnHM8tQvyiJRbiFrqFGiY+mOFU0QqK05+t+kygUBES3FAur61su0jwjvCv
 We6oi+hZLBxrjEFQRfkCLnqJQoQX6kZOxThidYnSr7crF69bzc+CWsfkggwFjKqToXke
 kU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9MbuWpDTtjtmqpKe+N4No2bThn68b0sGoqMDMfgx8e8=;
 b=nOdhqjmU62j+diLuTwgULawfyeCp02XhhDFOnLDes5ILaPJKztIe+xjnrLOG0aiMiy
 55C66CD8naZKS7YHONOSzjPEPWz1mJ3SMkloeyoRpCoTJKX1CBkXI5rQyZ/vukcuGOrY
 hcEks4SxMUOmV34B1PRoEyy4jZGTQRGgZWlCHJjlOFz8E2K1XmiUSQw5F4YGGrg+kaZz
 QSkPqm7jK856WKXJwJo5T/p0mCHW+Xi3vWYovYf6aSxavh8xhqaKWvMPnBqaMp65qrqO
 7ktC5pvRD6QMH5X+yImibSAb8B0fqEbV1TrUNc67sP62liNf3lEofkjQ/6edlSrt50df
 Tk6A==
X-Gm-Message-State: ACgBeo1mKLMip8gDFshdoIvIgT/boY3qIg+LltA2oQik7h+xRb2fxQ2J
 iQ14I/B0dfCcDMO4qY7zFQpMhA==
X-Google-Smtp-Source: AA6agR57ovQ13xcCgZ0z4KLd5DfxP02p0NN2Ssl88ii+QEtaedptBuwyY9L4AjvfyDWBiqtXnCME6w==
X-Received: by 2002:ac2:4f02:0:b0:496:d15:ea89 with SMTP id
 k2-20020ac24f02000000b004960d15ea89mr2263259lfr.69.1662628803098; 
 Thu, 08 Sep 2022 02:20:03 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a056512211100b004946a758d21sm218219lfr.161.2022.09.08.02.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 02:20:02 -0700 (PDT)
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
Subject: [PATCH v3 10/14] dt-bindings: soc: qcom: apr: correct service children
Date: Thu,  8 Sep 2022 11:19:42 +0200
Message-Id: <20220908091946.44800-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220908091946.44800-1-krzysztof.kozlowski@linaro.org>
References: <20220908091946.44800-1-krzysztof.kozlowski@linaro.org>
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

The APR bindings were not describing properly children nodes for DAIs.
None of the DTSes use unit addresses for the children, so correct the
nodes and reference their schema: clock-controller, dais and routing.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>

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
index 028c5d105adb..a1a8f77beef7 100644
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
+          - $ref: /schemas/sound/qcom,q6asm-dais.yaml#
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

