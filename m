Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95746E7493
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 16:12:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BDEC2012;
	Mon, 28 Oct 2019 16:11:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BDEC2012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572275544;
	bh=72J/Aq4oPoSozschtfyhvHVDOvZyh7CplK7CGvTuDrA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=lNR+93XAgF463n0a0ig+u5D4OqkUfQv15OcBAHjq7zXOjPw5RuJq7S4BT9bW5yvAn
	 6Qo9pYukY8M94MqLEXp1B9p3PN/wNBufwcbr4PIuQrLT0laWCeULHtx5bRLgOx1fZW
	 mTy7fjgrvmHozVAq5KxGQ43GleIjhd/NnHx5CIqU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 784A6F80793;
	Mon, 28 Oct 2019 15:57:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3287EF80713; Mon, 28 Oct 2019 15:57:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1D40F80638
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 15:56:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1D40F80638
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Op2h14B2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=7RpxeqCZmG7jTvEnrtlha9Q0UvkoFSGbl7EXlpP0IDE=; b=Op2h14B2g6G8
 PT6+Jngyl9/BCgg0w485UhLh/tISHxpTuUuhLSxTac4yMMzzQdDo6i8cFEHeHPd73ACXcc42ZF2ag
 mfQZnjfZMvZyas2T+DhWo94RLJE6zQSXzLHYisknefWwjCYurb2HSlGyuOEDpzbBygRYhft2WyIee
 XR8D8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iP6Rh-0008RR-Fa; Mon, 28 Oct 2019 14:56:37 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id EB94527403E4; Mon, 28 Oct 2019 14:56:35 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Keyon Jie <yang.jie@linux.intel.com>
In-Reply-To: <20191025224122.7718-3-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191028145635.EB94527403E4@ypsilon.sirena.org.uk>
Date: Mon, 28 Oct 2019 14:56:35 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: reset default d0_substate at
	probe() and resume()" to the asoc tree
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

   ASoC: SOF: reset default d0_substate at probe() and resume()

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

From 09fe6b528886c0d07ce539b837749edcc46618d0 Mon Sep 17 00:00:00 2001
From: Keyon Jie <yang.jie@linux.intel.com>
Date: Fri, 25 Oct 2019 17:40:58 -0500
Subject: [PATCH] ASoC: SOF: reset default d0_substate at probe() and resume()

We initialize/reset d0_substate to default d0i0 value when doing
transition D3-->D0, e.g. at success of probing and resuming.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191025224122.7718-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/core.c | 3 +++
 sound/soc/sof/pm.c   | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 5998861a9002..8661c2cca76b 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -458,6 +458,9 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 	/* initialize sof device */
 	sdev->dev = dev;
 
+	/* initialize default D0 sub-state */
+	sdev->d0_substate = SOF_DSP_D0I0;
+
 	sdev->pdata = plat_data;
 	sdev->first_boot = true;
 	dev_set_drvdata(dev, sdev);
diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index e23beaeefe00..81e623dfc7e5 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -326,6 +326,9 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 			"error: ctx_restore ipc error during resume %d\n",
 			ret);
 
+	/* initialize default D0 sub-state */
+	sdev->d0_substate = SOF_DSP_D0I0;
+
 	return ret;
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
