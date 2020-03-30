Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E6119824F
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 19:26:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AB8F1675;
	Mon, 30 Mar 2020 19:25:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AB8F1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585589188;
	bh=9M25Hu+IUw0RfR3YGRaumlORty8QjSgj+onodrk7mNw=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=eG7fbhUha6G/sBQppc2z53bAESGYw5bMuPxMYKlpwxmaNfYbh3THIlhW4M3BKFjlC
	 oh/sbLY+xu6jvl5g75QQNYT/O2lCgK3Tt2m3+dMoUr+jJv5u5Qw1r/zoO6HwSZgLlA
	 ZkAUJpdswcMUbGWiqSjw7h4Hs/fhMGcB3J9W/Gxw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C233F8028E;
	Mon, 30 Mar 2020 19:23:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41399F8028F; Mon, 30 Mar 2020 19:23:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 1852FF8028C
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 19:23:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1852FF8028C
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC8D2101E;
 Mon, 30 Mar 2020 10:23:10 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30DCA3F68F;
 Mon, 30 Mar 2020 10:23:10 -0700 (PDT)
Date: Mon, 30 Mar 2020 18:23:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Applied "ASoC: Intel: bdw-rt5677: Remove ignore_suspend flag from
 SSP0 dai link" to the asoc tree
In-Reply-To: <20200319204947.18963-4-cezary.rojewski@intel.com>
Message-Id: <applied-20200319204947.18963-4-cezary.rojewski@intel.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>, lgirdwood@gmail.com,
 vkoul@kernel.org, Mark Brown <broonie@kernel.org>
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

   ASoC: Intel: bdw-rt5677: Remove ignore_suspend flag from SSP0 dai link

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

From b0ada40cb80d7e427fb719a4e6029935639fa668 Mon Sep 17 00:00:00 2001
From: Cezary Rojewski <cezary.rojewski@intel.com>
Date: Thu, 19 Mar 2020 21:49:46 +0100
Subject: [PATCH] ASoC: Intel: bdw-rt5677: Remove ignore_suspend flag from SSP0
 dai link

As of commit:
ASoC: soc-core: care .ignore_suspend for Component suspend

function soc-core::snd_soc_suspend no longer ignores 'ignore_suspend'
flag for dai links. While BE dai link for System Pin is
supposed to follow standard suspend-resume flow, appended
'ignore_suspend' flag disturbs that flow and causes audio to break
right after resume. Remove the flag to address this.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20200319204947.18963-4-cezary.rojewski@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/bdw-rt5677.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
index 6b4b64098d36..cc41a348295e 100644
--- a/sound/soc/intel/boards/bdw-rt5677.c
+++ b/sound/soc/intel/boards/bdw-rt5677.c
@@ -340,7 +340,6 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
-		.ignore_suspend = 1,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = broadwell_ssp0_fixup,
 		.ops = &bdw_rt5677_ops,
-- 
2.20.1

