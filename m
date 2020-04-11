Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 753D31A54DA
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Apr 2020 01:08:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5DD61693;
	Sun, 12 Apr 2020 01:07:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5DD61693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586646491;
	bh=joOxo1Zr/oT1gUdgtaRz8hThdw45IxDOqajylLDLVvs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ue3iz47qE1YwJ94utkwccHCLHgHR5NbdRiYtJ7zWhH1/Z5pUGfjo4a7usAlflrwNP
	 vB2Ezr88kdwDV2CCH4O4keqoLFPABKEziCWuRS+ADYLkCcmJHh7Z8FKixrMGS9v6AF
	 pyjeCG3SXVKDxjMohyL8l8RCTnxWlRNRIF18Twxk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E6A0F80213;
	Sun, 12 Apr 2020 01:05:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CE90F801DA; Sun, 12 Apr 2020 01:05:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5ECD1F800CB
 for <alsa-devel@alsa-project.org>; Sun, 12 Apr 2020 01:05:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5ECD1F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lpPxBLcR"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1025620708;
 Sat, 11 Apr 2020 23:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586646334;
 bh=joOxo1Zr/oT1gUdgtaRz8hThdw45IxDOqajylLDLVvs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lpPxBLcRiYtciYR/f4whJOwE9hUKJWaUi8A3jnNZTwlinDibZwhhJVzg28ODzr0hW
 9LWkTtu5urhakrHVsNAgNW3PHkIiuPyX0vdRC7+qh/IZEOf+F7InwtQ9O1Q/EmNTmG
 FTgUDCID/OeGQ/Mi9daGHFGZrJA5Rwk5MiMCQ3wY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 086/149] ASoC: soc-pcm: fix regression in
 soc_new_pcm()
Date: Sat, 11 Apr 2020 19:02:43 -0400
Message-Id: <20200411230347.22371-86-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200411230347.22371-1-sashal@kernel.org>
References: <20200411230347.22371-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Stephan Gerhold <stephan@gerhold.net>, Sameer Pujar <spujar@nvidia.com>,
 Mark Brown <broonie@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
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

[ Upstream commit a4877a6fb2bd2e356a5eaacd86d6b6d69ff84e69 ]

Commit af4bac11531f ("ASoC: soc-pcm: crash in snd_soc_dapm_new_dai")
swapped the SNDRV_PCM_STREAM_* parameter in the
snd_soc_dai_stream_valid(cpu_dai, ...) checks. But that works only
for codec2codec links. For normal links it breaks registration of
playback/capture-only PCM devices.

E.g. on qcom/apq8016_sbc there is usually one playback-only and one
capture-only PCM device, but they disappeared after the commit.

The codec2codec case was added in commit a342031cdd08
("ASoC: create pcm for codec2codec links as well") as an extra check
(e.g. `playback = playback && cpu_playback->channels_min`).

We should be able to simplify the code by checking directly for
the correct stream type in the loop.
This also fixes the regression because we check for PLAYBACK for
both codec and cpu dai again when codec2codec is not used.

Fixes: af4bac11531f ("ASoC: soc-pcm: crash in snd_soc_dapm_new_dai")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
Tested-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Sameer Pujar <spujar@nvidia.com>
Link: https://lore.kernel.org/r/20200218103824.26708-1-stephan@gerhold.net
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/soc-pcm.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 2c59b3688ca01..a08ebbf5a37f3 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2888,22 +2888,19 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 		capture = rtd->dai_link->dpcm_capture;
 	} else {
 		/* Adapt stream for codec2codec links */
-		struct snd_soc_pcm_stream *cpu_capture = rtd->dai_link->params ?
-			&cpu_dai->driver->playback : &cpu_dai->driver->capture;
-		struct snd_soc_pcm_stream *cpu_playback = rtd->dai_link->params ?
-			&cpu_dai->driver->capture : &cpu_dai->driver->playback;
+		int cpu_capture = rtd->dai_link->params ?
+			SNDRV_PCM_STREAM_PLAYBACK : SNDRV_PCM_STREAM_CAPTURE;
+		int cpu_playback = rtd->dai_link->params ?
+			SNDRV_PCM_STREAM_CAPTURE : SNDRV_PCM_STREAM_PLAYBACK;
 
 		for_each_rtd_codec_dai(rtd, i, codec_dai) {
 			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_CAPTURE))
+			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
 				playback = 1;
 			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_PLAYBACK))
+			    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
 				capture = 1;
 		}
-
-		capture = capture && cpu_capture->channels_min;
-		playback = playback && cpu_playback->channels_min;
 	}
 
 	if (rtd->dai_link->playback_only) {
-- 
2.20.1

