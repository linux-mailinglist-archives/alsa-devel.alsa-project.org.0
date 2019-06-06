Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3718F38144
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 00:51:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE21B1721;
	Fri,  7 Jun 2019 00:50:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE21B1721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559861484;
	bh=h6zyfKVmjg0Rrug62tEM2MgXDGcwLgUk4GGoreUMt0k=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=GO7SELG/HN9dEwV8IFtUnRzkon9Wi5MfnBz4wRuUKOWD+5410RsglDk1U9TlHd+eg
	 E99cAHoYffD1gXnRanJ2SzJdSEPZMIeM8HLC8Srxf6848e1RBzinDZ8mU4Ni5k/zN/
	 3YFGa5lvEovjdBfUzvjrZh7XuSL0u0xZJwuAcycU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 792D4F899FE;
	Thu,  6 Jun 2019 23:31:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03EDAF89883; Thu,  6 Jun 2019 23:29:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68918F897F0
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:27:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68918F897F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="l8Q/F9jJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=jjH/nSQ7tt9s2ZTp5Qrvm0YDNS+dnVBIk/fCKfFTmX0=; b=l8Q/F9jJI8iJ
 0TzCVlUButBwkt5hkgjMt/tTFVe1tZAAQO3HFKi3eK3ooKlpv1khRjv2FrGQKCJHQlE7H7tuwWUap
 VUHGqC4GcbQ9TqPzlhrV70sfKdh9UNgDxVHCHduoZzwyXIIfTi5c6w+KjNb1Fkrpk2NWvFWPPKM76
 dH9/4=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzuc-0007T6-VT; Thu, 06 Jun 2019 21:27:07 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 6E952440049; Thu,  6 Jun 2019 22:27:06 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87lfyfl664.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212706.6E952440049@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:27:06 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: samsung: speyside: use modern dai_link
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

   ASoC: samsung: speyside: use modern dai_link style

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

From 3f60911771a10a8f87e56e61deb501a054c2ea0c Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:09:50 +0900
Subject: [PATCH] ASoC: samsung: speyside: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/speyside.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/sound/soc/samsung/speyside.c b/sound/soc/samsung/speyside.c
index 15465c84daa3..51e4c976c8be 100644
--- a/sound/soc/samsung/speyside.c
+++ b/sound/soc/samsung/speyside.c
@@ -189,39 +189,45 @@ static const struct snd_soc_pcm_stream dsp_codec_params = {
 	.channels_max = 2,
 };
 
+SND_SOC_DAILINK_DEFS(cpu_dsp,
+	DAILINK_COMP_ARRAY(COMP_CPU("samsung-i2s.0")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("spi0.0", "wm0010-sdi1")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("samsung-i2s.0")));
+
+SND_SOC_DAILINK_DEFS(dsp_codec,
+	DAILINK_COMP_ARRAY(COMP_CPU("wm0010-sdi2")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("wm8996.1-001a", "wm8996-aif1")));
+
+SND_SOC_DAILINK_DEFS(baseband,
+	DAILINK_COMP_ARRAY(COMP_CPU("wm8996-aif2")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("wm1250-ev1.1-0027", "wm1250-ev1")));
+
 static struct snd_soc_dai_link speyside_dai[] = {
 	{
 		.name = "CPU-DSP",
 		.stream_name = "CPU-DSP",
-		.cpu_dai_name = "samsung-i2s.0",
-		.codec_dai_name = "wm0010-sdi1",
-		.platform_name = "samsung-i2s.0",
-		.codec_name = "spi0.0",
 		.init = speyside_wm0010_init,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
+		SND_SOC_DAILINK_REG(cpu_dsp),
 	},
 	{
 		.name = "DSP-CODEC",
 		.stream_name = "DSP-CODEC",
-		.cpu_dai_name = "wm0010-sdi2",
-		.codec_dai_name = "wm8996-aif1",
-		.codec_name = "wm8996.1-001a",
 		.init = speyside_wm8996_init,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
 		.params = &dsp_codec_params,
 		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(dsp_codec),
 	},
 	{
 		.name = "Baseband",
 		.stream_name = "Baseband",
-		.cpu_dai_name = "wm8996-aif2",
-		.codec_dai_name = "wm1250-ev1",
-		.codec_name = "wm1250-ev1.1-0027",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
 		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(baseband),
 	},
 };
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
