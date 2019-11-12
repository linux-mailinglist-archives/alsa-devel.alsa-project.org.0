Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61916F9912
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 19:49:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF92D1671;
	Tue, 12 Nov 2019 19:48:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF92D1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573584571;
	bh=Snm2xYE/PY+UV0K/Omh67inFUpKUbAlmDssB7RwUWLY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=YZJsHNv2pVWjXDaDlRi6wyELvC3TApsTtm6GHl9OU38asgnPX1Y+ctOBD43rDAaOi
	 pX6l0daSIMR06SCaCo1I+ZeS/WoZKe7IjO2caYg/3hUzseIdFp4SuIN5zfHCq9570x
	 dPZWkXSpsC+q9pzBWLrJDBr8lgTZjZivQAGPTH7g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB325F80633;
	Tue, 12 Nov 2019 19:47:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E63C0F8044C; Tue, 12 Nov 2019 19:47:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A0BDF8044C
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 19:47:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A0BDF8044C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="T4rzfmov"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=4/YSdsMoi2NMF/GI53HPZNtRw0aR72hAUFnc4vIja4k=; b=T4rzfmov8O9t
 wC9P8dj3GY4TNy6KQQK4Jjz+UvmWGwPwnVePAFAVTpzNPIqFMmWfDkgV89uNpT/pg10snV18pAH2f
 OQgXWf0N39bW0b1dwl1JpL2QzuLbuYFPYxqxB+iQABOqWvUBf992me2snakOV9joEDWY1XmOndoO+
 VgULs=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iUbC2-0008WM-4n; Tue, 12 Nov 2019 18:47:10 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 97BF727429D2; Tue, 12 Nov 2019 18:47:09 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87mud9hkwj.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191112184709.97BF727429D2@ypsilon.sirena.org.uk>
Date: Tue, 12 Nov 2019 18:47:09 +0000 (GMT)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: merge snd_soc_bind_card() and
	snd_soc_instantiate_card()" to the asoc tree
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

   ASoC: soc-core: merge snd_soc_bind_card() and snd_soc_instantiate_card()

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

From ed90c013a773b5f9e06089d0eed6714761152d14 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 6 Nov 2019 10:07:56 +0900
Subject: [PATCH] ASoC: soc-core: merge snd_soc_bind_card() and
 snd_soc_instantiate_card()

having both soc_bind_card() and snd_soc_instantiate_card() is
very confusable. Let's merge these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87mud9hkwj.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 42 ++++++++++++++----------------------------
 1 file changed, 14 insertions(+), 28 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 11cbd7915154..f3d33a908fbc 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1974,7 +1974,7 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card)
 		card->remove(card);
 }
 
-static int snd_soc_instantiate_card(struct snd_soc_card *card)
+static int snd_soc_bind_card(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd;
 	struct snd_soc_dai_link *dai_link;
@@ -2106,6 +2106,19 @@ static int snd_soc_instantiate_card(struct snd_soc_card *card)
 	dapm_mark_endpoints_dirty(card);
 	snd_soc_dapm_sync(&card->dapm);
 
+	/* deactivate pins to sleep state */
+	for_each_card_rtds(card, rtd) {
+		struct snd_soc_dai *dai;
+
+		for_each_rtd_codec_dai(rtd, i, dai) {
+			if (!dai->active)
+				pinctrl_pm_select_sleep_state(dai->dev);
+		}
+
+		if (!rtd->cpu_dai->active)
+			pinctrl_pm_select_sleep_state(rtd->cpu_dai->dev);
+	}
+
 probe_end:
 	if (ret < 0)
 		soc_cleanup_card_resources(card);
@@ -2338,33 +2351,6 @@ int snd_soc_add_dai_controls(struct snd_soc_dai *dai,
 }
 EXPORT_SYMBOL_GPL(snd_soc_add_dai_controls);
 
-static int snd_soc_bind_card(struct snd_soc_card *card)
-{
-	struct snd_soc_pcm_runtime *rtd;
-	int ret;
-
-	ret = snd_soc_instantiate_card(card);
-	if (ret != 0)
-		return ret;
-
-	/* deactivate pins to sleep state */
-	for_each_card_rtds(card, rtd) {
-		struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-		struct snd_soc_dai *codec_dai;
-		int j;
-
-		for_each_rtd_codec_dai(rtd, j, codec_dai) {
-			if (!codec_dai->active)
-				pinctrl_pm_select_sleep_state(codec_dai->dev);
-		}
-
-		if (!cpu_dai->active)
-			pinctrl_pm_select_sleep_state(cpu_dai->dev);
-	}
-
-	return ret;
-}
-
 /**
  * snd_soc_register_card - Register a card with the ASoC core
  *
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
