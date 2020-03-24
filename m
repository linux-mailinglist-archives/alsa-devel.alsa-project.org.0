Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD4019177B
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Mar 2020 18:21:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9957C1658;
	Tue, 24 Mar 2020 18:20:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9957C1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585070469;
	bh=sBmIAZrMd5INuP5Ib+0t5c6nERa/j5osdrx/0Fmnc3Q=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=jflrXq4R/sU1kgVOD2gTvSiCy54xIWUhlBBfbl69Pnx1t56/fHfRkir+NDvJU+u+r
	 IBL+ogvv6KDdAOxY0KpA2bmRBiX+loASDgq1SohdDkFWOzm3PLXa5l5a+6JxHuhpPt
	 Qe0oFctvhoNWPuk2a0lWJofrsVyLoWXpwKhI3LFE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE753F802A9;
	Tue, 24 Mar 2020 18:16:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B02EF802A9; Tue, 24 Mar 2020 18:16:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 89191F802A0
 for <alsa-devel@alsa-project.org>; Tue, 24 Mar 2020 18:16:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89191F802A0
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FFF21045;
 Tue, 24 Mar 2020 10:16:35 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 04EF33F71F;
 Tue, 24 Mar 2020 10:16:34 -0700 (PDT)
Date: Tue, 24 Mar 2020 17:16:33 +0000
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Applied "ASoC: wm8974: remove unused variables" to the asoc tree
In-Reply-To: <20200324070615.16248-1-yuehaibing@huawei.com>
Message-Id: <applied-20200324070615.16248-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, tiwai@suse.com,
 lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org
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

   ASoC: wm8974: remove unused variables

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

From 6b877cf8bc98e6c574a6d763943c4a92592e431c Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 24 Mar 2020 15:06:15 +0800
Subject: [PATCH] ASoC: wm8974: remove unused variables

sound/soc/codecs/wm8974.c:200:38: warning:
 wm8974_aux_boost_controls defined but not used [-Wunused-const-variable=]
sound/soc/codecs/wm8974.c:204:38: warning:
 wm8974_mic_boost_controls defined but not used [-Wunused-const-variable=]

commit 8a123ee2a46d ("ASoC: WM8974 DAPM cleanups")
left behind this, remove them.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20200324070615.16248-1-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8974.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/codecs/wm8974.c b/sound/soc/codecs/wm8974.c
index dc4fe4f5239d..06ba36595ddd 100644
--- a/sound/soc/codecs/wm8974.c
+++ b/sound/soc/codecs/wm8974.c
@@ -196,14 +196,6 @@ SOC_DAPM_SINGLE("MicN Switch", WM8974_INPUT, 1, 1, 0),
 SOC_DAPM_SINGLE("MicP Switch", WM8974_INPUT, 0, 1, 0),
 };
 
-/* AUX Input boost vol */
-static const struct snd_kcontrol_new wm8974_aux_boost_controls =
-SOC_DAPM_SINGLE("Aux Volume", WM8974_ADCBOOST, 0, 7, 0);
-
-/* Mic Input boost vol */
-static const struct snd_kcontrol_new wm8974_mic_boost_controls =
-SOC_DAPM_SINGLE("Mic Volume", WM8974_ADCBOOST, 4, 7, 0);
-
 static const struct snd_soc_dapm_widget wm8974_dapm_widgets[] = {
 SND_SOC_DAPM_MIXER("Speaker Mixer", WM8974_POWER3, 2, 0,
 	&wm8974_speaker_mixer_controls[0],
-- 
2.20.1

