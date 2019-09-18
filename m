Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0097B69DC
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 19:49:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FEDE167D;
	Wed, 18 Sep 2019 19:48:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FEDE167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568828982;
	bh=0JlE4uB6uoltPvSydPuSt27681o0N8jLX/mik6MLPfU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=mzMMd0qZ9CmyLEZr1JZaX05X+So/DGCVGACF6rIe3+fBWcFxiq7pbcVvUd/Yziy/H
	 07jdi9Xfpwqez4bmsw0bLmLGjnYGhXxbb0ATSNzbUZLd4yDAO9KWADVsR1UOvC/FWF
	 22kuFmrDY4p02LA/xYCFDlU5bWZrPbC9UMpdDfwI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7150AF80534;
	Wed, 18 Sep 2019 19:47:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3B3EF80506; Wed, 18 Sep 2019 19:47:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDBF1F800C1
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 19:47:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDBF1F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="BB36zWQ4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=6MOUY29Cq0NBnVR8zQ5hGSkgTLdnSNOtzVUjaAjYcUE=; b=BB36zWQ4LyEc
 TAUUuwobgaxiw2WqhOWXRFW5iVcRXoZK68x6/btxwv8u7JNKVHT9rXjBM05Fw4TUUji00XL7f8CkW
 anXUHsOHVnz5YarbPHeehK2ea0BoVdExB+v2NCPRpK8580IHjYSioSAFkI9RLuuFLRgmX9015oM7R
 Hci/8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iAe3T-0006dS-PE; Wed, 18 Sep 2019 17:47:51 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D71F42742927; Wed, 18 Sep 2019 18:47:50 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <874l1aw39d.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190918174750.D71F42742927@ypsilon.sirena.org.uk>
Date: Wed, 18 Sep 2019 18:47:50 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: rsnd: do error check after
	rsnd_channel_normalization()" to the asoc tree
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

   ASoC: rsnd: do error check after rsnd_channel_normalization()

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

From 947ec14c7369a87625f03abaab5b3f4d33ac73ba Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 18 Sep 2019 15:02:38 +0900
Subject: [PATCH] ASoC: rsnd: do error check after rsnd_channel_normalization()

SSI need to use rsnd_channel_normalization() for TDM-split mode,
thus, channel check need to do after that.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/874l1aw39d.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sh/rcar/ssi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sh/rcar/ssi.c b/sound/soc/sh/rcar/ssi.c
index f6a7466622ea..fc5d089868df 100644
--- a/sound/soc/sh/rcar/ssi.c
+++ b/sound/soc/sh/rcar/ssi.c
@@ -286,6 +286,11 @@ static int rsnd_ssi_master_clk_start(struct rsnd_mod *mod,
 	if (rsnd_ssi_is_multi_slave(mod, io))
 		return 0;
 
+	if (rsnd_runtime_is_tdm_split(io))
+		chan = rsnd_io_converted_chan(io);
+
+	chan = rsnd_channel_normalization(chan);
+
 	if (ssi->usrcnt > 0) {
 		if (ssi->rate != rate) {
 			dev_err(dev, "SSI parent/child should use same rate\n");
@@ -300,11 +305,6 @@ static int rsnd_ssi_master_clk_start(struct rsnd_mod *mod,
 		return 0;
 	}
 
-	if (rsnd_runtime_is_tdm_split(io))
-		chan = rsnd_io_converted_chan(io);
-
-	chan = rsnd_channel_normalization(chan);
-
 	main_rate = rsnd_ssi_clk_query(rdai, rate, chan, &idx);
 	if (!main_rate) {
 		dev_err(dev, "unsupported clock rate\n");
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
