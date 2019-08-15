Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C70D8F252
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 19:35:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04F5816A9;
	Thu, 15 Aug 2019 19:34:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04F5816A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565890514;
	bh=Exqm7klsWCGM6Xxdykq93fmC86G/lvkMj0xlSYWnftc=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=uqfaD/RyUEOdFHR28x8G+T7TUZh02nkMcc5RJRt/zdCPbBm7xj1ukNz6ZIUZHEHOY
	 DYBU1TXO7YLBMw4x+OHiRbxN97uoKmVamPYjs3HpgcdFrxvyT3gIT56Zy6a9jJBAIJ
	 2yN0YGL1LAlArwW6Nq8bj3mNauOwpEydV6g1Bypo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DD86F80C07;
	Thu, 15 Aug 2019 19:16:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0E14F8060D; Thu, 15 Aug 2019 19:15:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f98.google.com (mail-wr1-f98.google.com
 [209.85.221.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71CC5F8060E
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 19:14:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71CC5F8060E
Received: by mail-wr1-f98.google.com with SMTP id t16so2862226wra.6
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=EBah94Fr7tIfYKK+W7UUJE/2mJ5LVn1vxmjqTPPsQSs=;
 b=OIbsR5/lqJF8c8O9p1UbXPvwmMsLfh2SXj04Q1pUyay6jfnFt7CA77H1j0/FNNldm/
 NUS0rbv3bA4MGXjU3wtVhTxYfxvL/TT+AO3mlsO8QdP3sfFxI/NXJ7Prxx2FvjR00brW
 5g1ibvZCL5fJs9gg5Mds4c+ccF8BLJpUbNeYyjTWKAY8dv4qf09kI8EhHhCPO0gQ9/fb
 g7J1i5TVu/rRg1XoFqvH/PucZsUAKEXN8a1+hDQnugnmnkuWU2LsneCI7kiInrQFuWJ4
 z7OsjqQwKvfWwuKh2I0IuH3XI0icODIDZ9Xs08KfuIL6Y1oEzHwvUXrQxk34ZEujyW92
 tzrg==
X-Gm-Message-State: APjAAAWUrlMm6bBh6TdbYe6h94lxAvujtAM0E/P0s63MQ2Y6bnRX2Qpn
 +QjYMvidff0lmLqN7CW0kfBjV5tcm/LztVT9gnN7lMHtqB6BHBFKpJeKASE0QMqOFQ==
X-Google-Smtp-Source: APXvYqxW0OliB9SutK8zfOvwU9Yd6VyRMNpRpXF9pByIehZ5MYAAcPklPsm6lvjAz0r5Zuu6Pk7A70bXI9Ob
X-Received: by 2002:a5d:4703:: with SMTP id y3mr6980783wrq.63.1565889268194;
 Thu, 15 Aug 2019 10:14:28 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id w13sm46863wrp.62.2019.08.15.10.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 10:14:28 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyJKV-00052S-UI; Thu, 15 Aug 2019 17:14:28 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 574622742B9E; Thu, 15 Aug 2019 18:14:27 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20190812190502.30729-1-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190815171427.574622742B9E@ypsilon.sirena.org.uk>
Date: Thu, 15 Aug 2019 18:14:27 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 kbuild test robot <lkp@intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: fix HDA direct MMIO access" to the
	asoc tree
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

   ASoC: SOF: fix HDA direct MMIO access

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

From 9c6c417d95d83999c16965186f6e755ad8a8b658 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Mon, 12 Aug 2019 14:05:02 -0500
Subject: [PATCH] ASoC: SOF: fix HDA direct MMIO access

The recent change to remove the bus->io_ops callbacks used an older
version of the SOF code base, and when merged into Mark's for-next it
invalidated changes, resulting in broken compilation identified by
kbuild and reproduced during the weekly SOF rebase.

Restore SOF code overridden by git merge and apply Takashi's intended
change in the 'right' location.

Fixes: c2f16a94a8049 ("Merge branch 'topic/hda-bus-ops-cleanup'")
Reported-by: kbuild test robot <lkp@intel.com>
Cc: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190812190502.30729-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-ctrl.c |  2 +-
 sound/soc/sof/intel/hda-dsp.c  | 39 ----------------------------------
 2 files changed, 1 insertion(+), 40 deletions(-)

diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index a7fee403cb90..bc41028a7a01 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -254,7 +254,7 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev, bool full_reset)
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 	/* Reset stream-to-link mapping */
 	list_for_each_entry(hlink, &bus->hlink_list, list)
-		bus->io_ops->reg_writel(0, hlink->ml_addr + AZX_REG_ML_LOSIDV);
+		writel(0, hlink->ml_addr + AZX_REG_ML_LOSIDV);
 #endif
 
 	bus->chip_init = true;
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 097727cda5cb..fb55a3c5afd0 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -354,45 +354,6 @@ static int hda_resume(struct snd_sof_dev *sdev, bool runtime_resume)
 		return ret;
 	}
 
-	hda_dsp_ctrl_misc_clock_gating(sdev, false);
-
-	/* Reset stream-to-link mapping */
-	list_for_each_entry(hlink, &bus->hlink_list, list)
-		writel(0, hlink->ml_addr + AZX_REG_ML_LOSIDV);
-
-	hda_dsp_ctrl_misc_clock_gating(sdev, true);
-#else
-
-	hda_dsp_ctrl_misc_clock_gating(sdev, false);
-
-	/* reset controller */
-	ret = hda_dsp_ctrl_link_reset(sdev, true);
-	if (ret < 0) {
-		dev_err(sdev->dev,
-			"error: failed to reset controller during resume\n");
-		return ret;
-	}
-
-	/* take controller out of reset */
-	ret = hda_dsp_ctrl_link_reset(sdev, false);
-	if (ret < 0) {
-		dev_err(sdev->dev,
-			"error: failed to ready controller during resume\n");
-		return ret;
-	}
-
-	/* enable hda bus irq */
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, SOF_HDA_INTCTL,
-				SOF_HDA_INT_CTRL_EN | SOF_HDA_INT_GLOBAL_EN,
-				SOF_HDA_INT_CTRL_EN | SOF_HDA_INT_GLOBAL_EN);
-
-	hda_dsp_ctrl_misc_clock_gating(sdev, true);
-#endif
-
-	/* enable ppcap interrupt */
-	hda_dsp_ctrl_ppcap_enable(sdev, true);
-	hda_dsp_ctrl_ppcap_int_enable(sdev, true);
-
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 	/* check jack status */
 	if (runtime_resume)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
