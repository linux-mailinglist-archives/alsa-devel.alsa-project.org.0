Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B365918A2A8
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Mar 2020 19:53:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48BC21723;
	Wed, 18 Mar 2020 19:52:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48BC21723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584557619;
	bh=Vu16A51jT+20Tv6Lrxyho1cEupRXxRQehWLVqyQJBtU=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=cS3o+eAArzp6kum65wK5dA0X8oTiE6256WhHHl7Ney/s3ZxcFjLO1wiIvCGGeVYg+
	 qS/ehM8Fm4s9zHw6EZRMJsrn5biW0eyUQvAL7HHsUoOqQLfdaJQY3xhGAdLuZ16n3o
	 nGR20sX5vZG0WuHZNpkhja5t7Pq5jNu3TERkvM6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A9B7F80139;
	Wed, 18 Mar 2020 19:51:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBE19F80139; Wed, 18 Mar 2020 19:51:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id C7458F800C0
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 19:51:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7458F800C0
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 625EC1FB;
 Wed, 18 Mar 2020 11:51:48 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA5E93F67D;
 Wed, 18 Mar 2020 11:51:47 -0700 (PDT)
Date: Wed, 18 Mar 2020 18:51:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Shuming Fan <shumingf@realtek.com>
Subject: Applied "ASoC: rt5682: fix the random recording noise of headset" to
 the asoc tree
In-Reply-To: <20200317073308.11572-1-shumingf@realtek.com>
Message-Id: <applied-20200317073308.11572-1-shumingf@realtek.com>
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

   ASoC: rt5682: fix the random recording noise of headset

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

From 557270e8dc79f66a1db8907eb3079ade60241fe7 Mon Sep 17 00:00:00 2001
From: Shuming Fan <shumingf@realtek.com>
Date: Tue, 17 Mar 2020 15:33:08 +0800
Subject: [PATCH] ASoC: rt5682: fix the random recording noise of headset

The cycle time of FIFO clock should increase 2 times to avoid
the random recording noise issue.
This setting could apply to all known situations in i2s mode.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
Link: https://lore.kernel.org/r/20200317073308.11572-1-shumingf@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5682.c | 2 ++
 sound/soc/codecs/rt5682.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 063dd338539d..3e0b5c43ece8 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -2651,6 +2651,8 @@ static int rt5682_i2c_probe(struct i2c_client *i2c,
 			RT5682_CP_CLK_HP_MASK, RT5682_CP_CLK_HP_300KHZ);
 	regmap_update_bits(rt5682->regmap, RT5682_HP_CHARGE_PUMP_1,
 			RT5682_PM_HP_MASK, RT5682_PM_HP_HV);
+	regmap_update_bits(rt5682->regmap, RT5682_DMIC_CTRL_1,
+			RT5682_FIFO_CLK_DIV_MASK, RT5682_FIFO_CLK_DIV_2);
 
 	INIT_DELAYED_WORK(&rt5682->jack_detect_work,
 				rt5682_jack_detect_handler);
diff --git a/sound/soc/codecs/rt5682.h b/sound/soc/codecs/rt5682.h
index 18faaa2a49a0..fc99e7484283 100644
--- a/sound/soc/codecs/rt5682.h
+++ b/sound/soc/codecs/rt5682.h
@@ -651,6 +651,8 @@
 #define RT5682_DMIC_1_EN_SFT			15
 #define RT5682_DMIC_1_DIS			(0x0 << 15)
 #define RT5682_DMIC_1_EN			(0x1 << 15)
+#define RT5682_FIFO_CLK_DIV_MASK		(0x7 << 12)
+#define RT5682_FIFO_CLK_DIV_2			(0x1 << 12)
 #define RT5682_DMIC_1_DP_MASK			(0x3 << 4)
 #define RT5682_DMIC_1_DP_SFT			4
 #define RT5682_DMIC_1_DP_GPIO2			(0x0 << 4)
-- 
2.20.1

