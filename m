Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F5B1AED4D
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 15:51:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E4FF1678;
	Sat, 18 Apr 2020 15:50:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E4FF1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587217874;
	bh=bBZ0/WEzQteMoUn5HISEL67Z74iHviswZYjpHt3GYhw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RnFqImoc3ldiYot8eiFZe1xxe8i1mXVUgq257lxc4/tlJjiHeLMS+SaC2t7M/dvpr
	 WxjmUsuW4KhYGI8OfFyalogfAsgaOLPmRaS71tj/TiRfGztZTOP+/NvIsJYfj5Jh+B
	 z21wnJ0utDPI81BXOPRXEgpFJJW9qHwut31a0p3s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0242DF8028B;
	Sat, 18 Apr 2020 15:48:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30378F8026A; Sat, 18 Apr 2020 15:48:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91895F8013D
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 15:48:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91895F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="G0CYP0Hh"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E9D9B21D6C;
 Sat, 18 Apr 2020 13:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587217717;
 bh=bBZ0/WEzQteMoUn5HISEL67Z74iHviswZYjpHt3GYhw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G0CYP0Hhi2GnuYVLhGzPZMcTtVt2CCLKbY3NYnf8wwOK4SwMVZWPex9voocyK9vYa
 RpTRU6kaIb9nxtJR1ZfbpFI1hMHwb5Ih0wItXsJLSQUkRH4E7XhLqF2kBcpci8urQX
 agaCor1aYUje16lAU7bigwCxD6OJimmxJqSC/Pl0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 18/73] ASoC: qcom: q6asm-dai: Add
 SNDRV_PCM_INFO_BATCH flag
Date: Sat, 18 Apr 2020 09:47:20 -0400
Message-Id: <20200418134815.6519-18-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200418134815.6519-1-sashal@kernel.org>
References: <20200418134815.6519-1-sashal@kernel.org>
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

[ Upstream commit 7f2430cda819a9ecb1df5a0f3ef4f1c20db3f811 ]

At the moment, playing audio with PulseAudio with the qdsp6 driver
results in distorted sound. It seems like its timer-based scheduling
does not work properly with qdsp6 since setting tsched=0 in
the PulseAudio configuration avoids the issue.

Apparently this happens when the pointer() callback is not accurate
enough. There is a SNDRV_PCM_INFO_BATCH flag that can be used to stop
PulseAudio from using timer-based scheduling by default.

According to https://www.alsa-project.org/pipermail/alsa-devel/2014-March/073816.html:

    The flag is being used in the sense explained in the previous audio
    meeting -- the data transfer granularity isn't fine enough but aligned
    to the period size (or less).

q6asm-dai reports the position as multiple of

    prtd->pcm_count = snd_pcm_lib_period_bytes(substream)

so it indeed just a multiple of the period size.

Therefore adding the flag here seems appropriate and makes audio
work out of the box.

Fixes: 2a9e92d371db ("ASoC: qdsp6: q6asm: Add q6asm dai driver")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Link: https://lore.kernel.org/r/20200330175210.47518-1-stephan@gerhold.net
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index c0d422d0ab94f..d7dc80ede8927 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -73,7 +73,7 @@ struct q6asm_dai_data {
 };
 
 static const struct snd_pcm_hardware q6asm_dai_hardware_capture = {
-	.info =                 (SNDRV_PCM_INFO_MMAP |
+	.info =                 (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_BATCH |
 				SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				SNDRV_PCM_INFO_MMAP_VALID |
 				SNDRV_PCM_INFO_INTERLEAVED |
@@ -95,7 +95,7 @@ static const struct snd_pcm_hardware q6asm_dai_hardware_capture = {
 };
 
 static struct snd_pcm_hardware q6asm_dai_hardware_playback = {
-	.info =                 (SNDRV_PCM_INFO_MMAP |
+	.info =                 (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_BATCH |
 				SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				SNDRV_PCM_INFO_MMAP_VALID |
 				SNDRV_PCM_INFO_INTERLEAVED |
-- 
2.20.1

