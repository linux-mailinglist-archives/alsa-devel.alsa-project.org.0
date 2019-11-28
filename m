Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A119D10C96A
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Nov 2019 14:25:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 302DB16E0;
	Thu, 28 Nov 2019 14:24:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 302DB16E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574947532;
	bh=J5kuzJ0YfljGWi/C2CCBwvVyQSro63oJoFE4RQvUIdk=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=C0cc+77SlCs/vS/YKsw9w0yqq6olXAfRZl4F4ydNS9rwOVtP/RXAyj9LD9/BWXglP
	 F6C4H/4tcGZ4EhOtWXG9UToqy33aR8QxAUekqL/PqaAH2KWPEQBaglNXG1kPOMq7C2
	 LeBRftKUgKpby6Ej4CXNMyXKe6N4EDO/2rzfZUlI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95221F80260;
	Thu, 28 Nov 2019 14:18:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6932F80256; Thu, 28 Nov 2019 14:18:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id F1343F80245
 for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2019 14:18:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1343F80245
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD8ED11FB;
 Thu, 28 Nov 2019 05:18:42 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CD713F52E;
 Thu, 28 Nov 2019 05:18:42 -0800 (PST)
Date: Thu, 28 Nov 2019 13:18:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Shuming Fan <shumingf@realtek.com>
In-Reply-To: <20191125091940.11953-1-shumingf@realtek.com>
Message-Id: <applied-20191125091940.11953-1-shumingf@realtek.com>
X-Patchwork-Hint: ignore
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, lgirdwood@gmail.com, albertchen@realtek.com,
 Mark Brown <broonie@kernel.org>, derek.fang@realtek.com,
 sathya.prakash.m.r@intel.com, flove@realtek.com
Subject: [alsa-devel] Applied "ASoC: rt5682: fix i2c arbitration lost issue"
	to the asoc tree
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

   ASoC: rt5682: fix i2c arbitration lost issue

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

From bc094709de0192a756c6946a7c89c543243ae609 Mon Sep 17 00:00:00 2001
From: Shuming Fan <shumingf@realtek.com>
Date: Mon, 25 Nov 2019 17:19:40 +0800
Subject: [PATCH] ASoC: rt5682: fix i2c arbitration lost issue

This patch modified the HW initial setting to fix i2c arbitration lost issue.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
Link: https://lore.kernel.org/r/20191125091940.11953-1-shumingf@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5682.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 35dcec135c8a..9feba9a24501 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -73,6 +73,7 @@ struct rt5682_priv {
 static const struct reg_sequence patch_list[] = {
 	{RT5682_HP_IMP_SENS_CTRL_19, 0x1000},
 	{RT5682_DAC_ADC_DIG_VOL1, 0xa020},
+	{RT5682_I2C_CTRL, 0x000f},
 };
 
 static const struct reg_default rt5682_reg[] = {
@@ -2496,6 +2497,7 @@ static void rt5682_calibrate(struct rt5682_priv *rt5682)
 	mutex_lock(&rt5682->calibrate_mutex);
 
 	rt5682_reset(rt5682->regmap);
+	regmap_write(rt5682->regmap, RT5682_I2C_CTRL, 0x000f);
 	regmap_write(rt5682->regmap, RT5682_PWR_ANLG_1, 0xa2af);
 	usleep_range(15000, 20000);
 	regmap_write(rt5682->regmap, RT5682_PWR_ANLG_1, 0xf2af);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
