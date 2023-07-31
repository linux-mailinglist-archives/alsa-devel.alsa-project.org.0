Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AD9769224
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 11:46:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53C8D83A;
	Mon, 31 Jul 2023 11:45:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53C8D83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690796767;
	bh=HPMN2i+qLdFW3Tg/QoI4g2bYLcVheof0ayvC/JoOaxQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bgw4YExvcUvkG9HdSt4FLA0laiGYb0ujKLOQwCYfm2o/N46LomWs0dSOQZL6CqV//
	 LvTsCAHrnAcae6fXfubNmFi0oAjnjU00N0CYuHrMb2jEqOTy3FThQXtzy47apdc1eV
	 /O0QEB9kp6op+EIQpR2XWsEYDY7k2b35qzpiYpwY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E83F6F805BA; Mon, 31 Jul 2023 11:43:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A663BF805B0;
	Mon, 31 Jul 2023 11:43:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2ECBFF80558; Mon, 31 Jul 2023 11:43:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 01805F8015B
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 11:43:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01805F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=cQcWGSDw
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9923833737eso630457566b.3
        for <alsa-devel@alsa-project.org>;
 Mon, 31 Jul 2023 02:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690796605; x=1691401405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wru1VW4ElNQWwbcOi9qEWUoTt9rJrkxi91n6SS30Eys=;
        b=cQcWGSDwLdxq6R599X8W8DBqRHuUQ8TLEqRJdVpH+ad9PFCr2UnbMtcYleek6ZoOCI
         FVRgDKR2kHfjVYGCLkcl/rAZAB22kuyPcohETwQdscluc5L9m05Jff7UIqxl5a1qyQcb
         x7uikvpX2QobNa8Vem/M/kyHaCVV0ietA89zOVLby2150vsXNHLnCqtl3Nt4cQat43Oi
         8weD//QJ47qnCd2XAIV6nxsKkjeO4rynyJnz3TYOg1INHmHjLs1+rauPrfuvxY/rdY7x
         QMSjMpmzmchtdKaS/mVJwQNk/0wMuEP7pvgeaIII9ibFlpr3OhRiz4yW/S9tJuPIuvuQ
         WDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796605; x=1691401405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wru1VW4ElNQWwbcOi9qEWUoTt9rJrkxi91n6SS30Eys=;
        b=ide6+phnygfANlcl/Z4NhVhfm8Sb6za1UbVwSca9hzN3FGFEXODMnB28hvSbvyTegh
         9Dc4Y4FPLoMSr7yHh7b1N/eSYppxYKb5athvb1gxRqBa6LHuM2gpgzxoToOlB0fQPgWy
         C/krBiCiNqYnia7KRG53q7P0YGTyCTKcPfWTMRJellhHNJOyuYqQz8yv0nyIUJRR+5Jh
         cPNndykuvr7UIyuUBOEQjnrqwvrU+BqZhGVn1Oc2pl1dFLXIMfsfuqkxYnvi5WJx5Rw4
         R3+ddIBDDO80wpXz8nrqWcXO0cTKzqbW+lAziYY/zP/EmJZwFRd0i12FdRFYNUcTtDRb
         o/8A==
X-Gm-Message-State: ABy/qLZ45sTy6oGNi87N+Vf9Y27wkZZFEFaPYWx4V3ex5o/0D8+6OzrD
	Spd5dNIKEqrh6jDaM7144PK+kQ==
X-Google-Smtp-Source: 
 APBJJlFAH+HzXe9+VU+AK4McGXrg3AZIuVNaeiawk99F4JSYDsrh1HQUKcYS9HIu77uxpXdoyHV5Sw==
X-Received: by 2002:a17:906:7397:b0:99b:6c47:1145 with SMTP id
 f23-20020a170906739700b0099b6c471145mr6069053ejl.32.1690796605096;
        Mon, 31 Jul 2023 02:43:25 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id
 z17-20020a170906815100b0099bcdfff7cbsm5867547ejw.160.2023.07.31.02.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:43:24 -0700 (PDT)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 05/12] ASoC: dt-bindings: samsung,midas-audio: use common
 sound card
Date: Mon, 31 Jul 2023 11:42:56 +0200
Message-Id: <20230731094303.185067-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2VLEGUCBPRTCPTHB5N7KIOOM6RGDNBF3
X-Message-ID-Hash: 2VLEGUCBPRTCPTHB5N7KIOOM6RGDNBF3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2VLEGUCBPRTCPTHB5N7KIOOM6RGDNBF3/>
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

