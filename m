Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D1D5899E3
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Aug 2022 11:26:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6001B857;
	Thu,  4 Aug 2022 11:25:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6001B857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659605191;
	bh=eGMUFyTETR6M8oDJgpeMwtI9XlrWO7NvNMfD1lJZOzU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eh2bXSpwF/3/9SQiXqtc35CMOZMfuTE0tv9nio4gbq7MDWlbAs1IuQCZRNJkDxhBD
	 JUMpRmgXqW7jDmN2Dpw3OYqQZjcPfiF0JSZ8QuGvqjmv0W1FaEacHdmmqvFdO+Ofjb
	 3Dyz0CJ9x+aTUSmM6w2xQnD1sbu/0jhPgRyBL5sc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC2ABF80212;
	Thu,  4 Aug 2022 11:25:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE908F8016A; Thu,  4 Aug 2022 11:25:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NO_DNS_FOR_FROM,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2720F80083
 for <alsa-devel@alsa-project.org>; Thu,  4 Aug 2022 11:25:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2720F80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RrsOtbIJ"
Received: by mail-pj1-x1032.google.com with SMTP id
 15-20020a17090a098f00b001f305b453feso4703479pjo.1
 for <alsa-devel@alsa-project.org>; Thu, 04 Aug 2022 02:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=pwFRNhdWx8KIASaHfdd1EeDCxr49axa1c6knP9YSvcI=;
 b=RrsOtbIJb9xJTMzlKm9TP1fkPcbVI+6k7dxfKrGM9o83RGF0KzpOMERxX0YJBRXmbt
 EmSlj6MzBXOEs0zVcF3Vx92JGTQMHNwQU3Md7edqfYIMyoXQQfA8ns/5vqHQoA/hz//f
 q5x3onLk+1MVV0UipKjigdf3UKgPKbF/slcB/1AA+DjKUF0B5bx/ZcecRqx98yPE8lkX
 eQ37HK+ZlvKP1IICzBnk8AhKkoWzBtFIVZIKAKP8kuB1QKTXkW90xAcphkrtye98yBQb
 eUS1w8q/uDSxwo1cjDazOz5x84Y3lRFneRST5OrxQzf1yz4MjVWBpMiWISVDHhu5ooaP
 iRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=pwFRNhdWx8KIASaHfdd1EeDCxr49axa1c6knP9YSvcI=;
 b=IjKP0SkBUCVKHMFENS+vgI+hlczRE27oRA9RYYrDkHt+KOgDP7HDfNj03b4025brk5
 DhXvC5Lyx0vHwlYrhXkR11m2DAmvgUbm1pVQ8tzXKRCqfXMzfk4L56E9eagyEcAowzWI
 4foyBBQCHLfP6noYYodxZmmW8qUu7cQDLt/iOiTO1xadx90f6loN9ZJ0bwDWxsv3tU14
 ZQ4x/qwIngS0mf1fqVC6glJDrT2bYiwzKBDIt85pEfC10fW/CMyg4gdNdFIn9ciswKXH
 Q5Ar1++1TQ5KjJBRIAYpR1H3MWfKHJlb+cAETxVKT7GprnbFMv2rq2Mt2pMr3bpuu2sH
 K+PQ==
X-Gm-Message-State: ACgBeo2EhknTvh6Xek9PgQgoS5ZVr/MLqOFjTuNoCKm/EidpYXl+qXA4
 b6k6cofDjIBEmOnpZ6NXyWc2XKpk7HRa2Vuy
X-Google-Smtp-Source: AA6agR66jKeMmNN8UdPuXbzeYMjmM6NmKD+7AMs6YH5R7KWXrg9qMhdNnGJ+xDlKm69b96OQmNsXSQ==
X-Received: by 2002:a17:90b:4aca:b0:1f4:ea26:f589 with SMTP id
 mh10-20020a17090b4aca00b001f4ea26f589mr9289042pjb.142.1659605123311; 
 Thu, 04 Aug 2022 02:25:23 -0700 (PDT)
Received: from a-VirtualBox.. ([116.233.75.140])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a170902e5c200b0016ec8286733sm365901plf.243.2022.08.04.02.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 02:25:23 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v5 1/2] ASoC: dt-bindings: Add Everest ES8326 audio CODEC
Date: Thu,  4 Aug 2022 17:17:59 +0800
Message-Id: <20220804091800.744316-1-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, Zhu Ning <zhuning0077@gmail.com>,
 devicetree@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, broonie@kernel.org, Zhu Ning <zhuning@everest-semi.com>,
 David Yang <yangxiaohua@everest-semi.com>
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

Add device tree binding documentation for Everest ES8326

Signed-off-by: David Yang <yangxiaohua@everest-semi.com>
Signed-off-by: Zhu Ning <zhuning@everest-semi.com>
----
v5 tested by dtschema
---
 .../bindings/sound/everest,es8326.yaml        | 116 ++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/sound/everest,es8326.yaml

diff --git a/Documentation/devicetree/bindings/sound/everest,es8326.yaml b/Documentation/devicetree/bindings/sound/everest,es8326.yaml
new file mode 100755
index 000000000000..07781408e788
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/everest,es8326.yaml
@@ -0,0 +1,116 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/everest,es8326.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Everest ES8326 audio CODEC
+
+maintainers:
+  - David Yang <yangxiaohua@everest-semi.com>
+
+properties:
+  compatible:
+    const: everest,es8326
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: clock for master clock (MCLK)
+
+  clock-names:
+    items:
+      - const: mclk
+
+  "#sound-dai-cells":
+    const: 0
+
+  everest,jack-pol:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: |
+      just the value of reg 57. Bit(3) decides whether the jack polarity is inverted.
+      Bit(2) decides whether the button on the headset is inverted.
+      Bit(1)/(0) decides the mic properity to be OMTP/CTIA or auto.
+    minimum: 0x00
+    maximum: 0x0f
+    default: 0x0f
+
+  everest,mic1-src:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description:
+      the value of reg 2A when headset plugged.
+    minimum: 0x00
+    maximum: 0x77
+    default: 0x22
+
+  everest,mic2-src:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description:
+      the value of reg 2A when headset unplugged.
+    minimum: 0x00
+    maximum: 0x77
+    default: 0x44
+
+  everest,jack-detect-inverted:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Defined to invert the jack detection.
+
+  everest,interrupt-src:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: |
+      value of reg 0x58, Defines the interrupt source.
+      Bit(2) 1 means button press triggers irq, 0 means not.
+      Bit(3) 1 means PIN9 is the irq source for jack detection. When set to 0,
+      bias change on PIN9 do not triggers irq.
+      Bit(4) 1 means PIN27 is the irq source for jack detection.
+      Bit(5) 1 means PIN9 is the irq source after MIC detect.
+      Bit(6) 1 means PIN27 is the irq source after MIC detect.
+    minimum: 0
+    maximum: 0x3c
+    default: 0x08
+
+  everest,interrupt-clk:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: |
+     value of reg 0x59, Defines the interrupt output behavior.
+     Bit(0-3) 0 means irq pulse equals 512*internal clock
+       1 means irq pulse equals 1024*internal clock
+       2 means ...
+       7 means irq pulse equals 65536*internal clock
+       8 means irq mutes PA
+       9 means irq mutes PA and DAC output
+     Bit(4) 1 means we invert the interrupt output.
+     Bit(6) 1 means the chip do not detect jack type after button released.
+       0 means the chip detect jack type again after button released.
+    minimum: 0
+    maximum: 0x7f
+    default: 0x45
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      es8326: codec@19 {
+        compatible = "everest,es8326";
+        reg = <0x19>;
+        clocks = <&clks 10>;
+        clock-names = "mclk";
+        #sound-dai-cells = <0>;
+        everest,mic1-src = [22];
+        everest,mic2-src = [44];
+        everest,jack-pol = [0e];
+        everest,interrupt-src = [08];
+        everest,interrupt-clk = [45];
+      };
+    };
-- 
2.36.1

