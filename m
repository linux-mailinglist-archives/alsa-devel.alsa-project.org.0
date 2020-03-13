Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC03F18415B
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 08:13:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52A7E1794;
	Fri, 13 Mar 2020 08:13:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52A7E1794
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584083639;
	bh=vB1MiwmBoyGSX0x8BuDgWTS9/c0waXFmI2PTwKKTNcQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=prwh/u3Sv0vRHZH22BQJc1r0s49q7TE41N/2sDh2SLhPlu73HYk9ifRjIn6Z86kIB
	 uB43k62vz7VprN1cBTjOOGmEbxM7JU6aAmeHO4IMYasweGWkz+MDHEIln9phwpuX9m
	 IanDklE+7SlvPFd6oY7hOpZElDuMo+1gicfBXXh4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 307A9F802D2;
	Fri, 13 Mar 2020 08:09:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5820FF802A8; Fri, 13 Mar 2020 08:09:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6A89F80299
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 08:09:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6A89F80299
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sQGQKXqq"
Received: from localhost.localdomain (unknown [171.76.107.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6EFC52074C;
 Fri, 13 Mar 2020 07:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584083369;
 bh=vB1MiwmBoyGSX0x8BuDgWTS9/c0waXFmI2PTwKKTNcQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sQGQKXqq5Urb5v09MgcPN6rMV9muP1yr79A/obgs8xEQTbFEqcZr8d4+B2+ohoBts
 0WV4Wh3ciPqYDKYyA40+Y2zZKqxnCCrC/IED2o9Mj3WtzsYlPuecdwqNuoAQzU5uUE
 WbPWeEhsNyhERBh2tVTKNuM6fJNXbQpJ0zxCjWpM=
From: Vinod Koul <vkoul@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 5/9] ASoC: qcom: q6asm-dai: add support to wma decoder
Date: Fri, 13 Mar 2020 12:38:43 +0530
Message-Id: <20200313070847.1464977-6-vkoul@kernel.org>
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

Qualcomm DSPs also supports the wma decoder, so add support for wma
decoder and convert the snd_codec_params to qdsp format.

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

