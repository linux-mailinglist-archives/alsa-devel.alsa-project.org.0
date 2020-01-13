Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD0F13AA92
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:19:46 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 573ED1AFC;
	Mon, 13 Jan 2020 16:17:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 573ED1AFC
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63FCBF802BD;
	Mon, 13 Jan 2020 16:13:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B865F80273; Mon, 13 Jan 2020 16:13:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 583C8F8025A
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 16:13:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 583C8F8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="knA6pbM2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=+odNWUg+RU67s4t5cFtA6tHOpeGPGcPlDJAZxEbsxok=; b=knA6pbM2q05U
 EE2QeVy/3olXgOesQ2hFkVdUDFY5C2TLV7q7O8lY4BI4rKud4NsviKj+8+KJF8zjVUJM+RjWpznVV
 cR9+kBjWsAAoFfaaIgylJcVsEZzbucAzr1rYJPvdCHOIIW8SZA+pCwjxOvGvqP9MQZwi930SLB/4d
 Y8m3I=;
Received: from fw-tnat-cam7.arm.com ([217.140.106.55]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1ir1Ox-0003LP-NF; Mon, 13 Jan 2020 15:13:11 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 7114FD01965; Mon, 13 Jan 2020 15:13:11 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20200110235751.3404-9-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200110235751.3404-9-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Date: Mon, 13 Jan 2020 15:13:11 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: hdac_hda: Fix error in driver removal
	after failed probe" to the asoc tree
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

   ASoC: hdac_hda: Fix error in driver removal after failed probe

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

From 552b1a85da9f63856e7e341b81c16e0e078204f1 Mon Sep 17 00:00:00 2001
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Date: Fri, 10 Jan 2020 17:57:51 -0600
Subject: [PATCH] ASoC: hdac_hda: Fix error in driver removal after failed
 probe

In case system has multiple HDA codecs, and codec probe fails for
at least one but not all codecs, driver will end up cancelling
a non-initialized timer context upon driver removal.

Call trace of typical case:

[   60.593646] WARNING: CPU: 1 PID: 1147 at kernel/workqueue.c:3032
__flush_work+0x18b/0x1a0
[...]
[   60.593670]  __cancel_work_timer+0x11f/0x1a0
[   60.593673]  hdac_hda_dev_remove+0x25/0x30 [snd_soc_hdac_hda]
[   60.593674]  device_release_driver_internal+0xe0/0x1c0
[   60.593675]  bus_remove_device+0xd6/0x140
[   60.593677]  device_del+0x175/0x3e0
[   60.593679]  ? widget_tree_free.isra.7+0x90/0xb0 [snd_hda_core]
[   60.593680]  snd_hdac_device_unregister+0x34/0x50 [snd_hda_core]
[   60.593682]  snd_hdac_ext_bus_device_remove+0x2a/0x60 [snd_hda_ext_core]
[   60.593684]  hda_dsp_remove+0x26/0x100 [snd_sof_intel_hda_common]
[   60.593686]  snd_sof_device_remove+0x84/0xa0 [snd_sof]
[   60.593687]  sof_pci_remove+0x10/0x30 [snd_sof_pci]
[   60.593689]  pci_device_remove+0x36/0xb0

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200110235751.3404-9-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/hdac_hda.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index 6803d39e09a5..43110151e928 100644
--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -588,7 +588,9 @@ static int hdac_hda_dev_remove(struct hdac_device *hdev)
 	struct hdac_hda_priv *hda_pvt;
 
 	hda_pvt = dev_get_drvdata(&hdev->dev);
-	cancel_delayed_work_sync(&hda_pvt->codec.jackpoll_work);
+	if (hda_pvt && hda_pvt->codec.registered)
+		cancel_delayed_work_sync(&hda_pvt->codec.jackpoll_work);
+
 	return 0;
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
