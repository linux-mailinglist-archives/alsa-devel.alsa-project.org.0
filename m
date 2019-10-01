Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4AFC33AF
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 14:03:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93379169B;
	Tue,  1 Oct 2019 14:02:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93379169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569931384;
	bh=QWwXWz7EymTXQcJgVvEBlWqV9aVwgjtYsm8TVuaz1cE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=npCv07FyXIyYPgntVJyS3iD1PamjZb0dsJgjJrf87J9a0W17GBRGkZrL4wNTid7LO
	 g4NyMphxkuKxbjic7G54KMOiZtmwyOfPT/s22SeITBs2TOirNRPog9IYDkFU6ypY7v
	 MvwseA3/8Q7osFT0/Lm3DhVFxuXD0NKRd9KTuM/I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B04B4F80CB8;
	Tue,  1 Oct 2019 13:41:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3EE0F8071C; Tue,  1 Oct 2019 13:41:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1E3AF8063B
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 13:40:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1E3AF8063B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="xsXN6lhh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=/3kTwXy8T4vM/KtaNYjUXPB97nmHf6ex88dQiDmOQNs=; b=xsXN6lhhmRdZ
 irRwiwpzbpVVWPh0XN7bKixiWkM6J1PSiWVyEWzOvKZw47GvL2YckER4aU6zWi8VxKhdlLWPOd41m
 zQJAfoB3ON39ZSQayEuzsec32wEQgyqZVgECz8lid/qLSplx50XedQ2ThdjGh58jOsXh3ea+oa71R
 TZG+I=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFGWS-0004VN-Cv; Tue, 01 Oct 2019 11:40:52 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D8C5E27429C0; Tue,  1 Oct 2019 12:40:51 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>
In-Reply-To: <20190906151221.3148-2-mripard@kernel.org>
X-Patchwork-Hint: ignore
Message-Id: <20191001114051.D8C5E27429C0@ypsilon.sirena.org.uk>
Date: Tue,  1 Oct 2019 12:40:51 +0100 (BST)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: dt-bindings: Convert Allwinner A23
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

   ASoC: dt-bindings: Convert Allwinner A23 analog codec to a schema

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From 8735141031d7ba96f1c2b3a45ec4efbfd47ad24b Mon Sep 17 00:00:00 2001
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Fri, 6 Sep 2019 18:12:21 +0300
Subject: [PATCH] ASoC: dt-bindings: Convert Allwinner A23 analog codec to a
 schema

The Allwinner A23 SoC and later have an embedded audio codec that uses a
separate controller to drive its analog part, which is supported in Linux,
with a matching Device Tree binding.

Now that we have the DT validation in place, let's convert the device tree
bindings for that controller over to a YAML schemas.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/r/20190906151221.3148-2-mripard@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../allwinner,sun8i-a23-codec-analog.yaml     | 38 +++++++++++++++++++
 .../bindings/sound/sun8i-codec-analog.txt     | 17 ---------
 2 files changed, 38 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun8i-a23-codec-analog.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/sun8i-codec-analog.txt

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun8i-a23-codec-analog.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun8i-a23-codec-analog.yaml
new file mode 100644
index 000000000000..85305b4c2729
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun8i-a23-codec-analog.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/allwinner,sun8i-a23-codec-analog.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A23 Analog Codec Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <maxime.ripard@bootlin.com>
+
+properties:
+  compatible:
+    enum:
+      # FIXME: This is documented in the PRCM binding, but needs to be
+      # migrated here at some point
+      # - allwinner,sun8i-a23-codec-analog
+      - allwinner,sun8i-h3-codec-analog
+      - allwinner,sun8i-v3s-codec-analog
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
+    codec_analog: codec-analog@1f015c0 {
+      compatible = "allwinner,sun8i-h3-codec-analog";
+      reg = <0x01f015c0 0x4>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/sun8i-codec-analog.txt b/Documentation/devicetree/bindings/sound/sun8i-codec-analog.txt
deleted file mode 100644
index 07356758bd91..000000000000
--- a/Documentation/devicetree/bindings/sound/sun8i-codec-analog.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-* Allwinner Codec Analog Controls
-
-Required properties:
-- compatible: must be one of the following compatibles:
-		- "allwinner,sun8i-a23-codec-analog"
-		- "allwinner,sun8i-h3-codec-analog"
-		- "allwinner,sun8i-v3s-codec-analog"
-
-Required properties if not a sub-node of the PRCM node:
-- reg: must contain the registers location and length
-
-Example:
-prcm: prcm@1f01400 {
-	codec_analog: codec-analog {
-		compatible = "allwinner,sun8i-a23-codec-analog";
-	};
-};
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
