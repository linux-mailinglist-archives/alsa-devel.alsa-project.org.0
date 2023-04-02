Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 884556D4C0E
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 17:37:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8E77201;
	Mon,  3 Apr 2023 17:36:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8E77201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680536257;
	bh=nGM4VYeexae1HMlvXVUiiR1fhOHU+EiZ36nyAi7G4HQ=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rXyare8v+RxjB0NvkBpj9HMrNJPVoT6hLAkEmEY/LJ3R8wsCz/jwS3zUK6RSqucHr
	 7XzMPOL4XrKWfI6dSoENiy9s0KzLQb2oUMp+EZ6yTzRshOayatsl9j3bQop5GfowZm
	 DDAwrvqM/rgYFI8MTHZf/UArR9EUPIti0CyERAu0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CEF9EF80423;
	Mon,  3 Apr 2023 17:35:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79BF5F8024C; Sun,  2 Apr 2023 22:57:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57A73F80054
	for <alsa-devel@alsa-project.org>; Sun,  2 Apr 2023 22:57:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57A73F80054
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=nUuCdSjR
Received: by mail-pj1-x1032.google.com with SMTP id
 mp3-20020a17090b190300b0023fcc8ce113so30550222pjb.4
        for <alsa-devel@alsa-project.org>;
 Sun, 02 Apr 2023 13:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680469050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AqjVyxFjsHfYI8wNbHm0tgaoQeMUAZNmLeUD+5ilnBM=;
        b=nUuCdSjR5ZVXYyusrAi/cdvM1ZxvzHXEfDx/sQ4rsjAc8TSL6NtT2/r0sdbc1zfnYA
         4YdISZYg+jJG27MCiCNMCPA1kVfoIub8jmscr0MpeuWgVv8L9LzFulvNm4uD7uyaTnoz
         Za91rqOEP8dH0A9EGYgguuXqloNAjmZMO4raBsUUDDOE7k3AH1jx/DIYNDk6x+tmtAxh
         /teBWAMbaM0wAT6sLVE+m7eM9ihToR184VYYCrExvSgbGZNpaHrxqN1OHiTRase998Ox
         q87JVx2hSyRC1VshOwYIynfDJTh+W5SnQObiEmVEhzDiy/19a8WRyBTtwJgZfyg+HzrT
         P3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680469050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqjVyxFjsHfYI8wNbHm0tgaoQeMUAZNmLeUD+5ilnBM=;
        b=W3mxNcnf1rmWbAT604C2YdBV+vfBPL/I+hATTZtLy4Dy/TUn5v9RR5w3PkCCJ/q9sW
         suRWGAkJEPdKt0f4GwIjllcBakPqRPdPwXKqVOE/BUHdz6ih27aUsmBNq+XzYEKlznrr
         k8kqEsTji1CVYh0zuWae5jSrctFWtkWHF3VKpPby0q/tYSdUYjDKLiHNk4Dz+uIy5pVZ
         ZP37ktQOGNo4qLmKZ3qh/nFYiEVE1RWYOz0xXJXFhA5owSUSB2BWjdHOZxOu8ps0oBe9
         tXVBvWRGAHd5zjgStbYXNANbqbh47iY4ecwLnSx0Kc4QgJwhty2ezanw8JdAcvL3K5/l
         lK4g==
X-Gm-Message-State: AAQBX9dm1M7dwqG5EylcYBp4tNazohdwWI/JzzzN55lh9+8eLjZnCf1T
	eB0umgYR+Nlu7zWgIgiR79A=
X-Google-Smtp-Source: 
 AKy350bHzLEUzxJyYl9lAgeYSOG3MiqiONzGRNTHZrmd6b2nP4rVyl4TN4Fwb0HU7ELRNis5ZGGBig==
X-Received: by 2002:a17:90b:4d83:b0:23f:9445:318e with SMTP id
 oj3-20020a17090b4d8300b0023f9445318emr16740564pjb.3.1680469049715;
        Sun, 02 Apr 2023 13:57:29 -0700 (PDT)
Received: from pavilion.. ([2409:40f2:100f:dc7:7586:11f6:6763:e4a6])
        by smtp.gmail.com with ESMTPSA id
 f11-20020a17090274cb00b001a065d3bb0esm5135611plt.211.2023.04.02.13.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 13:57:29 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH] ASoC: dt-bindings: wm8510: Convert to dtschema
Date: Mon,  3 Apr 2023 02:27:19 +0530
Message-Id: <20230402205719.6728-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DYQXWENMY2Z77WZJXTXC237NPWYM3AZC
X-Message-ID-Hash: DYQXWENMY2Z77WZJXTXC237NPWYM3AZC
X-Mailman-Approved-At: Mon, 03 Apr 2023 15:35:55 +0000
CC: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Saalim Quadri <danascape@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DYQXWENMY2Z77WZJXTXC237NPWYM3AZC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the WM8510 audio CODEC bindings to DT schema

Signed-off-by: Saalim Quadri <danascape@gmail.com>
---
 .../devicetree/bindings/sound/wlf,wm8510.yaml | 39 +++++++++++++++++++
 .../devicetree/bindings/sound/wm8510.txt      | 18 ---------
 2 files changed, 39 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8510.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wm8510.txt

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8510.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8510.yaml
new file mode 100644
index 000000000000..f45dad0fbef3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8510.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/wlf,wm8510.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: WM8510 audio CODEC
+
+description: |
+  These devices support both I2C and SPI (configured with pin strapping
+  on the board).
+
+maintainers:
+  - Mark Brown <broonie@kernel.org>
+
+properties:
+  compatible:
+    const: wlf,wm8510
+
+  reg:
+    description:
+      The I2C address of the device for I2C, the chip select number for SPI
+    maxItems: 1
+
+additionalProperties: false
+
+required:
+  - reg
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        codec@1a {
+            compatible = "wlf,wm8510";
+            reg = <0x1a>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/sound/wm8510.txt b/Documentation/devicetree/bindings/sound/wm8510.txt
deleted file mode 100644
index e6b6cc041f89..000000000000
--- a/Documentation/devicetree/bindings/sound/wm8510.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-WM8510 audio CODEC
-
-This device supports both I2C and SPI (configured with pin strapping
-on the board).
-
-Required properties:
-
-  - compatible : "wlf,wm8510"
-
-  - reg : the I2C address of the device for I2C, the chip select
-          number for SPI.
-
-Example:
-
-wm8510: codec@1a {
-	compatible = "wlf,wm8510";
-	reg = <0x1a>;
-};
-- 
2.34.1

