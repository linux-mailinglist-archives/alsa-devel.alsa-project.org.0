Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC37195A3F
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 16:48:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0BE11692;
	Fri, 27 Mar 2020 16:48:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0BE11692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585324132;
	bh=4MOGHG/1961l6veDfg+50ZtxhAjGZ/zFWWi1MZ1KEmU=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=AJ6oFS1q7Bv2hE+/rOCsbgKAFy8I1HQVOXF6crTaaSD1g4mIKfQrI59cQERrufAHt
	 R4kj6gW0+kPPRCidxD8e2NeP9JEHuEa88u2UkZf6wHNI+wSF0cwPerD0NSzHnArGWB
	 ll1YOmZxnmBcO+tjurR5ADR0rlefw9vcDY4HKtuA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF5E1F8037E;
	Fri, 27 Mar 2020 16:35:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE6B1F8037F; Fri, 27 Mar 2020 16:35:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 4C601F8036D
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 16:35:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C601F8036D
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A110F1FB;
 Fri, 27 Mar 2020 08:35:10 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 24D1F3F71F;
 Fri, 27 Mar 2020 08:35:10 -0700 (PDT)
Date: Fri, 27 Mar 2020 15:35:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: sprd: use asoc_rtd_to_cpu() / asoc_rtd_to_codec()
 macro for DAI pointer" to the asoc tree
In-Reply-To: <87blonir4j.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87blonir4j.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: sprd: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer

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

From 82d4c713335381651a5e2cff085ab150ad5de03d Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 23 Mar 2020 14:20:44 +0900
Subject: [PATCH] ASoC: sprd: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro
 for DAI pointer

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87blonir4j.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sprd/sprd-pcm-compress.c | 4 ++--
 sound/soc/sprd/sprd-pcm-dma.c      | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sprd/sprd-pcm-compress.c b/sound/soc/sprd/sprd-pcm-compress.c
index 6cddf551bc11..74d48340cade 100644
--- a/sound/soc/sprd/sprd-pcm-compress.c
+++ b/sound/soc/sprd/sprd-pcm-compress.c
@@ -135,7 +135,7 @@ static int sprd_platform_compr_dma_config(struct snd_compr_stream *cstream,
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct device *dev = component->dev;
-	struct sprd_compr_data *data = snd_soc_dai_get_drvdata(rtd->cpu_dai);
+	struct sprd_compr_data *data = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
 	struct sprd_pcm_dma_params *dma_params = data->dma_params;
 	struct sprd_compr_dma *dma = &stream->dma[channel];
 	struct dma_slave_config config = { };
@@ -321,7 +321,7 @@ static int sprd_platform_compr_open(struct snd_compr_stream *cstream)
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct device *dev = component->dev;
-	struct sprd_compr_data *data = snd_soc_dai_get_drvdata(rtd->cpu_dai);
+	struct sprd_compr_data *data = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
 	struct sprd_compr_stream *stream;
 	struct sprd_compr_callback cb;
 	int stream_id = cstream->direction, ret;
diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.c
index 2284558684bc..d12d3cad8cbd 100644
--- a/sound/soc/sprd/sprd-pcm-dma.c
+++ b/sound/soc/sprd/sprd-pcm-dma.c
@@ -200,7 +200,7 @@ static int sprd_pcm_hw_params(struct snd_soc_component *component,
 	unsigned long flags;
 	int ret, i, j, sg_num;
 
-	dma_params = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
+	dma_params = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
 	if (!dma_params) {
 		dev_warn(component->dev, "no dma parameters setting\n");
 		dma_private->params = NULL;
-- 
2.20.1

