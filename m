Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8216C1EDA
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 19:01:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1164A847;
	Mon, 20 Mar 2023 19:00:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1164A847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679335299;
	bh=wLKqHQRjI2D2KZUIOXY/jJbOJxCaUAFsauLmbN33B2s=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DyzqR0rAqtfj77ySSLZbzWIHxEALPnesLqhQStuJa6DW5qqv6LrOej9SMaTjjkudm
	 SwRdcRTnjE+DyOvFC3cHCoEzn88zAB4pdU3yPyFnWegevi2tBpzWHH88AJ2HKuPiI1
	 1/XjpYluuCnO59GjzgTGvg1XPXMyjF9JPnjg5mvw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A99A8F80557;
	Mon, 20 Mar 2023 18:59:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB588F80423; Wed, 15 Mar 2023 18:43:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4E143F800C9
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 18:43:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E143F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=PU6a6Bo1
Received: by mail-lj1-x22c.google.com with SMTP id l22so2185539ljc.11
        for <alsa-devel@alsa-project.org>;
 Wed, 15 Mar 2023 10:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678902191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QOzpvocKnFn0bAY8kRGLV91Cn/phdFGP7VeaxQqiMc4=;
        b=PU6a6Bo1HBsIOsXuNxNPjGHmlOnM3WpM2kO9fAy259HWUtfyjGdYxZEH9ZnYBkpVO5
         kDEEmKGRrjskEwEsKOBIpNobTQVBUfhgjQUGxPl9LWd9iRUo8YUq06Q7PPUYIgZK/Kdx
         ODcxcaefggEbctRVYy+yERJLWEi8azmbt9YFFgrhuuzQVMkOo8Rheo6Tte4ZmcKujJtM
         lJgFaCS0o1yzqPWDb1diMRg5RQPOwmUcNa/Vm/FwIM3SRxwWmaKJuQwjpb4zjqUVnotp
         eeqgpLeOkixV6RQ3MBZvfKkKHE8abN6nlPt4PTMtWgbJqLs4SC5Kmd0zAg3WQ/H429gR
         afNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678902191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QOzpvocKnFn0bAY8kRGLV91Cn/phdFGP7VeaxQqiMc4=;
        b=Wu2OtBE6M3yn2CU8Zf9e88ULCokL7nv1OApp+8Cd6S1QU5yNuKfQveH3iG1LtNv03B
         nt+WTlb9QTcxNScZCZzjfooFWrQrySvfBBhmTYvUjXRr7hGWa4e7nspNhF7GyE2tfsw7
         GpQysC77TTx0jpVucX38Y8hTEiqgr3ZwLGvpac6Sd8IYVsd1INno2wDKi2AKxXuDyS5G
         gW4VzhSNB+Ki3Qid9O7OtoosiF2azUSGDNXug8vEn8GS/fyqflnzjo7H1x7RHSwwwJ38
         A5ZT7dBg7qACktGHN7+Ca408lrYzFT+QBsxUcfZmDDviMTgOjb9WtlPxNJ7WiMECx9hR
         MJeA==
X-Gm-Message-State: AO0yUKUmac9mKRta3rEPr5NMkdORUe9ecQWgAgvAITSOmDG4YXAq6N9x
	riCzYKpGwOzKXq/51ReVsFY=
X-Google-Smtp-Source: 
 AK7set9BOXMjvo9FUWWObEWS1XtxgqYPJQ6b1AdcZ2lDSva8HdsWyaENajgJqB/WNCNScPJPi6JWKA==
X-Received: by 2002:a2e:a54a:0:b0:298:aa76:2fb8 with SMTP id
 e10-20020a2ea54a000000b00298aa762fb8mr1439229ljn.12.1678902190973;
        Wed, 15 Mar 2023 10:43:10 -0700 (PDT)
Received: from otabekn-HP-ProBook-650-G4.. ([93.170.231.237])
        by smtp.googlemail.com with ESMTPSA id
 s25-20020a2e9c19000000b0029870223d23sm927000lji.73.2023.03.15.10.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 10:43:10 -0700 (PDT)
From: Otabek Nazrullaev <otabeknazrullaev1998@gmail.com>
To: 
Subject: [PATCH] ASoC: dt-bindings: maxim,max9759: Convert to DT schema.
Date: Thu, 16 Mar 2023 02:33:30 +0900
Message-Id: <20230315173404.7215-1-otabeknazrullaev1998@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: otabeknazrullaev1998@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6GSNO5FTJTVTAZUJCGOMP7MIMWSH6J3Q
X-Message-ID-Hash: 6GSNO5FTJTVTAZUJCGOMP7MIMWSH6J3Q
X-Mailman-Approved-At: Mon, 20 Mar 2023 17:59:13 +0000
CC: Otabek Nazrullaev <otabeknazrullaev1998@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6GSNO5FTJTVTAZUJCGOMP7MIMWSH6J3Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert Maxim MAX9759 Speaker Amplifier bindings to DT schema.
Add missing gpio header file into examples section

Signed-off-by: Otabek Nazrullaev <otabeknazrullaev1998@gmail.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>
---
 .../bindings/sound/maxim,max9759.txt          | 18 --------
 .../bindings/sound/maxim,max9759.yaml         | 45 +++++++++++++++++++
 2 files changed, 45 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/maxim,max9759.txt
 create mode 100644 Documentation/devicetree/bindings/sound/maxim,max9759.yaml

diff --git a/Documentation/devicetree/bindings/sound/maxim,max9759.txt b/Documentation/devicetree/bindings/sound/maxim,max9759.txt
deleted file mode 100644
index 737a996374d3..000000000000
--- a/Documentation/devicetree/bindings/sound/maxim,max9759.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-Maxim MAX9759 Speaker Amplifier
-===============================
-
-Required properties:
-- compatible : "maxim,max9759"
-- shutdown-gpios : the gpio connected to the shutdown pin
-- mute-gpios : the gpio connected to the mute pin
-- gain-gpios : the 2 gpios connected to the g1 and g2 pins
-
-Example:
-
-max9759: analog-amplifier {
-	compatible = "maxim,max9759";
-	shutdown-gpios = <&gpio3 20 GPIO_ACTIVE_LOW>;
-	mute-gpios = <&gpio3 19 GPIO_ACTIVE_LOW>;
-	gain-gpios = <&gpio3 23 GPIO_ACTIVE_LOW>,
-		     <&gpio3 25 GPIO_ACTIVE_LOW>;
-};
diff --git a/Documentation/devicetree/bindings/sound/maxim,max9759.yaml b/Documentation/devicetree/bindings/sound/maxim,max9759.yaml
new file mode 100644
index 000000000000..a76ee6a635af
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/maxim,max9759.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/maxim,max9759.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim MAX9759 Speaker Amplifier
+
+maintainers:
+  - Otabek Nazrullaev <otabeknazrullaev1998@gmail.com>
+
+properties:
+  compatible:
+    const: maxim,max9759
+
+  shutdown-gpios:
+    maxItems: 1
+    description: the gpio connected to the shutdown pin
+
+  mute-gpios:
+    maxItems: 1
+    description: the gpio connected to the mute pin
+
+  gain-gpios:
+    maxItems: 2
+    description: the 2 gpios connected to the g1 and g2 pins
+
+required:
+  - compatible
+  - shutdown-gpios
+  - mute-gpios
+  - gain-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    amplifier {
+      compatible = "maxim,max9759";
+      shutdown-gpios = <&gpio3 20 GPIO_ACTIVE_LOW>;
+      mute-gpios = <&gpio3 19 GPIO_ACTIVE_LOW>;
+      gain-gpios = <&gpio3 23 GPIO_ACTIVE_LOW>,
+             <&gpio3 25 GPIO_ACTIVE_LOW>;
+    };
-- 
2.34.1

