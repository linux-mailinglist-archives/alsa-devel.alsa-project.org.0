Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBE276921A
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 11:45:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1A31843;
	Mon, 31 Jul 2023 11:44:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1A31843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690796711;
	bh=ucC0BnqpGcobNW8PV9d2Ug8y4nxsFd3XStqyaFISASo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NipTHwsUR+yJ6F0dF7Da8eYso9a5QcurE7/Cmtuge2KPsyou8td1Nl6ASIOv3ka6f
	 rMkLkz1xSY6MJVd1glDDRg9ogIG5XKtCrFDyGX2iJ33L4NMSQGH7jpXxJrZeor3QI2
	 h3VF3x68J5Wmf3q0J2ESHh3YyEw6c+zebn6d8Ke0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1440DF8015B; Mon, 31 Jul 2023 11:43:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E146F8055C;
	Mon, 31 Jul 2023 11:43:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDFBAF80552; Mon, 31 Jul 2023 11:43:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C54F6F80149
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 11:43:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C54F6F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=fa448jy2
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-99bc512526cso684423966b.1
        for <alsa-devel@alsa-project.org>;
 Mon, 31 Jul 2023 02:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690796597; x=1691401397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEyaJ9DgVVV+c0AfkmYQXBEqJGJ4zcTJQzB2dw0oboM=;
        b=fa448jy2NEUSDchmC0NYC0WDxE7amKdAbkuR5jMOBA7yla1ux1uwVBrMdSf8p/vREI
         JGf8aI5ZKzEnMUBVnSDeY5h2pzFzV2z5IXU7wZViic7SnYEXOswDmrh4oRO/VqH9zwHX
         jEalJU0lK+OnevuFMp7hgme8i3MmVw5smAsSxG5hzM2ddNj6AXrd6AFALNnNqdMkANGh
         nvMZ2CtB/Mz3ScvUWLTxMwHd0O+DOGgz7Wbjk54ucaXh1nQAtT3z4dhRz95TVGoc9vg9
         pzwdlcOAwz1Bk/qjcUgqL/gcGvYEVZdF9OhytMjuepTo1JK4rgtUaKnYznZz66jfOE3G
         CNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796597; x=1691401397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JEyaJ9DgVVV+c0AfkmYQXBEqJGJ4zcTJQzB2dw0oboM=;
        b=F5St3Sow/knshyDdD39pXYUrh7EY6PgRVcvBWi5FdBA1UrVkTQrqh/GD2gCAfrjwSL
         KNJv1fWDiHtn+2gmf4jWtRjTwN90BSg6pwywh28fynHl4vk/K/GyZEuJOfqqXWaAv4W7
         2saz0M2ymUw5f0Sivi4kLu5vFxL98760gZgzIj/fWiCcvl1rJS+iu8WZ3Jpu/p+2iyY8
         1Qv1xPanHO+jl0ZjcPJTHmQuWsLhCjNYl6k5l9TWnB07eIHEgj2DTfl/8r4vXmCF8lIB
         lMF1ih53N0JKvCjBy/tB66Bnd0OKGspI5LHEWx322jEGuCoKcMVA9rnxWcIKunz0UrAc
         G86g==
X-Gm-Message-State: ABy/qLYFO02w5tnqAnQa8E1Um9WswrwZOk3L2jSxpgkZPcmUv33LB6cu
	sykIqzd8nv+19r424muscZDuMw==
X-Google-Smtp-Source: 
 APBJJlExPjonnH5U7Bei0/nN+O3jQbS4RoPQEJuS00211nRnG7KjBF6o4HXYh3QZ/49/ezQIOr3+Aw==
X-Received: by 2002:a17:906:2216:b0:99b:57f0:68b5 with SMTP id
 s22-20020a170906221600b0099b57f068b5mr6986441ejs.75.1690796596803;
        Mon, 31 Jul 2023 02:43:16 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id
 z17-20020a170906815100b0099bcdfff7cbsm5867547ejw.160.2023.07.31.02.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:43:16 -0700 (PDT)
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
Subject: [PATCH 02/12] ASoC: dt-bindings: Add common sound card properties
Date: Mon, 31 Jul 2023 11:42:53 +0200
Message-Id: <20230731094303.185067-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UH6V6CBVY537BC7ZLU75U3UATV4TAG67
X-Message-ID-Hash: UH6V6CBVY537BC7ZLU75U3UATV4TAG67
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UH6V6CBVY537BC7ZLU75U3UATV4TAG67/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Almost every board machine / sound cards has "audio-routing" and "model"
properties, so move them to common schema to have only one definition of
these properties.

For amlogic,gx-sound-card, leave the "audio-routing" constraints in the
original binding.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../sound/amlogic,axg-sound-card.yaml         | 15 +++--------
 .../bindings/sound/amlogic,gx-sound-card.yaml | 14 +++-------
 .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 17 +++---------
 .../bindings/sound/google,sc7180-trogdor.yaml | 17 +++---------
 .../sound/google,sc7280-herobrine.yaml        | 17 +++---------
 .../bindings/sound/imx-audio-card.yaml        | 18 +++----------
 .../bindings/sound/sound-card-common.yaml     | 27 +++++++++++++++++++
 7 files changed, 50 insertions(+), 75 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/sound-card-common.yaml

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
index bf1234550343..5db718e4d0e7 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
@@ -9,6 +9,9 @@ title: Amlogic AXG sound card
 maintainers:
   - Jerome Brunet <jbrunet@baylibre.com>
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
 properties:
   compatible:
     const: amlogic,axg-sound-card
@@ -17,23 +20,12 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: list of auxiliary devices
 
-  audio-routing:
-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-    description:
-      A list of the connections between audio components. Each entry is a
-      pair of strings, the first being the connection's sink, the second
-      being the connection's source.
-
   audio-widgets:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
     description:
       A list off component DAPM widget. Each entry is a pair of strings,
       the first being the widget type, the second being the widget name
 
-  model:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: User specified audio sound card name
-
 patternProperties:
   "^dai-link-[0-9]+$":
     type: object
@@ -108,7 +100,6 @@ patternProperties:
       - sound-dai
 
 required:
-  - model
   - dai-link-0
 
 unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
index 45d6202d9730..9c6c4c0fab88 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
@@ -9,6 +9,9 @@ title: Amlogic GX sound card
 maintainers:
   - Jerome Brunet <jbrunet@baylibre.com>
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
 properties:
   compatible:
     items:
@@ -19,13 +22,8 @@ properties:
     description: list of auxiliary devices
 
   audio-routing:
-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
     minItems: 2
     maxItems: 32
-    description: |-
-      A list of the connections between audio components. Each entry is a
-      pair of strings, the first being the connection's sink, the second
-      being the connection's source.
 
   audio-widgets:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
@@ -35,10 +33,6 @@ properties:
       A list off component DAPM widget. Each entry is a pair of strings,
       the first being the widget type, the second being the widget name
 
-  model:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: User specified audio sound card name
-
 patternProperties:
   "^dai-link-[0-9]+$":
     type: object
@@ -88,7 +82,7 @@ required:
   - model
   - dai-link-0
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
index 6df0e03a1d4b..188f38baddec 100644
--- a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
@@ -17,6 +17,9 @@ description: |
   such as SAI, MICFIL, .etc through building rpmsg channels between
   Cortex-A and Cortex-M.
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -27,10 +30,6 @@ properties:
       - fsl,imx8ulp-rpmsg-audio
       - fsl,imx93-rpmsg-audio
 
-  model:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: User specified audio sound card name
-
   clocks:
     items:
       - description: Peripheral clock for register access
@@ -66,13 +65,6 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle to a node of audio codec
 
-  audio-routing:
-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-    description: |
-      A list of the connections between audio components. Each entry is a
-      pair of strings, the first being the connection's sink, the second
-      being the connection's source.
-
   fsl,enable-lpa:
     $ref: /schemas/types.yaml#/definitions/flag
     description: enable low power audio path.
@@ -101,9 +93,8 @@ properties:
 
 required:
   - compatible
-  - model
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
index ba5b7728cf33..bac940553965 100644
--- a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
+++ b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
@@ -13,23 +13,15 @@ maintainers:
 description:
   This binding describes the SC7180 sound card which uses LPASS for audio.
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
 properties:
   compatible:
     enum:
       - google,sc7180-trogdor
       - google,sc7180-coachz
 
-  audio-routing:
-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-    description:
-      A list of the connections between audio components. Each entry is a
-      pair of strings, the first being the connection's sink, the second
-      being the connection's source.
-
-  model:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: User specified audio sound card name
-
   "#address-cells":
     const: 1
 
@@ -86,11 +78,10 @@ patternProperties:
 
 required:
   - compatible
-  - model
   - "#address-cells"
   - "#size-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
 
diff --git a/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
index 0b1a01a4c14e..ec4b6e547ca6 100644
--- a/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
+++ b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
@@ -13,22 +13,14 @@ maintainers:
 description:
   This binding describes the SC7280 sound card which uses LPASS for audio.
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
 properties:
   compatible:
     enum:
       - google,sc7280-herobrine
 
-  audio-routing:
-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-    description:
-      A list of the connections between audio components. Each entry is a
-      pair of strings, the first being the connection's sink, the second
-      being the connection's source.
-
-  model:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: User specified audio sound card name
-
   "#address-cells":
     const: 1
 
@@ -97,11 +89,10 @@ patternProperties:
 
 required:
   - compatible
-  - model
   - "#address-cells"
   - "#size-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
 
diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
index b6f5d486600e..f7ad5ea2491e 100644
--- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
+++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
@@ -9,23 +9,14 @@ title: NXP i.MX audio sound card.
 maintainers:
   - Shengjiu Wang <shengjiu.wang@nxp.com>
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
 properties:
   compatible:
     enum:
       - fsl,imx-audio-card
 
-  model:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: User specified audio sound card name
-
-  audio-routing:
-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-    description:
-      A list of the connections between audio components. Each entry is a
-      pair of strings, the first being the connection's sink, the second
-      being the connection's source. Valid names could be power supplies,
-      MicBias of codec and the jacks on the board.
-
 patternProperties:
   ".*-dai-link$":
     description:
@@ -84,9 +75,8 @@ patternProperties:
 
 required:
   - compatible
-  - model
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/sound-card-common.yaml b/Documentation/devicetree/bindings/sound/sound-card-common.yaml
new file mode 100644
index 000000000000..3a941177f684
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/sound-card-common.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/sound-card-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Board Sound Card Common Properties
+
+maintainers:
+  - Mark Brown <broonie@kernel.org>
+
+properties:
+  audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      A list of the connections between audio components. Each entry is a
+      pair of strings, the first being the connection's sink, the second
+      being the connection's source.
+
+  model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: User specified audio sound card name
+
+required:
+  - model
+
+additionalProperties: true
-- 
2.34.1

