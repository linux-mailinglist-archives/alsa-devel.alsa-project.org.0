Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CD64B8EB
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 14:42:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 147B616B4;
	Wed, 19 Jun 2019 14:42:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 147B616B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560948176;
	bh=e6Wt74yzJDPnwCKLbfmAd3WG1FN1gmYzhWZtxo6wRfo=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ADyWsfihsQgFaG1EwGbIg+twBq73YkEUq/5Oo3FxouttZ5xHq4HpsJh9d1rzpReeJ
	 QlAWKOiySFuWBqYbprFDpgGp68UFQbymzRfklvaLaLCAKb9Q810cn2cIreuelfHdhv
	 mfeMPiIiQqoh4CATlsQxff/vCHZplY3L5WrcOzBM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FFA5F89824;
	Wed, 19 Jun 2019 14:13:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E36C1F8977D; Wed, 19 Jun 2019 14:12:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C620F80CC4
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 14:12:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C620F80CC4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ss+HRyP0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=lQCYkeeEr3vEier5sBb7KYBrSjVbCENP1DCiiz2r/LQ=; b=ss+HRyP0kZwW
 TloiWlKarz6EIowkFfeb0KvQvENzeI3jW+Sm2KoH24XG8zNGzjr9udj1fqCf+oSwtcH6C+t19ejQZ
 o2tWef0ZWJdkKCl5TGGZS3em6GJNswiTbQc5NFImuYD9cyIn19kMaikk6oohdZJzsmYY6F1Vgzq/l
 gMQ/o=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hdZRc-0007CH-OS; Wed, 19 Jun 2019 12:12:04 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 3636D44004C; Wed, 19 Jun 2019 13:12:04 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875zp2wf8h.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190619121204.3636D44004C@finisterre.sirena.org.uk>
Date: Wed, 19 Jun 2019 13:12:04 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: allow no Platform on
	dai_link" to the asoc tree
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

   ASoC: soc-core: allow no Platform on dai_link

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

From 1d76898928783d79bfd7c465e891b6cf957c839a Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 19 Jun 2019 10:14:07 +0900
Subject: [PATCH] ASoC: soc-core: allow no Platform on dai_link

dai_link is used to selecting Component (= CPU/Codec/Platform) and
DAI (= CPU/Codec). And selected CPU/Codec/Platform components are
*listed* on Card.

Many drivers don't need special Platform component, but was
mandatory at legacy style ALSA SoC.
Thus, there is this kind of settings on many drivers.

	dai_link->platform_of_node = dai_link->cpu_of_node;

In this case, soc_bind_dai_link() will pick-up "CPU component" as
"Platform component", and try to add it to snd_soc_pcm_runtime.
But it will be ignored, because it is already added when CPU bindings.

Historically, this kind of "CPU component" is used/selected as
"Platform" on many ALSA SoC drivers.
OTOH, Dummy Platform will be selected automatically by ALSA SoC if
driver doesn't have Platform settings.

These indicates that there are 2 type of Platforms exist at current
ALSA SoC if driver doesn't need special Platform.

	1) use Dummy Platform as Platform component
	2) use CPU component  as Platform component

ALSA SoC will call Dummy Platform callback function if it is using
Dummy Platform, but it is completely pointless. Because it is the
sound card which doesn't need special Platform.

Thus, the behavior we request to ALSA SoC is selecting 2) automatically
instead of 1) if sound card doesn't need special Platform.
And, 2) means "do nothing" as above explain.

These were needed at legacy style dai_link, but is no longer needed
at modern style dai_link anymore.

This patch allows "no Platform" settings on dai_link, and will do
nothing for it if there was no platform settings. This is same as 2).

By this patch, all drivers which is selecting "CPU component" as
"Platform" can remove such settings.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h  |  2 +-
 sound/soc/soc-core.c | 64 +++++++++++++++++++++++---------------------
 2 files changed, 34 insertions(+), 32 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 80c1ca3a62c7..64405cdab8bb 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -926,7 +926,7 @@ struct snd_soc_dai_link {
 	/*
 	 * You MAY specify the link's platform/PCM/DMA driver, either by
 	 * device name, or by DT/OF node, but not both. Some forms of link
-	 * do not need a platform.
+	 * do not need a platform. In such case, platforms are not mandatory.
 	 */
 	struct snd_soc_dai_link_component *platforms;
 	unsigned int num_platforms;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f0fa289c90d8..4cd77cd6c864 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -788,6 +788,9 @@ static int snd_soc_is_matching_component(
 {
 	struct device_node *component_of_node;
 
+	if (!dlc)
+		return 0;
+
 	component_of_node = soc_component_to_node(component);
 
 	if (dlc->of_node && component_of_node != dlc->of_node)
@@ -1053,20 +1056,12 @@ static void soc_remove_dai_links(struct snd_soc_card *card)
 	}
 }
 
-static struct snd_soc_dai_link_component dummy_link = COMP_DUMMY();
-
 static int soc_init_dai_link(struct snd_soc_card *card,
 			     struct snd_soc_dai_link *link)
 {
 	int i;
 	struct snd_soc_dai_link_component *codec;
 
-	/* default Platform */
-	if (!link->platforms || !link->num_platforms) {
-		link->platforms = &dummy_link;
-		link->num_platforms = 1;
-	}
-
 	for_each_link_codecs(link, i, codec) {
 		/*
 		 * Codec must be specified by 1 of name or OF node,
@@ -1086,32 +1081,39 @@ static int soc_init_dai_link(struct snd_soc_card *card,
 		}
 	}
 
-	/* FIXME */
-	if (link->num_platforms > 1) {
-		dev_err(card->dev,
-			"ASoC: multi platform is not yet supported %s\n",
-			link->name);
-		return -EINVAL;
-	}
-
 	/*
-	 * Platform may be specified by either name or OF node, but
-	 * can be left unspecified, and a dummy platform will be used.
+	 * Platform may be specified by either name or OF node,
+	 * or no Platform.
+	 *
+	 * FIXME
+	 *
+	 * We need multi-platform support
 	 */
-	if (link->platforms->name && link->platforms->of_node) {
-		dev_err(card->dev,
-			"ASoC: Both platform name/of_node are set for %s\n",
-			link->name);
-		return -EINVAL;
-	}
+	if (link->num_platforms > 0) {
 
-	/*
-	 * Defer card registartion if platform dai component is not added to
-	 * component list.
-	 */
-	if ((link->platforms->of_node || link->platforms->name) &&
-	    !soc_find_component(link->platforms->of_node, link->platforms->name))
-		return -EPROBE_DEFER;
+		if (link->num_platforms > 1) {
+			dev_err(card->dev,
+				"ASoC: multi platform is not yet supported %s\n",
+				link->name);
+			return -EINVAL;
+		}
+
+		if (link->platforms->name && link->platforms->of_node) {
+			dev_err(card->dev,
+				"ASoC: Both platform name/of_node are set for %s\n",
+				link->name);
+			return -EINVAL;
+		}
+
+		/*
+		 * Defer card registartion if platform dai component is not
+		 * added to component list.
+		 */
+		if ((link->platforms->of_node || link->platforms->name) &&
+		    !soc_find_component(link->platforms->of_node,
+					link->platforms->name))
+			return -EPROBE_DEFER;
+	}
 
 	/* FIXME */
 	if (link->num_cpus > 1) {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
