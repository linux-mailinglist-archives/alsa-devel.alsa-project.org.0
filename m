Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD971AC9A6
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 17:26:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9DA61665;
	Thu, 16 Apr 2020 17:25:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9DA61665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587050764;
	bh=ZIoIsXIaQkSSo9DwrSDuxVUKUDWHBUIiPNGyWCNpMjY=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Ohr1L5ad2wrRs8dWraZcWwAzIvLQsm+QJbzqpqMyImXXpdD/UYp69K+p5N0Gdfk7o
	 14H/jdgrqjzMySmf3nTPrmrVK6VsUmRJLMlIv2vNZRP8bxqm4Yd8RmSRkcv++73qVX
	 18ZJJkjWqa3DqTx7I1q4sy+gecbQv1VZXI3gND4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E54BF80240;
	Thu, 16 Apr 2020 17:23:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53C19F80278; Thu, 16 Apr 2020 17:23:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C37E7F800AB
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 17:23:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C37E7F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bBTzd9Or"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7A022214D8;
 Thu, 16 Apr 2020 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587050611;
 bh=ZIoIsXIaQkSSo9DwrSDuxVUKUDWHBUIiPNGyWCNpMjY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=bBTzd9OrYpXGg6ORHDevc26biU8U6Ir9eDMrYVbq0oazh6OMuVNc+sGyIZ47f/7em
 9meS9HRqxJekEbvO8q77PIn9Lnv5yio2WbX+XoF1s/KEVYXbiaOmjD7h4soWVtcrHG
 7bhbBJI+VfwXU79XQ6M8zC9fvfiC7rsu/xGQ/jfU=
Date: Thu, 16 Apr 2020 16:23:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Applied "ASoC: Fix misspellings of "Analog Devices"" to the asoc tree
In-Reply-To: <20200416103058.15269-7-geert+renesas@glider.be>
Message-Id: <applied-20200416103058.15269-7-geert+renesas@glider.be>
X-Patchwork-Hint: ignore
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Lars-Peter Clausen <lars@metafoo.de>, Jiri Kosina <trivial@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Stefan Popa <stefan.popa@analog.com>,
 linux-iio@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 dmaengine@vger.kernel.org, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Jonathan Cameron <jic23@kernel.org>
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

The patch

   ASoC: Fix misspellings of "Analog Devices"

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From b938b25f49cdb47397b0215b69cdd5251b4b2f8b Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Thu, 16 Apr 2020 12:30:58 +0200
Subject: [PATCH] ASoC: Fix misspellings of "Analog Devices"

According to https://www.analog.com/, the company name is spelled
"Analog Devices".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
Link: https://lore.kernel.org/r/20200416103058.15269-7-geert+renesas@glider.be
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/ad1980.c  | 2 +-
 sound/soc/codecs/ad73311.c | 2 +-
 sound/soc/codecs/wm8782.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/ad1980.c b/sound/soc/codecs/ad1980.c
index c4414c725c1f..43b1337bac37 100644
--- a/sound/soc/codecs/ad1980.c
+++ b/sound/soc/codecs/ad1980.c
@@ -2,7 +2,7 @@
 /*
  * ad1980.c  --  ALSA Soc AD1980 codec support
  *
- * Copyright:	Analog Device Inc.
+ * Copyright:	Analog Devices Inc.
  * Author:	Roy Huang <roy.huang@analog.com>
  * 		Cliff Cai <cliff.cai@analog.com>
  */
diff --git a/sound/soc/codecs/ad73311.c b/sound/soc/codecs/ad73311.c
index 10daf61f0294..b98bf19f594e 100644
--- a/sound/soc/codecs/ad73311.c
+++ b/sound/soc/codecs/ad73311.c
@@ -2,7 +2,7 @@
 /*
  * ad73311.c  --  ALSA Soc AD73311 codec support
  *
- * Copyright:	Analog Device Inc.
+ * Copyright:	Analog Devices Inc.
  * Author:	Cliff Cai <cliff.cai@analog.com>
  */
 
diff --git a/sound/soc/codecs/wm8782.c b/sound/soc/codecs/wm8782.c
index aa5577e364d0..f89855c616eb 100644
--- a/sound/soc/codecs/wm8782.c
+++ b/sound/soc/codecs/wm8782.c
@@ -7,7 +7,7 @@
  * Author: Johannes Stezenbach <js@sig21.net>
  *
  * based on ad73311.c
- * Copyright:	Analog Device Inc.
+ * Copyright:	Analog Devices Inc.
  * Author:	Cliff Cai <cliff.cai@analog.com>
  */
 
-- 
2.20.1

