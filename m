Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E5D6CEEB8
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:07:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAA691F6;
	Wed, 29 Mar 2023 18:06:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAA691F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680106032;
	bh=g7rgc05dx3CPqIDZHLkmm6PK4xUoBxj784rfCMhHsjM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZmXJ7ZSC2brL6XH0k+Q4eX2gl/5sNp5RCrVeg6i65Z5YqB1fvGdXQFlx8C8oaPEnO
	 SvZxZESoQn+NBNCF0c5YLsO3GnCkY5px4RaoCkNCL51DdEwk2GZCu5aB+k1/nkkf/+
	 mxBpqPGoxI4Z7CrYlllLYKiyjAPW91+ShAnBsDtM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8E1AF80544;
	Wed, 29 Mar 2023 18:05:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29E2FF802E8; Thu, 23 Mar 2023 20:37:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE089F80093
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 20:37:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE089F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Tyq07Llj
Received: by mail-pf1-x436.google.com with SMTP id bt19so318622pfb.3
        for <alsa-devel@alsa-project.org>;
 Thu, 23 Mar 2023 12:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679600236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMfwb3TCzp70bUxfAja9iS7wP2uDmc7/MEKN6Jse4+0=;
        b=Tyq07Llj4yiXh9EQMmqQMIq8BQLxO18QD05Vgjhh4AM3aZ4i2177E/uaC8ORp6G/IH
         rQ2aJpHyXkzmZW7+3lSTfP8ABgGKI9gfS9Wp/v7W3J3ldi/rIPCsB2wNkiww5CgEi7aU
         biuhGvTOG44lSNrcioRUPf6kwr0yJ/UAjQzltt1qlWDeBgsJLckwu8un+3xTPE2z+AZp
         BSSY/8+KuFQRJaL7wrQ3ll4r06Id7vdCqHncU5isF66AZX/5ymG2uvdu6Ntow9KedWq0
         NImn4cKVj6gX0uCuUYDvAa/bXed5cyDDL5aRBV4E9paVqJClw3IUA4LrfiZyrrgF9ztQ
         yulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679600236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MMfwb3TCzp70bUxfAja9iS7wP2uDmc7/MEKN6Jse4+0=;
        b=rlIUkJaYYsZlCbH79tuyXDFnVxd4J+ccVnMDzIQJMG2xqAZxxFwkSDSqbIA54cAd7U
         8EM2h8HNIaN4ZI/un/zvoH3tlrYEOeYw0xLHc+6Lz1KVuC8X5GrBWF3wzexh6kd7ay+i
         4ayIxYfIh61FYHHZEgYdo21V3qY9MNIqXgzw3WMbLBDJtOHYDW04XJsfkZ7eyG3JvVKJ
         xbRNJQOjT7FUa456r4hmSOsQwkFy/5Th/SXLLng9TfepwhSeV6/Jhk1LhVz0F1ZeVzsh
         vJs5HCGbu0Otf2UmNoMWsQf1nztN86ct041/xSuJRL0JoSTzuUV7OYB3SFOweTWaIA+7
         YBIg==
X-Gm-Message-State: AAQBX9c04eqTPO1t3vMfbC1s/4urtGKZocijejhZaDZwWMJuBQGLdBJc
	T5kh0KTKcw93OkJK86t+a3A=
X-Google-Smtp-Source: 
 AKy350a+ymKVySVKSP248E+HQG5uYdQ3Oo95FGshpHfjANiaJu+AbEtHMen8G3kPn2KfXT/OSjuUTA==
X-Received: by 2002:aa7:954a:0:b0:625:cb74:9e01 with SMTP id
 w10-20020aa7954a000000b00625cb749e01mr458611pfq.25.1679600235728;
        Thu, 23 Mar 2023 12:37:15 -0700 (PDT)
Received: from pavilion.. ([2402:e280:2146:a9a:af8a:74c0:ae9:c475])
        by smtp.gmail.com with ESMTPSA id
 s24-20020aa78298000000b005d4360ed2bbsm12374489pfm.197.2023.03.23.12.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 12:37:15 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: broonie@kernel.org
Subject: [PATCH v2] ASoC: dt-bindings: alc5632: Convert to dtschema
Date: Fri, 24 Mar 2023 01:07:09 +0530
Message-Id: <20230323193709.5176-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4a553ab8-4cd3-4ce4-8225-20f43b70a5be@sirena.org.uk>
References: <4a553ab8-4cd3-4ce4-8225-20f43b70a5be@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 33IXIGES4Q44R3IA6B5VRLSWVVTP323S
X-Message-ID-Hash: 33IXIGES4Q44R3IA6B5VRLSWVVTP323S
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:05:29 +0000
CC: alsa-devel@alsa-project.org, danascape@gmail.com, daniel.baluta@nxp.com,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 krzysztof.kozlowski@linaro.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/33IXIGES4Q44R3IA6B5VRLSWVVTP323S/>
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
 .../bindings/sound/realtek,alc5632.yaml       | 64 +++++++++++++++++++
 2 files changed, 64 insertions(+), 43 deletions(-)
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
index 000000000000..3de18b0fd3fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml
@@ -0,0 +1,64 @@
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
+  - Mark Brown <broonie@kernel.org>
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

