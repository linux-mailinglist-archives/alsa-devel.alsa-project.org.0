Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65412F96E6
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 18:18:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E352F1615;
	Tue, 12 Nov 2019 18:17:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E352F1615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573579090;
	bh=lKcp8eFdL1egnAzq1g6dqOJdkkpA8L0vRonzCKRZdEI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Gr3SaFRItFCmA/oGwYchwL88u0RXXHRfYcf/c/RYytGTb/jqo7b5LDckK9AANgSyJ
	 miTxUdr8ga11zn8K+UQJBypQ3CqDh9MEIYDS3MgMqS0TAZAhoE082U1JVddOiYpd/M
	 JaO6MXMD1XTXtTQc7ZLqIGyd5d8o3Q1qAD0PYk2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3AB8F805FE;
	Tue, 12 Nov 2019 18:16:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6869DF805FC; Tue, 12 Nov 2019 18:16:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6837F80275
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 18:16:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6837F80275
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="qWTtAU/S"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Wd/Yso7jGiuspSQex7+cNiU4Tr46aSynPXm53MPyPGc=; b=qWTtAU/SCIRz
 77X1+T/LF9Gs92uXxDnEfH0OmCH2zn8D4oG7kUngTx2Q9kgyKdRUZ/e34jx7igLJFaGntmp5z+JbM
 An4+Er1oQ+YDsBXTO6HpzEMGamaCEfb96zW4lhgZVArNvMdOxJWW2j+Urwr8yTsEt1/T1ReM6CfXB
 ehl3I=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iUZm7-0008Il-OL; Tue, 12 Nov 2019 17:16:19 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 2DED527429FE; Tue, 12 Nov 2019 17:16:19 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Keyon Jie <yang.jie@linux.intel.com>
In-Reply-To: <20191111223343.19986-5-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191112171619.2DED527429FE@ypsilon.sirena.org.uk>
Date: Tue, 12 Nov 2019 17:16:19 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: PM: only suspend to D0I3 when
	needed" to the asoc tree
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

   ASoC: SOF: PM: only suspend to D0I3 when needed

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

From 5e35d5f4224adb24c2bfa814b9fb562050aba3ea Mon Sep 17 00:00:00 2001
From: Keyon Jie <yang.jie@linux.intel.com>
Date: Mon, 11 Nov 2019 16:33:43 -0600
Subject: [PATCH] ASoC: SOF: PM: only suspend to D0I3 when needed

We should suspend audio to D3 by default, for the sake of power saving,
change the condition of D0I3 suspending here to that when there is
stream with suspend_ignored specified.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191111223343.19986-5-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/pm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index b89810bf3230..0fd5567237a8 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -468,7 +468,7 @@ int snd_sof_resume(struct device *dev)
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	int ret;
 
-	if (sdev->s0_suspend) {
+	if (snd_sof_dsp_d0i3_on_suspend(sdev)) {
 		/* resume from D0I3 */
 		dev_dbg(sdev->dev, "DSP will exit from D0i3...\n");
 		ret = snd_sof_set_d0_substate(sdev, SOF_DSP_D0I0);
@@ -497,7 +497,7 @@ int snd_sof_suspend(struct device *dev)
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	int ret;
 
-	if (sdev->s0_suspend) {
+	if (snd_sof_dsp_d0i3_on_suspend(sdev)) {
 		/* suspend to D0i3 */
 		dev_dbg(sdev->dev, "DSP is trying to enter D0i3...\n");
 		ret = snd_sof_set_d0_substate(sdev, SOF_DSP_D0I3);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
