Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B3B17FFA0
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Mar 2020 14:57:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EBD4851;
	Tue, 10 Mar 2020 14:56:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EBD4851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583848660;
	bh=cci6OOacWW6NLCoh2T+wobCBip4PcBDnjL/svCJRmUY=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=rHW/Se8YNNxBBuxzxX+1A7vf76zPqh29IenL4My6if4VIDD/+dhv+bl1SLbNCEdRy
	 7wjg+Wn22k/+eIs+w1Iryi6NbnAU5Rq+a3PS70oiHbaOM5dkzusjD6bO5HdFBiNts7
	 qFUNwJY9qNoC4YkINcnhHsqrpudH24Nyb3BWOFjg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8321AF802E2;
	Tue, 10 Mar 2020 14:51:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 750CDF802E2; Tue, 10 Mar 2020 14:51:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 2F8E2F802E0
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 14:51:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F8E2F802E0
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BFA7330E;
 Tue, 10 Mar 2020 06:51:47 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 433483F6CF;
 Tue, 10 Mar 2020 06:51:47 -0700 (PDT)
Date: Tue, 10 Mar 2020 13:51:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: Intel: use for_each_rtd_codecs/cpus_dai() macro" to
 the asoc tree
In-Reply-To: <871rq2i320.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-871rq2i320.wl-kuninori.morimoto.gx@renesas.com>
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

   ASoC: Intel: use for_each_rtd_codecs/cpus_dai() macro

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

From 5dd1677c81c09932afad4dba2759dff7cf33ecbe Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 9 Mar 2020 13:07:35 +0900
Subject: [PATCH] ASoC: Intel: use for_each_rtd_codecs/cpus_dai() macro

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
Link: https://lore.kernel.org/r/871rq2i320.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/cml_rt1011_rt5682.c          | 2 +-
 sound/soc/intel/boards/kbl_da7219_max98927.c        | 4 ++--
 sound/soc/intel/boards/kbl_rt5663_max98927.c        | 2 +-
 sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/boards/cml_rt1011_rt5682.c b/sound/soc/intel/boards/cml_rt1011_rt5682.c
index 02aa18d24319..2a6e5b124099 100644
--- a/sound/soc/intel/boards/cml_rt1011_rt5682.c
+++ b/sound/soc/intel/boards/cml_rt1011_rt5682.c
@@ -164,7 +164,7 @@ static int cml_rt1011_hw_params(struct snd_pcm_substream *substream,
 
 	srate = params_rate(params);
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 
 		/* 100 Fs to drive 24 bit data */
 		ret = snd_soc_dai_set_pll(codec_dai, 0, RT1011_PLL1_S_BCLK,
diff --git a/sound/soc/intel/boards/kbl_da7219_max98927.c b/sound/soc/intel/boards/kbl_da7219_max98927.c
index 88f69e3697d2..0ceb1748a262 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98927.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98927.c
@@ -179,7 +179,7 @@ static int kabylake_ssp0_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai;
 	int ret, j;
 
-	for_each_rtd_codec_dai(runtime, j, codec_dai) {
+	for_each_rtd_codec_dais(runtime, j, codec_dai) {
 
 		if (!strcmp(codec_dai->component->name, MAX98927_DEV0_NAME)) {
 			ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x30, 3, 8, 16);
@@ -224,7 +224,7 @@ static int kabylake_ssp0_trigger(struct snd_pcm_substream *substream, int cmd)
 	struct snd_soc_dai *codec_dai;
 	int j, ret;
 
-	for_each_rtd_codec_dai(rtd, j, codec_dai) {
+	for_each_rtd_codec_dais(rtd, j, codec_dai) {
 		const char *name = codec_dai->component->name;
 		struct snd_soc_component *component = codec_dai->component;
 		struct snd_soc_dapm_context *dapm =
diff --git a/sound/soc/intel/boards/kbl_rt5663_max98927.c b/sound/soc/intel/boards/kbl_rt5663_max98927.c
index d8f2ff7139a9..f65feee1c166 100644
--- a/sound/soc/intel/boards/kbl_rt5663_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_max98927.c
@@ -472,7 +472,7 @@ static int kabylake_ssp0_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai;
 	int ret = 0, j;
 
-	for_each_rtd_codec_dai(rtd, j, codec_dai) {
+	for_each_rtd_codec_dais(rtd, j, codec_dai) {
 		if (!strcmp(codec_dai->component->name, MAXIM_DEV0_NAME)) {
 			/*
 			 * Use channel 4 and 5 for the first amp
diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
index 96c814f36458..341bb47311a6 100644
--- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
@@ -399,7 +399,7 @@ static int kabylake_ssp0_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai;
 	int ret = 0, j;
 
-	for_each_rtd_codec_dai(rtd, j, codec_dai) {
+	for_each_rtd_codec_dais(rtd, j, codec_dai) {
 		if (!strcmp(codec_dai->component->name, RT5514_DEV_NAME)) {
 			ret = snd_soc_dai_set_tdm_slot(codec_dai, 0xF, 0, 8, 16);
 			if (ret < 0) {
-- 
2.20.1

