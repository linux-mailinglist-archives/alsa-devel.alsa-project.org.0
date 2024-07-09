Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 977939339D7
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2024 11:30:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CC23DEC;
	Wed, 17 Jul 2024 11:30:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CC23DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721208642;
	bh=VCkxZ+pGG+YSVbanqtrhKtfrCSVwsi7AFT3M1DJIRSY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MNKgGmEH3rpHvFBsHM822F05YligWrNMqK+2MIQMH+boNKLk4YekA/cg1hiDp5i4b
	 yQEq3XjhqOXeTQ7Ds80pSYP87N6K3+Bcx3HcDetKStS0NZv6xIPn9fAHdTzxtfvKa/
	 6RFYtIBGzooEBW+utm5iBLQn2EwyuQGvdeouJDaA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D57B2F805C2; Wed, 17 Jul 2024 11:30:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05082F805CB;
	Wed, 17 Jul 2024 11:30:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9E12F801F5; Tue,  9 Jul 2024 20:43:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34B0AF800FE
	for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2024 20:43:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34B0AF800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RWeWILin
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3d9306100b5so1614790b6e.1
        for <alsa-devel@alsa-project.org>;
 Tue, 09 Jul 2024 11:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720550627; x=1721155427;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/EJpK7h0+8kfla+x9mc6dab7bKKbfLCaCqSeT7reyNM=;
        b=RWeWILinKh/GRncMqPBewkOcYzuSaZ8jImureYggEIMwkJ7EF25Oyyu/tNa5hk/9EJ
         JzqfRpKsACiMwwlN8x6OITyf1D33xhHS4+t/KeSCskS2+aKUSpQMHJhu53k3gqKNQj1D
         XqfJLR49qCgfpDJR3hAJ375FJWUmqotjOiSlfKPs5xjaDspPbQUFyS9pH8jJ4CYeV7wQ
         5MqrFp++3vZR6G+T5XT8vjChw3aOgFZn0xSJd9txL9mWnIl44tNlnZEJQ80fIflE54ke
         htdZeynjq7a0/VTtj0X4xWrKR+CVBobfymRrXXCiB3LxARLmxGQcQrRMrXQjS9uv2amT
         omiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720550627; x=1721155427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/EJpK7h0+8kfla+x9mc6dab7bKKbfLCaCqSeT7reyNM=;
        b=ch9AwA8vSf7+SfkDRnbQamXPG0f6KIuPKuu/Fwz0tptbbnaXM+F408RtmdFLM/yVpO
         Mo7OrKyd1Zw36BWzFlD4/Cjfg1bEzmOVxrNU12vmJLTNB7HQ0cCBR+JYmgZ9RPWs2lQo
         o00Vp/t1YeGNg6pLdHxwCRj0opAiHhxVh6AV8MFUyXwJEbJ59YkHLagyWtXGnuuC2UUU
         Tz0UpilJp5Y36NbIMOcusYyweG0opyUekdiGVSLTChhikG/XR20zmN3bMFoKlS7MNFHK
         uZpxwVljc51h4D3Ib2YauU5Qi1wX5d48lZxDn98zHjkwpjCFl8qAAPCWcoGdKFfCdcmz
         PCxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpqjMJ0ox2PDvtdjZWIx/ukXCZrpFwQtubMmlV6cj+hofN8UxRfyrGX/Q0g7/5ZYIIJFV3gkl+7qHngmmPbYDeH9pHS74gVQyZKcI=
X-Gm-Message-State: AOJu0YxT8meZoVdZfrUETpu13hC5wUP9CRDAidP6L5LP+JFlWrSiHix8
	b8kXn75sTxw9z57otS93diy5N+SpQq7OyRw3tAna4SugVXBT9eRO
X-Google-Smtp-Source: 
 AGHT+IETG2JaYyEkIUs57OEWEyQjKyGmBijThps0J2yxIds1meOyf1V8scuBk/IWotf98tiQ4xEPJA==
X-Received: by 2002:a05:6808:148b:b0:3d9:2920:bc2f with SMTP id
 5614622812f47-3d93bdd1669mr3866455b6e.10.1720550626620;
        Tue, 09 Jul 2024 11:43:46 -0700 (PDT)
Received: from fedora.. ([45.118.158.79])
        by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-77d607d5fa5sm1741683a12.31.2024.07.09.11.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 11:43:46 -0700 (PDT)
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
Subject: [PATCH v2] ASoC: dt-bindings: cirrus,cs4270: Convert to dtschema
Date: Wed, 10 Jul 2024 00:12:25 +0530
Message-ID: <20240709184231.125207-1-animeshagarwal28@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: animeshagarwal28@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: WSG5YE5SVXIMJ6K4VJRP7LBHRUGTGBDY
X-Message-ID-Hash: WSG5YE5SVXIMJ6K4VJRP7LBHRUGTGBDY
X-Mailman-Approved-At: Wed, 17 Jul 2024 09:30:06 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WSG5YE5SVXIMJ6K4VJRP7LBHRUGTGBDY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the Cirrus Logic CS4270 audio CODEC bindings to DT schema. Add
missing va-supply, vd-supply and vlc-supply properties, because they
are already being used in the DTS and the driver for this device.

Cc: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>

---
Changes in v2:
  - Added proper description for power supply properties.
  - Added ref to dai-common.
  - Added '#sound-dai-cells'.
  - Dropped unused labels in example.
  - Replaced example node name to a generic name.
---
 .../bindings/sound/cirrus,cs4270.yaml         | 59 +++++++++++++++++++
 .../devicetree/bindings/sound/cs4270.txt      | 21 -------
 2 files changed, 59 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs4270.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/cs4270.txt

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs4270.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs4270.yaml
new file mode 100644
index 000000000000..336e11773694
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs4270.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cirrus,cs4270.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cirrus Logic CS4270 audio CODEC
+
+maintainers:
+  - patches@opensource.cirrus.com
+
+description:
+  The CS4270 is a stereo audio codec. The driver for this device currently only
+  supports I2C.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: cirrus,cs4270
+
+  reg:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 0
+
+  reset-gpios:
+    description:
+      This pin will be deasserted before communication to the codec starts.
+    maxItems: 1
+
+  va-supply:
+    description: Analog power supply.
+
+  vd-supply:
+    description: Digital power supply.
+
+  vlc-supply:
+    description: Serial Control Port power supply.
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      codec@48 {
+          compatible = "cirrus,cs4270";
+          reg = <0x48>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/sound/cs4270.txt b/Documentation/devicetree/bindings/sound/cs4270.txt
deleted file mode 100644
index c33770ec4c3c..000000000000
--- a/Documentation/devicetree/bindings/sound/cs4270.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-CS4270 audio CODEC
-
-The driver for this device currently only supports I2C.
-
-Required properties:
-
-  - compatible : "cirrus,cs4270"
-
-  - reg : the I2C address of the device for I2C
-
-Optional properties:
-
-  - reset-gpios : a GPIO spec for the reset pin. If specified, it will be
-		  deasserted before communication to the codec starts.
-
-Example:
-
-codec: cs4270@48 {
-	compatible = "cirrus,cs4270";
-	reg = <0x48>;
-};
-- 
2.45.2

