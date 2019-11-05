Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CAFF0AD9
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 01:04:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69C1416F0;
	Wed,  6 Nov 2019 01:03:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69C1416F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572998672;
	bh=cyqJkX2/YyfihGW9DSRHvqH1efp0eUsA0zjCwXKNPyU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ggw2B+ceVxc+gRMv4SrK2VGLmuyNwkHi1QlTMwCt6jW1d61aI0AmfqFJnXvw54hut
	 wf7tiQgIX8Aihk08fIGt0qXoM1p4WPCvqNWlH5zp0gAllYHNstYqGTy3rBFuQNqzFV
	 I/Hj+Ovs8b4tjKKUgp30gXmamPSJw4dAd2Man3Eg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AA16F8075B;
	Wed,  6 Nov 2019 00:51:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E83FF8065D; Wed,  6 Nov 2019 00:51:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE538F8060F
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 00:51:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE538F8060F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="auPlZS6W"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=IoF91+lJneZcYIWyptC9BVq9yyhvO05kVQE+xEgAJAs=; b=auPlZS6WMrXT
 FMmIeM+22aIz0ezlQy1ROS8QO/45OFMhI+8olma3jD9Qg9wXlB/OasLwR0EWGrghyj5Yx8fhKIkr1
 pV7wYXw9czmZQApm9yE0AtwLLh8bcpCILbOKXEBWB2B3s5ixGR/CwhDsURqs8tr69h3YJcCkvVGSN
 H0FUw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iS8bc-00082M-GJ; Tue, 05 Nov 2019 23:51:24 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id ED50B2741915; Tue,  5 Nov 2019 23:51:23 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87d0e63joh.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191105235123.ED50B2741915@ypsilon.sirena.org.uk>
Date: Tue,  5 Nov 2019 23:51:23 +0000 (GMT)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: soc-core: tidyup soc_init_dai_link()"
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

   ASoC: soc-core: tidyup soc_init_dai_link()

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

From bfce78a559655c5c4512a898a7e5d3a796fbb473 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 5 Nov 2019 15:45:50 +0900
Subject: [PATCH] ASoC: soc-core: tidyup soc_init_dai_link()

soc_init_dai_link() is needed to be called before soc_bind_dai_link().

	int snd_soc_instantiate_card()
	{
		for_each_card_prelinks(...) {
(1)			ret = soc_init_dai_link(...);
			...
		}
		...
		for_each_card_prelinks(...) {
(2)			ret = soc_bind_dai_link(...);
			...
		}
		...
		for_each_card_links(...) {
			...
(A)			ret = soc_init_dai_link(...);
			...
(B)			ret = soc_bind_dai_link(...);
		}
		...

(1) is for (2), and (A) is for (B)
(1) and (2) are for card prelink   dai_link.
(A) and (B) are for topology added dai_link.

soc_init_dai_link() is sanity check for dai_link, not initializing today.
Therefore, it is confusable naming. We can rename it as sanity_check.

And this check is for soc_bind_dai_link().
It can be more simple code if we can call it from soc_bind_dai_link().

This patch renames it to soc_dai_link_sanity_check(), and
call it from soc_bind_dai_link().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/87d0e63joh.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index a141828f8638..827625bd35cd 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -941,8 +941,8 @@ static bool soc_is_dai_link_bound(struct snd_soc_card *card,
 	return false;
 }
 
-static int soc_init_dai_link(struct snd_soc_card *card,
-			     struct snd_soc_dai_link *link)
+static int soc_dai_link_sanity_check(struct snd_soc_card *card,
+				     struct snd_soc_dai_link *link)
 {
 	int i;
 	struct snd_soc_dai_link_component *codec, *platform;
@@ -1043,7 +1043,7 @@ static int soc_bind_dai_link(struct snd_soc_card *card,
 	struct snd_soc_pcm_runtime *rtd;
 	struct snd_soc_dai_link_component *codec, *platform;
 	struct snd_soc_component *component;
-	int i;
+	int i, ret;
 
 	if (dai_link->ignore)
 		return 0;
@@ -1056,6 +1056,10 @@ static int soc_bind_dai_link(struct snd_soc_card *card,
 		return 0;
 	}
 
+	ret = soc_dai_link_sanity_check(card, dai_link);
+	if (ret < 0)
+		return ret;
+
 	rtd = soc_new_pcm_runtime(card, dai_link);
 	if (!rtd)
 		return -ENOMEM;
@@ -1985,15 +1989,6 @@ static int snd_soc_instantiate_card(struct snd_soc_card *card)
 	int ret, i;
 
 	mutex_lock(&client_mutex);
-	for_each_card_prelinks(card, i, dai_link) {
-		ret = soc_init_dai_link(card, dai_link);
-		if (ret) {
-			dev_err(card->dev, "ASoC: failed to init link %s: %d\n",
-				dai_link->name, ret);
-			mutex_unlock(&client_mutex);
-			return ret;
-		}
-	}
 	mutex_lock_nested(&card->mutex, SND_SOC_CARD_CLASS_INIT);
 
 	snd_soc_dapm_init(&card->dapm, card, NULL);
@@ -2073,9 +2068,6 @@ static int snd_soc_instantiate_card(struct snd_soc_card *card)
 		if (soc_is_dai_link_bound(card, dai_link))
 			continue;
 
-		ret = soc_init_dai_link(card, dai_link);
-		if (ret)
-			goto probe_end;
 		ret = soc_bind_dai_link(card, dai_link);
 		if (ret)
 			goto probe_end;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
