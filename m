Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D6F37D45B
	for <lists+alsa-devel@lfdr.de>; Wed, 12 May 2021 23:01:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9A6E17F5;
	Wed, 12 May 2021 23:00:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9A6E17F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620853284;
	bh=bHES1YY5WOBjzWazt6B+T0SXpT9M2GElB3Vj7HOxBfs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OYX6yWFIqgl4XdxFmuoPU55RSpJ4p0HEzZAkS8MIORiVMLDvH9NiO4u23ByUmVEIg
	 epE0oD226Q2H2y9fpi9/XpR2Q29krG8q6wEvt9fp04APwclt7IxcswST/1yo3eeXea
	 oXVWuC24mqvgBBVADrdl5IiMyZ4sySvC/QNRI9DM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B045F8012E;
	Wed, 12 May 2021 22:59:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9ECCF80240; Wed, 12 May 2021 22:59:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFC93F800E9
 for <alsa-devel@alsa-project.org>; Wed, 12 May 2021 22:59:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFC93F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GFM0WgsB"
Received: by mail-lj1-x234.google.com with SMTP id b7so31348704ljr.4
 for <alsa-devel@alsa-project.org>; Wed, 12 May 2021 13:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xsfr4WMMESmfUFIa/+uagBjZySC6I2r3NTS5XBjiOu0=;
 b=GFM0WgsBz2OZT3n7fx8MYPTBJpJd05O11BvZAYTO+YRGxk6hLXOI7XbLAK3nWiQwJL
 CMAEP6w7XIWfOBn3OTe+ea8vSdwAeAnjGvw9nzIrfXpirHKi7p/I74KAcjm4i7JMPCjw
 TZEp4g/gcTOuUOMHKB2LVyqdvdGpp18hNfPF1XiD3zO8/6bBSBcRFglvQi85JcsncAY/
 utNA/piAU1jc4EPaDqCORGLfIQ1dnKSGoBroHv7R01v65+npQnVNcghyv3Nv/PGzVPeH
 FoFQgXr16U9ucH1tZlgz/As1LF7xIAb9+6TrlyAHFXrkWDBtQtKU8bpnI4nUZ/FAkrIV
 yLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xsfr4WMMESmfUFIa/+uagBjZySC6I2r3NTS5XBjiOu0=;
 b=fXGzDT6SSOMRB0APZH7kVcE0lOwGybAX8ucIgoEAxglO8T/H9h++Vt1Lqo99CFID+s
 9SDj2Srw/YuS7EsGaQ6QS3tPoEpIoFIzl1p+ye5PUN2sk30Jslyy0zgneyzv7DM2V6TT
 Qnq+PDRXdPOhCbJLFtTPvGLo0Khri9DGqwwEaWfV+2ogF/MtFnMu3Od1U8+2G2r0jbmg
 Nwk+rsrIFlb1dttje1xeTrDCapW11VvQl78C2WWumD8ypbbiqGykjPQoy7+uPGzJ9VOV
 Q4n1Y02MPfKJHawzHT/p5OV+JEbaPZzArJtGC7R7Nb1il2m7RahJ/68rAiooV6rJ7HLE
 lqxQ==
X-Gm-Message-State: AOAM531x1xUK2rG7IUpdGebCwEWZyR8qiR3gHXdo+5ve6UqsAVW2sTkS
 N27SlMQsNU41TSdnNWwINyQ=
X-Google-Smtp-Source: ABdhPJyctN+pf5GRSQyc9GIRaJRJvYOtQoczbpgeuGQYLNJUt/I/0wfOExtqArNfGFU+ydbKl22rdA==
X-Received: by 2002:a2e:a44b:: with SMTP id v11mr30820898ljn.14.1620853184890; 
 Wed, 12 May 2021 13:59:44 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233])
 by smtp.gmail.com with ESMTPSA id c22sm142314ljf.36.2021.05.12.13.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 13:59:44 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, alsa-devel@alsa-project.org
Subject: [PATCH] dt-bindings: sound: wm8750: convert to the json-schema
Date: Wed, 12 May 2021 22:59:26 +0200
Message-Id: <20210512205926.780-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 devicetree@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Rafał Miłecki <rafal@milecki.pl>

This helps validating DTS files.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../devicetree/bindings/sound/wm8750.txt      | 18 --------
 .../devicetree/bindings/sound/wm8750.yaml     | 42 +++++++++++++++++++
 2 files changed, 42 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/wm8750.txt
 create mode 100644 Documentation/devicetree/bindings/sound/wm8750.yaml

diff --git a/Documentation/devicetree/bindings/sound/wm8750.txt b/Documentation/devicetree/bindings/sound/wm8750.txt
deleted file mode 100644
index 682f221f6f38..000000000000
--- a/Documentation/devicetree/bindings/sound/wm8750.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-WM8750 and WM8987 audio CODECs
-
-These devices support both I2C and SPI (configured with pin strapping
-on the board).
-
-Required properties:
-
-  - compatible : "wlf,wm8750" or "wlf,wm8987"
-
-  - reg : the I2C address of the device for I2C, the chip select
-          number for SPI.
-
-Example:
-
-wm8750: codec@1a {
-	compatible = "wlf,wm8750";
-	reg = <0x1a>;
-};
diff --git a/Documentation/devicetree/bindings/sound/wm8750.yaml b/Documentation/devicetree/bindings/sound/wm8750.yaml
new file mode 100644
index 000000000000..24246ac7bbdf
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/wm8750.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/wm8750.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: WM8750 and WM8987 audio CODECs
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
+    enum:
+      - wlf,wm8750
+      - wlf,wm8987
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
+
+        codec@1a {
+            compatible = "wlf,wm8750";
+            reg = <0x1a>;
+        };
+    };
-- 
2.26.2

