Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F8768693C
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 15:59:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E3C2E95;
	Wed,  1 Feb 2023 15:58:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E3C2E95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675263540;
	bh=52rfeEAUKfBzvrv/FpGrU5lmYu9L7Q/rZAbKGj3qpkA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YgtzntqjAfVS/xoTTZkq7xLsAS1pflG8vfpWX1zz1OcwsCeKsXl5T44wUwceY11wl
	 Wh3IzN0JFnV59bhKoTA2CgSKR9k/Pbx/eTUXMDNDIVdyA3f/eEhJNaeNWCJvInkAZO
	 4b2WRnyfpdYVi1lkzhwI3feiezWkSSjkn5O0h/rc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B724EF805D2;
	Wed,  1 Feb 2023 15:53:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47CFEF80423; Wed,  1 Feb 2023 14:52:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55AB7F80246
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 14:52:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55AB7F80246
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=grvGpSas
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1675259565; x=1706795565;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6yIIgPFIFODAxKPkgPqqwq+s+KBvSCKTf+wd3Xgqe4g=;
 b=grvGpSasSjipRN7RRlhtwFZgRMHPR8F6zN8RoZ+dQgykaP57Q7ILgewu
 Kn0EkARATeP+iJAnoytAvaqUWaQLwxuI5x4RRBwL3ClOr/UBJ6ohUr7+i
 cTAi5W67uaROyDLJ0FT6HY6fqbR/5LEA21KCTk9h+bpelVGNh9+DQd+Xk c=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 01 Feb 2023 05:52:44 -0800
X-QCInternal: smtphost
Received: from nalasex01b.na.qualcomm.com ([10.47.209.197])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 05:52:43 -0800
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 1 Feb 2023 05:52:37 -0800
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
To: <krzysztof.kozlowski+dt@linaro.org>, <agross@kernel.org>,
 <andersson@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <robh+dt@kernel.org>, <quic_plai@quicinc.com>, <bgoswami@quicinc.com>,
 <srinivas.kandagatla@linaro.org>, <quic_rohkumar@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>, <swboyd@chromium.org>,
 <judyhsiao@chromium.org>, <devicetree@vger.kernel.org>,
 <konrad.dybcio@linaro.org>
Subject: [PATCH 13/14] ASoC: qdsp6: audioreach: Add MP3,
 AAC and FLAC compress format support
Date: Wed, 1 Feb 2023 19:19:46 +0530
Message-ID: <20230201134947.1638197-14-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230201134947.1638197-1-quic_mohs@quicinc.com>
References: <20230201134947.1638197-1-quic_mohs@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-Mailman-Approved-At: Wed, 01 Feb 2023 15:52:51 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add support for handling compressed formats such as MP3, AAC and FLAC.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.c | 106 ++++++++++++++++++++++++------
 1 file changed, 86 insertions(+), 20 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 7c45c36e9156..250ed828c7d3 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -852,6 +852,68 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 	return rc;
 }
 
+static int  audioreach_set_compr_media_format(struct media_format *media_fmt_hdr,
+					      void *p, struct audioreach_module_config *mcfg)
+{
+	struct payload_media_fmt_aac_t *aac_cfg;
+	struct payload_media_fmt_pcm *mp3_cfg;
+	struct payload_media_fmt_flac_t *flac_cfg;
+	int ret = 0;
+
+	switch (mcfg->fmt) {
+	case SND_AUDIOCODEC_MP3:
+		media_fmt_hdr->data_format = DATA_FORMAT_RAW_COMPRESSED;
+		media_fmt_hdr->fmt_id = MEDIA_FMT_ID_MP3;
+		media_fmt_hdr->payload_size = 0;
+		p = p + sizeof(*media_fmt_hdr);
+		mp3_cfg = p;
+		mp3_cfg->sample_rate = mcfg->sample_rate;
+		mp3_cfg->bit_width = mcfg->bit_width;
+		mp3_cfg->alignment = PCM_LSB_ALIGNED;
+		mp3_cfg->bits_per_sample = mcfg->bit_width;
+		mp3_cfg->q_factor = mcfg->bit_width - 1;
+		mp3_cfg->endianness = PCM_LITTLE_ENDIAN;
+		mp3_cfg->num_channels = mcfg->num_channels;
+
+		if (mcfg->num_channels == 1) {
+			mp3_cfg->channel_mapping[0] =  PCM_CHANNEL_L;
+		} else if (mcfg->num_channels == 2) {
+			mp3_cfg->channel_mapping[0] =  PCM_CHANNEL_L;
+			mp3_cfg->channel_mapping[1] =  PCM_CHANNEL_R;
+		}
+		break;
+	case SND_AUDIOCODEC_AAC:
+		media_fmt_hdr->data_format = DATA_FORMAT_RAW_COMPRESSED;
+		media_fmt_hdr->fmt_id = MEDIA_FMT_ID_AAC;
+		media_fmt_hdr->payload_size = sizeof(struct payload_media_fmt_aac_t);
+		p = p + sizeof(*media_fmt_hdr);
+		aac_cfg = p;
+		aac_cfg->aac_fmt_flag = 0;
+		aac_cfg->audio_obj_type = 5;
+		aac_cfg->num_channels = mcfg->num_channels;
+		aac_cfg->total_size_of_PCE_bits = 0;
+		aac_cfg->sample_rate = mcfg->sample_rate;
+		break;
+	case SND_AUDIOCODEC_FLAC:
+		media_fmt_hdr->data_format = DATA_FORMAT_RAW_COMPRESSED;
+		media_fmt_hdr->fmt_id = MEDIA_FMT_ID_FLAC;
+		media_fmt_hdr->payload_size = sizeof(struct payload_media_fmt_flac_t);
+		p = p + sizeof(*media_fmt_hdr);
+		flac_cfg = p;
+		flac_cfg->sample_size = mcfg->codec.options.flac_d.sample_size;
+		flac_cfg->num_channels = mcfg->num_channels;
+		flac_cfg->min_blk_size = mcfg->codec.options.flac_d.min_blk_size;
+		flac_cfg->max_blk_size = mcfg->codec.options.flac_d.max_blk_size;
+		flac_cfg->sample_rate = mcfg->sample_rate;
+		flac_cfg->min_frame_size = mcfg->codec.options.flac_d.min_frame_size;
+		flac_cfg->max_frame_size = mcfg->codec.options.flac_d.max_frame_size;
+		break;
+	default:
+		return -EINVAL;
+	}
+	return ret;
+}
+
 static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
 					   struct audioreach_module *module,
 					   struct audioreach_module_config *cfg)
@@ -1055,26 +1117,29 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
 	p = p + APM_MODULE_PARAM_DATA_SIZE;
 
 	header = p;
-	header->data_format = DATA_FORMAT_FIXED_POINT;
-	header->fmt_id = MEDIA_FMT_ID_PCM;
-	header->payload_size = payload_size - sizeof(*header);
+	if (mcfg->fmt == SND_AUDIOCODEC_PCM) {
+		header->data_format = DATA_FORMAT_FIXED_POINT;
+		header->fmt_id =  MEDIA_FMT_ID_PCM;
+		header->payload_size = payload_size - sizeof(*header);
 
-	p = p + sizeof(*header);
-	cfg = p;
-	cfg->sample_rate = mcfg->sample_rate;
-	cfg->bit_width = mcfg->bit_width;
-	cfg->alignment = PCM_LSB_ALIGNED;
-	cfg->bits_per_sample = mcfg->bit_width;
-	cfg->q_factor = mcfg->bit_width - 1;
-	cfg->endianness = PCM_LITTLE_ENDIAN;
-	cfg->num_channels = mcfg->num_channels;
-
-	if (mcfg->num_channels == 1) {
-		cfg->channel_mapping[0] =  PCM_CHANNEL_L;
-	} else if (num_channels == 2) {
-		cfg->channel_mapping[0] =  PCM_CHANNEL_L;
-		cfg->channel_mapping[1] =  PCM_CHANNEL_R;
-	}
+		p = p + sizeof(*header);
+		cfg = p;
+		cfg->sample_rate = mcfg->sample_rate;
+		cfg->bit_width = mcfg->bit_width;
+		cfg->alignment = PCM_LSB_ALIGNED;
+		cfg->bits_per_sample = mcfg->bit_width;
+		cfg->q_factor = mcfg->bit_width - 1;
+		cfg->endianness = PCM_LITTLE_ENDIAN;
+		cfg->num_channels = mcfg->num_channels;
+
+		if (mcfg->num_channels == 1)
+			cfg->channel_mapping[0] =  PCM_CHANNEL_L;
+		else if (num_channels == 2) {
+			cfg->channel_mapping[0] =  PCM_CHANNEL_L;
+			cfg->channel_mapping[1] =  PCM_CHANNEL_R;
+		}
+	} else
+		audioreach_set_compr_media_format(header, p, mcfg);
 
 	rc = audioreach_graph_send_cmd_sync(graph, pkt, 0);
 
@@ -1401,7 +1466,8 @@ int audioreach_compr_set_param(struct q6apm_graph *graph, struct audioreach_modu
 			cfg->channel_mapping[0] =  PCM_CHANNEL_L;
 			cfg->channel_mapping[1] =  PCM_CHANNEL_R;
 		}
-	}
+	} else
+		audioreach_set_compr_media_format(header, p, mcfg);
 
 	rc = gpr_send_port_pkt(graph->port, pkt);
 	kfree(pkt);
-- 
2.25.1

