Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A012E7454
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 16:01:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B00C1FAC;
	Mon, 28 Oct 2019 16:00:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B00C1FAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572274904;
	bh=AMBHzXkIF1njBK0doswXOaa5yM9j1HwYgDS0uGfTggQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Qg1mLpcpAO0DlUIV5+GBjJEia+wOYNUC64bS54/tZz+0gRaeGQLtVLhEJ9f9LzxOH
	 0MJo96AmNMDx6M8DXa2VW8hW9O74YR7yQM0tUh/M7be0z1S3j59frLyjkdrkGZ1T0k
	 G73EooF5oaHRCzyY9DVcFy/Snw81IU8z4sIgnDtc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 626FAF8067C;
	Mon, 28 Oct 2019 15:56:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4100F8065A; Mon, 28 Oct 2019 15:56:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E530F803D6
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 15:56:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E530F803D6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="P2J9RAeS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=iBWlw68IevrAoqc26cOG39WRjF8dxJJZXNnTZLubOjw=; b=P2J9RAeSMltX
 0s905dAHwS0Us/0VsU8OiMjeRKzXrpdeGDa9j8rWRJ7NdVOAEszlA/aVgPBr88zMeqe4MfpzSlqIe
 mjXdc+eBZ/ibL9k4xRP92KmRuiutN+MoDwFglXAYXwPrxIIxT3X73Ufbl8/u40JhM8qjvQQSbxj4/
 wLoYg=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iP6Ra-0008Oo-9G; Mon, 28 Oct 2019 14:56:30 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D51EB27403F6; Mon, 28 Oct 2019 14:56:28 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Keyon Jie <yang.jie@linux.intel.com>
In-Reply-To: <20191025224122.7718-24-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191028145628.D51EB27403F6@ypsilon.sirena.org.uk>
Date: Mon, 28 Oct 2019 14:56:28 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: hda-dsp: implement
	suspend/resume for S0ix<->S0 transition" to the asoc tree
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

   ASoC: SOF: Intel: hda-dsp: implement suspend/resume for S0ix<->S0 transition

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

From 66e40876ddc325d892c493a6d83574bbba5770ce Mon Sep 17 00:00:00 2001
From: Keyon Jie <yang.jie@linux.intel.com>
Date: Fri, 25 Oct 2019 17:41:19 -0500
Subject: [PATCH] ASoC: SOF: Intel: hda-dsp: implement suspend/resume for
 S0ix<->S0 transition

Enable system wake up via IPC interrupt from DSP when the system is
suspending to the S0ix state, and disable it in the corresponding
resuming.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191025224122.7718-24-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-dsp.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index b5070409a5e3..d23573d9e9c4 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -477,6 +477,15 @@ static int hda_resume(struct snd_sof_dev *sdev, bool runtime_resume)
 
 int hda_dsp_resume(struct snd_sof_dev *sdev)
 {
+	struct pci_dev *pci = to_pci_dev(sdev->dev);
+
+	if (sdev->s0_suspend) {
+		/* restore and disable the system wakeup */
+		pci_restore_state(pci);
+		disable_irq_wake(pci->irq);
+		return 0;
+	}
+
 	/* init hda controller. DSP cores will be powered up during fw boot */
 	return hda_resume(sdev, false);
 }
@@ -509,8 +518,16 @@ int hda_dsp_runtime_suspend(struct snd_sof_dev *sdev)
 int hda_dsp_suspend(struct snd_sof_dev *sdev)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
+	struct pci_dev *pci = to_pci_dev(sdev->dev);
 	int ret;
 
+	if (sdev->s0_suspend) {
+		/* enable the system waking up via IPC IRQ */
+		enable_irq_wake(pci->irq);
+		pci_save_state(pci);
+		return 0;
+	}
+
 	/* stop hda controller and power dsp off */
 	ret = hda_suspend(sdev, false);
 	if (ret < 0) {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
