Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E7E16B3E1
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Feb 2020 23:26:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABD7E16C9;
	Mon, 24 Feb 2020 23:25:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABD7E16C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582583206;
	bh=PqR2o5IrveuvlKGRc0gmvxKbZekxqZfdI+RMvhjPGIU=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=DVVKgeDrci2r+0SvOVSYOLB7H8+220cjDEXEU4x88YzVllco20VUa5Ex6Xow6AmGi
	 q3MT3bVeoyuoTFDjHUFR37NudH5syY68w7wh9o8ZkdF0jbVzwmhCMVc0m/d88bTo5e
	 S6LWo5blS6usyW9LDpYNn6DkvwhkjUB6KPeiFbdY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 426FFF802C4;
	Mon, 24 Feb 2020 23:22:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A899AF802C2; Mon, 24 Feb 2020 23:22:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id D62D9F802A9
 for <alsa-devel@alsa-project.org>; Mon, 24 Feb 2020 23:22:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D62D9F802A9
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76BA831B;
 Mon, 24 Feb 2020 14:22:00 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0D423F534;
 Mon, 24 Feb 2020 14:21:59 -0800 (PST)
Date: Mon, 24 Feb 2020 22:21:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: soc-pcm: cleanup soc_pcm_apply_msb()" to the asoc tree
In-Reply-To: <87eeurjca6.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87eeurjca6.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: soc-pcm: cleanup soc_pcm_apply_msb()

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

From 57be92066f68e63bd4a72a65d45c3407c0cb552a Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 19 Feb 2020 15:56:36 +0900
Subject: [PATCH] ASoC: soc-pcm: cleanup soc_pcm_apply_msb()

soc_pcm_apply_msb() apply msb for CPU/Codec,
but, it has duplicate code. The difference is only
SNDRV_PCM_STREAM_PLAYBACK and SNDRV_PCM_STEAM_CAPTURE.

It is very verbose and duplicate code.
This patch simplify code by using snd_soc_dai_get_pcm_stream().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87eeurjca6.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 7cb445bb1b54..6f56526bbb26 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -363,29 +363,24 @@ static void soc_pcm_apply_msb(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 	struct snd_soc_dai *codec_dai;
+	struct snd_soc_pcm_stream *pcm_codec, *pcm_cpu;
+	int stream = substream->stream;
 	int i;
 	unsigned int bits = 0, cpu_bits;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		for_each_rtd_codec_dai(rtd, i, codec_dai) {
-			if (codec_dai->driver->playback.sig_bits == 0) {
-				bits = 0;
-				break;
-			}
-			bits = max(codec_dai->driver->playback.sig_bits, bits);
-		}
-		cpu_bits = cpu_dai->driver->playback.sig_bits;
-	} else {
-		for_each_rtd_codec_dai(rtd, i, codec_dai) {
-			if (codec_dai->driver->capture.sig_bits == 0) {
-				bits = 0;
-				break;
-			}
-			bits = max(codec_dai->driver->capture.sig_bits, bits);
+	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+		pcm_codec = snd_soc_dai_get_pcm_stream(codec_dai, stream);
+
+		if (pcm_codec->sig_bits == 0) {
+			bits = 0;
+			break;
 		}
-		cpu_bits = cpu_dai->driver->capture.sig_bits;
+		bits = max(pcm_codec->sig_bits, bits);
 	}
 
+	pcm_cpu = snd_soc_dai_get_pcm_stream(cpu_dai, stream);
+	cpu_bits = pcm_cpu->sig_bits;
+
 	soc_pcm_set_msb(substream, bits);
 	soc_pcm_set_msb(substream, cpu_bits);
 }
-- 
2.20.1

