Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E16CB89D830
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Apr 2024 13:40:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 587372BA4;
	Tue,  9 Apr 2024 13:40:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 587372BA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712662831;
	bh=6SqN9wWBxnCEthQ3e1Jy5DMt1UHcxaWeOQWQPNIAVhw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rVdXkhtJ+YnEthEKlvcPSwNcpTf5xwsRfo/jX4+laOxrwjS4rUnQ6q4i77uHpoOzL
	 5zBW8wvctgh+Ujx3EvtLQYM9gJ7Sp9Zf0zf9tMK+KUdaFUjB+XyJjhtDi1tnY2ImlS
	 5VE3hpLQX91SQXmqqd7C4HNXmcb2eBDZCQgYswsU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC3DDF80C0F; Tue,  9 Apr 2024 13:36:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FC6AF80C71;
	Tue,  9 Apr 2024 13:36:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80E41F80238; Tue,  9 Apr 2024 13:34:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 480DDF80423
	for <alsa-devel@alsa-project.org>; Tue,  9 Apr 2024 13:34:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 480DDF80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=4x8N+MmA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712662445;
	bh=6SqN9wWBxnCEthQ3e1Jy5DMt1UHcxaWeOQWQPNIAVhw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=4x8N+MmAOwtwucfgJSxQR6oDDw4XDAWHS5cs9u95XsjwtWPDEh4ZHvc8wOT0IVT0I
	 OxYNj3DG5CLxtzkEugDvcD2S+iNguTPv5PTwACBbjqgBegqqe8t2erLpbkulcTnaZN
	 d/HWxiZYmrPEd5z+40C95nphZq9uy/vNNNSHeZ+HcDrjd1lEPQLBZ5yDV/nJofps+g
	 GDFENdMKjw874sNxJD/0pTiL+aRPU9uxB8EFROOkoy8A/8AYhEN4dWKC+DyDpfRk00
	 KZs7BargTWGMJh9H5LQAtANTyifXYV04B1YL4RXgwf/VjbvlGzW5d9gGO6+ZSDIUDZ
	 qxFAtfJ3aJjmQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id AE89537820F8;
	Tue,  9 Apr 2024 11:34:03 +0000 (UTC)
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
Subject: [PATCH v4 15/18] ASoC: dt-bindings: mt8192: Document audio-routing
 and dai-link subnode
Date: Tue,  9 Apr 2024 13:33:07 +0200
Message-ID: <20240409113310.303261-16-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409113310.303261-1-angelogioacchino.delregno@collabora.com>
References: <20240409113310.303261-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4Y6LSFUBGEJ72SCFERCLN73B7ZMHAEWK
X-Message-ID-Hash: 4Y6LSFUBGEJ72SCFERCLN73B7ZMHAEWK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4Y6LSFUBGEJ72SCFERCLN73B7ZMHAEWK/>
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
 .../sound/mt8192-mt6359-rt1015-rt5682.yaml    | 139 ++++++++++++++++--
 1 file changed, 129 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
index 7e50f5d65c8f..c4e68f31aaab 100644
--- a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
@@ -13,6 +13,9 @@ maintainers:
 description:
   This binding describes the MT8192 sound card.
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -20,6 +23,31 @@ properties:
       - mediatek,mt8192_mt6359_rt1015p_rt5682
       - mediatek,mt8192_mt6359_rt1015p_rt5682s
 
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
+        - Speakers
+        - Headphone Jack
+        - IN1P
+        - Left Spk
+        - Right Spk
+
+        # Sources
+        - Headset Mic
+        - HPOL
+        - HPOR
+        - Left SPO
+        - Right SPO
+        - Speaker
+
   mediatek,platform:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of MT8192 ASoC platform.
@@ -27,10 +55,12 @@ properties:
   mediatek,hdmi-codec:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of HDMI codec.
+    deprecated: true
 
   headset-codec:
     type: object
     additionalProperties: false
+    deprecated: true
 
     properties:
       sound-dai:
@@ -41,6 +71,7 @@ properties:
   speaker-codecs:
     type: object
     additionalProperties: false
+    deprecated: true
 
     properties:
       sound-dai:
@@ -51,33 +82,121 @@ properties:
     required:
       - sound-dai
 
-additionalProperties: false
+patternProperties:
+  ".*-dai-link$":
+    type: object
+    additionalProperties: false
+
+    description:
+      Container for dai-link level properties and CODEC sub-nodes.
+
+    properties:
+      link-name:
+        description: Indicates dai-link name and PCM stream name
+        enum:
+          - I2S0
+          - I2S1
+          - I2S2
+          - I2S3
+          - I2S4
+          - I2S5
+          - I2S6
+          - I2S7
+          - I2S8
+          - I2S9
+          - TDM
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
-  - speaker-codecs
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
+    mediatek,hdmi-codec: false
 
 examples:
   - |
 
     sound: mt8192-sound {
         compatible = "mediatek,mt8192_mt6359_rt1015_rt5682";
-        mediatek,platform = <&afe>;
-        mediatek,hdmi-codec = <&anx_bridge_dp>;
+        model = "mt8192_mt6359_rt1015_rt5682";
         pinctrl-names = "aud_clk_mosi_off",
                         "aud_clk_mosi_on";
         pinctrl-0 = <&aud_clk_mosi_off>;
         pinctrl-1 = <&aud_clk_mosi_on>;
+        mediatek,platform = <&afe>;
+
+        audio-routing =
+                "Headphone Jack", "HPOL",
+                "Headphone Jack", "HPOR",
+                "IN1P", "Headset Mic",
+                "Speakers", "Speaker";
+
+        spk-playback-dai-link {
+                link-name = "I2S3";
+                dai-format = "i2s";
+                mediatek,clk-provider = "cpu";
+                codec {
+                        sound-dai = <&rt1015p>;
+                };
+        };
+
+        hs-playback-dai-link {
+                link-name = "I2S8";
+                dai-format = "i2s";
+                mediatek,clk-provider = "cpu";
+                codec {
+                        sound-dai = <&rt5682 0>;
+                };
+        };
 
-        headset-codec {
-            sound-dai = <&rt5682>;
+        hs-capture-dai-link {
+                link-name = "I2S9";
+                dai-format = "i2s";
+                mediatek,clk-provider = "cpu";
+                codec {
+                        sound-dai = <&rt5682 0>;
+                };
         };
 
-        speaker-codecs {
-            sound-dai = <&rt1015_l>,
-                        <&rt1015_r>;
+        displayport-dai-link {
+                link-name = "TDM";
+                dai-format = "dsp_a";
+                codec {
+                        sound-dai = <&anx_bridge_dp>;
+                };
         };
     };
 
-- 
2.44.0

