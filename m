Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E9E18D9B0
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Mar 2020 21:49:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A55851657;
	Fri, 20 Mar 2020 21:48:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A55851657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584737360;
	bh=PQBW/rUV458o7sVtGhfMwuwB6ChSulvKaWw0JFWZPCY=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=gdB6o38QV5Jaj3tDOEjL0FjclNHE06/tei2erxMut+ThkLTR9Gg5mEl/n9otbnUWz
	 KvOJqtgYU2mNqqOf/AIa71jO4Embm5ScLPTcBVwmgJ2oXlkG3usjWXODhHO9090SvK
	 G+GIFjRFxYwrOaSlHtGjPLS9JpSCfTPMgnZsYioA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC6B5F802A2;
	Fri, 20 Mar 2020 21:46:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10769F8029B; Fri, 20 Mar 2020 21:46:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 2B6E5F8028F
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 21:46:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B6E5F8028F
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 605F37FA;
 Fri, 20 Mar 2020 13:45:57 -0700 (PDT)
Received: from localhost (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17F323F792;
 Fri, 20 Mar 2020 13:45:56 -0700 (PDT)
Date: Fri, 20 Mar 2020 20:45:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: soc-core: Merge for_each_rtd_cpu/codec_dais()" to the
 asoc tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: soc-core: Merge for_each_rtd_cpu/codec_dais()

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

From 3af6ff5035ad95ee02728aff271a9b543b912f15 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 16 Mar 2020 15:37:03 +0900
Subject: [PATCH] ASoC: soc-core: Merge for_each_rtd_cpu/codec_dais()

Now we can use for_each_rtd_dais().
Let's use it instead of for_each_rtd_cpu/codec_dais().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87v9n4olf4.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 25 +++++++------------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 0fd582c19c03..246d59966795 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1323,26 +1323,22 @@ static int soc_probe_dai(struct snd_soc_dai *dai, int order)
 static void soc_remove_link_dais(struct snd_soc_card *card)
 {
 	int i;
-	struct snd_soc_dai *codec_dai;
-	struct snd_soc_dai *cpu_dai;
+	struct snd_soc_dai *dai;
 	struct snd_soc_pcm_runtime *rtd;
 	int order;
 
 	for_each_comp_order(order) {
 		for_each_card_rtds(card, rtd) {
-			/* remove the CODEC DAI */
-			for_each_rtd_codec_dais(rtd, i, codec_dai)
-				soc_remove_dai(codec_dai, order);
-
-			for_each_rtd_cpu_dais(rtd, i, cpu_dai)
-				soc_remove_dai(cpu_dai, order);
+			/* remove DAIs */
+			for_each_rtd_dais(rtd, i, dai)
+				soc_remove_dai(dai, order);
 		}
 	}
 }
 
 static int soc_probe_link_dais(struct snd_soc_card *card)
 {
-	struct snd_soc_dai *codec_dai, *cpu_dai;
+	struct snd_soc_dai *dai;
 	struct snd_soc_pcm_runtime *rtd;
 	int i, order, ret;
 
@@ -1354,15 +1350,8 @@ static int soc_probe_link_dais(struct snd_soc_card *card)
 				card->name, rtd->num, order);
 
 			/* probe the CPU DAI */
-			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-				ret = soc_probe_dai(cpu_dai, order);
-				if (ret)
-					return ret;
-			}
-
-			/* probe the CODEC DAI */
-			for_each_rtd_codec_dais(rtd, i, codec_dai) {
-				ret = soc_probe_dai(codec_dai, order);
+			for_each_rtd_dais(rtd, i, dai) {
+				ret = soc_probe_dai(dai, order);
 				if (ret)
 					return ret;
 			}
-- 
2.20.1

