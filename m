Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CABCF9339F2
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2024 11:34:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D2CBE69;
	Wed, 17 Jul 2024 11:34:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D2CBE69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721208866;
	bh=kXcXQlQw8cCu7vUhvQQqw7fNx9k+D9plQJiW4hesxaI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=omS2jQQ6McA3uzwSPDQ2jP7ew4kvz1xHsn1fWQsEk0ajKtL1Fp2XckV6PAEp+HXnv
	 eEQL9pDc6vSU4yK4ickgojrlbvRsteqEj+AbsZBqiZYDSCxZ9HCOJi8/tUWm2/dsWB
	 uXXgO6DefiARtkzp+9ZmyEY+RJF+zVvlUGegDUgo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3CBAF805C4; Wed, 17 Jul 2024 11:33:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D59B0F805C9;
	Wed, 17 Jul 2024 11:33:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65E3CF80494; Wed, 10 Jul 2024 13:39:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA6A4F800FA
	for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2024 13:39:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA6A4F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZUKpOKOO
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-52ea2f58448so7986767e87.1
        for <alsa-devel@alsa-project.org>;
 Wed, 10 Jul 2024 04:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720611589; x=1721216389;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrw0KmyxDKt0z/+5CdGnxoQjpcekSUdd2Exq++60Pok=;
        b=ZUKpOKOOmA+bM+AXJ6Gu8N+bnhtga388dAZyfpxZQiEnU9QOsDwq286DzYErTWCBmz
         aHqBGLpVCjumJcADLoPtSI1+0T/RrWidEto+IgQtqXFdowaoXhM1MxD2YykHt1dusSJM
         O35T9mba9qyrAnEtXyga9Xv+5hCAbK4Dc0bAExOcOTcrCd2vGOW82iVjQz297FvESwoF
         YqG7JqY+pNnWb3AwYfu9hMTKAaqGar/JNHOgNnDr6ksIBC8KOwbDHJAs9eM4/MXUnHqQ
         /RnafqEbc6+o93U/2xQ46XZsAZBZlOBDvEzqP/mz+IUfNzl743X4ud6/hX/BwCzVkMu3
         6Vkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720611589; x=1721216389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lrw0KmyxDKt0z/+5CdGnxoQjpcekSUdd2Exq++60Pok=;
        b=N5IiCyWBuckn/Sa6tvZoli2p2m8kWAHHYlcioQPEMMmsKebT4N2D1I/DSscnPfadFe
         +ClwSpnXashUv48f9PAPYLEM74W0Q/nzcvjqmTi79p+RATETtp4tNxTnfhWVgEvjBfjM
         FEyPDS4I+N4WjfQzU6jRnBps8/Tz7Xnwy0AVN4FvSGUtd1/9DHyoUlrq1DZj9Bnkue4M
         hox5NO+xOVFotEhottHV9HfxBP9snxeztyFsKlePigFGmcCSHaeKGJ5hDgabDYPgLf9L
         m68+93EA23FXQL7nYRqS8O+afFXxa++GtY9o08c96iP7hd1SW0nnXu5dZ+RTQkWG27nO
         vulg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6C0Mkzf30PAmjgX0dZFooIRSNh/LHGk5yj55epB8RtCqhmzA/alQTifW6rRWqp0fd8LzHiGqVdkRR/yxoQkm84+btuzUc8Zf5NzM=
X-Gm-Message-State: AOJu0Ywb5AS5Lb7NLcOLpKGLveur729qhud4lLHG4P7qcOWMlYRXDoAw
	kE9PRawBBu2anVytKZ7bQdKiVXNZd8SXV5+hDZpJtMs56Ko+IWkNMltYUvUPNjs=
X-Google-Smtp-Source: 
 AGHT+IGCIfQQFWizC9oYA0R7wEwIwKOXXTqvLbF5U7LfpTs+Ls/Zyvmg+QDt0ocqWOmzblGuzvrQSA==
X-Received: by 2002:a05:6512:b0b:b0:52c:a724:5ae3 with SMTP id
 2adb3069b0e04-52eb99cb0admr3854086e87.51.1720611589220;
        Wed, 10 Jul 2024 04:39:49 -0700 (PDT)
Received: from rayyan-pc.broadband ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f7361b5sm78602875e9.29.2024.07.10.04.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 04:39:48 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
To: devicetree@vger.kernel.org
Cc: Rayyan Ansari <rayyan.ansari@linaro.org>,
	alsa-devel@alsa-project.org,
	Banajit Goswami <bgoswami@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 1/2] ASoC: dt-bindings: qcom,msm8916-wcd-digital-codec:
 convert to dtschema
Date: Wed, 10 Jul 2024 12:36:06 +0100
Message-ID: <20240710113833.39859-2-rayyan.ansari@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240710113833.39859-1-rayyan.ansari@linaro.org>
References: <20240710113833.39859-1-rayyan.ansari@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: rayyan.ansari@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XH7VHQWR62K37FYLBOHDZAEEHPSQP746
X-Message-ID-Hash: XH7VHQWR62K37FYLBOHDZAEEHPSQP746
X-Mailman-Approved-At: Wed, 17 Jul 2024 09:33:38 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XH7VHQWR62K37FYLBOHDZAEEHPSQP746/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the Qualcomm MSM8916 WCD Digital Audio Codec bindings from text
to yaml dt schema format.
Make bindings complete by adding #sound-dai-cells.

Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
---
v1 -> v2: removed unneeded minItems, added ref to dai-common.yaml

 .../sound/qcom,msm8916-wcd-digital-codec.yaml | 55 +++++++++++++++++++
 .../sound/qcom,msm8916-wcd-digital.txt        | 20 -------
 2 files changed, 55 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital.txt

diff --git a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
new file mode 100644
index 000000000000..a899c4e7c1c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,msm8916-wcd-digital-codec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm MSM8916 WCD Digital Audio Codec
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description:
+  The digital WCD audio codec found on Qualcomm MSM8916 LPASS.
+
+properties:
+  compatible:
+    const: qcom,msm8916-wcd-digital-codec
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: ahbix-clk
+      - const: mclk
+
+  '#sound-dai-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#sound-dai-cells'
+
+allOf:
+  - $ref: dai-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-msm8916.h>
+    audio-codec@771c000 {
+        compatible = "qcom,msm8916-wcd-digital-codec";
+        reg = <0x0771c000 0x400>;
+        clocks = <&gcc GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_CLK>,
+                 <&gcc GCC_CODEC_DIGCODEC_CLK>;
+        clock-names = "ahbix-clk", "mclk";
+        #sound-dai-cells = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital.txt b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital.txt
deleted file mode 100644
index 1c8e4cb25176..000000000000
--- a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-msm8916 digital audio CODEC
-
-## Bindings for codec core in lpass:
-
-Required properties
- - compatible = "qcom,msm8916-wcd-digital-codec";
- - reg: address space for lpass codec.
- - clocks: Handle to mclk and ahbclk
- - clock-names: should be "mclk", "ahbix-clk".
-
-Example:
-
-audio-codec@771c000{
-	compatible = "qcom,msm8916-wcd-digital-codec";
-	reg = <0x0771c000 0x400>;
-	clocks = <&gcc GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_CLK>,
-		 <&gcc GCC_CODEC_DIGCODEC_CLK>;
-	clock-names = "ahbix-clk", "mclk";
-	#sound-dai-cells = <1>;
-};
-- 
2.45.2

