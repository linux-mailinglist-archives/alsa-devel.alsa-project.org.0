Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F22366B709A
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 08:57:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E72651488;
	Mon, 13 Mar 2023 08:56:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E72651488
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678694270;
	bh=4MWTDB6xmkyQqDGTss3nKymH9mFKCDBJEw0bzXEALnU=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qCVjnl0xUD3lmiDywnruUG90M3XgNm3GtV269E2BMc/AbuN2w4jINqY+9NuTcR0tL
	 wzoxnMAOB5pkvo7EWDOBq6QKRgD8FuDttH0Ivsl9tj9WHq5rP1Jljyq7DKIbik88QG
	 Gq4ofBK4gLgqj56f2+eniPqfcLr9NOh5otOUeyJ8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E1A9F80423;
	Mon, 13 Mar 2023 08:56:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 242DAF80520; Mon, 13 Mar 2023 08:55:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02CBFF80272
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 08:54:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02CBFF80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=PZJTlA13
Received: by mail-ed1-x533.google.com with SMTP id ek18so13787081edb.6
        for <alsa-devel@alsa-project.org>;
 Mon, 13 Mar 2023 00:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678694091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BbnW+HQXXMov2YCkKGIA3Ip1jgaMjvv36rVivoZ/sxY=;
        b=PZJTlA13gQWFQFIrQIYA9l4hTDVIPGJzn7hnQUc6ArNl6Jh85UndmLYxMGd06xQnKC
         Dl/vQKHIjeTJc9i3UAV661s6QUgZ2dtyH0KjxxxOEpAbKaK0vlpJpfmxqCFxFUjaO0cl
         tKZoSkW4jcECGIRosDo9sc5bjUqXy4/Ou/vcYd7dRbLOrrf+ljTR42qxbPTWxOrVs3Nx
         +AWqyiWKadxq1taPKevOKDueaps4JoYjLCg46IWa9ZQxN455HqIKgp5eqlOrFunrGA/B
         UuFnS1/jBxO9hzW+uPmxt2d5spffpWoWCLM2wFt7taAdDsT4VzdXeGzriQZLM0malsm9
         566w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678694091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BbnW+HQXXMov2YCkKGIA3Ip1jgaMjvv36rVivoZ/sxY=;
        b=Q+dabWtKWWY70kGryZcFpmOchkm/Dt65oaqk2MWTwzBt51ZQdv1qDsR0yQ/VKcBaJ9
         ogXzsK18vpgm/elAjv3DFB2609XQOl/xGaa2xN06t0c1JcqbH4mqMRUSxx9fyH08Zqkt
         Pa0NQOvTOXLKdGjgozJI13z1XAXqzgehPV5iG0lANz/tz0ZlWluFXmEYv5n6dY+JpS0J
         +BwmcyPxDggGHj7zxnZevhuItIlcWDSQrvt24J8zvzhe9VTJr08EpAahvF9ZegW+1XPB
         DKIoZBD/qEow+0FaZGB5ge7dtiELEnV19ovbrt0gDIlqNPJzOSZ5hR/kZprMUC5mM/gS
         0nLQ==
X-Gm-Message-State: AO0yUKWku6hWWD7kKjO9l/129IhqzfEfBX8H/wn3oipr+YYpdNW4JRqG
	mYanypBeB+6vkB/qkI9XtpwKug==
X-Google-Smtp-Source: 
 AK7set+XOjPCtML5HmxF40axQsuv+8HUsC4sRrOwjJpKSU+H/Ylhp1qLJyift7RrPLPstpEjzVTcUg==
X-Received: by 2002:a17:907:1c1f:b0:884:930:b014 with SMTP id
 nc31-20020a1709071c1f00b008840930b014mr42208755ejc.6.1678694091073;
        Mon, 13 Mar 2023 00:54:51 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:f052:f15:3f90:fcb3])
        by smtp.gmail.com with ESMTPSA id
 g7-20020a1709061c8700b008b980c3e013sm3146943ejh.179.2023.03.13.00.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 00:54:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/9] ASoC: dt-bindings: qcom,lpass-rx-macro: narrow clocks
 per variants
Date: Mon, 13 Mar 2023 08:54:37 +0100
Message-Id: <20230313075445.17160-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GKEVJ7AZKCGKXHMPT7OUSSKZKFYQ2YOD
X-Message-ID-Hash: GKEVJ7AZKCGKXHMPT7OUSSKZKFYQ2YOD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GKEVJ7AZKCGKXHMPT7OUSSKZKFYQ2YOD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently the Qualcomm RX macro codec binding allows two different clock
setups - with (for ADSP) and without macro/dcodec entries (for ADSP
bypassed).  With more devices coming soon, this will keep growing, thus
rework the clocks/clock-names to be specific for each binding.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/qcom,lpass-rx-macro.yaml   | 58 ++++++++++++++-----
 1 file changed, 44 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index b0b95689d78b..8b3d617a9578 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -9,9 +9,6 @@ title: LPASS(Low Power Audio Subsystem) RX Macro audio codec
 maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
-allOf:
-  - $ref: dai-common.yaml#
-
 properties:
   compatible:
     enum:
@@ -34,17 +31,8 @@ properties:
     maxItems: 5
 
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
@@ -62,6 +50,48 @@ required:
   - reg
   - "#sound-dai-cells"
 
+allOf:
+  - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sc7280-lpass-rx-macro
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
+            - qcom,sc8280xp-lpass-rx-macro
+            - qcom,sm8250-lpass-rx-macro
+            - qcom,sm8450-lpass-rx-macro
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

