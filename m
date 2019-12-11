Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1539211B9B2
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 18:10:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C166D1669;
	Wed, 11 Dec 2019 18:10:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C166D1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576084242;
	bh=d4zhvn1C0gt6Gk7myHP/GcaJSWt/6ZlyK1VZph62gGc=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=bxhHaDZTUVKL9jlBwXVhqDlAWMbRA5QpH1lvUP7iPiqFz0/uRCYDaigHRw7VCnS4n
	 OoE58NplOceHPSzBcc1E5l1vHkNSZFAIXAuts4u/1HWNyqoWAbZHUBZG0unLHBDcfs
	 kTHpB3QpCm4WEISTkoCn2i8J/ozU9QmcOjrHQ6rQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DE9AF80372;
	Wed, 11 Dec 2019 17:54:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E79CF8034D; Wed, 11 Dec 2019 17:54:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 12064F80347
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 17:54:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12064F80347
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33D6B30E;
 Wed, 11 Dec 2019 08:54:06 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A15623F52E;
 Wed, 11 Dec 2019 08:54:05 -0800 (PST)
Date: Wed, 11 Dec 2019 16:54:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87fthrbhzo.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87fthrbhzo.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: merge soc_set_name_prefix()
	and soc_set_of_name_prefix()" to the asoc tree
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

   ASoC: soc-core: merge soc_set_name_prefix() and soc_set_of_name_prefix()

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

From 29d9fc7acacbb985daa1b4c662c619dc959a11b0 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 11 Dec 2019 13:31:39 +0900
Subject: [PATCH] ASoC: soc-core: merge soc_set_name_prefix() and
 soc_set_of_name_prefix()

soc_set_name_prefix() is calling soc_set_of_name_prefix().
We don't need to separate these operation.
This patch merges these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87fthrbhzo.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 750469acd5b4..f8090bd2cf73 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1206,22 +1206,12 @@ static int soc_init_pcm_runtime(struct snd_soc_card *card,
 	return ret;
 }
 
-static void soc_set_of_name_prefix(struct snd_soc_component *component)
-{
-	struct device_node *of_node = soc_component_to_node(component);
-	const char *str;
-	int ret;
-
-	ret = of_property_read_string(of_node, "sound-name-prefix", &str);
-	if (!ret)
-		component->name_prefix = str;
-}
-
 static void soc_set_name_prefix(struct snd_soc_card *card,
 				struct snd_soc_component *component)
 {
 	struct device_node *of_node = soc_component_to_node(component);
-	int i;
+	const char *str;
+	int ret, i;
 
 	for (i = 0; i < card->num_configs; i++) {
 		struct snd_soc_codec_conf *map = &card->codec_conf[i];
@@ -1238,7 +1228,11 @@ static void soc_set_name_prefix(struct snd_soc_card *card,
 	 * If there is no configuration table or no match in the table,
 	 * check if a prefix is provided in the node
 	 */
-	soc_set_of_name_prefix(component);
+	ret = of_property_read_string(of_node, "sound-name-prefix", &str);
+	if (ret < 0)
+		return;
+
+	component->name_prefix = str;
 }
 
 static void soc_remove_component(struct snd_soc_component *component,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
