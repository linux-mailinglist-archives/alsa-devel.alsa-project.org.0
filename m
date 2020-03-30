Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9CA1982D5
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 19:55:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28A74166F;
	Mon, 30 Mar 2020 19:54:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28A74166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585590939;
	bh=0RGoweLS1Ssb0nUKX1JgNAYyEjEL7NdPhr5PLFC4/q0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q2kzIPa2h/XWiRlcT9DbRhupk89k86vZH2M+K9Uup6xz2khyRIaZCXGuVQLGdZQz4
	 B/JXqMOHXdVxyrmR5wvkw9FzKqEo2AI+rzB5nQ5vVm6kzkUrf8VO+UTftRlRgjWfrE
	 IsnO3BXqe0W6Hz+85d+3Z7U0/yDzz//NFDrKBvMI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38066F800AA;
	Mon, 30 Mar 2020 19:53:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA454F800EB; Mon, 30 Mar 2020 19:53:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F3ADF800EB
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 19:53:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F3ADF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="exAq8IB+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1585590826;
 s=strato-dkim-0002; d=gerhold.net;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=+fflkrBDGRn0iGKnvpQ0507rwUvd94osxgLtuye+zo0=;
 b=exAq8IB+jFi+/q45iIpIPGYF/Hx6oqzsVYDrRq6/F7sHv8Dr1hZAcHmmuxQ8j/AX/W
 sDbZpyjX1pRQ5ijs5+MuQpEEIz0yY4wyPLUQZK2+3zCDlfn3DCCast0kPAoy0l9Fb0fB
 EqxgB2HD5kvJaXwabLdC1PVtuPgFxoBG2ChntOzBw4znaCxOAOP34NuyQcLX0S8qZdAV
 tUlHLRLjVJ8eECM7zGP0md+O1T0AEk9XGLUaNZNdutFe9L4Jpyx2Z0jrSiuQoRbxHF+v
 yKjyy/5Lc91m5YoG80b5iwPGAkPlgxMBGlttX10J666IOj666BZf/mLcSOhmI+i9nLU9
 8cNQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQrEOHTIXsMv1qxRRGg=="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
 with ESMTPSA id u043b8w2UHrbO89
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 30 Mar 2020 19:53:37 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: qcom: q6asm-dai: Add SNDRV_PCM_INFO_BATCH flag
Date: Mon, 30 Mar 2020 19:52:10 +0200
Message-Id: <20200330175210.47518-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>, Patrick Lai <plai@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
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
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
I'm still quite confused about the true meaning of SNDRV_PCM_INFO_BATCH,
so please correct me if I'm wrong :)

The tsched=0 workaround can be found in Linaro distributions
for QCOM devices for example:
  - https://git.linaro.org/ci/fai.git/commit/?id=63494268b654d80df033f4cdeccf8f115801b756
  - https://github.com/ndechesne/meta-qcom/commit/7035dfeadd1c434fc7613730ac38004670553ec0

This patch allows removing that workaround since audio then works
without any configuration changes.
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index f6c7cddf08e8..125af00bba53 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -78,7 +78,7 @@ struct q6asm_dai_data {
 };
 
 static const struct snd_pcm_hardware q6asm_dai_hardware_capture = {
-	.info =                 (SNDRV_PCM_INFO_MMAP |
+	.info =                 (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_BATCH |
 				SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				SNDRV_PCM_INFO_MMAP_VALID |
 				SNDRV_PCM_INFO_INTERLEAVED |
@@ -100,7 +100,7 @@ static const struct snd_pcm_hardware q6asm_dai_hardware_capture = {
 };
 
 static struct snd_pcm_hardware q6asm_dai_hardware_playback = {
-	.info =                 (SNDRV_PCM_INFO_MMAP |
+	.info =                 (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_BATCH |
 				SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				SNDRV_PCM_INFO_MMAP_VALID |
 				SNDRV_PCM_INFO_INTERLEAVED |
-- 
2.26.0

