Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF128D7252
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2019 11:30:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 771851654;
	Tue, 15 Oct 2019 11:29:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 771851654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571131820;
	bh=EPvfPyiU1aNIcwdgpHxEUrT/wVTZ1reyctox/Qm3+AY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=TtK2whLyzlBWGhr8QqgB5/vEfgHzInCWnN+j/TRn1RuRSbkCZ6+wOWcsoWSrc1jC5
	 e3UvXSqqku7RBNxFLHq/VEBUitZdsj+XKuUH2Kmm1SUVYdC/IMOjhZZd3LLpPQPpT5
	 lwJRex+/RacQCNTNzGl9epODyJyxUlDMUnjngW+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E859F805FC;
	Tue, 15 Oct 2019 11:27:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96EABF804A9; Tue, 15 Oct 2019 11:26:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A01C8F804AB
 for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2019 11:26:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A01C8F804AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="n1vKB3Zt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=1NoAFkGBQaadDdmAXYmReUlud2l6fkIqAylkUKYyuVo=; b=n1vKB3ZtWqAO
 dXUZ2ASxFMfQ6ZLnfAJAF+84s6Nmygb02cWZ9yjy/olhVMO9TwBNu09h3uC+fmRfu1kz29c+xFFGf
 7J6O70+NvNPPlWtMG2S9MrxoViqectI+C+RWMXGc6tZY5XH8GJA0uikebpLoScU9eNgYCfTn9vmOr
 yNGpM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iKJ6T-0001ob-14; Tue, 15 Oct 2019 09:26:53 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 9E5202742905; Tue, 15 Oct 2019 10:26:51 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
In-Reply-To: <20191015090037.23271-1-peter.ujfalusi@ti.com>
X-Patchwork-Hint: ignore
Message-Id: <20191015092651.9E5202742905@ypsilon.sirena.org.uk>
Date: Tue, 15 Oct 2019 10:26:51 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 lgirdwood@gmail.com, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [alsa-devel] Applied "ASoC: pcm3168a: Fix serial mode dependent
	format support" to the asoc tree
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

   ASoC: pcm3168a: Fix serial mode dependent format support

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

From a35716a95655d8fc15042c9d574374eceb9daf3d Mon Sep 17 00:00:00 2001
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Tue, 15 Oct 2019 12:00:37 +0300
Subject: [PATCH] ASoC: pcm3168a: Fix serial mode dependent format support

fmt 0 is perfectly valid (PCM3168A_FMT_I2S). Remove the return in case
fmt == 0.

Fixes: ("ASoC: pcm3168a: Use fixup instead of constraint for channels and formats")
Reported-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Link: https://lore.kernel.org/r/20191015090037.23271-1-peter.ujfalusi@ti.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/pcm3168a.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index 708dac27feff..313500ab36df 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -322,9 +322,6 @@ static void pcm3168a_update_fixup_pcm_stream(struct snd_soc_dai *dai)
 	u64 formats = SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S24_LE;
 	unsigned int channel_max = dai->id == PCM3168A_DAI_DAC ? 8 : 6;
 
-	if (!pcm3168a->io_params[dai->id].fmt)
-		return;
-
 	if (pcm3168a->io_params[dai->id].fmt == PCM3168A_FMT_RIGHT_J) {
 		/* S16_LE is only supported in RIGHT_J mode */
 		formats |= SNDRV_PCM_FMTBIT_S16_LE;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
