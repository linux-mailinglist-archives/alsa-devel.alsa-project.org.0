Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A627911190
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 04:36:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 436E2177F;
	Thu,  2 May 2019 04:35:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 436E2177F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556764569;
	bh=Is0Nj3zZ5D5Isyy4vua48Wr3BixYtoUNH/E3/39k8X0=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=up4oGejxbjdCA0e8X4xGPi23lMBoCG4XS90V6GV0vBmzm5l0skPsSYCSLvc2vgxks
	 AnoXNl5zz4NCLxzV+5QNq9qB2dWKiQnrr5wUtqM+jj473NqYq37ZJhzMkyjbQh7gnt
	 3jvlC4DDnPcF4qh2VBO5CnetZBe7JayBtn/40Yn0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF4F8F897A9;
	Thu,  2 May 2019 04:19:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0228F8975D; Thu,  2 May 2019 04:19:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00CB8F89744
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 04:18:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00CB8F89744
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="RRkiWZzn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=UHEfdzY2SRblr5bwZcw14SwkQj4L3ql7iy+ou6Q9jpY=; b=RRkiWZznDnkq
 9i1BJ9BDacg3nhd5+AAC2FWqBYdHF0aOqh+HPw+42Kz5ePNCW35qSAWdrWOKRiPGQaatodjC9RWxf
 2s09OxcrRo5I/lxpff9XGc64maZTWk4ByZSDzlu/VUOjftvzNCzhieVUtYOetI+ev9D90owDQk804
 z8VnM=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hM1J3-0005sr-SV; Thu, 02 May 2019 02:18:42 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id BE8A2441D3B; Thu,  2 May 2019 03:18:38 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20190416145251.16800-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190502021838.BE8A2441D3B@finisterre.ee.mobilebroadband>
Date: Thu,  2 May 2019 03:18:38 +0100 (BST)
Cc: alsa-devel@alsa-project.org, maruthi.bayyavarapu@amd.com, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Hulk Robot <hulkci@huawei.com>, Mark Brown <broonie@kernel.org>,
 Vijendar.Mukunda@amd.com, colin.king@canonical.com
Subject: [alsa-devel] Applied "ASoC: amd: acp3x: Make acp3x_dai_i2s_ops
	static" to the asoc tree
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

   ASoC: amd: acp3x: Make acp3x_dai_i2s_ops static

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

From a1a86e1bd4a87fd09171fd8555fe7490917e4e94 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 16 Apr 2019 22:52:51 +0800
Subject: [PATCH] ASoC: amd: acp3x: Make acp3x_dai_i2s_ops static

Fix sparse warning:

sound/soc/amd/raven/acp3x-pcm-dma.c:561:24: warning:
 symbol 'acp3x_dai_i2s_ops' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 1a2e15ff1456..9775bda2a4ca 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -558,7 +558,7 @@ static int acp3x_dai_i2s_trigger(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-struct snd_soc_dai_ops acp3x_dai_i2s_ops = {
+static struct snd_soc_dai_ops acp3x_dai_i2s_ops = {
 	.hw_params = acp3x_dai_i2s_hwparams,
 	.trigger   = acp3x_dai_i2s_trigger,
 	.set_fmt = acp3x_dai_i2s_set_fmt,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
