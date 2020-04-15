Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BC41AAEFA
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 19:01:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA1201671;
	Wed, 15 Apr 2020 19:00:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA1201671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586970110;
	bh=9ZxEymkXsB+7RAR4MZSXPVlcvFpkMV1pJjIvKk5pO6E=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=m+XP54gpCKJ3J4Vq1EVK/PwDTkod/t7Ymh1UFYW7L9olCVTbncbrHqtwha73qMCl2
	 8+rR9VEB20edXfV9bISiuMbXYvbL699c5/Ov58oNLHcN/YXRHsWU/jpScYH6kN5DTb
	 VBXiIrpKKZkY1yyxjSrrg0tirsfMiTRqGMzHx7iM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27586F8026A;
	Wed, 15 Apr 2020 18:59:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62E6EF80266; Wed, 15 Apr 2020 18:59:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E320F80229
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 18:59:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E320F80229
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YQ7Y2wSI"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 28EA1206F9;
 Wed, 15 Apr 2020 16:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586969957;
 bh=9ZxEymkXsB+7RAR4MZSXPVlcvFpkMV1pJjIvKk5pO6E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=YQ7Y2wSIpSgBifnexpW7TOG/dDBAsmGLTMe3WDscs3L/pXxnmiTNYcz1PgnV0MTTG
 XUVEDat7CUOdrgiCD8NUGGU1SpPIRe7WNXIH24qdghV1lORlTktYR3JoTb/Dru+y3p
 u+4usJOEwGLibYXCd4B1UxuxE5Pj8Zh+AhZ5cMkE=
Date: Wed, 15 Apr 2020 17:59:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
Subject: Applied "ASoC: q6dsp6: q6afe-dai: add missing channels to MI2S DAIs"
 to the asoc tree
In-Reply-To: <20200415150050.616392-1-stephan@gerhold.net>
Message-Id: <applied-20200415150050.616392-1-stephan@gerhold.net>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Patrick Lai <plai@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht
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

   ASoC: q6dsp6: q6afe-dai: add missing channels to MI2S DAIs

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

From 0c824ec094b5cda766c80d88c2036e28c24a4cb1 Mon Sep 17 00:00:00 2001
From: Stephan Gerhold <stephan@gerhold.net>
Date: Wed, 15 Apr 2020 17:00:50 +0200
Subject: [PATCH] ASoC: q6dsp6: q6afe-dai: add missing channels to MI2S DAIs

For some reason, the MI2S DAIs do not have channels_min/max defined.
This means that snd_soc_dai_stream_valid() returns false,
i.e. the DAIs have neither valid playback nor capture stream.

It's quite surprising that this ever worked correctly,
but in 5.7-rc1 this is now failing badly: :)

Commit 0e9cf4c452ad ("ASoC: pcm: check if cpu-dai supports a given stream")
introduced a check for snd_soc_dai_stream_valid() before calling
hw_params(), which means that the q6i2s_hw_params() function
was never called, eventually resulting in:

    qcom-q6afe aprsvc:q6afe:4:4: no line is assigned

... even though "qcom,sd-lines" is set in the device tree.

Commit 9b5db059366a ("ASoC: soc-pcm: dpcm: Only allow playback/capture if supported")
now even avoids creating PCM devices if the stream is not supported,
which means that it is failing even earlier with e.g.:

    Primary MI2S: ASoC: no backend playback stream

Avoid all that trouble by adding channels_min/max for the MI2S DAIs.

Fixes: 24c4cbcfac09 ("ASoC: qdsp6: q6afe: Add q6afe dai driver")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Link: https://lore.kernel.org/r/20200415150050.616392-1-stephan@gerhold.net
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/qcom/qdsp6/q6afe-dai.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index c1a7624eaf17..2a5302f1db98 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -902,6 +902,8 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
 				 SNDRV_PCM_RATE_16000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
 				   SNDRV_PCM_FMTBIT_S24_LE,
+			.channels_min = 1,
+			.channels_max = 8,
 			.rate_min =     8000,
 			.rate_max =     48000,
 		},
@@ -917,6 +919,8 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
 				 SNDRV_PCM_RATE_16000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
 				   SNDRV_PCM_FMTBIT_S24_LE,
+			.channels_min = 1,
+			.channels_max = 8,
 			.rate_min =     8000,
 			.rate_max =     48000,
 		},
@@ -931,6 +935,8 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
 			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
 				 SNDRV_PCM_RATE_16000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.channels_min = 1,
+			.channels_max = 8,
 			.rate_min =     8000,
 			.rate_max =     48000,
 		},
@@ -946,6 +952,8 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
 				 SNDRV_PCM_RATE_16000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
 				   SNDRV_PCM_FMTBIT_S24_LE,
+			.channels_min = 1,
+			.channels_max = 8,
 			.rate_min =     8000,
 			.rate_max =     48000,
 		},
@@ -960,6 +968,8 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
 			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
 				 SNDRV_PCM_RATE_16000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.channels_min = 1,
+			.channels_max = 8,
 			.rate_min =     8000,
 			.rate_max =     48000,
 		},
@@ -975,6 +985,8 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
 				 SNDRV_PCM_RATE_16000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
 				   SNDRV_PCM_FMTBIT_S24_LE,
+			.channels_min = 1,
+			.channels_max = 8,
 			.rate_min =     8000,
 			.rate_max =     48000,
 		},
@@ -989,6 +1001,8 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
 			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
 				 SNDRV_PCM_RATE_16000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.channels_min = 1,
+			.channels_max = 8,
 			.rate_min =     8000,
 			.rate_max =     48000,
 		},
@@ -1004,6 +1018,8 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
 				 SNDRV_PCM_RATE_16000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
 				   SNDRV_PCM_FMTBIT_S24_LE,
+			.channels_min = 1,
+			.channels_max = 8,
 			.rate_min =     8000,
 			.rate_max =     48000,
 		},
-- 
2.20.1

