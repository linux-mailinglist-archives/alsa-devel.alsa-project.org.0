Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED62138068
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 00:17:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8451A16CC;
	Fri,  7 Jun 2019 00:17:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8451A16CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559859479;
	bh=e4G8dkwE7ClI0q7bl+rubCNoe+LdOFk2wjOS4n3pSes=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=kNbeQx7I74MYh654Dpn3W4QAFp+EyHNimUaGfIRiHToQpqnGOUzISxICHNKXJP+7+
	 29/EcLALSfbKEeEhNpNW9iCQxaqMZ3bpG3KAZk3oSNsM7MQUtoZwnVbdWswBpoLrbL
	 LKozZd/QvTj0kYUwz9A3W1ubLQ1TxMjwFWZ7J3rg=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 638A9F898D8;
	Thu,  6 Jun 2019 23:30:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87296F89844; Thu,  6 Jun 2019 23:28:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96ECFF897A3
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96ECFF897A3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="L4ZjAZQH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=vGfBm3BQAHzPE3/NSQdv6+Z/GnevTJut4fzi2tAp8tc=; b=L4ZjAZQHKozE
 I6rOFz+Dj75ItgaL/k41VF3E69Z8xhz3QSt25VO+5wrWKjEteGOMmEZj1luA6WsA7xpQYGE08Q22O
 707yIZ+FbMCebdM2O7qz3m4D3RZM4WogDMAcK2PM9+Euu46/TkCpA8qYsJl45msP8qcQalymHAB+6
 V8AMo=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzuA-0007O7-Bi; Thu, 06 Jun 2019 21:26:38 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id CF68B440046; Thu,  6 Jun 2019 22:26:37 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87k1dzictx.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212637.CF68B440046@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:37 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: au1x: db1200: use modern dai_link
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

   ASoC: au1x: db1200: use modern dai_link style

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

From fc4b060a8c6357b2ee22fe21f261f2fb77d41706 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:14:13 +0900
Subject: [PATCH] ASoC: au1x: db1200: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/au1x/db1200.c | 50 ++++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 20 deletions(-)

diff --git a/sound/soc/au1x/db1200.c b/sound/soc/au1x/db1200.c
index 301e1fc9a377..4b012bf54c37 100644
--- a/sound/soc/au1x/db1200.c
+++ b/sound/soc/au1x/db1200.c
@@ -46,13 +46,15 @@ static const struct platform_device_id db1200_pids[] = {
 
 /*-------------------------  AC97 PART  ---------------------------*/
 
+SND_SOC_DAILINK_DEFS(db1200_ac97,
+	DAILINK_COMP_ARRAY(COMP_CPU("au1xpsc_ac97.1")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("ac97-codec.1", "ac97-hifi")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("au1xpsc-pcm.1")));
+
 static struct snd_soc_dai_link db1200_ac97_dai = {
 	.name		= "AC97",
 	.stream_name	= "AC97 HiFi",
-	.codec_dai_name	= "ac97-hifi",
-	.cpu_dai_name	= "au1xpsc_ac97.1",
-	.platform_name	= "au1xpsc-pcm.1",
-	.codec_name	= "ac97-codec.1",
+	SND_SOC_DAILINK_REG(db1200_ac97),
 };
 
 static struct snd_soc_card db1200_ac97_machine = {
@@ -62,13 +64,15 @@ static struct snd_soc_card db1200_ac97_machine = {
 	.num_links	= 1,
 };
 
+SND_SOC_DAILINK_DEFS(db1300_ac97,
+	DAILINK_COMP_ARRAY(COMP_CPU("au1xpsc_ac97.1")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("wm9712-codec.1", "wm9712-hifi")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("au1xpsc-pcm.1")));
+
 static struct snd_soc_dai_link db1300_ac97_dai = {
 	.name		= "AC97",
 	.stream_name	= "AC97 HiFi",
-	.codec_dai_name	= "wm9712-hifi",
-	.cpu_dai_name	= "au1xpsc_ac97.1",
-	.platform_name	= "au1xpsc-pcm.1",
-	.codec_name	= "wm9712-codec.1",
+	SND_SOC_DAILINK_REG(db1300_ac97),
 };
 
 static struct snd_soc_card db1300_ac97_machine = {
@@ -103,16 +107,18 @@ static const struct snd_soc_ops db1200_i2s_wm8731_ops = {
 	.startup	= db1200_i2s_startup,
 };
 
+SND_SOC_DAILINK_DEFS(db1200_i2s,
+	DAILINK_COMP_ARRAY(COMP_CPU("au1xpsc_i2s.1")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("wm8731.0-001b", "wm8731-hifi")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("au1xpsc-pcm.1")));
+
 static struct snd_soc_dai_link db1200_i2s_dai = {
 	.name		= "WM8731",
 	.stream_name	= "WM8731 PCM",
-	.codec_dai_name	= "wm8731-hifi",
-	.cpu_dai_name	= "au1xpsc_i2s.1",
-	.platform_name	= "au1xpsc-pcm.1",
-	.codec_name	= "wm8731.0-001b",
 	.dai_fmt	= SND_SOC_DAIFMT_LEFT_J | SND_SOC_DAIFMT_NB_NF |
 			  SND_SOC_DAIFMT_CBM_CFM,
 	.ops		= &db1200_i2s_wm8731_ops,
+	SND_SOC_DAILINK_REG(db1200_i2s),
 };
 
 static struct snd_soc_card db1200_i2s_machine = {
@@ -122,16 +128,18 @@ static struct snd_soc_card db1200_i2s_machine = {
 	.num_links	= 1,
 };
 
+SND_SOC_DAILINK_DEFS(db1300_i2s,
+	DAILINK_COMP_ARRAY(COMP_CPU("au1xpsc_i2s.2")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("wm8731.0-001b", "wm8731-hifi")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("au1xpsc-pcm.2")));
+
 static struct snd_soc_dai_link db1300_i2s_dai = {
 	.name		= "WM8731",
 	.stream_name	= "WM8731 PCM",
-	.codec_dai_name	= "wm8731-hifi",
-	.cpu_dai_name	= "au1xpsc_i2s.2",
-	.platform_name	= "au1xpsc-pcm.2",
-	.codec_name	= "wm8731.0-001b",
 	.dai_fmt	= SND_SOC_DAIFMT_LEFT_J | SND_SOC_DAIFMT_NB_NF |
 			  SND_SOC_DAIFMT_CBM_CFM,
 	.ops		= &db1200_i2s_wm8731_ops,
+	SND_SOC_DAILINK_REG(db1300_i2s),
 };
 
 static struct snd_soc_card db1300_i2s_machine = {
@@ -141,16 +149,18 @@ static struct snd_soc_card db1300_i2s_machine = {
 	.num_links	= 1,
 };
 
+SND_SOC_DAILINK_DEFS(db1550_i2s,
+	DAILINK_COMP_ARRAY(COMP_CPU("au1xpsc_i2s.3")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("wm8731.0-001b", "wm8731-hifi")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("au1xpsc-pcm.3")));
+
 static struct snd_soc_dai_link db1550_i2s_dai = {
 	.name		= "WM8731",
 	.stream_name	= "WM8731 PCM",
-	.codec_dai_name	= "wm8731-hifi",
-	.cpu_dai_name	= "au1xpsc_i2s.3",
-	.platform_name	= "au1xpsc-pcm.3",
-	.codec_name	= "wm8731.0-001b",
 	.dai_fmt	= SND_SOC_DAIFMT_LEFT_J | SND_SOC_DAIFMT_NB_NF |
 			  SND_SOC_DAIFMT_CBM_CFM,
 	.ops		= &db1200_i2s_wm8731_ops,
+	SND_SOC_DAILINK_REG(db1550_i2s),
 };
 
 static struct snd_soc_card db1550_i2s_machine = {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
