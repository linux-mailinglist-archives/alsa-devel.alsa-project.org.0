Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCC16CEF1C
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:19:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 350A21F3;
	Wed, 29 Mar 2023 18:18:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 350A21F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680106747;
	bh=chpTrOeL3OzfrnuLLsuaMyHKFzgbceT167nxXqy4zus=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=uQVWRZb+GSkq9j1uhWLj2iF7Cv5p9dzWcKd3qiy810jTzCMXxOi4Y4WuG3JUgRf7x
	 I2yLzMincoDKe1zyH48yoN4jSbIwtGfnZeqdTBPQ9aWnIpOx3piqd1vc1Ws6d8RfS4
	 ZiEF1c7g9ry+Q++GwtsTopUwCzxOD5O3eL1369ZI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 081E1F805C5;
	Wed, 29 Mar 2023 18:14:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4BAFF80272; Mon, 27 Mar 2023 23:16:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49F7FF800C9
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 23:16:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49F7FF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=MwU8vqEn
Received: by mail-pj1-x1035.google.com with SMTP id
 l9-20020a17090a3f0900b0023d32684e7fso215370pjc.1
        for <alsa-devel@alsa-project.org>;
 Mon, 27 Mar 2023 14:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679951798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pHbx2+i6d7WFk9FZPMTqiI0CTx6nH8Bhl3pHJcsKVZI=;
        b=MwU8vqEn95ASx7oGflXK9X6O7CvMq+dJHT/8wNlGJEgIUuVCnWuMTbT2OdcLTlEmcm
         mxtm0N4DChvB/wumC6pK8m65JpVlEqbuBvGSlc38aBp9NEqQ2l0EG8SK3QhpN/Z6uRGO
         u0StbdPeSmm/OllhbF76mrTyDKgJHeVNr+Mjqad+aoZyMTG4/ouRbzwlbJAr7FGpRSXj
         OXxPvdg2g6QWiGHRs/icKkGNUi/MUcqt8iF6bE+spTQSOKyPQ52xvVrsw776iQGi5KAZ
         UOLoFkl2fr1Jk36nuyktFNAJAO4r+ZfwC3/QOn6aopSeIhqINYqMzzSV1PjGN0HmZC+I
         RMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679951798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pHbx2+i6d7WFk9FZPMTqiI0CTx6nH8Bhl3pHJcsKVZI=;
        b=MUaAIrYibntS6U8m1qLpF/ZCWRmSEk/BYv5STyEFXac16PAT+fq72xqL4FhujrMLad
         YJCPddNKEvp5CMRZtoEjtapg0VIhVpu3KizajJsDuv4UX666NubwUxN7onZ6lUZ4apJR
         d/ZWZuxaqoX0kIfP2DuGsxzHjfituL0SfQpmDtO3BGdm9G3UVH0c2IgwRVWnaPOQrAGj
         q8kTqhRMzab5uiQS8Yh9tEwrfpiUNX/tYP9D0fmTWibhFLwDiiIg7WQ6EwdcrvBC70UE
         Rwbd6ZMIAZfYg5bsuAvoIzYufSUXiM+I3V9mvivZzw8Oroad5S/YluRibnh5LRZpfVPo
         tTcQ==
X-Gm-Message-State: AAQBX9fBxEcRqF1ro4gerV+5OhBQnOrNS39HqkTgMtZui1XFb60j1s1u
	Ndae2WI7XPrHLTqo9jcugf8=
X-Google-Smtp-Source: 
 AKy350YtYRsSrUBMMwteIyDuBFeHhB3bhAGF0ICkTYrV+gWx4xbh8tYmYsZ619XiDEAwYCsSYgmuMQ==
X-Received: by 2002:a17:90a:ab01:b0:237:b4c0:e15b with SMTP id
 m1-20020a17090aab0100b00237b4c0e15bmr13940176pjq.44.1679951797912;
        Mon, 27 Mar 2023 14:16:37 -0700 (PDT)
Received: from pavilion.. ([2402:e280:2146:a9a:db37:2c9f:dcb8:89a9])
        by smtp.gmail.com with ESMTPSA id
 j12-20020a17090aeb0c00b00230b8431323sm8020724pjz.30.2023.03.27.14.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 14:16:37 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: krzysztof.kozlowski@linaro.org,
	daniel.baluta@nxp.com,
	krzysztof.kozlowski+dt@linaro.org,
	lgirdwood@gmail.com,
	robh+dt@kernel.org
Subject: [PATCH v4] ASoC: dt-bindings: alc5632: Convert to dtschema
Date: Tue, 28 Mar 2023 02:46:29 +0530
Message-Id: <20230327211629.28643-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TT7KIGVAXBDDBLEW5TRBYF5RQX3KSJ3V
X-Message-ID-Hash: TT7KIGVAXBDDBLEW5TRBYF5RQX3KSJ3V
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:14:49 +0000
CC: alsa-devel@alsa-project.org, broonie@kernel.org, danascape@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TT7KIGVAXBDDBLEW5TRBYF5RQX3KSJ3V/>
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
Changes:                                                          
V1 -> V2: Use correct node name 
V2 -> V3: Add correct maintainer name                   
V3 -> V4: Drop alc5632 label name

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
index 000000000000..fb05988ff7ea
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
+        codec@1a {
+            compatible = "realtek,alc5632";
+            reg = <0x1a>;
+            gpio-controller;
+            #gpio-cells = <2>;
+        };
+    };
-- 
2.34.1

