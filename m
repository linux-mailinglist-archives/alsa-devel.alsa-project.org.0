Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9456B4055
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 14:24:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E21EF17F7;
	Fri, 10 Mar 2023 14:23:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E21EF17F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678454676;
	bh=4MWTDB6xmkyQqDGTss3nKymH9mFKCDBJEw0bzXEALnU=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Im9p5C2jqlFtBAn5Izydn4xyl+1k1q+yXY3iF4m6ZoxTszICoFaKlzJZQ5TMQJ28d
	 dYGqKjX57zwmpRbGEvRph8kkgAXNDMszHItu4OzDu432lqIKIB8kSoMe/07y5UNa87
	 4BzyU06Cp3vwceqC0HvIhHsX1SViexTFQp/W9o7Q=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 60161F80548;
	Fri, 10 Mar 2023 14:22:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5310F8052E; Fri, 10 Mar 2023 14:22:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CA30F80093
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 14:22:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CA30F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jp1ewdyS
Received: by mail-ed1-x529.google.com with SMTP id cw28so20368133edb.5
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 05:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678454525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbnW+HQXXMov2YCkKGIA3Ip1jgaMjvv36rVivoZ/sxY=;
        b=jp1ewdyS3iKqffGyu1oG2Jm5BRpT1kO1nx77XSIFlV38VmHYOe38jBFOoVttHRTNe6
         Roumacgk5N0FLiJzU1TCG67mhTvBAtUq2SY9pgVF8aeoZlfmWmQ3bBfYSzNQtJUahwkv
         6GuIe/C+sTi5cKK2iaJgaC1NfPxcgD7jE6I0cagnZHfqfW5Yiq1DG6rjMeQ0KBSW1tTj
         jLv6XmhE5Yhr+PORyykLpu3JaCfhuVclH4fH0S5t02UkST8thCLJSoRBot0XGvnTx4rw
         2ivclRZvIL8g1fJ1UxDjcLRgvaYb5D1YveDZvT5HdTAvvcZXMtIMGE2DM9jfRCI39u3c
         nE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678454525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BbnW+HQXXMov2YCkKGIA3Ip1jgaMjvv36rVivoZ/sxY=;
        b=t3h2H9ZxLL6g2dfYsBc/zqli8ebUrGGtrLjaF2rccNpHh+K/XLKSuENqbIzNVMMRsg
         ARCHMGpoSpzg/xg4KPXXWglUUKTUKonjPrTdeDkS/AWtb+HlICkJpHMaQCozPSs/rqQv
         ahmeX4pHkJ+Xev58FdV+9wIFjrllsPsmiHl4W+jEqUA9orwL54pc3WBaL5yg+jmG8/QT
         lRRh8H2WfQ0ppO4Tc+8x1ZkdCHoGSmgB8BlFQz6xNS9UUzRVceDdY00beNR7tvxWAggI
         m5ChlIl9qYCuqaw+A9FrJp1nH0Lw5d5I5ZeTblZynOnhtDmU5z7u8J5yv7ZNydsWgS3C
         Avmw==
X-Gm-Message-State: AO0yUKVuR63CZ76REQ0zJ/OSD6SMRXu4XSnjM+C4/Av6e2BApPqvEPDZ
	dEb6o1iTo1J+k40PZbuJFgTmOg==
X-Google-Smtp-Source: 
 AK7set89bwlmiWBuUwrH1uGGkGVacmOgb9VNWvOfJbCJIbNr2Ma9v0H90OaSF5yRm6toBSO+Hozexw==
X-Received: by 2002:a17:906:eecc:b0:90b:167e:3050 with SMTP id
 wu12-20020a170906eecc00b0090b167e3050mr31863715ejb.36.1678454525311;
        Fri, 10 Mar 2023 05:22:05 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:45c4:46be:ec71:4a51])
        by smtp.gmail.com with ESMTPSA id
 zc4-20020a170906988400b008b17879ec95sm959124ejb.22.2023.03.10.05.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 05:22:04 -0800 (PST)
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
Subject: [PATCH 1/9] ASoC: dt-bindings: qcom,lpass-rx-macro: narrow clocks per
 variants
Date: Fri, 10 Mar 2023 14:21:53 +0100
Message-Id: <20230310132201.322148-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310132201.322148-1-krzysztof.kozlowski@linaro.org>
References: <20230310132201.322148-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SKCOCZE2NOQQSVIFHR3HJOCRGFCRAAWE
X-Message-ID-Hash: SKCOCZE2NOQQSVIFHR3HJOCRGFCRAAWE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SKCOCZE2NOQQSVIFHR3HJOCRGFCRAAWE/>
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

