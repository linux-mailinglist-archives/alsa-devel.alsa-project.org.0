Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 090231AAB3B
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 17:03:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B04F21687;
	Wed, 15 Apr 2020 17:03:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B04F21687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586963037;
	bh=oCNfmM7ZiiZ18PTZ9bnqcUBKyD9fnlCjvHxaTstvljg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ePl0xPYUeTaRLxiRA7spF7ABaUA6GHvivN51A9ZaCVJz3LEGrc8ijYRWJ54Zj816X
	 QEK9LJZROx8QWKq7JzNf7/zMTnkBC0vIjgSRQVVHJx5oK26uUsghN7U5JGTro1TucT
	 Nk0mVIKJQINVQJBhnDU9XhSMLjtqgUPsieVmIFr0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 345F4F8025F;
	Wed, 15 Apr 2020 17:03:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23A89F80245; Wed, 15 Apr 2020 17:03:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B38B5F80124
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 17:02:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B38B5F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="q0p6UbH3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586962974;
 s=strato-dkim-0002; d=gerhold.net;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=xDuCPScXE9/990DG2gOjJqdVEzDJ5sTN++PmNXCAIRs=;
 b=q0p6UbH3BYq9ZRkBKNu2F0/1qEqi+rB1sPMgtLHywUvHakkAm2+1RBy1ImpUjWOE2x
 bL2ekZPGwwXt+uxtYbhwDNsUqMm2GN395AYvDbFPvR59snUZXJdlKS9OaGf79/pW7q+5
 VVk61uyGGpHe0wOdzTTht1g2d5QRCR138FX/oiGnZCgVjdjV0hDzzKPxB7jZu6Ae3sR+
 M6iqAg/VCTdLScxJ/f+4oVrP0dqZNa9w7DRchZlr2keolUe6lgrwN2NSiGJQ7RKaU5/X
 qwX/H79grU+UysMqH05+8otCihTzpdWF/+ixsePeDT3ZmslOlivQtvKNjHXsvgCjfUbb
 AOTQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB526NccuO"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain by smtp.strato.de (RZmta 46.4.0 DYNA|AUTH)
 with ESMTPSA id k074e0w3FF2j3Gq
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 15 Apr 2020 17:02:45 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: q6dsp6: q6afe-dai: add missing channels to MI2S DAIs
Date: Wed, 15 Apr 2020 17:00:50 +0200
Message-Id: <20200415150050.616392-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>, Patrick Lai <plai@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
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

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Fixes: 24c4cbcfac09 ("ASoC: qdsp6: q6afe: Add q6afe dai driver")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
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
2.26.1

