Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B8C9339DB
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2024 11:31:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 237F483E;
	Wed, 17 Jul 2024 11:30:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 237F483E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721208666;
	bh=xLrXFMCa+ZVf2BoMI1TvIQ2l4PsrXNPhP1XvRjPpC3E=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gwSH6OHMIBNA5g+ZXl9/uqgRt17hevXjKUrVz/W93gK/Val54wq2bpRwyd4NSezfD
	 wcYp/ZpwdCIOk7l4uosEI37x6ZqfUOPegwfNA3bwk212DZFcVn3xcdv1x+E9hOgyQ7
	 FBpJBzrEUD8lL/2Xm+2Xvr1hIyOmjoZyDaB1PtZk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 629A7F805FA; Wed, 17 Jul 2024 11:30:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED0C1F805E7;
	Wed, 17 Jul 2024 11:30:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D352F801F5; Wed, 10 Jul 2024 09:28:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E0B8F80074
	for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2024 09:28:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E0B8F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SVw0tDha
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-6e7e23b42c3so3165575a12.1
        for <alsa-devel@alsa-project.org>;
 Wed, 10 Jul 2024 00:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720596500; x=1721201300;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/zjRVa3Uqe4dlMlnLz1HXHc8gPRm1KW7opYsvONaNGg=;
        b=SVw0tDhaCcW6sZUiLW0AydywI9f0lAJNOrs6SxcNSjNizKRmJ9Mq+L1NpEnYdShcBD
         RYkAORFiAITywzMSkZawvmsXBnCjgZs9Z0SHYlack+T6yFX4pp9k5zuhEU6f0erDqBsR
         yyWADH/FHfGp+HOifRFmFgHSGE/CIfVPaVow20fL/JtG537y2XAHVw/aa0GOkWdm8IP4
         35xIa4y9iIUeFbwdCN4g9NtnCElUrQBZYYfzJmOmQuqh1D6CKsAkny63qhnWDXfn3spz
         +CLBIt7m19GsmM3mxzIcwEd79SxB/EpXxaDApc51rMIACAn0RnN7uT0Il8ZCaUAzmNjt
         HjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720596500; x=1721201300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/zjRVa3Uqe4dlMlnLz1HXHc8gPRm1KW7opYsvONaNGg=;
        b=dOjK3ySwEnYYbXAOVtmHGZBQbyXSfrBnKqVN66RulvRkI1LsAfuWu2e+9/k3HrHKcH
         hZhQ1mWFPO2czyf4YmCoIYnBDwR3wDtZyTnMVYd5zSXmNzYn9c1v8HyiNu5YuTe3fuUg
         7SvWrGFP/86pGTayo44wE+1qq2mPURkbwlaAtP8poPt9ahZDX1fSsXVJ6mA/smVh1rVn
         gDct4iVVZmLwnHtQ8YP2SlSSd+ebYPAMMVSUoFjN+rS7brcaUMxwIC4FJD4wwVujopLO
         8xDfhb9o1i/rOm941aoCgrxH4Jy9PKPTOEXnof4keBnjZ/76D4lLP6zjPuOpcAiWXpMx
         TuAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCnfWRisIezsswsrygZd9nkzhoHbe/VX1NSSpHQ1KQLblglGhPmkmTUpOXEMHaogjhdwn6p7ynsjoQSqbY8nAf2bYxrWIFHSWSht0=
X-Gm-Message-State: AOJu0YzXBD2ehM41e5a4SZta8kIqR6vSQWD5ZoFaC/gRQTx/6Nomupoe
	C9MNkJw92w3x4sUqv03efIGcofilsST25R+CPQGsfe1i2LqjffHd
X-Google-Smtp-Source: 
 AGHT+IFu0qG2le5/zbstuRM/nVLLnScMXOcToJf4iu1XEgBAZVxL4GTxdNfBD3Wm7sxWWCa+RNKpZg==
X-Received: by 2002:a05:6a20:9e4a:b0:1be:c3dd:642a with SMTP id
 adf61e73a8af0-1c2982512f3mr5285279637.37.1720596499433;
        Wed, 10 Jul 2024 00:28:19 -0700 (PDT)
Received: from fedora.. ([45.118.158.79])
        by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ca34e89d46sm3074678a91.27.2024.07.10.00.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 00:28:19 -0700 (PDT)
From: Animesh Agarwal <animeshagarwal28@gmail.com>
To: 
Cc: Animesh Agarwal <animeshagarwal28@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: cirrus,cs42xx8: Convert to dtschema
Date: Wed, 10 Jul 2024 12:57:52 +0530
Message-ID: <20240710072756.99765-1-animeshagarwal28@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: animeshagarwal28@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: AQTNV6DFPAHEH33I7PRJWU7DJJCC7GG7
X-Message-ID-Hash: AQTNV6DFPAHEH33I7PRJWU7DJJCC7GG7
X-Mailman-Approved-At: Wed, 17 Jul 2024 09:30:11 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AQTNV6DFPAHEH33I7PRJWU7DJJCC7GG7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the Cirrus Logic CS42448/CS42888 audio CODEC bindings to DT
schema format. Set power supply properties to required only for CS42888.

Cc: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>
---
 .../bindings/sound/cirrus,cs42xx8.yaml        | 81 +++++++++++++++++++
 .../devicetree/bindings/sound/cs42xx8.txt     | 34 --------
 2 files changed, 81 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs42xx8.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/cs42xx8.txt

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42xx8.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42xx8.yaml
new file mode 100644
index 000000000000..725b47e82062
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42xx8.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cirrus,cs42xx8.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cirrus Logic CS42448/CS42888 audio CODEC
+
+maintainers:
+  - patches@opensource.cirrus.com
+
+properties:
+  compatible:
+    enum:
+      - cirrus,cs42448
+      - cirrus,cs42888
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    const: mclk
+
+  VA-supply:
+    description: Analog power supply.
+
+  VD-supply:
+    description: Digital power supply.
+
+  VLC-supply:
+    description: Control port power supply
+
+  VLS-supply:
+    description: Serial port interface power supply.
+
+  reset-gpios:
+    description: This pin is connected to the chip's RESET pin.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: cirrus,cs42888
+then:
+  required:
+    - VA-supply
+    - VD-supply
+    - VLC-supply
+    - VLS-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      codec@48 {
+          compatible = "cirrus,cs42888";
+          reg = <0x48>;
+          clocks = <&codec_mclk 0>;
+          clock-names = "mclk";
+          VA-supply = <&reg_audio>;
+          VD-supply = <&reg_audio>;
+          VLS-supply = <&reg_audio>;
+          VLC-supply = <&reg_audio>;
+          reset-gpios = <&gpio 1>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/sound/cs42xx8.txt b/Documentation/devicetree/bindings/sound/cs42xx8.txt
deleted file mode 100644
index bbfe39347c20..000000000000
--- a/Documentation/devicetree/bindings/sound/cs42xx8.txt
+++ /dev/null
@@ -1,34 +0,0 @@
-CS42448/CS42888 audio CODEC
-
-Required properties:
-
-  - compatible : must contain one of "cirrus,cs42448" and "cirrus,cs42888"
-
-  - reg : the I2C address of the device for I2C
-
-  - clocks : a list of phandles + clock-specifiers, one for each entry in
-    clock-names
-
-  - clock-names : must contain "mclk"
-
-  - VA-supply, VD-supply, VLS-supply, VLC-supply: power supplies for the device,
-    as covered in Documentation/devicetree/bindings/regulator/regulator.txt
-
-Optional properties:
-
-  - reset-gpios : a GPIO spec to define which pin is connected to the chip's
-    !RESET pin
-
-Example:
-
-cs42888: codec@48 {
-	compatible = "cirrus,cs42888";
-	reg = <0x48>;
-	clocks = <&codec_mclk 0>;
-	clock-names = "mclk";
-	VA-supply = <&reg_audio>;
-	VD-supply = <&reg_audio>;
-	VLS-supply = <&reg_audio>;
-	VLC-supply = <&reg_audio>;
-	reset-gpios = <&pca9557_b 1 GPIO_ACTIVE_LOW>;
-};
-- 
2.45.2

