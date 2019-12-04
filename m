Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBA6112E25
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Dec 2019 16:16:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3694B1673;
	Wed,  4 Dec 2019 16:15:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3694B1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575472607;
	bh=zZ6YRw5EwWbFWK6z5mipLUy1YF+s/XGKd52/jEPNWh8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OwBXHtofhpR8NXnlRlKcv216eTEZcDIPO8xaj2loL0URE3ih/J7U0sCKKOvD+qGwq
	 fJCWWPGWvOvxSIDHT4njohC1wreyLWWgYTY9fgp1/SVlcNzs+bKV1qrMGhJj8B1+E5
	 f4JRKjrD3OaGYDMaILN1Ma2PG/xD2/jLVGeqJaRk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26694F80245;
	Wed,  4 Dec 2019 16:15:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF0D0F80240; Wed,  4 Dec 2019 16:15:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D31CF800B4
 for <alsa-devel@alsa-project.org>; Wed,  4 Dec 2019 16:14:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D31CF800B4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 47836ACB8;
 Wed,  4 Dec 2019 15:14:57 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Wed,  4 Dec 2019 16:14:54 +0100
Message-Id: <20191204151454.21643-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH] ASoC: core: Fix access to uninitialized list
	heads
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

The error path of soc_new_pcm_runtime() invokes soc_free_pcm_runtime()
that may cause a few problems.  First off, it calls list_del() for
rtd->list that may not be initialized.  Similarly,
snd_soc_pcm_component_free() traverses over the component list that
may not be initialized, either.  Such access to the uninitialized list
head would lead to either a BUG_ON() or a memory corruption.

This patch fixes the access to uninitialized list heads by
initializing the list heads properly at the beginning before those
error paths.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/soc-core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 0e2e628302f1..726e5de850c4 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -478,6 +478,12 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 		goto free_rtd;
 
 	rtd->dev = dev;
+	INIT_LIST_HEAD(&rtd->list);
+	INIT_LIST_HEAD(&rtd->component_list);
+	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_PLAYBACK].be_clients);
+	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_CAPTURE].be_clients);
+	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_PLAYBACK].fe_clients);
+	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_CAPTURE].fe_clients);
 	dev_set_drvdata(dev, rtd);
 	INIT_DELAYED_WORK(&rtd->delayed_work, close_delayed_work);
 
@@ -493,12 +499,6 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	/*
 	 * rtd remaining settings
 	 */
-	INIT_LIST_HEAD(&rtd->component_list);
-	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_PLAYBACK].be_clients);
-	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_CAPTURE].be_clients);
-	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_PLAYBACK].fe_clients);
-	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_CAPTURE].fe_clients);
-
 	rtd->card = card;
 	rtd->dai_link = dai_link;
 	if (!rtd->dai_link->ops)
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
