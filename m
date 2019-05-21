Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACED625978
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 22:52:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A08915E4;
	Tue, 21 May 2019 22:51:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A08915E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558471922;
	bh=eVawCS9wZLg3UFlIVZBLjQtuEucINl1c+VU/1Qiuuic=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=UC3ul9vI5Po38toB6ZoVm3AgZk/8CpVMUHFVowCroSQ72iOeT4pMiBQ2ys4dfjlHu
	 l8bqtyjpV2quJ9sQVtw30Hff1ZBqL6NeWAcWBctVNlBUPF/BniSRvf6U66KfozfHFb
	 oD3l/lUUvN9Jy7VFivq13mkUYr1sgZ7aHv7ZaEZk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2839BF89732;
	Tue, 21 May 2019 22:47:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6103CF89738; Tue, 21 May 2019 22:47:46 +0200 (CEST)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02C2BF89715
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 22:32:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02C2BF89715
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="vLtGG5tf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=TUlpK2unIF2IGy4lMVx7T6Bwj9nXmh9dGW604PLl3uU=; b=vLtGG5tfiVAK
 y1Yyv0O4E17dqqeea0QJYJPX0jfbPGTgaYQHGygqphSdVJu+YCwUDLjvpgqGColt30hfNvhr+qJ1M
 zn8t5+IBhSAexv/+N1vzj2FZitjAmQNhBMCyxuK3YZvl4AUKS3vPdnvU6h9qHC+PqBSmSa+l6ChQ2
 7iraQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hTBRI-0001ym-07; Tue, 21 May 2019 20:32:48 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id E20DC1126D20; Tue, 21 May 2019 21:32:42 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Shunli Wang <shunli.wang@mediatek.com>
In-Reply-To: <20190520082420.11236-1-shunli.wang@mediatek.com>
X-Patchwork-Hint: ignore
Message-Id: <20190521203242.E20DC1126D20@debutante.sirena.org.uk>
Date: Tue, 21 May 2019 21:32:42 +0100 (BST)
Cc: alsa-devel@alsa-project.org, srv_heupstream@mediatek.com,
 garlic.tseng@mediatek.com, jiaxin.yu@mediatek.com, tzungbi@google.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 shunli.wang@mediatek.com, kaichieh.chuang@mediatek.com
Subject: [alsa-devel] Applied "ASoC: Mediatek: MT8183: enable IIR filter" to
	the asoc tree
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

   ASoC: Mediatek: MT8183: enable IIR filter

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

From 326b18176353d26df54dbc8b4b75ed4332898f61 Mon Sep 17 00:00:00 2001
From: Shunli Wang <shunli.wang@mediatek.com>
Date: Mon, 20 May 2019 16:24:20 +0800
Subject: [PATCH] ASoC: Mediatek: MT8183: enable IIR filter

IIR fileter can remove DC offset. It must be enabled when
dmic or amic connected to pmic is used.

Signed-off-by: Shunli Wang <shunli.wang@mediatek.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/mt8183/mt8183-dai-adda.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-dai-adda.c b/sound/soc/mediatek/mt8183/mt8183-dai-adda.c
index 017d7d1d9148..2b758a18c2ea 100644
--- a/sound/soc/mediatek/mt8183/mt8183-dai-adda.c
+++ b/sound/soc/mediatek/mt8183/mt8183-dai-adda.c
@@ -176,9 +176,6 @@ static int mtk_adda_ul_event(struct snd_soc_dapm_widget *w,
 	case SND_SOC_DAPM_POST_PMD:
 		/* should delayed 1/fs(smallest is 8k) = 125us before afe off */
 		usleep_range(125, 135);
-
-		/* reset dmic */
-		afe_priv->mtkaif_dmic = 0;
 		break;
 	default:
 		break;
@@ -426,6 +423,17 @@ static int mtk_dai_adda_hw_params(struct snd_pcm_substream *substream,
 
 		ul_src_con0 |= (voice_mode << 17) & (0x7 << 17);
 
+		/* enable iir */
+		ul_src_con0 |= (1 << UL_IIR_ON_TMP_CTL_SFT) &
+			       UL_IIR_ON_TMP_CTL_MASK_SFT;
+
+		/* 35Hz @ 48k */
+		regmap_write(afe->regmap, AFE_ADDA_IIR_COEF_02_01, 0x00000000);
+		regmap_write(afe->regmap, AFE_ADDA_IIR_COEF_04_03, 0x00003FB8);
+		regmap_write(afe->regmap, AFE_ADDA_IIR_COEF_06_05, 0x3FB80000);
+		regmap_write(afe->regmap, AFE_ADDA_IIR_COEF_08_07, 0x3FB80000);
+		regmap_write(afe->regmap, AFE_ADDA_IIR_COEF_10_09, 0x0000C048);
+
 		regmap_write(afe->regmap, AFE_ADDA_UL_SRC_CON0, ul_src_con0);
 
 		/* mtkaif_rxif_data_mode = 0, amic */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
