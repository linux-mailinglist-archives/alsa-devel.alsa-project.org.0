Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C7EA3BA4
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 18:10:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7DA31668;
	Fri, 30 Aug 2019 18:09:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7DA31668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567181434;
	bh=IPfNgO/sJyOACCPDWeXv1TkjQK59ZyJ+r11F+Lc3Saw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=QlXeseYaM/CxWmKWwo9YZGrePloMrJrICiAmvhulxFZTHnNwXvMYkdiDBiUTCF5kW
	 /5jw5sP8Dpir4ZohGCaLUnsEXugLoBAAEJgEdDsXMEsEpmsueJlGs/ksbuUrSQnSqs
	 eSurWfsXQUfjXf+51iwC0LWkpw7nExPpyWtZmq8g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 780C6F80600;
	Fri, 30 Aug 2019 18:06:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93CAFF805A9; Fri, 30 Aug 2019 18:06:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89AC7F80369
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 18:06:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89AC7F80369
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="I2DWabrG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=uTQeEEYIJhC5tbPfUST4PEt+2kXGnfovRSLhPtWx96o=; b=I2DWabrGuEwq
 olvrLYhLWDgnKzTuw2SaAmTxADjTjGVpu9I451lQI+6aUbyCJpENSArCxdMp04x/qRd5/ZXjSEgE1
 BNGSQEkd5xkBPC+ACLeVoTU0OCjsz3CLWK0pCPyu3yQ7cfV/W/S8OSNbW5Bm2SBNl9RqJZiHu4ggP
 BnkkY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i3jPc-00078x-BR; Fri, 30 Aug 2019 16:06:08 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 772D52742B61; Fri, 30 Aug 2019 17:06:07 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>
In-Reply-To: <20190828125209.28173-5-mripard@kernel.org>
X-Patchwork-Hint: ignore
Message-Id: <20190830160607.772D52742B61@ypsilon.sirena.org.uk>
Date: Fri, 30 Aug 2019 17:06:07 +0100 (BST)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: dt-bindings: Convert Allwinner A64
	analog codec to a schema" to the asoc tree
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

   ASoC: dt-bindings: Convert Allwinner A64 analog codec to a schema

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 497144a5b7af12097c09b0ca30409ee7122499a0 Mon Sep 17 00:00:00 2001
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Wed, 28 Aug 2019 14:52:09 +0200
Subject: [PATCH] ASoC: dt-bindings: Convert Allwinner A64 analog codec to a
 schema

The Allwinner A64 SoC has an embedded audio codec that uses a separate
controller to drive its analog part, which is supported in Linux, with a
matching Device Tree binding.

Now that we have the DT validation in place, let's convert the device tree
bindings for that controller over to a YAML schemas.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
Link: https://lore.kernel.org/r/20190828125209.28173-5-mripard@kernel.org
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../allwinner,sun50i-a64-codec-analog.yaml    | 39 +++++++++++++++++++
 .../bindings/sound/sun50i-codec-analog.txt    | 14 -------
 2 files changed, 39 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun50i-a64-codec-analog.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/sun50i-codec-analog.txt

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun50i-a64-codec-analog.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun50i-a64-codec-analog.yaml
new file mode 100644
index 000000000000..f290eb72a878
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun50i-a64-codec-analog.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/allwinner,sun50i-a64-codec-analog.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A64 Analog Codec Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <maxime.ripard@bootlin.com>
+
+properties:
+  compatible:
+    const: allwinner,sun50i-a64-codec-analog
+
+  reg:
+    maxItems: 1
+
+  cpvdd-supply:
+    description:
+      Regulator for the headphone amplifier
+
+required:
+  - compatible
+  - reg
+  - cpvdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    codec_analog: codec-analog@1f015c0 {
+      compatible = "allwinner,sun50i-a64-codec-analog";
+      reg = <0x01f015c0 0x4>;
+      cpvdd-supply = <&reg_eldo1>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/sun50i-codec-analog.txt b/Documentation/devicetree/bindings/sound/sun50i-codec-analog.txt
deleted file mode 100644
index 056a098495cc..000000000000
--- a/Documentation/devicetree/bindings/sound/sun50i-codec-analog.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-* Allwinner A64 Codec Analog Controls
-
-Required properties:
-- compatible: must be one of the following compatibles:
-		- "allwinner,sun50i-a64-codec-analog"
-- reg: must contain the registers location and length
-- cpvdd-supply: Regulator supply for the headphone amplifier
-
-Example:
-	codec_analog: codec-analog@1f015c0 {
-		compatible = "allwinner,sun50i-a64-codec-analog";
-		reg = <0x01f015c0 0x4>;
-		cpvdd-supply = <&reg_eldo1>;
-	};
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
