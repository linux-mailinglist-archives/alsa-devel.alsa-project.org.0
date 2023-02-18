Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6531D69AED2
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 16:00:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7ED2F32;
	Fri, 17 Feb 2023 15:59:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7ED2F32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676646038;
	bh=6QxZfk/1TeDHG3IJFdAa/J1He4ju0cfw9ULOHzuA6kk=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HgnJiH1IfGUA4rAnsxWmVDiyQ+eGgP0S4h3UA2XGbffwmMdj8wHIq5ad8xgyyME4x
	 iwd/Ov/xqxN3pvd2tG+ki2xcmFzqYQI18O+BLCLkbvM12CMPz9krfdldxoB4d8qXtC
	 jgzFbLIXRk5uM251lSbroIw6vCFEKQbIHrJOJg/w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12B91F8057E;
	Fri, 17 Feb 2023 15:57:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB129F8056F; Fri, 17 Feb 2023 15:57:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0825CF80544
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 15:57:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0825CF80544
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lKrImua2
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 195AF1BF208;
	Fri, 17 Feb 2023 14:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676645838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oul0jsc2DenRyA+fgPib1b2q+MbmEghK/BzvhARWAgE=;
	b=lKrImua2SWgv23HcLQR5QYzFefeawmB1pgc3fhepEgZ2X4ZANAzneVabHZTqdjy5LxYXYQ
	fnz4m4soBND1McBMowFPxo44afn2vHlkQ4IfpuZ+bnCvehUMioDXsOjew6u2TfiHj+UF3i
	jhLmr/wc8HfYS/frBd/Dsd5rUrUmWDAgycSbMts4mVy7hWT+VxcY/t+lTLbXPDHKbVf9+k
	m97xss3UMl8JzEPPFnPsqmZLeSCnJ0QaoJQCWQcqR8wLxq357eydxFn6D+7pUfysuqtIu9
	I4syv4DSkuj3Sl4ecvFczx5IDTGQFZJWWKkLTlL1nYRtLgCLjjv1jbvcfZkQnA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Li Yang <leoyang.li@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH v6 08/10] dt-bindings: sound: Add support for QMC audio
Date: Fri, 17 Feb 2023 15:56:43 +0100
Message-Id: <20230217145645.1768659-9-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217145645.1768659-1-herve.codina@bootlin.com>
References: <20230217145645.1768659-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TUIW7WTWKBFNJRQRR2UQVGJY4TG7R4Y6
X-Message-ID-Hash: TUIW7WTWKBFNJRQRR2UQVGJY4TG7R4Y6
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TUIW7WTWKBFNJRQRR2UQVGJY4TG7R4Y6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The QMC (QUICC mutichannel controller) is a controller
present in some PowerQUICC SoC such as MPC885.
The QMC audio is an ASoC component that uses the QMC
controller to transfer the audio data.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/fsl,qmc-audio.yaml         | 117 ++++++++++++++++++
 1 file changed, 117 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml

diff --git a/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml b/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
new file mode 100644
index 000000000000..ff5cd9241941
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/fsl,qmc-audio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: QMC audio
+
+maintainers:
+  - Herve Codina <herve.codina@bootlin.com>
+
+description: |
+  The QMC audio is an ASoC component which uses QMC (QUICC Multichannel
+  Controller) channels to transfer the audio data.
+  It provides as many DAI as the number of QMC channel used.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: fsl,qmc-audio
+
+  '#address-cells':
+    const: 1
+  '#size-cells':
+    const: 0
+  '#sound-dai-cells':
+    const: 1
+
+patternProperties:
+  '^dai@([0-9]|[1-5][0-9]|6[0-3])$':
+    description:
+      A DAI managed by this controller
+    type: object
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 63
+        description:
+          The DAI number
+
+      fsl,qmc-chan:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        items:
+          - items:
+              - description: phandle to QMC node
+              - description: Channel number
+        description:
+          Should be a phandle/number pair. The phandle to QMC node and the QMC
+          channel to use for this DAI.
+
+    required:
+      - reg
+      - fsl,qmc-chan
+
+required:
+  - compatible
+  - '#address-cells'
+  - '#size-cells'
+  - '#sound-dai-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    audio_controller: audio-controller {
+        compatible = "fsl,qmc-audio";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        #sound-dai-cells = <1>;
+        dai@16 {
+            reg = <16>;
+            fsl,qmc-chan = <&qmc 16>;
+        };
+        dai@17 {
+            reg = <17>;
+            fsl,qmc-chan = <&qmc 17>;
+        };
+    };
+
+    sound {
+        compatible = "simple-audio-card";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        simple-audio-card,dai-link@0 {
+            reg = <0>;
+            format = "dsp_b";
+            cpu {
+                sound-dai = <&audio_controller 16>;
+            };
+            codec {
+                sound-dai = <&codec1>;
+                dai-tdm-slot-num = <4>;
+                dai-tdm-slot-width = <8>;
+                /* TS 3, 5, 7, 9 */
+                dai-tdm-slot-tx-mask = <0 0 0 1 0 1 0 1 0 1>;
+                dai-tdm-slot-rx-mask = <0 0 0 1 0 1 0 1 0 1>;
+            };
+        };
+        simple-audio-card,dai-link@1 {
+            reg = <1>;
+            format = "dsp_b";
+            cpu {
+                sound-dai = <&audio_controller 17>;
+            };
+            codec {
+                sound-dai = <&codec2>;
+                dai-tdm-slot-num = <4>;
+                dai-tdm-slot-width = <8>;
+                /* TS 2, 4, 6, 8 */
+                dai-tdm-slot-tx-mask = <0 0 1 0 1 0 1 0 1>;
+                dai-tdm-slot-rx-mask = <0 0 1 0 1 0 1 0 1>;
+            };
+        };
+    };
-- 
2.39.1

