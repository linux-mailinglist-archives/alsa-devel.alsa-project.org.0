Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AF712E099
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jan 2020 22:44:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6127A16C1;
	Wed,  1 Jan 2020 22:43:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6127A16C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577915040;
	bh=e5UKzrnbdnv65bVLtcTvgMRnasXxdK6fKNUtPNXoLCw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=KpUsnX6BQ0GKQeJ4T6b3HIdCk8q5y6mIh8kQsKCV6NX/2GCp3ssGrXG8oSbYbMZfJ
	 8+NzJ7O8V4+gf7nQUIqmRMByN7GP/6WDXd1r5HAtEX/Y5P114CsGnVmpS2UNW1Cimb
	 9jZ8tkPECpZnM/NWEvBqHBsi+XItcPX5/BM0zr6M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33A78F8015F;
	Wed,  1 Jan 2020 22:42:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95C0AF8015E; Wed,  1 Jan 2020 22:42:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86363F8011E
 for <alsa-devel@alsa-project.org>; Wed,  1 Jan 2020 22:42:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86363F8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="rrfujMrM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=1GJeXqBZgwVZGjKHCG8CUrT1zbGnow5SWLDAyMEOoqA=; b=rrfujMrMQDqx
 694ngqHc4672jevij1CmPFnBhzJy+5Fvxpv2Nv3EaaEgSD470jKdcT627rGJ+Bp/FQwery4QDsWNA
 c+jHgtzNwwFSM6iJIHZNUeTXsZPtqT2WVjkyg2kXY16D9R/+KofPO0ceLc64VAqhh16uGS92Kv53Z
 4Xu4k=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1imlke-0002aP-75; Wed, 01 Jan 2020 21:42:00 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 78EFFD057C6; Wed,  1 Jan 2020 21:41:59 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Julia Lawall <Julia.Lawall@inria.fr>
In-Reply-To: <1577864614-5543-11-git-send-email-Julia.Lawall@inria.fr>
Message-Id: <applied-1577864614-5543-11-git-send-email-Julia.Lawall@inria.fr>
X-Patchwork-Hint: ignore
Date: Wed,  1 Jan 2020 21:41:59 +0000 (GMT)
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: qdsp6: q6asm-dai: constify copied
	structure" to the asoc tree
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

   ASoC: qdsp6: q6asm-dai: constify copied structure

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

From 0da390ba86d841b1f9770c0a67bdebb4d8dc8be5 Mon Sep 17 00:00:00 2001
From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Wed, 1 Jan 2020 08:43:28 +0100
Subject: [PATCH] ASoC: qdsp6: q6asm-dai: constify copied structure

The q6asm_dai_hardware_capture structure is only copied into another
structure, so make it const.

The opportunity for this change was found using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
Link: https://lore.kernel.org/r/1577864614-5543-11-git-send-email-Julia.Lawall@inria.fr
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 5e2327708772..c0d422d0ab94 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -72,7 +72,7 @@ struct q6asm_dai_data {
 	long long int sid;
 };
 
-static struct snd_pcm_hardware q6asm_dai_hardware_capture = {
+static const struct snd_pcm_hardware q6asm_dai_hardware_capture = {
 	.info =                 (SNDRV_PCM_INFO_MMAP |
 				SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				SNDRV_PCM_INFO_MMAP_VALID |
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
