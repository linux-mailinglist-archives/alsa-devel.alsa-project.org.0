Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEC317FF95
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Mar 2020 14:56:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F2171655;
	Tue, 10 Mar 2020 14:55:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F2171655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583848587;
	bh=cSyrhKFQDkpnwz4A46OXpNXl+c8jlpyHJAMf5ez3Lhs=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=BOLy71ejTtbp9kVvGT0ZyrJACruD3xAHGUCOHxVdhdcG0zLx8rBdSZlrd0nltNjG7
	 M5nRi4Cua7lGGZPA29x93oc7nIIXm/5Vz1sZ1QdFR2MpK2k604qhkS0tR1lKpe1Yd7
	 lR5xk0nQ17s+WYzGeS6lod6nio8nnzlJWP1iknx0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3E7AF802C4;
	Tue, 10 Mar 2020 14:51:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AD4AF802C4; Tue, 10 Mar 2020 14:51:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 5C6A4F802BE
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 14:51:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C6A4F802BE
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E24EB30E;
 Tue, 10 Mar 2020 06:51:38 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 662A73F6CF;
 Tue, 10 Mar 2020 06:51:38 -0700 (PDT)
Date: Tue, 10 Mar 2020 13:51:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: meson: use for_each_rtd_codecs/cpus_dai() macro" to
 the asoc tree
In-Reply-To: <87y2sagoh7.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87y2sagoh7.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

   ASoC: meson: use for_each_rtd_codecs/cpus_dai() macro

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

From b5c52f5801c6e076377f7f411fb61bab86cb9542 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 9 Mar 2020 13:07:48 +0900
Subject: [PATCH] ASoC: meson: use for_each_rtd_codecs/cpus_dai() macro

This patch switch to use plural form macro.

	- for_each_rtd_codec_dai()
	+ for_each_rtd_codec_dais()

	- for_each_rtd_codec_dai_rollback()
	+ for_each_rtd_codec_dais_rollback()

	- for_each_rtd_cpu_dai()
	+ for_each_rtd_cpu_dais()

	- for_each_rtd_cpu_dai_rollback()
	+ for_each_rtd_cpu_dais_rollback()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87y2sagoh7.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/axg-card.c         | 2 +-
 sound/soc/meson/meson-card-utils.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 48651631bdcf..77a7d5f36ebf 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -60,7 +60,7 @@ static int axg_card_tdm_dai_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_dai *codec_dai;
 	int ret, i;
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		ret = snd_soc_dai_set_tdm_slot(codec_dai,
 					       be->codec_masks[i].tx,
 					       be->codec_masks[i].rx,
diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index a70d244ef88b..b5d3c9f56bac 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -23,7 +23,7 @@ int meson_card_i2s_set_sysclk(struct snd_pcm_substream *substream,
 
 	mclk = params_rate(params) * mclk_fs;
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		ret = snd_soc_dai_set_sysclk(codec_dai, 0, mclk,
 					     SND_SOC_CLOCK_IN);
 		if (ret && ret != -ENOTSUPP)
-- 
2.20.1

