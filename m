Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CE65AE7CB
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 14:20:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40ADA84C;
	Tue,  6 Sep 2022 14:20:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40ADA84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662466856;
	bh=Rtn8/tyivWYRRmh/8EOOhwmZyPwxlYZYPFYiMy5ws3U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ey1Xol5NgOiB0mKP7f8fc4F7hCnjDd6pdD3gq0Fj2K4/gPGbicyYCo6yicTemTAiR
	 KbH5HMEaRC86ouch8PAjjC79fgQ3gV68BFXPYXUzpp6yGt5g4uslZRO2kxNzZ+cIq5
	 Pyh+9UpVsFTDppR2tE5XSvUtJWuXmtIJJHRU1LI8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD1B4F8058C;
	Tue,  6 Sep 2022 14:17:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C862F80537; Tue,  6 Sep 2022 14:17:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99692F8011C
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 14:17:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99692F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="AKdYf2tD"
Received: by mail-lj1-x22e.google.com with SMTP id s15so12075089ljp.5
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 05:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=4c/EC/fKGrr33lYs8dg9VuKkDELdZWUkP9xmgTJvUBY=;
 b=AKdYf2tDhidX1KT/T+gAUIvcmI5DL9Hdo42r+/QzKvZtDTIWxfg8mx1MB7sUpzA1qv
 WGqiKkvZomaXC2cqMPCuzKzeqdvHVYbdkXHpXOMUiv+WeOHLZoOR52ES9q1EqpYaC3tk
 jODzVpZ85S/wUiME0jHn1SeeWW0r4SXaDP+C0mcijzxqbxTLuCUix+3umAMjp8hEzhzZ
 /K4LKMuex7a43qIDqz2+/C3yJyhaU2ii2gchFFn5Z7dUVCDQA45sE5c3gCxxeqLl5Tp8
 w7RO9+wKtZH0N8oOFsKra1FP1ecGBKW0uEicAUp65Q232rQDkHriHIZISNKNCm2qSOTE
 S1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=4c/EC/fKGrr33lYs8dg9VuKkDELdZWUkP9xmgTJvUBY=;
 b=yLKtz5zo1rttO/XSrDFph36kGhM9g/R8LLlbcb7vmFc63oXA5Wt2Yhb65VUZgxP385
 fvPcRhP3heSbT5kq8bzQbmhk9TEBWZgCAmbMpX8Ngnl+zS4BW37KlN4bnL5HGPP+uaPJ
 N2T3EXok0F8ua+RE+MmievsKUqdb5PgNzFIZqFQ80CGEeZEUKoc9T4EnAR+HyGJ52wra
 dnEtwRpLOyqP9usZH/6EBHKiIVsHJ1C0zPbb/TaZypTTLuCgGq+GdxK2pN/13jPH8/v6
 ZMsFOU+IFtuDWgF3Z7JEdUhrTsGdeorCFTVoUGP8mIocaIsLUYpWKOVyFyfbQxb3KANQ
 yVyg==
X-Gm-Message-State: ACgBeo30OPP0EPpIJra3XNFffVF2CygD1ZMOBoXdUb/gkfwfgabhxbJ3
 JPlwxccz3CkrdvrJTr2kaFBVJQ==
X-Google-Smtp-Source: AA6agR44+E/liePOSIZSTFuXxRzgwxJb+aWcT5stK1SaSKB7IQQo/JOorZ6imcdLruZUNKfzMndreg==
X-Received: by 2002:a2e:a408:0:b0:26a:7a25:bbb6 with SMTP id
 p8-20020a2ea408000000b0026a7a25bbb6mr2031669ljn.221.1662466630141; 
 Tue, 06 Sep 2022 05:17:10 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a05651c131100b0025df5f38da8sm1882802lja.119.2022.09.06.05.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 05:17:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH 09/12] dt-bindings: soc: qcom: apr: correct service children
Date: Tue,  6 Sep 2022 14:16:52 +0200
Message-Id: <20220906121655.303693-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
References: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
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
---
 .../bindings/soc/qcom/qcom,apr.yaml           | 38 +++++++++++++------
 .../sound/qcom,q6dsp-lpass-clocks.yaml        | 16 ++------
 .../sound/qcom,q6dsp-lpass-ports.yaml         | 16 ++------
 3 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
index 028c5d105adb..61b010793fca 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
@@ -97,6 +97,22 @@ patternProperties:
             3 = AMDB Service.
             4 = Voice processing manager.
 
+      clock-controller:
+        $ref: /schemas/sound/qcom,q6dsp-lpass-clocks.yaml#
+        description: Qualcomm DSP LPASS clock controller
+        unevaluatedProperties: false
+
+      dais:
+        # TODO: Waiting for Documentation/devicetree/bindings/sound/qcom,q6asm.txt
+        # Ref defined in allOf below.
+        type: object
+        description: Qualcomm DSP LPASS audio ports
+
+      routing:
+        # TODO: Waiting for Documentation/devicetree/bindings/sound/qcom,q6adm.txt
+        type: object
+        description: Qualcomm DSP LPASS audio ports
+
       qcom,protection-domain:
         $ref: /schemas/types.yaml#/definitions/string-array
         description: protection domain service name and path for apr service
@@ -107,17 +123,17 @@ patternProperties:
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
+              $ref: /schemas/sound/qcom,q6dsp-lpass-ports.yaml#
+              unevaluatedProperties: false
 
     additionalProperties: false
 
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

