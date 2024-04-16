Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B78D8A64D6
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Apr 2024 09:19:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76B0E1909;
	Tue, 16 Apr 2024 09:18:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76B0E1909
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713251940;
	bh=l/YgE2jHDgEGiO5tZpMnwUUm+KuVZjmQoNRva6TC6eM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hQWbl8GOO5IVz5mSlUnqgRYau45uhvVmhRubsTQJ/mhrx6PHo61Ym86VE7qCRVOpl
	 G+jMQ3TEWhw7xZ3Ig7TfVlcGt6+33R/i2p6mZcYJUhyKgy9q5Dwxg9cJIA9rAjm3R+
	 Ncs66Ek9M86sxryVN4XVVcE7fOUHioOVYQVeLxZs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6BB2F806DC; Tue, 16 Apr 2024 09:16:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72BB4F80722;
	Tue, 16 Apr 2024 09:16:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B03FF805B1; Tue, 16 Apr 2024 09:15:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47259F80571
	for <alsa-devel@alsa-project.org>; Tue, 16 Apr 2024 09:14:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47259F80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=fYTAnl9w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713251691;
	bh=l/YgE2jHDgEGiO5tZpMnwUUm+KuVZjmQoNRva6TC6eM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fYTAnl9wUuwE0R1aGy712w49sD5mzXirOnwJn5yVauxOU6KFy6Gz24C2YdlxEtwYI
	 Kn8fJUyYWUBpSi09VisqJE+/5wl1GlIP3jbqJbzH5+hLmca2ODeSLom20TZMC7jdnz
	 2HWGvaZBYHLCZDmpMmxyyV1kkjLR3nBh3p4zG0YB0g2+UiNsO+MeTKUg6eUXMfkZUd
	 SO+P1i//UHG5gT/rl8dy5lkmGFs3AoGtqNNDH1xyen6CK7tcRPRne8rS25cYLfeZae
	 8DU9hTs8SSnvyLIpAFJ55vnpNmP//g9LcRRO+cUb6SFooBaVHG5LeZOKoahqeo529r
	 m3F/4ift/AqHw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id AF68A3782123;
	Tue, 16 Apr 2024 07:14:49 +0000 (UTC)
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
Subject: [PATCH v5 14/18] ASoC: dt-bindings: mt8195: Document audio-routing
 and dai-link subnode
Date: Tue, 16 Apr 2024 09:14:06 +0200
Message-ID: <20240416071410.75620-15-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416071410.75620-1-angelogioacchino.delregno@collabora.com>
References: <20240416071410.75620-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BIBQUY2TO7PUJQVQSXHCDIVLPOPQEP43
X-Message-ID-Hash: BIBQUY2TO7PUJQVQSXHCDIVLPOPQEP43
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BIBQUY2TO7PUJQVQSXHCDIVLPOPQEP43/>
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
used with driver hardcoded configuration.

Also, since describing machine specific audio hardware and links replaces
the now deprecated old logic doing the same in a driver hardcoded fashion,
it is not allowed to have both the old and new properties together.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/sound/mt8195-mt6359.yaml         | 134 ++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml b/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
index c1ddbf672ca3..2af1d8ffbd8b 100644
--- a/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
@@ -12,6 +12,9 @@ maintainers:
 description:
   This binding describes the MT8195 sound card.
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -23,6 +26,33 @@ properties:
     $ref: /schemas/types.yaml#/definitions/string
     description: User specified audio sound card name
 
+  audio-routing:
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
+        - Ext Spk
+        - Headphone
+        - IN1P
+        - Left Spk
+        - Right Spk
+
+        # Sources
+        - Headset Mic
+        - HPOL
+        - HPOR
+        - Left BE_OUT
+        - Left SPO
+        - Right BE_OUT
+        - Right SPO
+        - Speaker
+
   mediatek,platform:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of MT8195 ASoC platform.
@@ -30,10 +60,12 @@ properties:
   mediatek,dptx-codec:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of MT8195 Display Port Tx codec node.
+    deprecated: true
 
   mediatek,hdmi-codec:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of MT8195 HDMI codec node.
+    deprecated: true
 
   mediatek,adsp:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -45,20 +77,122 @@ properties:
       A list of the desired dai-links in the sound card. Each entry is a
       name defined in the machine driver.
 
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
+        enum:
+          - DPTX_BE
+          - ETDM1_IN_BE
+          - ETDM2_IN_BE
+          - ETDM1_OUT_BE
+          - ETDM2_OUT_BE
+          - ETDM3_OUT_BE
+          - PCM1_BE
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
 additionalProperties: false
 
 required:
   - compatible
   - mediatek,platform
 
+# Disallow legacy properties if xxx-dai-link nodes are specified
+if:
+  not:
+    patternProperties:
+      ".*-dai-link$": false
+then:
+  properties:
+    mediatek,dptx-codec: false
+    mediatek,hdmi-codec: false
+
 examples:
   - |
 
     sound: mt8195-sound {
         compatible = "mediatek,mt8195_mt6359_rt1019_rt5682";
+        model = "mt8195_r1019_5682";
         mediatek,platform = <&afe>;
         pinctrl-names = "default";
         pinctrl-0 = <&aud_pins_default>;
+
+        audio-routing =
+                "Headphone", "HPOL",
+                "Headphone", "HPOR",
+                "IN1P", "Headset Mic",
+                "Ext Spk", "Speaker";
+
+        mm-dai-link {
+                link-name = "ETDM1_IN_BE";
+                mediatek,clk-provider = "cpu";
+        };
+
+        hs-playback-dai-link {
+                link-name = "ETDM1_OUT_BE";
+                mediatek,clk-provider = "cpu";
+                codec {
+                        sound-dai = <&headset_codec>;
+                };
+        };
+
+        hs-capture-dai-link {
+                link-name = "ETDM2_IN_BE";
+                mediatek,clk-provider = "cpu";
+                codec {
+                        sound-dai = <&headset_codec>;
+                };
+        };
+
+        spk-playback-dai-link {
+                link-name = "ETDM2_OUT_BE";
+                mediatek,clk-provider = "cpu";
+                codec {
+                        sound-dai = <&spk_amplifier>;
+                };
+        };
+
+        hdmi-dai-link {
+                link-name = "ETDM3_OUT_BE";
+                codec {
+                        sound-dai = <&hdmi_tx>;
+                };
+        };
+
+        displayport-dai-link {
+                link-name = "DPTX_BE";
+                codec {
+                        sound-dai = <&dp_tx>;
+                };
+        };
     };
 
 ...
-- 
2.44.0

