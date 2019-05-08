Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AD31747B
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 11:03:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B9DB1694;
	Wed,  8 May 2019 11:02:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B9DB1694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557306205;
	bh=IKHWCbz3laGExDtc4cgMFFMypbYlsyIzpmOO9Yor/Ao=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=gkLJMgN1DtHTnUHGLnahXCOCqo86SrWswpFqzY+BfjJFB0VqbhzVCmGHgP4fPhcj9
	 NOnMXrVFTL8v/xdGPE5zIMaAxx56tDonEw97nvDDBaC6Nkf77wWm0QS2/+AdDK7DVx
	 IW4sCvTPiCk/AgZwFrnEmLHOiRu0Z+xsqewpO4LU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84A7DF89727;
	Wed,  8 May 2019 11:01:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 973EFF807B5; Wed,  8 May 2019 11:01:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08CF4F807B5
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 11:01:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08CF4F807B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="e6V9nLiT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=2YD+3e/mSQgijYlna+6iWfg/F1jXMZ186P5aAZIij44=; b=e6V9nLiTOmwN
 kh78fhxIROK+fuFnMUJlnXV6HoDAzXLpSpK/GnKpeBrelmCk6oIgwqNWtjfk8+AVa2eH57Ge1Ugr/
 vnotQ9IbyvpyoAhwPqZ1fGPrzMJW5Lyom/i2idLuQxhIxadgMhfrzb8Vm54jQNyyU0ze7Mm7u59ft
 nNxXI=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOISC-0007dN-I7; Wed, 08 May 2019 09:01:34 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id B5FB0440010; Wed,  8 May 2019 10:01:26 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20190507140632.15996-1-daniel.baluta@nxp.com>
X-Patchwork-Hint: ignore
Message-Id: <20190508090126.B5FB0440010@finisterre.sirena.org.uk>
Date: Wed,  8 May 2019 10:01:26 +0100 (BST)
Cc: alsa-devel@alsa-project.org, timur@kernel.org,
 Daniel Baluta <daniel.baluta@nxp.com>, "S.j. Wang" <shengjiu.wang@nxp.com>,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>, festevam@gmail.com
Subject: [alsa-devel] Applied "ASoC: fsl_sai: Move clock operation to PM
	runtime" to the asoc tree
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

   ASoC: fsl_sai: Move clock operation to PM runtime

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From c0ffbd64b9dc14d673e393cc5933f3b4a47ab39c Mon Sep 17 00:00:00 2001
From: Shengjiu Wang <shengjiu.wang@nxp.com>
Date: Tue, 7 May 2019 14:06:52 +0000
Subject: [PATCH] ASoC: fsl_sai: Move clock operation to PM runtime

Turn off/on clocks when device enters suspend/resume. This
can help saving power.

As a further optimization, we turn off/on mclk only when SAI
is in master mode because otherwise mclk is externally provided.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Viorel Suman <viorel.suman@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_sai.c | 54 +++++++++++++++++++++++++++++++++--------
 1 file changed, 44 insertions(+), 10 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 8593269156bd..d58cc3ae90d8 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -596,15 +596,8 @@ static int fsl_sai_startup(struct snd_pcm_substream *substream,
 {
 	struct fsl_sai *sai = snd_soc_dai_get_drvdata(cpu_dai);
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
-	struct device *dev = &sai->pdev->dev;
 	int ret;
 
-	ret = clk_prepare_enable(sai->bus_clk);
-	if (ret) {
-		dev_err(dev, "failed to enable bus clock: %d\n", ret);
-		return ret;
-	}
-
 	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx), FSL_SAI_CR3_TRCE,
 			   FSL_SAI_CR3_TRCE);
 
@@ -621,8 +614,6 @@ static void fsl_sai_shutdown(struct snd_pcm_substream *substream,
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 
 	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx), FSL_SAI_CR3_TRCE, 0);
-
-	clk_disable_unprepare(sai->bus_clk);
 }
 
 static const struct snd_soc_dai_ops fsl_sai_pcm_dai_ops = {
@@ -935,6 +926,14 @@ static int fsl_sai_runtime_suspend(struct device *dev)
 {
 	struct fsl_sai *sai = dev_get_drvdata(dev);
 
+	if (sai->mclk_streams & BIT(SNDRV_PCM_STREAM_CAPTURE))
+		clk_disable_unprepare(sai->mclk_clk[sai->mclk_id[0]]);
+
+	if (sai->mclk_streams & BIT(SNDRV_PCM_STREAM_PLAYBACK))
+		clk_disable_unprepare(sai->mclk_clk[sai->mclk_id[1]]);
+
+	clk_disable_unprepare(sai->bus_clk);
+
 	regcache_cache_only(sai->regmap, true);
 	regcache_mark_dirty(sai->regmap);
 
@@ -944,6 +943,25 @@ static int fsl_sai_runtime_suspend(struct device *dev)
 static int fsl_sai_runtime_resume(struct device *dev)
 {
 	struct fsl_sai *sai = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(sai->bus_clk);
+	if (ret) {
+		dev_err(dev, "failed to enable bus clock: %d\n", ret);
+		return ret;
+	}
+
+	if (sai->mclk_streams & BIT(SNDRV_PCM_STREAM_PLAYBACK)) {
+		ret = clk_prepare_enable(sai->mclk_clk[sai->mclk_id[1]]);
+		if (ret)
+			goto disable_bus_clk;
+	}
+
+	if (sai->mclk_streams & BIT(SNDRV_PCM_STREAM_CAPTURE)) {
+		ret = clk_prepare_enable(sai->mclk_clk[sai->mclk_id[0]]);
+		if (ret)
+			goto disable_tx_clk;
+	}
 
 	regcache_cache_only(sai->regmap, false);
 	regmap_write(sai->regmap, FSL_SAI_TCSR, FSL_SAI_CSR_SR);
@@ -951,7 +969,23 @@ static int fsl_sai_runtime_resume(struct device *dev)
 	usleep_range(1000, 2000);
 	regmap_write(sai->regmap, FSL_SAI_TCSR, 0);
 	regmap_write(sai->regmap, FSL_SAI_RCSR, 0);
-	return regcache_sync(sai->regmap);
+
+	ret = regcache_sync(sai->regmap);
+	if (ret)
+		goto disable_rx_clk;
+
+	return 0;
+
+disable_rx_clk:
+	if (sai->mclk_streams & BIT(SNDRV_PCM_STREAM_CAPTURE))
+		clk_disable_unprepare(sai->mclk_clk[sai->mclk_id[0]]);
+disable_tx_clk:
+	if (sai->mclk_streams & BIT(SNDRV_PCM_STREAM_PLAYBACK))
+		clk_disable_unprepare(sai->mclk_clk[sai->mclk_id[1]]);
+disable_bus_clk:
+	clk_disable_unprepare(sai->bus_clk);
+
+	return ret;
 }
 #endif /* CONFIG_PM */
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
