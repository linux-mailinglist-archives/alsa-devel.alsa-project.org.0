Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FF768C081
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 15:50:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33C681D6;
	Mon,  6 Feb 2023 15:49:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33C681D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675695049;
	bh=gAw4UNXncZKJid1ywDivRZo1ilxa/KdJ/ct3KKjhTpA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nUUERjF8hd+u5Ugp+32QDxCaHHkM5HkJiAkEyavaXL7tzlimKy5y11xWrs0HKdiea
	 YJg32Qln5HgHy8REHzB/PIlJHVVfaOVc/sq8bI6MlESoJ8m5etiykiaCjxFQinaMhM
	 pSh7pKwzpFuR6/cZXlaKxSEPRMZWxK/3wq2vxSz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 918FAF80537;
	Mon,  6 Feb 2023 15:49:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41E23F80533; Mon,  6 Feb 2023 15:49:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9339F800E3
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 15:49:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9339F800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gyaIhfKU
Received: (Authenticated sender: herve.codina@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 7FAB16000D;
 Mon,  6 Feb 2023 14:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1675694960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hc6tSYGP6pagK3HP8K5vQ3QQwbkp4/tptja2Ht0GKFQ=;
 b=gyaIhfKU3HeXmm3q7l9+kcBrul7dOc3Y05n+SoLGJRlpgK0BypASD7/fgtSK0m9fwCewPu
 LzCeCb0slfEN5GNjo62KkrOvCPddVn1JhteeOljtZBOdKSeIvxsz8pfSPx0pSgu7n1QBBn
 9IKoTBwKoc9llEh/vMAv7bNiCE2E2HTnd2Gf8umYwCNO7CG61DE9u5MHkRbnPvcTwJtqGY
 xv4FLTsxSXZpYaSEC4fGUm4We7UwUK1f91IZpRDzgKxbJtbNd2SKmZz0P/6f1btinp4IOV
 kRBkuYuD/Cto75NHKpvZyegLMzAbWQFyuA0Uv+yFmSYjRjh4GPAqbaLckacOrg==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/3] dt-bindings: sound: Add the Infineon PEB2466 codec
Date: Mon,  6 Feb 2023 15:49:02 +0100
Message-Id: <20230206144904.91078-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206144904.91078-1-herve.codina@bootlin.com>
References: <20230206144904.91078-1-herve.codina@bootlin.com>
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

The Infineon PEB2466 codec is a programmable DSP-based four channels
codec with filters capabilities.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 .../bindings/sound/infineon,peb2466.yaml      | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/infineon,peb2466.yaml

diff --git a/Documentation/devicetree/bindings/sound/infineon,peb2466.yaml b/Documentation/devicetree/bindings/sound/infineon,peb2466.yaml
new file mode 100644
index 000000000000..66993d378aaf
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/infineon,peb2466.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/infineon,peb2466.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Infineon PEB2466 codec
+
+maintainers:
+  - Herve Codina <herve.codina@bootlin.com>
+
+description: |
+  The Infineon PEB2466 codec is a programmable DSP-based four channels codec
+  with filters capabilities.
+
+  The time-slots used by the codec must be set and so, the properties
+  'dai-tdm-slot-num', 'dai-tdm-slot-width', 'dai-tdm-slot-tx-mask' and
+  'dai-tdm-slot-rx-mask' must be present in the sound card node for sub-nodes
+  that involve the codec. The codec uses one 8bit time-slot per channel.
+  'dai-tdm-tdm-slot-with' must be set to 8.
+
+  The PEB2466 codec also supports 28 gpios (signaling pins).
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: infineon,peb2466
+
+  reg:
+    description:
+      SPI device address.
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Master clock
+
+  clock-names:
+    items:
+      - const: mclk
+
+  spi-max-frequency:
+    maximum: 8192000
+
+  reset-gpios:
+    description:
+      GPIO used to reset the device.
+    maxItems: 1
+
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Filters coefficients file to load. If this property is omitted, internal
+      filters are disabled.
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
+  - '#sound-dai-cells'
+  - gpio-controller
+  - '#gpio-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        audio-codec@0 {
+            compatible = "infineon,peb2466";
+            reg = <0>;
+            spi-max-frequency = <8192000>;
+            reset-gpios = <&gpio 10 GPIO_ACTIVE_LOW>;
+            #sound-dai-cells = <0>;
+            gpio-controller;
+            #gpio-cells = <2>;
+        };
+    };
-- 
2.39.1

