Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7995819F78B
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Apr 2020 16:06:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 179F4167E;
	Mon,  6 Apr 2020 16:05:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 179F4167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586181980;
	bh=UbkFYXsatuzQbUdxGVDQAxnHxupZla2aqzUmbNgnnGI=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=n3dD0Ln7la2lfmDZlL3hyK4N3f7l+rrF6H1nOYgvSe9YRmj5tNUlJikDziWj3BFTc
	 txo/AsYufUBt80LV56lfnqNf0npVLop/OIL/Vc9wUYl/PT9iXvpJ9dKnSquUbtQSSl
	 tOQADTYVbh68RmnQJrE21wgVJfAFitnIGmA/6+Co=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DFFDF80140;
	Mon,  6 Apr 2020 16:03:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5467F80121; Mon,  6 Apr 2020 16:03:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1ACDF80121
 for <alsa-devel@alsa-project.org>; Mon,  6 Apr 2020 16:03:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1ACDF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="F8Wsfrq0"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F061C23433;
 Mon,  6 Apr 2020 14:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586181829;
 bh=UbkFYXsatuzQbUdxGVDQAxnHxupZla2aqzUmbNgnnGI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=F8Wsfrq0K11uyIa+GRybKbyBxjyoiQ72PIhjJXXAD60jFxbbOrC4Q4w3iv3l/BCOg
 lJlT3GYD87feNnOAUIEaPoSpOJQBWeGU4GmwpJPLNmpRQZAqKLlBlFIku2Bnqr6+Je
 TKQsB7z6IBrmoerd2HKKbinAfmIEktdHGKNMqioo=
Date: Mon, 06 Apr 2020 15:03:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Julia Lawall <Julia.Lawall@inria.fr>
Subject: Applied "ASoC: stm32: sai: Add missing cleanup" to the asoc tree
In-Reply-To: <1586099028-5104-1-git-send-email-Julia.Lawall@inria.fr>
Message-Id: <applied-1586099028-5104-1-git-send-email-Julia.Lawall@inria.fr>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Olivier Moysan <olivier.moysan@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>, Takashi Iwai <tiwai@suse.com>,
 kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

   ASoC: stm32: sai: Add missing cleanup

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

From 7506baeed8d05fc164254c64af14cfed2ac14446 Mon Sep 17 00:00:00 2001
From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 5 Apr 2020 17:03:48 +0200
Subject: [PATCH] ASoC: stm32: sai: Add missing cleanup

The commit 0d6defc7e0e4 ("ASoC: stm32: sai: manage rebind issue")
converts some function calls to their non-devm equivalents.  The
appropriate cleanup code was added to the remove function, but not
to the probe function.  Add a call to snd_dmaengine_pcm_unregister
to compensate for the call to snd_dmaengine_pcm_register in case
of subsequent failure.

Fixes: commit 0d6defc7e0e4 ("ASoC: stm32: sai: manage rebind issue")
Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Acked-by: Olivier Moysan <olivier.moysan@st.com>
Link: https://lore.kernel.org/r/1586099028-5104-1-git-send-email-Julia.Lawall@inria.fr
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/stm/stm32_sai_sub.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 2bd280c01c33..0d0c9afd8791 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -1556,8 +1556,10 @@ static int stm32_sai_sub_probe(struct platform_device *pdev)
 
 	ret = snd_soc_register_component(&pdev->dev, &stm32_component,
 					 &sai->cpu_dai_drv, 1);
-	if (ret)
+	if (ret) {
+		snd_dmaengine_pcm_unregister(&pdev->dev);
 		return ret;
+	}
 
 	if (STM_SAI_PROTOCOL_IS_SPDIF(sai))
 		conf = &stm32_sai_pcm_config_spdif;
-- 
2.20.1

