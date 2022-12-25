Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AED1655D0E
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Dec 2022 13:00:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24C9ED679;
	Sun, 25 Dec 2022 12:59:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24C9ED679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671969615;
	bh=nve2n99rgQE4HxjFqmgEz0nR/PhpWm9Vx1TTxlZVv6M=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=OhdOkfPnoXAvhTMhaY7LAMKlj4msoVWS1HAz118HJBprrH6oDCGCilcoK44BAGNaE
	 mIKqy5ZgjFwbP249BOnU0lsd/rUEKbz6YAZNHrl60hZZ7prRySoe/y4mWjYuAbB7gH
	 4LZS8WFeerltnxJEWdo+hUYFr4HJd8jwAdr8tfYs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFC04F8027B;
	Sun, 25 Dec 2022 12:59:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18068F8027B; Sun, 25 Dec 2022 12:59:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08AC3F8027B
 for <alsa-devel@alsa-project.org>; Sun, 25 Dec 2022 12:59:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08AC3F8027B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gsRhIZfJ
Received: by mail-lf1-x130.google.com with SMTP id m6so2483438lfj.11
 for <alsa-devel@alsa-project.org>; Sun, 25 Dec 2022 03:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dA76ZhQFpBF+Sh976k45P5Ks3Bs+iIujWGcFzhlrvu0=;
 b=gsRhIZfJOZ1yhDCZokfMQ5KC6x5w1k39WElrELyw1+agocW5EW1BxZEF6Rp8Lb38lI
 IKqxzq6WUUG1ayCdNNC9JHTvwrRfgz4ILtQUz0c6VmERYHhl1t8zvryK+CS2eW9rLbAA
 W9FQNOk7kgJMYC5WgzR1VpKX2bUC9MESY9NyBiRwdPGVst93WFFefCbxFqlOt5/u8Crh
 Yti+8HF9Vlow1PXqj577bcap3gnfIiQtJvAlz+7VGGBg3nibmsJrxN0YyNPvHKXLkIUI
 o6lrScgcgGIpH5r97CUTSROabxG1lED+ypvaJbioTKmcg5Rmvvbw6YEDsdZzsAaKzae/
 bt/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dA76ZhQFpBF+Sh976k45P5Ks3Bs+iIujWGcFzhlrvu0=;
 b=Bk87Q/OhrlqeQgPXSJEw9ujgdOOF+eNy6/YINK1trMidPSMHomXsAqoWtQih3U7Xbd
 tEJ2CkIiLTh/BMqZrsz8qtxiL1b7L5dYEDdlAj5+3iEYH0l+Gic8JkDI/Zb6ocNKXxfJ
 58we3hQaQuzV15yWrD7Ijdpb39X6n39zmLtUVrG/SPwqxur2i32MwDcVGik9974nbVrp
 5WT84OaA0rnpXuHUDiFlXKsgUugVlmvoMqMsAIG1/c4FfIx+/XgM7lev7w9OCbw0JdqZ
 ja20aoDjKtGH2B0QYivY3RV3Bl63f4vTg9YVV9wmdyDpveskPJuL5vGo1OyFZ0zmCyFh
 utPQ==
X-Gm-Message-State: AFqh2kq+gWt9isjCfAc4YeO39gDzqYm69gcDINuriCfZRfF4t+KrN3eF
 lI5b+KIcGO/SfiQx5g5ryM8LVg==
X-Google-Smtp-Source: AMrXdXuiBQzgqQ1zG6X05ZOOEuFLwoNx5rZ6wkvIVz3966G9hSgfRUI203N49qnVvfSiCEvRn9sxsw==
X-Received: by 2002:ac2:43da:0:b0:4b6:ee14:3e98 with SMTP id
 u26-20020ac243da000000b004b6ee143e98mr4920842lfl.23.1671969550875; 
 Sun, 25 Dec 2022 03:59:10 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 b17-20020ac25e91000000b004cb061887b5sm128819lfq.126.2022.12.25.03.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Dec 2022 03:59:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: dt-bindings: qcom,
 lpass-wsa-macro: correct clocks on SM8250
Date: Sun, 25 Dec 2022 12:59:06 +0100
Message-Id: <20221225115907.55250-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

SM8250 DTS uses additional "va" clock in WSA macro device node:

  sm8250-sony-xperia-edo-pdx203.dtb: codec@3240000: clock-names: ['mclk', 'npl', 'macro', 'dcodec', 'va', 'fsgen'] is too long

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/qcom,lpass-wsa-macro.yaml  | 58 +++++++++++++++----
 1 file changed, 47 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
index 2bf8d082f8f1..66cbb1f5e31a 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -9,9 +9,6 @@ title: LPASS(Low Power Audio Subsystem) VA Macro audio codec
 maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
-allOf:
-  - $ref: dai-common.yaml#
-
 properties:
   compatible:
     enum:
@@ -30,15 +27,12 @@ properties:
     const: 0
 
   clocks:
-    maxItems: 5
+    minItems: 5
+    maxItems: 6
 
   clock-names:
-    items:
-      - const: mclk
-      - const: npl
-      - const: macro
-      - const: dcodec
-      - const: fsgen
+    minItems: 5
+    maxItems: 6
 
   clock-output-names:
     maxItems: 1
@@ -55,10 +49,51 @@ required:
   - reg
   - "#sound-dai-cells"
 
+allOf:
+  - $ref: dai-common.yaml#
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sc7280-lpass-wsa-macro
+            - qcom,sm8450-lpass-wsa-macro
+            - qcom,sc8280xp-lpass-wsa-macro
+    then:
+      properties:
+        clocks:
+          maxItems: 5
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+            - const: macro
+            - const: dcodec
+            - const: fsgen
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm8250-lpass-wsa-macro
+    then:
+      properties:
+        clocks:
+          minItems: 6
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+            - const: macro
+            - const: dcodec
+            - const: va
+            - const: fsgen
+
 unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/qcom,sm8250-lpass-aoncc.h>
     #include <dt-bindings/sound/qcom,q6afe.h>
     codec@3240000 {
       compatible = "qcom,sm8250-lpass-wsa-macro";
@@ -69,7 +104,8 @@ examples:
                <&audiocc 0>,
                <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
                <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+               <&aoncc LPASS_CDC_VA_MCLK>,
                <&vamacro>;
-      clock-names = "mclk", "npl", "macro", "dcodec", "fsgen";
+      clock-names = "mclk", "npl", "macro", "dcodec", "va", "fsgen";
       clock-output-names = "mclk";
     };
-- 
2.34.1

