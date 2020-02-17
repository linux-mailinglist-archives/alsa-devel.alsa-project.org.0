Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EED76161D2B
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 23:08:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81DA31668;
	Mon, 17 Feb 2020 23:07:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81DA31668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581977284;
	bh=fHeEAy76nwaKfuS6Pjxm/prSU2nMk5D9/awW1Xo6MfQ=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ZHsH+hNgkfgRC4xybJRU05Q4+zinmlrh3HC44A/pOEqHIcDpUueE0+xL4u/q0+BOy
	 1uwfofG9QYB7Fs5HtkrMzvh6u16o5g7rpHXS1p8xERuP8alTFduoL5/CIEPpHAwZ40
	 QaR7OaWzseQUWq/sWMqPPRlPbnHnAN47ilia/iZA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B680CF8028C;
	Mon, 17 Feb 2020 23:04:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21DE5F8028A; Mon, 17 Feb 2020 23:04:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 722D2F8025F
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 23:04:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 722D2F8025F
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D19211B3;
 Mon, 17 Feb 2020 14:04:09 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D82C23F703;
 Mon, 17 Feb 2020 14:04:08 -0800 (PST)
Date: Mon, 17 Feb 2020 22:04:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Subject: Applied "ASoC: amd: ACP needs to be powered off in BIOS." to the asoc
 tree
In-Reply-To: <1581935964-15059-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
Message-Id: <applied-1581935964-15059-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Patchwork-Hint: ignore
Cc: , "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Alexander.Deucher@amd.com,
 Dan Carpenter <dan.carpenter@oracle.com>
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

   ASoC: amd: ACP needs to be powered off in BIOS.

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

From 3bc7b6c15fffdf3f818df31198c8c040ad8f7ea9 Mon Sep 17 00:00:00 2001
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Date: Mon, 17 Feb 2020 16:09:19 +0530
Subject: [PATCH] ASoC: amd: ACP needs to be powered off in BIOS.

Removed this logic because It is BIOS which needs to
power off the ACP power domian through ACP_PGFSM_CTRL
register when you De-initialize ACP Engine.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Link: https://lore.kernel.org/r/1581935964-15059-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/amd/raven/pci-acp3x.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/sound/soc/amd/raven/pci-acp3x.c b/sound/soc/amd/raven/pci-acp3x.c
index 65330bb50e74..da60e2ec5535 100644
--- a/sound/soc/amd/raven/pci-acp3x.c
+++ b/sound/soc/amd/raven/pci-acp3x.c
@@ -45,23 +45,6 @@ static int acp3x_power_on(void __iomem *acp3x_base)
 	return -ETIMEDOUT;
 }
 
-static int acp3x_power_off(void __iomem *acp3x_base)
-{
-	u32 val;
-	int timeout;
-
-	rv_writel(ACP_PGFSM_CNTL_POWER_OFF_MASK,
-			acp3x_base + mmACP_PGFSM_CONTROL);
-	timeout = 0;
-	while (++timeout < 500) {
-		val = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
-		if ((val & ACP_PGFSM_STATUS_MASK) == ACP_POWERED_OFF)
-			return 0;
-		udelay(1);
-	}
-	return -ETIMEDOUT;
-}
-
 static int acp3x_reset(void __iomem *acp3x_base)
 {
 	u32 val;
@@ -115,12 +98,6 @@ static int acp3x_deinit(void __iomem *acp3x_base)
 		pr_err("ACP3x reset failed\n");
 		return ret;
 	}
-	/* power off */
-	ret = acp3x_power_off(acp3x_base);
-	if (ret) {
-		pr_err("ACP3x power off failed\n");
-		return ret;
-	}
 	return 0;
 }
 
-- 
2.20.1

