Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFFAF0ABD
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 00:58:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2338216F7;
	Wed,  6 Nov 2019 00:57:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2338216F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572998317;
	bh=pLAX5ZIQkZZNd1AEaExQt7SdM96ICwHftGKcmKmmpY4=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=FFtTIow3eii49qckJ9Ll1Y12FSldiB/I0qmgPWVccjSMEF+pbnb9j/X04Qbf61BnM
	 goe9q7GPVwIAaciNU/aC6mZaPrER2VqYzX9WKOUBWsc6LeFoJk7syGK24mJ0jAZw7h
	 W3WhCAu6J3T4bnmplA29b8fIGxa5abzLa5tbsIu8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24752F806E7;
	Wed,  6 Nov 2019 00:51:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8DAAF805E0; Wed,  6 Nov 2019 00:51:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AAF4F805FE
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 00:51:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AAF4F805FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="tOIY+i3J"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=LlxCsx6gV8NPnR0dxW0kPz253jbpvuCd0TTO5e8wPr8=; b=tOIY+i3Jpc0p
 DScxEGw0zS5SBXOHaChOWMItvahKH+Q5hGuexXESmT0VYdGimHDF54kAt2xZ1zFVayC6caYIOGa1K
 4h4UVPN1mpR6eRcGXPgrRCfvHSS3SLL1I1sLD/6gPDfI8muxcgLGJN8khoHX3XOibjXpeM9g3mw5h
 QSBeA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iS8ba-00081X-MK; Tue, 05 Nov 2019 23:51:22 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 329E5274301E; Tue,  5 Nov 2019 23:51:22 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <871rum3jmy.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191105235122.329E5274301E@ypsilon.sirena.org.uk>
Date: Tue,  5 Nov 2019 23:51:22 +0000 (GMT)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: soc-core: remove
	snd_soc_component_add/del()" to the asoc tree
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

   ASoC: soc-core: remove snd_soc_component_add/del()

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

From b18768f56162964f70bbb9119dba59a947d7d577 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 5 Nov 2019 15:46:45 +0900
Subject: [PATCH] ASoC: soc-core: remove snd_soc_component_add/del()

soc-core has
snd_soc_add_component(), snd_soc_component_add(),
snd_soc_del_component(), snd_soc_component_del().

These are very confusing naming.
snd_soc_component_xxx() are called from snd_soc_xxx_component(),
and these are very small.
Let's merge these into snd_soc_xxx_component(), and
remove snd_soc_component_xxx().

Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/871rum3jmy.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 58 +++++++++++++++++++-------------------------
 1 file changed, 25 insertions(+), 33 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index e91325b688f2..bb0592159414 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2746,34 +2746,6 @@ EXPORT_SYMBOL_GPL(snd_soc_component_exit_regmap);
 
 #endif
 
-static void snd_soc_component_add(struct snd_soc_component *component)
-{
-	mutex_lock(&client_mutex);
-
-	if (!component->driver->write && !component->driver->read) {
-		if (!component->regmap)
-			component->regmap = dev_get_regmap(component->dev,
-							   NULL);
-		if (component->regmap)
-			snd_soc_component_setup_regmap(component);
-	}
-
-	/* see for_each_component */
-	list_add(&component->list, &component_list);
-
-	mutex_unlock(&client_mutex);
-}
-
-static void snd_soc_component_del(struct snd_soc_component *component)
-{
-	struct snd_soc_card *card = component->card;
-
-	if (card)
-		snd_soc_unbind_card(card, false);
-
-	list_del(&component->list);
-}
-
 #define ENDIANNESS_MAP(name) \
 	(SNDRV_PCM_FMTBIT_##name##LE | SNDRV_PCM_FMTBIT_##name##BE)
 static u64 endianness_format_map[] = {
@@ -2820,8 +2792,14 @@ static void snd_soc_try_rebind_card(void)
 
 static void snd_soc_del_component_unlocked(struct snd_soc_component *component)
 {
+	struct snd_soc_card *card = component->card;
+
 	snd_soc_unregister_dais(component);
-	snd_soc_component_del(component);
+
+	if (card)
+		snd_soc_unbind_card(card, false);
+
+	list_del(&component->list);
 }
 
 int snd_soc_add_component(struct device *dev,
@@ -2833,6 +2811,8 @@ int snd_soc_add_component(struct device *dev,
 	int ret;
 	int i;
 
+	mutex_lock(&client_mutex);
+
 	ret = snd_soc_component_initialize(component, component_driver, dev);
 	if (ret)
 		goto err_free;
@@ -2850,14 +2830,26 @@ int snd_soc_add_component(struct device *dev,
 		goto err_cleanup;
 	}
 
-	snd_soc_component_add(component);
-	snd_soc_try_rebind_card();
+	if (!component->driver->write && !component->driver->read) {
+		if (!component->regmap)
+			component->regmap = dev_get_regmap(component->dev,
+							   NULL);
+		if (component->regmap)
+			snd_soc_component_setup_regmap(component);
+	}
 
-	return 0;
+	/* see for_each_component */
+	list_add(&component->list, &component_list);
 
 err_cleanup:
-	snd_soc_del_component_unlocked(component);
+	if (ret < 0)
+		snd_soc_del_component_unlocked(component);
 err_free:
+	mutex_unlock(&client_mutex);
+
+	if (ret == 0)
+		snd_soc_try_rebind_card();
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_soc_add_component);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
