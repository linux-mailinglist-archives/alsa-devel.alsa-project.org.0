Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B35187206
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Mar 2020 19:13:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1EEC18DE;
	Mon, 16 Mar 2020 19:13:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1EEC18DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584382432;
	bh=eQsiT+fzpAx9YNg7jWDeedxdXmeJkWvBv6p/Pl6WPQk=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=CcvX9GwV/B2ieK3Fn9H9qWJgW7myheAAn45iLcnVBsyupr4bWhCS6/r9PrgjaTEMg
	 xpG863CN+qubr2VQ+CyXkog8u+FxsdZcnAYOcYGct0kR0jBarr/c3jnocoSSRkOV6v
	 V+bFrFOZoGj69qQi4rpg/IFiiYbXtmBGAwD+LL0k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77ACCF802E2;
	Mon, 16 Mar 2020 19:08:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E986F802E3; Mon, 16 Mar 2020 19:08:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id C3F36F802C4
 for <alsa-devel@alsa-project.org>; Mon, 16 Mar 2020 19:08:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3F36F802C4
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB6F91FB;
 Mon, 16 Mar 2020 11:08:24 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 605EE3F67D;
 Mon, 16 Mar 2020 11:08:24 -0700 (PDT)
Date: Mon, 16 Mar 2020 18:08:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: Applied "ASoC: qcom: q6asm: pass codec profile to q6asm_open_write"
 to the asoc tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

   ASoC: qcom: q6asm: pass codec profile to q6asm_open_write

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

From 8504a72f7ce231989cf2a82f0cdbba5b72f65015 Mon Sep 17 00:00:00 2001
From: Vinod Koul <vkoul@kernel.org>
Date: Mon, 16 Mar 2020 11:22:15 +0530
Subject: [PATCH] ASoC: qcom: q6asm: pass codec profile to q6asm_open_write

Codec profile is required to be passed for WMA codecs so that we know
the codec profile present and tell DSP accordingly, so update this API
to pass the codec profile as argument

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20200316055221.1944464-4-vkoul@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 4 ++--
 sound/soc/qcom/qdsp6/q6asm.c     | 2 +-
 sound/soc/qcom/qdsp6/q6asm.h     | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 8b48815ff918..bc0e3f7cfd8e 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -252,7 +252,7 @@ static int q6asm_dai_prepare(struct snd_soc_component *component,
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		ret = q6asm_open_write(prtd->audio_client, FORMAT_LINEAR_PCM,
-				       prtd->bits_per_sample);
+				       0, prtd->bits_per_sample);
 	} else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
 		ret = q6asm_open_read(prtd->audio_client, FORMAT_LINEAR_PCM,
 				       prtd->bits_per_sample);
@@ -654,7 +654,7 @@ static int q6asm_dai_compr_set_params(struct snd_compr_stream *stream,
 	prtd->bits_per_sample = 16;
 	if (dir == SND_COMPRESS_PLAYBACK) {
 		ret = q6asm_open_write(prtd->audio_client, params->codec.id,
-					prtd->bits_per_sample);
+				params->codec.profile, prtd->bits_per_sample);
 
 		if (ret < 0) {
 			dev_err(dev, "q6asm_open_write failed\n");
diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index 36e0eab13a98..64eb7b6ba305 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -858,7 +858,7 @@ static int q6asm_ac_send_cmd_sync(struct audio_client *ac, struct apr_pkt *pkt)
  * Return: Will be an negative value on error or zero on success
  */
 int q6asm_open_write(struct audio_client *ac, uint32_t format,
-		     uint16_t bits_per_sample)
+		     u32 codec_profile, uint16_t bits_per_sample)
 {
 	struct asm_stream_cmd_open_write_v3 *open;
 	struct apr_pkt *pkt;
diff --git a/sound/soc/qcom/qdsp6/q6asm.h b/sound/soc/qcom/qdsp6/q6asm.h
index 6764f55f7078..1cff7f68b95d 100644
--- a/sound/soc/qcom/qdsp6/q6asm.h
+++ b/sound/soc/qcom/qdsp6/q6asm.h
@@ -55,7 +55,7 @@ void q6asm_audio_client_free(struct audio_client *ac);
 int q6asm_write_async(struct audio_client *ac, uint32_t len, uint32_t msw_ts,
 		       uint32_t lsw_ts, uint32_t flags);
 int q6asm_open_write(struct audio_client *ac, uint32_t format,
-		     uint16_t bits_per_sample);
+		     u32 codec_profile, uint16_t bits_per_sample);
 
 int q6asm_open_read(struct audio_client *ac, uint32_t format,
 		     uint16_t bits_per_sample);
-- 
2.20.1

