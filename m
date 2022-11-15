Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC9E62981C
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 13:05:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 876E616B0;
	Tue, 15 Nov 2022 13:04:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 876E616B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668513935;
	bh=tFaSV8AzGZxnAkrKAyCuCqQYs2yK3v1/dcLHNjm5CMc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V6HHn9hgXIynMihFaYGHbJKlFCR/E1Bbir/IT/2Er2SqHEYM9v2O/VrVQQStvTC9i
	 uixdvRotY6gNsic+Ie8c+BDkAIIw6GjT5W98biJG1BDy9cYyzInl3NeGz1KiqbidRn
	 Vs3J9rZ6Jq0tIQdcYM/AN6/qcJ0ATtuBJapJtFN4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD9D6F80587;
	Tue, 15 Nov 2022 13:03:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C9CDF8057D; Tue, 15 Nov 2022 13:03:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE17AF8055A
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 13:02:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE17AF8055A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="QUhL0yGd"
Received: by mail-lf1-x133.google.com with SMTP id j16so24023162lfe.12
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 04:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BbaZwU77Z1ouLs3jgvngmnLtPy0YsEJlCLwAlXk9eGs=;
 b=QUhL0yGdrd3iB3ZcnCkgmArwlxWX3jxB+ogF+ySPNM30t+Ha+J2/kDkmZPQd3NbUrx
 GpwO6nNuqUtLMSMRU5o454qjK48oApnmyf6g4FehFFkD8jDp3FQFdbSFmvC0uh/c/gFs
 La8LSft5u7B1SDGy6EGkgxSkOyQ9THCNthTrWKve7XDdrNmw/kAEUMmaT4b/KgUi+EQf
 UmCRXvfLDPByytE+RoEyeKTLbMiAI6DzPUznO0W+V4SZJ3peP0bUcPNIVsE4XwdTVxE4
 pH+xl9zJFRjBpFWtiXujEfJ056dfD/2zdDpo7SVsaTPx5omi9Ra2nrS1sockA5mFZmYv
 4/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BbaZwU77Z1ouLs3jgvngmnLtPy0YsEJlCLwAlXk9eGs=;
 b=X1VOvV5VpJ+jhEgNj3CinbhXmc2vrzrB4jpTnQuu1On5EMCU26l5WQvP7bAEOb/Wcu
 57RAbgI/E8LS7TaHD7l688Fsa64YPQbr0ZUGbNT95YbfkNFVLDB+iehTmuh04Grt6Jcr
 SoA9pab733x1Rz2OSdGuaw+TLs8QaTmGwK/74RygXNpztT00bYLBcMiD2IZAumtlomr8
 i6R/8VWZ+AzKyCRvM/+Rmh+64YaShfGIHAl3EXOszi4McTFgMtNSVmIWh97RtVB31qjR
 hygCCtaIm/lEWb70ZgtO3tr6s2cBjoC4BYMhBELB0bubm247rtlOtPgM9S+8rFfvtplA
 6rlg==
X-Gm-Message-State: ANoB5pm2THcg4HjyKDg0h8Z/GRYv5R7RLtc/rOk5znOc3Tlz3SMT9OYi
 4s0AvZwDhEsd3Vz5eKZzMKbXSA==
X-Google-Smtp-Source: AA0mqf7uYCrKdueUJqv0hPgUAc0aNVnzCOqAYP6HvvPf1xojk47c84bx1TNe+IkwF3HCvbMUByc5CA==
X-Received: by 2002:ac2:55a7:0:b0:4a2:5154:ead9 with SMTP id
 y7-20020ac255a7000000b004a25154ead9mr5737175lfg.32.1668513775386; 
 Tue, 15 Nov 2022 04:02:55 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 i13-20020ac25d2d000000b004b0b2212315sm2176233lfb.121.2022.11.15.04.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 04:02:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/11] ASoC: dt-bindings: qcom,
 q6prm: Split to separate schema
Date: Tue, 15 Nov 2022 13:02:32 +0100
Message-Id: <20221115120235.167812-9-krzysztof.kozlowski@linaro.org>
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

The APR/GPR bindings with services got complicated so move out the Q6PRM
service to its own binding.  Previously the compatible was documented in
qcom,apr.yaml.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: quic_srivasam@quicinc.com
Cc: quic_plai@quicinc.com
---
 .../devicetree/bindings/sound/qcom,q6prm.yaml | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6prm.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6prm.yaml b/Documentation/devicetree/bindings/sound/qcom,q6prm.yaml
new file mode 100644
index 000000000000..f6dbb1267bfe
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,q6prm.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,q6prm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Proxy Resource Manager (Q6PRM)
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
+      - qcom,q6prm
+
+  clock-controller:
+    $ref: /schemas/sound/qcom,q6dsp-lpass-clocks.yaml#
+    unevaluatedProperties: false
+    description: Qualcomm DSP LPASS clock controller
+
+required:
+  - compatible
+  - clock-controller
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
+        service@2 {
+            reg = <GPR_PRM_MODULE_IID>;
+            compatible = "qcom,q6prm";
+            qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+
+            clock-controller {
+                compatible = "qcom,q6prm-lpass-clocks";
+                #clock-cells = <2>;
+            };
+        };
+    };
-- 
2.34.1

