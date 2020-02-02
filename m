Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD5014FD07
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Feb 2020 13:11:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EADCD15E2;
	Sun,  2 Feb 2020 13:10:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EADCD15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580645482;
	bh=NXRyAXsZw5F1qHkTFcZenEcmKS72Lf3QXjRgI9INP98=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=f5DmsnRwH1pL0bnBcIlgRYHo5Ggm3s7A1WPBI0w7Ci8jHGMepWyqkudniYwmk6Svq
	 xYFQm+swPyqzc7TbD79H6Xma22885Spv2DgF/X1e2DXK8FxTwMg7auOV0lL6ZQpdQs
	 I8FBqFUej3bh0XjdV33EUt0ADbRRNbx6t5Yqc8Es=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1DE6F80212;
	Sun,  2 Feb 2020 13:08:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58EAAF800B8; Sun,  2 Feb 2020 13:08:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F594F800B8
 for <alsa-devel@alsa-project.org>; Sun,  2 Feb 2020 13:08:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F594F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="nStP1vaF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=o8fuEFkxXFx0PrQz0pJqfxYgnm7tfYXB7+HpzXyuEEs=; b=nStP1vaF6w7n
 9kb85VQSv1uw4D/5u5SgeX+6JZQkhmrKHw8ZziDglHmmRY/mnFdhqe1W6NVMGGxnXBfXH1echZbO7
 /Jj37LxoSnDDu5MA7JVPvAEArlfzp0aLqV2F784GPZ8sRgDoYj+X7X6RfLLomc0ebCliJOZa75vH9
 rqW4U=;
Received: from [151.216.144.116] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iyE3W-0006sq-JB; Sun, 02 Feb 2020 12:08:50 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 9F34FD01A54; Sun,  2 Feb 2020 12:08:49 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Yong Zhi <yong.zhi@intel.com>
In-Reply-To: <20200131204032.10213-1-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200131204032.10213-1-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Date: Sun,  2 Feb 2020 12:08:49 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Divagar Mohandass <divagar.mohandass@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: add PCI ID for JasperLake"
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

   ASoC: SOF: Intel: add PCI ID for JasperLake

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From 6ba7fc99680b2250deba1a23f34d31fd25125d61 Mon Sep 17 00:00:00 2001
From: Yong Zhi <yong.zhi@intel.com>
Date: Fri, 31 Jan 2020 14:40:32 -0600
Subject: [PATCH] ASoC: SOF: Intel: add PCI ID for JasperLake

Mirror ID added for legacy HDaudio.

Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Divagar Mohandass <divagar.mohandass@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200131204032.10213-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/sof-pci-dev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index bf01b92f0dac..cec631a1389b 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -417,6 +417,8 @@ static const struct pci_device_id sof_pci_ids[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_JASPERLAKE)
 	{ PCI_DEVICE(0x8086, 0x38c8),
 		.driver_data = (unsigned long)&jsl_desc},
+	{ PCI_DEVICE(0x8086, 0x4dc8),
+		.driver_data = (unsigned long)&jsl_desc},
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_LP)
 	{ PCI_DEVICE(0x8086, 0x02c8),
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
