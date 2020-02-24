Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 127A716B3DC
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Feb 2020 23:25:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B50ED1689;
	Mon, 24 Feb 2020 23:25:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B50ED1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582583150;
	bh=i9ivECZw04GzvXSuNOUHdPplUq1Frtays82wjUo/WEg=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=mGWIZ6A0zVtnZqFPQgDa082CXJBFH9ClUMKXEH8e5Mx/65m50fiCwYDtU6NSLMYOU
	 sXm8sfxc13fTxd5+eJ5hlQjB2x13IzNE0f9X1XSaDNHYxfZqcCypsPzMNtxM+o7umJ
	 BXIuvcXncpAVqGQZdzgLMlKkEHEa+Yt/bDpcVixw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFC7CF802A2;
	Mon, 24 Feb 2020 23:21:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC8E0F802A1; Mon, 24 Feb 2020 23:21:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id EEB40F80292
 for <alsa-devel@alsa-project.org>; Mon, 24 Feb 2020 23:21:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEB40F80292
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B3D431B;
 Mon, 24 Feb 2020 14:21:51 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F1D43F534;
 Mon, 24 Feb 2020 14:21:50 -0800 (PST)
Date: Mon, 24 Feb 2020 22:21:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: soc-pcm: merge dpcm_run_new/old_update() into
 dpcm_fe_runtime_update()" to the asoc tree
In-Reply-To: <87blpvjc9v.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87blpvjc9v.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

   ASoC: soc-pcm: merge dpcm_run_new/old_update() into dpcm_fe_runtime_update()

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

From 580dff3636d08ed12cb5d5db2fd895cbeffd0fd5 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 19 Feb 2020 15:56:46 +0900
Subject: [PATCH] ASoC: soc-pcm: merge dpcm_run_new/old_update() into
 dpcm_fe_runtime_update()

soc-pcm has dpcm_run_new/old_update(), but these are used from
dpcm_fe_runtime_update() only, and are very verbose functions.
This patch disassembles these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87blpvjc9v.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 35 +++++++----------------------------
 1 file changed, 7 insertions(+), 28 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index e183fabc5b6f..1bf2db1732bf 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2536,37 +2536,12 @@ static int dpcm_run_update_startup(struct snd_soc_pcm_runtime *fe, int stream)
 	return ret;
 }
 
-static int dpcm_run_new_update(struct snd_soc_pcm_runtime *fe, int stream)
-{
-	int ret;
-
-	dpcm_set_fe_update_state(fe, stream, SND_SOC_DPCM_UPDATE_BE);
-	ret = dpcm_run_update_startup(fe, stream);
-	if (ret < 0)
-		dev_err(fe->dev, "ASoC: failed to startup some BEs\n");
-	dpcm_set_fe_update_state(fe, stream, SND_SOC_DPCM_UPDATE_NO);
-
-	return ret;
-}
-
-static int dpcm_run_old_update(struct snd_soc_pcm_runtime *fe, int stream)
-{
-	int ret;
-
-	dpcm_set_fe_update_state(fe, stream, SND_SOC_DPCM_UPDATE_BE);
-	ret = dpcm_run_update_shutdown(fe, stream);
-	if (ret < 0)
-		dev_err(fe->dev, "ASoC: failed to shutdown some BEs\n");
-	dpcm_set_fe_update_state(fe, stream, SND_SOC_DPCM_UPDATE_NO);
-
-	return ret;
-}
-
 static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
 {
 	struct snd_soc_dapm_widget_list *list;
 	int stream;
 	int count, paths;
+	int ret;
 
 	if (!fe->dai_link->dynamic)
 		return 0;
@@ -2603,10 +2578,14 @@ static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
 		/* update any playback/capture paths */
 		count = dpcm_process_paths(fe, stream, &list, new);
 		if (count) {
+			dpcm_set_fe_update_state(fe, stream, SND_SOC_DPCM_UPDATE_BE);
 			if (new)
-				dpcm_run_new_update(fe, stream);
+				ret = dpcm_run_update_startup(fe, stream);
 			else
-				dpcm_run_old_update(fe, stream);
+				ret = dpcm_run_update_shutdown(fe, stream);
+			if (ret < 0)
+				dev_err(fe->dev, "ASoC: failed to shutdown some BEs\n");
+			dpcm_set_fe_update_state(fe, stream, SND_SOC_DPCM_UPDATE_NO);
 
 			dpcm_clear_pending_state(fe, stream);
 			dpcm_be_disconnect(fe, stream);
-- 
2.20.1

