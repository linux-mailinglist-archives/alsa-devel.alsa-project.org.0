Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A34FDB6A
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 11:31:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7288F167D;
	Fri, 15 Nov 2019 11:30:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7288F167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573813867;
	bh=qkhBrmVHXPD88Yz8PLWj/x2mLsnmV+lOlsB6qy7fpjo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=naeH6kLgfONKK5xOSrn5m6OsLSUy2Ixr5PNnfiWhVgniYiJPT+b7QGpFN4D4ju/Or
	 wj4qFz/bHORRrHThvYa1reXC0keoyhBoSy/Ssiz7AJz0dNrLUHUfotNvthXStCr8dI
	 QIyGfzegowiwKWDYp6u7eTKAKHxW/I8SglEn8+Ew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65F8CF80119;
	Fri, 15 Nov 2019 11:27:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAC8AF80117; Fri, 15 Nov 2019 11:27:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5193F8007E
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 11:27:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5193F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="02PboHr+"
Received: from vkoul-mobl.Dlink (unknown [106.51.108.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 970B820748;
 Fri, 15 Nov 2019 10:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573813665;
 bh=8oHQt7MPagfOxYSdD/WliNlX/xPE5ypyV6uVQjdJNTk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=02PboHr+ua8Y+fd3oIByquwwz/Y5JQMn/3lbO2ZNd1Vy/wQzl7KMpBd4iVtaOw5xW
 rxPhBXILFyHZX/oqkQqZtRjz3ouCQ5NYfyTjNHPV1yN7rqpkyReElQcAMpL8uEb8NB
 wJ8LMGYeAD7DlHJQa8nUPQyEzaNHMLTSJhqLMlUc=
From: Vinod Koul <vkoul@kernel.org>
To: Takashi Iwai <tiwai@suse.com>
Date: Fri, 15 Nov 2019 15:57:05 +0530
Message-Id: <20191115102705.649976-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191115102705.649976-1-vkoul@kernel.org>
References: <20191115102705.649976-1-vkoul@kernel.org>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [RFC PATCH 3/3] ASoC: qcom: q6asm-dai: add support to
	flac decoder
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Qualcomm DSPs also support the flac decoder, so add support for FLAC
decoder and convert the snd_dec_flac params to qdsp format.

Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 35 +++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 548eb4fa2da6..56e306bdbbe1 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -635,8 +635,14 @@ static int q6asm_dai_compr_set_params(struct snd_compr_stream *stream,
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
 
@@ -673,6 +679,32 @@ static int q6asm_dai_compr_set_params(struct snd_compr_stream *stream,
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
@@ -768,8 +800,9 @@ static int q6asm_dai_compr_get_caps(struct snd_compr_stream *stream,
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
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
