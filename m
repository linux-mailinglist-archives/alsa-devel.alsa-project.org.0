Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD321A80E6
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 17:03:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B32D016CE;
	Tue, 14 Apr 2020 17:02:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B32D016CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586876590;
	bh=q1TsmEQ7wbDcJmniqWHqMFjLmrk1YLX7JD6dHw9hv8A=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=rnRYbwiTz2rqQD1to0YPLScS0hhYEWwhkunR2MO3nz81IA4t/me0MMc9vYmj5u2S4
	 KvpQiAT/FoXDTrqIJ4zS/+nF+cfEblUqGQUWBW0VW+WK4CNXoyh7dC6K1k7O+TaBPD
	 yLjnvlOTnod0gHkgKJCF8C81l/MBgKmuegM4qsnM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2780EF80385;
	Tue, 14 Apr 2020 16:48:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FA5AF8034D; Tue, 14 Apr 2020 16:48:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB5C0F8033E
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 16:48:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB5C0F8033E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CF2B0nLD"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9CB522078B;
 Tue, 14 Apr 2020 14:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586875693;
 bh=q1TsmEQ7wbDcJmniqWHqMFjLmrk1YLX7JD6dHw9hv8A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=CF2B0nLDXLPbuhCZ4Y4bB/bP7S3jqGvaQAGnFrLYXrkUjAgLHAPwQzPdTUv3vvAXT
 L11aBvxGLNNJ5+ZSKXTVEGQuiB/5l9tEUFMtWODJCKNFhz0L69vhACTnhcOm0NNvpX
 ixUFa9enrWt1Wf9IG4t4BNWD4EDPBxhWOPFFBUQw=
Date: Tue, 14 Apr 2020 15:48:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Libin Yang <libin.yang@linux.intel.com>
Subject: Applied "ASoC: SOF: Intel: add PCI ID for ElkhartLake" to the asoc
 tree
In-Reply-To: <20200409185827.16255-5-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200409185827.16255-5-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
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

   ASoC: SOF: Intel: add PCI ID for ElkhartLake

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

From a4ed29273376cb1f5aa05b90eb3c4d5877564976 Mon Sep 17 00:00:00 2001
From: Libin Yang <libin.yang@linux.intel.com>
Date: Thu, 9 Apr 2020 13:58:18 -0500
Subject: [PATCH] ASoC: SOF: Intel: add PCI ID for ElkhartLake

Add PCI ID for ElkhartLake platform.

Signed-off-by: Libin Yang <libin.yang@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20200409185827.16255-5-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/sof-pci-dev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index cec631a1389b..b5f0221d624f 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -435,6 +435,8 @@ static const struct pci_device_id sof_pci_ids[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_ELKHARTLAKE)
 	{ PCI_DEVICE(0x8086, 0x4b55),
 		.driver_data = (unsigned long)&ehl_desc},
+	{ PCI_DEVICE(0x8086, 0x4b58),
+		.driver_data = (unsigned long)&ehl_desc},
 #endif
 	{ 0, }
 };
-- 
2.20.1

