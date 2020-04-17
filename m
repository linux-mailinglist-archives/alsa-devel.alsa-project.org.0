Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 345AA1AE802
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 00:15:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9829F165D;
	Sat, 18 Apr 2020 00:14:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9829F165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587161739;
	bh=ouqdedeAZO7/33eRrl2/kyLvQ76xokGUoHejswbOxBk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Rfl3sTprf0XQFOXc2IF5PlAImuVycCkElhTiHxFtf0i8cgGimsmAxcIPKnYri3WlO
	 DdXWP9Rjysjuo+cpEM8TIFDNlGgB2ewY2m4CULYyA/1TOL4tYi91L84hgjNsGQAHNZ
	 +8fs0oQTg8Mntt1Y6JZAocOnyZc+IAGPDElrOSFY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC38CF80229;
	Sat, 18 Apr 2020 00:13:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66BC9F8025F; Sat, 18 Apr 2020 00:13:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 829A4F8012E
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 00:13:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 829A4F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CzHuzbBr"
Received: by mail-qk1-x741.google.com with SMTP id v7so4225662qkc.0
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 15:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=iZwNKOyj4NwNMXhZfqTeRorCY/0+cxmYDzA7LdOH228=;
 b=CzHuzbBrOPSwENlS63xf247SLJsqy+HezhesqQH2aCg8/sGnDMinR5qoBT8TPTqEY7
 tlvgZPKQobRdwVWfgdgL+sTX0oiwb+4ISuYs6BrraipRJ0CsXL9RgFstY5ojbXd451w9
 ywLkV4aJE1Y+5O5J1218vcROKvmij/ZmCdRi6HaTubypeNhWrZDPLPfWsj0hAJo6GNBc
 BRDn4J7n736qVzg6dVZCQyC2ohRayKXEsj/FJq/juafyC62wgZnnQT47aggkWu/y7X2t
 crZVIjiGAlKClP3Ce2+IwKGSPLIUHYKrgWadyt7llL2HaFLR56hgKrtIzeX/AYptvEj4
 S4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=iZwNKOyj4NwNMXhZfqTeRorCY/0+cxmYDzA7LdOH228=;
 b=qX13vXwOsO8fmvEWfuDA/kqzoBI4QjeIP7ueDFmAicWCDTodxqbPEodeZZvuFZjvOk
 ub1Fk+ywUIWf4adHdS0ON1SIxZ0X0/TZoxOwkr1vLqSV4LcKCPTqDEPKJOOhXTZa/M/B
 4i5mzEx0FPj7Fqfm5NGcpquKvto94NGNeNiH+BoGV7dFuTsxdA9siTjaVgqf9WUpxKJ6
 sU+NGLrI3/HI+mrtJBqGND/kX22eLDFJriIXtwB5+fb5NL0Kd4LgfIHoaMi3Cms8l0rL
 6Cg8evvnnx6jpjEi/8DmEB2IL9vvZk7F3+NK5d+/BKHilp55bESZZeskICiuXcrd00kQ
 nzVg==
X-Gm-Message-State: AGi0PuafF82eTL0kg40ozN+vN712+7/rtY6oEQTOOj+pAh/cCfT2+XXY
 Qnk4h252tRAdgUYHlnAgPgg=
X-Google-Smtp-Source: APiQypKUWeVW/aqVwxqOtgWr0FHKUWN77nS8urp+P97zU8zc5k1GGUly5gXQ9YyRvDYFQjGofKgr9A==
X-Received: by 2002:a05:620a:6b0:: with SMTP id
 i16mr5206640qkh.385.1587161625578; 
 Fri, 17 Apr 2020 15:13:45 -0700 (PDT)
Received: from localhost.localdomain ([72.53.229.195])
 by smtp.gmail.com with ESMTPSA id u65sm17780126qkh.100.2020.04.17.15.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 15:13:45 -0700 (PDT)
From: Sven Van Asbroeck <thesven73@gmail.com>
X-Google-Original-From: Sven Van Asbroeck <TheSven73@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 1/2] dt-bindings: sound: add Microsemi ZL38060 binding
Date: Fri, 17 Apr 2020 18:13:40 -0400
Message-Id: <20200417221341.31428-1-TheSven73@gmail.com>
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

v1->v2:

- removed all properties related to amp-en-gpios
- removed 'mscc,load-firmware' property

For further details, see v1->v2 notes in 2nd patch.

 .../devicetree/bindings/sound/zl38060.yaml    | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/zl38060.yaml

diff --git a/Documentation/devicetree/bindings/sound/zl38060.yaml b/Documentation/devicetree/bindings/sound/zl38060.yaml
new file mode 100644
index 000000000000..338e2a13c775
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/zl38060.yaml
@@ -0,0 +1,69 @@
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
+  '#gpio-cells':
+    const: 2
+
+  gpio-controller: true
+
+  '#sound-dai-cells':
+    const: 0
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
+        };
+    };
-- 
2.17.1

