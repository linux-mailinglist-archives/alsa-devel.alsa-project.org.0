Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E812053EE73
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 21:21:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 878311B1A;
	Mon,  6 Jun 2022 21:20:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 878311B1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654543288;
	bh=pIUvNVyxQSARzcONyO1MYGc4nz49gpvIyzOcC2jirZY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=if7lawnfszsy43Swm9kktSl+xrQkO047sOBpV6w/35wyy6eNvqMHs0raAYJktWsmb
	 bl+FOSDG+Xwbl920RgT8izOWBbpQlkVfGtRgdEiDVykSsNxMLMyws0qGd9xgppXeQY
	 XPlroE6AkR/S20BodDqvCwSiJ/I9oIzVtZgQKCUs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC1EEF80526;
	Mon,  6 Jun 2022 21:20:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E615FF80527; Mon,  6 Jun 2022 21:20:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D083F8012A
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 21:19:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D083F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="mdDf+14S"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1654543192; bh=QBs7UtuS1Zqfk21JmPJtrPH28UjdCT91NFOWXH9PRtA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=mdDf+14SP4WSk9ObzLihhJ+lqyl6VWwKgHzVVo5GUwW8+ZDIM1sS2y/jjgmk2buER
 5P+G59wXVOHyxvMsoh1kEr3p0jkusK+lPcewH/5ba2fshFuYWUlcUoQ0T1AIFbhAs5
 NkruLCpMelDMckZFD4dJ4Sgh61XuBcoMGO3V1dEY=
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [RFC PATCH v2 2/5] dt-bindings: sound: Add Apple Macs sound
 peripherals
Date: Mon,  6 Jun 2022 21:19:07 +0200
Message-Id: <20220606191910.16580-3-povik+lin@cutebit.org>
In-Reply-To: <20220606191910.16580-1-povik+lin@cutebit.org>
References: <20220606191910.16580-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 Mark Kettenis <kettenis@openbsd.org>,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add binding for Apple Silicon Macs' machine-level integration of sound
peripherals.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 .../bindings/sound/apple,macaudio.yaml        | 157 ++++++++++++++++++
 1 file changed, 157 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/apple,macaudio.yaml

diff --git a/Documentation/devicetree/bindings/sound/apple,macaudio.yaml b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
new file mode 100644
index 000000000000..f7c12697beab
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
@@ -0,0 +1,157 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/apple,macaudio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple Silicon Macs integrated sound peripherals
+
+description: |
+  This binding represents the overall machine-level integration of sound
+  peripherals on 'Apple Silicon' machines by Apple.
+
+maintainers:
+  - Martin Povišer <povik+lin@cutebit.org>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,j274-macaudio
+          - apple,j293-macaudio
+          - apple,j314-macaudio
+      - const: apple,macaudio
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  model:
+    description: |
+      Model name for presentation to users
+    $ref: /schemas/types.yaml#/definitions/string
+
+patternProperties:
+  "^dai-link(@[0-9a-f]+)?$":
+    description: |
+      Node for each sound peripheral such as the speaker array, headphones jack,
+      or microphone.
+    type: object
+    properties:
+      reg:
+        maxItems: 1
+
+      link-name:
+        description: |
+          Name for the peripheral, expecting 'Speaker' or 'Speakers' if this is
+          the speaker array.
+        $ref: /schemas/types.yaml#/definitions/string
+
+      cpu:
+        type: object
+        properties:
+          sound-dai:
+            description: |
+              DAI list with CPU-side I2S ports involved in this peripheral.
+            minItems: 1
+            maxItems: 2
+        required:
+          - sound-dai
+
+      codec:
+        type: object
+        properties:
+          sound-dai:
+            description: |
+              DAI list with the CODEC-side DAIs connected to the above CPU-side
+              DAIs and involved in this sound peripheral.
+
+              The list is in left/right order if applicable. If there are more
+              than one CPU-side DAIs (there can be two), the CODECs must be
+              listed first those connected to the first CPU, then those
+              connected to the second.
+
+              In addition, on some machines with many speaker codecs, the CODECs
+              are listed in this fixed order:
+
+              J293: Left Front, Left Rear, Right Front, Right Rear
+              J314: Left Woofer 1, Left Tweeter, Left Woofer 2,
+                    Right Woofer 1, Right Tweeter, Right Woofer 2
+            minItems: 1
+            maxItems: 8
+        required:
+          - sound-dai
+
+    required:
+      - reg
+      - cpu
+      - codec
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - model
+
+additionalProperties: false
+
+examples:
+  - |
+    mca: mca@9b600000 {
+      compatible = "apple,t6000-mca", "apple,mca";
+      reg = <0x9b600000 0x10000>,
+            <0x9b500000 0x20000>;
+
+      clocks = <&nco 0>, <&nco 1>, <&nco 2>, <&nco 3>;
+      power-domains = <&ps_audio_p>, <&ps_mca0>, <&ps_mca1>,
+                      <&ps_mca2>, <&ps_mca3>;
+      dmas = <&admac 0>, <&admac 1>, <&admac 2>, <&admac 3>,
+             <&admac 4>, <&admac 5>, <&admac 6>, <&admac 7>,
+             <&admac 8>, <&admac 9>, <&admac 10>, <&admac 11>,
+             <&admac 12>, <&admac 13>, <&admac 14>, <&admac 15>;
+      dma-names = "tx0a", "rx0a", "tx0b", "rx0b",
+                  "tx1a", "rx1a", "tx1b", "rx1b",
+                  "tx2a", "rx2a", "tx2b", "rx2b",
+                  "tx3a", "rx3a", "tx3b", "rx3b";
+
+      #sound-dai-cells = <1>;
+    };
+
+    sound {
+      compatible = "apple,j314-macaudio", "apple,macaudio";
+      model = "MacBook Pro J314 integrated audio";
+
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      dai-link@0 {
+        reg = <0>;
+        link-name = "Speakers";
+
+        cpu {
+          sound-dai = <&mca 0>, <&mca 1>;
+        };
+        codec {
+          sound-dai = <&speaker_left_woof1>,
+                      <&speaker_left_tweet>,
+                      <&speaker_left_woof2>,
+                      <&speaker_right_woof1>,
+                      <&speaker_right_tweet>,
+                      <&speaker_right_woof2>;
+        };
+      };
+
+      dai-link@1 {
+        reg = <1>;
+        link-name = "Headphones Jack";
+
+        cpu {
+          sound-dai = <&mca 2>;
+        };
+        codec {
+          sound-dai = <&jack_codec>;
+        };
+      };
+    };
-- 
2.33.0

