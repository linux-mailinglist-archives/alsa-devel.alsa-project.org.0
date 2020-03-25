Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F28193336
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 23:00:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37FC71688;
	Wed, 25 Mar 2020 23:00:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37FC71688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585173650;
	bh=9frJH47f5iN/FIA6vGcLLofwEV7gZc2xR5GYXejNcHo=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=R9gmBGfudzjamBFUzHGcD4J8bN7ILWD6qk7Pq7+jO+PXm7UJWeTUyTAEX/lb+JFZ9
	 wkRPuv+er6ldW2enQjYYq1eFJWPFu8agzq7cF2z2OC2WZnXGzmJJTZx2Ppn2lpN/pc
	 AD+Smhpc4rhIeFgtosZmvdxRUPrmiAVTBYbolceM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54462F80340;
	Wed, 25 Mar 2020 22:51:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B143F8028C; Wed, 25 Mar 2020 22:51:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id A74C6F8032A
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 22:51:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A74C6F8032A
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47C281FB;
 Wed, 25 Mar 2020 14:51:38 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD9993F71E;
 Wed, 25 Mar 2020 14:51:37 -0700 (PDT)
Date: Wed, 25 Mar 2020 21:51:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Colin Ian King <colin.king@canonical.com>
Subject: Applied "ASoC: mchp-i2s-mcc: make signed 1 bit bitfields unsigned" to
 the asoc tree
In-Reply-To: <20200325132913.110115-1-colin.king@canonical.com>
Message-Id: <applied-20200325132913.110115-1-colin.king@canonical.com>
X-Patchwork-Hint: ignore
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, kernel-janitors@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 linux-arm-kernel@lists.infradead.org
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

   ASoC: mchp-i2s-mcc: make signed 1 bit bitfields unsigned

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

From 633fddee7355e46a5b5ec471abb58d65e1e41012 Mon Sep 17 00:00:00 2001
From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 25 Mar 2020 13:29:13 +0000
Subject: [PATCH] ASoC: mchp-i2s-mcc: make signed 1 bit bitfields unsigned

The signed 1 bit bitfields should be unsigned, so make them unsigned.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Link: https://lore.kernel.org/r/20200325132913.110115-1-colin.king@canonical.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/atmel/mchp-i2s-mcc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index befc2a3a05b0..3cb63886195f 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -239,10 +239,10 @@ struct mchp_i2s_mcc_dev {
 	unsigned int				frame_length;
 	int					tdm_slots;
 	int					channels;
-	int					gclk_use:1;
-	int					gclk_running:1;
-	int					tx_rdy:1;
-	int					rx_rdy:1;
+	unsigned int				gclk_use:1;
+	unsigned int				gclk_running:1;
+	unsigned int				tx_rdy:1;
+	unsigned int				rx_rdy:1;
 };
 
 static irqreturn_t mchp_i2s_mcc_interrupt(int irq, void *dev_id)
-- 
2.20.1

