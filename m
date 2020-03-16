Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 299791864D8
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Mar 2020 06:58:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE14E187D;
	Mon, 16 Mar 2020 06:57:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE14E187D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584338285;
	bh=KVsBTWdSRrwp2b8W6rCdYOvr/IzqmQADneGKlr7H/g0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IiwSS0Y4s/np9Yr4hbpkN8kvOgXJQFhxShTDRqByTrLjpDhqROpyJzH3Yk73pRoKV
	 Sqap3TSApHqGyTJp5RDLP7CBzn0SRu9v/q1t+nHI1OIeA+6pH5eK6QXQAQwdwOYawI
	 z5Pa8nTZbByHYWgdddpWHfV2rq90vIPQJiRHH/Ps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18D26F8028D;
	Mon, 16 Mar 2020 06:55:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 130FBF8028D; Mon, 16 Mar 2020 06:55:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B098F8028B
 for <alsa-devel@alsa-project.org>; Mon, 16 Mar 2020 06:55:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B098F8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="M0w7pbpm"
Received: from vkoul-mobl.Dlink (unknown [49.207.58.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A0DF420663;
 Mon, 16 Mar 2020 05:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584338138;
 bh=KVsBTWdSRrwp2b8W6rCdYOvr/IzqmQADneGKlr7H/g0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M0w7pbpmkls6dsefsAlcheIgAi0AH4ZsfmGii5dDjOFo+/I96/S2kD1cn3I8kEY6L
 jY/TI2e+3H7iCs+/UJP80CrWEsKgec6pwBWJKayidfVOO7+xvhO7jPkIWcpNe1323z
 wDXIgegrlDGUgmf9DtFqlOhhI4ATZrnrEK3GkHnk=
From: Vinod Koul <vkoul@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 5/9] ASoC: qcom: q6asm-dai: add support to wma decoder
Date: Mon, 16 Mar 2020 11:22:17 +0530
Message-Id: <20200316055221.1944464-6-vkoul@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200316055221.1944464-1-vkoul@kernel.org>
References: <20200316055221.1944464-1-vkoul@kernel.org>
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

Qualcomm DSPs also supports the wma decoder, so add support for wma
decoder and convert the snd_codec_params to qdsp format.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 67 +++++++++++++++++++++++++++++++-
 1 file changed, 66 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 8f245d03b6f5..53c250778eea 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -627,10 +627,13 @@ static int q6asm_dai_compr_set_params(struct snd_compr_stream *stream,
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
 
@@ -692,6 +695,67 @@ static int q6asm_dai_compr_set_params(struct snd_compr_stream *stream,
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
@@ -791,9 +855,10 @@ static int q6asm_dai_compr_get_caps(struct snd_compr_stream *stream,
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
2.24.1

