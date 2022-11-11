Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E444C625993
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 12:38:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80B121694;
	Fri, 11 Nov 2022 12:38:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80B121694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668166736;
	bh=nI2MoSK0qCRexiDfyQiJBaRD1EMj6LD6Sn7yNXr8fIo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FjyEcy7Gtos+ysvqtBjAfphDOMrkw+lPUNJ3KYXS9rU+tOjqV3qcDVA4cVe/W1/t8
	 zxCxmgMsQqP2I5sAGY9srOEnVyZX3r25dtKOOdDWH0Aj9NHtE0X0t0/0ax/M8he+u+
	 zB4MXK5jiJNu8PUhjf/xwUjbBIv/IRiy1YADcsO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DC18F8057B;
	Fri, 11 Nov 2022 12:36:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05B16F8055A; Fri, 11 Nov 2022 12:36:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21A9CF80519
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 12:36:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21A9CF80519
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="WFz3Cp9s"
Received: by mail-lj1-x22e.google.com with SMTP id a15so4216246ljb.7
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 03:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oEBoGr3X7IB7lANWmyJ0vo8TD49udt1SAuFDZMae92Y=;
 b=WFz3Cp9sXDJehJxF/+D7tFxIq7jlzy31R2WdUCszgtRsVgRyRjUzckqjFh4mIRrlW6
 tcs8Me2SpXcBkc4YiiIM+sMTOGQEyXWMmFgvcr1ncAIFNDr8QBwQ94LrnpQrF+KED1Tc
 NSlMWNiVFTJ/nZz66HKF1bcXMtcvwAZXkJYqaBRqTt2K6gaNiLEiJgadwb1ne6Suv0cQ
 8U+WdV6TuX+fbdycyVV1vwfEpfiuynzPeGc6JKpATl8RY2nb8BSYAsJYc/jB0UA1lM8Y
 c+kUWFWpwcuslThBCVXMAG8okz3wWrX0TnCaeuCXonhyZ5/90i7Ufh2NVxhZuh9locJf
 spKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oEBoGr3X7IB7lANWmyJ0vo8TD49udt1SAuFDZMae92Y=;
 b=uEhkIW2eUzvy8SuSSKJFaUw+0gjWSWNSCRHryIEEcnPf5Srb0W4KYLhMCz8gfxgnN4
 cTTULMNS3UrJPxhpKzC/4xXoGDqn4UQRtkde6Oml1vK1h+t8r9FhQGjGpPH1e49FrXvo
 Uy52O817efKu23xkcOpNdHIa+HTYBVkOO2f7BaKlWNnKrina1hyxd45ilt9blcZbkNYR
 PqQIh6l+i/P/QAqupheEpadOo4HzBGNLuR0hYDc8zuCjUNrkbjZ1IsILaoxMjmwlChS6
 dj9x16UeK5CcQ4Jqq2m6pQnZ70ElA+f0H82Wv4Pjr33pseJ8wfJH/XRjtM0aU9Bo9sRT
 qrPg==
X-Gm-Message-State: ANoB5plM6rDyKfXcjvqLIP7T1d9VzOzE+l4fhFRUhJg0NYuLeT7bsHrz
 RploNq6lmQHmr/qMwo6sXGTsLQ==
X-Google-Smtp-Source: AA0mqf79IMhFGWeei5VfHf+fjaEoxMdTeoHoRdkihJODjwuK6Lm+qK9xpde8XmV2xJ5rMF4kDArDTA==
X-Received: by 2002:a2e:b056:0:b0:278:a7de:54e6 with SMTP id
 d22-20020a2eb056000000b00278a7de54e6mr530694ljl.367.1668166577831; 
 Fri, 11 Nov 2022 03:36:17 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 bi30-20020a0565120e9e00b004acb2adfa1fsm274970lfb.307.2022.11.11.03.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 03:36:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 08/10] ASoC: dt-bindings: qcom,
 q6core: Split to separate schema
Date: Fri, 11 Nov 2022 12:35:45 +0100
Message-Id: <20221111113547.100442-9-krzysztof.kozlowski@linaro.org>
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

The APR/GPR bindings with services got complicated so move out the
Q6Core service to its own binding.  Previously the compatible was
documented in qcom,apr.yaml.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/qcom,q6core.yaml           | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6core.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6core.yaml b/Documentation/devicetree/bindings/sound/qcom,q6core.yaml
new file mode 100644
index 000000000000..e240712de9ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,q6core.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,q6core.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Audio Core (Q6Core)
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
+      - qcom,q6core
+
+required:
+  - compatible
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
+        service@3 {
+            compatible = "qcom,q6core";
+            reg = <APR_SVC_ADSP_CORE>;
+            qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+        };
+    };
-- 
2.34.1

