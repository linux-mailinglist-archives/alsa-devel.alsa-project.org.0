Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 235CE6CA5C4
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 15:26:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6872ADF0;
	Mon, 27 Mar 2023 15:25:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6872ADF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679923591;
	bh=8+7ZfJZWDMSZ9hqwvRzhzMklbecv9T5cMsXIdY7TVSc=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GmBsWbSJYh+LCDnAcXp2UkbmyDamxA7+u5Rby8U+p8bIWNZMfQkC5KkMtnpRiAfiH
	 TgPtFijtDZElti75jMSkJx72/5DWtmA3oLFMMzsFT4rWKjZK0XoxGGr+yF/5gUnZ6f
	 VQOgB9qbOFpmTiGGABQR5lBMWICUb08ZVSmUqEpU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11C97F8059F;
	Mon, 27 Mar 2023 15:23:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1795BF80534; Mon, 27 Mar 2023 15:23:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E79A1F80529
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 15:23:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E79A1F80529
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RZXlVVY9
Received: by mail-ed1-x52d.google.com with SMTP id cn12so36199952edb.4
        for <alsa-devel@alsa-project.org>;
 Mon, 27 Mar 2023 06:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679923397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zotVF1vk8cf0n9qfIQsldz0TvwmtvVtz6i/QGqtiNB4=;
        b=RZXlVVY98CsmmymWEux1eeEzaPJtEOhvQlMjtFdXkZtQ4onrGSqLLbfamI0HRVVgLo
         v979bUvbkaqVz/L/BQGQZSJYVdziptnr/49Qz6COvrMrnpMJNYmO7oMIjYHaWdlO86Z9
         0f301yUxSS2uft4YvFAS48KOqRqhyZHDmivfTgBUFqjwD76pQhFFvTPynSnVv7a+VjHf
         24O1KlUGmOaeQJBwrQGZhuG7vhRib6LyQmpIas9P2DwAGy4FNSuiP6mM1L8O75OBEYEI
         FpRTDPgEwVbWa9pyH2+02TZa/naht7LdL0AHIgQG3qTqGOzqafzNQzW24lubkL1U9UZm
         VIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679923397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zotVF1vk8cf0n9qfIQsldz0TvwmtvVtz6i/QGqtiNB4=;
        b=uYekjqXJS7T201jvCvr3ZcRQvHuSSQ/q5+vX9l6PD99H32iD+a2Ntv9aH71bSDbzhC
         yp6JJGqI4eK1WWnV0Z7LZL8TFgad2jVTMjfATzrpM0CKy0UfcLcV/rTub3ObkL2ACAAy
         E9LPf0CDa7YREvq9e6uDItU3IWfIYDzbXwdvYor8FHPW+1UhwSuyFSJjJhTgh6+45NL1
         0QOHurA27AQv3/dKWrTdZ/S077uVN3rhgU09ie/NMA9+bhIulHCg8mdMYD0sXoRLMOL+
         b2gOD/0FsIZPLY7+TPUHcWpTJpcjGB21fwG//TVsojjNKhcaD5MxcvGp+3KXbxrpzooy
         3MdQ==
X-Gm-Message-State: AAQBX9esLYQbsU1pNRAiIKQczUsPSXlc+KKJtSsylM0QakX/3TpxJFgs
	P701VFUIYPlFLT7XrFcGL8sjpQ==
X-Google-Smtp-Source: 
 AKy350YjtYsJ0rNq+/jhDt2fT6bOmhA22R1GkeWePQSUOJCOZ2R0MJFzEUSA2EvY61UoGqlwzq/UtQ==
X-Received: by 2002:a17:906:1c19:b0:92b:f118:ef32 with SMTP id
 k25-20020a1709061c1900b0092bf118ef32mr12168020ejg.48.1679923397571;
        Mon, 27 Mar 2023 06:23:17 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:581e:789c:7616:5ee])
        by smtp.gmail.com with ESMTPSA id
 gy24-20020a170906f25800b00930445428acsm14286814ejb.14.2023.03.27.06.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 06:23:17 -0700 (PDT)
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
Subject: [PATCH v3 07/10] ASoC: dt-bindings: qcom,lpass-va-macro: Add missing
 NPL clock
Date: Mon, 27 Mar 2023 15:22:51 +0200
Message-Id: <20230327132254.147975-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327132254.147975-1-krzysztof.kozlowski@linaro.org>
References: <20230327132254.147975-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CPBLY7W3Y3NNMU4HCPGKV6E3HFGZZODK
X-Message-ID-Hash: CPBLY7W3Y3NNMU4HCPGKV6E3HFGZZODK
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Patrick Lai <quic_plai@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CPBLY7W3Y3NNMU4HCPGKV6E3HFGZZODK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Several devices (e.g. SC8280XP and SM8450) expect a NPL (Near Pad Logic)
clock.  Add the clock and customize allowed clocks per each variant.
The clocks are also required by ADSP in all variants.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. New patch.
---
 .../bindings/sound/qcom,lpass-va-macro.yaml   | 68 ++++++++++++++++---
 1 file changed, 57 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 61cdfc265b0f..528b677a439c 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -9,9 +9,6 @@ title: LPASS(Low Power Audio Subsystem) VA Macro audio codec
 maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
-allOf:
-  - $ref: dai-common.yaml#
-
 properties:
   compatible:
     enum:
@@ -30,16 +27,12 @@ properties:
     const: 0
 
   clocks:
-    maxItems: 3
+    minItems: 1
+    maxItems: 4
 
   clock-names:
-    oneOf:
-      - items:   # for ADSP based platforms
-          - const: mclk
-          - const: macro
-          - const: dcodec
-      - items:   # for ADSP bypass based platforms
-          - const: mclk
+    minItems: 1
+    maxItems: 4
 
   clock-output-names:
     maxItems: 1
@@ -63,6 +56,59 @@ required:
   - compatible
   - reg
   - "#sound-dai-cells"
+  - clock-names
+  - clocks
+
+allOf:
+  - $ref: dai-common.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sc7280-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          items:
+            - const: mclk
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8250-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: mclk
+            - const: macro
+            - const: dcodec
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc8280xp-lpass-va-macro
+              - qcom,sm8450-lpass-va-macro
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
+            - const: npl
 
 unevaluatedProperties: false
 
-- 
2.34.1

