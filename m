Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02487E485A
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 12:14:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7987C17C8;
	Fri, 25 Oct 2019 12:13:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7987C17C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571998489;
	bh=A9EGhUJptAYcz9z+m93UATGgLKsYURGHislt2gHj0d0=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=BjkPItaDssybddTvtanVd1o2b7CqaImmneQjoRZDCi8eNr1cFfkDtNwbiB7VyBG83
	 PAp6S0WA2Vq+DXX8XiNOx9gsJsDOPAx7U8YiMSRNaLQddzy2eYs0ZPiQ8ML07chAYR
	 GIvxmS0eGVlaF4mNFpdiVzJtpVVlde8wtNEpyd2Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D72AF8036F;
	Fri, 25 Oct 2019 12:12:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BD9EF805FC; Fri, 25 Oct 2019 12:12:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05FD0F802A0
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 12:12:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05FD0F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="g9hOXz0J"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=nPstqSGlbrqx9rYBxlCzkyHpfiX9qsJrrzCx1t+x+fQ=; b=g9hOXz0JaZXi
 R7Se6725Vm54BB16CFopqpneImGrV5To2pAHWXRkhj0ZzEHJKpkn436dd+bWX2V3RWz3oHyQ7JRJA
 GzAfi6Akr4R3QwcnEle3aCjXqaVDcbcWB3cJaokq14A6Pk0s2ufy62ZmOQynR/grtHfa89GHIeW5o
 evBq8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iNwZo-0006du-Ez; Fri, 25 Oct 2019 10:12:12 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id E42082743293; Fri, 25 Oct 2019 11:12:11 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Edward Cragg <edward.cragg@codethink.co.uk>
In-Reply-To: <20191018154833.7560-2-ben.dooks@codethink.co.uk>
X-Patchwork-Hint: ignore
Message-Id: <20191025101211.E42082743293@ypsilon.sirena.org.uk>
Date: Fri, 25 Oct 2019 11:12:11 +0100 (BST)
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
Subject: [alsa-devel] Applied "ASoC: tegra: add a TDM configuration
	callback" to the asoc tree
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

   ASoC: tegra: add a TDM configuration callback

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

From 07932563686a6c51b26266c8572901c46fd1cd55 Mon Sep 17 00:00:00 2001
From: Edward Cragg <edward.cragg@codethink.co.uk>
Date: Fri, 18 Oct 2019 16:48:27 +0100
Subject: [PATCH] ASoC: tegra: add a TDM configuration callback

Add a callback to configure TDM settings for the Tegra30 I2S ASoC 'platform'
driver.

Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
[ben.dooks@codethink.co.uk: merge fix for power management]
[ben.dooks@codethink.co.uk: add review change for fsync of 1 clock]
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Link: https://lore.kernel.org/r/20191018154833.7560-2-ben.dooks@codethink.co.uk
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/tegra/tegra30_i2s.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 48a09c9d60be..8f8924060d9d 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -265,6 +265,34 @@ static int tegra30_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	return 0;
 }
 
+static int tegra30_i2s_set_tdm(struct snd_soc_dai *dai,
+			       unsigned int tx_mask, unsigned int rx_mask,
+			       int slots, int slot_width)
+{
+	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+	unsigned int mask, val;
+
+	dev_dbg(dai->dev, "%s: txmask=0x%08x rxmask=0x%08x slots=%d width=%d\n",
+		 __func__, tx_mask, rx_mask, slots, slot_width);
+
+	mask = TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK |
+	       TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_MASK |
+	       TEGRA30_I2S_SLOT_CTRL_TX_SLOT_ENABLES_MASK;
+
+	val = (tx_mask << TEGRA30_I2S_SLOT_CTRL_TX_SLOT_ENABLES_SHIFT) |
+	      (rx_mask << TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_SHIFT) |
+	      ((slots - 1) << TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_SHIFT);
+
+	pm_runtime_get_sync(dai->dev);
+	regmap_update_bits(i2s->regmap, TEGRA30_I2S_SLOT_CTRL, mask, val);
+	/* set the fsync width to minimum of 1 clock width */
+	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CH_CTRL,
+			   TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_MASK, 0x0);
+	pm_runtime_put(dai->dev);
+
+	return 0;
+}
+
 static int tegra30_i2s_probe(struct snd_soc_dai *dai)
 {
 	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
@@ -279,6 +307,7 @@ static const struct snd_soc_dai_ops tegra30_i2s_dai_ops = {
 	.set_fmt	= tegra30_i2s_set_fmt,
 	.hw_params	= tegra30_i2s_hw_params,
 	.trigger	= tegra30_i2s_trigger,
+	.set_tdm_slot	= tegra30_i2s_set_tdm,
 };
 
 static const struct snd_soc_dai_driver tegra30_i2s_dai_template = {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
