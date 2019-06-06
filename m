Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 517D138037
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 00:04:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA7A41677;
	Fri,  7 Jun 2019 00:03:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA7A41677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559858665;
	bh=ECYo64Gmg7HP2VaCdvDXCReFWuuCKl6qMLZ37CLFvKU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=rfkXQZ3pELrcMwLG5v4aR7Ec/HZs65A+/mfNa6vemfEiJMdK3FoxlGoKmm2DdFgyV
	 6tAME6XJ3U3Y0FBHgexKxqrWLOeMaq01JJGDuytz/dvh8dkDH8A5Ox1nZp4ueY8wFj
	 3g4lDEO5JTMBmn6LfOCbTZ0c4dFvZGiAGuB8uQdk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 475EBF896FE;
	Thu,  6 Jun 2019 23:29:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17FB0F89829; Thu,  6 Jun 2019 23:27:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4A3DF89780
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4A3DF89780
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="vdVjbQ1l"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=j0bntlCwngH+tlbm6uendxal7aYPAx8DHVpB10j6+X0=; b=vdVjbQ1ltxsM
 TT9YiSuteZhNSEU8O3OShQbBpwj6D7tsFUEOifqI/0XEQe8puvyv29OgnXGtU1PGwNrE1deMow2dn
 JsnfD4v8sIB1u8qaVSvDJXyrevWIr6r3G2aET2VLz++KdLLqNemE/GnixJxFiK4V5/O6TNMgCGj8b
 QlwkY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYztz-0007MF-MV; Thu, 06 Jun 2019 21:26:27 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 3BB80440046; Thu,  6 Jun 2019 22:26:27 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87sgsngy5h.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212627.3BB80440046@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:27 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: mxs: mxs-sgtl5000: use modern dai_link
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

   ASoC: mxs: mxs-sgtl5000: use modern dai_link style

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

From 49cb448846f57227a9758dc71a19ce1e24ddbbdd Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:16:37 +0900
Subject: [PATCH] ASoC: mxs: mxs-sgtl5000: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mxs/mxs-sgtl5000.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mxs/mxs-sgtl5000.c b/sound/soc/mxs/mxs-sgtl5000.c
index 2b3f2408301a..459fced603b0 100644
--- a/sound/soc/mxs/mxs-sgtl5000.c
+++ b/sound/soc/mxs/mxs-sgtl5000.c
@@ -75,21 +75,32 @@ static const struct snd_soc_ops mxs_sgtl5000_hifi_ops = {
 #define MXS_SGTL5000_DAI_FMT (SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | \
 	SND_SOC_DAIFMT_CBS_CFS)
 
+
+SND_SOC_DAILINK_DEFS(hifi_tx,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "sgtl5000")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(hifi_rx,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "sgtl5000")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
 static struct snd_soc_dai_link mxs_sgtl5000_dai[] = {
 	{
 		.name		= "HiFi Tx",
 		.stream_name	= "HiFi Playback",
-		.codec_dai_name	= "sgtl5000",
 		.dai_fmt	= MXS_SGTL5000_DAI_FMT,
 		.ops		= &mxs_sgtl5000_hifi_ops,
 		.playback_only	= true,
+		SND_SOC_DAILINK_REG(hifi_tx),
 	}, {
 		.name		= "HiFi Rx",
 		.stream_name	= "HiFi Capture",
-		.codec_dai_name	= "sgtl5000",
 		.dai_fmt	= MXS_SGTL5000_DAI_FMT,
 		.ops		= &mxs_sgtl5000_hifi_ops,
 		.capture_only	= true,
+		SND_SOC_DAILINK_REG(hifi_rx),
 	},
 };
 
@@ -124,12 +135,12 @@ static int mxs_sgtl5000_probe(struct platform_device *pdev)
 	}
 
 	for (i = 0; i < 2; i++) {
-		mxs_sgtl5000_dai[i].codec_name = NULL;
-		mxs_sgtl5000_dai[i].codec_of_node = codec_np;
-		mxs_sgtl5000_dai[i].cpu_dai_name = NULL;
-		mxs_sgtl5000_dai[i].cpu_of_node = saif_np[i];
-		mxs_sgtl5000_dai[i].platform_name = NULL;
-		mxs_sgtl5000_dai[i].platform_of_node = saif_np[i];
+		mxs_sgtl5000_dai[i].codecs->name = NULL;
+		mxs_sgtl5000_dai[i].codecs->of_node = codec_np;
+		mxs_sgtl5000_dai[i].cpus->dai_name = NULL;
+		mxs_sgtl5000_dai[i].cpus->of_node = saif_np[i];
+		mxs_sgtl5000_dai[i].platforms->name = NULL;
+		mxs_sgtl5000_dai[i].platforms->of_node = saif_np[i];
 	}
 
 	of_node_put(codec_np);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
