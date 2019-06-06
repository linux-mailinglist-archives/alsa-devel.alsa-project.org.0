Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC2C380A8
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 00:28:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCA1F1701;
	Fri,  7 Jun 2019 00:27:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCA1F1701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559860107;
	bh=7cmMEaZrPzJGJlbcvhuKeijYpniTJjSOTKYW22Ti4Pg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=tpDmuN/OE/2oSYGgSww9qhmVGeRntGZg8WU7Ipc6DmNsjoCc0p8yYAK9zSRsMtt0n
	 5/9F1TvMW8gnEXtiIm1yhrji31Q/sCm464wY/2HjiWlD5Wl33Yq5OQFA7yeAypCMHM
	 HCti0XbxcISipagYgPPDK7NIfWKnLosyOt5b1f50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 277DEF8993A;
	Thu,  6 Jun 2019 23:30:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F3E3F8984F; Thu,  6 Jun 2019 23:28:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B000F8974B
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B000F8974B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ExHQcxrH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=okRsYNtE6dDC3TfmL8Rmi2f/pNA2MRd0KZ1dOpFxFhk=; b=ExHQcxrHgOji
 TlQDOUDBpxPjBq+5kqc5Rogf45kmw1uJlfDcsDPycCy77GV93BdCElNW6YGXg3FjLQYNyC8p+PBnt
 xETunPSrjhAeSgCKSMcx+ZtVX+5H92LNs6wLV2PUHjA4iueGINMFqEOR7wRfRaC4zRKtKy9w9F/SQ
 UrDtY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzuJ-0007Po-RD; Thu, 06 Jun 2019 21:26:47 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 5730B440046; Thu,  6 Jun 2019 22:26:47 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878sufjrgh.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212647.5730B440046@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:47 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: ti: davinci-evm: use modern dai_link
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

   ASoC: ti: davinci-evm: use modern dai_link style

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

From de3582fec0aacdca484d68ca693e255f2617d8ec Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:12:57 +0900
Subject: [PATCH] ASoC: ti: davinci-evm: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/ti/davinci-evm.c | 105 +++++++++++++++++++++++--------------
 1 file changed, 67 insertions(+), 38 deletions(-)

diff --git a/sound/soc/ti/davinci-evm.c b/sound/soc/ti/davinci-evm.c
index 4869d6311510..bd822bc8040f 100644
--- a/sound/soc/ti/davinci-evm.c
+++ b/sound/soc/ti/davinci-evm.c
@@ -143,103 +143,127 @@ static int evm_aic3x_init(struct snd_soc_pcm_runtime *rtd)
 }
 
 /* davinci-evm digital audio interface glue - connects codec <--> CPU */
+SND_SOC_DAILINK_DEFS(dm6446,
+	DAILINK_COMP_ARRAY(COMP_CPU("davinci-mcbsp")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("tlv320aic3x-codec.1-001b",
+				      "tlv320aic3x-hifi")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("davinci-mcbsp")));
+
 static struct snd_soc_dai_link dm6446_evm_dai = {
 	.name = "TLV320AIC3X",
 	.stream_name = "AIC3X",
-	.cpu_dai_name = "davinci-mcbsp",
-	.codec_dai_name = "tlv320aic3x-hifi",
-	.codec_name = "tlv320aic3x-codec.1-001b",
-	.platform_name = "davinci-mcbsp",
 	.init = evm_aic3x_init,
 	.ops = &evm_ops,
 	.dai_fmt = SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_CBM_CFM |
 		   SND_SOC_DAIFMT_IB_NF,
+	SND_SOC_DAILINK_REG(dm6446),
 };
 
+SND_SOC_DAILINK_DEFS(dm355,
+	DAILINK_COMP_ARRAY(COMP_CPU("davinci-mcbsp.1")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("tlv320aic3x-codec.1-001b",
+				      "tlv320aic3x-hifi")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("davinci-mcbsp.1")));
+
 static struct snd_soc_dai_link dm355_evm_dai = {
 	.name = "TLV320AIC3X",
 	.stream_name = "AIC3X",
-	.cpu_dai_name = "davinci-mcbsp.1",
-	.codec_dai_name = "tlv320aic3x-hifi",
-	.codec_name = "tlv320aic3x-codec.1-001b",
-	.platform_name = "davinci-mcbsp.1",
 	.init = evm_aic3x_init,
 	.ops = &evm_ops,
 	.dai_fmt = SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_CBM_CFM |
 		   SND_SOC_DAIFMT_IB_NF,
+	SND_SOC_DAILINK_REG(dm355),
 };
 
+#ifdef CONFIG_SND_SOC_DM365_AIC3X_CODEC
+SND_SOC_DAILINK_DEFS(dm365,
+	DAILINK_COMP_ARRAY(COMP_CPU("davinci-mcbsp")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("tlv320aic3x-codec.1-0018",
+				      "tlv320aic3x-hifi")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("davinci-mcbsp")));
+#elif defined(CONFIG_SND_SOC_DM365_VOICE_CODEC)
+SND_SOC_DAILINK_DEFS(dm365,
+	DAILINK_COMP_ARRAY(COMP_CPU("davinci-vcif")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("cq93vc-codec", "cq93vc-hifi")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("davinci-vcif")));
+#endif
+
 static struct snd_soc_dai_link dm365_evm_dai = {
 #ifdef CONFIG_SND_SOC_DM365_AIC3X_CODEC
 	.name = "TLV320AIC3X",
 	.stream_name = "AIC3X",
-	.cpu_dai_name = "davinci-mcbsp",
-	.codec_dai_name = "tlv320aic3x-hifi",
-	.codec_name = "tlv320aic3x-codec.1-0018",
-	.platform_name = "davinci-mcbsp",
 	.init = evm_aic3x_init,
 	.ops = &evm_ops,
 	.dai_fmt = SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_CBM_CFM |
 		   SND_SOC_DAIFMT_IB_NF,
+	SND_SOC_DAILINK_REG(dm365),
 #elif defined(CONFIG_SND_SOC_DM365_VOICE_CODEC)
 	.name = "Voice Codec - CQ93VC",
 	.stream_name = "CQ93",
-	.cpu_dai_name = "davinci-vcif",
-	.codec_dai_name = "cq93vc-hifi",
-	.codec_name = "cq93vc-codec",
-	.platform_name = "davinci-vcif",
+	SND_SOC_DAILINK_REG(dm365),
 #endif
 };
 
+SND_SOC_DAILINK_DEFS(dm6467_aic3x,
+	DAILINK_COMP_ARRAY(COMP_CPU("davinci-mcasp.0")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("tlv320aic3x-codec.0-001a",
+				      "tlv320aic3x-hifi")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("davinci-mcasp.0")));
+
+SND_SOC_DAILINK_DEFS(dm6467_spdif,
+	DAILINK_COMP_ARRAY(COMP_CPU("davinci-mcasp.1")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("spdif_dit", "dit-hifi")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("davinci-mcasp.1")));
+
 static struct snd_soc_dai_link dm6467_evm_dai[] = {
 	{
 		.name = "TLV320AIC3X",
 		.stream_name = "AIC3X",
-		.cpu_dai_name= "davinci-mcasp.0",
-		.codec_dai_name = "tlv320aic3x-hifi",
-		.platform_name = "davinci-mcasp.0",
-		.codec_name = "tlv320aic3x-codec.0-001a",
 		.init = evm_aic3x_init,
 		.ops = &evm_ops,
 		.dai_fmt = SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_CBM_CFM |
 			   SND_SOC_DAIFMT_IB_NF,
+		SND_SOC_DAILINK_REG(dm6467_aic3x),
 	},
 	{
 		.name = "McASP",
 		.stream_name = "spdif",
-		.cpu_dai_name= "davinci-mcasp.1",
-		.codec_dai_name = "dit-hifi",
-		.codec_name = "spdif_dit",
-		.platform_name = "davinci-mcasp.1",
 		.dai_fmt = SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_CBM_CFM |
 			   SND_SOC_DAIFMT_IB_NF,
+		SND_SOC_DAILINK_REG(dm6467_spdif),
 	},
 };
 
+SND_SOC_DAILINK_DEFS(da830,
+	DAILINK_COMP_ARRAY(COMP_CPU("davinci-mcasp.1")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("tlv320aic3x-codec.1-0018",
+				      "tlv320aic3x-hifi")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("davinci-mcasp.1")));
+
 static struct snd_soc_dai_link da830_evm_dai = {
 	.name = "TLV320AIC3X",
 	.stream_name = "AIC3X",
-	.cpu_dai_name = "davinci-mcasp.1",
-	.codec_dai_name = "tlv320aic3x-hifi",
-	.codec_name = "tlv320aic3x-codec.1-0018",
-	.platform_name = "davinci-mcasp.1",
 	.init = evm_aic3x_init,
 	.ops = &evm_ops,
 	.dai_fmt = SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_CBM_CFM |
 		   SND_SOC_DAIFMT_IB_NF,
+	SND_SOC_DAILINK_REG(da830),
 };
 
+SND_SOC_DAILINK_DEFS(da850,
+	DAILINK_COMP_ARRAY(COMP_CPU("davinci-mcasp.0")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("tlv320aic3x-codec.1-0018",
+				      "tlv320aic3x-hifi")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("davinci-mcasp.0")));
+
 static struct snd_soc_dai_link da850_evm_dai = {
 	.name = "TLV320AIC3X",
 	.stream_name = "AIC3X",
-	.cpu_dai_name= "davinci-mcasp.0",
-	.codec_dai_name = "tlv320aic3x-hifi",
-	.codec_name = "tlv320aic3x-codec.1-0018",
-	.platform_name = "davinci-mcasp.0",
 	.init = evm_aic3x_init,
 	.ops = &evm_ops,
 	.dai_fmt = SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_CBM_CFM |
 		   SND_SOC_DAIFMT_IB_NF,
+	SND_SOC_DAILINK_REG(da850),
 };
 
 /* davinci dm6446 evm audio machine driver */
@@ -330,14 +354,19 @@ static struct snd_soc_card da850_snd_soc_card = {
  * The struct is used as place holder. It will be completely
  * filled with data from dt node.
  */
+SND_SOC_DAILINK_DEFS(evm,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "tlv320aic3x-hifi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
 static struct snd_soc_dai_link evm_dai_tlv320aic3x = {
 	.name		= "TLV320AIC3X",
 	.stream_name	= "AIC3X",
-	.codec_dai_name	= "tlv320aic3x-hifi",
 	.ops            = &evm_ops,
 	.init           = evm_aic3x_init,
 	.dai_fmt = SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_CBM_CFM |
 		   SND_SOC_DAIFMT_IB_NF,
+	SND_SOC_DAILINK_REG(evm),
 };
 
 static const struct of_device_id davinci_evm_dt_ids[] = {
@@ -374,15 +403,15 @@ static int davinci_evm_probe(struct platform_device *pdev)
 
 	evm_soc_card.dai_link = dai;
 
-	dai->codec_of_node = of_parse_phandle(np, "ti,audio-codec", 0);
-	if (!dai->codec_of_node)
+	dai->codecs->of_node = of_parse_phandle(np, "ti,audio-codec", 0);
+	if (!dai->codecs->of_node)
 		return -EINVAL;
 
-	dai->cpu_of_node = of_parse_phandle(np, "ti,mcasp-controller", 0);
-	if (!dai->cpu_of_node)
+	dai->cpus->of_node = of_parse_phandle(np, "ti,mcasp-controller", 0);
+	if (!dai->cpus->of_node)
 		return -EINVAL;
 
-	dai->platform_of_node = dai->cpu_of_node;
+	dai->platforms->of_node = dai->cpus->of_node;
 
 	evm_soc_card.dev = &pdev->dev;
 	ret = snd_soc_of_parse_card_name(&evm_soc_card, "ti,model");
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
