Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C53C62981E
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 13:05:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 182FF1691;
	Tue, 15 Nov 2022 13:05:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 182FF1691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668513953;
	bh=Ll0Fjy6X7ePv96NGH+bs1WH2X5+mJInvohgeJXZDyg8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eD/VlScRZJkpgf2JEmtbi05OwvqTgyEkoyjFQhtc9rHBdJLyNU07+HgP4oclB+fYJ
	 ZTTGsYEqWWGYv9kf7xJ4bMRkevtxjqs/nnKdXr1J+kh5ag9+MaiT3pLUcEmyDwgyMZ
	 BQF8FnBDEarJrycddhyzY18VTfDubs89KX/aXIQU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 780A8F8059F;
	Tue, 15 Nov 2022 13:03:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA711F8057C; Tue, 15 Nov 2022 13:03:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC0EAF8047C
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 13:02:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC0EAF8047C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Iu64cV54"
Received: by mail-lj1-x22f.google.com with SMTP id u11so17152637ljk.6
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 04:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LyyakI8dI31KMumI0zAq/rZxHMG6g0EuWRPy/j4igio=;
 b=Iu64cV54PeAH+y/r9d6d4/HeQob4vBfJ64H84jjELeyS9b5bxUoVuI3BMmpmsaP2cv
 hK0iGmlf4Fm3993w0XqR/eZXs8Fb82A7zdbUNxam+AsKsLM6jPUxWmkSxEvGYTxfgikz
 lTe9KOJKr6UN1p1Z7Sl1T9obWYxc3sENNxGQsSGmwMh9gsE4+h+99wwDjnL1PuhLAqA/
 VEsZjdFSthpo5PgpJ2lePY6O99dsF/PfngqhiWGh7UA6V3bwgrdzc2eYAQxDpLYtVWFl
 0D0bHKzzMYQK1pkz7I7EGOu4KdIkuXEVtvGvl5h+Upd1vnmUccvodWJt31qEDdK0PLIJ
 PWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LyyakI8dI31KMumI0zAq/rZxHMG6g0EuWRPy/j4igio=;
 b=5p5OuKenoIHrkfTlV/n1Gkk6GHe3sRElmUYYYpTnVlFDt61kPvdO1aOhpGvbj1I4nw
 E+HW9Pn08M7mWertMXszA9E+ev15knRtd+LXIC/5YeMuO2Td0hvo9qG5Visgm0h7Xskh
 cRoGfigzf8b0NX81Avzf6uUc/OY3a3NgbfI/pNc8bXiFPShRHeKOA/yxA1h2EDmvGX+m
 1RxADNYX0jlewnpJ8Efdl55ZrbdA9eXyXsIf4Uyr1URb+iGjvQjonVCiu/09lFRMcr2z
 C9x/xpWt6ye7e20tKellEJ08r5OAHyfa2uCQzGtaMc3P1VchZtzYKjYdU+a+3+imVfn/
 A5Fw==
X-Gm-Message-State: ANoB5plSgPTW9mVS5flDiP2zKpHftHZdyrXiQ2dSe/6sCnnAsvMJsdV1
 AuzYkHwBJi/dclYTFANynSgdHA==
X-Google-Smtp-Source: AA0mqf4bsmoyb0QW/dQ4kJp/id0PhHduPtPhyADMrx0mfBRfduq2Y/a6a7oBLkdqlS9/Zfi0lpwYHA==
X-Received: by 2002:a2e:9ec2:0:b0:26e:768c:11ed with SMTP id
 h2-20020a2e9ec2000000b0026e768c11edmr6117310ljk.436.1668513772696; 
 Tue, 15 Nov 2022 04:02:52 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 i13-20020ac25d2d000000b004b0b2212315sm2176233lfb.121.2022.11.15.04.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 04:02:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/11] ASoC: dt-bindings: qcom,
 q6adm: Split to separate schema
Date: Tue, 15 Nov 2022 13:02:30 +0100
Message-Id: <20221115120235.167812-7-krzysztof.kozlowski@linaro.org>
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

The APR/GPR bindings with services got complicated so move out the Q6ADM
service to its own binding.  Previously the compatible was documented in
qcom,apr.yaml.  Move most of the examples from its children to this new
file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: quic_srivasam@quicinc.com
Cc: quic_plai@quicinc.com
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

