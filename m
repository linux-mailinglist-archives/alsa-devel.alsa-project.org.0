Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F921B656
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2019 14:48:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AADC16E5;
	Mon, 13 May 2019 14:47:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AADC16E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557751681;
	bh=2Hxb2CFyiM9VIgNEUHj89cKaZFX2RN8us4x0pWPT0mE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=oCHERPXtup0/tzvfPDEfxuJai1aG+AYRN5vGe1v7oEkNylul+fyE7AgAH93uzRSTt
	 aggSzs7o278z0mdWxqBBcM/5ATpGWg9bRXEIX/59UbYON5fgY3AsoyjSOuJzss/TRd
	 /h7LFoMfbtC5h+uJv9occIwgpw16iYzk6A9BqXbw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 677FBF89735;
	Mon, 13 May 2019 14:44:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B480F89713; Mon, 13 May 2019 14:31:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3F6CF89720
 for <alsa-devel@alsa-project.org>; Mon, 13 May 2019 14:30:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3F6CF89720
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="nGtbAOuZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=q+Ea8wR4QxiEXyFanhJDPTyeEwfiWVkM3OFrcWLllQI=; b=nGtbAOuZ8j+8
 osetwvZnHTzf/uu5G4UQdWo1d43jYWwU7yJMjuA7dwS+jb/MRuvLr2jGl9lSJDfOjGr+7WGbiRVT6
 zOJJDlBRCHhwrb4jQ9N3HdgIbi9bykVdFnIivKoG8t+dtuRr6ln4A+lyrpE9iHij1Va5I+MovWOJH
 Bh4jQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hQA68-0006Wg-Nu; Mon, 13 May 2019 12:30:28 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 537341129238; Mon, 13 May 2019 13:30:27 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87sgtialsa.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190513123027.537341129238@debutante.sirena.org.uk>
Date: Mon, 13 May 2019 13:30:27 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: add soc_component_to_node()"
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

   ASoC: soc-core: add soc_component_to_node()

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

From c083444061ada428af71809cc12fd8f06dd2be19 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 13 May 2019 16:06:59 +0900
Subject: [PATCH] ASoC: soc-core: add soc_component_to_node()

Many function are getting device_node from component
with caring its parent component.
This patch adds new soc_component_to_node() and share
same code.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 39 ++++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index c80e7df3b20b..e55170ce6d3e 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -738,6 +738,18 @@ EXPORT_SYMBOL_GPL(snd_soc_resume);
 static const struct snd_soc_dai_ops null_dai_ops = {
 };
 
+static struct device_node
+*soc_component_to_node(struct snd_soc_component *component)
+{
+	struct device_node *of_node;
+
+	of_node = component->dev->of_node;
+	if (!of_node && component->dev->parent)
+		of_node = component->dev->parent->of_node;
+
+	return of_node;
+}
+
 static struct snd_soc_component *soc_find_component(
 	const struct device_node *of_node, const char *name)
 {
@@ -748,9 +760,7 @@ static struct snd_soc_component *soc_find_component(
 
 	for_each_component(component) {
 		if (of_node) {
-			component_of_node = component->dev->of_node;
-			if (!component_of_node && component->dev->parent)
-				component_of_node = component->dev->parent->of_node;
+			component_of_node = soc_component_to_node(component);
 
 			if (component_of_node == of_node)
 				return component;
@@ -768,9 +778,7 @@ static int snd_soc_is_matching_component(
 {
 	struct device_node *component_of_node;
 
-	component_of_node = component->dev->of_node;
-	if (!component_of_node && component->dev->parent)
-		component_of_node = component->dev->parent->of_node;
+	component_of_node = soc_component_to_node(component);
 
 	if (dlc->of_node && component_of_node != dlc->of_node)
 		return 0;
@@ -1317,13 +1325,10 @@ EXPORT_SYMBOL_GPL(snd_soc_remove_dai_link);
 
 static void soc_set_of_name_prefix(struct snd_soc_component *component)
 {
-	struct device_node *component_of_node = component->dev->of_node;
+	struct device_node *component_of_node = soc_component_to_node(component);
 	const char *str;
 	int ret;
 
-	if (!component_of_node && component->dev->parent)
-		component_of_node = component->dev->parent->of_node;
-
 	ret = of_property_read_string(component_of_node, "sound-name-prefix",
 				      &str);
 	if (!ret)
@@ -1337,10 +1342,7 @@ static void soc_set_name_prefix(struct snd_soc_card *card,
 
 	for (i = 0; i < card->num_configs && card->codec_conf; i++) {
 		struct snd_soc_codec_conf *map = &card->codec_conf[i];
-		struct device_node *component_of_node = component->dev->of_node;
-
-		if (!component_of_node && component->dev->parent)
-			component_of_node = component->dev->parent->of_node;
+		struct device_node *component_of_node = soc_component_to_node(component);
 
 		if (map->of_node && component_of_node != map->of_node)
 			continue;
@@ -3764,10 +3766,7 @@ int snd_soc_get_dai_id(struct device_node *ep)
 	ret = -ENOTSUPP;
 	mutex_lock(&client_mutex);
 	for_each_component(pos) {
-		struct device_node *component_of_node = pos->dev->of_node;
-
-		if (!component_of_node && pos->dev->parent)
-			component_of_node = pos->dev->parent->of_node;
+		struct device_node *component_of_node = soc_component_to_node(pos);
 
 		if (component_of_node != node)
 			continue;
@@ -3794,9 +3793,7 @@ int snd_soc_get_dai_name(struct of_phandle_args *args,
 
 	mutex_lock(&client_mutex);
 	for_each_component(pos) {
-		component_of_node = pos->dev->of_node;
-		if (!component_of_node && pos->dev->parent)
-			component_of_node = pos->dev->parent->of_node;
+		component_of_node = soc_component_to_node(pos);
 
 		if (component_of_node != args->np)
 			continue;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
