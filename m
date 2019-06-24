Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5372528CA
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2019 11:58:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AA241689;
	Tue, 25 Jun 2019 11:57:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AA241689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561456700;
	bh=8Lz3aTskMWrSGIkMBS9v28ndGkoabKaHfh1XrgUXu+M=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=dPO3bHzHRgOGdSQnzxBWR8MvdBiYhNiYr6GXXMoXsYV8FpIoT89ut5eKcH0TQYTZU
	 EbvOLaFdy8TUMUX1QATde3pXBpz1T9ilvzAldUNEFp6/sDIensfg6kWZwuJZgdVxWH
	 zPFDIfYtdLPpJ2pt77HoRTxvQVfy7oT4h5YE/vYA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2783F8973B;
	Tue, 25 Jun 2019 11:54:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5254AF89731; Tue, 25 Jun 2019 11:54:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=DATE_IN_PAST_12_24, DKIM_SIGNED,
 DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5782AF896F0
 for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2019 11:53:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5782AF896F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="tcvAv/vk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=kxTl1pP3xcj+yqYt8elDzE3IE1RGZJXE9aBhCXfwvVU=; b=tcvAv/vk2gFO
 H5129H1OuunLtq1x6UNjJ7nHD8nbuOBbpohtOBhzBSXq/XeERh6gKdewlS3dl9aIWgtcHbJ05UzWk
 9T8LrJ0tNHwdT2c+KxC/8zOK6t4Qs31MGjCKljFOsCTcMiy3jcy8BgMSBZnnADougk1fOs4ezWELL
 LyXRg=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hfi9G-0004mf-JZ; Tue, 25 Jun 2019 09:53:58 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id C727F44004A; Mon, 24 Jun 2019 17:32:13 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pnn9rsks.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190624163213.C727F44004A@finisterre.sirena.org.uk>
Date: Mon, 24 Jun 2019 17:32:13 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: soc_find_component() uses
	snd_soc_dai_link_component" to the asoc tree
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

   ASoC: soc-core: soc_find_component() uses snd_soc_dai_link_component

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From c1e230f0f7a3cc640317aa78389258a2fa54bcde Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 20 Jun 2019 09:49:27 +0900
Subject: [PATCH] ASoC: soc-core: soc_find_component() uses
 snd_soc_dai_link_component

soc_find_component() is using "of_node" and "name" to finding component,
but we should use snd_soc_dai_link_component now, because it is created
to such purpose.

This patch uses snd_soc_dai_link_component for soc_find_component().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 45 ++++++++++++++++++++------------------------
 1 file changed, 20 insertions(+), 25 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index e6b95b7e2737..1749f4af91b6 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -780,19 +780,15 @@ static int snd_soc_is_matching_component(
 }
 
 static struct snd_soc_component *soc_find_component(
-	struct device_node *of_node, const char *name)
+	const struct snd_soc_dai_link_component *dlc)
 {
 	struct snd_soc_component *component;
-	struct snd_soc_dai_link_component dlc;
 
 	lockdep_assert_held(&client_mutex);
 
-	for_each_component(component) {
-		dlc.name = name;
-		dlc.of_node = of_node;
-		if (snd_soc_is_matching_component(&dlc, component))
+	for_each_component(component)
+		if (snd_soc_is_matching_component(dlc, component))
 			return component;
-	}
 
 	return NULL;
 }
@@ -1106,8 +1102,7 @@ static int soc_init_dai_link(struct snd_soc_card *card,
 		 * added to component list.
 		 */
 		if ((link->platforms->of_node || link->platforms->name) &&
-		    !soc_find_component(link->platforms->of_node,
-					link->platforms->name))
+		    !soc_find_component(link->platforms))
 			return -EPROBE_DEFER;
 	}
 
@@ -1136,7 +1131,7 @@ static int soc_init_dai_link(struct snd_soc_card *card,
 	 * component list.
 	 */
 	if ((link->cpus->of_node || link->cpus->name) &&
-	    !soc_find_component(link->cpus->of_node, link->cpus->name))
+	    !soc_find_component(link->cpus))
 		return -EPROBE_DEFER;
 
 	/*
@@ -1580,23 +1575,23 @@ static int soc_bind_aux_dev(struct snd_soc_card *card, int num)
 {
 	struct snd_soc_aux_dev *aux_dev = &card->aux_dev[num];
 	struct snd_soc_component *component;
-	const char *name;
-	struct device_node *codec_of_node;
+	struct snd_soc_dai_link_component dlc;
 
 	if (aux_dev->codec_of_node || aux_dev->codec_name) {
 		/* codecs, usually analog devices */
-		name = aux_dev->codec_name;
-		codec_of_node = aux_dev->codec_of_node;
-		component = soc_find_component(codec_of_node, name);
+		dlc.name = aux_dev->codec_name;
+		dlc.of_node = aux_dev->codec_of_node;
+		component = soc_find_component(&dlc);
 		if (!component) {
-			if (codec_of_node)
-				name = of_node_full_name(codec_of_node);
+			if (dlc.of_node)
+				dlc.name = of_node_full_name(dlc.of_node);
 			goto err_defer;
 		}
 	} else if (aux_dev->name) {
 		/* generic components */
-		name = aux_dev->name;
-		component = soc_find_component(NULL, name);
+		dlc.name = aux_dev->name;
+		dlc.of_node = NULL;
+		component = soc_find_component(&dlc);
 		if (!component)
 			goto err_defer;
 	} else {
@@ -1610,7 +1605,7 @@ static int soc_bind_aux_dev(struct snd_soc_card *card, int num)
 	return 0;
 
 err_defer:
-	dev_err(card->dev, "ASoC: %s not registered\n", name);
+	dev_err(card->dev, "ASoC: %s not registered\n", dlc.name);
 	return -EPROBE_DEFER;
 }
 
@@ -3661,11 +3656,11 @@ EXPORT_SYMBOL_GPL(snd_soc_of_parse_daifmt);
 int snd_soc_get_dai_id(struct device_node *ep)
 {
 	struct snd_soc_component *component;
-	struct device_node *node;
+	struct snd_soc_dai_link_component dlc;
 	int ret;
 
-	node = of_graph_get_port_parent(ep);
-
+	dlc.of_node	= of_graph_get_port_parent(ep);
+	dlc.name	= NULL;
 	/*
 	 * For example HDMI case, HDMI has video/sound port,
 	 * but ALSA SoC needs sound port number only.
@@ -3674,13 +3669,13 @@ int snd_soc_get_dai_id(struct device_node *ep)
 	 */
 	ret = -ENOTSUPP;
 	mutex_lock(&client_mutex);
-	component = soc_find_component(node, NULL);
+	component = soc_find_component(&dlc);
 	if (component &&
 	    component->driver->of_xlate_dai_id)
 		ret = component->driver->of_xlate_dai_id(component, ep);
 	mutex_unlock(&client_mutex);
 
-	of_node_put(node);
+	of_node_put(dlc.of_node);
 
 	return ret;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
