Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1E76CA5B7
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 15:25:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EC93DEE;
	Mon, 27 Mar 2023 15:24:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EC93DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679923525;
	bh=lqEvmh6EHwKALU7Jy5f0y6J1+5NjTKwWmRZ8VusSC7w=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oLHxPqnE/tDPlM45SQ4860/CykqHdmJhx92yc8Ojz8u+zDjeu4Jne+gqQBrYcXP7o
	 DEOY0Xowd8mLYL262JApXUEu2YyxNu4IYECzGTypIvkWLjLSpADe748mtLNCFW4o58
	 amurVLuwBsSeH9h1u5lZn6IdzKzyXevwAcpKTju8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE3DCF8055C;
	Mon, 27 Mar 2023 15:23:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A838F80548; Mon, 27 Mar 2023 15:23:26 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B582F8024E
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 15:23:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B582F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=nq3I2u66
Received: by mail-ed1-x52d.google.com with SMTP id cn12so36199260edb.4
        for <alsa-devel@alsa-project.org>;
 Mon, 27 Mar 2023 06:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679923394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5MmJ5LIwdnukpeI8mJdU12Zu69B4U+Xf4C7JlgmOHg=;
        b=nq3I2u663v6g+hfpctFjctJjj2P2BHhwH3JUz27R8TJHQoyTa8L6ddYJznEnRhnXwZ
         iHZ3lx0/DGDGJHm2LxoSXJp5KAu3YZ3ndp9iZOYxGm05B/wSVkh18lpp16CC8lojrean
         eMw0j7qhr5uCLlY7/wRwM/CH18GeS6oDkN1OIHJWat5uSqtMK5hIiMb1MNl7jKx3fuaa
         nYcL5kvR2Gcl1sjVB/xnFRuG6HUOWNlL2ndxGfhHNCeAMpgcEFvpw8/rEG3fBNQxExGw
         CZkjzeuvMzjCvKIavgiVRhWDb9rzbsag0JVgSNAyGgH1g9acJOiIvOSPad43WAHRf4Da
         nr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679923394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5MmJ5LIwdnukpeI8mJdU12Zu69B4U+Xf4C7JlgmOHg=;
        b=4aCQewx/50jscMCDrFgWShr900iPbxJNDsNCBe1/jiGGj5e3uLJad8RNwkGGxr6lO/
         62ZmhZgDGj5xGH/lRfRDWpyJhVG8iAya2+DmjFhs96Svt2gdUFo3n+PqQcMRaL93HIXc
         h5632kMsZAUpzE2yAFp9/PSBImCbuL7JcZu4+u0JetoeCCJIO9GTAkqbR5L5TmzABmBd
         B598aI5ctyBtRG/Wp2hA0wGsMnVyB8wTfwUresX7JIBnUZb1Df/nZk3vW0hVxNPne4uV
         3LN6nkR7+HYotnMUP+9FMGaPemCyV1q/AnWev8Ssb1KQ+2xcg6F+apbwLye9E4tfB9Yc
         MaLQ==
X-Gm-Message-State: AAQBX9deEKgJcSsJUQtKpbt+c9Bvml+zCotp7B5C2qhmR1lat3goQBGv
	/lzGtzYEC/SBucx6qGw1iJaf0Q==
X-Google-Smtp-Source: 
 AKy350al8tfsgucLaBgpfCROmShW0R0tsRa+vgjUucQMyp9m+vXhNpUNNVleYP6iUjqViS3XJbWahw==
X-Received: by 2002:a17:907:2099:b0:8b0:ad0b:7ab8 with SMTP id
 pv25-20020a170907209900b008b0ad0b7ab8mr12658198ejb.14.1679923394166;
        Mon, 27 Mar 2023 06:23:14 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:581e:789c:7616:5ee])
        by smtp.gmail.com with ESMTPSA id
 gy24-20020a170906f25800b00930445428acsm14286814ejb.14.2023.03.27.06.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 06:23:13 -0700 (PDT)
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
Subject: [PATCH v3 04/10] ASoC: dt-bindings: qcom,lpass-tx-macro: narrow
 clocks per variants
Date: Mon, 27 Mar 2023 15:22:48 +0200
Message-Id: <20230327132254.147975-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327132254.147975-1-krzysztof.kozlowski@linaro.org>
References: <20230327132254.147975-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CWLWWH627GLAM7LE63HUX7ADN4GQFBUY
X-Message-ID-Hash: CWLWWH627GLAM7LE63HUX7ADN4GQFBUY
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Patrick Lai <quic_plai@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CWLWWH627GLAM7LE63HUX7ADN4GQFBUY/>
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/sound/qcom,lpass-tx-macro.yaml   | 63 ++++++++++++++-----
 1 file changed, 46 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index 6c8751497d36..768757cd077d 100644
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
-      - items:   # for ADSP based platforms
-          - const: mclk
-          - const: npl
-          - const: macro
-          - const: dcodec
-          - const: fsgen
-      - items:   # for ADSP bypass based platforms
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
+            - items:   # for ADSP based platforms
+                - const: mclk
+                - const: npl
+                - const: macro
+                - const: dcodec
+                - const: fsgen
+            - items:   # for ADSP bypass based platforms
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

