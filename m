Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FDF71D9C
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 19:24:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DDE118FC;
	Tue, 23 Jul 2019 19:24:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DDE118FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563902691;
	bh=vFcMZd5foUNNY3shd9iExAvRiForF+fSZnjFy6a3aXY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Uf1KKvKcyPfT7hoKct7ZEwfdnhnUYywyG9sKyjHZIBOJQucy7uWixO6czW1st4eyf
	 8A5gL7n6blriO+SX6t6QUts8BZUDbWlbHiCdXuhX8g8UKoZpIqOiRIBOH3kL5OLs9y
	 QlkJsiK56boCM5Kg944/WZbiLcB0xdBLnOI+pt6I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 201F1F8058C;
	Tue, 23 Jul 2019 19:19:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48174F804FD; Tue, 23 Jul 2019 19:19:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE9ACF8045F
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 19:18:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE9ACF8045F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="AsiaA/aU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=sjHgs8ccXsf/dePal57eBuTb1ZOBnOsmhvSmlBicDA0=; b=AsiaA/aUzpTB
 SSfYyNkNI+XKUNlpfen69MY5YnxtZ0LJ2ypMkMH8Zbl/0yq1AF79RCw66BsYA4KgSdaeSEsaSrS84
 fYfZPaBazOHBRshBJGHcnMOwzLaNyiOQCSmVG613zFW5tGzQVmu+CNhV6vZ5xHkJIAYfau3lPR1M9
 OVIWE=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpyRA-0004LQ-2q; Tue, 23 Jul 2019 17:18:52 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 5F8302742BAC; Tue, 23 Jul 2019 18:18:51 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87lfwqhn2j.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190723171851.5F8302742BAC@ypsilon.sirena.org.uk>
Date: Tue, 23 Jul 2019 18:18:51 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-dai: add snd_soc_dai_resume()" to
	the asoc tree
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

   ASoC: soc-dai: add snd_soc_dai_resume()

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

From 24b09d051164680f0a1d1910efe21ce36ad5c1ca Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 22 Jul 2019 10:34:43 +0900
Subject: [PATCH] ASoC: soc-dai: add snd_soc_dai_resume()

Current ALSA SoC is directly using dai->driver->xxx,
thus, it has deep nested bracket, and it makes code unreadable.
This patch adds new snd_soc_dai_resume() and use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87lfwqhn2j.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-dai.h | 1 +
 sound/soc/soc-core.c    | 8 ++++----
 sound/soc/soc-dai.c     | 6 ++++++
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 6c5604a7dbc2..ed78e34a814e 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -163,6 +163,7 @@ int snd_soc_dai_bespoke_trigger(struct snd_soc_dai *dai,
 snd_pcm_sframes_t snd_soc_dai_delay(struct snd_soc_dai *dai,
 				    struct snd_pcm_substream *substream);
 void snd_soc_dai_suspend(struct snd_soc_dai *dai);
+void snd_soc_dai_resume(struct snd_soc_dai *dai);
 
 struct snd_soc_dai_ops {
 	/*
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 7493afb2371c..5c02f90cea69 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -631,8 +631,8 @@ static void soc_resume_deferred(struct work_struct *work)
 		if (rtd->dai_link->ignore_suspend)
 			continue;
 
-		if (cpu_dai->driver->resume && cpu_dai->driver->bus_control)
-			cpu_dai->driver->resume(cpu_dai);
+		if (cpu_dai->driver->bus_control)
+			snd_soc_dai_resume(cpu_dai);
 	}
 
 	for_each_card_components(card, component) {
@@ -678,8 +678,8 @@ static void soc_resume_deferred(struct work_struct *work)
 		if (rtd->dai_link->ignore_suspend)
 			continue;
 
-		if (cpu_dai->driver->resume && !cpu_dai->driver->bus_control)
-			cpu_dai->driver->resume(cpu_dai);
+		if (!cpu_dai->driver->bus_control)
+			snd_soc_dai_resume(cpu_dai);
 	}
 
 	if (card->resume_post)
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 3373598e0682..ddb6f217c0ed 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -359,3 +359,9 @@ void snd_soc_dai_suspend(struct snd_soc_dai *dai)
 	if (dai->driver->suspend)
 		dai->driver->suspend(dai);
 }
+
+void snd_soc_dai_resume(struct snd_soc_dai *dai)
+{
+	if (dai->driver->resume)
+		dai->driver->resume(dai);
+}
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
