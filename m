Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB2377707B
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 08:35:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F5B284D;
	Thu, 10 Aug 2023 08:34:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F5B284D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691649312;
	bh=geqmsyc+0mVDYnZOSrN6WA7NBKclkWqkXmiCKakRLL4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M+VqTrPL009E3YiuJBEZ0nd4JOA6KTj+bqPsZZt3FIfsE7VBqt544GE5MP5eabnlD
	 dwaEKcR+FQio60V1jShfZWKSI+U48gEfONtIBk5jsXNnbNGuvAvy+ZA/EVbILWQKAm
	 DKCpVYKWajsIW8M6v7rRewkMvfy70DF3r+kI51do=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17E37F8055B; Thu, 10 Aug 2023 08:33:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13D45F80508;
	Thu, 10 Aug 2023 08:33:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F388F80570; Thu, 10 Aug 2023 08:33:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A441F8016E
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 08:33:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A441F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=XVBoF8/y
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fe5eb84dceso4801375e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 09 Aug 2023 23:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691649191; x=1692253991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYTzTb8UrxRc66FImFP9rRfhwslszsfgsuSxr/7YLlU=;
        b=XVBoF8/yUIY8PYBHbJ0Z7j3ZbEFoK9XkPKGih+mU3xS6CHBVaV+E0rs9k7VHhJNUqY
         woMLWZioH8QrrAqWcuFhR9m5Vu0Iq8ia7WIu7aVeqrcjYHU2WD48Hz4jAjqaHVTBvejV
         gpaUjTWl2Fnuyq4TyzmmTDFvks/qHg6YwnFTwFmuQLKbLhwrkf5EUQ9F5chIaUg5yj4G
         LdyaY3nW5radp2afOmQ388Arp2Km9PsKOFERYVJcnhs6gccUF7rMee8rqyenPJ4yiOnU
         3MWV60QVUcPvc4ieNtbGjzC8Ga6jPurlMbqxkTSkixHbUqV75zBWK+bc7IN4+fcp4Q72
         S1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691649191; x=1692253991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jYTzTb8UrxRc66FImFP9rRfhwslszsfgsuSxr/7YLlU=;
        b=XCXEeYEY1YoffDazxxIQS8XBdWRnhe7ZOTTITsZIq6CJyPZo5FuJlvaO7XydauiLpu
         vFfWbzwBF1tO7W71TP2PAdw4uWQ3TX+dib/dpgtjCJGf5O9JIAPeE+Mq3rXv0/Vu9XxV
         90T9FAhq5Rl22RJbBZGTN/aoMz7oqW6V/+1zGzRkFKAqZ4+P5cRIvm98h9zRbc2B3Ibl
         GjICghYYW0VJcNx7Y3nc7RKbN5Tp0necqEUtKCGiVPisdZYEddCK37SANboXN9/8hWgy
         6eI/4cFP8wEnGGggfVqWqGF4meNg1mcVbSCEoZKkuVpdEUVWDN6edVCEd42DezJl7S9o
         rL9A==
X-Gm-Message-State: AOJu0Yy4zXV9UvniPbL1DrPpuq3qCeehKEEdWZKuztMexhFsQZI+DYFH
	R3oM0STeVhUeFddZOJASkfPyNw==
X-Google-Smtp-Source: 
 AGHT+IEqJ1GJ3dbmjoju3DRXle+Ph5P/SXAKqQihojhMe01unHEJ1z2+BYJ7yRiSfY0mY+2UQE9aOA==
X-Received: by 2002:a05:600c:213:b0:3fa:934c:8356 with SMTP id
 19-20020a05600c021300b003fa934c8356mr1122754wmi.10.1691649191009;
        Wed, 09 Aug 2023 23:33:11 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003fe2b6d64c8sm4020018wmc.21.2023.08.09.23.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 23:33:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Rohit kumar <quic_rohkumar@quicinc.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Rao Mandadapu <srivasam@codeaurora.org>,
	Judy Hsiao <judyhsiao@chromium.org>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Jonathan Bakker <xc-racer2@live.ca>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 04/11] ASoC: dt-bindings: samsung,midas-audio: use common
 sound card
Date: Thu, 10 Aug 2023 08:32:52 +0200
Message-Id: <20230810063300.20151-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
References: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: W7A53VE47C5NJWWLSV7FY4MIN2LEIQOK
X-Message-ID-Hash: W7A53VE47C5NJWWLSV7FY4MIN2LEIQOK
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W7A53VE47C5NJWWLSV7FY4MIN2LEIQOK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Reference the common sound card properties and deprecate the
custom "samsung,audio-routing" in favor of generic one.  This allows to
remove "model" property and make the binding closer to other sounds
cards.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/samsung,midas-audio.yaml      | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
index 31095913e330..6ec80f529d84 100644
--- a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
@@ -9,14 +9,13 @@ title: Samsung Midas audio complex with WM1811 codec
 maintainers:
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
 properties:
   compatible:
     const: samsung,midas-audio
 
-  model:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: The user-visible name of this sound complex.
-
   cpu:
     type: object
     additionalProperties: false
@@ -38,6 +37,7 @@ properties:
       - sound-dai
 
   samsung,audio-routing:
+    deprecated: true
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
     description: |
       List of the connections between audio components; each entry is
@@ -45,6 +45,7 @@ properties:
       being the connection's source; valid names for sources and sinks are
       the WM1811's pins (as documented in its binding), and the jacks
       on the board: HP, SPK, Main Mic, Sub Mic, Headset Mic.
+      Deprecated, use audio-routing.
 
   mic-bias-supply:
     description: Supply for the micbias on the Main microphone
@@ -62,14 +63,13 @@ properties:
 
 required:
   - compatible
-  - model
   - cpu
   - codec
-  - samsung,audio-routing
+  - audio-routing
   - mic-bias-supply
   - submic-bias-supply
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -84,7 +84,7 @@ examples:
         mic-bias-supply = <&mic_bias_reg>;
         submic-bias-supply = <&submic_bias_reg>;
 
-        samsung,audio-routing =
+        audio-routing =
                 "HP", "HPOUT1L",
                 "HP", "HPOUT1R",
 
-- 
2.34.1

