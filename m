Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 523727171E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 13:31:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAA2B1880;
	Tue, 23 Jul 2019 13:30:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAA2B1880
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563881468;
	bh=wUKPj81O5azzvlHXZJ8gr45xAun6DcDVRGEOA3gTEss=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=CqgUYvw4iNXV6I0fy+GM4kS+EOXzi7laRzzkHW/Doz6V5M/fPfei3rG+Aw0As41rT
	 0AFe4/OGhj03EANFoQF4gLFYj20y5dMqALOROHanQFyCb0hYw8nNBJnQaG2OWC5tEp
	 +cb7lsJs3h8J8HL70aK7bfY6cifIEwpEkr3Y1FZI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF28AF804CB;
	Tue, 23 Jul 2019 13:29:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A5C9F804CC; Tue, 23 Jul 2019 13:29:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41305F803D0
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 13:29:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41305F803D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="si9h8K/n"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=yyQu/HseS9qYS6GjhHn7iiAqUhucJC88lL1lRv/VDdQ=; b=si9h8K/nlOSg
 NQ5qapedyQ7IhfGDNU8AQt1seMyX4g9dCnpPkJ1XaHyNs73bMQOn/sDvSiBKsb/Xgd/JF1r3OhLqk
 gi6WhreG13SVqil/XdsWSeaVx2FJD/PbAfyZQSeKhashNAWQhvPLQfzzSIrDWM3A4JjeXX3JU7LYu
 R6zQY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpsyl-0003IX-9h; Tue, 23 Jul 2019 11:29:11 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id B20532742B59; Tue, 23 Jul 2019 12:29:10 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Shuming Fan <shumingf@realtek.com>
In-Reply-To: <20190723101247.19741-1-shumingf@realtek.com>
X-Patchwork-Hint: ignore
Message-Id: <20190723112910.B20532742B59@ypsilon.sirena.org.uk>
Date: Tue, 23 Jul 2019 12:29:10 +0100 (BST)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 derek.fang@realtek.com, flove@realtek.com
Subject: [alsa-devel] Applied "ASoC: rt1308: Convert headers to SPDX" to the
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

   ASoC: rt1308: Convert headers to SPDX

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

From a789adae592e3d28ae87902c0012a8b11c96eb79 Mon Sep 17 00:00:00 2001
From: Shuming Fan <shumingf@realtek.com>
Date: Tue, 23 Jul 2019 18:12:47 +0800
Subject: [PATCH] ASoC: rt1308: Convert headers to SPDX

Convert include and source files to SPDX.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
Link: https://lore.kernel.org/r/20190723101247.19741-1-shumingf@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt1308.c | 17 +++++++----------
 sound/soc/codecs/rt1308.h |  6 ++----
 2 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/rt1308.c b/sound/soc/codecs/rt1308.c
index cf3d72f99705..6f2ee6809dbb 100755
--- a/sound/soc/codecs/rt1308.c
+++ b/sound/soc/codecs/rt1308.c
@@ -1,13 +1,10 @@
-/*
- * rt1308.c  --  RT1308 ALSA SoC amplifier component driver
- *
- * Copyright 2019 Realtek Semiconductor Corp.
- * Author: Derek Fang <derek.fang@realtek.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- */
+// SPDX-License-Identifier: GPL-2.0
+//
+// rt1308.c  --  RT1308 ALSA SoC amplifier component driver
+//
+// Copyright 2019 Realtek Semiconductor Corp.
+// Author: Derek Fang <derek.fang@realtek.com>
+//
 
 #include <linux/module.h>
 #include <linux/moduleparam.h>
diff --git a/sound/soc/codecs/rt1308.h b/sound/soc/codecs/rt1308.h
index c330aae1d527..ff7c423e879e 100755
--- a/sound/soc/codecs/rt1308.h
+++ b/sound/soc/codecs/rt1308.h
@@ -1,12 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
- * RT1308.h  --  RT1308 ALSA SoC amplifier component driver
+ * rt1308.h  --  RT1308 ALSA SoC amplifier component driver
  *
  * Copyright 2019 Realtek Semiconductor Corp.
  * Author: Derek Fang <derek.fang@realtek.com>
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #ifndef _RT1308_H_
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
