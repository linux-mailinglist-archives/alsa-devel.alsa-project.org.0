Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E00AB14437E
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2020 18:43:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75F28169F;
	Tue, 21 Jan 2020 18:42:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75F28169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579628581;
	bh=mzAmk/BS55qw8/ZGmQo7a8ubGRFHbWlLmvodUUNzgqY=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ab3LFRzq49xdPjRl+32iYAdK0o5tu9XfJDss4Xi2B/zuwu1tjATIqvPSgDBPDAM2t
	 6MMtpLiEOX6zCapf/ZiY+gCAk3DchLDzRgm6HLHyIpCUAsMAcrumwOnDgis9294hvY
	 HQEftwethwGiA1oNcXNkM2vKDLcJp9NL2NTozqs4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07F86F8036E;
	Tue, 21 Jan 2020 18:29:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9480CF80346; Tue, 21 Jan 2020 18:29:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 1BBB9F80334
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 18:28:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BBB9F80334
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57AE9328;
 Tue, 21 Jan 2020 09:28:56 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA4EB3F6C4;
 Tue, 21 Jan 2020 09:28:55 -0800 (PST)
Date: Tue, 21 Jan 2020 17:28:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87blqzym4w.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87blqzym4w.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: bcm: cygnus-ssp: move .suspend/.resume
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

   ASoC: bcm: cygnus-ssp: move .suspend/.resume to component

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

From 7307d33a280b300f69c00580be9fa210f8587039 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 20 Jan 2020 10:03:43 +0900
Subject: [PATCH] ASoC: bcm: cygnus-ssp: move .suspend/.resume to component

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

This patch moves DAI driver .suspend/.resume to Component driver

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87blqzym4w.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/bcm/cygnus-ssp.c | 39 ++++++++++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/sound/soc/bcm/cygnus-ssp.c b/sound/soc/bcm/cygnus-ssp.c
index 2f9357d7da96..257f5048061e 100644
--- a/sound/soc/bcm/cygnus-ssp.c
+++ b/sound/soc/bcm/cygnus-ssp.c
@@ -1052,10 +1052,13 @@ static int cygnus_set_dai_tdm_slot(struct snd_soc_dai *cpu_dai,
 }
 
 #ifdef CONFIG_PM_SLEEP
-static int cygnus_ssp_suspend(struct snd_soc_dai *cpu_dai)
+static int __cygnus_ssp_suspend(struct snd_soc_dai *cpu_dai)
 {
 	struct cygnus_aio_port *aio = cygnus_dai_get_portinfo(cpu_dai);
 
+	if (!cpu_dai->active)
+		return 0;
+
 	if (!aio->is_slave) {
 		u32 val;
 
@@ -1078,11 +1081,25 @@ static int cygnus_ssp_suspend(struct snd_soc_dai *cpu_dai)
 	return 0;
 }
 
-static int cygnus_ssp_resume(struct snd_soc_dai *cpu_dai)
+static int cygnus_ssp_suspend(struct snd_soc_component *component)
+{
+	struct snd_soc_dai *dai;
+	int ret = 0;
+
+	for_each_component_dais(component, dai)
+		ret |= __cygnus_ssp_suspend(dai);
+
+	return ret;
+}
+
+static int __cygnus_ssp_resume(struct snd_soc_dai *cpu_dai)
 {
 	struct cygnus_aio_port *aio = cygnus_dai_get_portinfo(cpu_dai);
 	int error;
 
+	if (!cpu_dai->active)
+		return 0;
+
 	if (!aio->is_slave) {
 		if (aio->clk_trace.cap_clk_en) {
 			error = clk_prepare_enable(aio->cygaud->
@@ -1109,6 +1126,18 @@ static int cygnus_ssp_resume(struct snd_soc_dai *cpu_dai)
 
 	return 0;
 }
+
+static int cygnus_ssp_resume(struct snd_soc_component *component)
+{
+	struct snd_soc_dai *dai;
+	int ret = 0;
+
+	for_each_component_dais(component, dai)
+		ret |= __cygnus_ssp_resume(dai);
+
+	return ret;
+}
+
 #else
 #define cygnus_ssp_suspend NULL
 #define cygnus_ssp_resume  NULL
@@ -1149,8 +1178,6 @@ static const struct snd_soc_dai_ops cygnus_spdif_dai_ops = {
 				SNDRV_PCM_FMTBIT_S32_LE, \
 	}, \
 	.ops = &cygnus_ssp_dai_ops, \
-	.suspend = cygnus_ssp_suspend, \
-	.resume = cygnus_ssp_resume, \
 }
 
 static const struct snd_soc_dai_driver cygnus_ssp_dai_info[] = {
@@ -1169,14 +1196,14 @@ static const struct snd_soc_dai_driver cygnus_spdif_dai_info = {
 			SNDRV_PCM_FMTBIT_S32_LE,
 	},
 	.ops = &cygnus_spdif_dai_ops,
-	.suspend = cygnus_ssp_suspend,
-	.resume = cygnus_ssp_resume,
 };
 
 static struct snd_soc_dai_driver cygnus_ssp_dai[CYGNUS_MAX_PORTS];
 
 static const struct snd_soc_component_driver cygnus_ssp_component = {
 	.name		= "cygnus-audio",
+	.suspend	= cygnus_ssp_suspend,
+	.resume		= cygnus_ssp_resume,
 };
 
 /*
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
