Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E46206B70BB
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 09:00:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D721914B1;
	Mon, 13 Mar 2023 08:59:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D721914B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678694400;
	bh=fKbiEXDschISZbDjW6hzu3bB/M7LVonJ1Y9FKmZPDpU=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JzqYDcPkSqfowNeWcgdG5bDun8EwFLrhWvH37x6poN6NBYqsjOSAj2mqZMuvwooag
	 vU72/Fo6Z52Km+7et+lHVdRaithP6xPP8gPF3teF1GfZfhBNYi8ousFGZSPk6DISCL
	 Vjfz54Y4lLBlvFjSM1cN0mUGbU6HAds+oaQymUX4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD327F80564;
	Mon, 13 Mar 2023 08:57:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B19A7F80425; Mon, 13 Mar 2023 08:55:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B0806F80272
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 08:55:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0806F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=PuuKK426
Received: by mail-ed1-x532.google.com with SMTP id y4so15455054edo.2
        for <alsa-devel@alsa-project.org>;
 Mon, 13 Mar 2023 00:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678694099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZM2NPsZ49ia+Dqe6wkMeZpgWpRvBEKr1bmuDVGwMmU=;
        b=PuuKK426W4imrwcVdY2+9oec5UOV7dMbuPit+w09Q5znpU3IvnzN31Md9Jt84L3yRS
         qHPHUvh3ZoTJBYGGv6FbQlLSOjRFXfkXVO5SltxbeVBxlIV9Y2+en8X9iLuW7cYkbt/J
         CZY0anSrcerNb0evrSZ5m2L2jdiAm/CwWnJP8GYxPDHtvO5ypw5+xtUyxPx9tJzEg04+
         2p0HKI4GlxvIrgPOlXonZyBsWvcneKOEIuEdIXkzI6EUUNzmfld0SolHsLCLG7gNa/xc
         /o/4fUs4R9PplJSeh2FROUvJMN8N5Xh7jQz+IBD1hfNvK7pFFKabTx1pJzrLs70M31UH
         dY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678694099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZM2NPsZ49ia+Dqe6wkMeZpgWpRvBEKr1bmuDVGwMmU=;
        b=qBF4lb9fbFFZfmASbSxZD4YBqPEJkbZjKiJX5PCda6fyjkx+c72AOUvJLOAut2Ptvf
         6ZVSQ09DU7obc45GuxPkxxESddjJptmsWwUculjDw8O86sPf6deA7rI5Iw9F3Y7I7GmY
         X1gY4pGlyqp93XXGv4yMytEIpdnumAuv2l7atHpzdJwjAY6XU6DkyyGrc/0+flAvqROw
         87/WxO10vrPzdGbMxmsxFQZn8fhW7/wlZ3F0QTIiC+W22P+bis8CLLyQKo5exTkl8Vka
         enaem4koi0cno2LsNU5QB85eWN2JnrpXDFmTnCMNL9bYOWdl5At7JLkBMPJeqZZy4p+u
         6eqg==
X-Gm-Message-State: AO0yUKUV53zsZY8g6OFqUySOZnRtWURoiyg4fD4iEgApi8ifU3FNm9me
	BF8WeeZhJ28SiU48oa+2d/SH7g==
X-Google-Smtp-Source: 
 AK7set/ICSE0O0CNa7vtYNTO3uo0GeeelaS/IRUydnhV6hPEiui9VXdhuM6fAUeREn+KKFTmps6wvg==
X-Received: by 2002:a17:907:1b1b:b0:92a:abe7:a9fe with SMTP id
 mp27-20020a1709071b1b00b0092aabe7a9femr1671996ejc.74.1678694099110;
        Mon, 13 Mar 2023 00:54:59 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:f052:f15:3f90:fcb3])
        by smtp.gmail.com with ESMTPSA id
 g7-20020a1709061c8700b008b980c3e013sm3146943ejh.179.2023.03.13.00.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 00:54:58 -0700 (PDT)
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
Subject: [PATCH v2 8/9] ASoC: dt-bindings: qcom,lpass-wsa-macro: Add SM8550
 WSA macro
Date: Mon, 13 Mar 2023 08:54:44 +0100
Message-Id: <20230313075445.17160-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230313075445.17160-1-krzysztof.kozlowski@linaro.org>
References: <20230313075445.17160-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YJKIZ53K5B4YDYERF4P6BYFLACUGGQG7
X-Message-ID-Hash: YJKIZ53K5B4YDYERF4P6BYFLACUGGQG7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YJKIZ53K5B4YDYERF4P6BYFLACUGGQG7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the WSA macro codec on Qualcomm SM8550, which comes without NPL clock
exposed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/qcom,lpass-wsa-macro.yaml  | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
index 66cbb1f5e31a..eea7609d1b33 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -15,6 +15,7 @@ properties:
       - qcom,sc7280-lpass-wsa-macro
       - qcom,sm8250-lpass-wsa-macro
       - qcom,sm8450-lpass-wsa-macro
+      - qcom,sm8550-lpass-wsa-macro
       - qcom,sc8280xp-lpass-wsa-macro
 
   reg:
@@ -27,11 +28,11 @@ properties:
     const: 0
 
   clocks:
-    minItems: 5
+    minItems: 4
     maxItems: 6
 
   clock-names:
-    minItems: 5
+    minItems: 4
     maxItems: 6
 
   clock-output-names:
@@ -62,6 +63,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 5
           maxItems: 5
         clock-names:
           items:
@@ -89,6 +91,23 @@ allOf:
             - const: va
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm8550-lpass-wsa-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: macro
+            - const: dcodec
+            - const: fsgen
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1

