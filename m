Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 905C3E4860
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 12:15:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 096AE176D;
	Fri, 25 Oct 2019 12:14:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 096AE176D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571998549;
	bh=ATof+yU+3mMnJFCwwkJczEueYJUO+hoslPCetb7OpCY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=eKTr4kYNXtDMkY5VUVPvHmg3VWgwFLHEWgjuji5Q5AmQVz4p1wi23NFAjbeQW2/d2
	 NcvDn9Ok4XSfOyncyD2G58uEnpW2TyMTQvv+zA2n+PSjoqulmu3yq58fAhEmioHipQ
	 wb1h3yynL3Wz8sbknq78sA9Xqb1I2l6E08lRiNeQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91F5DF80610;
	Fri, 25 Oct 2019 12:12:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62C9AF80112; Fri, 25 Oct 2019 12:12:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20A27F80368
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 12:12:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20A27F80368
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="LyFs1ygF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=hRzOylwwcvGjRwWvhcJxQmB8Nj5XDL65PlfokZkrWsM=; b=LyFs1ygFCWnI
 auiI3IaSgCLtocqZc4DWounRJXgKgoQ8EVD0RhBSexhtKCi9QwJSqbwp/KOVC4WPZpLJz2iEgxWVC
 M9WEeME0/lb2pWkYA8aYVaGuGvrktIZxc6ENGbvxHi66C5r1rcIEoXzyzmukIGpWXL9kr30E/wXBz
 mZlHI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iNwZo-0006dr-95; Fri, 25 Oct 2019 10:12:12 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id B32C02743273; Fri, 25 Oct 2019 11:12:11 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
In-Reply-To: <20191018154833.7560-5-ben.dooks@codethink.co.uk>
X-Patchwork-Hint: ignore
Message-Id: <20191025101211.B32C02743273@ypsilon.sirena.org.uk>
Date: Fri, 25 Oct 2019 11:12:11 +0100 (BST)
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
Subject: [alsa-devel] Applied "ASoC: tegra: disable rx_fifo after disable
	stream" to the asoc tree
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

   ASoC: tegra: disable rx_fifo after disable stream

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

From 8c05f6af7b7d713e327cd6df5a8889c32fc1c10f Mon Sep 17 00:00:00 2001
From: Ben Dooks <ben.dooks@codethink.co.uk>
Date: Fri, 18 Oct 2019 16:48:30 +0100
Subject: [PATCH] ASoC: tegra: disable rx_fifo after disable stream

We see odd FIFO overruns with this, we assume the best thing to do is
to disable the RX I2S frontend first, and then disable the FIFO that
is using it.

This also fixes an issue where using multi-word frames (TDM) have
partial samples stuck in the FIFO which then get read out when the
next capture is started.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
Link: https://lore.kernel.org/r/20191018154833.7560-5-ben.dooks@codethink.co.uk
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/tegra/tegra30_i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 8f8924060d9d..dbed3c5408e7 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -231,9 +231,9 @@ static void tegra30_i2s_start_capture(struct tegra30_i2s *i2s)
 
 static void tegra30_i2s_stop_capture(struct tegra30_i2s *i2s)
 {
-	tegra30_ahub_disable_rx_fifo(i2s->capture_fifo_cif);
 	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CTRL,
 			   TEGRA30_I2S_CTRL_XFER_EN_RX, 0);
+	tegra30_ahub_disable_rx_fifo(i2s->capture_fifo_cif);
 }
 
 static int tegra30_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
