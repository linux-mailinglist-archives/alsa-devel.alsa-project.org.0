Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 582CB13AF2E
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 17:22:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8CF2183A;
	Tue, 14 Jan 2020 17:21:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8CF2183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579018962;
	bh=sGPl0IoNbql6ypVGvZAixY2kBfcvyubYn0Np7QteESI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=NyLL7dD7SUldy3JpFngcMkZLRXkzYyGpT+NxXB4MU2eX6JtjnRXVYHCy4SBogsyhh
	 OYowpOUwyjmRLxfraL/fj33ZYymbnVJHALpfD3F/jPoIWMxB1+e2d0rrGmmbguIpbb
	 Az6pq3GEE0Um5Zo3MPJuEfEahucV0blFsen5Ezv4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96852F8035F;
	Tue, 14 Jan 2020 17:10:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACEC5F80337; Tue, 14 Jan 2020 17:10:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04CBEF8027B
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 17:09:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04CBEF8027B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="g5q3ORZJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=+Cc9nFnKLrm9qvKs53my276YkWBMce0Dog73Pj7cAfw=; b=g5q3ORZJVIuO
 A7WIGv2U8RRTkLx00+59h/SCZugQ6DrLd+RGKqNMgihu8CYvfux/oZ5hzNNopLjNfAaSxt0dwjzyC
 2Qma52ls80/fzNkdLwTxTnqOUU4YlvpLN+hzuPg++YzGY0jY4pmjsIMVzbjyuUXvBxj59uwvO0qAT
 Y7aRA=;
Received: from fw-tnat-cam7.arm.com ([217.140.106.55]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1irOkf-0001WG-PY; Tue, 14 Jan 2020 16:09:09 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 7C011D02C77; Tue, 14 Jan 2020 16:09:09 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200113210428.27457-8-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200113210428.27457-8-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Date: Tue, 14 Jan 2020 16:09:09 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: Intel: kbl_da7219_max98927: rename
	shadowed variable" to the asoc tree
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

   ASoC: Intel: kbl_da7219_max98927: rename shadowed variable

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From 1a29c760663624b0160c0143819c70db99343904 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Mon, 13 Jan 2020 15:04:17 -0600
Subject: [PATCH] ASoC: Intel: kbl_da7219_max98927: rename shadowed variable

Fix cppcheck warning:

[sound/soc/intel/boards/kbl_da7219_max98927.c:432] ->
[sound/soc/intel/boards/kbl_da7219_max98927.c:282]: (style) Local
variable 'channels' shadows outer variable

[sound/soc/intel/boards/kbl_da7219_max98927.c:432] ->
[sound/soc/intel/boards/kbl_da7219_max98927.c:494]: (style) Local
variable 'channels' shadows outer variable

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200113210428.27457-8-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/kbl_da7219_max98927.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/boards/kbl_da7219_max98927.c b/sound/soc/intel/boards/kbl_da7219_max98927.c
index e8b2ec60fb03..f8cf5de5ba09 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98927.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98927.c
@@ -279,7 +279,7 @@ static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_interval *rate = hw_param_interval(params,
 			SNDRV_PCM_HW_PARAM_RATE);
-	struct snd_interval *channels = hw_param_interval(params,
+	struct snd_interval *chan = hw_param_interval(params,
 			SNDRV_PCM_HW_PARAM_CHANNELS);
 	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 	struct snd_soc_dpcm *dpcm = container_of(
@@ -298,7 +298,7 @@ static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
 		!strcmp(rtd->card->name, "kblmax98373")) {
 		/* The ADSP will convert the FE rate to 48k, stereo */
 		rate->min = rate->max = 48000;
-		channels->min = channels->max = DUAL_CHANNEL;
+		chan->min = chan->max = DUAL_CHANNEL;
 
 		/* set SSP to 24 bit */
 		snd_mask_none(fmt);
@@ -313,7 +313,7 @@ static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
 	    !strcmp(fe_dai_link->name, "Kbl Audio Headset Playback") ||
 	    !strcmp(fe_dai_link->name, "Kbl Audio Capture Port")) {
 		rate->min = rate->max = 48000;
-		channels->min = channels->max = 2;
+		chan->min = chan->max = 2;
 		snd_mask_none(fmt);
 		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
 	}
@@ -494,7 +494,7 @@ static const struct snd_soc_ops kabylake_da7219_fe_ops = {
 static int kabylake_dmic_fixup(struct snd_soc_pcm_runtime *rtd,
 		struct snd_pcm_hw_params *params)
 {
-	struct snd_interval *channels = hw_param_interval(params,
+	struct snd_interval *chan = hw_param_interval(params,
 				SNDRV_PCM_HW_PARAM_CHANNELS);
 
 	/*
@@ -502,9 +502,9 @@ static int kabylake_dmic_fixup(struct snd_soc_pcm_runtime *rtd,
 	 */
 
 	if (params_channels(params) == 2)
-		channels->min = channels->max = 2;
+		chan->min = chan->max = 2;
 	else
-		channels->min = channels->max = 4;
+		chan->min = chan->max = 4;
 
 	return 0;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
