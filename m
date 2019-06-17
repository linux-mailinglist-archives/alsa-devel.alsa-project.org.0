Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BA64875E
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 17:34:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61D341781;
	Mon, 17 Jun 2019 17:33:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61D341781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560785686;
	bh=TIaPRI0uXOYz5ivl4J5zN9dOV4kn36ZsMYArqIQVmf0=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=d8gkUCdeEZmzIBduW/24CmlBgzD8Qi0Sz7UfES4npPHKA8yxma4LHXz6pEwzxPGly
	 wsUyAeGfyUc+QIOE9D/6c2mnG6LIdSspodSGJQGlIQ2meO2e5ehjsbUyRoZipyuD3G
	 HKUiVDDGKX2ms8sgyscQ1eTRr1pgz03+1tSohSAw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D9E4F89776;
	Mon, 17 Jun 2019 17:24:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E09EF89737; Mon, 17 Jun 2019 17:24:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D159BF896DA
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 17:24:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D159BF896DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="uLa5hFU2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=AjsEi3BqSOxc0xcqlDSRxxeOg/1ZHJbSL7WB1llfBtU=; b=uLa5hFU2sKmj
 H7UJt4Z3vmkHm6h0+AwOELZ2wVSiiPrR8UbnV+T7+ZuXq4F5gvKihsIACj9l7IKBhxM9zLS8v+E95
 HSoU9SmTie1zr8JbiEqaNcbGYGUMY5tmlPVijrQ7SNSt+EQ0x23d1y2TXLb6ZLt7GbqHawegYWpZm
 pU4Uo=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hctUc-0001y2-U1; Mon, 17 Jun 2019 15:24:22 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 636CE440046; Mon, 17 Jun 2019 16:24:22 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Keyon Jie <yang.jie@linux.intel.com>
In-Reply-To: <20190612172347.22338-10-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190617152422.636CE440046@finisterre.sirena.org.uk>
Date: Mon, 17 Jun 2019 16:24:22 +0100 (BST)
Cc: tiwai@suse.de, Xun Zhang <xun2.zhang@intel.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: hda-stream: fix a deadlock
	with bus->reg_lock" to the asoc tree
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

   ASoC: SOF: Intel: hda-stream: fix a deadlock with bus->reg_lock

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 7fd572e7d317fa51049d623badb8b2874bfd0119 Mon Sep 17 00:00:00 2001
From: Keyon Jie <yang.jie@linux.intel.com>
Date: Wed, 12 Jun 2019 12:23:41 -0500
Subject: [PATCH] ASoC: SOF: Intel: hda-stream: fix a deadlock with
 bus->reg_lock

We should use irq disabled mode when read/write hda registers from
thread context, as we need to hold the same bus->reg_lock in interrupt
context hda_dsp_stream_interrupt(), otherwise, when we are holding the
lock in hda_dsp_stream_hw_free() and the interrupt arrives, we will get
deadlock in the interrupt handler.

Error logs like this:

[    5.603606]        CPU0
[    5.603606]        ----
[    5.603607]   lock(&(&bus->reg_lock)->rlock);
[    5.603608]   <Interrupt>
[    5.603609]     lock(&(&bus->reg_lock)->rlock);
[    5.603610]
                *** DEADLOCK ***

[    5.603611] 2 locks held by pulseaudio/2329:
[    5.603612]  #0: 000000005fcf26c6 (&card->mutex/1){+.+.}, at: dpcm_fe_dai_hw_free+0x2b/0x110 [snd_soc_core]
[    5.603619]  #1: 00000000ef369faf (&rtd->pcm_mutex){+.+.}, at: soc_pcm_hw_free+0x2e/0x1c0 [snd_soc_core]

The fix is simple, let's switch to use spin_lock/unlock_irq().

Reported-by: Xun Zhang <xun2.zhang@intel.com>
Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-stream.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index d44318040948..23cff5aca007 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -448,12 +448,12 @@ int hda_dsp_stream_hw_free(struct snd_sof_dev *sdev,
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	u32 mask = 0x1 << stream->index;
 
-	spin_lock(&bus->reg_lock);
+	spin_lock_irq(&bus->reg_lock);
 	/* couple host and link DMA if link DMA channel is idle */
 	if (!link_dev->link_locked)
 		snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR,
 					SOF_HDA_REG_PP_PPCTL, mask, 0);
-	spin_unlock(&bus->reg_lock);
+	spin_unlock_irq(&bus->reg_lock);
 
 	return 0;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
