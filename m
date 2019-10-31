Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 244BDEB151
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Oct 2019 14:37:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 649272117;
	Thu, 31 Oct 2019 14:36:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 649272117
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572529032;
	bh=gWnTwFfjiD6O4oR5Wn2aCgZL97OikGzvKMqzZH9WqVs=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ddN3fBNMfh4WJKFb3OAIOy6QidpquJIkgJYp0duMuHmoBmIvLoF6J3ZocUpaQBZHY
	 gdyj3Njo7nLAjwqk2X81mtKv1JreAYPy7OGkncsb7Z2vL8IYFejZT1PoL4OxpH7vj1
	 YbR+JOj8hNS+AlB/CgdMetFaPT4J5gmES6R5Mg7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6394BF80612;
	Thu, 31 Oct 2019 14:33:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92F61F805FC; Thu, 31 Oct 2019 14:33:44 +0100 (CET)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57AAEF803CF
 for <alsa-devel@alsa-project.org>; Thu, 31 Oct 2019 14:23:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57AAEF803CF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="KeematVd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=PqkpJDidtrs4MjSO1YgXlFn3w7gk52GWuWSM6KKKQrM=; b=KeematVdo2Lm
 j7dM4P8dc0T2bW2TAfgM6x11z/yst4mfsh9VSVb/BPJrhljAf1LyMf468hxAHjKAfPF1F2xrkaZ4E
 CSF0TTZcUsUcZNCknugRNC5bLOkkrg8gDv89V/pniUdY5VIUP4/JcwKblzRsu26jHBgO/7NvsBr6N
 WDeFY=;
Received: from [91.217.168.176] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iQAQK-0007oZ-UD; Thu, 31 Oct 2019 13:23:36 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 7C363D020AA; Thu, 31 Oct 2019 13:23:36 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Shuming Fan <shumingf@realtek.com>
In-Reply-To: <20191031115401.20898-1-shumingf@realtek.com>
X-Patchwork-Hint: ignore
Message-Id: <20191031132336.7C363D020AA@fitzroy.sirena.org.uk>
Date: Thu, 31 Oct 2019 13:23:36 +0000 (GMT)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, lgirdwood@gmail.com, tzungbi@google.com,
 Mark Brown <broonie@kernel.org>, derek.fang@realtek.com, flove@realtek.com
Subject: [alsa-devel] Applied "ASoC: rt1011: remove redundant code in
	kcontrol" to the asoc tree
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

   ASoC: rt1011: remove redundant code in kcontrol

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

From b9a3eea38b1eb8dd96fce64a8480e8ee38ee1451 Mon Sep 17 00:00:00 2001
From: Shuming Fan <shumingf@realtek.com>
Date: Thu, 31 Oct 2019 19:54:01 +0800
Subject: [PATCH] ASoC: rt1011: remove redundant code in kcontrol

The !component->card->instantiated statement should remove in kcontrol.
It is no need to check the card->instantiated in kcontrol.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
Link: https://lore.kernel.org/r/20191031115401.20898-1-shumingf@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt1011.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index dcd397a83cb4..8a74f374d779 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -1163,9 +1163,6 @@ static int rt1011_bq_drc_coeff_put(struct snd_kcontrol *kcontrol,
 		(struct rt1011_bq_drc_params *)ucontrol->value.integer.value;
 	unsigned int i, mode_idx = 0;
 
-	if (!component->card->instantiated)
-		return 0;
-
 	if (strstr(ucontrol->id.name, "AdvanceMode Initial Set"))
 		mode_idx = RT1011_ADVMODE_INITIAL_SET;
 	else if (strstr(ucontrol->id.name, "AdvanceMode SEP BQ Coeff"))
@@ -1236,9 +1233,6 @@ static int rt1011_r0_cali_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rt1011_priv *rt1011 = snd_soc_component_get_drvdata(component);
 
-	if (!component->card->instantiated)
-		return 0;
-
 	rt1011->cali_done = 0;
 	if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF &&
 		ucontrol->value.integer.value[0])
@@ -1284,9 +1278,6 @@ static int rt1011_r0_load_mode_put(struct snd_kcontrol *kcontrol,
 	if (ucontrol->value.integer.value[0] == rt1011->r0_reg)
 		return 0;
 
-	if (!component->card->instantiated)
-		return 0;
-
 	if (ucontrol->value.integer.value[0] == 0)
 		return -EINVAL;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
