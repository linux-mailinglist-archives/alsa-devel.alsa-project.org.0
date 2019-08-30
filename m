Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E73A35FE
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 13:48:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6F001679;
	Fri, 30 Aug 2019 13:47:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6F001679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567165716;
	bh=OQ3jmHDrDd1V08FR/zXWZ5j3OgNuNEwyAqlr2963LHo=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=dbb6CCsDGuKhPy7Ox7bEX51hYBJ2UtZTaUHUFZZDDkx7LoPKCS/9IzjcPLP+N2sul
	 2ZnBgNPJbr3R2bpi08xmb8rGNtDwAD+6MXtAjRVDA4TOVBE+AhkpkZk9SEiz0mkED3
	 ie7sVF+0eqXIYolh4E4dzoeKTzstkNprL0XTxGp8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2E2CF80444;
	Fri, 30 Aug 2019 13:45:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A95FF805FD; Fri, 30 Aug 2019 13:45:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 197DDF80377
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 13:45:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 197DDF80377
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="c8ssFhkP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=r0qoLRW1g03rHM/eJuVrtYBVLcshuWQuFJpe2c4m/KQ=; b=c8ssFhkP9lhD
 zWINREpSUZxDZ63fu8dyuuBLHW5jdgeNNDStA2pr0NIKusdSOy9336DGlKzKzFbw3ITI/YgueMYkP
 Au7VcdLTK3QfNiwb4R/qdfig1H7OsKR4DFj6SZqpRLCjlB/zczJgLIJksdNAHVMq+pThOkD68kGeM
 l77lg=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i3fLD-0006Ij-JR; Fri, 30 Aug 2019 11:45:19 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id F3A512742B61; Fri, 30 Aug 2019 12:45:18 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
In-Reply-To: <20190830103841.25128-2-peter.ujfalusi@ti.com>
X-Patchwork-Hint: ignore
Message-Id: <20190830114518.F3A512742B61@ypsilon.sirena.org.uk>
Date: Fri, 30 Aug 2019 12:45:18 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 nsekhar@ti.com, lgirdwood@gmail.com, kuninori.morimoto.gx@renesas.com
Subject: [alsa-devel] Applied "ASoC: ti: davinci-i2s: Add S32_LE as support
	format" to the asoc tree
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

   ASoC: ti: davinci-i2s: Add S32_LE as support format

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

From 2231b2c63f869528504195f202d9585a4f00f143 Mon Sep 17 00:00:00 2001
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Fri, 30 Aug 2019 13:38:38 +0300
Subject: [PATCH] ASoC: ti: davinci-i2s: Add S32_LE as support format

ASP/McBSP can support 8/16/20/24/32 bits word in theory. I have only tested
S16_LE and S32_LE, the other formats might not work so only extend the
supported formats with S32_LE for now.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Link: https://lore.kernel.org/r/20190830103841.25128-2-peter.ujfalusi@ti.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/ti/davinci-i2s.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
index 92c1bdc69086..f04d9fb5130f 100644
--- a/sound/soc/ti/davinci-i2s.c
+++ b/sound/soc/ti/davinci-i2s.c
@@ -612,6 +612,8 @@ static void davinci_i2s_shutdown(struct snd_pcm_substream *substream,
 }
 
 #define DAVINCI_I2S_RATES	SNDRV_PCM_RATE_8000_96000
+#define DAVINCI_I2S_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
+				 SNDRV_PCM_FMTBIT_S32_LE)
 
 static const struct snd_soc_dai_ops davinci_i2s_dai_ops = {
 	.shutdown	= davinci_i2s_shutdown,
@@ -639,12 +641,14 @@ static struct snd_soc_dai_driver davinci_i2s_dai = {
 		.channels_min = 2,
 		.channels_max = 2,
 		.rates = DAVINCI_I2S_RATES,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE,},
+		.formats = DAVINCI_I2S_FORMATS,
+	},
 	.capture = {
 		.channels_min = 2,
 		.channels_max = 2,
 		.rates = DAVINCI_I2S_RATES,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE,},
+		.formats = DAVINCI_I2S_FORMATS,
+	},
 	.ops = &davinci_i2s_dai_ops,
 
 };
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
