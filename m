Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFC64CEEE
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2019 15:35:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1D361616;
	Thu, 20 Jun 2019 15:34:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1D361616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561037744;
	bh=plKA1L9vi6nRWfafEd0jDgVoV+oXAZ+MG+VgzoPpTx0=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=tixH7tJqKhiA8oYmCqVo8OhGbpfL4hq6HvLCHlAfTLnCH7L7GZ3EKqg7Ht0imL0y+
	 whMsa6qSYZR2MPwWhXmDJxfsi6I5irtTvdJLt6JJDgwDqFiOUQwqrdKMP1s4bsU3v9
	 Jh+/JsKM/05w5Ld+kqkmMeJJyFT1uoDanPEh9pgY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E402FF89734;
	Thu, 20 Jun 2019 15:32:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEC00F8070D; Thu, 20 Jun 2019 15:32:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2ABF9F89717
 for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2019 15:32:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2ABF9F89717
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="KA64Nw/k"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=z0ycpLcEGhHaPZE/J2p44LEjsH7zaGYe62YBrseI3oY=; b=KA64Nw/k4CS9
 A4j5NvohgrrV3lnYinadu05QycqVBhrnoJd9TuvYtXWEDTcNScbE/3Nj3R6cI6wcZAs3iA+O3hBRb
 A00f6GLkxVFWW6uH5lNOwUmrumEL0/fHL8+wQMRePhYXWba4mifnYSxNwnCgoD1+iZsX/lwg+GKGt
 BXTeM=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hdxAv-0000iZ-8S; Thu, 20 Jun 2019 13:32:25 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 7430544004A; Thu, 20 Jun 2019 14:32:24 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
In-Reply-To: <20190620092656.14759-2-peter.ujfalusi@ti.com>
X-Patchwork-Hint: ignore
Message-Id: <20190620133224.7430544004A@finisterre.sirena.org.uk>
Date: Thu, 20 Jun 2019 14:32:24 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 lgirdwood@gmail.com, kuninori.morimoto.gx@renesas.com
Subject: [alsa-devel] Applied "ASoC: pcm3168a: Rename min_frame_size to
	slot_width" to the asoc tree
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

   ASoC: pcm3168a: Rename min_frame_size to slot_width

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

From b5d8dffb8cc9792c3bb4310e142932c8bc5c0387 Mon Sep 17 00:00:00 2001
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Thu, 20 Jun 2019 12:26:55 +0300
Subject: [PATCH] ASoC: pcm3168a: Rename min_frame_size to slot_width

It represents slot size and not frame.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/pcm3168a.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index 9eb24ca09793..e1658947090b 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -435,7 +435,7 @@ static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 	u32 val, mask, shift, reg;
 	unsigned int rate, fmt, ratio, max_ratio;
 	unsigned int chan;
-	int i, min_frame_size;
+	int i, slot_width;
 
 	rate = params_rate(params);
 	chan = params_channels(params);
@@ -470,11 +470,11 @@ static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	if (pcm3168a->slot_width)
-		min_frame_size = pcm3168a->slot_width;
+		slot_width = pcm3168a->slot_width;
 	else
-		min_frame_size = params_width(params);
+		slot_width = params_width(params);
 
-	switch (min_frame_size) {
+	switch (slot_width) {
 	case 16:
 		if (master_mode || (fmt != PCM3168A_FMT_RIGHT_J)) {
 			dev_err(component->dev, "16-bit slots are supported only for slave mode using right justified\n");
@@ -491,7 +491,7 @@ static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 	case 32:
 		break;
 	default:
-		dev_err(component->dev, "unsupported frame size: %d\n", min_frame_size);
+		dev_err(component->dev, "unsupported frame size: %d\n", slot_width);
 		return -EINVAL;
 	}
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
