Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A370017FA53
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Mar 2020 14:05:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23274167E;
	Tue, 10 Mar 2020 14:04:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23274167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583845517;
	bh=gZBc5md7gAn0hr10HJwjptrShiBJCR/GHCN2j5Iu4xs=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=jJTwsCprbh8sYGCji13b7FmF9H/wGTZbpJNSKxl82JyJ7x3V5zc24pfzDCg81tXy4
	 2/O5NYPoA/ZJ7q3AcSB7mFv0ixtKL5JAK8g+8zD8KMUZ+HGFPWDi3NJDczpqNFwV3T
	 nYPW4g7bUstnfg1/A4Ymp7Z5iNgHc8P2hB5pxaeo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1746FF80247;
	Tue, 10 Mar 2020 14:02:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 814EFF80247; Tue, 10 Mar 2020 14:02:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id A499DF80217
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 14:02:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A499DF80217
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC21A7FA;
 Tue, 10 Mar 2020 06:02:48 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5EF8B3F6CF;
 Tue, 10 Mar 2020 06:02:48 -0700 (PDT)
Date: Tue, 10 Mar 2020 13:02:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Applied "ASoC: soc-core: disable route checks for legacy devices" to
 the asoc tree
In-Reply-To: <20200309192744.18380-2-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200309192744.18380-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

   ASoC: soc-core: disable route checks for legacy devices

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

From a22ae72b86a4f754e8d25fbf9ea5a8f77365e531 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Mon, 9 Mar 2020 14:27:43 -0500
Subject: [PATCH] ASoC: soc-core: disable route checks for legacy devices

v5.4 changes in soc-core tightened the checks on soc_dapm_add_routes,
which results in the ASoC card probe failing.

Introduce a flag to be set in machine drivers to prevent the probe
from stopping in case of incomplete topologies or missing routes. This
flag is for backwards compatibility only and shall not be used for
newer machine drivers.

Example with an HDaudio card with a bad topology:

[ 236.177898] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to
add route iDisp1_out -> direct -> iDisp1 Tx

[ 236.177902] skl_hda_dsp_generic skl_hda_dsp_generic:
snd_soc_bind_card: snd_soc_dapm_add_routes failed: -19

with the disable_route_checks set:

[ 64.031657] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to
add route iDisp1_out -> direct -> iDisp1 Tx

[ 64.031661] skl_hda_dsp_generic skl_hda_dsp_generic:
snd_soc_bind_card: disable_route_checks set, ignoring errors on
add_routes

Fixes: daa480bde6b3a9 ("ASoC: soc-core: tidyup for snd_soc_dapm_add_routes()")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/20200309192744.18380-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h  |  1 +
 sound/soc/soc-core.c | 28 ++++++++++++++++++++++++----
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 8a2266676b2d..efb8bad7b0fa 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1058,6 +1058,7 @@ struct snd_soc_card {
 	const struct snd_soc_dapm_route *of_dapm_routes;
 	int num_of_dapm_routes;
 	bool fully_routed;
+	bool disable_route_checks;
 
 	/* lists of probed devices belonging to this card */
 	struct list_head component_dev_list;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 068d809c349a..b17366bac846 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1256,8 +1256,18 @@ static int soc_probe_component(struct snd_soc_card *card,
 	ret = snd_soc_dapm_add_routes(dapm,
 				      component->driver->dapm_routes,
 				      component->driver->num_dapm_routes);
-	if (ret < 0)
-		goto err_probe;
+	if (ret < 0) {
+		if (card->disable_route_checks) {
+			dev_info(card->dev,
+				 "%s: disable_route_checks set, ignoring errors on add_routes\n",
+				 __func__);
+		} else {
+			dev_err(card->dev,
+				"%s: snd_soc_dapm_add_routes failed: %d\n",
+				__func__, ret);
+			goto err_probe;
+		}
+	}
 
 	/* see for_each_card_components */
 	list_add(&component->card_list, &card->component_dev_list);
@@ -1938,8 +1948,18 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 
 	ret = snd_soc_dapm_add_routes(&card->dapm, card->dapm_routes,
 				      card->num_dapm_routes);
-	if (ret < 0)
-		goto probe_end;
+	if (ret < 0) {
+		if (card->disable_route_checks) {
+			dev_info(card->dev,
+				 "%s: disable_route_checks set, ignoring errors on add_routes\n",
+				 __func__);
+		} else {
+			dev_err(card->dev,
+				 "%s: snd_soc_dapm_add_routes failed: %d\n",
+				 __func__, ret);
+			goto probe_end;
+		}
+	}
 
 	ret = snd_soc_dapm_add_routes(&card->dapm, card->of_dapm_routes,
 				      card->num_of_dapm_routes);
-- 
2.20.1

