Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 040E3100626
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2019 14:06:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D8EF168D;
	Mon, 18 Nov 2019 14:05:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D8EF168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574082394;
	bh=74fXnaW1/ZR7DJEzckC7R/gn2wO4IiNp7pEqbRvWuIQ=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=hTzU/LU0z9BJNKks4vXn1fZvTMRjBbh8itLd20VzOGmkYZPpNkkNuTjFuU2zYq2c6
	 noN8IANrtcOYvyqJQzwOBavKy03Z7BfT/rUR6CGIXVpRd94C+cyMN4WL5mr+BanQCo
	 TsPi5ZcGNlGuHiXA+yaPAH69g/oYO+KMr6eJRRhA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F953F801F9;
	Mon, 18 Nov 2019 14:00:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1D36F801EC; Mon, 18 Nov 2019 14:00:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 MISSING_MID, SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id D59AEF8014E
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 14:00:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D59AEF8014E
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E445B1045;
 Mon, 18 Nov 2019 05:00:45 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 548BE3F6C4;
 Mon, 18 Nov 2019 05:00:45 -0800 (PST)
Date: Mon, 18 Nov 2019 13:00:43 +0000
From: Mark Brown <broonie@kernel.org>
To: kbuild test robot <lkp@intel.com>
In-Reply-To: <20191114153304.n4pyix7qadu76tx4@4978f4969bb8>
X-Patchwork-Hint: ignore
Message-Id: <20191118130052.F1D36F801EC@alsa1.perex.cz>
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ben Zhang <benzh@chromium.org>, Mark Brown <broonie@kernel.org>,
 Bard Liao <bardliao@realtek.com>, Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] Applied "ASoC: rt5677: rt5677_check_hotword() can be
	static" to the asoc tree
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

   ASoC: rt5677: rt5677_check_hotword() can be static

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

From a3b9ed55775eb18ca9f1641f13328f479a3653cb Mon Sep 17 00:00:00 2001
From: kbuild test robot <lkp@intel.com>
Date: Thu, 14 Nov 2019 23:33:04 +0800
Subject: [PATCH] ASoC: rt5677: rt5677_check_hotword() can be static

Fixes: 21c00e5df439 ("ASoC: rt5677: Enable jack detect while DSP is running")
Signed-off-by: kbuild test robot <lkp@intel.com>
Link: https://lore.kernel.org/r/20191114153304.n4pyix7qadu76tx4@4978f4969bb8
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5677.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index f2f763b4c399..e9a051a50ab2 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -5307,7 +5307,7 @@ static const struct rt5677_irq_desc rt5677_irq_descs[] = {
 	},
 };
 
-bool rt5677_check_hotword(struct rt5677_priv *rt5677)
+static bool rt5677_check_hotword(struct rt5677_priv *rt5677)
 {
 	int reg_gpio;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
