Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD5177707A
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 08:35:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A85283A;
	Thu, 10 Aug 2023 08:34:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A85283A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691649305;
	bh=zwznNieYy81bMJXMYzEieqpnSPthsegPgUf+3D8L2b8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WABPj9lhKu/4+SELJVwgrbi0Z1w6Qxghdn7BLvF3egh0z/UKd3JpAHxMwhNm3XTk9
	 pnfTjBenDGmxqL64DZk4FQbwoC+GMjZuOgQHNxaG03fhHTwh6Y7h7+f1ohRUM24txA
	 PCbdWVJpQVflhTNsIvAI3Eyb9OCGykNY+BJqZl8g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFBCEF80567; Thu, 10 Aug 2023 08:33:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F2D3F80564;
	Thu, 10 Aug 2023 08:33:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB5A8F80549; Thu, 10 Aug 2023 08:33:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0362F80166
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 08:33:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0362F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xU/RO30v
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fe655796faso763982e87.2
        for <alsa-devel@alsa-project.org>;
 Wed, 09 Aug 2023 23:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691649188; x=1692253988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+hlC8d67YmntwV4mHtT3ZdGF2DLfbF3GgSUytsMD/g=;
        b=xU/RO30vWACYxqjtnyOxfTI3eJXujWzw/tOzIRF0AjoT3K3pqKUkKXyMg1cLZOOP3v
         /yaW305bxyPasG0lRF7V+44ce5JFDRMIfoTnxZeZfjcNWGkAAKBJfCMWWE/BxgFqkryh
         CHaNdvUeOra1W8UrXNDmgWCY+EkAOo/gHYitQwjbXaGsOJlE6ybXURT/L0xRlFZFceNp
         ZSBm7qtK88v0UuRLyz+nXh8MVuaPxzEq0FcRHmHV7R7OPfUFaYxJh0dsEzGQsK2PHSZD
         3lCkvhEqO/1yjUXL7T9lSyfklQFQW5cIKHgx1X8AI7lcbVQblucLHS3P12I/vKLtHG6Z
         no9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691649188; x=1692253988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+hlC8d67YmntwV4mHtT3ZdGF2DLfbF3GgSUytsMD/g=;
        b=aMdHUPVVXfbSHIkZ02gjYfV3F4LmpYtDZ0eVh7GM6eDoxEysr9HXaxuT79DjBhyLDp
         sleFm/EXEnEvfKFUiJhZfXa5DBd9P7cx1c/SIChfpVEtY0ftjawdZ/eeSfyv5JwhkNGi
         UjlfTugbQJiRzxwZCIfr66khSMxmnhdGC8CQiQ4Ly+OSZzkHbeRZFoT3ymsQG4JEfnW8
         H+bf89iJ/W6opLBkstEN1BCN+6GBQvpbfwhxTGLxsAVYPGSGwSSPQWZg3HowskUarzGo
         +5EA5MJz4Vz7zUQ+AX4a/IuwlNT9wouyZ8eFwKknOsoZuyU0ha9+oWvNw9SWz1VRvqo+
         bDiw==
X-Gm-Message-State: AOJu0Yx8f/ZZXs0+qWLPvhIRB5O3vVGAHFsLa78Qbm4yyR+rPnb8Ie/M
	pKyvJ6HJoK2yL9RDh96grynGNQ==
X-Google-Smtp-Source: 
 AGHT+IErGy790Xkb6/KzdX9Bvv40e18+/V59YRvZrbqtUlAQog8GWO8fIcwIyb/Yl5HGLGY7G2ICtw==
X-Received: by 2002:a05:6512:3483:b0:4fe:347c:874b with SMTP id
 v3-20020a056512348300b004fe347c874bmr907453lfr.8.1691649188761;
        Wed, 09 Aug 2023 23:33:08 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003fe2b6d64c8sm4020018wmc.21.2023.08.09.23.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 23:33:08 -0700 (PDT)
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
Subject: [PATCH v2 03/11] ASoC: dt-bindings: samsung,aries-wm8994: use common
 sound card
Date: Thu, 10 Aug 2023 08:32:51 +0200
Message-Id: <20230810063300.20151-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
References: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CLFB7OA6WZX4Z32E7ZURLX5A37JEUT4D
X-Message-ID-Hash: CLFB7OA6WZX4Z32E7ZURLX5A37JEUT4D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CLFB7OA6WZX4Z32E7ZURLX5A37JEUT4D/>
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
 .../bindings/sound/samsung,aries-wm8994.yaml     | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml b/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml
index 447e013f6e17..5ea0819a261a 100644
--- a/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml
@@ -9,6 +9,9 @@ title: Samsung Aries audio complex with WM8994 codec
 maintainers:
   - Jonathan Bakker <xc-racer2@live.ca>
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -17,10 +20,6 @@ properties:
       # Without FM radio and modem slave
       - samsung,fascinate4g-wm8994
 
-  model:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: The user-visible name of this sound complex.
-
   cpu:
     type: object
     additionalProperties: false
@@ -46,6 +45,7 @@ properties:
 
   samsung,audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    deprecated: true
     description: |
       List of the connections between audio
       components;  each entry is a pair of strings, the first being the
@@ -56,6 +56,7 @@ properties:
       or FM In
       For samsung,fascinate4g-wm8994: HP, SPK, RCV, LINE, Main Mic,
       or HeadsetMic
+      Deprecated, use audio-routing.
 
   extcon:
     description: Extcon phandle for dock detection
@@ -87,10 +88,9 @@ properties:
 
 required:
   - compatible
-  - model
   - cpu
   - codec
-  - samsung,audio-routing
+  - audio-routing
   - extcon
   - main-micbias-supply
   - headset-micbias-supply
@@ -98,7 +98,7 @@ required:
   - headset-detect-gpios
   - headset-key-gpios
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -121,7 +121,7 @@ examples:
         headset-detect-gpios = <&gph0 6 GPIO_ACTIVE_HIGH>;
         headset-key-gpios = <&gph3 6 GPIO_ACTIVE_HIGH>;
 
-        samsung,audio-routing =
+        audio-routing =
             "HP", "HPOUT1L",
             "HP", "HPOUT1R",
 
-- 
2.34.1

