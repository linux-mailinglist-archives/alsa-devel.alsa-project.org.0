Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BD46B4060
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 14:26:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3928118B2;
	Fri, 10 Mar 2023 14:25:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3928118B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678454761;
	bh=CdNzpbrWaNp1dInazO8/AaWnjW3KfJ9478c/Ed32D2A=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s/qSQPpc0wscNj15i/VqW8nKLhCpY8QsEKwyBjSOsA8ltUaciEyMONbErAgXUR7jM
	 Um5MbWTXou69GAG5tinyUp9vMcoLgEPzImyUpyEPX8EwZwoX5a9GTmtz7y34dE+WLp
	 YERqG0H8aMq7DevHfMDV3QCXCZbRr7YEzElRJZ9E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7D4DF8042F;
	Fri, 10 Mar 2023 14:24:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59EF2F8042F; Fri, 10 Mar 2023 14:24:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5ADE0F80527
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 14:22:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5ADE0F80527
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=EcdkKLJy
Received: by mail-ed1-x52d.google.com with SMTP id x3so20274254edb.10
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 05:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678454528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QzRJBCNcVjpu9L/kbF+2hC2cCPihdtDKgQqCKfLkPA=;
        b=EcdkKLJy1nTwum3RcqOoQuWYwXOTfdJDBoXZoGlsPRz+RQifnrYVz1k/AIC2yTH3kP
         PAnmohk20qiWOFcy52MPyBSEA3vRZhnu8a5EeLBWp2HO/jdushRsRoeblC62wseZHmj2
         AM/FT1KNCO8+4297rMkrfXyiFq51CbIERRp9royKeNIyfQ+C9mfQC2zjKXJoZFZdkfsk
         uLacUsy4mT9wFeo+mkYzixlOb05jWpBvrwxzbXGfg9BDanjJTT0Xm7Ze0FRkU6eX0u0K
         fe5zG01Nf/6Z/JRGzEapBHPsrftvvqUAcHyubUDAYc7IcugdLCH/6n4nGKfmVrRZFHTY
         02LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678454528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6QzRJBCNcVjpu9L/kbF+2hC2cCPihdtDKgQqCKfLkPA=;
        b=H5Ih7WFd3vJR7KZEgQGf1uB3R0Ig/5ilNfkwepB2kGH7S7OZP51rDYCkV0hL/WGJVF
         1EzqRlxUhBGqBIe2OS0G2/kGUAXmSk6LpO1cIDlEbjpB67sHi0yWIxoFrgsy+6ADT8Ia
         lv/u7bp2PIpAffWvLA+qTeXC6jNSfBIWKxOBkvH20xRMEchlff58wPcGo9vK9hC44Yn8
         GFTeV1ylUWJ4QJXz3oOwsoFE6+IHHYK0xLxFabO4y+KQ5nvM46fYq+BfpJsqev5sgW9y
         NqbamNTRMhdxm4dvY+lgMGb1VBrvr+taEKHyXdeaR9775Gk1Sf3yqQGkfkE5HfPOm4B9
         1+2Q==
X-Gm-Message-State: AO0yUKUDJ9Lua+YHZXtk22kzaZeFi7ujf0+N9vZngGWSVlTSfrxqQYbo
	JGI4SQ8KCvSh/h3zG9bWTu6zdA==
X-Google-Smtp-Source: 
 AK7set99KdhfosHhNhcHm7ZbsjvUuuCLY5QJ01+eSjocVmVnePPGrExvdnFHezzFcBtWwDhU9Pon7g==
X-Received: by 2002:a17:907:787:b0:8b1:7de3:cfb0 with SMTP id
 xd7-20020a170907078700b008b17de3cfb0mr32023701ejb.2.1678454528466;
        Fri, 10 Mar 2023 05:22:08 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:45c4:46be:ec71:4a51])
        by smtp.gmail.com with ESMTPSA id
 zc4-20020a170906988400b008b17879ec95sm959124ejb.22.2023.03.10.05.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 05:22:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] ASoC: dt-bindings: qcom,lpass-tx-macro: narrow clocks per
 variants
Date: Fri, 10 Mar 2023 14:21:56 +0100
Message-Id: <20230310132201.322148-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310132201.322148-1-krzysztof.kozlowski@linaro.org>
References: <20230310132201.322148-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FWZCTVBJ6UTA6O7F6OBU3VMOF7HEOUWP
X-Message-ID-Hash: FWZCTVBJ6UTA6O7F6OBU3VMOF7HEOUWP
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FWZCTVBJ6UTA6O7F6OBU3VMOF7HEOUWP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently the Qualcomm TX macro codec binding allows two different clock
setups - with (for ADSP) and without macro/dcodec entries (for ADSP
bypassed).  With more devices coming soon, this will keep growing, thus
rework the clocks/clock-names to be specific for each binding.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/qcom,lpass-tx-macro.yaml   | 63 ++++++++++++++-----
 1 file changed, 46 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index da5f70910da5..559da2509d8d 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -9,9 +9,6 @@ title: LPASS(Low Power Audio Subsystem) TX Macro audio codec
 maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
-allOf:
-  - $ref: dai-common.yaml#
-
 properties:
   compatible:
     enum:
@@ -30,22 +27,12 @@ properties:
     const: 0
 
   clocks:
-    oneOf:
-      - maxItems: 3
-      - maxItems: 5
+    minItems: 3
+    maxItems: 5
 
   clock-names:
-    oneOf:
-      - items:   #for ADSP based platforms
-          - const: mclk
-          - const: npl
-          - const: macro
-          - const: dcodec
-          - const: fsgen
-      - items:   #for ADSP bypass based platforms
-          - const: mclk
-          - const: npl
-          - const: fsgen
+    minItems: 3
+    maxItems: 5
 
   clock-output-names:
     maxItems: 1
@@ -67,6 +54,48 @@ required:
   - reg
   - "#sound-dai-cells"
 
+allOf:
+  - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sc7280-lpass-tx-macro
+    then:
+      properties:
+        clock-names:
+          oneOf:
+            - items:   #for ADSP based platforms
+                - const: mclk
+                - const: npl
+                - const: macro
+                - const: dcodec
+                - const: fsgen
+            - items:   #for ADSP bypass based platforms
+                - const: mclk
+                - const: npl
+                - const: fsgen
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sc8280xp-lpass-tx-macro
+            - qcom,sm8250-lpass-tx-macro
+            - qcom,sm8450-lpass-tx-macro
+    then:
+      properties:
+        clocks:
+          minItems: 5
+          maxItems: 5
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+            - const: macro
+            - const: dcodec
+            - const: fsgen
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1

