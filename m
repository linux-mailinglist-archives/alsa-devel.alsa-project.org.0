Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 345086CEF1A
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:18:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82C377F4;
	Wed, 29 Mar 2023 18:17:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82C377F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680106717;
	bh=EZu0gMR11OCzLYc6zG8a9kpzQdrSZEirwFzEuAqcFjY=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=CYJHSTGOMRsx4nNi1/TWQvgu+097pPWzoAAsqJMFTjPNScA6YjbxeJz7yjMBfRaO3
	 NeFDJN5ddmjhBGD9CPBQLU/S+MDW/BkwWOQZ8fiw4cl4z7D+hCD0vhtwV6+oA74Ikb
	 ysKQlxdy+P8/rCtstsAClU8vkinFtbCcx12tajtY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8CB1F805BF;
	Wed, 29 Mar 2023 18:14:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72402F80272; Tue, 28 Mar 2023 11:18:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 41CCDF80114
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 11:18:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41CCDF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Mj1BLXSa
Received: by mail-pj1-x102b.google.com with SMTP id
 lr16-20020a17090b4b9000b0023f187954acso11846065pjb.2
        for <alsa-devel@alsa-project.org>;
 Tue, 28 Mar 2023 02:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679995119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/+IPyyhNp73qoNltvA0xh+DDeED+Hk5szkp3yIzG5ew=;
        b=Mj1BLXSaOhBXPLLhEtibxY7jIHXTcO/YzK5aJ5dpWaGXzDvvh2QyjiFD7zRy+xcffv
         cyu3eNIEkPTzAA58KOGOuarRsTECcGBaQcEEWueCgQyALD+udeI07Bf5J80wGw6cPyKt
         ER4C22UdTCos5B/Kn3QathHgJguioBVtVZO3mIJvT+UspUFlafQv4wwoHtPfhf6CGUHp
         b8ig2cRnHxftJq+8MyMpNncmchjRzQdlsokHp1LcgeEh2j1jUz1PMrJOiJLE+afBNm/M
         4w6GO1gLE1jeIqTB1Lq8312Au2SzD2L5RcJbuOo66MdJu5gV/DKySSCDgI6lM5QomnP3
         1X8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679995119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/+IPyyhNp73qoNltvA0xh+DDeED+Hk5szkp3yIzG5ew=;
        b=bCE2ZGGV5wOSGBEM8vbYlILroEmjrdFspczsPhDQVMPdbVH4BO07gXVJUj69zlBxNn
         Og+xsopnUdOa00sGXzLEPc+cAoGlM4Be0LHHk7zuQKFVvLBy4Rkc+DWoRXvuOmoMr59W
         R1fNayvIslddatPs1nOd7qXWPtZQ2lty3xDDt5OvXgcL7+0OBl80Lkg5M0TeDsCx187v
         vAk4khBMeeGtmDqyS2MVwlhJgGPs55gdoUgMsnacKNf0A45wR++zwv4qSxZ9y2xsuNlL
         AcyQzfpP0K/dqmXcPvDoSbeHOpVJiZNrU7QsZumjDulLbVXXN3t47KzTAjC0yw9nfFEC
         y7rQ==
X-Gm-Message-State: AAQBX9cU1osjREzsRhQWAYGHW2fZgBtTgtLPqHjHV0oeV9JpH3xSdSXo
	2+aVZvJrr0MpOzX6Rcz/TKA=
X-Google-Smtp-Source: 
 AKy350YxEK6TluXcHjKwaXVIAR7NSDQHdUy6r51cfLAe5Q8pIhm+lPEQLnN4FhsLLz3J5pLQEOqeJg==
X-Received: by 2002:a17:902:c950:b0:19e:b9f8:1fca with SMTP id
 i16-20020a170902c95000b0019eb9f81fcamr19023968pla.10.1679995118814;
        Tue, 28 Mar 2023 02:18:38 -0700 (PDT)
Received: from pavilion.. ([2402:e280:2146:a9a:db37:2c9f:dcb8:89a9])
        by smtp.gmail.com with ESMTPSA id
 g2-20020a170902c38200b001960706141fsm20587360plg.149.2023.03.28.02.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 02:18:38 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: krzysztof.kozlowski@linaro.org,
	broonie@kernel.org,
	daniel.baluta@nxp.com,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	shengjiu.wang@nxp.com
Subject: [PATCH v5] ASoC: dt-bindings: ak4458: Convert to dtschema
Date: Tue, 28 Mar 2023 14:48:31 +0530
Message-Id: <20230328091831.55690-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6NB6WF6GNVFEO37BX72NTMSYVZD5APJO
X-Message-ID-Hash: 6NB6WF6GNVFEO37BX72NTMSYVZD5APJO
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:14:32 +0000
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Saalim Quadri <danascape@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6NB6WF6GNVFEO37BX72NTMSYVZD5APJO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the AK4458 audio DAC bindings to DT schema.

Signed-off-by: Saalim Quadri <danascape@gmail.com>
---
Changes:
V1 -> V2: Use the correct way for dsd-path property
          Drop ak4458 label form example
V2 -> V3: ak4458 is the only one that does not support dsd-path, so we
          do not require to define an array
V3 -> V4: Add back dsd-path property description
V4 -> V5: Fix yaml format as per example-schema

 .../devicetree/bindings/sound/ak4458.txt      | 28 -------
 .../bindings/sound/asahi-kasei,ak4458.yaml    | 73 +++++++++++++++++++
 2 files changed, 73 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/ak4458.txt
 create mode 100644 Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml

diff --git a/Documentation/devicetree/bindings/sound/ak4458.txt b/Documentation/devicetree/bindings/sound/ak4458.txt
deleted file mode 100644
index 0416c14895d6..000000000000
--- a/Documentation/devicetree/bindings/sound/ak4458.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-AK4458 audio DAC
-
-This device supports I2C mode.
-
-Required properties:
-
-- compatible : "asahi-kasei,ak4458" or "asahi-kasei,ak4497"
-- reg : The I2C address of the device for I2C
-
-Optional properties:
-- reset-gpios: A GPIO specifier for the power down & reset pin
-- mute-gpios: A GPIO specifier for the soft mute pin
-- AVDD-supply: Analog power supply
-- DVDD-supply: Digital power supply
-- dsd-path: Select DSD input pins for ak4497
-            0: select #16, #17, #19 pins
-            1: select #3, #4, #5 pins
-
-Example:
-
-&i2c {
-	ak4458: dac@10 {
-		compatible = "asahi-kasei,ak4458";
-		reg = <0x10>;
-		reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>
-		mute-gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>
-	};
-};
diff --git a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
new file mode 100644
index 000000000000..0db0c8e923a0
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/asahi-kasei,ak4458.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AK4458 audio DAC
+
+maintainers:
+  - Shengjiu Wang <shengjiu.wang@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - asahi-kasei,ak4458
+      - asahi-kasei,ak4497
+
+  reg:
+    maxItems: 1
+
+  avdd-supply:
+    description: Analog power supply
+
+  dvdd-supply:
+    description: Digital power supply
+
+  reset-gpios:
+    maxItems: 1
+
+  mute-gpios:
+    maxItems: 1
+    description:
+      GPIO used to mute all the outputs
+
+  dsd-path:
+    description: Select DSD input pins for ak4497
+    $ref: /schemas/types.yaml#/definitions/uint32
+    oneOf:
+      - const: 0
+        description: select #16, #17, #19 pins
+      - const: 1
+        description: select #3, #4, #5 pins
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: asahi-kasei,ak4458
+
+    then:
+      properties:
+        dsd-path: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        codec@10 {
+            compatible = "asahi-kasei,ak4458";
+            reg = <0x10>;
+            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+            mute-gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>;
+        };
+    };
-- 
2.34.1

