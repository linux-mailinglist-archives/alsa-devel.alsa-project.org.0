Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFC492BEE3
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 17:55:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74DDA84C;
	Tue,  9 Jul 2024 17:55:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74DDA84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720540545;
	bh=GADGVIQ+z375aVHvcKgsktFjykd9IRuivqf+FIBeZBk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=K9Ztw+lkic92zcBs0ITgUUaW98sQ9DSnCOTGEwlb7Jl3nHW3rPg/Mrz2SiHIwkUNU
	 FZi9oW+AelmjM6VSWEQeF1HX6/qZPkOacsJuobJlKXBDA+iSFNplFW8Or/iSkpB/YM
	 dbuN5drHg75ULlEXoyWUItmm+7GYuKVNkt82HoMw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14AA6F805B4; Tue,  9 Jul 2024 17:55:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39694F80587;
	Tue,  9 Jul 2024 17:55:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30D53F801F5; Sun,  7 Jul 2024 08:28:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 426C0F800FE
	for <alsa-devel@alsa-project.org>; Sun,  7 Jul 2024 08:28:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 426C0F800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=K9VtQhUp
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1fb222a8eaeso21018905ad.3
        for <alsa-devel@alsa-project.org>;
 Sat, 06 Jul 2024 23:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720333708; x=1720938508;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l5tNj/A1m7ym+nbplCHex5l79VZ8cqmFsV8y1luHk2U=;
        b=K9VtQhUpgT82YbHmyet8OkvM+6pZzDZLQOjktrYK6lm0jkG8pafeil3jCbp7qMsZkX
         DKt/MA99LAI72DGJD8iiXRbyjy5iS2wohtwaFZi6l8BCiAQkWH614YqVzx5mY40HThSP
         stL2avzikcGES/b+FkloUbsnlaHtx0NbiWezy1QKTEbpmPkn/XUR5xHDpTD0gfw8+gVJ
         TcZcbmho/vJO00cu+tZu+pVjFtxyct4mg4F8gC8f9/KG9Kc6OIxbVEsFVqAX1UGPLHHm
         Ebjde2tRpRGPhBB1NAI5hqAMAXClWlDbCZfTTS6TPQwJVM2/H8VQrlwfmUDTz/BC+bvD
         6rTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720333708; x=1720938508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l5tNj/A1m7ym+nbplCHex5l79VZ8cqmFsV8y1luHk2U=;
        b=Tj+6Th68sXJ54ICwf9vYu+c3/nRMTRXTVAGAfbVcJS5B0yMRDvMlip39yq/WE8mrP8
         xRK2TBiiqFe41bpJXtd7p+WmT6c27t08ukS98Db93/3jE2bJkWYfwrT/X6l81Zr6yR+r
         ChKGgkwR9bT+xoEwlCWDdEj4kSJ1eFBJ0/8WqGg5lN9VMF6DoRa1M26wBcE7HBkrUrpk
         n6zYvnsmD7CLmtamHuyW63K+8dNF4a28D/kGOJpQrDcSREcGzsb3kRj1tn8OjNcKaHb+
         KoSnX9/i0rRw5mdZWGedIsaImlJWegcAwmzRaIkv/1RQWPIhTuVpB6O4n/GBjt84Ossm
         y2YQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXh+mSCpbGYFyaLwa9/WqFgqFpWYoLEHQTgIam24J0NPUKJ6VdonzeOEYbkAG3DcVzQCu8tcyuDrheUL434+Hz87tHz+dHocVos0N0=
X-Gm-Message-State: AOJu0Yy5QaWIouvFd2VESYhIiJ4gbVHN3DJGvBrH+ksYSLhFYf8PlK81
	lY5pIaq5rBcAxgSuQHALvcJerEDYsE6Ljh7xNyV/veuUTcs9vk2S
X-Google-Smtp-Source: 
 AGHT+IHKfl1KS8Wj4Ovno8Mf6wy204G8pDN8gTXB3LmtLLIxQphYuCcaRx6DqgeB99rn+/r//tkdLg==
X-Received: by 2002:a17:902:ce8d:b0:1fb:82f5:6648 with SMTP id
 d9443c01a7336-1fb82f56afdmr10347935ad.36.1720333708260;
        Sat, 06 Jul 2024 23:28:28 -0700 (PDT)
Received: from fedora.one.one.one.one
 ([2405:201:6013:c9a2:59df:d296:bffe:732c])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fb1cb298cesm72739165ad.252.2024.07.06.23.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 23:28:27 -0700 (PDT)
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
Subject: [PATCH] ASoC: dt-bindings: cirrus,cs4270: Convert to dtschema
Date: Sun,  7 Jul 2024 11:56:58 +0530
Message-ID: <20240707062702.174390-1-animeshagarwal28@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: animeshagarwal28@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZVRF2SCJIOSFXOKYEALWUIX56VOUDXMG
X-Message-ID-Hash: ZVRF2SCJIOSFXOKYEALWUIX56VOUDXMG
X-Mailman-Approved-At: Tue, 09 Jul 2024 15:55:10 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZVRF2SCJIOSFXOKYEALWUIX56VOUDXMG/>
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
 .../bindings/sound/cirrus,cs4270.yaml         | 53 +++++++++++++++++++
 .../devicetree/bindings/sound/cs4270.txt      | 21 --------
 2 files changed, 53 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs4270.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/cs4270.txt

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs4270.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs4270.yaml
new file mode 100644
index 000000000000..824d799ee5ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs4270.yaml
@@ -0,0 +1,53 @@
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
+properties:
+  compatible:
+    const: cirrus,cs4270
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    description:
+      This pin will be deasserted before communication to the codec starts.
+    maxItems: 1
+
+  va-supply:
+    description: Voltage regulator phandle for the VA supply.
+
+  vd-supply:
+    description: Voltage regulator phandle for the VD supply.
+
+  vlc-supply:
+    description: Voltage regulator phandle for the VLC supply.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      codec: cs4270@48 {
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

