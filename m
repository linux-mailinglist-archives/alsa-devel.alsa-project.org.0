Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD5A187200
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Mar 2020 19:12:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA9721827;
	Mon, 16 Mar 2020 19:11:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA9721827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584382369;
	bh=cgg6EZNM0AXYIsGxddQ2pBTqF4pyv3rs4RSINabByHg=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=fqlefgYgD2HhAsEY///+63hVPsuwLaGliNtVkU3icr6VIe1bQj+YDBSrBBagFJp92
	 QccijUo48aY7S6YJSk8CQB+PCFveSNht8Ca2lQAAIuM9IpLjRLz+fSISwtOz6dztyf
	 OowieUHuiqZ4fyURxajVU+wNcXv/smc2fN8RNEjg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23EA5F802BC;
	Mon, 16 Mar 2020 19:08:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB165F802BD; Mon, 16 Mar 2020 19:08:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 96913F802A1
 for <alsa-devel@alsa-project.org>; Mon, 16 Mar 2020 19:08:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96913F802A1
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 248F21FB;
 Mon, 16 Mar 2020 11:08:16 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CB803F67D;
 Mon, 16 Mar 2020 11:08:15 -0700 (PDT)
Date: Mon, 16 Mar 2020 18:08:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: Applied "ASoC: qcom: q6asm-dai: add support to wma decoder" to the
 asoc tree
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

   ASoC: qcom: q6asm-dai: add support to wma decoder

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

From 40519a1c02303ebdf09e07fe57a52c2d1d188b01 Mon Sep 17 00:00:00 2001
From: Vinod Koul <vkoul@kernel.org>
Date: Mon, 16 Mar 2020 11:22:17 +0530
Subject: [PATCH] ASoC: qcom: q6asm-dai: add support to wma decoder

Qualcomm DSPs also supports the wma decoder, so add support for wma
decoder and convert the snd_codec_params to qdsp format.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20200316055221.1944464-6-vkoul@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 67 +++++++++++++++++++++++++++++++-
 1 file changed, 66 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index bc0e3f7cfd8e..fa685fe4a027 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -629,10 +629,13 @@ static int q6asm_dai_compr_set_params(struct snd_compr_stream *stream,
 	int dir = stream->direction;
 	struct q6asm_dai_data *pdata;
 	struct q6asm_flac_cfg flac_cfg;
+	struct q6asm_wma_cfg wma_cfg;
+	unsigned int wma_v9 = 0;
 	struct device *dev = c->dev;
 	int ret;
 	union snd_codec_options *codec_options;
 	struct snd_dec_flac *flac;
+	struct snd_dec_wma *wma;
 
 	codec_options = &(prtd->codec_param.codec.options);
 
@@ -694,6 +697,67 @@ static int q6asm_dai_compr_set_params(struct snd_compr_stream *stream,
 			return -EIO;
 		}
 		break;
+
+	case SND_AUDIOCODEC_WMA:
+		wma = &codec_options->wma_d;
+
+		memset(&wma_cfg, 0x0, sizeof(struct q6asm_wma_cfg));
+
+		wma_cfg.sample_rate =  params->codec.sample_rate;
+		wma_cfg.num_channels = params->codec.ch_in;
+		wma_cfg.bytes_per_sec = params->codec.bit_rate / 8;
+		wma_cfg.block_align = params->codec.align;
+		wma_cfg.bits_per_sample = prtd->bits_per_sample;
+		wma_cfg.enc_options = wma->encoder_option;
+		wma_cfg.adv_enc_options = wma->adv_encoder_option;
+		wma_cfg.adv_enc_options2 = wma->adv_encoder_option2;
+
+		if (wma_cfg.num_channels == 1)
+			wma_cfg.channel_mask = 4; /* Mono Center */
+		else if (wma_cfg.num_channels == 2)
+			wma_cfg.channel_mask = 3; /* Stereo FL/FR */
+		else
+			return -EINVAL;
+
+		/* check the codec profile */
+		switch (params->codec.profile) {
+		case SND_AUDIOPROFILE_WMA9:
+			wma_cfg.fmtag = 0x161;
+			wma_v9 = 1;
+			break;
+
+		case SND_AUDIOPROFILE_WMA10:
+			wma_cfg.fmtag = 0x166;
+			break;
+
+		case SND_AUDIOPROFILE_WMA9_PRO:
+			wma_cfg.fmtag = 0x162;
+			break;
+
+		case SND_AUDIOPROFILE_WMA9_LOSSLESS:
+			wma_cfg.fmtag = 0x163;
+			break;
+
+		case SND_AUDIOPROFILE_WMA10_LOSSLESS:
+			wma_cfg.fmtag = 0x167;
+			break;
+
+		default:
+			dev_err(dev, "Unknown WMA profile:%x\n",
+				params->codec.profile);
+			return -EIO;
+		}
+
+		if (wma_v9)
+			ret = q6asm_stream_media_format_block_wma_v9(
+					prtd->audio_client, &wma_cfg);
+		else
+			ret = q6asm_stream_media_format_block_wma_v10(
+					prtd->audio_client, &wma_cfg);
+		if (ret < 0) {
+			dev_err(dev, "WMA9 CMD failed:%d\n", ret);
+			return -EIO;
+		}
 	default:
 		break;
 	}
@@ -793,9 +857,10 @@ static int q6asm_dai_compr_get_caps(struct snd_compr_stream *stream,
 	caps->max_fragment_size = COMPR_PLAYBACK_MAX_FRAGMENT_SIZE;
 	caps->min_fragments = COMPR_PLAYBACK_MIN_NUM_FRAGMENTS;
 	caps->max_fragments = COMPR_PLAYBACK_MAX_NUM_FRAGMENTS;
-	caps->num_codecs = 2;
+	caps->num_codecs = 3;
 	caps->codecs[0] = SND_AUDIOCODEC_MP3;
 	caps->codecs[1] = SND_AUDIOCODEC_FLAC;
+	caps->codecs[2] = SND_AUDIOCODEC_WMA;
 
 	return 0;
 }
-- 
2.20.1

