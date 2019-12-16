Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6563120533
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Dec 2019 13:16:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58FA7166F;
	Mon, 16 Dec 2019 13:15:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58FA7166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576498578;
	bh=+TCjfpsyz1VHD1+AD4hHCxQ3KDH7O3YOncoux7d00t8=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=cHUxRgxIJW46sDdwO1rlKCEyM3KdFRxPR7dn1o5ZXGtr2EANQ7jgd/wgl+8WaOIpt
	 gUD4h2ZeWjKSCFmhforYo17F/vyPVW81SLRTJBTQejnGyA58xFbJR2FvqNrvmQbE6W
	 4hD+zwwSUs7HeWBUrVRCAvpoepuEhjvuP6xl+lM0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6602F80335;
	Mon, 16 Dec 2019 13:05:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21768F802FB; Mon, 16 Dec 2019 13:05:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED, T_FILL_THIS_FORM_SHORT,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 44875F802DB
 for <alsa-devel@alsa-project.org>; Mon, 16 Dec 2019 13:05:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44875F802DB
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2689311B3;
 Mon, 16 Dec 2019 04:05:36 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BDED3F719;
 Mon, 16 Dec 2019 04:05:35 -0800 (PST)
Date: Mon, 16 Dec 2019 12:05:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87lfrh59kj.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87lfrh59kj.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: soc-core: support
	snd_soc_dai_link_component for codec_conf" to the asoc tree
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

   ASoC: soc-core: support snd_soc_dai_link_component for codec_conf

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

From c13493a2460b7ba8f6e75fe6e1a3b732cc294f8f Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 13 Dec 2019 09:54:36 +0900
Subject: [PATCH] ASoC: soc-core: support snd_soc_dai_link_component for
 codec_conf

To find codec_conf component, it is using dev_name, of_node.
But, we already has this kind of finding component method by
snd_soc_dai_link_component, and snd_soc_is_matching_component().
We shouldn't have duplicate implementation to do same things.
This patch adds snd_soc_dai_link_component support to find
codec_conf component.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87lfrh59kj.wl-kuninori.morimoto.gx@renesas.com
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h  |  3 +++
 sound/soc/soc-core.c | 18 +++++++++++-------
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 82e65235c60d..a94e5d2fc2b2 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -949,6 +949,7 @@ struct snd_soc_dai_link {
 #define COMP_CODEC(_name, _dai)		{ .name = _name, .dai_name = _dai, }
 #define COMP_PLATFORM(_name)		{ .name = _name }
 #define COMP_AUX(_name)			{ .name = _name }
+#define COMP_CODEC_CONF(_name)		{ .name = _name }
 #define COMP_DUMMY()			{ .name = "snd-soc-dummy", .dai_name = "snd-soc-dummy-dai", }
 
 extern struct snd_soc_dai_link_component null_dailink_component[0];
@@ -962,6 +963,8 @@ struct snd_soc_codec_conf {
 	const char *dev_name;
 	struct device_node *of_node;
 
+	struct snd_soc_dai_link_component dlc;
+
 	/*
 	 * optional map of kcontrol, widget and path name prefixes that are
 	 * associated per device
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index ee77db253bcc..411b83ba2fc0 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1185,12 +1185,16 @@ static void soc_set_name_prefix(struct snd_soc_card *card,
 	for (i = 0; i < card->num_configs; i++) {
 		struct snd_soc_codec_conf *map = &card->codec_conf[i];
 
-		if (map->of_node && of_node != map->of_node)
-			continue;
-		if (map->dev_name && strcmp(component->name, map->dev_name))
-			continue;
-		component->name_prefix = map->name_prefix;
-		return;
+		/* fixme */
+		if (map->dev_name)
+			map->dlc.name = map->dev_name;
+		if (map->of_node)
+			map->dlc.of_node = map->of_node;
+
+		if (snd_soc_is_matching_component(&map->dlc, component)) {
+			component->name_prefix = map->name_prefix;
+			return;
+		}
 	}
 
 	/*
@@ -2915,7 +2919,7 @@ void snd_soc_of_parse_node_prefix(struct device_node *np,
 		return;
 	}
 
-	codec_conf->of_node	= of_node;
+	codec_conf->dlc.of_node	= of_node;
 	codec_conf->name_prefix	= str;
 }
 EXPORT_SYMBOL_GPL(snd_soc_of_parse_node_prefix);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
