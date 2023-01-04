Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 006F065D4F5
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Jan 2023 15:06:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB527B1B6;
	Wed,  4 Jan 2023 15:05:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB527B1B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672841173;
	bh=u8FK9CPIvJPseM0rmgjjenWelwK6ei1bF0xBEbbYaB8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=roC70158CKtMZoJvkkYEgDC+jRdI7YgtmuCdsLV4bRXtXJwiQBGyZTuj7//mMmzKV
	 u6LuDuXh9UiERU8ZpIlxMc8mlMjkLhZ623TtYWBeOBeOOKgYYS3tvbEfpRNI8LyQia
	 Omh48r9ck9Qmnkjf+1Z7lRJz40mCgUFj52QEiUvs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36A4BF803DC;
	Wed,  4 Jan 2023 15:04:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE0C1F803DC; Wed,  4 Jan 2023 15:04:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out-08.comm2000.it (smtp-out-08.comm2000.it [212.97.32.78])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3D67F8023B
 for <alsa-devel@alsa-project.org>; Wed,  4 Jan 2023 15:04:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3D67F8023B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=mailserver.it header.i=@mailserver.it
 header.a=rsa-sha256 header.s=mailsrv header.b=EehzkHgv
Received: from francesco-nb.toradex.int (31-10-206-125.static.upc.ch
 [31.10.206.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: francesco@dolcini.it)
 by smtp-out-08.comm2000.it (Postfix) with ESMTPSA id CED02421F19;
 Wed,  4 Jan 2023 15:04:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
 s=mailsrv; t=1672841081;
 bh=u8FK9CPIvJPseM0rmgjjenWelwK6ei1bF0xBEbbYaB8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=EehzkHgvQTszRTilSND2IPObvhaqsIB6v1Uk1rmQVcH3nMRARMSgG6Tjjsn8BZmZN
 f7GgfwS+44zoRTprtNj0wpUYlt3oQRbue8ja7g9N7oexvBVVsNOfnenacM6VMdRwwT
 S3F3LBjV0YMpKYFLZ3WopcekcvyYemHF+g64wNJPo68GuHMdVmL9ioxUF9FjfIOvp7
 Ma4pEllSd+4TEBZQouI0vOfbQtGvDEn2P/B/SDmpPcgxxQWnaw4OtYxFdh4wHm/VqJ
 PYYDNqBQJWFmM4+1ZyGmNiBWMvF4I9FNYhKLfkQD7HvU1k6Nf/nvviMUMJGVFr/80d
 x0U2wabqxtU/w==
From: Francesco Dolcini <francesco@dolcini.it>
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] ASoC: dt-bindings: nau8822: convert to the dtschema
Date: Wed,  4 Jan 2023 15:04:10 +0100
Message-Id: <20230104140412.35575-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230104140412.35575-1-francesco@dolcini.it>
References: <20230104140412.35575-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: wtli@nuvoton.com, Takashi Iwai <tiwai@suse.com>, kchsu0@nuvoton.com,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Benjamin Marty <info@benjaminmarty.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mark Brown <broonie@kernel.org>, David Lin <CTLIN0@nuvoton.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Convert nau8822 devicetree binding to dtschema.
Change file name to match dtschema naming.

Cc: David Lin <CTLIN0@nuvoton.com>
Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v2:
 - added Reviewed-by: Krzysztof
 - removed sentence on SPI being not supported
---
 .../devicetree/bindings/sound/nau8822.txt     | 16 --------
 .../bindings/sound/nuvoton,nau8822.yaml       | 40 +++++++++++++++++++
 2 files changed, 40 insertions(+), 16 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/nau8822.txt
 create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml

diff --git a/Documentation/devicetree/bindings/sound/nau8822.txt b/Documentation/devicetree/bindings/sound/nau8822.txt
deleted file mode 100644
index a471d162d4e5..000000000000
--- a/Documentation/devicetree/bindings/sound/nau8822.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-NAU8822 audio CODEC
-
-This device supports I2C only.
-
-Required properties:
-
-  - compatible : "nuvoton,nau8822"
-
-  - reg : the I2C address of the device.
-
-Example:
-
-codec: nau8822@1a {
-	compatible = "nuvoton,nau8822";
-	reg = <0x1a>;
-};
diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
new file mode 100644
index 000000000000..2810924e3a47
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nuvoton,nau8822.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NAU8822 audio CODEC
+
+description: |
+  24 bit stereo audio codec with speaker driver.
+  This device supports I2C/SPI.
+
+maintainers:
+  - David Lin <CTLIN0@nuvoton.com>
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,nau8822
+
+  reg:
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
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        codec@1a {
+            compatible = "nuvoton,nau8822";
+            reg = <0x1a>;
+        };
+    };
-- 
2.25.1

