Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0F789D835
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Apr 2024 13:40:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46D222971;
	Tue,  9 Apr 2024 13:40:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46D222971
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712662850;
	bh=l/YgE2jHDgEGiO5tZpMnwUUm+KuVZjmQoNRva6TC6eM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ccPHTkmyMrW0tg9g3c2VEKM3lxP0Mmr2QU9XfDWJTZ+ePyt46E+vigoduRElLqRPQ
	 AfF5amxSju0VYo6AROuCoEYXuAKStoSQMx8ZUzlPd69KuH54gF4Ai1Pg6n+lr9FKPZ
	 OC+38Y6w/2AhFf8VYlS0ZmI/5Q4JxtMmBDLjwopI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA780F80857; Tue,  9 Apr 2024 13:36:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 295EDF80768;
	Tue,  9 Apr 2024 13:36:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D3D5F80568; Tue,  9 Apr 2024 13:34:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DBFC6F80236
	for <alsa-devel@alsa-project.org>; Tue,  9 Apr 2024 13:34:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBFC6F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=HjVtEb/a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712662443;
	bh=l/YgE2jHDgEGiO5tZpMnwUUm+KuVZjmQoNRva6TC6eM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HjVtEb/agejdcAI18+BBEgvGU+Uzpv8NUoldIg8LLDMGeugmFpOijD5yzekO1L3t9
	 twmgZ27EGBt4uOS+w7vfDEg8NyevUB5Ang1mWt1plRZmD4YaFR2c3oGcS3c7HkOXfH
	 f0RviRfotw9KpQk1Ore/6KDy5mTPT2C+lUnc1drIXz6xWKLIjjxCwgSgATJT9mDe2k
	 glYbVds1VcUsx2nUNLDsOQZLsWpJjQ16TY8lecmqhaiFrP5KyNrbBcIem21ucvqr18
	 1QbEZFIhhsIF44FqZLmQ4kmfqkVvvTMBTKMHHbNIpuqjobnHVA6dU1C/27A4aq5whr
	 Y5MiYrAt6CSOw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5847D3782132;
	Tue,  9 Apr 2024 11:34:01 +0000 (UTC)
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
Subject: [PATCH v4 14/18] ASoC: dt-bindings: mt8195: Document audio-routing
 and dai-link subnode
Date: Tue,  9 Apr 2024 13:33:06 +0200
Message-ID: <20240409113310.303261-15-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409113310.303261-1-angelogioacchino.delregno@collabora.com>
References: <20240409113310.303261-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZL3Z2XVC32MYVZ3V3NO4CSMTWNEIVRZE
X-Message-ID-Hash: ZL3Z2XVC32MYVZ3V3NO4CSMTWNEIVRZE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZL3Z2XVC32MYVZ3V3NO4CSMTWNEIVRZE/>
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

