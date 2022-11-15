Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC80629819
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 13:05:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C92A16A2;
	Tue, 15 Nov 2022 13:04:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C92A16A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668513902;
	bh=RysqAyAkjfrLxX0RGdDZXy9rGJZXuRKfwj5YyUGTQmY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CH5sa9UmZYA1BZ6pZ21EJ9vCrs6/7sqxv0gXjNXQxnl6FYvlyZ1faqy+xOhnD8ePK
	 g3LNj9FDMIyeXL+/x3ljaBYvGcsGBOwJbYFd1Br5pG9touDwCm/JLoeM6ro1SHJqv3
	 Hm27jIfoQP4pYJIQKyn1Riehwws92Ja3z+G9LA4U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFBF3F80571;
	Tue, 15 Nov 2022 13:03:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3F27F80564; Tue, 15 Nov 2022 13:02:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4E0CF800B8
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 13:02:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4E0CF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="rqbfqgqX"
Received: by mail-lj1-x233.google.com with SMTP id b9so17230912ljr.5
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 04:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VRDkbLdN3Hk4s8rRHjrRfrub5qJgUXRitpmo0hUp4NU=;
 b=rqbfqgqXihYdyms1FEfA31MAYyeJnGOJoDb9UKZBBZc5U+dwLrFNFHrjzA2t/riwJc
 2YaeZJKCFP7hXfbnl2W24Le5sOiH8Hf9+kp9siQ6Asm6HGUft4YTm8p7atixX5KkPxc3
 LS9AjpvccnBXvCZrQZJzXQc1W2rWwPK0TQd9xjZRM86eTr0OJ5xyE41xrhkGmuQu5LO4
 nPjmqBYRgyXiBXjf1SQZkHmvzO+TIZJFAwIewgUu9keEQDtn5gW27JFgyE0vNIYeYTSq
 8RIpAkL0xBkIR+kPk5bBHW13bDmBFf0V+MKG5DyOU0kydJThn3f8woFWDlSQNFzZ9xtI
 JHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VRDkbLdN3Hk4s8rRHjrRfrub5qJgUXRitpmo0hUp4NU=;
 b=0hT7dY6Li5DYR9u3gLZ5iKaX8IMetdYto0yNNbAx5ZEaD6Cg2FKzwWTknhcOwBWCJs
 cF/UAzcuxbmSmS62gNoMm/dJ7FiEaLTOoZExh4FfmqYz7xt80GNHuQDL2zhXJA5A8dna
 IKes2MO3niORn8dzXubqph4w1DRvjS0DuGmlrOai9YeDGsL1BJYZD1vJG5yPklo3Jpq/
 hqurMt9V82lvVQ24SAFAQDebdoRAqzKC40RFVYgBp49+6xv/Zu7D8m9WyZtQPO0Qcdoe
 UzCueGqpaciJssHdCWnk7JvhccbsffstXoIYEPKjEKpB+JE8ioiEciUtrI1qonNsczZo
 kFSg==
X-Gm-Message-State: ANoB5pnV1whg0xcOXnt6cG7l0FONrigHsQzQIvJB96X9XHPAs5KEw6qL
 GNx5kCfSZHEQMJvnLihW+X6/zF8NhECqOS65
X-Google-Smtp-Source: AA0mqf53KFS2L0LpS7xLPyVFNfySVDUtL9HkQX/tAIiQBVms2FOnxbLG1YfpPKw2QDkQrhul/g/FJg==
X-Received: by 2002:a2e:a54a:0:b0:26c:5db6:cd84 with SMTP id
 e10-20020a2ea54a000000b0026c5db6cd84mr5637666ljn.114.1668513769294; 
 Tue, 15 Nov 2022 04:02:49 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 i13-20020ac25d2d000000b004b0b2212315sm2176233lfb.121.2022.11.15.04.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 04:02:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/11] ASoC: dt-bindings: qcom,
 q6afe: Split to separate schema
Date: Tue, 15 Nov 2022 13:02:28 +0100
Message-Id: <20221115120235.167812-5-krzysztof.kozlowski@linaro.org>
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

The APR/GPR bindings with services got complicated so move out the Q6AFE
service to its own binding.  Previously the compatible was documented in
qcom,apr.yaml.  Move most of the examples from its children to this new
file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: quic_srivasam@quicinc.com
Cc: quic_plai@quicinc.com
---
 .../devicetree/bindings/sound/qcom,q6afe.yaml | 68 +++++++++++++++++++
 .../sound/qcom,q6dsp-lpass-clocks.yaml        | 40 +----------
 .../sound/qcom,q6dsp-lpass-ports.yaml         | 56 +++------------
 3 files changed, 80 insertions(+), 84 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6afe.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml b/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml
new file mode 100644
index 000000000000..297aa362aa54
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml
@@ -0,0 +1,68 @@
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

