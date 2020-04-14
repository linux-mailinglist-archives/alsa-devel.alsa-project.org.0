Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FE41A8151
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 17:07:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B70E41702;
	Tue, 14 Apr 2020 17:07:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B70E41702
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586876873;
	bh=ldEEL4cIepMUOxNBtqmrBP7HCQyLCKajKpKDVOEqdyk=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=UobAzxx6ldJYDuMzQDkhRKZbM46HCcCNPLBhu3JwyGeK+Y3AOlt2cdugNsE5J9UYP
	 LSD9QItJdOwyfNADXfr/0uB6h+MyvSoEr7sxOltY8U7P+ESKXrfxeYIRcLX6MjAGxd
	 E/y1hfq/yiKdJ6C778I+GhJHUo0D6jYvgQdSAkeU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45AFDF803F5;
	Tue, 14 Apr 2020 16:49:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F29CEF803DF; Tue, 14 Apr 2020 16:48:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC576F803DF
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 16:48:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC576F803DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FTatq+8/"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B047C2076D;
 Tue, 14 Apr 2020 14:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586875734;
 bh=ldEEL4cIepMUOxNBtqmrBP7HCQyLCKajKpKDVOEqdyk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=FTatq+8/TzyshmqpGd3OzEgfzJrTDl76HyxcHvWIa9fIRJOeUqGAqaafLvKlTqDOq
 Hzvr7DIrVOmWVvISK08xL+zc/yByd5CNckgMbbFkQ/Zj/ykY5jF6zyfnjq17kL2rrQ
 kFfzbrJdzvhmtxvpXQo0a1jx+M+Y+PYqwsIX0uxQ=
Date: Tue, 14 Apr 2020 15:48:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Applied "ASoC: soc-core: Add dynamic debug logs in
 soc_dai_link_sanity_check()" to the asoc tree
In-Reply-To: <20200409184416.15591-5-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200409184416.15591-5-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 tiwai@suse.de, Daniel Baluta <daniel.baluta@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: soc-core: Add dynamic debug logs in soc_dai_link_sanity_check()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From b2acc24c805a42b6ebfe8b8ae09dbf9c994c5604 Mon Sep 17 00:00:00 2001
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Date: Thu, 9 Apr 2020 13:44:16 -0500
Subject: [PATCH] ASoC: soc-core: Add dynamic debug logs in
 soc_dai_link_sanity_check()

When a platform device is created successfully but the machine driver
probe fails due to errors with missing components during the card bind
stage, no error is propagated or logged. To help flag such problems,
add a dynamic debug log.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Link: https://lore.kernel.org/r/20200409184416.15591-5-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 843b8b1c89d4..8b2f6dd2fc8e 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -865,8 +865,12 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
 		 * Defer card registration if codec component is not added to
 		 * component list.
 		 */
-		if (!soc_find_component(codec))
+		if (!soc_find_component(codec)) {
+			dev_dbg(card->dev,
+				"ASoC: codec component %s not found for link %s\n",
+				codec->name, link->name);
 			return -EPROBE_DEFER;
+		}
 	}
 
 	for_each_link_platforms(link, i, platform) {
@@ -886,8 +890,12 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
 		 * Defer card registration if platform component is not added to
 		 * component list.
 		 */
-		if (!soc_find_component(platform))
+		if (!soc_find_component(platform)) {
+			dev_dbg(card->dev,
+				"ASoC: platform component %s not found for link %s\n",
+				platform->name, link->name);
 			return -EPROBE_DEFER;
+		}
 	}
 
 	for_each_link_cpus(link, i, cpu) {
@@ -908,8 +916,12 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
 		 * component list.
 		 */
 		if ((cpu->of_node || cpu->name) &&
-		    !soc_find_component(cpu))
+		    !soc_find_component(cpu)) {
+			dev_dbg(card->dev,
+				"ASoC: cpu component %s not found for link %s\n",
+				cpu->name, link->name);
 			return -EPROBE_DEFER;
+		}
 
 		/*
 		 * At least one of CPU DAI name or CPU device name/node must be
-- 
2.20.1

