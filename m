Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 082C537FDA
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 23:47:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9309C11C;
	Thu,  6 Jun 2019 23:46:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9309C11C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559857658;
	bh=5rbYF5FzZoTnpAp1XvixEsCZcOuiVMl43K0Zbt1PCt0=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Ho7vsh7y/AHxUY37yfYYtZZsPYeZH/dcc09cWc0Vatx4oHKu/gb5SpFZHZMuZMwHO
	 QQ8b2SUUF5x8knlK6w1AOCZatXa+B7R4imG4wbPpoV1upQS/5lrbkq7VyQ5FKaFjP+
	 e2B1kRdPMDM89I5CHrX4iqt93fim8yIgHh57DPAA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C868BF89743;
	Thu,  6 Jun 2019 23:27:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 471C0F897C5; Thu,  6 Jun 2019 23:26:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8388F8974E
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8388F8974E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="sMYEP9rs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=4J37ThSsd/NaBK2zh5SltMA/dnVsWmUGQEgVs94ICpY=; b=sMYEP9rsNlpz
 U46OW6LeY6+5SVTyBWQ2wPBdBUHYt9xTEU4w3/IMBAyyoMcDQzsOJJl00MkxLthL3ECWiOuQfSS7F
 tVogv25kQNsc+8kzTqNQl6VETWV8mZvcuQTiAvrYQd0R6fVozS1nqtedlu+CdYxFPk5Z+D4kt+kaF
 +ToMI=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYztl-0007Jj-D5; Thu, 06 Jun 2019 21:26:13 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id DA5C1440049; Thu,  6 Jun 2019 22:26:12 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r287fjg8.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212612.DA5C1440049@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:12 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: Intel: bdw-rt5677: use modern dai_link
	style" to the asoc tree
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

   ASoC: Intel: bdw-rt5677: use modern dai_link style

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

From 3f6c2a2e9abe1ac636a49ad96dfbb42ce8d39be9 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:19:30 +0900
Subject: [PATCH] ASoC: Intel: bdw-rt5677: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/bdw-rt5677.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
index 6520a8ea5537..ff32be5af019 100644
--- a/sound/soc/intel/boards/bdw-rt5677.c
+++ b/sound/soc/intel/boards/bdw-rt5677.c
@@ -257,16 +257,24 @@ static int bdw_rt5677_init(struct snd_soc_pcm_runtime *rtd)
 }
 
 /* broadwell digital audio interface glue - connects codec <--> CPU */
+SND_SOC_DAILINK_DEF(dummy,
+	DAILINK_COMP_ARRAY(COMP_DUMMY()));
+
+SND_SOC_DAILINK_DEF(fe,
+	DAILINK_COMP_ARRAY(COMP_CPU("System Pin")));
+
+SND_SOC_DAILINK_DEF(platform,
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("haswell-pcm-audio")));
+
+SND_SOC_DAILINK_DEF(be,
+	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-RT5677CE:00", "rt5677-aif1")));
+
 static struct snd_soc_dai_link bdw_rt5677_dais[] = {
 	/* Front End DAI links */
 	{
 		.name = "System PCM",
 		.stream_name = "System Playback/Capture",
-		.cpu_dai_name = "System Pin",
-		.platform_name = "haswell-pcm-audio",
 		.dynamic = 1,
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 #if !IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
 		.init = bdw_rt5677_rtd_init,
 #endif
@@ -276,6 +284,7 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
 		},
 		.dpcm_capture = 1,
 		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(fe, dummy, platform),
 	},
 
 	/* Back End DAI links */
@@ -283,11 +292,7 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
 		/* SSP0 - Codec */
 		.name = "Codec",
 		.id = 0,
-		.cpu_dai_name = "snd-soc-dummy-dai",
-		.platform_name = "snd-soc-dummy",
 		.no_pcm = 1,
-		.codec_name = "i2c-RT5677CE:00",
-		.codec_dai_name = "rt5677-aif1",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
 		.ignore_suspend = 1,
@@ -297,6 +302,7 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.init = bdw_rt5677_init,
+		SND_SOC_DAILINK_REG(dummy, be, dummy),
 	},
 };
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
