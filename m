Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE1B6CEEED
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:13:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0ABADEF;
	Wed, 29 Mar 2023 18:12:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0ABADEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680106420;
	bh=coH9gokVKpi1A/USB4W5KugIpwY1gQkKRJmEwrqiUtA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PxThihooWqvDa2Art/XJIytnIaT9IkF+VXjljbUE9Hr277aj7BVMYcTKViMf2rpa6
	 WHeSTdXg7gM9hp/b8IaOvbkqDUuja1sXd7cSHu4hyJ5Bp4EDBLSENyfQKse4AoM8ka
	 Otsvz7Y8ksjS/8aMPTLYJfbqgc/Ah6csQsMS5LSs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84B17F80249;
	Wed, 29 Mar 2023 18:12:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 492D2F8021D; Sun, 26 Mar 2023 15:10:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7150EF8021D
	for <alsa-devel@alsa-project.org>; Sun, 26 Mar 2023 15:10:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7150EF8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=cIoMGxeA
Received: by mail-pj1-x102a.google.com with SMTP id
 l9-20020a17090a3f0900b0023d32684e7fso8813772pjc.1
        for <alsa-devel@alsa-project.org>;
 Sun, 26 Mar 2023 06:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679836249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKzFjxvODhKBwF/acym2OeXma7IHtjh3I+0sz9iqry4=;
        b=cIoMGxeASn0k2cD9f1D4DCfywcu6OWGUTdAh408RbXTx4AaQbbav2p9vZ62myaAAgA
         Sdkg+m1tT+8LsdsEFsC5mQRN/dlspGKc/ZHqLh0VwwPbVOzmuRleGqLXhCuq/f/KW62C
         kCQ2NwK37Fi00tcKhKTevb+V3vIHy0E/q1ApYykww+ZC9QqJ3lCMteI3i+92qeRGr2Ze
         03K1hwcnJE0MP5LaDV3HOrpj0y70925gERwEeB4XyM6JePDDdnJFyC52kPvfd8qv9O52
         TZ1EZIR18QmsaRDv3Cyfr9F1SjOtDjfdjvKWlDj1++Ht8L/o/f8evjGbsUWdcN2KlNPg
         4AOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679836249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KKzFjxvODhKBwF/acym2OeXma7IHtjh3I+0sz9iqry4=;
        b=j1AJJLZQSOTsFg4TVigOTVW18baoi1TMNHSy8Ux/iDnlC49A7VJfruoKGD4cpUH+Oy
         hiHlctz8Un2DfQC7oSyfkhX6RAvwWejAfITG9BBQnvMxtkU+O6bo+vqczl9dnl933pTY
         r7jX7K/d51Tm2UGs8Gp8FBx1ml7AMTYMgEXzY64ICJsFYE2qOKXbTWs0wPyO4xYtB9fm
         E04SnEWRJ4UBSW1YgFQ63NKLNpCAM67E7L1Elsfb1wocqwIDiufUQ8d+6U2EE1/NIhbG
         6ZFqArAqvCIpw8o/ZiaTdWWQgOMG1wojZCqEjoxgNdKnHxCIUemuHXXpa5WAWhbpfb5j
         6WhA==
X-Gm-Message-State: AAQBX9f83XJjgpRg3gH58QVN66KaReKDBSow6j/los0qSeWtsS8ynPOb
	6V8ejH3R2W6qdoy2UQHufIY=
X-Google-Smtp-Source: 
 AKy350bnddRpIkB4HXMrVBbVA8T+5P6VvlnavRCXlNjYvO3XINXoOoySCKVKzRQ1vEFyCGhB3T28nA==
X-Received: by 2002:a17:903:787:b0:1a1:b5ce:5d03 with SMTP id
 kn7-20020a170903078700b001a1b5ce5d03mr6935847plb.10.1679836248556;
        Sun, 26 Mar 2023 06:10:48 -0700 (PDT)
Received: from pavilion.. ([2402:e280:2146:a9a:1d70:a8f1:a55a:6f4a])
        by smtp.gmail.com with ESMTPSA id
 f21-20020a170902e99500b001a2130e2cc0sm5063037plb.160.2023.03.26.06.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 06:10:48 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: danascape@gmail.com
Subject: [PATCH v3] ASoC: dt-bindings: alc5632: Convert to dtschema
Date: Sun, 26 Mar 2023 18:40:39 +0530
Message-Id: <20230326131039.19190-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230323130511.16367-1-danascape@gmail.com>
References: <20230323130511.16367-1-danascape@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QKPHKCOO7A3QBKGRX4ELAW7IREOKK5D7
X-Message-ID-Hash: QKPHKCOO7A3QBKGRX4ELAW7IREOKK5D7
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:12:16 +0000
CC: alsa-devel@alsa-project.org, broonie@kernel.org, daniel.baluta@nxp.com,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QKPHKCOO7A3QBKGRX4ELAW7IREOKK5D7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the ALC5632 audio codec bindings to DT schema.

Signed-off-by: Saalim Quadri <danascape@gmail.com>
---
 .../devicetree/bindings/sound/alc5632.txt     | 43 -------------
 .../bindings/sound/realtek,alc5632.yaml       | 63 +++++++++++++++++++
 2 files changed, 63 insertions(+), 43 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/alc5632.txt
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,alc5632.yaml

diff --git a/Documentation/devicetree/bindings/sound/alc5632.txt b/Documentation/devicetree/bindings/sound/alc5632.txt
deleted file mode 100644
index ffd886d110bd..000000000000
--- a/Documentation/devicetree/bindings/sound/alc5632.txt
+++ /dev/null
@@ -1,43 +0,0 @@
-ALC5632 audio CODEC
-
-This device supports I2C only.
-
-Required properties:
-
-  - compatible : "realtek,alc5632"
-
-  - reg : the I2C address of the device.
-
-  - gpio-controller : Indicates this device is a GPIO controller.
-
-  - #gpio-cells : Should be two. The first cell is the pin number and the
-    second cell is used to specify optional parameters (currently unused).
-
-Pins on the device (for linking into audio routes):
-
-  * SPK_OUTP
-  * SPK_OUTN
-  * HP_OUT_L
-  * HP_OUT_R
-  * AUX_OUT_P
-  * AUX_OUT_N
-  * LINE_IN_L
-  * LINE_IN_R
-  * PHONE_P
-  * PHONE_N
-  * MIC1_P
-  * MIC1_N
-  * MIC2_P
-  * MIC2_N
-  * MICBIAS1
-  * DMICDAT
-
-Example:
-
-alc5632: alc5632@1e {
-	compatible = "realtek,alc5632";
-	reg = <0x1a>;
-
-	gpio-controller;
-	#gpio-cells = <2>;
-};
diff --git a/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml b/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml
new file mode 100644
index 000000000000..e399c35f48e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/realtek,alc5632.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ALC5632 audio CODEC
+
+description: |
+  Pins on the device (for linking into audio routes):
+      * SPK_OUTP
+      * SPK_OUTN
+      * HP_OUT_L
+      * HP_OUT_R
+      * AUX_OUT_P
+      * AUX_OUT_N
+      * LINE_IN_L
+      * LINE_IN_R
+      * PHONE_P
+      * PHONE_N
+      * MIC1_P
+      * MIC1_N
+      * MIC2_P
+      * MIC2_N
+      * MICBIAS1
+      * DMICDAT
+
+maintainers:
+  - Leon Romanovsky <leon@leon.nu>
+
+properties:
+  compatible:
+    const: realtek,alc5632
+
+  reg:
+    maxItems: 1
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-controller: true
+
+required:
+  - compatible
+  - reg
+  - '#gpio-cells'
+  - gpio-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        alc5632: codec@1a {
+            compatible = "realtek,alc5632";
+            reg = <0x1a>;
+            gpio-controller;
+            #gpio-cells = <2>;
+        };
+    };
-- 
2.34.1

