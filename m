Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9B1655311
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Dec 2022 18:06:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A635684E6;
	Fri, 23 Dec 2022 18:05:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A635684E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671815168;
	bh=mtp3kFQMzjrZNFJkDe3sRbLgEXGBt1RMFInWW5P6osI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KgG6gMuk57rvo4H4xCI59k68pxakKnD/gdRDR6rl+MPz00V5cDhVeg0wvCCH3PYk2
	 czz6V8NIGxJ/GjsBgldHaLTColWp1PB+DH9RUdjEHhck2d5GjC2SFtfwLxEW4eiof0
	 cekjlVcsv3PjRfwW+CGgkuyX19GbngTG1h68kZKg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4D1AF804DB;
	Fri, 23 Dec 2022 18:04:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16817F804CB; Fri, 23 Dec 2022 18:04:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out-12.comm2000.it (smtp-out-12.comm2000.it [212.97.32.82])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 967B5F804B1
 for <alsa-devel@alsa-project.org>; Fri, 23 Dec 2022 18:04:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 967B5F804B1
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=mailserver.it header.i=@mailserver.it
 header.a=rsa-sha256 header.s=mailsrv header.b=qDAbNUyD
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: francesco@dolcini.it)
 by smtp-out-12.comm2000.it (Postfix) with ESMTPSA id 64BD1BA1295;
 Fri, 23 Dec 2022 18:04:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
 s=mailsrv; t=1671815087;
 bh=mtp3kFQMzjrZNFJkDe3sRbLgEXGBt1RMFInWW5P6osI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=qDAbNUyDxcYU5wOqczo2w5eKhMdepAGvIRDVtIOvc9IFqzAZiX8+NBYNSsj3+fyBC
 fzTsK3XcSDQ0hEELcIvZnaVWTph1+FTfMcTIqgrE54xRSn5c16srPUI3M+CB4d6386
 B9EEHE+m3r4rt/dNOuX+YtT/CyH370BcP7yrK3vG29tBl/yqGrw4/v95ehYwdvUO4P
 t+EOo8g0AMNmJRm9Qjw/NmGyzRvHgm4rONWa2SAr9BywOVsyhmM1aqzXWjGqUEmqys
 PjjBA4Za6qxNlo1rgrRwMf6C0DmTFi90N4QQ8utuxqOt+LN0FAU+iNSzC2/1AFjApl
 0A1n7dHpPYk6Q==
From: Francesco Dolcini <francesco@dolcini.it>
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 1/3] ASoC: dt-bindings: nau8822: convert to the dtschema
Date: Fri, 23 Dec 2022 18:04:02 +0100
Message-Id: <20221223170404.210603-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221223170404.210603-1-francesco@dolcini.it>
References: <20221223170404.210603-1-francesco@dolcini.it>
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
 Benjamin Marty <info@benjaminmarty.ch>, Mark Brown <broonie@kernel.org>,
 David Lin <CTLIN0@nuvoton.com>,
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
index 000000000000..10464170a98f
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
+  This device supports I2C/SPI. Currently, only I2C bus is supported.
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
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
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

