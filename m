Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D576F9922
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 19:53:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BEFF1612;
	Tue, 12 Nov 2019 19:52:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BEFF1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573584798;
	bh=ET9LM9mkILBboRIg33q19j/7TQP11JFicDGFKmmWw2M=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=o9Wu/9saHQ7tKdAGk958o5k7S5bmWAqzpnXBpjw2d5bBoCfBS6UAk3KJJabTeBJo6
	 13tigdmvc1xzs32aZnQt1IlWdDwgrm/BZaLxjqkqFn48Khmt7dbCAGX9bNta8HxKrG
	 2co7QUtTEKZBD5TGnAhbELmc3QUBFKupXJlcCEAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63807F80677;
	Tue, 12 Nov 2019 19:47:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 311E0F80639; Tue, 12 Nov 2019 19:47:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09DBBF805FC
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 19:47:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09DBBF805FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="bd8B9VgW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Jtz56LzS3FfkdZ7sfCuNLyMaWNl5M+TMB+6sWoqn+Nk=; b=bd8B9VgWOG3y
 NISXJGBn5b6s0fy8nb2OcAYYk7h6LSDNskGOqU9nC304NE0LcVpBq9Zn3m27+b7tekKRzbgms0T7S
 ft9UzF+EElAa6l3jFPmP+S5hAswcx7LWWvHcs5VKaM+jILu4alrmOUAcdYYvVw9barsffThIZqakn
 ab9Xw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iUbC5-000055-7X; Tue, 12 Nov 2019 18:47:13 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id B943527429D2; Tue, 12 Nov 2019 18:47:12 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tv7hhkxm.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191112184712.B943527429D2@ypsilon.sirena.org.uk>
Date: Tue, 12 Nov 2019 18:47:12 +0000 (GMT)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: merge snd_soc_register_dai()
	and soc_add_dai()" to the asoc tree
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

   ASoC: soc-core: merge snd_soc_register_dai() and soc_add_dai()

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

From 7ca24386a7c2fb3828303b7c694cb0b4af1eac5c Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 6 Nov 2019 10:07:17 +0900
Subject: [PATCH] ASoC: soc-core: merge snd_soc_register_dai() and
 soc_add_dai()

We don't need to separete snd_soc_register_dai() and
soc_add_dai() anymore. Let's merge these

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87tv7hhkxm.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 43 ++++++++++++++++---------------------------
 1 file changed, 16 insertions(+), 27 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index c6885adbdc8b..b2544c7ff0f4 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2517,16 +2517,27 @@ static void soc_del_dai(struct snd_soc_dai *dai)
 	list_del(&dai->list);
 }
 
-/* Create a DAI and add it to the component's DAI list */
-static struct snd_soc_dai *soc_add_dai(struct snd_soc_component *component,
-	struct snd_soc_dai_driver *dai_drv,
-	bool legacy_dai_naming)
+/**
+ * snd_soc_register_dai - Register a DAI dynamically & create its widgets
+ *
+ * @component: The component the DAIs are registered for
+ * @dai_drv: DAI driver to use for the DAI
+ *
+ * Topology can use this API to register DAIs when probing a component.
+ * These DAIs's widgets will be freed in the card cleanup and the DAIs
+ * will be freed in the component cleanup.
+ */
+struct snd_soc_dai *snd_soc_register_dai(struct snd_soc_component *component,
+					 struct snd_soc_dai_driver *dai_drv,
+					 bool legacy_dai_naming)
 {
 	struct device *dev = component->dev;
 	struct snd_soc_dai *dai;
 
 	dev_dbg(dev, "ASoC: dynamically register DAI %s\n", dev_name(dev));
 
+	lockdep_assert_held(&client_mutex);
+
 	dai = devm_kzalloc(dev, sizeof(*dai), GFP_KERNEL);
 	if (dai == NULL)
 		return NULL;
@@ -2565,6 +2576,7 @@ static struct snd_soc_dai *soc_add_dai(struct snd_soc_component *component,
 	dev_dbg(dev, "ASoC: Registered DAI '%s'\n", dai->name);
 	return dai;
 }
+EXPORT_SYMBOL_GPL(snd_soc_register_dai);
 
 void snd_soc_unregister_dai(struct snd_soc_dai *dai)
 {
@@ -2572,29 +2584,6 @@ void snd_soc_unregister_dai(struct snd_soc_dai *dai)
 }
 EXPORT_SYMBOL_GPL(snd_soc_unregister_dai);
 
-/**
- * snd_soc_register_dai - Register a DAI dynamically & create its widgets
- *
- * @component: The component the DAIs are registered for
- * @dai_drv: DAI driver to use for the DAI
- *
- * Topology can use this API to register DAIs when probing a component.
- * These DAIs's widgets will be freed in the card cleanup and the DAIs
- * will be freed in the component cleanup.
- */
-struct snd_soc_dai *snd_soc_register_dai(struct snd_soc_component *component,
-					 struct snd_soc_dai_driver *dai_drv,
-					 bool legacy_dai_naming)
-{
-	struct device *dev = component->dev;
-
-	dev_dbg(dev, "ASoC: dai register %s\n", dai_drv->name);
-
-	lockdep_assert_held(&client_mutex);
-	return soc_add_dai(component, dai_drv, legacy_dai_naming);
-}
-EXPORT_SYMBOL_GPL(snd_soc_register_dai);
-
 /**
  * snd_soc_unregister_dai - Unregister DAIs from the ASoC core
  *
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
