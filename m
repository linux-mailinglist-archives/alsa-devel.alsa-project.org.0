Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0E6F0AD8
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 01:03:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 017841713;
	Wed,  6 Nov 2019 01:03:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 017841713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572998636;
	bh=rTLmPMjdr24CXwnX4YIrqoA+6S9AYjGNOHdgCcYXvj0=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=OtF764yqfc5naDXge3CmDi7x0T/TUpHRVmiwcL2fg0uqQvgxdJxpj5C8ujX+w8DeC
	 EDLXmHakJkQBEuO8C+AyagPeL3T4TcqAYpgQ6LV8Uae0pEJkuLxXrpJSZwRagZ2lEn
	 6xCes78FW+p51w2Uy8cc8yUBwlCD5beGNN5JOP0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75747F80753;
	Wed,  6 Nov 2019 00:51:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0FDFF8065D; Wed,  6 Nov 2019 00:51:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAD95F80611
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 00:51:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAD95F80611
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="crHmDga8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=mCozGsvGzo2jyYpani+YzZtffjam8mVOINJzTV3SV68=; b=crHmDga85fs6
 wZI9g+OSmht5FDHiTbGpT7TZBOxZ1+S8YHYPSzD/Hu2w3ISLsS3I7s+9Ccxa3aO7QdDEsRgYwo/x+
 z89Bxn1fStL+A28DLo5yVxGGSh+PP/zvxWTKKHWI8+90FlCjqdjO06wr0iF3Iad2Lcm6Fz5iH9/3I
 K7WLg=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iS8bb-00081o-D2; Tue, 05 Nov 2019 23:51:23 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id DC16F274301E; Tue,  5 Nov 2019 23:51:22 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875zjy3jnd.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191105235122.DC16F274301E@ypsilon.sirena.org.uk>
Date: Tue,  5 Nov 2019 23:51:22 +0000 (GMT)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: soc-core: move
	snd_soc_lookup_component()" to the asoc tree
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

   ASoC: soc-core: move snd_soc_lookup_component()

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

From b8132657990b5a09ad8e1c9e2c8efc20b5f9372a Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 5 Nov 2019 15:46:30 +0900
Subject: [PATCH] ASoC: soc-core: move snd_soc_lookup_component()

This patch moves snd_soc_lookup_component() to upper side.
This is prepare for snd_soc_unregister_component()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/875zjy3jnd.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 52 ++++++++++++++++++++++----------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 1e8dd19cba24..b71bddb30db1 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -356,6 +356,32 @@ struct snd_soc_component *snd_soc_rtdcom_lookup(struct snd_soc_pcm_runtime *rtd,
 }
 EXPORT_SYMBOL_GPL(snd_soc_rtdcom_lookup);
 
+struct snd_soc_component *snd_soc_lookup_component(struct device *dev,
+						   const char *driver_name)
+{
+	struct snd_soc_component *component;
+	struct snd_soc_component *ret;
+
+	ret = NULL;
+	mutex_lock(&client_mutex);
+	for_each_component(component) {
+		if (dev != component->dev)
+			continue;
+
+		if (driver_name &&
+		    (driver_name != component->driver->name) &&
+		    (strcmp(component->driver->name, driver_name) != 0))
+			continue;
+
+		ret = component;
+		break;
+	}
+	mutex_unlock(&client_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_lookup_component);
+
 struct snd_pcm_substream *snd_soc_get_dai_substream(struct snd_soc_card *card,
 		const char *dai_link, int stream)
 {
@@ -2889,32 +2915,6 @@ void snd_soc_unregister_component(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(snd_soc_unregister_component);
 
-struct snd_soc_component *snd_soc_lookup_component(struct device *dev,
-						   const char *driver_name)
-{
-	struct snd_soc_component *component;
-	struct snd_soc_component *ret;
-
-	ret = NULL;
-	mutex_lock(&client_mutex);
-	for_each_component(component) {
-		if (dev != component->dev)
-			continue;
-
-		if (driver_name &&
-		    (driver_name != component->driver->name) &&
-		    (strcmp(component->driver->name, driver_name) != 0))
-			continue;
-
-		ret = component;
-		break;
-	}
-	mutex_unlock(&client_mutex);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(snd_soc_lookup_component);
-
 /* Retrieve a card's name from device tree */
 int snd_soc_of_parse_card_name(struct snd_soc_card *card,
 			       const char *propname)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
