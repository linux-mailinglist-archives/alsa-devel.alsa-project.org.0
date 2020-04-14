Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 227FA1A809E
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 17:01:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE44D16D1;
	Tue, 14 Apr 2020 17:00:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE44D16D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586876489;
	bh=FKzJ6BbzDrLS59Uwz7YPXemBXpem+y+Zph4aLw19dP8=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=DCRfRkMW/H/ucAzaARkyktr73zZKWAuIXSz8gpcVwfLv4vzz36crnL7lqrvqenv17
	 nAEmddzqtPWZ0spVTjyP3I9ll5hCAeILAeD3w9cQ9P7YD8HGOUyD6Ce7nvCA9PwlW9
	 f9vPl6c0JrlDV0qsjEEhEKt93KLt4cXWkMt7ayYM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3E2CF8028F;
	Tue, 14 Apr 2020 16:48:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84ADEF80334; Tue, 14 Apr 2020 16:48:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4238F8021E
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 16:47:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4238F8021E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="urDhtbdr"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AA9962076D;
 Tue, 14 Apr 2020 14:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586875677;
 bh=FKzJ6BbzDrLS59Uwz7YPXemBXpem+y+Zph4aLw19dP8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=urDhtbdrZjCr5rCTY6L/0LoKM1K1wtrAdomCEGEfKDXnAx262mkm0a2egrS/sGIMF
 cSROqD/pmr9mg+k9zIHlf/ApNyJ/tCvN7FUPT6p5oBMjrWp0BjXeCmgYi5uH2vmQBj
 QkP+kDcgJPdnVrmMyRyWyjWLVQPEEdnX3MoKEgLw=
Date: Tue, 14 Apr 2020 15:47:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Keyon Jie <yang.jie@linux.intel.com>
Subject: Applied "ASoC: Intel: sof-da7219-max98373: add DMIC widget and route"
 to the asoc tree
In-Reply-To: <20200409185827.16255-8-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200409185827.16255-8-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

   ASoC: Intel: sof-da7219-max98373: add DMIC widget and route

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

From 35e648cc66ac814ae1114695e6ace26bc63504c8 Mon Sep 17 00:00:00 2001
From: Keyon Jie <yang.jie@linux.intel.com>
Date: Thu, 9 Apr 2020 13:58:21 -0500
Subject: [PATCH] ASoC: Intel: sof-da7219-max98373: add DMIC widget and route

Add DMIC endpoint widget and route to make DMIC DAPM routes completed,
to make DAPM Power Management works for DMIC streams.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/20200409185827.16255-8-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/sof_da7219_max98373.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/intel/boards/sof_da7219_max98373.c b/sound/soc/intel/boards/sof_da7219_max98373.c
index 8b5b74ba349f..8ca8f76470fa 100644
--- a/sound/soc/intel/boards/sof_da7219_max98373.c
+++ b/sound/soc/intel/boards/sof_da7219_max98373.c
@@ -86,6 +86,8 @@ static const struct snd_soc_dapm_widget widgets[] = {
 	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0,
 			    platform_clock_control, SND_SOC_DAPM_POST_PMD |
 			    SND_SOC_DAPM_PRE_PMU),
+
+	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
 };
 
 static const struct snd_soc_dapm_route audio_map[] = {
@@ -99,6 +101,9 @@ static const struct snd_soc_dapm_route audio_map[] = {
 
 	{ "Left Spk", NULL, "Left BE_OUT" },
 	{ "Right Spk", NULL, "Right BE_OUT" },
+
+	/* digital mics */
+	{"DMic", NULL, "SoC DMIC"},
 };
 
 /* For MAX98360A amp */
@@ -111,6 +116,8 @@ static const struct snd_soc_dapm_widget max98360a_widgets[] = {
 	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0,
 			    platform_clock_control, SND_SOC_DAPM_POST_PMD |
 			    SND_SOC_DAPM_PRE_PMU),
+
+	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
 };
 
 static const struct snd_soc_dapm_route max98360a_map[] = {
@@ -123,6 +130,9 @@ static const struct snd_soc_dapm_route max98360a_map[] = {
 	{ "Headset Mic", NULL, "Platform Clock" },
 
 	{"Spk", NULL, "Speaker"},
+
+	/* digital mics */
+	{"DMic", NULL, "SoC DMIC"},
 };
 
 static struct snd_soc_jack headset;
-- 
2.20.1

