Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AFE6751A3
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 10:52:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0B5B2FF8;
	Fri, 20 Jan 2023 10:51:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0B5B2FF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674208335;
	bh=d2GGOOlXjx/PLssSKhXI4mQUj7kqsbFdDCi+CikgItA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ijS8drzrRhl2WlT3OBMmb9Zt+5Wxl0+WmeqHyw07y0/a6/aTPZ93Wl7t+nHJqCdhM
	 SHBZsjUmEEoSoX39JKUsuGykH7k6eLPAqocoFa3C54qsAgD9Jo66Izxr8o9wKgcoI3
	 aAr812lXoFXe91BwTcZ79m+Wg6OiodyKRulQKTMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5F9FF80524;
	Fri, 20 Jan 2023 10:50:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9840FF80495; Fri, 20 Jan 2023 10:50:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE964F80246
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 10:50:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE964F80246
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AWuEjQnC
Received: (Authenticated sender: herve.codina@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id C06DBFF805;
 Fri, 20 Jan 2023 09:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1674208247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kNP9fbFG6xPOV0N7X8iEOKK1c57drZlRTVTKz5WCF+M=;
 b=AWuEjQnC/04LOyJ/7fbQwtDVCb1iMmjxrV+rtemVZm57/9Qsk6gzaSfYdJ+lBgkIstWJvG
 Ba+Pt6IvjhzV9WZqQL6cJ/xNXhaultciRH/PxXuB4KoVGMd3/fn1Zz5Cdy4PVttiwTin3v
 m4g8OASbGbMphyGg8e021y7OtJvNklZFbr8NO2+5NUGzORHrQ8umLz+bvWbci9fJJed3Cl
 82r24/s68YCixFtYcaI7drG8GFyVkOzJbiYi6S+phBlO+TejkUV2k8Ce+ntTou1MhSW9kA
 o3k9ikyfcfs7vLbyL16g22hf7Ud9bLGR69FpWKdW6wAaFQcyfAp7VtTVoNpx3w==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 1/3] dt-bindings: sound: Add Renesas IDT821034 codec
Date: Fri, 20 Jan 2023 10:50:34 +0100
Message-Id: <20230120095036.514639-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120095036.514639-1-herve.codina@bootlin.com>
References: <20230120095036.514639-1-herve.codina@bootlin.com>
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

The Renesas IDT821034 codec is a quad PCM codec with programmable
gain.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 .../bindings/sound/renesas,idt821034.yaml     | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/renesas,idt821034.yaml

diff --git a/Documentation/devicetree/bindings/sound/renesas,idt821034.yaml b/Documentation/devicetree/bindings/sound/renesas,idt821034.yaml
new file mode 100644
index 000000000000..10677d9d8f67
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/renesas,idt821034.yaml
@@ -0,0 +1,75 @@
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
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        audio-codec@0 {
+            compatible = "renesas,idt821034";
+            reg = <0>;
+            spi-max-frequency = <8192000>;
+            spi-cpha;
+            #sound-dai-cells = <0>;
+            gpio-controller;
+            #gpio-cells = <2>;
+        };
+    };
-- 
2.39.0

