Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB30625991
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 12:38:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88592168F;
	Fri, 11 Nov 2022 12:37:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88592168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668166708;
	bh=OCMM8ShykYHembKNmgXtqt+LmZr/KWiT69VlDbarjUM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AXNTyQRhqV4rQXxUfSh/FJT9UhhnLqdVu8WAip5tc1b77HjIx3IBBhNeDU39bzQk8
	 +pbZudK8Y0X7QTf5k+c025oe99BBiaj6PFnGBSyWjqYeNzXKA6N66q9L6nHZOZDa7l
	 MnHsifUtVAdmNuOtdlcdCOoPPxBWHhDeDHHRHS9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B8D0F80567;
	Fri, 11 Nov 2022 12:36:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67CDAF800CC; Fri, 11 Nov 2022 12:36:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3583FF804AB
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 12:36:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3583FF804AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="B1skD0aI"
Received: by mail-lf1-x12b.google.com with SMTP id j4so7995138lfk.0
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 03:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=64ecADi4+z7+ei9RWWqZDpGuTRxb+PiFx0FpSXFDUNU=;
 b=B1skD0aIiEDXoYNTZC4cNo2OPm9uTEXucEVa2PacHy0JHSrn2M+ox5xwMmXIn6nCVo
 TFzi5PBY9stKPEkiwbD9UFiN95jy5vJ+yxkV9TQJmEEwVar1mbjaiWbNtn1HnTjGbIrs
 yxspfvxtp1ppK0LsA2tI7BDu96Vw6CrD34iY705419dVOo4E7stcs2oDz0tIu0vITF7r
 ILpu2KY1Bc1T+hrFkyefa8/USprGzt4seQ19PGf0wtB3BVKiNyoAjBPfXmYeqC9dlQLX
 REKp3Gp8ZHnoVjwuCmoU/0m7FzLleezRxO21QgVofzUFkBFEKtksaSGuyta6iCQnD2PI
 6arA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=64ecADi4+z7+ei9RWWqZDpGuTRxb+PiFx0FpSXFDUNU=;
 b=j8T6IbAKe9SwgtkoFX9W5pA9esjHRqHKb/fySwCrB/ggDQMU/KyeCJi0xiDD/ur/l/
 sD0mdCjY1+PhMzma9q4yrwEgqWybEZGqeH4PLz4khbdlGFrQT/ViJ1bFqBB8DAgK4ZOU
 6qnO2tdkuW41K202TiBws6bH5u5WS5wp1OLiw7UcdgnY9Wny0Fphsh8ZJWKD2QbsS/T1
 Gyon0X7Yv3dIh3KdYHxEt/+inbTLkN/z5wwI3lkHlRFm2oBGikEPcW6MbCV4sifEBZXz
 qbrPXpV0qucpGzBBPieTw8OwOocmeF56gB9TbKPHXRnx22aoq7Q3BJBefzIuDL5G5Cte
 JoRA==
X-Gm-Message-State: ANoB5pmMpGHepNkI8Piwcvd9gHNfdhZ7KUzfB/y9lMwgXd+Pt70OiyXM
 679fQcmTxRBvtY7u8CUBHYoHPQ==
X-Google-Smtp-Source: AA0mqf6nL3sJR7ZROlkLXZr/JaPtxBlekOn176arXd+MeMnB7g1kMnKpchjZqBKlvQWM30pGiB+z9A==
X-Received: by 2002:a05:6512:2a87:b0:4ac:5faa:654d with SMTP id
 dt7-20020a0565122a8700b004ac5faa654dmr525928lfb.684.1668166572207; 
 Fri, 11 Nov 2022 03:36:12 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 bi30-20020a0565120e9e00b004acb2adfa1fsm274970lfb.307.2022.11.11.03.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 03:36:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 03/10] ASoC: dt-bindings: qcom, q6afe: Split to separate schema
Date: Fri, 11 Nov 2022 12:35:40 +0100
Message-Id: <20221111113547.100442-4-krzysztof.kozlowski@linaro.org>
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

The APR/GPR bindings with services got complicated so move out the Q6AFE
service to its own binding.  Previously the compatible was documented in
qcom,apr.yaml.  Move most of the examples from its children to this new
file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/qcom,q6afe.yaml | 69 +++++++++++++++++++
 .../sound/qcom,q6dsp-lpass-clocks.yaml        | 40 +----------
 .../sound/qcom,q6dsp-lpass-ports.yaml         | 56 +++------------
 3 files changed, 81 insertions(+), 84 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6afe.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml b/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml
new file mode 100644
index 000000000000..45ad703d70bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,q6afe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Audio FrontEnd (Q6AFE)
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
+      - qcom,q6afe
+
+  clock-controller:
+    $ref: /schemas/sound/qcom,q6dsp-lpass-clocks.yaml#
+    unevaluatedProperties: false
+    description: Qualcomm DSP LPASS clock controller
+
+  dais:
+    type: object
+    $ref: /schemas/sound/qcom,q6dsp-lpass-ports.yaml#
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
+    #include <dt-bindings/sound/qcom,q6afe.h>
+    apr {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        service@4 {
+            compatible = "qcom,q6afe";
+            reg = <APR_SVC_AFE>;
+            qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+
+            clock-controller {
+                compatible = "qcom,q6afe-clocks";
+                #clock-cells = <2>;
+            };
+
+            dais {
+                compatible = "qcom,q6afe-dais";
+                #address-cells = <1>;
+                #size-cells = <0>;
+                #sound-dai-cells = <1>;
+
+                dai@22 {
+                    reg = <QUATERNARY_MI2S_RX>;
+                    qcom,sd-lines = <0 1 2 3>;
+                };
+            };
+
+        };
+    };
diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml
index fd567d20417d..aa6c0ecba5cf 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml
@@ -35,41 +35,7 @@ additionalProperties: false
 
 examples:
   - |
-    #include <dt-bindings/soc/qcom,apr.h>
-    #include <dt-bindings/sound/qcom,q6afe.h>
-    apr {
-        compatible = "qcom,apr-v2";
-        qcom,domain = <APR_DOMAIN_ADSP>;
-        #address-cells = <1>;
-        #size-cells = <0>;
-
-        service@4 {
-            compatible = "qcom,q6afe";
-            reg = <APR_SVC_AFE>;
-            qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-
-            clock-controller {
-                compatible = "qcom,q6afe-clocks";
-                #clock-cells = <2>;
-            };
-        };
-    };
-
-  - |
-    #include <dt-bindings/soc/qcom,gpr.h>
-    gpr {
-        compatible = "qcom,gpr";
-        qcom,domain = <GPR_DOMAIN_ID_ADSP>;
-        #address-cells = <1>;
-        #size-cells = <0>;
-
-        service@2 {
-            reg = <GPR_PRM_MODULE_IID>;
-            compatible = "qcom,q6prm";
-
-            clock-controller {
-                compatible = "qcom,q6prm-lpass-clocks";
-                #clock-cells = <2>;
-            };
-        };
+    clock-controller {
+        compatible = "qcom,q6afe-clocks";
+        #clock-cells = <2>;
     };
diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
index e53fc0960a14..b202692f1756 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
@@ -150,54 +150,16 @@ additionalProperties: false
 
 examples:
   - |
-    #include <dt-bindings/soc/qcom,apr.h>
-    #include <dt-bindings/sound/qcom,q6afe.h>
-    apr {
-        compatible = "qcom,apr-v2";
-        #address-cells = <1>;
-        #size-cells = <0>;
-        qcom,domain = <APR_DOMAIN_ADSP>;
-
-        service@4 {
-            compatible = "qcom,q6afe";
-            reg = <APR_SVC_AFE>;
-            qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-
-            dais {
-                compatible = "qcom,q6afe-dais";
-                #address-cells = <1>;
-                #size-cells = <0>;
-                #sound-dai-cells = <1>;
-
-                dai@22 {
-                    reg = <QUATERNARY_MI2S_RX>;
-                    qcom,sd-lines = <0 1 2 3>;
-                };
-            };
-        };
-    };
-  - |
-    #include <dt-bindings/soc/qcom,gpr.h>
-    gpr {
-        compatible = "qcom,gpr";
+    #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
+    dais {
+        compatible = "qcom,q6afe-dais";
         #address-cells = <1>;
         #size-cells = <0>;
-        qcom,domain = <GPR_DOMAIN_ID_ADSP>;
-
-        service@1 {
-            compatible = "qcom,q6apm";
-            reg = <GPR_APM_MODULE_IID>;
-
-            dais {
-                compatible = "qcom,q6apm-lpass-dais";
-                #address-cells = <1>;
-                #size-cells = <0>;
-                #sound-dai-cells = <1>;
-
-                dai@22 {
-                    reg = <QUATERNARY_MI2S_RX>;
-                    qcom,sd-lines = <0 1 2 3>;
-                };
-            };
+        #sound-dai-cells = <1>;
+
+        dai@22 {
+            reg = <QUATERNARY_MI2S_RX>;
+            qcom,sd-lines = <0 1 2 3>;
         };
     };
-- 
2.34.1

