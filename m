Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ABD6C693B
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 14:12:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D987EDF;
	Thu, 23 Mar 2023 14:11:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D987EDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679577136;
	bh=rQcUusnlL1Swg0PbqfBTbzWexsqbx5okEKxhN76wrPk=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l/qK8WEvuutXff4OBHyKQKObx/C/kYPijgd18RuMoIQ5iUjX81vBRwX3fCUCWGXGk
	 lw9kvPxtOYHNaBj2dIekfNy488b88fps68utVnNOF1Ml5TVW2w62hltKwqA8klyh4j
	 v0/9cIeTIfBII+BDySj6VAYcVLytdUFniLJHDsRY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA71CF80570;
	Thu, 23 Mar 2023 14:10:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6BD6EF802E8; Wed, 22 Mar 2023 21:10:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 906D7F8024E
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 21:09:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 906D7F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=auefz9E1
Received: by mail-pg1-x52c.google.com with SMTP id x37so11317691pga.1
        for <alsa-devel@alsa-project.org>;
 Wed, 22 Mar 2023 13:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679515797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2WLHEQY3qr/o+G8te336ZMutrRR6CDO4ZScoVVO+SV4=;
        b=auefz9E1FR6JZgzvalJ+0wMPa2TDyb6NRN2uO/9+eUj3SFrMnbacTAsoA+igzDORqP
         5I/AyVCOB0c+W6fVEFVG29FJDHwmF85BLfOwM1pNrhEkqlhH4LHQiHbXEzzwQEonO7FG
         zHqJ8Xzr2Hld8DA7VoXsA1w8bChbRXmYN4rMY9jAhg+ap9ifsxI7MhbTMcKzsnkpHlaE
         KvS5X0EXG6uvqqnz6IwdEJU3BABtHj6lPTlfScpHFd58POCMIpYMXqKsi1sCBD77lBzs
         9zHur+jX3CWTf/fhdcOLfqQSGMdN0DBP1NaPtiVozeZT8wBSXrrnZ+2Fx04ok1w1kEd8
         zeig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679515797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2WLHEQY3qr/o+G8te336ZMutrRR6CDO4ZScoVVO+SV4=;
        b=GAviTIpK4zFvImG7MXXVsXj6UNqPopEZlNvahc7Dnvufvd+K5HYSpmta8cfUeIBXn4
         vlqsDr62ylHt8/3By1CCqTftK4vMOOYHmhZT2oomF/sb8/yDE3zY3E1f0o7UqpfnKfgw
         NGwvQoTeIR893kKDk1fJd1sX11e82649ShM2kILx0Cl+m0KtbquzKC//HshLIUVTPbN+
         BueLoE6Pmh/BKVcR81gRJEFFYonGRKgLPKmQjHFBSS5tuO8fd82XKytimUlArEZc4iaI
         Qt7/F3jtUlNJtO5Ir559MjoLxxNIGumncJpSfm3V7MwGmKgdIbk9HvRD/2sCvu2Wh9YU
         m6eg==
X-Gm-Message-State: AO0yUKX4wnEhrK4xFmbylXe0FlQnfiMeOb5KpHTQ/askKbyfYs0EsZ2L
	dUs2ifKuTrlo2R+LrNnwwl72hhPElm2SVdAV
X-Google-Smtp-Source: 
 AK7set/g3mhJQ57vML1TthZqf1YSYb97c0MPrveW4ry4C0r2RMlL2jI18MlVCZ8bu4EIu2FpJbHW4w==
X-Received: by 2002:a05:6a00:3002:b0:626:2bb0:30d4 with SMTP id
 ay2-20020a056a00300200b006262bb030d4mr2762060pfb.8.1679515796742;
        Wed, 22 Mar 2023 13:09:56 -0700 (PDT)
Received: from pavilion.. ([2402:e280:2146:a9a:3ad4:4b40:d590:7df2])
        by smtp.gmail.com with ESMTPSA id
 r1-20020a62e401000000b005e4c3e2022fsm10523059pfh.72.2023.03.22.13.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 13:09:56 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: krzysztof.kozlowski@linaro.org,
	daniel.baluta@nxp.com
Subject: [PATCH v2] ASoC: dt-bindings: ak5558: Convert to dtschema
Date: Thu, 23 Mar 2023 01:39:49 +0530
Message-Id: <20230322200949.8986-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <d1559192-8f6d-26e0-ef19-d14ac7987a74@linaro.org>
References: <d1559192-8f6d-26e0-ef19-d14ac7987a74@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BDJ5JEA4FQIFHL7RZARXNGPZ4RZZFIVT
X-Message-ID-Hash: BDJ5JEA4FQIFHL7RZARXNGPZ4RZZFIVT
X-Mailman-Approved-At: Thu, 23 Mar 2023 13:10:00 +0000
CC: alsa-devel@alsa-project.org, broonie@kernel.org, danascape@gmail.com,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BDJ5JEA4FQIFHL7RZARXNGPZ4RZZFIVT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the AK5558 ADC audio codec bindings to DT schema.

Signed-off-by: Saalim Quadri <danascape@gmail.com>
---
 .../devicetree/bindings/sound/ak5558.txt      | 24 ----------
 .../bindings/sound/asahi-kasei,ak5558.yaml    | 48 +++++++++++++++++++
 2 files changed, 48 insertions(+), 24 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/ak5558.txt
 create mode 100644 Documentation/devicetree/bindings/sound/asahi-kasei,ak5558.yaml

diff --git a/Documentation/devicetree/bindings/sound/ak5558.txt b/Documentation/devicetree/bindings/sound/ak5558.txt
deleted file mode 100644
index e28708db6686..000000000000
--- a/Documentation/devicetree/bindings/sound/ak5558.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-AK5558 8 channel differential 32-bit delta-sigma ADC
-
-This device supports I2C mode only.
-
-Required properties:
-
-- compatible : "asahi-kasei,ak5558" or "asahi-kasei,ak5552".
-- reg : The I2C address of the device.
-
-Optional properties:
-
-- reset-gpios: A GPIO specifier for the power down & reset pin.
-- AVDD-supply: Analog power supply
-- DVDD-supply: Digital power supply
-
-Example:
-
-&i2c {
-	ak5558: adc@10 {
-		compatible = "asahi-kasei,ak5558";
-		reg = <0x10>;
-		reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/sound/asahi-kasei,ak5558.yaml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak5558.yaml
new file mode 100644
index 000000000000..d3d494ae8abf
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak5558.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/asahi-kasei,ak5558.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AK5558 8 channel differential 32-bit delta-sigma ADC
+
+maintainers:
+  - Junichi Wakasugi <wakasugi.jb@om.asahi-kasei.co.jp>
+  - Mihai Serban <mihai.serban@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - asahi-kasei,ak5552
+      - asahi-kasei,ak5558
+
+  reg:
+    maxItems: 1
+
+  avdd-supply:
+    description: A 1.8V supply that powers up the AVDD pin.
+
+  dvdd-supply:
+    description: A 1.2V supply that powers up the DVDD pin.
+
+  reset-gpios:
+    maxItems: 1
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
+        ak5558: codec@10 {
+            compatible = "asahi-kasei,ak5558";
+            reg = <0x10>;
+            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+        };
+    };
-- 
2.34.1

