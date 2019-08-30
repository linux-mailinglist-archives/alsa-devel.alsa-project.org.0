Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBC7A360D
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 13:54:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5AB2168E;
	Fri, 30 Aug 2019 13:53:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5AB2168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567166041;
	bh=ZM+Bc8TiuJkCMLi5ufntgdSmBNvIVfODari/OS8AYU4=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=r9IuW6CuGNpPgFwhskAO8X42r8jKxCyuPAjPIAi30knGFosrSJmGENvnR/kmzz739
	 iVcKLi4pa6rBifdPjmOk9kXagBE/IOe8dU0YcwA7C2rMY8SEvZsi8rpRWV9MtPBueo
	 5n59zcpxkJ7zNvn9RpyXUhhFNAonN/rwBf2k90fg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44C6EF80678;
	Fri, 30 Aug 2019 13:46:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 890B9F805F6; Fri, 30 Aug 2019 13:45:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E10BF805F6
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 13:45:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E10BF805F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="O7r1inLO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=7N4lAMfgliwyuvTEIgGEk/CMFnYD43mELU01wcy6uMI=; b=O7r1inLO9a5A
 W2N5WdN/2R9Opygnee7Vm2TOu5k4hU8ray2SrEOpmwakej8rXnccd1Nvf/SE7sGutXG+efCW+yyY7
 fe/wnz11T3eg1I2y+UK/RNmj+DqO1Qht66wMnW+Ec7DG2KndnxRaINkWQGExHEs40rcsLJKm9v+U+
 +vsaM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i3fLC-0006IT-CU; Fri, 30 Aug 2019 11:45:18 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D404D2742BD3; Fri, 30 Aug 2019 12:45:17 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20190822113616.22702-5-cezary.rojewski@intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190830114517.D404D2742BD3@ypsilon.sirena.org.uk>
Date: Fri, 30 Aug 2019 12:45:17 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 tiwai@suse.com, lgirdwood@gmail.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: Intel: broadwell: Simplify device
	probe" to the asoc tree
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

   ASoC: Intel: broadwell: Simplify device probe

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 54d037d5a466ce518ee4bb81f39b79ac7d843ba6 Mon Sep 17 00:00:00 2001
From: Cezary Rojewski <cezary.rojewski@intel.com>
Date: Thu, 22 Aug 2019 13:36:16 +0200
Subject: [PATCH] ASoC: Intel: broadwell: Simplify device probe

With legacy ADSP private context adjusted, there is no need for double
safety.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Link: https://lore.kernel.org/r/20190822113616.22702-5-cezary.rojewski@intel.com
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/broadwell.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/intel/boards/broadwell.c b/sound/soc/intel/boards/broadwell.c
index ab38ef30dfff..db7e1e87156d 100644
--- a/sound/soc/intel/boards/broadwell.c
+++ b/sound/soc/intel/boards/broadwell.c
@@ -270,18 +270,14 @@ static struct snd_soc_card broadwell_rt286 = {
 static int broadwell_audio_probe(struct platform_device *pdev)
 {
 	struct snd_soc_acpi_mach *mach;
-	const char *platform_name = NULL;
 	int ret;
 
 	broadwell_rt286.dev = &pdev->dev;
 
 	/* override plaform name, if required */
 	mach = (&pdev->dev)->platform_data;
-	if (mach) /* extra check since legacy does not pass parameters */
-		platform_name = mach->mach_params.platform;
-
 	ret = snd_soc_fixup_dai_links_platform_name(&broadwell_rt286,
-						    platform_name);
+						    mach->mach_params.platform);
 	if (ret)
 		return ret;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
