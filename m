Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD122D2C75
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2019 16:27:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63DF01665;
	Thu, 10 Oct 2019 16:26:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63DF01665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570717620;
	bh=cq7l92AkQz5guCql4aeCAN7QeB5niIfys8KyRA+6Bds=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=fKuSbz3vJ6mfdl6+YTs/gUeBDdDUCYs7uIeauihSSNzLudJJ5ZdtZHOD6GmeB0RRm
	 m+SlKszcFts5zZnVFB0bWCZuFffVdAjue5SrF97mgvdsvSYKbferPxPpYJxmwKN3aZ
	 qr0lCP4UViY6pp/m42Sryhd3+wFnfldXpVMVXOsA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF48AF8063A;
	Thu, 10 Oct 2019 16:22:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CCFCF805FF; Thu, 10 Oct 2019 16:22:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8A2CF8045E
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 16:22:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8A2CF8045E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ndzeu7DV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=fH8Gr0gVZgg0km6M3wKZie7oRbqMt5A6Hv6J4ECL2Zc=; b=ndzeu7DVWXXq
 S9bLDwLNbOL0NblKxkv5c5Y4JMbH+U8zaiwxqX6ZxvHnSqoR7HwmrvTd5/Nws+GInS43UtIAK7WuD
 cy24gZfTWVfX/vAMXueJIheMv2yR4EboWiMgBYJ23sCLyYkTUMkqzqjhVLhra1y1xPaPqU4uZi3wB
 jjeAk=;
Received: from fw-tnat-cam3.arm.com ([217.140.106.51]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iIZKp-0001Za-Oq; Thu, 10 Oct 2019 14:22:31 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 6B70ED0003B; Thu, 10 Oct 2019 15:22:31 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20191008164443.1358-5-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191010142231.6B70ED0003B@fitzroy.sirena.org.uk>
Date: Thu, 10 Oct 2019 15:22:31 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: pci: add debug module param" to
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

   ASoC: SOF: pci: add debug module param

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

From 8b160dc2a92c83a566b0596c79febb5933f9a6b5 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Tue, 8 Oct 2019 11:44:38 -0500
Subject: [PATCH] ASoC: SOF: pci: add debug module param

Add debug parameter for snd-sof-pci.

One of the usages for this debug parameter to disable pm_runtime,
which can be useful for platform bringup, or keep the parent device
active while enabling pm_runtime for child devices (e.g. with
SoundWire or MFD). This can also be useful to measure suspend-resume
latencies or child devices.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191008164443.1358-5-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/sof-pci-dev.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index d66412a77873..030f2cb06921 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -29,6 +29,12 @@ static char *tplg_path;
 module_param(tplg_path, charp, 0444);
 MODULE_PARM_DESC(tplg_path, "alternate path for SOF topology.");
 
+static int sof_pci_debug;
+module_param_named(sof_pci_debug, sof_pci_debug, int, 0444);
+MODULE_PARM_DESC(sof_pci_debug, "SOF PCI debug options (0x0 all off)");
+
+#define SOF_PCI_DISABLE_PM_RUNTIME BIT(0)
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
 static const struct sof_dev_desc bxt_desc = {
 	.machines		= snd_soc_acpi_intel_bxt_machines,
@@ -249,6 +255,9 @@ static void sof_pci_probe_complete(struct device *dev)
 {
 	dev_dbg(dev, "Completing SOF PCI probe");
 
+	if (sof_pci_debug & SOF_PCI_DISABLE_PM_RUNTIME)
+		return;
+
 	/* allow runtime_pm */
 	pm_runtime_set_autosuspend_delay(dev, SND_SOF_SUSPEND_DELAY_MS);
 	pm_runtime_use_autosuspend(dev);
@@ -370,7 +379,8 @@ static void sof_pci_remove(struct pci_dev *pci)
 	snd_sof_device_remove(&pci->dev);
 
 	/* follow recommendation in pci-driver.c to increment usage counter */
-	pm_runtime_get_noresume(&pci->dev);
+	if (!(sof_pci_debug & SOF_PCI_DISABLE_PM_RUNTIME))
+		pm_runtime_get_noresume(&pci->dev);
 
 	/* release pci regions and disable device */
 	pci_release_regions(pci);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
