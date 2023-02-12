Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 175AA693B16
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 00:22:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71347209;
	Mon, 13 Feb 2023 00:21:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71347209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676244168;
	bh=C06VX05TcW1I4bOIHYFHLkWdSczpwmDHwYtqx/kD/0M=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=b+fvrjXdz12ITrqj3mBkwMh0sYPRUcsze8gjVQzSZzi/HXtJhQ9rhqrNfB5Xl3Dve
	 DGFKN9zMlIIn9izHnXSmL6WRObm42OOaM8THsCFg/ymX7Y5DxVeMCdCeteO6BhZ/VV
	 xXFNjQIehXoEdyPc2NrQ1eBHzadtqOwlT/MQbG0Q=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97AB2F8012A;
	Mon, 13 Feb 2023 00:21:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8DC8F804B4; Mon, 13 Feb 2023 00:21:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B408F8001E
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 00:21:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B408F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YxAW4UwT
Received: by mail-wm1-x32e.google.com with SMTP id
 l37-20020a05600c1d2500b003dfe46a9801so7823769wms.0
        for <alsa-devel@alsa-project.org>;
 Sun, 12 Feb 2023 15:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxzNaW6I0fLNWCS9Oc9e/6gDL8buv4rI/3fG8NdUfZM=;
        b=YxAW4UwTezMfmdVo1Nl41KG8a4sWPOcryhtlVzJT6IDZQys7SAk5XgHXBH+Mg273iV
         5+yYjnaZhL1+NWtm3/KlVHau/wjEB+F/cIi1/ORB/gOdnmu8BUgit3HH7BcoRHZj+FSa
         F4GdZsFS5+eFfZyTcLs9TK6Yw2kCdqKXz/sEH4cN7e0C2gMZb1fSqYB9usEghhjSkmuR
         QMLT8x1F+wp+hASXNroo9caQGZx+3xTYVNcTfMI4rbMq3iYS2pxrhtRi28FPTjmaQjFx
         zoX3OSAuAuSMmbCOINuwSGPWupzrpCKJjatfUV8fiD3PX3RgQ6vOzdcs1qjvBjmG1IHS
         kgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZxzNaW6I0fLNWCS9Oc9e/6gDL8buv4rI/3fG8NdUfZM=;
        b=Qujn4cx5mSYeYsvNz+HhgEtucipepr2ptxkev/qhzMuBzf7aeXM6gyGPUab0gqs1H/
         bAuJxUWHGCHf9t0bFMnRe30c03qGhVixt1T4/HU1raH99hMeNSbBjvpEGCM0i0CgLv5n
         UsK6zCLHGiO8PAjQjOXziiUF7/wMQUYAl6otmiZuUDSm/T3NahpSfVevGTwOS+ElDANv
         Mxr6ATWNqj3AT3YqGSRtGQgw25BOI99miyiM+/7f+O4iVm7PWRVgd2WGzYyhg7RUFTho
         Cz2QIkDeNgNirl/cglM73Dmt4ktkGXdWMIMxdGqFGu2yHYkqSnE//ViqG2FYZ1K/KWWt
         ln0g==
X-Gm-Message-State: AO0yUKXT5NeTE28vkjT1G4y5FRpsDtYhZcZPc6iCKQTyjwFM3N4AtFS2
	XhiYhDeeHiUvUuLKCZN1G1M=
X-Google-Smtp-Source: 
 AK7set8FeLsNAVdoImo2fwRuicgKBYl6QRDgEjD9OLjW+s7/9U/IdECxA+GDa3j7X7NsiZx3ZSGzXg==
X-Received: by 2002:a05:600c:3086:b0:3dc:5c86:12f3 with SMTP id
 g6-20020a05600c308600b003dc5c8612f3mr21658640wmn.1.1676244101006;
        Sun, 12 Feb 2023 15:21:41 -0800 (PST)
Received: from localhost ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with UTF8SMTPSA id
 g20-20020a7bc4d4000000b003a3442f1229sm15417359wmk.29.2023.02.12.15.21.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Feb 2023 15:21:40 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: sound: ep93xx: Add I2S and AC'97
 descriptions
Date: Mon, 13 Feb 2023 00:21:36 +0100
Message-Id: <20230212232137.299005-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YZEFPIKLW33VPE7LO5EPL45A6KIDQOUU
X-Message-ID-Hash: YZEFPIKLW33VPE7LO5EPL45A6KIDQOUU
X-MailFrom: alexander.sverdlin@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YZEFPIKLW33VPE7LO5EPL45A6KIDQOUU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add device tree bindings for Cirrus Logic EP93xx internal SoCs' I2S and
AC'97 controllers.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 .../bindings/sound/cirrus,ep9301-ac97.yaml    | 47 ++++++++++++++
 .../bindings/sound/cirrus,ep9301-i2s.yaml     | 63 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 3 files changed, 111 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,ep9301-ac97.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,ep9301-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/cirrus,ep9301-ac97.yaml b/Documentation/devicetree/bindings/sound/cirrus,ep9301-ac97.yaml
new file mode 100644
index 000000000000..bfa5d392f525
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cirrus,ep9301-ac97.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cirrus,ep9301-ac97.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cirrus EP93xx AC'97 Controller
+
+description: |
+  The AC’97 Controller includes a 5-pin serial interface to an external audio
+  codec.
+
+maintainers:
+  - Alexander Sverdlin <alexander.sverdlin@gmail.com>
+
+properties:
+  compatible:
+    const: cirrus,ep9301-ac97
+
+  '#sound-dai-cells':
+    const: 0
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - '#sound-dai-cells'
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    ac97: ac97@80880000 {
+        compatible = "cirrus,ep9301-ac97";
+        #sound-dai-cells = <0>;
+        reg = <0x80880000 0xac>;
+        interrupt-parent = <&vic0>;
+        interrupts = <6>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/cirrus,ep9301-i2s.yaml b/Documentation/devicetree/bindings/sound/cirrus,ep9301-i2s.yaml
new file mode 100644
index 000000000000..b47d28dc8389
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cirrus,ep9301-i2s.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cirrus,ep9301-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cirrus EP93xx I2S Controller
+
+description: |
+  The I2S controller is used to stream serial audio data between the external
+  I2S CODECs’, ADCs/DACs, and the ARM Core. The controller supports I2S, Left-
+  and Right-Justified DSP formats.
+
+maintainers:
+  - Alexander Sverdlin <alexander.sverdlin@gmail.com>
+
+properties:
+  compatible:
+    const: cirrus,ep9301-i2s
+
+  '#sound-dai-cells':
+    const: 0
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 3
+
+  clock-names:
+    items:
+      - const: mclk
+      - const: sclk
+      - const: lrclk
+
+required:
+  - compatible
+  - '#sound-dai-cells'
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    i2s: i2s@80820000 {
+        compatible = "cirrus,ep9301-i2s";
+        #sound-dai-cells = <0>;
+        reg = <0x80820000 0x100>;
+        interrupt-parent = <&vic1>;
+        interrupts = <28>;
+        clocks = <&syscon 29
+                  &syscon 30
+                  &syscon 31>;
+        clock-names = "mclk", "sclk", "lrclk";
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 254aab631fd4..765902756c37 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2092,6 +2092,7 @@ M:	Alexander Sverdlin <alexander.sverdlin@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/iio/adc/cirrus,ep9301-adc.yaml
+F:	Documentation/devicetree/bindings/sound/cirrus,ep9301-*
 F:	arch/arm/mach-ep93xx/
 F:	arch/arm/mach-ep93xx/include/mach/
 F:	drivers/iio/adc/ep93xx_adc.c
-- 
2.39.1

