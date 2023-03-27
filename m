Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1E86CEF20
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:19:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDB017F4;
	Wed, 29 Mar 2023 18:18:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDB017F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680106780;
	bh=IdjIh0wT2/3yrJPSccinDcBxrc30xnoqps+lSBNYAs0=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jzbrWnoyJLRbffh47whnjulBDAGcSI2Zv71uXfcmN0Kj+PbYfsgfRjDkuiBmUnZ4u
	 ZI2tNqG6JMCV+5Lh0ddoiZijtDKphrs2gwG0KsAwYHWvltld0k/7dggCv6dvbhZp4S
	 lnX5WEfLfhh2RewVzWfIaBrS0OXXVEPQP/cGx9ZE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7E78F805D5;
	Wed, 29 Mar 2023 18:15:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41B57F80272; Mon, 27 Mar 2023 23:33:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 64E44F80114
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 23:32:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64E44F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Xwdz5uLY
Received: by mail-pl1-x62b.google.com with SMTP id o2so9771895plg.4
        for <alsa-devel@alsa-project.org>;
 Mon, 27 Mar 2023 14:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679952777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XS2emH9pO0VgJZsxSC0xvhXyPpgeamtgkfj2ufmzoQ4=;
        b=Xwdz5uLYMkKRlJ7QhGHhUC5a0UXyllyo2QTGKel5MghlcGLxRd7qS32BKrQGGRTUVO
         dS2EBwDqrsCp43dEDKpFrQwqOSirUzUd7Zx6ef+klRwvlEmPXsMkxO1de9sZ45IeIRLr
         thbxu7pCIPnD9WHTmgOr2nEB3tkvXF3fAA//SopzBmrE5gCNirZ/yzQUlC939aTAQubv
         7ZU7rBejIkb/1D8We0DDriPd6ps3/mHIeUae3Q4NSImnrh6oD6f3V+lE9sRgFQCfM/iM
         l18V511EuGsVQDYxbGdSymvXl2ZluFZ0XYpXR41aUM/BNbm5jFrB5kdCNI0Aqq6i8Hhd
         i5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679952777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XS2emH9pO0VgJZsxSC0xvhXyPpgeamtgkfj2ufmzoQ4=;
        b=S4u1oWBnkn9E0WHorOh7nuv699NPVbwYTc/l/PBrjI3ZE0Pv8CtbDBbuwDX1xzGcEN
         bPWn0qLeu758ZInxImoVP1AWMa5EJ5UoOjAA3cHC1xkEeaU0aNld4jC4A6aaBwPsJ2r6
         kTQ0Y81Pgv2SdWouf3TqJ0zEz6BK7P3e+f5ABN0MDwbZSRHrTclMlKv2t3VAxa45SNsz
         zzIzEpzevpT8dDQw7Oyho6SiQbatJxXU6QX9k02JmqdX1ooIpKyAkCNYVfl41SoNvV2x
         muuTXRieIyMNRx7bLU5oyBanshU3OMissMP4qaKHGlWDv9S06Jo03e7vBhy+VSdllAjQ
         zGTA==
X-Gm-Message-State: AAQBX9e8DIL4/zDJ81XAN3kYOiN9iAY/3JUbRnbzk66iTR2nGsN3SVPp
	wKwl3FIlDYwsRTRLkZAXhCU=
X-Google-Smtp-Source: 
 AKy350YAuWuNPsuEzw8wb8fThG1T4e3di0A7+p9ziVG/f3zg3S/YXInHB0CFIngc350y0EZkMIaXXA==
X-Received: by 2002:a17:90b:314e:b0:23d:286:47d3 with SMTP id
 ip14-20020a17090b314e00b0023d028647d3mr14953135pjb.40.1679952776972;
        Mon, 27 Mar 2023 14:32:56 -0700 (PDT)
Received: from pavilion.. ([2402:e280:2146:a9a:db37:2c9f:dcb8:89a9])
        by smtp.gmail.com with ESMTPSA id
 z18-20020a63e552000000b0050f6add54fcsm15294399pgj.44.2023.03.27.14.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 14:32:56 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: krzysztof.kozlowski@linaro.org,
	broonie@kernel.org,
	daniel.baluta@nxp.com,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	shengjiu.wang@nxp.com
Subject: [PATCH v3] ASoC: dt-bindings: ak4458: Convert to dtschema
Date: Tue, 28 Mar 2023 03:02:50 +0530
Message-Id: <20230327213250.29199-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4EXHAKYA2PB7PLGVZSXZSJAMOMXEPWCE
X-Message-ID-Hash: 4EXHAKYA2PB7PLGVZSXZSJAMOMXEPWCE
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:14:50 +0000
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Saalim Quadri <danascape@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4EXHAKYA2PB7PLGVZSXZSJAMOMXEPWCE/>
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

 .../devicetree/bindings/sound/ak4458.txt      | 28 --------
 .../bindings/sound/asahi-kasei,ak4458.yaml    | 65 +++++++++++++++++++
 2 files changed, 65 insertions(+), 28 deletions(-)
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
index 000000000000..3842e75d9921
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
@@ -0,0 +1,65 @@
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
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const:
+              asahi-kasei,ak4458
+
+    then:
+      properties:
+        dsd-path: false
+
+required:
+  - compatible
+  - reg
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

