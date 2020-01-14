Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF4013AF5C
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 17:29:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A63B11837;
	Tue, 14 Jan 2020 17:28:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A63B11837
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579019362;
	bh=EfPLY+DajgiDbh7QYjOw3MCsaL9OxNNHyg3hv0mxUkY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=UFKM/xusv5y5wlOCuLfGyS6ZYvReVMiAvq42Fp8IqND3VdijJwQFOjtDnvEZAJUEe
	 7d3qGOmnTSi6WsUZX9i7bo3VHPIWdlQAomyNFq4LEtlyVxb3VqrMB6wIlMRAmDF/q7
	 2+s31vsDgvWjV4rmgTgCJC4FFIT3GfXSjxwkzb2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A995F803DE;
	Tue, 14 Jan 2020 17:10:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B0B9F8034E; Tue, 14 Jan 2020 17:10:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9D43F80121
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 17:09:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9D43F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="LlrOO7oX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=GHzTVMVBF94ZwOFU8U5VP1k9TerbuAdkk43kRxNrbUM=; b=LlrOO7oXUFt1
 lPa2l9xQOwKssDCLDOHYXBgW6gY5NIaZWlHq+emJTeu2Rfwr08/kVqhpUfeL7VNXBPHp4OTRH0WXF
 8jgCdTQRLrBWOebZ3DoZifyPfuWA783LV9jlqQQWEo5eT9rhOeYUyVs187VJEPS1zPShti4EKg4Pl
 Ov7WE=;
Received: from fw-tnat-cam7.arm.com ([217.140.106.55]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1irOkh-0001Wz-FJ; Tue, 14 Jan 2020 16:09:11 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id D4FF5D02C7B; Tue, 14 Jan 2020 16:09:10 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87h80yhm9p.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87h80yhm9p.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Date: Tue, 14 Jan 2020 16:09:10 +0000 (GMT)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 ard Liao <bardliao@realtek.com>
Subject: [alsa-devel] Applied "ASoC: rt715: use dev_to_sdw_dev() instead of
	to_sdw_slave_device()" to the asoc tree
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

   ASoC: rt715: use dev_to_sdw_dev() instead of to_sdw_slave_device()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From 2c72943dc359c9592747c3fd82cda30e7c89714c Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 14 Jan 2020 10:14:42 +0900
Subject: [PATCH] ASoC: rt715: use dev_to_sdw_dev() instead of
 to_sdw_slave_device()

This patch fixup this error

  CC      sound/soc/codecs/rt715-sdw.o
linux/sound/soc/codecs/rt715-sdw.c: In function 'rt715_dev_resume':
linux/sound/soc/codecs/rt715-sdw.c:568:28: error: implicit declaration\
 of function 'to_sdw_slave_device'; did you mean 'sdw_slave_modalias'?\
[-Werror=implicit-function-declaration]
  struct sdw_slave *slave = to_sdw_slave_device(dev);
                            ^~~~~~~~~~~~~~~~~~~
                            sdw_slave_modalias
linux/sound/soc/codecs/rt715-sdw.c:568:28: warning: initialization of\
 'struct sdw_slave *' from 'int' makes pointer from integer without a\
 cast [-Wint-conversion]
cc1: some warnings being treated as errors

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87h80yhm9p.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt715-sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt715-sdw.c b/sound/soc/codecs/rt715-sdw.c
index c35591fd281b..18868e4ae6e8 100644
--- a/sound/soc/codecs/rt715-sdw.c
+++ b/sound/soc/codecs/rt715-sdw.c
@@ -565,7 +565,7 @@ static int rt715_dev_suspend(struct device *dev)
 
 static int rt715_dev_resume(struct device *dev)
 {
-	struct sdw_slave *slave = to_sdw_slave_device(dev);
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt715_priv *rt715 = dev_get_drvdata(dev);
 	unsigned long time;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
