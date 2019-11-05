Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E6FF0A7B
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 00:53:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 483F216E8;
	Wed,  6 Nov 2019 00:53:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 483F216E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572998038;
	bh=adfz8GsoAxArIAYbN8Y6plzBcOx8fxfY+GxZkpALPGg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=PlL7+A9FdXN8GHSZzGPa2bS+Bn56acUrx5L3Get/3MrNS2a0bAoLc19gK2Ab35Wq+
	 qCYEtpkpUWowG11RSUP9vT0+NVesxJCsrfBGishmx57PqG77TiMs4M2Xz7/LNL17NI
	 qaHp8US1/q6obKQyaPOQZBIMQbcJleEpewrKrzto=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F95FF8049B;
	Wed,  6 Nov 2019 00:51:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D40FF80535; Wed,  6 Nov 2019 00:51:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C62ADF80535
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 00:51:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C62ADF80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="J6GdDCXr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=MBjhhbwpwlryrgp3fDP80V1b0tDc5kmKeNa1W4Yk38U=; b=J6GdDCXr4rXg
 6F0a7Vec56fADEyQZaFg+CJSpQlYd+AgBDWaw74Et9ARac4F6+f6VCcEjR56Xc2GBsE1Q98bJ8FXe
 T7i5tYxT5HugC9K6LS+ljQ5mOioiWwYxnGIeJUEwq0ap53Qg+2VXCDTkHvIOKJv396rL6R+q4s0mS
 5uDCk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iS8bZ-000811-BL; Tue, 05 Nov 2019 23:51:21 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id C7D622743284; Tue,  5 Nov 2019 23:51:20 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87sgn2251p.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191105235120.C7D622743284@ypsilon.sirena.org.uk>
Date: Tue,  5 Nov 2019 23:51:20 +0000 (GMT)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: soc-core: don't call
	snd_soc_dapm_new_dai_widgets() at snd_soc_register_dai()" to
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

   ASoC: soc-core: don't call snd_soc_dapm_new_dai_widgets() at snd_soc_register_dai()

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

From e443c20593de9f8efd9b2935ed40eb0bbacce30b Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 5 Nov 2019 15:47:14 +0900
Subject: [PATCH] ASoC: soc-core: don't call snd_soc_dapm_new_dai_widgets() at
 snd_soc_register_dai()

ALSA SoC has 2 functions.
snd_soc_register_dai()  is used from topology
snd_soc_register_dais() is used from snd_soc_add_component()

In general, people think like _dai() is called from _dais()
with for loop. But in reality, these are very similar
but different implementation.
We shouldn't have duplicated and confusing implementation.

snd_soc_register_dai() is now used from topology.
But to reduce duplicated code, it should be used from _dais(), too.

Because of topology side specific reason,
it is calling snd_soc_dapm_new_dai_widgets(),
but it is not needed _dais() side.

This patch factorizes snd_soc_register_dai() to
topology / _dais() common part, and topology specific part.
And do topology specific part at soc-topology.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/87sgn2251p.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h      |  6 +++---
 sound/soc/soc-core.c     | 29 +++++------------------------
 sound/soc/soc-topology.c | 17 ++++++++++++++++-
 3 files changed, 24 insertions(+), 28 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 766fa81494c3..4e38ee656c4b 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1326,9 +1326,9 @@ struct snd_soc_dai_link *snd_soc_find_dai_link(struct snd_soc_card *card,
 					       int id, const char *name,
 					       const char *stream_name);
 
-int snd_soc_register_dai(struct snd_soc_component *component,
-			 struct snd_soc_dai_driver *dai_drv,
-			 bool legacy_dai_naming);
+struct snd_soc_dai *snd_soc_register_dai(struct snd_soc_component *component,
+					 struct snd_soc_dai_driver *dai_drv,
+					 bool legacy_dai_naming);
 void snd_soc_unregister_dai(struct snd_soc_dai *dai);
 
 struct snd_soc_dai *snd_soc_find_dai(
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 6f4933f13b08..55b13c0037d2 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2603,37 +2603,18 @@ EXPORT_SYMBOL_GPL(snd_soc_unregister_dai);
  * These DAIs's widgets will be freed in the card cleanup and the DAIs
  * will be freed in the component cleanup.
  */
-int snd_soc_register_dai(struct snd_soc_component *component,
-			 struct snd_soc_dai_driver *dai_drv,
-			 bool legacy_dai_naming)
+struct snd_soc_dai *snd_soc_register_dai(struct snd_soc_component *component,
+					 struct snd_soc_dai_driver *dai_drv,
+					 bool legacy_dai_naming)
 {
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
-	struct snd_soc_dai *dai;
-	int ret;
-
 	if (dai_drv->dobj.type != SND_SOC_DOBJ_PCM) {
 		dev_err(component->dev, "Invalid dai type %d\n",
 			dai_drv->dobj.type);
-		return -EINVAL;
+		return NULL;
 	}
 
 	lockdep_assert_held(&client_mutex);
-	dai = soc_add_dai(component, dai_drv, legacy_dai_naming);
-	if (!dai)
-		return -ENOMEM;
-
-	/*
-	 * Create the DAI widgets here. After adding DAIs, topology may
-	 * also add routes that need these widgets as source or sink.
-	 */
-	ret = snd_soc_dapm_new_dai_widgets(dapm, dai);
-	if (ret != 0) {
-		dev_err(component->dev,
-			"Failed to create DAI widgets %d\n", ret);
-	}
-
-	return ret;
+	return soc_add_dai(component, dai_drv, legacy_dai_naming);
 }
 EXPORT_SYMBOL_GPL(snd_soc_register_dai);
 
diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index b6e145627ab4..81d2af000a5c 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1800,6 +1800,9 @@ static int soc_tplg_dai_create(struct soc_tplg *tplg,
 	struct snd_soc_dai_driver *dai_drv;
 	struct snd_soc_pcm_stream *stream;
 	struct snd_soc_tplg_stream_caps *caps;
+	struct snd_soc_dai *dai;
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(tplg->comp);
 	int ret;
 
 	dai_drv = kzalloc(sizeof(struct snd_soc_dai_driver), GFP_KERNEL);
@@ -1842,7 +1845,19 @@ static int soc_tplg_dai_create(struct soc_tplg *tplg,
 	list_add(&dai_drv->dobj.list, &tplg->comp->dobj_list);
 
 	/* register the DAI to the component */
-	return snd_soc_register_dai(tplg->comp, dai_drv, false);
+	dai = snd_soc_register_dai(tplg->comp, dai_drv, false);
+	if (!dai)
+		return -ENOMEM;
+
+	/* Create the DAI widgets here */
+	ret = snd_soc_dapm_new_dai_widgets(dapm, dai);
+	if (ret != 0) {
+		dev_err(dai->dev, "Failed to create DAI widgets %d\n", ret);
+		snd_soc_unregister_dai(dai);
+		return ret;
+	}
+
+	return ret;
 }
 
 static void set_link_flags(struct snd_soc_dai_link *link,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
