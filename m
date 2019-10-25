Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE36CE486E
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 12:18:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 424E817D8;
	Fri, 25 Oct 2019 12:17:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 424E817D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571998720;
	bh=4eoQROfK7/ARoRAljXPdvyOYPt3CZVVY7d36ENlyqRg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=udr4fQiQJJXVlD7b4mFYrA/R6beUk3qaeRmcgJYmFsffIXUFDH3darYUm86cReVWt
	 Gqlv0wTRwCd3zfwXoPAz6ZH2UiREylEftfeQIeyrUSaNT8TiT/3/MMTiL/wHPRmjvU
	 36X6T+7P1BaaoQn48zGDy4K4zFwvJbJ7U8fSnI1k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 538FFF8065D;
	Fri, 25 Oct 2019 12:12:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71459F803D7; Fri, 25 Oct 2019 12:12:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 100B3F805FA
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 12:12:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 100B3F805FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="JF2doRef"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=UIHdbuehA4W5cQC/qzKEDI4VtUGGKof8itjs+eOyx+E=; b=JF2doRefoXnQ
 lWBOkJj9/uB6Rh/B2njgORKwRLWda76rcCGjW5aM/TE7Pb8uf+ma1bvwawEJiBBbk4x8pN4jUK+7n
 05AiVkU+lfk5wAB/2Auucd0ZxvxZUApFlrhkCcfc1x5y7o/iZYpShdZ5K0dZPqiZ132ufI1RuPzZ0
 6iw98=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iNwZp-0006eG-Ph; Fri, 25 Oct 2019 10:12:13 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 3AA502743273; Fri, 25 Oct 2019 11:12:13 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Colin Ian King <colin.king@canonical.com>
In-Reply-To: <20191024124610.18182-1-colin.king@canonical.com>
X-Patchwork-Hint: ignore
Message-Id: <20191025101213.3AA502743273@ypsilon.sirena.org.uk>
Date: Fri, 25 Oct 2019 11:12:13 +0100 (BST)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Ben Zhang <benzh@chromium.org>, Mark Brown <broonie@kernel.org>,
 Bard Liao <bardliao@realtek.com>, Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] Applied "ASoC: rt5677: Add missing null check for
	failed allocation of rt5677_dsp" to the asoc tree
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

   ASoC: rt5677: Add missing null check for failed allocation of rt5677_dsp

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

From f8a60435703bdde8f8a0ceb1aa8dad59df821583 Mon Sep 17 00:00:00 2001
From: Colin Ian King <colin.king@canonical.com>
Date: Thu, 24 Oct 2019 13:46:10 +0100
Subject: [PATCH] ASoC: rt5677: Add missing null check for failed allocation of
 rt5677_dsp

The allocation of rt5677_dsp can potentially fail and return null, so add
a null check and return -ENOMEM on a memory allocation failure.

Addresses-Coverity: ("Dereference null return")
Fixes: a0e0d135427c ("ASoC: rt5677: Add a PCM device for streaming hotword via SPI")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
Link: https://lore.kernel.org/r/20191024124610.18182-1-colin.king@canonical.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5677-spi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index 36c02d200cfc..3a17643fcd9f 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -376,6 +376,8 @@ static int rt5677_spi_pcm_probe(struct snd_soc_component *component)
 
 	rt5677_dsp = devm_kzalloc(component->dev, sizeof(*rt5677_dsp),
 			GFP_KERNEL);
+	if (!rt5677_dsp)
+		return -ENOMEM;
 	rt5677_dsp->dev = &g_spi->dev;
 	mutex_init(&rt5677_dsp->dma_lock);
 	INIT_DELAYED_WORK(&rt5677_dsp->copy_work, rt5677_spi_copy_work);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
