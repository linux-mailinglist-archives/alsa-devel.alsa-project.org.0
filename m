Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6170171EB
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 08:49:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 701D51819;
	Wed,  8 May 2019 08:48:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 701D51819
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557298143;
	bh=YxAUW+Sn6KIqVNfuKJJaM2KU9PFR6L9KbaVtJGClyxA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Q+ShTaacCnG5rpH8IQSE9is7A2QRgjM9v/7YA7KlOmMFfx///4PZVIr/NeV4WX/Qt
	 5NPu0ijjtiouUy2XK68YjE/AkcgPsQGgG00Q8cx5T35P+vEAxfPa4GPZhHjoqsxVax
	 enHTKD9zCDkmRJ6O/EbZ40tBWgAsE/x4EghEyyDM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32A82F89726;
	Wed,  8 May 2019 08:47:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C74FF89715; Wed,  8 May 2019 08:47:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35272F8075E
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 08:47:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35272F8075E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="qcwIGb5J"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=8yDcOXLivvCI7VW05eWeYkR/bBE102Bi/V1RfjnJ5FI=; b=qcwIGb5Jkzx1
 sFvsRH6mncyPz/eKAijtaSJmjVjv1IBiwtuSm1NI6C0qsNCI22pTMSr53xwxVwtG5+TcXabajc17V
 3335TdDy+SYHVZXFmlQDdn3/GoUT7LnMP6QXC2LpeZStCphZsf1eMsyMHRuhyXkQTFbYve6IIYwVc
 aG96g=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOGMG-0007As-3K; Wed, 08 May 2019 06:47:17 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 607E6440017; Wed,  8 May 2019 07:47:08 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20190507163236.8783-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190508064708.607E6440017@finisterre.sirena.org.uk>
Date: Wed,  8 May 2019 07:47:08 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 kbuild-all@01.org, kbuild test robot <lkp@intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: xtensa: fix undefined references"
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

   ASoC: SOF: xtensa: fix undefined references

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

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

From 78989ff8aeaddc183237da558ee07deee35fbbbd Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Tue, 7 May 2019 11:32:35 -0500
Subject: [PATCH] ASoC: SOF: xtensa: fix undefined references

The SND_SOC_INTEL_COMMON Kconfig was removed months ago from SOF
Kconfig files but is still selected instead of the correct
SND_SOC_SOF_INTEL_COMMON kconfig which does select xtensa stuff,
leading to the following errors.

ld: sound/soc/sof/sof-acpi-dev.o:(.rodata+0x120): undefined reference
to `sof_xtensa_arch_ops'
ld: sound/soc/sof/sof-acpi-dev.o:(.rodata+0x180): undefined reference
to `sof_xtensa_arch_ops'
ld: sound/soc/sof/sof-acpi-dev.o:(.rodata+0x1e0): undefined reference
to `sof_xtensa_arch_ops'

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 32ee0fabab92..603e0db4f012 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -36,7 +36,7 @@ config SND_SOC_SOF_INTEL_HIFI_EP_IPC
 
 config SND_SOC_SOF_INTEL_ATOM_HIFI_EP
 	tristate
-	select SND_SOC_INTEL_COMMON
+	select SND_SOC_SOF_INTEL_COMMON
 	select SND_SOC_SOF_INTEL_HIFI_EP_IPC
 	help
 	  This option is not user-selectable but automagically handled by
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
