Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC93669D9C
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 17:24:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48CF37098;
	Fri, 13 Jan 2023 17:23:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48CF37098
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673627045;
	bh=omJ7E+sXSldDvxFx3NXdxKWQiwRFf7u2PSLs2GeQ4es=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=LYFnFkgvqasn8s8Bk2cwOAt8KrOU4lBlg+MWfrc0t6WgIg6wjFwSbfAi8RXL2EGZG
	 JXrLF2aHYSnlrhpoYDl/GGO4KESk7jgHNEum0KVLr87y3axbfwqVxnV7Q/JwuqSn3l
	 CpvZn6sYpWr9h0tLwIyKI+IPqzNhZOnInXMKAUmM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E940AF80425;
	Fri, 13 Jan 2023 17:22:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 627E7F8053A; Fri, 13 Jan 2023 17:22:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D4F2F8016D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 17:22:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D4F2F8016D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=iGbfa1kP
Received: by mail-ej1-x635.google.com with SMTP id az20so34397984ejc.1
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 08:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bexLBDu2Jcqr900kwtHlEd3vc21Me48gshjDc+jPY5U=;
 b=iGbfa1kPYcyjjbwACbG3VaTIbW+t0C83bDns2PeqtRAE3fKZyPa/WEmxMc79C7n+k0
 LSn7GtKnoYNf36+3K5afjV9HtWsYGjR6SztHSRfDbdDn8o7Jtsm88jzTkgzpLLt/mibF
 XlwJuLig4EvjXMVD6NKEn0QZv/t3QADwTFWKXR5D+iaP5uuiZooEJDe/8aSmLbQQdbg/
 tvs9JayG5UkN4ibEtzCdON79+XZZJFzTAWvYpJkrx95wlIipqCFl2etYsvPfiOZ5WO/I
 ZyMfPDeN4OS5JYIyM4BO7L8zP8T6WGZZWy0WiWHLPvKxkkyvycgHI+qvxOHZ/z9EvWH5
 GIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bexLBDu2Jcqr900kwtHlEd3vc21Me48gshjDc+jPY5U=;
 b=t5ccNQzphW8Y8E1u/6cZsNLtmH2wnF3TW8PmfAUNdS74COMC0kLsDmOfR+RbQ9M9gF
 D/B2xkC9AHHZrH9+4vNl4ZPf6Yk1ThfdCZAkVHbT/1k+r+VTZhOV0euvntJIeC3mnKCB
 nLXqPop5FFsasoP2tmD39P2ZVfHBccXLKU5dOefzjKKnr23itO3iQRB8h1IaqdrOHI/K
 hO0nmoNHdNm64RKHpUsGopFZiD4+sXYvPSGFMNIaBlHS8YjaMQiLR3s+ippMwujU7LcO
 P297dW9O6AAyJNWVF+pFMxiXDu5K0uGljfVduHdaqgQ5phVhC8v9QHrYIstzdSk4oru3
 t8oQ==
X-Gm-Message-State: AFqh2kpPqxiiP2NrducJ6DQU81k8rJ/+Tqe2s6GmStdEZEUyCNA/B9Gd
 PBuvJ8T9HSRvKMlALJbDrpoF2w==
X-Google-Smtp-Source: AMrXdXteXj2KfLx4/wMmN2219OBKDVEo2r86wx6/WgM1C2Dv8h723tnkzSLIYUoGCqzY6op/E1Rujg==
X-Received: by 2002:a17:907:a609:b0:7c1:22a6:818f with SMTP id
 vt9-20020a170907a60900b007c122a6818fmr4233958ejc.25.1673626942675; 
 Fri, 13 Jan 2023 08:22:22 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 o11-20020a170906768b00b0084d242d07ffsm8376737ejm.8.2023.01.13.08.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 08:22:22 -0800 (PST)
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
Subject: [PATCH 3/3] ASoC: dt-bindings: qcom,
 wcd934x: Allow usage as IFD device
Date: Fri, 13 Jan 2023 17:22:14 +0100
Message-Id: <20230113162214.117261-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113162214.117261-1-krzysztof.kozlowski@linaro.org>
References: <20230113162214.117261-1-krzysztof.kozlowski@linaro.org>
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

The WCD9340 audio codec appears on Slimbus twice: as IFD device without
properties and the actual audio-codec referencing the former via
wcd9340_ifd.  Allow in the binding both versions to fix several warnings
like:

  sdm850-samsung-w737.dtb: ifd@0,0: 'reset-gpios' is a required property
  sdm850-samsung-w737.dtb: ifd@0,0: 'slim-ifc-dev' is a required property
  sdm850-samsung-w737.dtb: ifd@0,0: 'interrupt-controller' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

oneOf: interrupts-extended|interrupts is needed to avoid dtschema
limitation.
---
 .../bindings/sound/qcom,wcd934x.yaml          | 58 ++++++++++++++-----
 1 file changed, 43 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
index 39b27126cfc1..ea09590bfa30 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
@@ -149,21 +149,49 @@ patternProperties:
 required:
   - compatible
   - reg
-  - reset-gpios
-  - slim-ifc-dev
-  - interrupts
-  - interrupt-controller
-  - clock-frequency
-  - clock-output-names
-  - qcom,micbias1-microvolt
-  - qcom,micbias2-microvolt
-  - qcom,micbias3-microvolt
-  - qcom,micbias4-microvolt
-  - "#interrupt-cells"
-  - "#clock-cells"
-  - "#sound-dai-cells"
-  - "#address-cells"
-  - "#size-cells"
+
+allOf:
+  - if:
+      required:
+        - slim-ifc-dev
+    then:
+      required:
+        - reset-gpios
+        - slim-ifc-dev
+        - interrupt-controller
+        - clock-frequency
+        - clock-output-names
+        - qcom,micbias1-microvolt
+        - qcom,micbias2-microvolt
+        - qcom,micbias3-microvolt
+        - qcom,micbias4-microvolt
+        - "#interrupt-cells"
+        - "#clock-cells"
+        - "#sound-dai-cells"
+        - "#address-cells"
+        - "#size-cells"
+      oneOf:
+        - required:
+            - interrupts-extended
+        - required:
+            - interrupts
+    else:
+      properties:
+        reset-gpios: false
+        slim-ifc-dev: false
+        interrupts: false
+        interrupt-controller: false
+        clock-frequency: false
+        clock-output-names: false
+        qcom,micbias1-microvolt: false
+        qcom,micbias2-microvolt: false
+        qcom,micbias3-microvolt: false
+        qcom,micbias4-microvolt: false
+        "#interrupt-cells": false
+        "#clock-cells": false
+        "#sound-dai-cells": false
+        "#address-cells": false
+        "#size-cells": false
 
 additionalProperties: false
 
-- 
2.34.1

