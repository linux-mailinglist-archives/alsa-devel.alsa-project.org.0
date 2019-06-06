Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 697583816D
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 00:59:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5B90176E;
	Fri,  7 Jun 2019 00:58:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5B90176E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559861958;
	bh=KDaUga5UuAd8M0sPUkFjpmKAvXL6SZa95MK6T2SndVU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=U/219KEJE29y83uZIIdw0D8MM3BmORmW3dlY5AOsNliINdSP4gh9KaAARAOmGrieJ
	 5sPkPS0fY5QC7WvskFHXmJNn/tDBimqRr362pAuO3jKJHPRusqrIlkLBikEbxvy2p7
	 sK0qug5hl6Uo+ramVXSchQXSPD74Nm0iVTxnitLA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83A41F89A3E;
	Thu,  6 Jun 2019 23:31:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40EB0F8989A; Thu,  6 Jun 2019 23:29:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22425F8976D
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:27:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22425F8976D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="bmt1UEFc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=KfbGo85I0JCZylz2dg1eVJOIzeq0TSvmSMdNbOTMRX0=; b=bmt1UEFcQEqx
 qeYCMLs3xOeYSBzEG2exiC/+DtL6kD81MbDwxeWsPTOvrqEvuo3Swz8347tK2TIyNZkV8kn5MTvfP
 S9d/iIdTdEP2QyJ4Nxdofwy5i8Bpd80GJK+TUAYaAutLlKNThTJT3JnKP2iQwz0bLQhEeEsqiXK2p
 9yPyA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzuh-0007Ty-Tg; Thu, 06 Jun 2019 21:27:11 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 6D44B440046; Thu,  6 Jun 2019 22:27:11 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87y32fl67n.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212711.6D44B440046@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:27:11 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: samsung: bells: use modern dai_link
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

   ASoC: samsung: bells: use modern dai_link style

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

From 5af5e7609af5e1e82bc6fdc617e0b1f5ef3be5e3 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:08:55 +0900
Subject: [PATCH] ASoC: samsung: bells: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/bells.c | 87 ++++++++++++++++++++++++---------------
 1 file changed, 54 insertions(+), 33 deletions(-)

diff --git a/sound/soc/samsung/bells.c b/sound/soc/samsung/bells.c
index 770845e2507a..b60b2268b608 100644
--- a/sound/soc/samsung/bells.c
+++ b/sound/soc/samsung/bells.c
@@ -242,119 +242,140 @@ static const struct snd_soc_pcm_stream sub_params = {
 	.channels_max = 2,
 };
 
+SND_SOC_DAILINK_DEFS(wm2200_cpu_dsp,
+	DAILINK_COMP_ARRAY(COMP_CPU("samsung-i2s.0")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("spi0.0", "wm0010-sdi1")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("samsung-i2s.0")));
+
+SND_SOC_DAILINK_DEFS(wm2200_dsp_codec,
+	DAILINK_COMP_ARRAY(COMP_CPU("wm0010-sdi2")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("wm2200.1-003a", "wm2200")));
+
 static struct snd_soc_dai_link bells_dai_wm2200[] = {
 	{
 		.name = "CPU-DSP",
 		.stream_name = "CPU-DSP",
-		.cpu_dai_name = "samsung-i2s.0",
-		.codec_dai_name = "wm0010-sdi1",
-		.platform_name = "samsung-i2s.0",
-		.codec_name = "spi0.0",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
+		SND_SOC_DAILINK_REG(wm2200_cpu_dsp),
 	},
 	{
 		.name = "DSP-CODEC",
 		.stream_name = "DSP-CODEC",
-		.cpu_dai_name = "wm0010-sdi2",
-		.codec_dai_name = "wm2200",
-		.codec_name = "wm2200.1-003a",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
 		.params = &sub_params,
 		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(wm2200_dsp_codec),
 	},
 };
 
+SND_SOC_DAILINK_DEFS(wm5102_cpu_dsp,
+	DAILINK_COMP_ARRAY(COMP_CPU("samsung-i2s.0")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("spi0.0", "wm0010-sdi1")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("samsung-i2s.0")));
+
+SND_SOC_DAILINK_DEFS(wm5102_dsp_codec,
+	DAILINK_COMP_ARRAY(COMP_CPU("wm0010-sdi2")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("wm5102-codec", "wm5102-aif1")));
+
+SND_SOC_DAILINK_DEFS(wm5102_baseband,
+	DAILINK_COMP_ARRAY(COMP_CPU("wm5102-aif2")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("wm1250-ev1.1-0027", "wm1250-ev1")));
+
+SND_SOC_DAILINK_DEFS(wm5102_sub,
+	DAILINK_COMP_ARRAY(COMP_CPU("wm5102-aif3")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("wm9081.1-006c", "wm9081-hifi")));
+
 static struct snd_soc_dai_link bells_dai_wm5102[] = {
 	{
 		.name = "CPU-DSP",
 		.stream_name = "CPU-DSP",
-		.cpu_dai_name = "samsung-i2s.0",
-		.codec_dai_name = "wm0010-sdi1",
-		.platform_name = "samsung-i2s.0",
-		.codec_name = "spi0.0",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
+		SND_SOC_DAILINK_REG(wm5102_cpu_dsp),
 	},
 	{
 		.name = "DSP-CODEC",
 		.stream_name = "DSP-CODEC",
-		.cpu_dai_name = "wm0010-sdi2",
-		.codec_dai_name = "wm5102-aif1",
-		.codec_name = "wm5102-codec",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
 		.params = &sub_params,
 		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(wm5102_dsp_codec),
 	},
 	{
 		.name = "Baseband",
 		.stream_name = "Baseband",
-		.cpu_dai_name = "wm5102-aif2",
-		.codec_dai_name = "wm1250-ev1",
-		.codec_name = "wm1250-ev1.1-0027",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
 		.ignore_suspend = 1,
 		.params = &baseband_params,
+		SND_SOC_DAILINK_REG(wm5102_baseband),
 	},
 	{
 		.name = "Sub",
 		.stream_name = "Sub",
-		.cpu_dai_name = "wm5102-aif3",
-		.codec_dai_name = "wm9081-hifi",
-		.codec_name = "wm9081.1-006c",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBS_CFS,
 		.ignore_suspend = 1,
 		.params = &sub_params,
+		SND_SOC_DAILINK_REG(wm5102_sub),
 	},
 };
 
+SND_SOC_DAILINK_DEFS(wm5110_cpu_dsp,
+	DAILINK_COMP_ARRAY(COMP_CPU("samsung-i2s.0")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("spi0.0", "wm0010-sdi1")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("samsung-i2s.0")));
+
+SND_SOC_DAILINK_DEFS(wm5110_dsp_codec,
+	DAILINK_COMP_ARRAY(COMP_CPU("wm0010-sdi2")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("wm5110-codec", "wm5110-aif1")));
+
+SND_SOC_DAILINK_DEFS(wm5110_baseband,
+	DAILINK_COMP_ARRAY(COMP_CPU("wm5110-aif2")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("wm1250-ev1.1-0027", "wm1250-ev1")));
+
+
+SND_SOC_DAILINK_DEFS(wm5110_sub,
+	DAILINK_COMP_ARRAY(COMP_CPU("wm5110-aif3")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("wm9081.1-006c", "wm9081-hifi")));
+
 static struct snd_soc_dai_link bells_dai_wm5110[] = {
 	{
 		.name = "CPU-DSP",
 		.stream_name = "CPU-DSP",
-		.cpu_dai_name = "samsung-i2s.0",
-		.codec_dai_name = "wm0010-sdi1",
-		.platform_name = "samsung-i2s.0",
-		.codec_name = "spi0.0",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
+		SND_SOC_DAILINK_REG(wm5110_cpu_dsp),
 	},
 	{
 		.name = "DSP-CODEC",
 		.stream_name = "DSP-CODEC",
-		.cpu_dai_name = "wm0010-sdi2",
-		.codec_dai_name = "wm5110-aif1",
-		.codec_name = "wm5110-codec",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
 		.params = &sub_params,
 		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(wm5110_dsp_codec),
 	},
 	{
 		.name = "Baseband",
 		.stream_name = "Baseband",
-		.cpu_dai_name = "wm5110-aif2",
-		.codec_dai_name = "wm1250-ev1",
-		.codec_name = "wm1250-ev1.1-0027",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
 		.ignore_suspend = 1,
 		.params = &baseband_params,
+		SND_SOC_DAILINK_REG(wm5110_baseband),
 	},
 	{
 		.name = "Sub",
 		.stream_name = "Sub",
-		.cpu_dai_name = "wm5110-aif3",
-		.codec_dai_name = "wm9081-hifi",
-		.codec_name = "wm9081.1-006c",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBS_CFS,
 		.ignore_suspend = 1,
 		.params = &sub_params,
+		SND_SOC_DAILINK_REG(wm5110_sub),
 	},
 };
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
