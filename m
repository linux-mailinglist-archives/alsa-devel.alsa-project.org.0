Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A203567B6
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 13:36:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D58EE166A;
	Wed, 26 Jun 2019 13:35:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D58EE166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561548966;
	bh=IGR5O9swAsttCQ1BT/Gut9DGaVivKcEM2z6FboKwD14=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=jkMnIu5bCluST6zP0MGIBsZmRg9gK3dO3z9o/RwG/YqPUCcgpSvVuBxHpP8dPokdL
	 hwQ6JIOEfbtobUV2sfee7R7rOzVMO5JL7JWRDgZqfl1RCBy9WeTu3LbQnDrEP3oI5O
	 J4L3K0NiqY0eyw0a6adVAdQioi0GdPTKpR83yOG4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F8B5F89733;
	Wed, 26 Jun 2019 13:32:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59D1EF89721; Wed, 26 Jun 2019 13:32:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 151B3F896B9
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 13:32:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 151B3F896B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="HEmrHhB1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Yi22BJPMrXrR7no+ryi/HOar1Oj8bvG1PMKlkNNKRiY=; b=HEmrHhB1z5PW
 Si+FnG4BQjgJcTjTsvo86eQCifAHZ3BvzSV5+ba+hSRBadHX9dbja02gOdWVsjHqS/jYkr3E3ej36
 9BqZ72M02FEtEKOOHmQRJy/yspBlIctYIeIy2mE4HNcHb0/RyZKCq0angxZfBW3d96CWHIQtqYNqp
 evnFk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hg6AO-0007mx-Og; Wed, 26 Jun 2019 11:32:44 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 47A0444004B; Wed, 26 Jun 2019 12:32:44 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20190625153727.28060-1-ckeepax@opensource.cirrus.com>
X-Patchwork-Hint: ignore
Message-Id: <20190626113244.47A0444004B@finisterre.sirena.org.uk>
Date: Wed, 26 Jun 2019 12:32:44 +0100 (BST)
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com
Subject: [alsa-devel] Applied "ASoC: madera: Update SPDX headers" to the
	asoc tree
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

   ASoC: madera: Update SPDX headers

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 472e5df0137e10fbaed0eef38c9bdf99e088ff13 Mon Sep 17 00:00:00 2001
From: Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Tue, 25 Jun 2019 16:37:27 +0100
Subject: [PATCH] ASoC: madera: Update SPDX headers

The madera driver was merged too late to catch Thomas Gleixner's cleanup
of the SPDX headers tree wide. Update the headers to match what was done
in that patch.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/dt-bindings/sound/madera.h | 6 +-----
 include/sound/madera-pdata.h       | 6 +-----
 sound/soc/codecs/cs47l35.c         | 6 +-----
 sound/soc/codecs/cs47l85.c         | 6 +-----
 sound/soc/codecs/cs47l90.c         | 6 +-----
 sound/soc/codecs/madera.c          | 6 +-----
 sound/soc/codecs/madera.h          | 6 +-----
 7 files changed, 7 insertions(+), 35 deletions(-)

diff --git a/include/dt-bindings/sound/madera.h b/include/dt-bindings/sound/madera.h
index 9ff4eae5259b..d0096d5eb0da 100644
--- a/include/dt-bindings/sound/madera.h
+++ b/include/dt-bindings/sound/madera.h
@@ -1,13 +1,9 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Device Tree defines for Madera codecs
  *
  * Copyright (C) 2016-2017 Cirrus Logic, Inc. and
  *                         Cirrus Logic International Semiconductor Ltd.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #ifndef DT_BINDINGS_SOUND_MADERA_H
diff --git a/include/sound/madera-pdata.h b/include/sound/madera-pdata.h
index 441decefb7f3..e3060f48f108 100644
--- a/include/sound/madera-pdata.h
+++ b/include/sound/madera-pdata.h
@@ -1,13 +1,9 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Platform data for Madera codec driver
  *
  * Copyright (C) 2016-2019 Cirrus Logic, Inc. and
  *                         Cirrus Logic International Semiconductor Ltd.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #ifndef MADERA_CODEC_PDATA_H
diff --git a/sound/soc/codecs/cs47l35.c b/sound/soc/codecs/cs47l35.c
index 02f193dadd41..511d0d6fa962 100644
--- a/sound/soc/codecs/cs47l35.c
+++ b/sound/soc/codecs/cs47l35.c
@@ -1,14 +1,10 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 //
 // ALSA SoC Audio driver for CS47L35 codec
 //
 // Copyright (C) 2015-2019 Cirrus Logic, Inc. and
 //                         Cirrus Logic International Semiconductor Ltd.
 //
-// This program is free software; you can redistribute it and/or modify
-// it under the terms of the GNU General Public License as published by the
-// Free Software Foundation; version 2.
-//
 
 #include <linux/delay.h>
 #include <linux/device.h>
diff --git a/sound/soc/codecs/cs47l85.c b/sound/soc/codecs/cs47l85.c
index 4c4bae6e2c57..32fe7ffb7526 100644
--- a/sound/soc/codecs/cs47l85.c
+++ b/sound/soc/codecs/cs47l85.c
@@ -1,14 +1,10 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 //
 // ALSA SoC Audio driver for CS47L85 codec
 //
 // Copyright (C) 2015-2019 Cirrus Logic, Inc. and
 //                         Cirrus Logic International Semiconductor Ltd.
 //
-// This program is free software; you can redistribute it and/or modify
-// it under the terms of the GNU General Public License as published by the
-// Free Software Foundation; version 2.
-//
 
 #include <linux/module.h>
 #include <linux/moduleparam.h>
diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index 83c4e4628bde..c4ecb0e6911a 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -1,14 +1,10 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 //
 // ALSA SoC Audio driver for CS47L90 codec
 //
 // Copyright (C) 2015-2019 Cirrus Logic, Inc. and
 //                         Cirrus Logic International Semiconductor Ltd.
 //
-// This program is free software; you can redistribute it and/or modify
-// it under the terms of the GNU General Public License as published by the
-// Free Software Foundation; version 2.
-//
 
 #include <linux/module.h>
 #include <linux/moduleparam.h>
diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index 6146c7a070cb..1b1be19a2f99 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -1,14 +1,10 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 //
 // Cirrus Logic Madera class codecs common support
 //
 // Copyright (C) 2015-2019 Cirrus Logic, Inc. and
 //                         Cirrus Logic International Semiconductor Ltd.
 //
-// This program is free software; you can redistribute it and/or modify
-// it under the terms of the GNU General Public License as published by the
-// Free Software Foundation; version 2.
-//
 
 #include <linux/delay.h>
 #include <linux/gcd.h>
diff --git a/sound/soc/codecs/madera.h b/sound/soc/codecs/madera.h
index aa2db156582b..0af66f280770 100644
--- a/sound/soc/codecs/madera.h
+++ b/sound/soc/codecs/madera.h
@@ -1,13 +1,9 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Cirrus Logic Madera class codecs common support
  *
  * Copyright (C) 2015-2018 Cirrus Logic, Inc. and
  *                         Cirrus Logic International Semiconductor Ltd.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by the
- * Free Software Foundation; version 2.
  */
 
 #ifndef ASOC_MADERA_H
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
