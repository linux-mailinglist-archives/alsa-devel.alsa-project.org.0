Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDBE18A73F
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Mar 2020 22:43:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 240261731;
	Wed, 18 Mar 2020 22:42:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 240261731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584567809;
	bh=HrX8F0XivQg9tJsQ8wA8Gsp4qkosyrwSvl1M3fJrsY8=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=bsznyu2BK1IW+DMNs9wcV4G4sP2lR5O+EcaojKcl+t0HZfk7JaaeoxG0C7mT+Q0Qg
	 IG92RY5IIS/10gWG30/EaewpGB4sVUx6vOPzi6XCOurseq6k8Z0aSWYS7NVIBwhGMm
	 JIdQ57lZQrno/a6woSuZkofZm9qYNjO0fgrJIY+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF225F80132;
	Wed, 18 Mar 2020 22:41:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DBB6F80139; Wed, 18 Mar 2020 22:41:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 66965F80058
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 22:41:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66965F80058
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF72F30E;
 Wed, 18 Mar 2020 14:41:38 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 429373F67D;
 Wed, 18 Mar 2020 14:41:38 -0700 (PDT)
Date: Wed, 18 Mar 2020 21:41:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Shuming Fan <shumingf@realtek.com>
Subject: Applied "ASoC: rt5682: remove noisy debug messages" to the asoc tree
In-Reply-To: <20200317073321.12660-1-shumingf@realtek.com>
Message-Id: <applied-20200317073321.12660-1-shumingf@realtek.com>
X-Patchwork-Hint: ignore
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, lgirdwood@gmail.com, albertchen@realtek.com,
 Mark Brown <broonie@kernel.org>, derek.fang@realtek.com,
 sathya.prakash.m.r@intel.com, flove@realtek.com
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

   ASoC: rt5682: remove noisy debug messages

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

From 243de01deb545e9c288459458e28e5ff0656ca1f Mon Sep 17 00:00:00 2001
From: Shuming Fan <shumingf@realtek.com>
Date: Tue, 17 Mar 2020 15:33:21 +0800
Subject: [PATCH] ASoC: rt5682: remove noisy debug messages

Some debug messages are too noisy.
This patch removes it.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
Link: https://lore.kernel.org/r/20200317073321.12660-1-shumingf@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5682.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 7ca02a5e52e9..513429478d27 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -1197,11 +1197,11 @@ static int rt5682_div_sel(struct rt5682_priv *rt5682,
 	}
 
 	for (i = 0; i < size - 1; i++) {
-		pr_info("div[%d]=%d\n", i, div[i]);
+		dev_dbg(rt5682->component->dev, "div[%d]=%d\n", i, div[i]);
 		if (target * div[i] == rt5682->sysclk)
 			return i;
 		if (target * div[i + 1] > rt5682->sysclk) {
-			pr_err("can't find div for sysclk %d\n",
+			dev_dbg(rt5682->component->dev, "can't find div for sysclk %d\n",
 				rt5682->sysclk);
 			return i;
 		}
-- 
2.20.1

