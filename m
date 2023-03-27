Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 439976CA5AD
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 15:24:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 335CFA4F;
	Mon, 27 Mar 2023 15:23:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 335CFA4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679923480;
	bh=NP7BCGCNL7n4GRCa962Its4zKLmpEpUJ3ppACWRIS20=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fy9dekkqntfRY1CLjauVR1xapuHezUbr/KE0mn5bUakSAU+hqv8AjdQVYxRIDH1i7
	 jQXM6DOQn6mTwDQ6upaPx6wFCsM40jLsCeOESOuByOkkB58dOOg7mPdLm/EcCVsQmZ
	 jOCTap740JwBkekttQWmZqHmU8dP4zqZVj/SlbY4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2710DF8032D;
	Mon, 27 Mar 2023 15:23:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4064DF8053D; Mon, 27 Mar 2023 15:23:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A47FFF8052D
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 15:23:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A47FFF8052D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=akAiH7pl
Received: by mail-ed1-x52b.google.com with SMTP id r11so36175446edd.5
        for <alsa-devel@alsa-project.org>;
 Mon, 27 Mar 2023 06:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679923390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e421JpAgtcj35xxGor304AnW+bBd7rGQURUOK2VJ37c=;
        b=akAiH7pl4TdiU8GfXv8e6OE8VWx0BOmVeSEVMrMxAumMPQaq31ovkNETTy2tbypyte
         sMAoyr9XqjX6T1UPK3WknPc5cdt0+Dt81i/jnP5qpxc8BlEpFNPsgPi2tozwojytXdVQ
         n0OjusJ98ZRfe1sFUVwtms334CyF3zcLMapfX3fP5Q7P/jw4e8pV1ukg51yRETyHNAu6
         NI02e9SibLwazaIicB6GKOK0p4QEG3JekcDk1wwUd/X5AF4lYbyiB0+3GBbD+GHlCH5b
         UILB/LpeuJ7CPHL0VbGhRLJ7r1jdH9Wu2vRvyxxTEssqEsRUL6YLrt0C4ajrcuxD9RYk
         zZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679923390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e421JpAgtcj35xxGor304AnW+bBd7rGQURUOK2VJ37c=;
        b=tD77ymetSu4xKl1dpbBMUWeZ3BchCMMTpUjnCQSN7y21l768PlfEaxCNoo46eKR4nI
         95r7y2PfoZKTZswdXXOZVBbKK1xCCtWLYFZ1jGKTjV9hcRcWaX97e4V/12CH1HZZw0xX
         NufY+yWS2A5IztcrYk1t94D6YVYYyDK05vMTvFjOXxzWBHaDKBIGpe5Icu7z3Iyz7z9+
         GBDE42iuop1usu5SNsqKNqYw951YgbAtWhv3qKW2VovVN69HA4JZpocMLLuIqaHlWewq
         altoV+s36GctMY6VaUOLZDIw2CTQyUX1lp8ul+wQwclK5V7L/ISNa7suhgDme3eErGSw
         z71w==
X-Gm-Message-State: AAQBX9ekd72jJe4+lJpYUhqsr55xTVY1A+LjU0sKZtntybJ90BEcuMeg
	T5YjROIbG+mphUuRglVvBiBEWw==
X-Google-Smtp-Source: 
 AKy350a6zAoEdc3Kk4j3D/eb33jJfnMnx4zobkxrPu+I0OJc/j5b8+NbvNQDSHYROdnJLVNhzgVkTA==
X-Received: by 2002:a17:906:b74f:b0:92d:591f:6586 with SMTP id
 fx15-20020a170906b74f00b0092d591f6586mr12645246ejb.34.1679923390257;
        Mon, 27 Mar 2023 06:23:10 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:581e:789c:7616:5ee])
        by smtp.gmail.com with ESMTPSA id
 gy24-20020a170906f25800b00930445428acsm14286814ejb.14.2023.03.27.06.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 06:23:09 -0700 (PDT)
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
Subject: [PATCH v3 01/10] ASoC: dt-bindings: qcom,lpass-rx-macro: narrow
 clocks per variants
Date: Mon, 27 Mar 2023 15:22:45 +0200
Message-Id: <20230327132254.147975-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327132254.147975-1-krzysztof.kozlowski@linaro.org>
References: <20230327132254.147975-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UDLN5B6XFWBL7URV3V26PRZLTCY4VRER
X-Message-ID-Hash: UDLN5B6XFWBL7URV3V26PRZLTCY4VRER
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UDLN5B6XFWBL7URV3V26PRZLTCY4VRER/>
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/sound/qcom,lpass-rx-macro.yaml   | 58 ++++++++++++++-----
 1 file changed, 44 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 009105275368..babf2ac20afb 100644
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

