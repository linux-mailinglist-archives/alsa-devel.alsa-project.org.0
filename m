Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DE513AEEC
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 17:14:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAA051841;
	Tue, 14 Jan 2020 17:13:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAA051841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579018466;
	bh=YyqeXOlxiHbzviKI1cxT84ULu0cJlr5e6zH0Pr99tXc=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=BgyJ1CjeudA5dZ0bfKf5b7jaEL+/rENl4Y8Qmef7jUOtSEMXXjdJU3bWsJmu7YSWT
	 SVBVKX73qbCm/1whPhQhFwq2KPv5HpXA9dEj4BGuaUQB5MgOAuKawoctCWBddbNKvu
	 EDTGN8vKyi+feuDLsIgylpeRiYWhsc8uaZwNCveY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1BC1F8026A;
	Tue, 14 Jan 2020 17:09:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1B0FF802BD; Tue, 14 Jan 2020 17:09:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66E69F8014E
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 17:09:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66E69F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="RnX0cGel"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=PL4q4saA2/5hcYaIEYDv2N6RnvzTXQ5f0CStk5GfbSE=; b=RnX0cGelf9IM
 WbVdpWTjBKuRSzT2EwQ7UDfXnqbUmt1XoIyRW08vWg3vQQVUuqWOzWgVTTLPJs3tIMSecZDbC4R+1
 EWA/a3p5oIhMSBiQfzaQtsBrOXtSzOPLNIyBmVvIsO4O6xbXdKpgh9mx4Y8LPW4kzctZQw0Wx8bxl
 6LIGg=;
Received: from fw-tnat-cam7.arm.com ([217.140.106.55]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1irOkd-0001V2-QD; Tue, 14 Jan 2020 16:09:07 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 80462D02C7C; Tue, 14 Jan 2020 16:09:07 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
In-Reply-To: <20191224002708.1207884-1-paul@crapouillou.net>
Message-Id: <applied-20191224002708.1207884-1-paul@crapouillou.net>
X-Patchwork-Hint: ignore
Date: Tue, 14 Jan 2020 16:09:07 +0000 (GMT)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, od@zcrc.me, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "dt-bindings: sound: Convert jz47*-codec doc
	to YAML" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   dt-bindings: sound: Convert jz47*-codec doc to YAML

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 30bcb1f264bfdd49561cc7a974b67c4d712b3668 Mon Sep 17 00:00:00 2001
From: Paul Cercueil <paul@crapouillou.net>
Date: Tue, 24 Dec 2019 01:27:07 +0100
Subject: [PATCH] dt-bindings: sound: Convert jz47*-codec doc to YAML

Convert ingenic,jz4740-codec.txt and ingenic,jz4725b-codec.txt to one
single ingenic,codec.yaml file, since they share the same binding.

Add the ingenic,jz4770-codec compatible string in the process.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/r/20191224002708.1207884-1-paul@crapouillou.net
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/sound/ingenic,codec.yaml         | 55 +++++++++++++++++++
 .../bindings/sound/ingenic,jz4725b-codec.txt  | 20 -------
 .../bindings/sound/ingenic,jz4740-codec.txt   | 20 -------
 3 files changed, 55 insertions(+), 40 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/ingenic,codec.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/ingenic,jz4725b-codec.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/ingenic,jz4740-codec.txt

diff --git a/Documentation/devicetree/bindings/sound/ingenic,codec.yaml b/Documentation/devicetree/bindings/sound/ingenic,codec.yaml
new file mode 100644
index 000000000000..eb4be86464bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ingenic,codec.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ingenic,codec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic JZ47xx internal codec DT bindings
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+properties:
+  $nodename:
+    pattern: '^audio-codec@.*'
+
+  compatible:
+    oneOf:
+      - const: ingenic,jz4770-codec
+      - const: ingenic,jz4725b-codec
+      - const: ingenic,jz4740-codec
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: aic
+
+  '#sound-dai-cells':
+    const: 0
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#sound-dai-cells'
+
+examples:
+  - |
+    #include <dt-bindings/clock/jz4740-cgu.h>
+    codec: audio-codec@10020080 {
+      compatible = "ingenic,jz4740-codec";
+      reg = <0x10020080 0x8>;
+      #sound-dai-cells = <0>;
+      clocks = <&cgu JZ4740_CLK_AIC>;
+      clock-names = "aic";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/ingenic,jz4725b-codec.txt b/Documentation/devicetree/bindings/sound/ingenic,jz4725b-codec.txt
deleted file mode 100644
index 05adc0d47b13..000000000000
--- a/Documentation/devicetree/bindings/sound/ingenic,jz4725b-codec.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-Ingenic JZ4725B codec controller
-
-Required properties:
-- compatible : "ingenic,jz4725b-codec"
-- reg : codec registers location and length
-- clocks : phandle to the AIC clock.
-- clock-names: must be set to "aic".
-- #sound-dai-cells: Must be set to 0.
-
-Example:
-
-codec: audio-codec@100200a4 {
-	compatible = "ingenic,jz4725b-codec";
-	reg = <0x100200a4 0x8>;
-
-	#sound-dai-cells = <0>;
-
-	clocks = <&cgu JZ4725B_CLK_AIC>;
-	clock-names = "aic";
-};
diff --git a/Documentation/devicetree/bindings/sound/ingenic,jz4740-codec.txt b/Documentation/devicetree/bindings/sound/ingenic,jz4740-codec.txt
deleted file mode 100644
index 1ffcade87e7b..000000000000
--- a/Documentation/devicetree/bindings/sound/ingenic,jz4740-codec.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-Ingenic JZ4740 codec controller
-
-Required properties:
-- compatible : "ingenic,jz4740-codec"
-- reg : codec registers location and length
-- clocks : phandle to the AIC clock.
-- clock-names: must be set to "aic".
-- #sound-dai-cells: Must be set to 0.
-
-Example:
-
-codec: audio-codec@10020080 {
-	compatible = "ingenic,jz4740-codec";
-	reg = <0x10020080 0x8>;
-
-	#sound-dai-cells = <0>;
-
-	clocks = <&cgu JZ4740_CLK_AIC>;
-	clock-names = "aic";
-};
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
