Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4187144353
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2020 18:34:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52A02166F;
	Tue, 21 Jan 2020 18:33:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52A02166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579628068;
	bh=LUIYlJdZsbrqYrc2i3BUlBMJGh6mK+m8MzmD4fdZiho=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=tolhpUs6EjOHud/SkvMo13lr7cdrSD7190wOey+i5cO/IqLkcvffaqeRfjiz5fbd2
	 P7JkvLSTgAmxMG36/eB+6Ok/uQD+u0ZRW6iqRaA7ZK8K8clbGxRS5Lnrv6TGSlzh3y
	 GMDDjCgWuXaAO4QlKw/JBcu7NNueXm6mft5yoRWM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A32D3F802E2;
	Tue, 21 Jan 2020 18:28:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1E8EF802C3; Tue, 21 Jan 2020 18:28:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 4E43DF802A0
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 18:28:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E43DF802A0
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F9C730E;
 Tue, 21 Jan 2020 09:28:24 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8300B3F6C4;
 Tue, 21 Jan 2020 09:28:23 -0800 (PST)
Date: Tue, 21 Jan 2020 17:28:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tv4rx7ij.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87tv4rx7ij.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: pxa: pxa-ssp: move .suspend/.resume to
	component" to the asoc tree
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

   ASoC: pxa: pxa-ssp: move .suspend/.resume to component

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

From 2c55f0be586a14a35f67baf76df4d5c7782ed36a Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 20 Jan 2020 10:04:52 +0900
Subject: [PATCH] ASoC: pxa: pxa-ssp: move .suspend/.resume to component

There is no big difference at implementation for .suspend/.resume
between DAI driver and Component driver.
But because some driver is using DAI version, thus ALSA SoC needs
to keep supporting it, hence, framework becoming verbose.
If we can swtcih all DAI driver .suspend/.resume to Component driver,
we can remove verbose code from ALSA SoC.

Driver is getting its private data via dai->dev.
But dai->dev and component->dev are same dev, thus, we can convert
these. For same reason, we can convert dai->active to
component->active if necessary.

This patch moves DAI driver .suspend/.resume to Component driver

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87tv4rx7ij.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/pxa/pxa-ssp.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/pxa/pxa-ssp.c b/sound/soc/pxa/pxa-ssp.c
index f37ea0fb4f3f..e615acaa0199 100644
--- a/sound/soc/pxa/pxa-ssp.c
+++ b/sound/soc/pxa/pxa-ssp.c
@@ -133,12 +133,12 @@ static void pxa_ssp_shutdown(struct snd_pcm_substream *substream,
 
 #ifdef CONFIG_PM
 
-static int pxa_ssp_suspend(struct snd_soc_dai *cpu_dai)
+static int pxa_ssp_suspend(struct snd_soc_component *component)
 {
-	struct ssp_priv *priv = snd_soc_dai_get_drvdata(cpu_dai);
+	struct ssp_priv *priv = snd_soc_component_get_drvdata(component);
 	struct ssp_device *ssp = priv->ssp;
 
-	if (!cpu_dai->active)
+	if (!component->active)
 		clk_prepare_enable(ssp->clk);
 
 	priv->cr0 = __raw_readl(ssp->mmio_base + SSCR0);
@@ -151,9 +151,9 @@ static int pxa_ssp_suspend(struct snd_soc_dai *cpu_dai)
 	return 0;
 }
 
-static int pxa_ssp_resume(struct snd_soc_dai *cpu_dai)
+static int pxa_ssp_resume(struct snd_soc_component *component)
 {
-	struct ssp_priv *priv = snd_soc_dai_get_drvdata(cpu_dai);
+	struct ssp_priv *priv = snd_soc_component_get_drvdata(component);
 	struct ssp_device *ssp = priv->ssp;
 	uint32_t sssr = SSSR_ROR | SSSR_TUR | SSSR_BCE;
 
@@ -165,7 +165,7 @@ static int pxa_ssp_resume(struct snd_soc_dai *cpu_dai)
 	__raw_writel(priv->to,  ssp->mmio_base + SSTO);
 	__raw_writel(priv->psp, ssp->mmio_base + SSPSP);
 
-	if (cpu_dai->active)
+	if (component->active)
 		pxa_ssp_enable(ssp);
 	else
 		clk_disable_unprepare(ssp->clk);
@@ -850,8 +850,6 @@ static const struct snd_soc_dai_ops pxa_ssp_dai_ops = {
 static struct snd_soc_dai_driver pxa_ssp_dai = {
 		.probe = pxa_ssp_probe,
 		.remove = pxa_ssp_remove,
-		.suspend = pxa_ssp_suspend,
-		.resume = pxa_ssp_resume,
 		.playback = {
 			.channels_min = 1,
 			.channels_max = 8,
@@ -879,6 +877,8 @@ static const struct snd_soc_component_driver pxa_ssp_component = {
 	.trigger	= pxa2xx_soc_pcm_trigger,
 	.pointer	= pxa2xx_soc_pcm_pointer,
 	.mmap		= pxa2xx_soc_pcm_mmap,
+	.suspend	= pxa_ssp_suspend,
+	.resume		= pxa_ssp_resume,
 };
 
 #ifdef CONFIG_OF
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
