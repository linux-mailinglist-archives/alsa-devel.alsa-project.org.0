Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D559EF1B1C
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 17:23:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17DDA16A9;
	Wed,  6 Nov 2019 17:22:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17DDA16A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573057418;
	bh=C/l464+TMJCARdhRy8jMBubROgFCrsWJHA2YT/OSy3E=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=BEp15MrDBpZopDseO1kAyhJgRWBfROE0oORH4fDh2UGzeh2wGJRO6My2p+j3HoCQF
	 e7RTHbjt5vT7wlfSxg3wjjVimcWOACs+tyW5MPdRrtYFt65KizeZz98eB/X/RpRTwP
	 8pq30Gt+VgpyypmcmBlCZSqWE5+u4ITMrvwu+fn0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70601F80291;
	Wed,  6 Nov 2019 17:21:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80999F800F3; Wed,  6 Nov 2019 17:21:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9814FF800F3
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 17:21:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9814FF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="tkUsQJq+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=oFfnufvYEeL+sh2QPsQTcp81ceAYVghU0fdMXySIJss=; b=tkUsQJq+JnNZ
 vwsE7ELoKMuh4fOLRi3pGV88wtN5rtmwgiQaBaNyY8o1PDZLMA4kyh80iDJ/KMSFMudHpNIUwEqPa
 sXpxCFSIMZAfpqaE4PE572rEIjvzlLOvKdZVnqGcRyXTQinTlytzgR/rZrZDeaucv4ea+eHKe/h0A
 RKiJY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iSO42-0001op-8N; Wed, 06 Nov 2019 16:21:46 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id AE9E52743035; Wed,  6 Nov 2019 16:21:45 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87bltph4da.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191106162145.AE9E52743035@ypsilon.sirena.org.uk>
Date: Wed,  6 Nov 2019 16:21:45 +0000 (GMT)
Cc: alsa-devel@alsa-project.org, "kernelci.org bot" <bot@kernelci.org>,
 guillaume.tucker@collabora.com, enric.balletbo@collabora.com, ",
 kernelci.org bot <bot@kernelci.org>, khilman@baylibre.com,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, matthew.hart@linaro.org, mgalka@collabora.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, tomeu.vizoso@collabora.com"@sirena.co.uk
Subject: [alsa-devel] Applied "ASoC: soc-core: fixup dead-lock at
	snd_soc_unregister_component()" to the asoc tree
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

   ASoC: soc-core: fixup dead-lock at snd_soc_unregister_component()

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

From 18dd66ea84464a4bc86089276d5f75cadeb94a09 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 6 Nov 2019 16:05:05 +0900
Subject: [PATCH] ASoC: soc-core: fixup dead-lock at
 snd_soc_unregister_component()

snd_soc_unregister_component() is calling snd_soc_lookup_component()
under mutex_lock(). But, snd_soc_lookup_component() itself is using
mutex_lock(), thus it will be dead-lock.
This patch adds _nolocked version of it, and avoid dead-lock issue.

Fixes: ac6a4dd3e9f0("ASoC: soc-core: use snd_soc_lookup_component() at snd_soc_unregister_component()")
Reported-by: "kernelci.org bot" <bot@kernelci.org>"
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87bltph4da.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index a7ad81ec59db..55014e7ae0d8 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -356,14 +356,13 @@ struct snd_soc_component *snd_soc_rtdcom_lookup(struct snd_soc_pcm_runtime *rtd,
 }
 EXPORT_SYMBOL_GPL(snd_soc_rtdcom_lookup);
 
-struct snd_soc_component *snd_soc_lookup_component(struct device *dev,
-						   const char *driver_name)
+static struct snd_soc_component
+*snd_soc_lookup_component_nolocked(struct device *dev, const char *driver_name)
 {
 	struct snd_soc_component *component;
 	struct snd_soc_component *found_component;
 
 	found_component = NULL;
-	mutex_lock(&client_mutex);
 	for_each_component(component) {
 		if ((dev == component->dev) &&
 		    (!driver_name ||
@@ -373,10 +372,21 @@ struct snd_soc_component *snd_soc_lookup_component(struct device *dev,
 			break;
 		}
 	}
-	mutex_unlock(&client_mutex);
 
 	return found_component;
 }
+
+struct snd_soc_component *snd_soc_lookup_component(struct device *dev,
+						   const char *driver_name)
+{
+	struct snd_soc_component *component;
+
+	mutex_lock(&client_mutex);
+	component = snd_soc_lookup_component_nolocked(dev, driver_name);
+	mutex_unlock(&client_mutex);
+
+	return component;
+}
 EXPORT_SYMBOL_GPL(snd_soc_lookup_component);
 
 struct snd_pcm_substream *snd_soc_get_dai_substream(struct snd_soc_card *card,
@@ -2855,7 +2865,7 @@ void snd_soc_unregister_component(struct device *dev)
 
 	mutex_lock(&client_mutex);
 	while (1) {
-		component = snd_soc_lookup_component(dev, NULL);
+		component = snd_soc_lookup_component_nolocked(dev, NULL);
 		if (!component)
 			break;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
