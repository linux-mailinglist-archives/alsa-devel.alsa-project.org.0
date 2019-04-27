Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 471ECB420
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Apr 2019 19:55:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC35A9F7;
	Sat, 27 Apr 2019 19:54:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC35A9F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556387729;
	bh=f24ghaz+3NXJxKgq2L4ICP0gred6XwZb3fIvterhFRg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=fppQEsGn78BtuoUaY0oD9JH3GLt6xX+wlCRJn2gkzBtVa3R/sqYK4iBLP8rC8eBih
	 EK9Bpj5Jr/g/pGNLGoBkYFgcra9PrImaveild1PvwNVIKJTXS8UrG/+A7mZbI+Y9av
	 F6rAZ8iufntew/zA0WZeBX1suk4MQenYL28BWKc8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A26BF8973A;
	Sat, 27 Apr 2019 19:53:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6AAC4F8068A; Sat, 27 Apr 2019 19:52:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F01FF8068A;
 Sat, 27 Apr 2019 19:52:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F01FF8068A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="CWgdJfGA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Z6UGoigKEjJiV4HPi04fJWNbQa3lVKsfIh0Dfe6Vu+8=; b=CWgdJfGAfGoO
 Tr3gNiuSlavzyYGvQaRIyyAy31ouATPB6CYpsGyddLMolCfwEM52eVeqJ5OhplPctt8KhX1xxTHai
 uzjykehoVAIbHtindaLTbeoCHwsTJUPGP4xE+td7bsCe2r9biMEWy0W3mgRkoA4mr7d/dWTvWmneR
 WGyPg=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hKRVC-0004np-JH; Sat, 27 Apr 2019 17:52:42 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 62AEE441D3C; Sat, 27 Apr 2019 18:52:39 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
In-Reply-To: <20190412160904.30418-21-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190427175239.62AEE441D3C@finisterre.ee.mobilebroadband>
Date: Sat, 27 Apr 2019 18:52:39 +0100 (BST)
Cc: Dragos Tarcatu <dragos_tarcatu@mentor.com>,
 Daniel Baluta <daniel.baluta@gmail.com>, sound-open-firmware@alsa-project.org,
 tiwai@suse.de, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, andriy.shevchenko@linux.intel.com,
 Alan Cox <alan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: Intel: Make sure BDW based machine
	drivers build for SOF" to the asoc tree
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

   ASoC: Intel: Make sure BDW based machine drivers build for SOF

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

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

From f35bf70f61d389754fafd7fce75efbb3bd2eea87 Mon Sep 17 00:00:00 2001
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Date: Fri, 12 Apr 2019 11:09:03 -0500
Subject: [PATCH] ASoC: Intel: Make sure BDW based machine drivers build for
 SOF

BDW uses hard coded IPC calls to set SSP, not needed in SOF as SSP is
configured via topology.

Signed-off-by: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/bdw-rt5677.c | 4 ++++
 sound/soc/intel/boards/broadwell.c  | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
index 1844c88ea4e2..6520a8ea5537 100644
--- a/sound/soc/intel/boards/bdw-rt5677.c
+++ b/sound/soc/intel/boards/bdw-rt5677.c
@@ -180,6 +180,7 @@ static const struct snd_soc_ops bdw_rt5677_ops = {
 	.hw_params = bdw_rt5677_hw_params,
 };
 
+#if !IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
 static int bdw_rt5677_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
@@ -198,6 +199,7 @@ static int bdw_rt5677_rtd_init(struct snd_soc_pcm_runtime *rtd)
 
 	return 0;
 }
+#endif
 
 static int bdw_rt5677_init(struct snd_soc_pcm_runtime *rtd)
 {
@@ -265,7 +267,9 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
 		.dynamic = 1,
 		.codec_name = "snd-soc-dummy",
 		.codec_dai_name = "snd-soc-dummy-dai",
+#if !IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
 		.init = bdw_rt5677_rtd_init,
+#endif
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST,
 			SND_SOC_DPCM_TRIGGER_POST
diff --git a/sound/soc/intel/boards/broadwell.c b/sound/soc/intel/boards/broadwell.c
index b86c746d9b7a..0f18f8964f51 100644
--- a/sound/soc/intel/boards/broadwell.c
+++ b/sound/soc/intel/boards/broadwell.c
@@ -131,6 +131,7 @@ static const struct snd_soc_ops broadwell_rt286_ops = {
 	.hw_params = broadwell_rt286_hw_params,
 };
 
+#if !IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
 static int broadwell_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
@@ -149,6 +150,7 @@ static int broadwell_rtd_init(struct snd_soc_pcm_runtime *rtd)
 
 	return 0;
 }
+#endif
 
 /* broadwell digital audio interface glue - connects codec <--> CPU */
 static struct snd_soc_dai_link broadwell_rt286_dais[] = {
@@ -161,7 +163,9 @@ static struct snd_soc_dai_link broadwell_rt286_dais[] = {
 		.dynamic = 1,
 		.codec_name = "snd-soc-dummy",
 		.codec_dai_name = "snd-soc-dummy-dai",
+#if !IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
 		.init = broadwell_rtd_init,
+#endif
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
