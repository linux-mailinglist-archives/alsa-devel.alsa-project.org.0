Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B44784DB1
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 15:40:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE7311666;
	Wed,  7 Aug 2019 15:39:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE7311666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565185209;
	bh=gBLzgKJjhme54I1q/VH2mtNizl0ibNHTBQgimRoTHmE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=XC26Nm459z48mroasYGKBPISbJ0Dsajp9zpc9Q3WlXlUd+T8G72pZG1f6fwCBLGAQ
	 KLAu9IZiv9HM5WjHEEwGQi/gzub/kGt8CGWC1hwsuQkFSX6iASk/uqJce7usAlnsQu
	 zFVFKSzn2rT8N/MAxHi/vXfWnSz2SJWUvT82viSc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A82CF806F7;
	Wed,  7 Aug 2019 15:31:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D797F805FB; Wed,  7 Aug 2019 15:31:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AE2BF805E2
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 15:30:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AE2BF805E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Wrc7rH76"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=mfWL2m+BeNfnO93owf1Y8Hy5EN/EL8m3T+0h1zMwzuM=; b=Wrc7rH76tSsn
 foToCaQLSCPIF5AgHm8Z2o7tWenI0S2Hxw+Dc9EuCxu9m91zj1NjpDe9bofOkNLpNdhszn8t0WD+T
 jvEx71My2jIJS9UwROeLMM+cvIHgHvZ2RitTgFiOZWsAko7hvayKdBuEN+ICP/yIK8R9hlD/rhMOF
 2MTWo=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hvM1i-0007fp-6H; Wed, 07 Aug 2019 13:30:50 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 79D22274304E; Wed,  7 Aug 2019 14:30:49 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20190806170603.10815-1-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190807133049.79D22274304E@ypsilon.sirena.org.uk>
Date: Wed,  7 Aug 2019 14:30:49 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: hda: fix MSI handling" to
	the asoc tree
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

   ASoC: SOF: Intel: hda: fix MSI handling

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

From bb67dd1878de5766c24fe7a4002d1a12c14da518 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Tue, 6 Aug 2019 12:06:03 -0500
Subject: [PATCH] ASoC: SOF: Intel: hda: fix MSI handling

The addition of a kernel module parameter to optionally disable MSI
had the side effect of permanently disabling it.

The return value of pci_alloc_irq_vectors() is the number of allocated
vectors or a negative number on error, so testing with the ! operator
is not quite right. It was one optimization too far.

Restore previous behavior to use MSI by default, unless the user
selects not to do so or the allocation of irq_vectors fails.

Fixes: 672ff5e3596ee ('ASoC: SOF: Intel: hda: add a parameter to disable MSI')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190806170603.10815-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 79cce20666b6..53813de7844e 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -537,7 +537,7 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 	 * if it fails, use legacy interrupt mode
 	 * TODO: support msi multiple vectors
 	 */
-	if (hda_use_msi && !pci_alloc_irq_vectors(pci, 1, 1, PCI_IRQ_MSI)) {
+	if (hda_use_msi && pci_alloc_irq_vectors(pci, 1, 1, PCI_IRQ_MSI) > 0) {
 		dev_info(sdev->dev, "use msi interrupt mode\n");
 		hdev->irq = pci_irq_vector(pci, 0);
 		/* ipc irq number is the same of hda irq */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
