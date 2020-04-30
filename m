Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9315A1BFD9E
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 16:15:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D6041665;
	Thu, 30 Apr 2020 16:14:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D6041665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588256122;
	bh=ofC+s2rpOOXSYWluYL+/aP6SMzxLfIP2anHBiVYKQ9s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=go5HZmLQh9or508fn5mjzoltjtd50YC6F/NixRPiGbNdQpNbCGyoS4KkyW9bZkE89
	 MjMPcn3k36+En/y2yvOUjPoNky11/t2FOYv4mu4SxOhPijFrF1Gqojw5Lg9NBE1IQa
	 //v+fikgvqPe4qYsVkQI5JZLZG/pcDKlAtlFeEqw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5808EF8043C;
	Thu, 30 Apr 2020 15:53:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E68E5F80299; Thu, 30 Apr 2020 15:53:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F052F801F7
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 15:53:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F052F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gcGkurw7"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6DCA72072A;
 Thu, 30 Apr 2020 13:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588254813;
 bh=ofC+s2rpOOXSYWluYL+/aP6SMzxLfIP2anHBiVYKQ9s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gcGkurw7+f2DA/X5R/STGiqKJdO6UGCVWcUcDrWC5dAg6c7w9Vu8vncxPMnq5TnTQ
 sq1343eCZvODng9Hz0J9VfGudvS+qPORJKwinazTet2sfr2Q8MYg8GjrnFHdZHCmDF
 xL+wFasiZ6vHA7co1r35ZMjtkcFeFGTtECs9ETwU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 06/30] ASoC: q6dsp6: q6afe-dai: add missing
 channels to MI2S DAIs
Date: Thu, 30 Apr 2020 09:53:01 -0400
Message-Id: <20200430135325.20762-6-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200430135325.20762-1-sashal@kernel.org>
References: <20200430135325.20762-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>
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

From: Stephan Gerhold <stephan@gerhold.net>

[ Upstream commit 0c824ec094b5cda766c80d88c2036e28c24a4cb1 ]

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
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/qcom/qdsp6/q6afe-dai.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index 8f6c8fc073a93..1fc1939b90c2f 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -899,6 +899,8 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
 				 SNDRV_PCM_RATE_16000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
 				   SNDRV_PCM_FMTBIT_S24_LE,
+			.channels_min = 1,
+			.channels_max = 8,
 			.rate_min =     8000,
 			.rate_max =     48000,
 		},
@@ -914,6 +916,8 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
 				 SNDRV_PCM_RATE_16000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
 				   SNDRV_PCM_FMTBIT_S24_LE,
+			.channels_min = 1,
+			.channels_max = 8,
 			.rate_min =     8000,
 			.rate_max =     48000,
 		},
@@ -928,6 +932,8 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
 			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
 				 SNDRV_PCM_RATE_16000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.channels_min = 1,
+			.channels_max = 8,
 			.rate_min =     8000,
 			.rate_max =     48000,
 		},
@@ -943,6 +949,8 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
 				 SNDRV_PCM_RATE_16000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
 				   SNDRV_PCM_FMTBIT_S24_LE,
+			.channels_min = 1,
+			.channels_max = 8,
 			.rate_min =     8000,
 			.rate_max =     48000,
 		},
@@ -957,6 +965,8 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
 			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
 				 SNDRV_PCM_RATE_16000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.channels_min = 1,
+			.channels_max = 8,
 			.rate_min =     8000,
 			.rate_max =     48000,
 		},
@@ -972,6 +982,8 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
 				 SNDRV_PCM_RATE_16000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
 				   SNDRV_PCM_FMTBIT_S24_LE,
+			.channels_min = 1,
+			.channels_max = 8,
 			.rate_min =     8000,
 			.rate_max =     48000,
 		},
@@ -986,6 +998,8 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
 			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
 				 SNDRV_PCM_RATE_16000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.channels_min = 1,
+			.channels_max = 8,
 			.rate_min =     8000,
 			.rate_max =     48000,
 		},
@@ -1001,6 +1015,8 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
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

