Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE675B45A6
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Sep 2022 11:19:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DCD516DD;
	Sat, 10 Sep 2022 11:19:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DCD516DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662801592;
	bh=wOnWzWw6qN/Mr+Df3DRPPeZ9Nw8NyhihusMX3C/i52I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tcztcfcs9938ak8UxHJ44ssC1vRfKg3kUus+OpEa+TSXG2acy2zh/HosHhK1BgfIz
	 C/fF/VUj7kUWzrFSBXKUzGfA7kzbrZjCz/7ZVZl+wiXQByXVYOJ56H+iKLMSsnyKrw
	 y4zY8wGME3SVlTOp2V+xQTxaTO5By+m+pzw/s0ik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0A78F805C0;
	Sat, 10 Sep 2022 11:15:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 149E4F8058C; Sat, 10 Sep 2022 11:15:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C6B7F800B8
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 11:14:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C6B7F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="rDJ5SqyF"
Received: by mail-lf1-x12d.google.com with SMTP id z25so6728695lfr.2
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 02:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=1cq2Cz6+Sy/tLxBRXynhhig1VTaXAXEwiLaRAUKokT0=;
 b=rDJ5SqyF0Ajf/iIhY3qigKE1/djVs2SBb1CDat7xU4E76GbX2Sxcv+F+kMXDS0Ef60
 dlZ+7FMqkqNCH6/1eIjoJQf3OwEre1m/Bfs8sbPFnMJRQgVagX86tN5XbyZupxVnwB6K
 u+G8zCl+mXQtm4TNA85+W/scSjxyAZa4f/uX74q1bt8mc05VjprOHhWxMOO++R8t0jTs
 GDxD8w1vcbhussJDB7jxjqj/jKDW8BctaBatLmfv243uDAPQQiUXcklhPrqwn2AEpDwU
 go+VeKEMnizvem+i5XrZZqnRoRW9KFg8Wq/pYVTs5nV9GRFXe/XbIJnRoRV4nJpIwlMi
 kgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=1cq2Cz6+Sy/tLxBRXynhhig1VTaXAXEwiLaRAUKokT0=;
 b=IlUtLkDoQB0wWYdLA0xLUXsLKFD9oYVyk4RolNH0YcwEQifmI5tN+I/IwKlIwNoqjO
 689AAMN9dB7yMnROkLms0xKaCxrosikvnDVIkicUiFZ5BVGpQ9uKrAuJxF+51lbd2Up7
 UIOw0oJ1u3aGIfGxBldX/xjs/b/bLeYwYSWPAy9rMU0oT/NXvPtB1suMfqZzJHLZn6jl
 6ukzqZFcMCpHQjdS6cxxg02xKK1flKutEiNKECa2P93l7+lUmNsasFF29Pu/KII7JEe/
 WghxeI+djkOr39ejFSHSIt47Tk6VHdVs2WIFh184/JB/SpA7Us6ygqIyhH+9/rfMJxFv
 naOg==
X-Gm-Message-State: ACgBeo2ntNno8srOnhOQQDR4blOy2l8XeLf8TtCtkNwDajN1Iv+9QTco
 EK2j9tngOGQPTmuf5y4hRHxhHw==
X-Google-Smtp-Source: AA6agR7RKod47U0kD5QSHRgIkY8q0SH4jTo0lBV/oMq4KCefwxXWIcDQ7tqIanhG61C70/2ETM7CGg==
X-Received: by 2002:a19:520b:0:b0:498:f580:5cb5 with SMTP id
 m11-20020a19520b000000b00498f5805cb5mr3098607lfb.513.1662801290572; 
 Sat, 10 Sep 2022 02:14:50 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a19e016000000b0048b26d4bb64sm201552lfg.40.2022.09.10.02.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Sep 2022 02:14:50 -0700 (PDT)
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
Subject: [PATCH v4 11/15] ASoC: dt-bindings: qcom,q6adm: convert to dtschema
Date: Sat, 10 Sep 2022 11:14:24 +0200
Message-Id: <20220910091428.50418-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220910091428.50418-1-krzysztof.kozlowski@linaro.org>
References: <20220910091428.50418-1-krzysztof.kozlowski@linaro.org>
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

Convert Qualcomm Audio Device Manager (Q6ADM) bindings to DT schema.

The original bindings documented:
1. APR service node with compatibles: "qcom,q6adm" and
"qcom,q6adm-v<MAJOR-NUMBER>.<MINOR-NUMBER>",
2. Routing child node with compatible "qcom,q6adm-routing".

The conversion entirely drops (1) because the compatible is already
documented in bindings/soc/qcom/qcom,apr.yaml.  The
"qcom,q6adm-v<MAJOR-NUMBER>.<MINOR-NUMBER>" on the other hand is not
used at all - neither in existing DTS, nor in downstream sources - so
versions seems to be fully auto-detectable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v3:
1. New patch.
---
 .../bindings/soc/qcom/qcom,apr.yaml           |  3 +-
 .../bindings/sound/qcom,q6adm-routing.yaml    | 52 +++++++++++++++++++
 .../devicetree/bindings/sound/qcom,q6adm.txt  | 39 --------------
 3 files changed, 54 insertions(+), 40 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6adm-routing.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,q6adm.txt

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
index a1a8f77beef7..54328d74af85 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
@@ -112,8 +112,9 @@ patternProperties:
         description: Qualcomm DSP audio ports
 
       routing:
-        # TODO: Waiting for Documentation/devicetree/bindings/sound/qcom,q6adm.txt
         type: object
+        $ref: /schemas/sound/qcom,q6adm-routing.yaml#
+        unevaluatedProperties: false
         description: Qualcomm DSP LPASS audio routing
 
       qcom,protection-domain:
diff --git a/Documentation/devicetree/bindings/sound/qcom,q6adm-routing.yaml b/Documentation/devicetree/bindings/sound/qcom,q6adm-routing.yaml
new file mode 100644
index 000000000000..d0f7a79e240a
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,q6adm-routing.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,q6adm-routing.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Audio Device Manager (Q6ADM) routing
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description:
+  Qualcomm Audio Device Manager (Q6ADM) routing node represents routing
+  specific configuration.
+
+properties:
+  compatible:
+    enum:
+      - qcom,q6adm-routing
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/qcom,apr.h>
+    #include <dt-bindings/sound/qcom,q6asm.h>
+
+    apr {
+        compatible = "qcom,apr-v2";
+        qcom,domain = <APR_DOMAIN_ADSP>;
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
diff --git a/Documentation/devicetree/bindings/sound/qcom,q6adm.txt b/Documentation/devicetree/bindings/sound/qcom,q6adm.txt
deleted file mode 100644
index 15c353a20de8..000000000000
--- a/Documentation/devicetree/bindings/sound/qcom,q6adm.txt
+++ /dev/null
@@ -1,39 +0,0 @@
-Qualcomm Audio Device Manager (Q6ADM) binding
-
-Q6ADM is one of the APR audio service on Q6DSP.
-Please refer to qcom,apr.txt for details of the coommon apr service bindings
-used by the apr service device.
-
-- but must contain the following property:
-
-- compatible:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must be "qcom,q6adm-v<MAJOR-NUMBER>.<MINOR-NUMBER>".
-		   Or "qcom,q6adm" where the version number can be queried
-		   from DSP.
-		   example "qcom,q6adm-v2.0"
-
-
-= ADM routing
-"routing" subnode of the ADM node represents adm routing specific configuration
-
-- compatible:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must be "qcom,q6adm-routing".
-
-- #sound-dai-cells
-	Usage: required
-	Value type: <u32>
-	Definition: Must be 0
-
-= EXAMPLE
-apr-service@8 {
-	compatible = "qcom,q6adm";
-	reg = <APR_SVC_ADM>;
-	q6routing: routing {
-		compatible = "qcom,q6adm-routing";
-		#sound-dai-cells = <0>;
-	};
-};
-- 
2.34.1

