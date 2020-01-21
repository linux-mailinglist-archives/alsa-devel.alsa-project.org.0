Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF28144351
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2020 18:33:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46696168E;
	Tue, 21 Jan 2020 18:32:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46696168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579628027;
	bh=F2Ba2owB5/6iJ1Cbm3p1AfKBIY8nOX3t88z5wviKNB8=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=RLA9xqCMbby8YkYPxRveDjdJ7ZvyOMvSmfNaXK4puWe6K2Mb9tWe0hzvxQkZB47aX
	 qBsGNMCWVhavb45Caom1+qTvilwxJWRe3rlQThu2NeXubj042Q+IGwIjJimgOpRtew
	 RkwVkN+QB9Q23xQFlkwMdRYZla6H2d6fOhAnzOIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C1D5F802DF;
	Tue, 21 Jan 2020 18:28:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8346F802A7; Tue, 21 Jan 2020 18:28:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id E5F56F80291
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 18:28:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5F56F80291
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FE1C328;
 Tue, 21 Jan 2020 09:28:21 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F9923F6C4;
 Tue, 21 Jan 2020 09:28:20 -0800 (PST)
Date: Tue, 21 Jan 2020 17:28:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87sgkbx7ic.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87sgkbx7ic.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: pxa: pxa2xx-i2s: move .suspend/.resume
	to component" to the asoc tree
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

   ASoC: pxa: pxa2xx-i2s: move .suspend/.resume to component

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From 0b1c89944207975dac17a176052b92780642b90b Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 20 Jan 2020 10:04:59 +0900
Subject: [PATCH] ASoC: pxa: pxa2xx-i2s: move .suspend/.resume to component

There is no big difference at implementation for .suspend/.resume
between DAI driver and Component driver.
But because some driver is using DAI version, thus ALSA SoC needs
to keep supporting it, hence, framework becoming verbose.
If we can switch all DAI driver .suspend/.resume to Component driver,
we can remove verbose code from ALSA SoC.

Driver is getting its private data via dai->dev.
But dai->dev and component->dev are same dev, thus, we can convert
these. For same reason, we can convert dai->active to
component->active if necessary.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87sgkbx7ic.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/pxa/pxa2xx-i2s.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/pxa/pxa2xx-i2s.c b/sound/soc/pxa/pxa2xx-i2s.c
index d9d366a8df11..5f1c477b5833 100644
--- a/sound/soc/pxa/pxa2xx-i2s.c
+++ b/sound/soc/pxa/pxa2xx-i2s.c
@@ -261,7 +261,7 @@ static void pxa2xx_i2s_shutdown(struct snd_pcm_substream *substream,
 }
 
 #ifdef CONFIG_PM
-static int pxa2xx_i2s_suspend(struct snd_soc_dai *dai)
+static int pxa2xx_soc_pcm_suspend(struct snd_soc_component *component)
 {
 	/* store registers */
 	pxa_i2s.sacr0 = SACR0;
@@ -275,7 +275,7 @@ static int pxa2xx_i2s_suspend(struct snd_soc_dai *dai)
 	return 0;
 }
 
-static int pxa2xx_i2s_resume(struct snd_soc_dai *dai)
+static int pxa2xx_soc_pcm_resume(struct snd_soc_component *component)
 {
 	pxa_i2s_wait();
 
@@ -290,8 +290,8 @@ static int pxa2xx_i2s_resume(struct snd_soc_dai *dai)
 }
 
 #else
-#define pxa2xx_i2s_suspend	NULL
-#define pxa2xx_i2s_resume	NULL
+#define pxa2xx_soc_pcm_suspend	NULL
+#define pxa2xx_soc_pcm_resume	NULL
 #endif
 
 static int pxa2xx_i2s_probe(struct snd_soc_dai *dai)
@@ -342,8 +342,6 @@ static const struct snd_soc_dai_ops pxa_i2s_dai_ops = {
 static struct snd_soc_dai_driver pxa_i2s_dai = {
 	.probe = pxa2xx_i2s_probe,
 	.remove = pxa2xx_i2s_remove,
-	.suspend = pxa2xx_i2s_suspend,
-	.resume = pxa2xx_i2s_resume,
 	.playback = {
 		.channels_min = 2,
 		.channels_max = 2,
@@ -370,6 +368,8 @@ static const struct snd_soc_component_driver pxa_i2s_component = {
 	.trigger	= pxa2xx_soc_pcm_trigger,
 	.pointer	= pxa2xx_soc_pcm_pointer,
 	.mmap		= pxa2xx_soc_pcm_mmap,
+	.suspend	= pxa2xx_soc_pcm_suspend,
+	.resume		= pxa2xx_soc_pcm_resume,
 };
 
 static int pxa2xx_i2s_drv_probe(struct platform_device *pdev)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
