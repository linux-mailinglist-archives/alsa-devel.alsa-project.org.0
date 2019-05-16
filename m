Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FF52034D
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 12:19:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 150BB16AF;
	Thu, 16 May 2019 12:18:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 150BB16AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558001976;
	bh=4Cuj8H0VqbppX+XbGI/zCdECG6Vhr8vw834XoFlLX3I=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=dS0GSZPf4K59eYM5a0zgQJAg0EDKs1rbvYQ1wiXA8tX4zxkxLvieEQQ3+Du7qigZh
	 cSSHTfiQPijoK2R9qnKyqiDKnJTEvACJzgYNuM1dHGat1ltnJF9DOQmVII+PIYab7J
	 YJ7kgQnHt4JJ9S3xsr9BkXI7VzkFyERTCg0c3SuQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4060F8972C;
	Thu, 16 May 2019 12:17:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5CD0F8972B; Thu, 16 May 2019 12:17:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCD37F896B7
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 12:17:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCD37F896B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="U/gmXu9m"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=oDBnrhZivGsdJVR9kCjrFKov0JC/wAnshgL0vB1Lk0c=; b=U/gmXu9m66oy
 rPIO016chld9Z5klq0B3sWRNk11EdcDjgfjhGAgk4Gi+HRW8rnKUuwBPxSlav0KoPqBGlJSBDNo1x
 1KRHEwowxrbyxjpUfAyiYO6lBUlgsK3dBt5/EOiXUjrdKcwSgQZ0doBVeUTYMV6Sr0RReURjMijN8
 G9lXc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hRDRv-00062G-PK; Thu, 16 May 2019 10:17:19 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 3E67A1126D46; Thu, 16 May 2019 11:17:16 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Shunli Wang <shunli.wang@mediatek.com>
In-Reply-To: <20190516095438.15759-2-shunli.wang@mediatek.com>
X-Patchwork-Hint: ignore
Message-Id: <20190516101716.3E67A1126D46@debutante.sirena.org.uk>
Date: Thu, 16 May 2019 11:17:16 +0100 (BST)
Cc: alsa-devel@alsa-project.org, srv_heupstream@mediatek.com,
 garlic.tseng@mediatek.com, jiaxin.yu@mediatek.com, tzungbi@google.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 shunli.wang@mediatek.com, kaichieh.chuang@mediatek.com
Subject: [alsa-devel] Applied "ASoC: Mediatek: add memory interface data
	align" to the asoc tree
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

   ASoC: Mediatek: add memory interface data align

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

From 1628fc3f47717fc3c8d9cd5fd6c7bc7d3796927d Mon Sep 17 00:00:00 2001
From: Shunli Wang <shunli.wang@mediatek.com>
Date: Thu, 16 May 2019 17:54:37 +0800
Subject: [PATCH] ASoC: Mediatek: add memory interface data align

This supports two data align settings. One is S32_LE and
other is S24_LE.

Signed-off-by: Shunli Wang <shunli.wang@mediatek.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 7 +++++++
 sound/soc/mediatek/common/mtk-base-afe.h   | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index fded11d14cde..19048c3dc324 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -241,6 +241,7 @@ int mtk_afe_fe_prepare(struct snd_pcm_substream *substream,
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mtk_base_afe_memif *memif = &afe->memif[rtd->cpu_dai->id];
 	int hd_audio = 0;
+	int hd_align = 1;
 
 	/* set hd mode */
 	switch (substream->runtime->format) {
@@ -249,9 +250,11 @@ int mtk_afe_fe_prepare(struct snd_pcm_substream *substream,
 		break;
 	case SNDRV_PCM_FORMAT_S32_LE:
 		hd_audio = 1;
+		hd_align = 1;
 		break;
 	case SNDRV_PCM_FORMAT_S24_LE:
 		hd_audio = 1;
+		hd_align = 0;
 		break;
 	default:
 		dev_err(afe->dev, "%s() error: unsupported format %d\n",
@@ -262,6 +265,10 @@ int mtk_afe_fe_prepare(struct snd_pcm_substream *substream,
 	mtk_regmap_update_bits(afe->regmap, memif->data->hd_reg,
 			       1, hd_audio, memif->data->hd_shift);
 
+	mtk_regmap_update_bits(afe->regmap, memif->data->hd_align_reg,
+			       memif->data->hd_align_mshift,
+			       hd_align ? memif->data->hd_align_mshift : 0);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mtk_afe_fe_prepare);
diff --git a/sound/soc/mediatek/common/mtk-base-afe.h b/sound/soc/mediatek/common/mtk-base-afe.h
index bd8d5e0c6843..60cb609a9790 100644
--- a/sound/soc/mediatek/common/mtk-base-afe.h
+++ b/sound/soc/mediatek/common/mtk-base-afe.h
@@ -24,7 +24,9 @@ struct mtk_base_memif_data {
 	int enable_reg;
 	int enable_shift;
 	int hd_reg;
+	int hd_align_reg;
 	int hd_shift;
+	int hd_align_mshift;
 	int msb_reg;
 	int msb_shift;
 	int agent_disable_reg;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
