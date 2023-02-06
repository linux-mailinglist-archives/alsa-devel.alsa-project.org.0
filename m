Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE4168C56F
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 19:09:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FCB383B;
	Mon,  6 Feb 2023 19:09:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FCB383B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675706998;
	bh=xgEuzuyuvjKXrDv5I8KcSEEuFUoDeBJ8yQDgkrwgim0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=frRrPrBe6NrQTEtVTstSrV8C/sZpNf4jmRpKMjT2pDHGXlIW4hU0gF8ufwmYk/+Mi
	 B+kQufoI44B0MXMHoFibCyqextg8J0nPfZG6OENb+WZSEsaDu8WJ16CXW42VEj38wq
	 fdZtBbcxmLQ4FJAQgAMPM6hYuLa0uvu8LAnAqZX0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93473F804E7;
	Mon,  6 Feb 2023 19:08:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65908F80549; Mon,  6 Feb 2023 19:08:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C167F804E7
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 19:08:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C167F804E7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ucFAJXzr
Received: by mail-wr1-x42c.google.com with SMTP id m14so11176608wrg.13
 for <alsa-devel@alsa-project.org>; Mon, 06 Feb 2023 10:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8HvOrHkIP8SbO+sqt+8GIffUexPmit/k/GSAi9C9ZLA=;
 b=ucFAJXzrJn53Zv+WFCeSBra+jaWVuMvLGrhQesAWslLqtngBNFeqOZ1sclvsw6z/Ql
 Oyn3wD+ev+7fbKgHDrwzRf41Gs+qdvGjUlXbGAvyIriSQ+6LA7FYYOxwmoHeuao9xQ0w
 No8YIRXi5ognFZ/fMQS1dcMRxUmFwI7Wlp6mPVhaPtlDhQSVeC0RPf618Q9ttflv5RAU
 8U0CftKGQrUQ0mqS99VTJFAgOfNCLBRjE7L8Tixn6zIdMeeVPb3KwaYxmiquslHTNQaK
 6I/2SmmJ76BBhJUofjYW4+gXoqBRLq0p0vtpqnD4abCqcy+Ew1zihoJ5FSuI9ubKsDJn
 xB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8HvOrHkIP8SbO+sqt+8GIffUexPmit/k/GSAi9C9ZLA=;
 b=Tq/BWEjK2EVQczLOEKwcHx+7aUkOZC9DaRhWKGfD1w+CkLoVqxH1KWcdZP+91SoCe7
 8T5C2HhyyA0vXn+fqkJh3tJKdthvMLAwGOxsl1znBVgyjMw2dMwzTrKstgUx4XbwDper
 wd2TV3VF6C+dWsXTKzcaI/1TRzm0IOIzr3/x5LlW/XzBzFXMdmQqDhSb5ayAXD7242YZ
 wD1ZdKF5Et3J52ZlKSXeGfMlBqWeC4aD+0QFajbCWzD/gyKD9Bb1JRWdHu6UTnEToWAx
 446pmTj4mH5IRO0/NTaA3kBLvngAlqdraLjyMOO3T4o+bCH030JYodvkKB/8tfj++pGK
 Rb0A==
X-Gm-Message-State: AO0yUKWnsWyAPVuUd9ikatHsflFjPG9G4qyJwVDW8U1tNNLuQS7DX06L
 4cSjiDoxZ4qgHOIruN6QRmq9ig==
X-Google-Smtp-Source: AK7set/0BWk0xFD529JMx3PTnPQ1jw0SboYPgHS35Qq0UkDSwKopgOTCywFPtlZ6jfvnsqgedRLbNg==
X-Received: by 2002:adf:c60b:0:b0:2bd:c1de:a33f with SMTP id
 n11-20020adfc60b000000b002bdc1dea33fmr18720910wrg.19.1675706891758; 
 Mon, 06 Feb 2023 10:08:11 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 d18-20020a5d6452000000b002c3f1214e33sm365451wrw.100.2023.02.06.10.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 10:08:11 -0800 (PST)
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
Subject: [RESEND PATCH 3/3] ASoC: dt-bindings: qcom,
 wcd934x: Allow usage as IFD device
Date: Mon,  6 Feb 2023 19:08:05 +0100
Message-Id: <20230206180805.6621-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230206180805.6621-1-krzysztof.kozlowski@linaro.org>
References: <20230206180805.6621-1-krzysztof.kozlowski@linaro.org>
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
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Reviewed-by: Rob Herring <robh@kernel.org>

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

