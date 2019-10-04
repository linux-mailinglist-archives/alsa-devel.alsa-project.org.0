Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC87ACC22A
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Oct 2019 19:54:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8013E1686;
	Fri,  4 Oct 2019 19:53:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8013E1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570211666;
	bh=VgQlN6p50oG6fw8lgiOewne5IcYeywVJHqd5dUEZ2gE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=CSVAGk07nG1R8FfBhkq3RsLjMNunpRbEIN5K6PmPBLjnF9LWvGBbSgWlHMXikN8Y/
	 3FScuDr/hNrS1JJhyhxOASzV5T75B0YxQZ2PCh1u8AODQ5m3NJI0VLg3e5evm6sxvI
	 yfW51gn9+IPaZFBozSaIrHmPdZZN9yaYFoctz1So=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A12D2F803F3;
	Fri,  4 Oct 2019 19:52:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB093F805FA; Fri,  4 Oct 2019 19:52:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1849F80137
 for <alsa-devel@alsa-project.org>; Fri,  4 Oct 2019 19:52:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1849F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="NBJuJzhf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=SnEx+q8UrLxM+Y1tv/S2oUaL3RgTesLf7gwyWzN2SMw=; b=NBJuJzhfasmG
 /L8j+ItFEuXzXVedB7L/4jv2zIO1V0eSnV834IxhIMOuL8zSvJDtoSVHBsEky5+J4TLy0X3IWEYtR
 S+veqj358d5/YzsU8jDIAFokiRrKiPN6sw8czu54K4386ibYUcJ83jyUT4YCLhUWBFR7ZT+Tt7uwj
 GVMCY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iGRko-0003ui-VK; Fri, 04 Oct 2019 17:52:35 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 6EAF32741F98; Fri,  4 Oct 2019 18:52:34 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87zhijafgk.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191004175234.6EAF32741F98@ypsilon.sirena.org.uk>
Date: Fri,  4 Oct 2019 18:52:34 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: setup card->rtd_num at
	snd_soc_instantiate_card()" to the asoc tree
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

   ASoC: soc-core: setup card->rtd_num at snd_soc_instantiate_card()

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

From d8145989ff8c2a938be372b728f90e23de8557a2 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:23:07 +0900
Subject: [PATCH] ASoC: soc-core: setup card->rtd_num at
 snd_soc_instantiate_card()

card->rtd_num is used to count rtd. Initialize it at
snd_soc_instantiate_card() is very natural and less confusion.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87zhijafgk.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 2c2803e6544b..d39d908f3204 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -462,8 +462,6 @@ static void soc_remove_pcm_runtimes(struct snd_soc_card *card)
 
 	for_each_card_rtds_safe(card, rtd, _rtd)
 		soc_free_pcm_runtime(rtd);
-
-	card->num_rtd = 0;
 }
 
 struct snd_soc_pcm_runtime *snd_soc_get_pcm_runtime(struct snd_soc_card *card,
@@ -2008,6 +2006,7 @@ static int snd_soc_instantiate_card(struct snd_soc_card *card)
 		goto probe_end;
 
 	/* add predefined DAI links to the list */
+	card->num_rtd = 0;
 	for_each_card_prelinks(card, i, dai_link) {
 		ret = snd_soc_add_dai_link(card, dai_link);
 		if (ret < 0)
@@ -2418,7 +2417,6 @@ int snd_soc_register_card(struct snd_soc_card *card)
 	INIT_LIST_HEAD(&card->dapm_dirty);
 	INIT_LIST_HEAD(&card->dobj_list);
 
-	card->num_rtd = 0;
 	card->instantiated = 0;
 	mutex_init(&card->mutex);
 	mutex_init(&card->dapm_mutex);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
