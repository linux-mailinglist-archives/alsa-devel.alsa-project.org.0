Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46704B8ED4
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Sep 2019 13:12:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E3F31672;
	Fri, 20 Sep 2019 13:11:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E3F31672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568977930;
	bh=4aP8xjMLCElXJwDefLe/JnBnnOnrw0pZlRWDkTh5jbg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=qNhcAvigJTNKS8YfaigOwGvdMrcR7xx/LfXBiI6qtrr+wn4GbjBZIbdFW+aTX3yGb
	 4ZUZA0Gma3zneRLx/h36no5SbWMDm/OJ2TEDaYsQeEgvmiul1vMhU3+DB4lJgYr2wo
	 wli2EoyqvlYhC/5/n6gJELvC6nbqkn9MrD3S0JOA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4714AF805FD;
	Fri, 20 Sep 2019 13:09:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73449F805FB; Fri, 20 Sep 2019 13:09:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32FD5F805A1
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 13:09:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32FD5F805A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="htTXj2EH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=SSdwlo1XcwxWmumkUmpeqDNBWbMT2GDjXUuuDdgm15Y=; b=htTXj2EHIYBt
 E6KzXVhRZVKWipTvl+vqcj8iCRpMCzt0MW91wlDyWH0BAE5AvzUb58keXmK2A/C6j+ukYeg5LXi9R
 wWuk+7eD4vVcY/+5MCI2xVJA1tt24ssgQ/oABeFxlJ51EjqS8lupQwfrWMhCp++SipPF+xO53qds6
 3ikYw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iBGn7-0001cP-W0; Fri, 20 Sep 2019 11:09:34 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 71B9F2742991; Fri, 20 Sep 2019 12:09:33 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Bard liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20190918133131.15045-1-yung-chuan.liao@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190920110933.71B9F2742991@ypsilon.sirena.org.uk>
Date: Fri, 20 Sep 2019 12:09:33 +0100 (BST)
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 tiwai@suse.de, pierre-louis.bossart@linux.intel.com,
 Mark Brown <broonie@kernel.org>, bard.liao@intel.com
Subject: [alsa-devel] Applied "ASoC: core: use list_del_init and move it
	back to soc_cleanup_component" to the asoc tree
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

   ASoC: core: use list_del_init and move it back to soc_cleanup_component

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 7a5d9815cc010b055c2a99ccf418c4629365fa43 Mon Sep 17 00:00:00 2001
From: Bard liao <yung-chuan.liao@linux.intel.com>
Date: Wed, 18 Sep 2019 21:31:31 +0800
Subject: [PATCH] ASoC: core: use list_del_init and move it back to
 soc_cleanup_component

commit a0a4bf57a977 ("ASoC: core: delete component->card_list in soc_remove_component only")
was trying to fix a kernel oops when list_del was called twice without
re-init the list. Use list_del_init() can solve it, too. Besides, it
will be more readable if we cleanup all component related resource at
soc_cleanup_component().

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Bard liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20190918133131.15045-1-yung-chuan.liao@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index aff4b4bf4d07..88978a3036c4 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -978,6 +978,7 @@ static void soc_cleanup_component(struct snd_soc_component *component)
 	/* For framework level robustness */
 	snd_soc_component_set_jack(component, NULL, NULL);
 
+	list_del_init(&component->card_list);
 	snd_soc_dapm_free(snd_soc_component_get_dapm(component));
 	soc_cleanup_component_debugfs(component);
 	component->card = NULL;
@@ -990,7 +991,7 @@ static void soc_remove_component(struct snd_soc_component *component)
 		return;
 
 	snd_soc_component_remove(component);
-	list_del(&component->card_list);
+
 	soc_cleanup_component(component);
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
