Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9F53815D
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 00:57:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14B1B1764;
	Fri,  7 Jun 2019 00:56:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14B1B1764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559861840;
	bh=lovB4VyBAdXu5exEqp5qZnWhS/ADfPlGzlOyucYELSM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=N8M2hYjMQ2saltz6X05TRLx+N1C6UfzM6cGlrrJNbbLqLVjIEsNxaiGEZIGtYnRDk
	 WjpsmJ5XJKaXtkhO6rEizNXLewiQwHyiTS6cMxNrrvx+SwdmJKMtLSRLy56P6xyEvC
	 vuG4qfLZ0uATZgtvkcvaq98697PRD2y00XkclwDY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C918F89A33;
	Thu,  6 Jun 2019 23:31:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0949F89894; Thu,  6 Jun 2019 23:29:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98E3CF89802
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:27:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98E3CF89802
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="wSTdby26"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=UE1VDv24l+JJYus4bvckzW8BEbA+1zZvWuqvBJglrtI=; b=wSTdby26z/Jz
 RxKo1ziHrEKdtdVZCmhrb8swVBZ/cSo3WUIJswQr4ZIH92Y2H+LugESS+jBe3Ng6rYzEnySDy27+W
 O0Xb8vsoSONvzf9Jcyy+yeoUlLv5QaEtQYiEMOtpvqQE+5Lv6MZuZ8v3wjf8EnlHWAaCpLW5lfI13
 Tg3Kw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzuh-0007Ts-BC; Thu, 06 Jun 2019 21:27:11 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id D5154440046; Thu,  6 Jun 2019 22:27:10 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wohzl67h.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212710.D5154440046@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:27:10 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: samsung: smdk_wm8580: use modern
	dai_link style" to the asoc tree
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

   ASoC: samsung: smdk_wm8580: use modern dai_link style

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

From 10601860559d4d2765ff2ccebb3d6a1df4a41c4f Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:09:01 +0900
Subject: [PATCH] ASoC: samsung: smdk_wm8580: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/smdk_wm8580.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/sound/soc/samsung/smdk_wm8580.c b/sound/soc/samsung/smdk_wm8580.c
index 987807e6f8c3..d096ff912260 100644
--- a/sound/soc/samsung/smdk_wm8580.c
+++ b/sound/soc/samsung/smdk_wm8580.c
@@ -140,27 +140,31 @@ enum {
 #define SMDK_DAI_FMT (SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | \
 	SND_SOC_DAIFMT_CBM_CFM)
 
+SND_SOC_DAILINK_DEFS(paif_rx,
+	DAILINK_COMP_ARRAY(COMP_CPU("samsung-i2s.2")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("wm8580.0-001b", "wm8580-hifi-playback")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("samsung-i2s.0")));
+
+SND_SOC_DAILINK_DEFS(paif_tx,
+	DAILINK_COMP_ARRAY(COMP_CPU("samsung-i2s.2")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("wm8580.0-001b", "wm8580-hifi-capture")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("samsung-i2s.0")));
+
 static struct snd_soc_dai_link smdk_dai[] = {
 	[PRI_PLAYBACK] = { /* Primary Playback i/f */
 		.name = "WM8580 PAIF RX",
 		.stream_name = "Playback",
-		.cpu_dai_name = "samsung-i2s.2",
-		.codec_dai_name = "wm8580-hifi-playback",
-		.platform_name = "samsung-i2s.0",
-		.codec_name = "wm8580.0-001b",
 		.dai_fmt = SMDK_DAI_FMT,
 		.ops = &smdk_ops,
+		SND_SOC_DAILINK_REG(paif_rx),
 	},
 	[PRI_CAPTURE] = { /* Primary Capture i/f */
 		.name = "WM8580 PAIF TX",
 		.stream_name = "Capture",
-		.cpu_dai_name = "samsung-i2s.2",
-		.codec_dai_name = "wm8580-hifi-capture",
-		.platform_name = "samsung-i2s.0",
-		.codec_name = "wm8580.0-001b",
 		.dai_fmt = SMDK_DAI_FMT,
 		.init = smdk_wm8580_init_paiftx,
 		.ops = &smdk_ops,
+		SND_SOC_DAILINK_REG(paif_tx),
 	},
 };
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
