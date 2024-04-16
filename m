Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A2A8A64DF
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Apr 2024 09:19:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CEF31A2D;
	Tue, 16 Apr 2024 09:19:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CEF31A2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713251994;
	bh=0Xu+A6DQSApUl+bx7dqAi1yjwT+TMZd9+xG6pwiMVK4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=labhFXNNSUdYua2dp9QdbRkUqBX80eCvVHxrtLqZO57dx5AptGaOX7Imz8Tx96kwT
	 kV5LXOWB0ZzjXtktMuOpKtBewyNqm8aIBrGJahj7IfxFzABGKAhloEuYd6968gW9eo
	 qXFxgZa1j+DuFMgYHpctNtPrjZ5Pl9rSSWVggx4Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9691F80863; Tue, 16 Apr 2024 09:16:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51758F8085E;
	Tue, 16 Apr 2024 09:16:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14EE0F80571; Tue, 16 Apr 2024 09:15:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7EA7F80423
	for <alsa-devel@alsa-project.org>; Tue, 16 Apr 2024 09:14:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7EA7F80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=eQjwEv6Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713251696;
	bh=0Xu+A6DQSApUl+bx7dqAi1yjwT+TMZd9+xG6pwiMVK4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eQjwEv6ZWzF9Ay/bg3H0wAkkjqZxasipdTIvYhVpZ/etz69slrDOawj+7rLe8leTi
	 jhzD9FWjwOfwIW9vbN+3QZg+fY5Evgcy4u2QB53qzjh5ZsrPiNhy2pWUjj22RNYgAg
	 iu4HJ2tfwWJ0AOOMApNLzKOeN3klv1Ovo9FZswp37jYEE+ua1uG7zjIaWGxtMQYlPX
	 u5KvZVSK9sOg6yo7M9AeJrux48r7Mfm1g+F3jEYFMyg90ljJNnn+f9q0Iuu5jKCG4A
	 Sfod7S2Ci1MsL2hX0QaguHQ5Ai2L7ItQUsJuAmkcjpj7P2uofiVw5QO6/C5sYHsNXs
	 Sv/8uxymKcpEg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 71226378210B;
	Tue, 16 Apr 2024 07:14:54 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: wenst@chromium.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	trevor.wu@mediatek.com,
	maso.huang@mediatek.com,
	xiazhengqiao@huaqin.corp-partner.google.com,
	arnd@arndb.de,
	kuninori.morimoto.gx@renesas.com,
	shraash@google.com,
	amergnat@baylibre.com,
	nicolas.ferre@microchip.com,
	u.kleine-koenig@pengutronix.de,
	dianders@chromium.org,
	frank.li@vivo.com,
	allen-kh.cheng@mediatek.com,
	eugen.hristev@collabora.com,
	claudiu.beznea@tuxon.dev,
	jarkko.nikula@bitmer.com,
	jiaxin.yu@mediatek.com,
	alpernebiyasak@gmail.com,
	ckeepax@opensource.cirrus.com,
	zhourui@huaqin.corp-partner.google.com,
	nfraprado@collabora.com,
	alsa-devel@alsa-project.org,
	shane.chien@mediatek.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v5 16/18] ASoC: dt-bindings: mt8186: Document audio-routing
 and dai-link subnode
Date: Tue, 16 Apr 2024 09:14:08 +0200
Message-ID: <20240416071410.75620-17-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416071410.75620-1-angelogioacchino.delregno@collabora.com>
References: <20240416071410.75620-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PKMDR5R2GCXIPVVT6I7CDZWW5WTETXIR
X-Message-ID-Hash: PKMDR5R2GCXIPVVT6I7CDZWW5WTETXIR
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PKMDR5R2GCXIPVVT6I7CDZWW5WTETXIR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Document the dai-link subnodes and the audio-routing property, allowing
to describe machine specific audio hardware and links in device tree.

While at it, also deprecate the old properties which were previously
used with the driver's partially hardcoded configuration.

Also, since describing machine specific audio hardware and links replaces
the now deprecated old logic doing the same in a driver hardcoded fashion,
it is not allowed to have both the old and new properties together.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../sound/mt8186-mt6366-da7219-max98357.yaml  | 131 ++++++++++++++++--
 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   | 120 ++++++++++++++--
 2 files changed, 233 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
index 9853c11a1330..cbc641ecbe94 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
@@ -12,17 +12,46 @@ maintainers:
 description:
   This binding describes the MT8186 sound card.
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
 properties:
   compatible:
     enum:
       - mediatek,mt8186-mt6366-da7219-max98357-sound
 
+  audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description:
+      A list of the connections between audio components. Each entry is a
+      pair of strings, the first being the connection's sink, the second
+      being the connection's source.
+      Valid names could be the input or output widgets of audio components,
+      power supplies, MicBias of codec and the software switch.
+    minItems: 2
+    items:
+      enum:
+        # Sinks
+        - HDMI1
+        - Headphones
+        - Line Out
+        - MIC
+        - Speakers
+
+        # Sources
+        - Headset Mic
+        - HPL
+        - HPR
+        - Speaker
+        - TX
+
   mediatek,platform:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of MT8186 ASoC platform.
 
   headset-codec:
     type: object
+    deprecated: true
     additionalProperties: false
     properties:
       sound-dai:
@@ -32,6 +61,7 @@ properties:
 
   playback-codecs:
     type: object
+    deprecated: true
     additionalProperties: false
     properties:
       sound-dai:
@@ -53,32 +83,115 @@ properties:
       A list of the desired dai-links in the sound card. Each entry is a
       name defined in the machine driver.
 
-additionalProperties: false
+patternProperties:
+  ".*-dai-link$":
+    type: object
+    additionalProperties: false
+    description:
+      Container for dai-link level properties and CODEC sub-nodes.
+
+    properties:
+      link-name:
+        description: Indicates dai-link name and PCM stream name
+        items:
+          enum:
+            - I2S0
+            - I2S1
+            - I2S2
+            - I2S3
+
+      codec:
+        description: Holds subnode which indicates codec dai.
+        type: object
+        additionalProperties: false
+        properties:
+          sound-dai:
+            minItems: 1
+            maxItems: 2
+        required:
+          - sound-dai
+
+      dai-format:
+        description: audio format
+        items:
+          enum:
+            - i2s
+            - right_j
+            - left_j
+            - dsp_a
+            - dsp_b
+
+      mediatek,clk-provider:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: Indicates dai-link clock master.
+        items:
+          enum:
+            - cpu
+            - codec
+
+    required:
+      - link-name
+
+unevaluatedProperties: false
 
 required:
   - compatible
   - mediatek,platform
-  - headset-codec
-  - playback-codecs
+
+# Disallow legacy properties if xxx-dai-link nodes are specified
+if:
+  not:
+    patternProperties:
+      ".*-dai-link$": false
+then:
+  properties:
+    headset-codec: false
+    speaker-codecs: false
 
 examples:
   - |
 
     sound: mt8186-sound {
         compatible = "mediatek,mt8186-mt6366-da7219-max98357-sound";
-        mediatek,platform = <&afe>;
+        model = "mt8186_da7219_m98357";
         pinctrl-names = "aud_clk_mosi_off",
                         "aud_clk_mosi_on";
         pinctrl-0 = <&aud_clk_mosi_off>;
         pinctrl-1 = <&aud_clk_mosi_on>;
+        mediatek,platform = <&afe>;
+
+        audio-routing =
+                "Headphones", "HPL",
+                "Headphones", "HPR",
+                "MIC", "Headset Mic",
+                "Speakers", "Speaker",
+                "HDMI1", "TX";
+
+        hs-playback-dai-link {
+                link-name = "I2S0";
+                dai-format = "i2s";
+                mediatek,clk-provider = "cpu";
+                codec {
+                        sound-dai = <&da7219>;
+                };
+        };
 
-        headset-codec {
-            sound-dai = <&da7219>;
+        hs-capture-dai-link {
+                link-name = "I2S1";
+                dai-format = "i2s";
+                mediatek,clk-provider = "cpu";
+                codec {
+                        sound-dai = <&da7219>;
+                };
         };
 
-        playback-codecs {
-            sound-dai = <&anx_bridge_dp>,
-                        <&max98357a>;
+        spk-dp-playback-dai-link {
+                link-name = "I2S3";
+                dai-format = "i2s";
+                mediatek,clk-provider = "cpu";
+                codec {
+                        sound-dai = <&anx_bridge_dp>, <&max98357a>;
+                };
         };
     };
 
diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
index bdf7b0960533..ed93f18ef985 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
@@ -12,6 +12,9 @@ maintainers:
 description:
   This binding describes the MT8186 sound card.
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -19,6 +22,34 @@ properties:
       - mediatek,mt8186-mt6366-rt5682s-max98360-sound
       - mediatek,mt8186-mt6366-rt5650-sound
 
+  audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description:
+      A list of the connections between audio components. Each entry is a
+      pair of strings, the first being the connection's sink, the second
+      being the connection's source.
+      Valid names could be the input or output widgets of audio components,
+      power supplies, MicBias of codec and the software switch.
+    minItems: 2
+    items:
+      enum:
+        # Sinks
+        - HDMI1
+        - Headphone
+        - IN1P
+        - IN1N
+        - Line Out
+        - Speakers
+
+        # Sources
+        - Headset Mic
+        - HPOL
+        - HPOR
+        - Speaker
+        - SPOL
+        - SPOR
+        - TX
+
   mediatek,platform:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of MT8186 ASoC platform.
@@ -32,6 +63,7 @@ properties:
 
   headset-codec:
     type: object
+    deprecated: true
     additionalProperties: false
     properties:
       sound-dai:
@@ -41,6 +73,7 @@ properties:
 
   playback-codecs:
     type: object
+    deprecated: true
     additionalProperties: false
     properties:
       sound-dai:
@@ -62,13 +95,56 @@ properties:
       A list of the desired dai-links in the sound card. Each entry is a
       name defined in the machine driver.
 
-additionalProperties: false
+patternProperties:
+  ".*-dai-link$":
+    type: object
+    additionalProperties: false
+    description:
+      Container for dai-link level properties and CODEC sub-nodes.
+
+    properties:
+      link-name:
+        description: Indicates dai-link name and PCM stream name
+        enum: [ I2S0, I2S1, I2S2, I2S3 ]
+
+      codec:
+        description: Holds subnode which indicates codec dai.
+        type: object
+        additionalProperties: false
+        properties:
+          sound-dai:
+            minItems: 1
+            maxItems: 2
+        required:
+          - sound-dai
+
+      dai-format:
+        description: audio format
+        enum: [ i2s, right_j, left_j, dsp_a, dsp_b ]
+
+      mediatek,clk-provider:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: Indicates dai-link clock master.
+        enum: [ cpu, codec ]
+
+    required:
+      - link-name
+
+unevaluatedProperties: false
 
 required:
   - compatible
   - mediatek,platform
-  - headset-codec
-  - playback-codecs
+
+# Disallow legacy properties if xxx-dai-link nodes are specified
+if:
+  not:
+    patternProperties:
+      ".*-dai-link$": false
+then:
+  properties:
+    headset-codec: false
+    speaker-codecs: false
 
 examples:
   - |
@@ -76,23 +152,49 @@ examples:
 
     sound: mt8186-sound {
         compatible = "mediatek,mt8186-mt6366-rt1019-rt5682s-sound";
-        mediatek,platform = <&afe>;
+        model = "mt8186_rt1019_rt5682s";
         pinctrl-names = "aud_clk_mosi_off",
                         "aud_clk_mosi_on",
                         "aud_gpio_dmic_sec";
         pinctrl-0 = <&aud_clk_mosi_off>;
         pinctrl-1 = <&aud_clk_mosi_on>;
         pinctrl-2 = <&aud_gpio_dmic_sec>;
+        mediatek,platform = <&afe>;
 
         dmic-gpios = <&pio 23 GPIO_ACTIVE_HIGH>;
 
-        headset-codec {
-            sound-dai = <&rt5682s>;
+        audio-routing =
+                "Headphone", "HPOL",
+                "Headphone", "HPOR",
+                "IN1P", "Headset Mic",
+                "Speakers", "Speaker",
+                "HDMI1", "TX";
+
+        hs-playback-dai-link {
+                link-name = "I2S0";
+                dai-format = "i2s";
+                mediatek,clk-provider = "cpu";
+                codec {
+                        sound-dai = <&rt5682s 0>;
+                };
+        };
+
+        hs-capture-dai-link {
+                link-name = "I2S1";
+                dai-format = "i2s";
+                mediatek,clk-provider = "cpu";
+                codec {
+                        sound-dai = <&rt5682s 0>;
+                };
         };
 
-        playback-codecs {
-             sound-dai = <&it6505dptx>,
-                         <&rt1019p>;
+        spk-hdmi-playback-dai-link {
+                link-name = "I2S3";
+                dai-format = "i2s";
+                mediatek,clk-provider = "cpu";
+                codec {
+                        sound-dai = <&it6505dptx>, <&rt1019p>;
+                };
         };
     };
 
-- 
2.44.0

