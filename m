Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C678271751
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 13:44:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65A791887;
	Tue, 23 Jul 2019 13:43:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65A791887
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563882256;
	bh=llE7YEEl4VC0L6A68Fdn5Af1vsAnrFWEZnqDlbVBsVY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=MOCQyek1aSPboRrzJs/Yaa7K3cV++ktgIAnMPjmFu0mR23alkhUxT8mxsBQEzWdvT
	 vuLb7TwfCHUN7Evvqel2sXh2bHexQhyOkVtrtDHBE8CCQqprxnJ030PAhPsxQb0XKA
	 oedgfbooqhgbE5tV3vaUUTOyse+22fbAMj4cq8GQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED90CF806E5;
	Tue, 23 Jul 2019 13:30:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F2B0F804AA; Tue, 23 Jul 2019 13:29:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2431F803D0
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 13:29:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2431F803D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Ze4UZa/q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=i3bn3vknccgy+LaBtM+7Mp4ZVWjd68Syij331BYWKeI=; b=Ze4UZa/q/IqA
 HJj0+dlmP2wURKfCMDjJWuixS/qZ3GB0DoHXn0CMIf9ZRURSHVnQjm9SopVkCnhGwk28YIhHXbhHO
 M4Ab20yl047rIrX/7fIOmDgK6N3S8XzbU8jef4jDgTZAS/n8GEUrllbLgHMyInCsvGA96/7QVpowx
 Wq2nQ=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpsyq-0003Kj-9c; Tue, 23 Jul 2019 11:29:16 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id A2AE12742BAB; Tue, 23 Jul 2019 12:29:15 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20190722141402.7194-21-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190723112915.A2AE12742BAB@ypsilon.sirena.org.uk>
Date: Tue, 23 Jul 2019 12:29:15 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: hda: remove misleading
	error trace from IRQ thread" to the asoc tree
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

   ASoC: SOF: Intel: hda: remove misleading error trace from IRQ thread

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

From 717dedb1dcee92788b81233aa0a221573c95daff Mon Sep 17 00:00:00 2001
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Date: Mon, 22 Jul 2019 09:14:01 -0500
Subject: [PATCH] ASoC: SOF: Intel: hda: remove misleading error trace from IRQ
 thread

Downgrade "nothing to do in IRQ thread" message from error to a debug
message in the IPC interrupt handler thread.

The spurious wake-up can happen if a HDA stream interrupt is
raised while the IPC interrupt thread is running. IPC functionality
is not impacted by this condition, so debug is a more appropriate
trace level.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190722141402.7194-21-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/cnl.c     | 4 ++--
 sound/soc/sof/intel/hda-ipc.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index f2b392998f20..ffd8d4394537 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -101,8 +101,8 @@ static irqreturn_t cnl_ipc_irq_thread(int irq, void *context)
 		/*
 		 * This interrupt is not shared so no need to return IRQ_NONE.
 		 */
-		dev_err_ratelimited(sdev->dev,
-				    "error: nothing to do in IRQ thread\n");
+		dev_dbg_ratelimited(sdev->dev,
+				    "nothing to do in IPC IRQ thread\n");
 	}
 
 	/* re-enable IPC interrupt */
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index 50244b82600c..2ecba91f5219 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -224,8 +224,8 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 		/*
 		 * This interrupt is not shared so no need to return IRQ_NONE.
 		 */
-		dev_err_ratelimited(sdev->dev,
-				    "error: nothing to do in IRQ thread\n");
+		dev_dbg_ratelimited(sdev->dev,
+				    "nothing to do in IPC IRQ thread\n");
 	}
 
 	/* re-enable IPC interrupt */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
