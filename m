Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF4F625995
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 12:39:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 999411684;
	Fri, 11 Nov 2022 12:38:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 999411684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668166753;
	bh=IIFBFm54dU9BR11DAaurWCn45n5hXLXYV29fSI8j1P8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q0a4V8fe+WqFZg2dC5K294u59f7mnAWHlT5ozPLxNt2bb7deuV/BgMemFknYxHz4Y
	 vaiZRm2gTsCz8AHRaz+IravNRzEi9BWECitb18WoQLEmOC9xGrgJ8Nhgx9ltW+6gtD
	 uhuYqCJ+7mhvzWFvTYUB5CxhAdPIzEYPCJjQNf1Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 169F7F8057F;
	Fri, 11 Nov 2022 12:36:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6C3DF8055A; Fri, 11 Nov 2022 12:36:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS,URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B744CF80249
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 12:36:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B744CF80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Ue597laU"
Received: by mail-lf1-x131.google.com with SMTP id g7so7940421lfv.5
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 03:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jF161Eg7n0UygRaLy1ADIgA+vp2I1IUSYtCaqNOSavw=;
 b=Ue597laUUdsvlmSluFDi0bDqOMbRTooWeh6UN8ZgrT87+FHaVXYCQwDXR5gdrnb4bc
 1VqBB23tDxUYH3WxNghQdzLGxjXN/LEy+ZsBCFx7f6CRPMqQhqoosz2g02ZFldN+P9Pe
 BtZYZ/cuCVdx0vRKoRCsRN2RgzSmvXQimi8bxUFfompey0Mh+6j/ZI/w+dYp1+/xI1qV
 3D9JzkhL+ROSx3YTROf0xLTfS+GHMrYJF3urc6lI47BjIF9Lcn2otKRecXGKG6WDL7lk
 jScQJbJeB24aYj3RTuxkX1mKLF1U+oG9uSeicF9aMbPJu70A9dYCHA6pYeRuL/4b186c
 skbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jF161Eg7n0UygRaLy1ADIgA+vp2I1IUSYtCaqNOSavw=;
 b=yIFZ2Z6Ne1aKCesIRJPA6a05ZADRhTVPT6vQhFe3YFugTxAFmBe14rwn3sUY3nMSdO
 rvK3nvBNCnVkLS1hEZxXqS/YFGZGJzCI49M41lg6hTs/ZR+n4nlKwSExIl7hj7DesTFF
 vwSigJK6tiXzuxdLYs+USfLJ0Hfk6TPcSHqpMMLDfE4fWEAYKUv6csI6AzGq/bP1Yw0l
 YnG7UClJdMRaXK5iO0QaEPRH7zcNgDcABS9f+skSJ8Ok7TEgTXnuRvmGtvfy4+WQQH06
 aKLDSFyvRzd/juN71Hg6i5qbPkdxAlwmAAyXwWnQNTmD0LglvdYAUer0XQnSxKqy/7nq
 K8/g==
X-Gm-Message-State: ANoB5pkDzCvN1UlpkXzM4qH3QPyz+SJMOrCqAaKL3603hf1wxbXIAZrb
 eZiy+vcHsqAyFTQ4gknmL5IvdA==
X-Google-Smtp-Source: AA0mqf5qlyYZMSvN0eDxF/3Qk/qPFehRkTqOyBDOfWSG28mnuUyS2f/a5pudHk2doI3/ZaSqE7dT7g==
X-Received: by 2002:ac2:5396:0:b0:4a2:3a4b:5012 with SMTP id
 g22-20020ac25396000000b004a23a4b5012mr555125lfh.526.1668166576691; 
 Fri, 11 Nov 2022 03:36:16 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 bi30-20020a0565120e9e00b004acb2adfa1fsm274970lfb.307.2022.11.11.03.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 03:36:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] ASoC: dt-bindings: qcom, q6prm: Split to separate schema
Date: Fri, 11 Nov 2022 12:35:44 +0100
Message-Id: <20221111113547.100442-8-krzysztof.kozlowski@linaro.org>
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

The APR/GPR bindings with services got complicated so move out the Q6PRM
service to its own binding.  Previously the compatible was documented in
qcom,apr.yaml.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

