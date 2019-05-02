Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0065111199
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 04:39:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A3C0175F;
	Thu,  2 May 2019 04:38:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A3C0175F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556764763;
	bh=WLZRxwdmEfbF/qLDMg9o/V3Dpj9GHqm7PPvPS5mBM50=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=MTSGyzEYpoScuCLgy4eFBf8xhhANyrEc9Kxw9YPewT0/K00kO8GLS795Fe8/FAFnO
	 0jNgabDCOez2C5XMOBUKGXJH5Q3bfagpwUWh3DEUM77HQRjQS5UOG2bSArveSFZdlx
	 NOig5VJwK+AKHlE9DA2sBiuuhlqbzdV8ggS9VMeM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B509EF897C1;
	Thu,  2 May 2019 04:19:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84D6CF89763; Thu,  2 May 2019 04:19:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F01C5F8972F
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 04:18:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F01C5F8972F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="pdBVILfW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=FmouO1K6pqsmFHm/IjNeIwkOpM3ywVATmNHFut30MV8=; b=pdBVILfWxr5+
 Pxn/X4tBtwZ8AFWyCfyfD/O/mdSJ0+FhHh0Hhwbi5ZmB9eSHraFFwnBhDteXBUqPykfCQlPQ7A5FE
 K7jDMjCzf+MJnq7aS2Fw+u+U2I5cnJ6paM2GgsJRyF+Y+ElBTVgTY2EVthds9yVVi960YGxBws6J+
 56IrI=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hM1JC-0005to-DN; Thu, 02 May 2019 02:18:50 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 413EF441D3B; Thu,  2 May 2019 03:18:47 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Agrawal@sirena.org.uk, Akshu <Akshu.Agrawal@amd.com>
In-Reply-To: <20190417100447.10321-1-akshu.agrawal@amd.com>
X-Patchwork-Hint: ignore
Message-Id: <20190502021847.413EF441D3B@finisterre.ee.mobilebroadband>
Date: Thu,  2 May 2019 03:18:47 +0100 (BST)
Cc: "Alexander  <Alexander.Deucher@amd.com>, alsa-devel@alsa-project.org,
 Andi Kleen <ak@linux.intel.com>,
 AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>, /@sirena.org.uk,
 djkurtz@chromium.org, "Agrawal, , Akshu Agrawal <akshu.agrawal@amd.com>,
 Akshu" <Akshu.Agrawal@amd.com>, moderated@sirena.org.uk, SOC@sirena.org.uk,
 DYNAMIC@sirena.org.uk, "list:SOUND"@sirena.org.uk, LAYER@sirena.org.uk,
 "Mukunda, , open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Vijendar" <Vijendar.Mukunda@amd.com>,
 -@sirena.org.uk,
 "Adam.Thomson.Opensource@diasemi.com" <Adam.Thomson.Opensource@diasemi.com>,
 " <djkurtz@chromium.org>, Julia Lawall <Julia.Lawall@lip6.fr>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 "@sirena.org.uk, "Deucher, , "@sirena.org.uk
Subject: [alsa-devel] Applied "ASoC: AMD: Configure wclk and bclk of master
	codec" to the asoc tree
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

   ASoC: AMD: Configure wclk and bclk of master codec

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

From bb24a31ed584b172507dc2fd991e19d110b5aae8 Mon Sep 17 00:00:00 2001
From: "Agrawal, Akshu" <Akshu.Agrawal@amd.com>
Date: Wed, 17 Apr 2019 10:05:13 +0000
Subject: [PATCH] ASoC: AMD: Configure wclk and bclk of master codec

With CCF support in da7219, we can now set the correct rate of
wclk and bclk.

Signed-off-by: Akshu Agrawal <akshu.agrawal@amd.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/amd/acp-da7219-max98357a.c | 66 ++++++++++++++++++----------
 1 file changed, 42 insertions(+), 24 deletions(-)

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index 8a619a75b3a9..16b0ea3a3d72 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -46,7 +46,8 @@
 #define DUAL_CHANNEL		2
 
 static struct snd_soc_jack cz_jack;
-static struct clk *da7219_dai_clk;
+static struct clk *da7219_dai_wclk;
+static struct clk *da7219_dai_bclk;
 extern bool bt_uart_enable;
 
 static int cz_da7219_init(struct snd_soc_pcm_runtime *rtd)
@@ -72,7 +73,8 @@ static int cz_da7219_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	da7219_dai_clk = clk_get(component->dev, "da7219-dai-bclk");
+	da7219_dai_wclk = clk_get(component->dev, "da7219-dai-wclk");
+	da7219_dai_bclk = clk_get(component->dev, "da7219-dai-bclk");
 
 	ret = snd_soc_card_jack_new(card, "Headset Jack",
 				SND_JACK_HEADSET | SND_JACK_LINEOUT |
@@ -94,12 +96,15 @@ static int cz_da7219_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
-static int da7219_clk_enable(struct snd_pcm_substream *substream)
+static int da7219_clk_enable(struct snd_pcm_substream *substream,
+			     int wclk_rate, int bclk_rate)
 {
 	int ret = 0;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 
-	ret = clk_prepare_enable(da7219_dai_clk);
+	clk_set_rate(da7219_dai_wclk, wclk_rate);
+	clk_set_rate(da7219_dai_bclk, bclk_rate);
+	ret = clk_prepare_enable(da7219_dai_bclk);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't enable master clock %d\n", ret);
 		return ret;
@@ -110,7 +115,7 @@ static int da7219_clk_enable(struct snd_pcm_substream *substream)
 
 static void da7219_clk_disable(void)
 {
-	clk_disable_unprepare(da7219_dai_clk);
+	clk_disable_unprepare(da7219_dai_bclk);
 }
 
 static const unsigned int channels[] = {
@@ -151,7 +156,7 @@ static int cz_da7219_play_startup(struct snd_pcm_substream *substream)
 				   &constraints_rates);
 
 	machine->play_i2s_instance = I2S_SP_INSTANCE;
-	return da7219_clk_enable(substream);
+	return 0;
 }
 
 static int cz_da7219_cap_startup(struct snd_pcm_substream *substream)
@@ -173,12 +178,7 @@ static int cz_da7219_cap_startup(struct snd_pcm_substream *substream)
 
 	machine->cap_i2s_instance = I2S_SP_INSTANCE;
 	machine->capture_channel = CAP_CHANNEL1;
-	return da7219_clk_enable(substream);
-}
-
-static void cz_da7219_shutdown(struct snd_pcm_substream *substream)
-{
-	da7219_clk_disable();
+	return 0;
 }
 
 static int cz_max_startup(struct snd_pcm_substream *substream)
@@ -199,12 +199,7 @@ static int cz_max_startup(struct snd_pcm_substream *substream)
 				   &constraints_rates);
 
 	machine->play_i2s_instance = I2S_BT_INSTANCE;
-	return da7219_clk_enable(substream);
-}
-
-static void cz_max_shutdown(struct snd_pcm_substream *substream)
-{
-	da7219_clk_disable();
+	return 0;
 }
 
 static int cz_dmic0_startup(struct snd_pcm_substream *substream)
@@ -225,7 +220,7 @@ static int cz_dmic0_startup(struct snd_pcm_substream *substream)
 				   &constraints_rates);
 
 	machine->cap_i2s_instance = I2S_BT_INSTANCE;
-	return da7219_clk_enable(substream);
+	return 0;
 }
 
 static int cz_dmic1_startup(struct snd_pcm_substream *substream)
@@ -247,10 +242,28 @@ static int cz_dmic1_startup(struct snd_pcm_substream *substream)
 
 	machine->cap_i2s_instance = I2S_SP_INSTANCE;
 	machine->capture_channel = CAP_CHANNEL0;
-	return da7219_clk_enable(substream);
+	return 0;
 }
 
-static void cz_dmic_shutdown(struct snd_pcm_substream *substream)
+static int cz_da7219_params(struct snd_pcm_substream *substream,
+				      struct snd_pcm_hw_params *params)
+{
+	int wclk, bclk;
+
+	wclk = params_rate(params);
+	bclk = wclk * params_channels(params) *
+		snd_pcm_format_width(params_format(params));
+	/* ADAU7002 spec: "The ADAU7002 requires a BCLK rate
+	 * that is minimum of 64x the LRCLK sample rate."
+	 * DA7219 is the only clk source so for all codecs
+	 * we have to limit bclk to 64X lrclk.
+	 */
+	if (bclk < (wclk * 64))
+		bclk = wclk * 64;
+	return da7219_clk_enable(substream, wclk, bclk);
+}
+
+static void cz_da7219_shutdown(struct snd_pcm_substream *substream)
 {
 	da7219_clk_disable();
 }
@@ -258,26 +271,31 @@ static void cz_dmic_shutdown(struct snd_pcm_substream *substream)
 static const struct snd_soc_ops cz_da7219_play_ops = {
 	.startup = cz_da7219_play_startup,
 	.shutdown = cz_da7219_shutdown,
+	.hw_params = cz_da7219_params,
 };
 
 static const struct snd_soc_ops cz_da7219_cap_ops = {
 	.startup = cz_da7219_cap_startup,
 	.shutdown = cz_da7219_shutdown,
+	.hw_params = cz_da7219_params,
 };
 
 static const struct snd_soc_ops cz_max_play_ops = {
 	.startup = cz_max_startup,
-	.shutdown = cz_max_shutdown,
+	.shutdown = cz_da7219_shutdown,
+	.hw_params = cz_da7219_params,
 };
 
 static const struct snd_soc_ops cz_dmic0_cap_ops = {
 	.startup = cz_dmic0_startup,
-	.shutdown = cz_dmic_shutdown,
+	.shutdown = cz_da7219_shutdown,
+	.hw_params = cz_da7219_params,
 };
 
 static const struct snd_soc_ops cz_dmic1_cap_ops = {
 	.startup = cz_dmic1_startup,
-	.shutdown = cz_dmic_shutdown,
+	.shutdown = cz_da7219_shutdown,
+	.hw_params = cz_da7219_params,
 };
 
 static struct snd_soc_dai_link cz_dai_7219_98357[] = {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
