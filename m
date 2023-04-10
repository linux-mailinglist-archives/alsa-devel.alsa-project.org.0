Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A08266DCD75
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 00:31:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 892DC101F;
	Tue, 11 Apr 2023 00:30:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 892DC101F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681165876;
	bh=rYU0Rt5rkppKLpzAa3xZ8NW00zaYwLdeynVztImYSGU=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vGjO+x6lrU4F8ax5vLy9E5eJwzJq9PlTsR97JD1hMF9iywp77wzwnX35NPfl1gCHr
	 gtrE+zrY9TSi/UBj4hFsrDhCqoa8KI2yTwUjxgPOZ/AHjHtfENUxh1NF8wGXt1BzqY
	 aPvQ9dx8wHeb6moOuebMT+at1hVW/B6cDP+yS2ck=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7F56F8025E;
	Tue, 11 Apr 2023 00:30:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7116F80448; Tue, 11 Apr 2023 00:30:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DB277F80100
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 00:30:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB277F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=RaOH+5cp
Received: by mail-wm1-x333.google.com with SMTP id l16so3039095wms.1
        for <alsa-devel@alsa-project.org>;
 Mon, 10 Apr 2023 15:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681165803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0D4LsfAW6191QwNdK4ta66PY+hl1RuuGNyGsehh1bKM=;
        b=RaOH+5cpTaSGaPQ96/dB25hRT8d8reD+ky6sQeH+7WLElvuuAeDsMN96MQEUehm+nl
         JquppEasMJwoOBkDPoD+jS09xZgi+pR8KVWYco2JDjdqDzZOZ93TiCJ8oo98L/nZ6R+E
         zj5u4+eHMwtpZL+YR6OACcLwnHOwpuf4Al+WRJfyx3ZdD7DaDvJAU91h98FwV0mXXAgI
         w2QgNZfU9hwTD/6SiqVidbBIy+Etb3MgesVHNdhS7npny42SK2rFfCG1AfHMd0CAymgP
         UjQcVQjB7qKHjqkzmU9MwETrEGr4DDTDe1o84HdKOz97QWclHo1J3suc+iSKe/6YxGtm
         SGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681165803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0D4LsfAW6191QwNdK4ta66PY+hl1RuuGNyGsehh1bKM=;
        b=Jsck3rxLlzAbmC3t5iilsqi6yY8ySmIxk0yg7sN3m6wH7cSRw6wn6n+8VBaZ2rXBKM
         SFDVykXDgFoVnq6CJDsdyIiZeskjSszvvv8P+8/huzBHahAjU7zz9oP8xcB/lbd50LX6
         kKjSzcnOp/YTdh1PhaJoM/tCq3DgHpmG3NhPci9wPwO+sBAhpGLWHfmoUz24LH19VsmB
         IxI/7Jh/wEtNhdCeLFvVwThK88c1Qws6NVaGd9Mj7uZk5ZRSo8wXDXa6OQ7ocVpaDnEx
         ajA8SQ9SSfaDHe1DY5m7f/8ZTYHKl28JTFjDsqsxVU7NxWmjoNHOTMnD1HwYSr0KBCNC
         yw5Q==
X-Gm-Message-State: AAQBX9cD3KkVTVEP8IvBLKg5RYpZ+cSlpXm/AkytCH7NHujW7lXYBaEJ
	qeihZwrqN3uLODMh8Fivqks=
X-Google-Smtp-Source: 
 AKy350ZNlm7b4LIjyU0q14EYTktx6/KUiaIJFJCINddBIpuiCQNGe64Jzpa+jWPi9kCKl0LeTthkGw==
X-Received: by 2002:a05:600c:c4:b0:3ed:f5d4:3bff with SMTP id
 u4-20020a05600c00c400b003edf5d43bffmr8570805wmm.38.1681165803300;
        Mon, 10 Apr 2023 15:30:03 -0700 (PDT)
Received: from localhost ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with UTF8SMTPSA id
 n4-20020a5d51c4000000b002efb55de21dsm8613137wrv.103.2023.04.10.15.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 15:30:02 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: sound: ep93xx: Add I2S description
Date: Tue, 11 Apr 2023 00:29:57 +0200
Message-Id: <20230410222958.2321398-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VP6NO4NESGFJFEYE24LDSZU6LL4RMJVB
X-Message-ID-Hash: VP6NO4NESGFJFEYE24LDSZU6LL4RMJVB
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
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Nikita Shubin <nikita.shubin@maquefel.me>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VP6NO4NESGFJFEYE24LDSZU6LL4RMJVB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add device tree bindings for Cirrus Logic EP93xx internal SoCs' I2S
controller.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v2:
 - Incorporated most of the suggestions from Krzysztof Kozlowski [1]
 - Dropped AC97 (deleted from the tree)

[1]. https://lore.kernel.org/lkml/46d5b6af-23e1-4178-83bc-b4a435b1426e@linaro.org/

 .../bindings/sound/cirrus,ep9301-i2s.yaml     | 66 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,ep9301-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/cirrus,ep9301-i2s.yaml b/Documentation/devicetree/bindings/sound/cirrus,ep9301-i2s.yaml
new file mode 100644
index 000000000000..9c01310a5445
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cirrus,ep9301-i2s.yaml
@@ -0,0 +1,66 @@
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
+allOf:
+  - $ref: dai-common.yaml#
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
+    maxItems: 3
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
+        clocks = <&syscon 29>,
+                 <&syscon 30>,
+                 <&syscon 31>;
+        clock-names = "mclk", "sclk", "lrclk";
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 4485969f58f1..da829bedb89b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2072,6 +2072,7 @@ M:	Alexander Sverdlin <alexander.sverdlin@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/iio/adc/cirrus,ep9301-adc.yaml
+F:	Documentation/devicetree/bindings/sound/cirrus,ep9301-*
 F:	arch/arm/boot/compressed/misc-ep93xx.h
 F:	arch/arm/mach-ep93xx/
 F:	drivers/iio/adc/ep93xx_adc.c
-- 
2.40.0

