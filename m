Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D561189CA
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 14:29:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35D821662;
	Tue, 10 Dec 2019 14:28:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35D821662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575984541;
	bh=QTVsZyI0u4evGl9+1UFd9N+lO/gK6PYjEtEnbtfwdrs=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=EpkqxIDGGYtCXnK7WdenHklBI1k273n2DPG1aX/XLOjD0Jdg5YucdgzQuHTgvP7lB
	 DQ7d1wkH9qaAwmaUmH5vfFgjMNjg7JYLCy+TFJoBc5Q5GNtVWo5SToqQkvwWLUOeG1
	 wOKjosxM8WPResTXulHswqysSp/oUfZ+zpp23Qj4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9184F80290;
	Tue, 10 Dec 2019 14:22:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEE4FF80279; Tue, 10 Dec 2019 14:22:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 79604F80277
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 14:22:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79604F80277
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 899DC11B3;
 Tue, 10 Dec 2019 05:22:49 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0988E3F52E;
 Tue, 10 Dec 2019 05:22:48 -0800 (PST)
Date: Tue, 10 Dec 2019 13:22:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <874ky9yq5o.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-874ky9yq5o.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: soc-core: move soc_link_dai_pcm_new()"
	to the asoc tree
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

   ASoC: soc-core: move soc_link_dai_pcm_new()

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

From 9e9c70a5dd0194f6a30a04d96dd8c1f6ff44f6c4 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 10 Dec 2019 09:34:27 +0900
Subject: [PATCH] ASoC: soc-core: move soc_link_dai_pcm_new()

This patch moves soc_link_dai_pcm_new() to upper side.
This is prepare for its cleanup.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/874ky9yq5o.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f82d521306b7..8ace5f5b251c 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1102,6 +1102,27 @@ int snd_soc_add_pcm_runtime(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(snd_soc_add_pcm_runtime);
 
+static int soc_link_dai_pcm_new(struct snd_soc_dai **dais, int num_dais,
+				struct snd_soc_pcm_runtime *rtd)
+{
+	int i, ret = 0;
+
+	for (i = 0; i < num_dais; ++i) {
+		struct snd_soc_dai_driver *drv = dais[i]->driver;
+
+		if (drv->pcm_new)
+			ret = drv->pcm_new(rtd, dais[i]);
+		if (ret < 0) {
+			dev_err(dais[i]->dev,
+				"ASoC: Failed to bind %s with pcm device\n",
+				dais[i]->name);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static void soc_set_of_name_prefix(struct snd_soc_component *component)
 {
 	struct device_node *of_node = soc_component_to_node(component);
@@ -1379,27 +1400,6 @@ static int soc_probe_link_components(struct snd_soc_card *card)
 	return 0;
 }
 
-static int soc_link_dai_pcm_new(struct snd_soc_dai **dais, int num_dais,
-				struct snd_soc_pcm_runtime *rtd)
-{
-	int i, ret = 0;
-
-	for (i = 0; i < num_dais; ++i) {
-		struct snd_soc_dai_driver *drv = dais[i]->driver;
-
-		if (drv->pcm_new)
-			ret = drv->pcm_new(rtd, dais[i]);
-		if (ret < 0) {
-			dev_err(dais[i]->dev,
-				"ASoC: Failed to bind %s with pcm device\n",
-				dais[i]->name);
-			return ret;
-		}
-	}
-
-	return 0;
-}
-
 static int soc_link_init(struct snd_soc_card *card,
 			 struct snd_soc_pcm_runtime *rtd)
 {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
