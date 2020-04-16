Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4452A1AB4A4
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 02:16:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D17D11663;
	Thu, 16 Apr 2020 02:15:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D17D11663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586996184;
	bh=bdwxc5pCISq4GpAuJml/WzktWhhfTtZ5LVfgIaTaTZY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IbGnWOc/dbNcc4zuNHfIvpMPOZsoqX7CpxcE0jWstZFNl4HyNngZvMpK9kqAjp7yN
	 e56WeYAtIuEZuTh5KvJwK7miVMCIZXaNCZHJ4ak+qt27dfK/WpkIAtIyYnWbAqtszO
	 42MAqzwxHcWbDhlUUTU8PWZ17EhGzhQDrE0ycHeU=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0644FF8025F;
	Thu, 16 Apr 2020 02:14:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB633F8025F; Thu, 16 Apr 2020 02:14:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77FD2F80115
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 02:14:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77FD2F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="q+0qSLNi"
Received: by mail-qt1-x844.google.com with SMTP id c16so9329909qtv.1
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 17:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=pIUSEdVkYnzUbRZnkBabNoQ8PA+FbWN+5gp6Ca6tF8g=;
 b=q+0qSLNia0iJHTK4tDzgVoXW/iaWNN/Cj5Dtk9LxON5XaHhjhR0wBvMSEX8kulQxy1
 g9e4WyorxLfF20kNjj0p5VYgU1M6VQbuDotniG/5fxe//maq5lQD7VKfViKTr6Lnqo4c
 bLzJAeSxYtW7gl9JbrGOxijSdXhlBeS8S2ycSOvgRdsgk58zx2AulNWFxBCVfojmSoxb
 c6PMvbfxloUNOoScmGG6RiOXrtHm1u856NsXHkxg9yX+2P8K5og08Dv1T93rESAZaTN5
 safQT4MchBYR+1bSCUivV4x12zWtMWJTQbdK6Vj2oLj7YHrY3rLc93lNr7UieHFo22el
 rRfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=pIUSEdVkYnzUbRZnkBabNoQ8PA+FbWN+5gp6Ca6tF8g=;
 b=d0IAqDovPdLDALwvW1UvxNDzRadICR+sy08Z6l/8uzovEG3J5ahaKRfmghk9Rsntky
 0j6YGS+1KbUe/RrVP3rmjqCTpVw22o+hDVw6SCXFQaOHX59O9+NcveOtAkOnBQvevWqX
 e9gaM4mIwjZ21urcrtQ5WwSrj4AsU6l49PtPjrY2wluzhhsu2rw+sS+MxswYTg/wAkPg
 d5QkHUo7hBlDTvhwmsSJDLdX5N/g8YVvcx124omj8K1XLq7tvXImghgJMK9sQIdL2UHq
 7heam/1griDDGJ9dldCykK8BTNlKEwWHyMAobtxR9z8+bzxHHqauelwnwcAuRlMVjDgE
 Lkxg==
X-Gm-Message-State: AGi0PuYWRHrCUJ/1LYTbigFyt9WOspJZhXngYcqp2CX5P40jyo9+Iczs
 fZ3Nper4107E/tX5jhql2BQ=
X-Google-Smtp-Source: APiQypJXSUQZOgihlU2mIcclWqeseQ99JyYBajbA5ktpmn2uSKAUUFAzTMMX57omUZ7FlaxHo3u+EQ==
X-Received: by 2002:ac8:2783:: with SMTP id w3mr23654972qtw.265.1586996059405; 
 Wed, 15 Apr 2020 17:14:19 -0700 (PDT)
Received: from localhost.localdomain ([72.53.229.195])
 by smtp.gmail.com with ESMTPSA id v27sm5199071qtb.35.2020.04.15.17.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 17:14:18 -0700 (PDT)
From: Sven Van Asbroeck <thesven73@gmail.com>
X-Google-Original-From: Sven Van Asbroeck <TheSven73@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v1 1/2] dt-bindings: sound: add Microsemi ZL38060 binding
Date: Wed, 15 Apr 2020 20:14:13 -0400
Message-Id: <20200416001414.25746-1-TheSven73@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org
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

Add devicetree binding for the Microsemi ZL38060 Connected
Home Audio Processor.

Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
---

Tree: v5.7-rc1

 .../devicetree/bindings/sound/zl38060.yaml    | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/zl38060.yaml

diff --git a/Documentation/devicetree/bindings/sound/zl38060.yaml b/Documentation/devicetree/bindings/sound/zl38060.yaml
new file mode 100644
index 000000000000..8e1976bee76b
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/zl38060.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/zl38060.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZL38060 Connected Home Audio Processor from Microsemi.
+
+description: |
+  The ZL38060 is a "Connected Home Audio Processor" from Microsemi,
+  which consists of a Digital Signal Processor (DSP), several Digital
+  Audio Interfaces (DAIs), analog outputs, and a block of 14 GPIOs.
+
+maintainers:
+  - Jaroslav Kysela <perex@perex.cz>
+  - Takashi Iwai <tiwai@suse.com>
+
+properties:
+  compatible:
+    const: mscc,zl38060
+
+  reg:
+    description:
+      SPI device address.
+    maxItems: 1
+
+  spi-max-frequency:
+    maximum: 24000000
+
+  reset-gpios:
+    description:
+      A GPIO line handling reset of the chip. As the line is active low,
+      it should be marked GPIO_ACTIVE_LOW (see ../gpio/gpio.txt)
+    maxItems: 1
+
+  mscc,load-firmware:
+    description:
+      If present, the driver will attempt to load firmware into the chip via
+      the SPI interface.
+    type: boolean
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-controller: true
+
+  '#sound-dai-cells':
+    const: 0
+
+  amp-en-gpios:
+    description:
+      An optional GPIO line which is active when the codec is playing back
+      audio. Can be used to control an external amplifier.
+    maxItems: 1
+
+  mscc,amp-startup-delay-ms:
+    description:
+      An optional delay between amp-en-gpio becoming active, and the start
+      of audio playback. In milliseconds.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - reg
+  - '#gpio-cells'
+  - gpio-controller
+  - '#sound-dai-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    spi0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        codec: zl38060@0 {
+            gpio-controller;
+            #gpio-cells = <2>;
+            #sound-dai-cells = <0>;
+            compatible = "mscc,zl38060";
+            reg = <0>;
+            spi-max-frequency = <12000000>;
+            reset-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
+            amp-en-gpios = <&codec 3 GPIO_ACTIVE_HIGH>;
+            mscc,amp-startup-delay-ms = <12>;
+            mscc,load-firmware;
+        };
+    };
-- 
2.17.1

