Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE800665CFB
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 14:50:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D166E75F;
	Wed, 11 Jan 2023 14:49:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D166E75F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673445044;
	bh=72Or1qUgafJsd37ESUByqIlqJUw5RdgVuvU2Ms963kI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rzlMEvIAGVKMIwTvXfc5Ywf8Cl3lrSTEQMZ4JkEsuHEsDD8ic4KmPBzvdnqikiNls
	 d+hQpY0XHBpZ/+s10iFkNv5ihd7rQpzyLVaipiOhbjDxVZFN0W3V15jwMq2mj1Z/3h
	 bX5GMu4nv96VME4OMSFGU5qNsuXTi6tiElRejczs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80E6DF8026A;
	Wed, 11 Jan 2023 14:49:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E95CF80424; Wed, 11 Jan 2023 14:49:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F8B8F80424
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 14:49:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F8B8F80424
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=itfjrbvW
Received: (Authenticated sender: herve.codina@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id F3FB4FF80D;
 Wed, 11 Jan 2023 13:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1673444960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NMswGhUaze/v3+qic5VpHszBxBNoPuzv9ek9RV8ZYW4=;
 b=itfjrbvWHwsoMaF5WE3s7Am2NwNtjC5JHm6CMoCMWzMKNI++OcAbyr4Hx5DC5TqB/1n1wc
 kJd51ocvxxrZsrG/VslKSbyv53CfTJXhlnDMVESUMuQjCv6RBRjqqQ6sUd+aOeTR0JyxoU
 V/D3kxbR9B+EetgXovAsGhYgm6MITU6Ox+vP7iNZIkTa0SeFB7LyRsBII1ljsJtFTQPDVQ
 NYPtWbC+DSVIRMEIc5NPEb6BX8CWsl75qjlLwQPJqSRqABKgKFxTPgRhM+SWsA25nlzxnS
 X5rlwNs/iKuKRsSBIX313a1KCNN77uaWrFhQ3vSULTc8pB8cCYpY4Hp1pEBRAg==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/3] dt-bindings: sound: Add Renesas IDT821034 codec
Date: Wed, 11 Jan 2023 14:49:03 +0100
Message-Id: <20230111134905.248305-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230111134905.248305-1-herve.codina@bootlin.com>
References: <20230111134905.248305-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The Renesas IDT821034 codec is a quad PCM codec with
programmable gain.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 .../bindings/sound/renesas,idt821034.yaml     | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/renesas,idt821034.yaml

diff --git a/Documentation/devicetree/bindings/sound/renesas,idt821034.yaml b/Documentation/devicetree/bindings/sound/renesas,idt821034.yaml
new file mode 100644
index 000000000000..2c29b770e3f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/renesas,idt821034.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/renesas,idt821034.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas IDT821034 codec device
+
+maintainers:
+  - Herve Codina <herve.codina@bootlin.com>
+
+description: |
+  The IDT821034 codec is a four channel PCM codec with onchip filters and
+  programmable gain setting.
+
+  The time-slots used by the codec must be set and so, the properties
+  'dai-tdm-slot-num', 'dai-tdm-slot-width', 'dai-tdm-slot-tx-mask' and
+  'dai-tdm-slot-rx-mask' must be present in the ALSA sound card node for
+  sub-nodes that involve the codec. The codec uses one 8bit time-slot per
+  channel.
+  'dai-tdm-tdm-slot-with' must be set to 8.
+
+  The IDT821034 codec also supports 5 gpios (SLIC signals) per channel.
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+  - $ref: /schemas/gpio/gpio.yaml#
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: renesas,idt821034
+
+  reg:
+    description:
+      SPI device address.
+    maxItems: 1
+
+  spi-max-frequency:
+    maximum: 8192000
+
+  spi-cpha: true
+
+  '#sound-dai-cells':
+    const: 0
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-controller: true
+
+required:
+  - compatible
+  - reg
+  - spi-cpha
+  - '#sound-dai-cells'
+  - gpio-controller
+  - '#gpio-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    spi0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        codec: idt821034@0 {
+            compatible = "renesas,idt821034";
+            reg = <0>;
+            spi-max-frequency = <8192000>;
+            spi-cpha;
+            #sound-dai-cells = <0>;
+            gpio-controller;
+            #gpio-cells = <2>;
+        };
+    };
+    sound {
+        compatible = "simple-audio-card";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        simple-audio-card,dai-link@0 {
+            reg = <0>;
+            format = "dsp_b";
+            cpu {
+                sound-dai = <&cpu_dai>;
+            };
+            codec {
+                sound-dai = <&codec>;
+                dai-tdm-slot-num = <4>;
+                dai-tdm-slot-width = <8>;
+                /* TS 2, 3, 5, 7 */
+                dai-tdm-slot-tx-mask = <0 0 1 1 0 1 0 1>;
+                dai-tdm-slot-rx-mask = <0 0 1 1 0 1 0 1>;
+            };
+        };
+    };
-- 
2.38.1

