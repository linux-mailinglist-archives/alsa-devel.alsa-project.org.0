Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E99D1849FA
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 15:52:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 855E21818;
	Fri, 13 Mar 2020 15:51:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 855E21818
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584111121;
	bh=ZLNQPWkGvWuUgcPFAmoWvg2i660zctwF6HB2ZeUCaAE=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=TBSOfuoQDKdaMkHzz9QQCjaKCrYuCDKmdHMyB6tRoTrJMUdMg+ij83rVw2QaQ6/tH
	 Utt4Qrf0fJL8aPk5B75KawIsl6xg8Z7/sPq3kHlNf/s4rcLtmXq2M8VmEqCWjH3Ccx
	 DwFMGc8o5if5FDBNO6iiVIB7jZoHCtJGOGvCUEDE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71191F801F7;
	Fri, 13 Mar 2020 15:50:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30F88F801EB; Fri, 13 Mar 2020 15:50:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 677E4F80086
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 15:50:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 677E4F80086
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C246F30E;
 Fri, 13 Mar 2020 07:50:13 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 44E383F67D;
 Fri, 13 Mar 2020 07:50:13 -0700 (PDT)
Date: Fri, 13 Mar 2020 14:50:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>
Subject: Applied "ASoC: rt5682: Revise the DAC1 volume setting" to the asoc
 tree
In-Reply-To: <20200313023850.28875-2-oder_chiou@realtek.com>
Message-Id: <applied-20200313023850.28875-2-oder_chiou@realtek.com>
X-Patchwork-Hint: ignore
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>, derek.fang@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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

   ASoC: rt5682: Revise the DAC1 volume setting

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

From 5b7ddb86e61311f711eaa091dc3e9d8ccfc08e3a Mon Sep 17 00:00:00 2001
From: Oder Chiou <oder_chiou@realtek.com>
Date: Fri, 13 Mar 2020 10:38:50 +0800
Subject: [PATCH] ASoC: rt5682: Revise the DAC1 volume setting

The max volume of the DAC1 Playback Volume is 0dB.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
Link: https://lore.kernel.org/r/20200313023850.28875-2-oder_chiou@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5682.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index ae6f6121bc1b..063dd338539d 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -1146,7 +1146,7 @@ static void rt5682_jack_detect_handler(struct work_struct *work)
 static const struct snd_kcontrol_new rt5682_snd_controls[] = {
 	/* DAC Digital Volume */
 	SOC_DOUBLE_TLV("DAC1 Playback Volume", RT5682_DAC1_DIG_VOL,
-		RT5682_L_VOL_SFT + 1, RT5682_R_VOL_SFT + 1, 86, 0, dac_vol_tlv),
+		RT5682_L_VOL_SFT + 1, RT5682_R_VOL_SFT + 1, 87, 0, dac_vol_tlv),
 
 	/* IN Boost Volume */
 	SOC_SINGLE_TLV("CBJ Boost Volume", RT5682_CBJ_BST_CTRL,
-- 
2.20.1

