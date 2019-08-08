Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B47986B9F
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 22:35:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D2F81616;
	Thu,  8 Aug 2019 22:34:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D2F81616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565296530;
	bh=F/VAY7AMBkiLh+T8NVzkcmV4yo/421m3ISE7d5waVfc=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=HhSIh0+Zt0bTMpvBWKCiaTWNgfc7zdwcMeoxULUjcMonvNaQREhv6M8+oZYNxRbEF
	 wAJTO7a8LFYaIOKjqXvIFDv5GAB7UDnLa2e20SIBf2bjN1/KHDg60t8Usl/A7XJaAY
	 /dIE5D66MTiEklIxuFXU7OuuL1YBeWfb/mJONq/o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89529F805F8;
	Thu,  8 Aug 2019 22:33:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85C17F805AA; Thu,  8 Aug 2019 22:33:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C807DF800E4
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 22:33:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C807DF800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="VCHl4C4I"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=6tICZwq2RofbtlufJzPyPgQJ2xJbFhXn7p7DdOaIR3s=; b=VCHl4C4I0KnQ
 vlnRkQRoZOfN3pDfdlKWiyEpF5ew2uSYfjAgSTR8ILjtcidbkc07e5wW+Al8Kv6Mn47UJMQDtV3oG
 RbJUrC32G+vsdLz14GU85OwJjtpi5RHAnX7o2zATwr5Kc1Kay06pjoYIDXUYLv31HnZT9sOVlZUSU
 cempo=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hvp6S-00041E-DP; Thu, 08 Aug 2019 20:33:40 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id E3A512742BE9; Thu,  8 Aug 2019 21:33:39 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <874l2tahnq.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190808203339.E3A512742BE9@ypsilon.sirena.org.uk>
Date: Thu,  8 Aug 2019 21:33:39 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: dai_link check under
	soc_dpcm_debugfs_add()" to the asoc tree
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

   ASoC: soc-core: dai_link check under soc_dpcm_debugfs_add()

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

From 596becd3f82a7b7e091b0f5c380bc9a0e6758126 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 7 Aug 2019 10:31:36 +0900
Subject: [PATCH] ASoC: soc-core: dai_link check under soc_dpcm_debugfs_add()

soc_dpcm_debugfs_add(rtd) is checking rtd->dai_link pointer,
but, rtd->dai_link->dynamic have been already checked before calling it.

	static int soc_probe_link_dais(...) {
		dai_link = rtd->dai_link;
		...
=>		if (dai_link->dynamic)
=>			soc_dpcm_debugfs_add(rtd);
		...
	}

	void soc_dpcm_debugfs_add(rtd)
	{
=>		if (!rtd->dai_link)
			return;
		...
	}

These pointer checks are strange/pointless.
This patch checks dai_link->dynamic under soc_dpcm_debugfs_add().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/874l2tahnq.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 3 +--
 sound/soc/soc-pcm.c  | 3 +++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 2a75fba31aa4..1fbd525763d5 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1488,8 +1488,7 @@ static int soc_probe_link_dais(struct snd_soc_card *card,
 		return ret;
 
 	/* add DPCM sysfs entries */
-	if (dai_link->dynamic)
-		soc_dpcm_debugfs_add(rtd);
+	soc_dpcm_debugfs_add(rtd);
 
 	num = rtd->num;
 
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 77c986fe08d0..da657c8179cc 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -3200,6 +3200,9 @@ void soc_dpcm_debugfs_add(struct snd_soc_pcm_runtime *rtd)
 	if (!rtd->dai_link)
 		return;
 
+	if (!rtd->dai_link->dynamic)
+		return;
+
 	if (!rtd->card->debugfs_card_root)
 		return;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
