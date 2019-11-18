Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E485C100614
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2019 14:03:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59F1F1673;
	Mon, 18 Nov 2019 14:03:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59F1F1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574082236;
	bh=6rsT8FivKFfbVG7INtvknFqlw98g9Jop10ZHhwa4NNY=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=qwrXaskVZBNaaHhGxh+10GHwAmh3dIsy1XYe8yjo2gSAhfziMZ0vLYCGP5q7j1XyR
	 L7jiOWiXKTPTAd50A5dRjbntvjImjEWhrekxVb/tp0cEVCSvZV1tGBN09kJvJvrY01
	 8HAzwpQNRVlm2nYtGhRucBRTD3oRvsZgyM1g/YaA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7827AF8014C;
	Mon, 18 Nov 2019 14:00:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5814F80141; Mon, 18 Nov 2019 14:00:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 MISSING_MID, SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 910C7F80100
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 14:00:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 910C7F80100
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80C03FC2;
 Mon, 18 Nov 2019 05:00:37 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E35C23F6C4;
 Mon, 18 Nov 2019 05:00:36 -0800 (PST)
Date: Mon, 18 Nov 2019 13:00:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
In-Reply-To: <20191115102705.649976-4-vkoul@kernel.org>
X-Patchwork-Hint: ignore
Message-Id: <20191118130041.C5814F80141@alsa1.perex.cz>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-kernel@vger.kernel.org
Subject: [alsa-devel] Applied "ASoC: qcom: q6asm-dai: add support to flac
	decoder" to the asoc tree
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

   ASoC: qcom: q6asm-dai: add support to flac decoder

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From 69efab0fc638704e100c3dfb29eac971a4c1cc29 Mon Sep 17 00:00:00 2001
From: Vinod Koul <vkoul@kernel.org>
Date: Fri, 15 Nov 2019 15:57:05 +0530
Subject: [PATCH] ASoC: qcom: q6asm-dai: add support to flac decoder

Qualcomm DSPs also support the flac decoder, so add support for FLAC
decoder and convert the snd_dec_flac params to qdsp format.

Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Link: https://lore.kernel.org/r/20191115102705.649976-4-vkoul@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 35 +++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index f59353f510b8..8150c10f081e 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -626,8 +626,14 @@ static int q6asm_dai_compr_set_params(struct snd_compr_stream *stream,
 	struct snd_soc_component *c = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	int dir = stream->direction;
 	struct q6asm_dai_data *pdata;
+	struct q6asm_flac_cfg flac_cfg;
 	struct device *dev = c->dev;
 	int ret;
+	union snd_codec_options *codec_options;
+	struct snd_dec_flac *flac;
+
+	codec_options = &(prtd->codec_param.codec.options);
+
 
 	memcpy(&prtd->codec_param, params, sizeof(*params));
 
@@ -664,6 +670,32 @@ static int q6asm_dai_compr_set_params(struct snd_compr_stream *stream,
 		return ret;
 	}
 
+	switch (params->codec.id) {
+	case SND_AUDIOCODEC_FLAC:
+
+		memset(&flac_cfg, 0x0, sizeof(struct q6asm_flac_cfg));
+		flac = &codec_options->flac_d;
+
+		flac_cfg.ch_cfg = params->codec.ch_in;
+		flac_cfg.sample_rate =  params->codec.sample_rate;
+		flac_cfg.stream_info_present = 1;
+		flac_cfg.sample_size = flac->sample_size;
+		flac_cfg.min_blk_size = flac->min_blk_size;
+		flac_cfg.max_blk_size = flac->max_blk_size;
+		flac_cfg.max_frame_size = flac->max_frame_size;
+		flac_cfg.min_frame_size = flac->min_frame_size;
+
+		ret = q6asm_stream_media_format_block_flac(prtd->audio_client,
+							   &flac_cfg);
+		if (ret < 0) {
+			dev_err(dev, "FLAC CMD Format block failed:%d\n", ret);
+			return -EIO;
+		}
+		break;
+	default:
+		break;
+	}
+
 	ret = q6asm_map_memory_regions(dir, prtd->audio_client, prtd->phys,
 				       (prtd->pcm_size / prtd->periods),
 				       prtd->periods);
@@ -759,8 +791,9 @@ static int q6asm_dai_compr_get_caps(struct snd_compr_stream *stream,
 	caps->max_fragment_size = COMPR_PLAYBACK_MAX_FRAGMENT_SIZE;
 	caps->min_fragments = COMPR_PLAYBACK_MIN_NUM_FRAGMENTS;
 	caps->max_fragments = COMPR_PLAYBACK_MAX_NUM_FRAGMENTS;
-	caps->num_codecs = 1;
+	caps->num_codecs = 2;
 	caps->codecs[0] = SND_AUDIOCODEC_MP3;
+	caps->codecs[1] = SND_AUDIOCODEC_FLAC;
 
 	return 0;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
