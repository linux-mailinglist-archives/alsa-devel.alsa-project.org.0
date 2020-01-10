Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F942136E5E
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jan 2020 14:42:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89EE01730;
	Fri, 10 Jan 2020 14:42:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89EE01730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578663773;
	bh=fbsU3TYiTH0ty8lXHovR6hRoe5o8r8oM51TbDSfr4TY=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=FOmCLblmOuAgGybWRXiwZB1nZXM5ZOIicf5ugxV3kE+hs963dhNG9Dqp06jl7eJKa
	 EmSkDS0LYHzfNQMdWfb+3n+tbPNdL34ny9Rm/UQTjikkwkT6sYXEjCGwR/7BHQpWTN
	 TPrg7cCDb2gqHyJcL7oU9GKxIuzbhDefovVQAtXc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D0A0F802A0;
	Fri, 10 Jan 2020 14:38:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9C3FF8028A; Fri, 10 Jan 2020 14:37:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id EF4CFF8011C
 for <alsa-devel@alsa-project.org>; Fri, 10 Jan 2020 14:37:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF4CFF8011C
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE8D41FB;
 Fri, 10 Jan 2020 05:37:51 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 484A53F534;
 Fri, 10 Jan 2020 05:37:51 -0800 (PST)
Date: Fri, 10 Jan 2020 13:37:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877e20t4vh.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-877e20t4vh.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: care .ignore_suspend for
	Component suspend" to the asoc tree
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

   ASoC: soc-core: care .ignore_suspend for Component suspend

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

From 1272063a7ee4e60ace4cf7cae621fb6f8cafaaba Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 10 Jan 2020 11:36:02 +0900
Subject: [PATCH] ASoC: soc-core: care .ignore_suspend for Component suspend

Card dai_link has .ignore_suspend, and ALSA SoC cares it when suspend.
For example, like this

	for_each_card_rtds(card, rtd) {
		if (rtd->dai_link->ignore_suspend)
			continue;
		...
	}

But in snd_soc_suspend(), it doesn't care about
it when suspending Component. This patch cares it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/877e20t4vh.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 9a6d905cda43..8a1b4ffa6ca6 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -562,15 +562,25 @@ int snd_soc_suspend(struct device *dev)
 	snd_soc_dapm_sync(&card->dapm);
 
 	/* suspend all COMPONENTs */
-	for_each_card_components(card, component) {
-		struct snd_soc_dapm_context *dapm =
+	for_each_card_rtds(card, rtd) {
+
+		if (rtd->dai_link->ignore_suspend)
+			continue;
+
+		for_each_rtd_components(rtd, i, component) {
+			struct snd_soc_dapm_context *dapm =
 				snd_soc_component_get_dapm(component);
 
-		/*
-		 * If there are paths active then the COMPONENT will be held
-		 * with bias _ON and should not be suspended.
-		 */
-		if (!snd_soc_component_is_suspended(component)) {
+			/*
+			 * ignore if component was already suspended
+			 */
+			if (snd_soc_component_is_suspended(component))
+				continue;
+
+			/*
+			 * If there are paths active then the COMPONENT will be
+			 * held with bias _ON and should not be suspended.
+			 */
 			switch (snd_soc_dapm_get_bias_level(dapm)) {
 			case SND_SOC_BIAS_STANDBY:
 				/*
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
