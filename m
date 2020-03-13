Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A668B184159
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 08:12:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F0BE1797;
	Fri, 13 Mar 2020 08:12:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F0BE1797
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584083578;
	bh=rfa/ArgLgaz92yJLGY97fFpfRcmpI+tJU0aLfsmPz08=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JxMM+oLGMFx/fUVKD5mzWfWBdrAXxV8PN5zfN4gpSgsHecbMiO4s0Vx9gpOWrMFCP
	 l5E+m5qmafi4k5XxdjbpthH3PqDKzpwi6ztVQkXgYexPYGbAMEsmGf5UlRwAcgDjCm
	 6QBpAYDoVVn0B2VTpo6pPxDdbeAe3pu2pIdtLEwM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86626F8029B;
	Fri, 13 Mar 2020 08:09:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 867B2F8028D; Fri, 13 Mar 2020 08:09:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DA8DF8023E
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 08:09:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DA8DF8023E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="2LQ+6miN"
Received: from localhost.localdomain (unknown [171.76.107.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5C392206FA;
 Fri, 13 Mar 2020 07:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584083360;
 bh=rfa/ArgLgaz92yJLGY97fFpfRcmpI+tJU0aLfsmPz08=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2LQ+6miNIjr3fEJbhOgG/GHf1BXMqI1+wN143gYCo7UpmY4RCVyDdYRWpa1LY5wdG
 tOERS2IKyXjgcGInyqdSYKjdzbaq+O9K6o2S7dWJ7HFUqwdMAjCNUHUxkRK2IjsOVZ
 w9/FqB29ONnY6tEhEjgDYCxmfdX3Mlwk5nseR9oM=
From: Vinod Koul <vkoul@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 3/9] ASoC: qcom: q6asm: pass codec profile to q6asm_open_write
Date: Fri, 13 Mar 2020 12:38:41 +0530
Message-Id: <20200313070847.1464977-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200313070847.1464977-1-vkoul@kernel.org>
References: <20200313070847.1464977-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org
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

Codec profile is required to be passed for WMA codecs so that we know
the codec profile present and tell DSP accordingly, so update this API
to pass the codec profile as argument

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 4 ++--
 sound/soc/qcom/qdsp6/q6asm.c     | 2 +-
 sound/soc/qcom/qdsp6/q6asm.h     | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index c0d422d0ab94..8f245d03b6f5 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -250,7 +250,7 @@ static int q6asm_dai_prepare(struct snd_soc_component *component,
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		ret = q6asm_open_write(prtd->audio_client, FORMAT_LINEAR_PCM,
-				       prtd->bits_per_sample);
+				       0, prtd->bits_per_sample);
 	} else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
 		ret = q6asm_open_read(prtd->audio_client, FORMAT_LINEAR_PCM,
 				       prtd->bits_per_sample);
@@ -652,7 +652,7 @@ static int q6asm_dai_compr_set_params(struct snd_compr_stream *stream,
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
2.24.1

