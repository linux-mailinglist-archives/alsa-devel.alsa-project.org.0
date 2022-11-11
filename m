Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0828C625997
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 12:39:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98A211695;
	Fri, 11 Nov 2022 12:38:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98A211695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668166767;
	bh=8v9ZEfOyQop3ypJbEKofBZbtpW3Ep3nafBzQGP2E5R8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N6UAwXw5buLBx1Fpu30CC0ZpQ8OYhA1+KV8+2e318MwM5u2MQQkBDAndkyu4mrZg/
	 KtOAFxXrJdiDwAnUiMuWmo+JBD3IN8R36Fjf5zgJi7YaTeFP3pXiT7ur2EtQKFmP4U
	 zpAQkylvcmOcWmbIJ8FJ7RUNhCsoZTpAqrygUnrg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B116DF80580;
	Fri, 11 Nov 2022 12:36:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17E06F804AB; Fri, 11 Nov 2022 12:36:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A2C4F80548
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 12:36:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A2C4F80548
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Zen78NeH"
Received: by mail-lf1-x136.google.com with SMTP id c1so7920987lfi.7
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 03:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JR2tPQi4lIHKX8Jfaq8dJOpmO3FJy3VHaO4/AEfLyyE=;
 b=Zen78NeH4QaZ4C37xoIvhQ+rkugOPSj2xLWQO0jMtAR10MTBxdUPddsYgqGd5Je4Oy
 q+dpZwHQLC+bS0QHZzF4ae0SNoC1tF+8A1ypy5On+qA53Z8VGhMdgjoAEkCocn7zUQT5
 SG8rNiFwsv4cl5klZG6N4IN0xWiZO2T/E1eZm9n2v4kVTAxFJJ4vfAfNndqCCF5tLzdc
 MYCMX9NmUbxx3aVqY8JIHqhK9N/h24J7D0Yg8dRJPHZ536hgiiffs7Vz9XMfRa/ITYBy
 vb9xR1vqNVK/L0WsrgkciYhjwbAYxtFqcolcpsyYBMjC5qadFTxlhRFx1p5A8QuSpYyE
 dWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JR2tPQi4lIHKX8Jfaq8dJOpmO3FJy3VHaO4/AEfLyyE=;
 b=DDYI2+a01DiW1itnoLrXXD4C0kvD3kn/n2/OSrtAbQu2n6sd++sFDJsP4lQuow/x0s
 G/Jdbspk1t2G2xXenu/azHVLBAk0oZtQBtg9MOlrieLtphBq88gjr8XUmQC5D9TXZRvT
 zzTJDa2yitE/sSld99Mi7dnDKcSlnHIRdzvZj0D+OxwUhwPubAtSN5eyYMTfJWlUEZYo
 xyRa6caojrSYGbnZKQcQkLQlSDFlVEA2JRzBtcb8ZWcO1rDeZQFI76lgbeOnKZ/CDtsZ
 7Pqn4MB8rffUA1OuKZpJiG0l0HZJpSxuipyeKfTlBfj/d1nKCP3so/medvDXuVo9ItSt
 cplA==
X-Gm-Message-State: ANoB5pnTd9R92wsDMwd/3cwXirrRmek33RYAokkU2yHfLnHNUtYgt4n6
 jW89DbLHW5VK6jFOjV66U7LdLg==
X-Google-Smtp-Source: AA0mqf4QA2XX4+OsUF0J/6zszV+xaUirjx/TwI/UH/2+JFmqNiYLrNcrgCMLZKVvAV+DqdiDmATXwg==
X-Received: by 2002:ac2:5ccb:0:b0:4a2:4f74:f47c with SMTP id
 f11-20020ac25ccb000000b004a24f74f47cmr556364lfq.367.1668166574452; 
 Fri, 11 Nov 2022 03:36:14 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 bi30-20020a0565120e9e00b004acb2adfa1fsm274970lfb.307.2022.11.11.03.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 03:36:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 05/10] ASoC: dt-bindings: qcom, q6adm: Split to separate schema
Date: Fri, 11 Nov 2022 12:35:42 +0100
Message-Id: <20221111113547.100442-6-krzysztof.kozlowski@linaro.org>
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

The APR/GPR bindings with services got complicated so move out the Q6ADM
service to its own binding.  Previously the compatible was documented in
qcom,apr.yaml.  Move most of the examples from its children to this new
file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/qcom,q6adm-routing.yaml    | 22 ++------
 .../devicetree/bindings/sound/qcom,q6adm.yaml | 51 +++++++++++++++++++
 2 files changed, 54 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6adm.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6adm-routing.yaml b/Documentation/devicetree/bindings/sound/qcom,q6adm-routing.yaml
index d0f7a79e240a..b7ed2d3f21f9 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6adm-routing.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6adm-routing.yaml
@@ -30,23 +30,7 @@ additionalProperties: false
 
 examples:
   - |
-    #include <dt-bindings/soc/qcom,apr.h>
-    #include <dt-bindings/sound/qcom,q6asm.h>
-
-    apr {
-        compatible = "qcom,apr-v2";
-        qcom,domain = <APR_DOMAIN_ADSP>;
-        #address-cells = <1>;
-        #size-cells = <0>;
-
-        service@8 {
-            compatible = "qcom,q6adm";
-            reg = <APR_SVC_ADM>;
-            qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-
-            routing {
-                compatible = "qcom,q6adm-routing";
-                #sound-dai-cells = <0>;
-            };
-        };
+    routing {
+        compatible = "qcom,q6adm-routing";
+        #sound-dai-cells = <0>;
     };
diff --git a/Documentation/devicetree/bindings/sound/qcom,q6adm.yaml b/Documentation/devicetree/bindings/sound/qcom,q6adm.yaml
new file mode 100644
index 000000000000..fe14a97ea616
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,q6adm.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,q6adm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Audio Device Manager (Q6ADM)
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
+      - qcom,q6adm
+
+  routing:
+    type: object
+    $ref: /schemas/sound/qcom,q6adm-routing.yaml#
+    unevaluatedProperties: false
+    description: Qualcomm DSP LPASS audio routing
+
+required:
+  - compatible
+  - routing
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
+        service@8 {
+            compatible = "qcom,q6adm";
+            reg = <APR_SVC_ADM>;
+            qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+
+            routing {
+                compatible = "qcom,q6adm-routing";
+                #sound-dai-cells = <0>;
+            };
+        };
+    };
-- 
2.34.1

