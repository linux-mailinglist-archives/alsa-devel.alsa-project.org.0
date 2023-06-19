Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB047351D8
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jun 2023 12:19:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D6EEAE9;
	Mon, 19 Jun 2023 12:18:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D6EEAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687169985;
	bh=bDly2+KiyBKtyy7SnPQ7XRZas0OqMjakvg5jNUJk+5U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DJRWN142HuRB70LOtRdXmtXB/nxvD7xTZ4AwxLzFPrdwJiA/TjWuGKYqd3N/3pjm5
	 2PqT+J0iW/v3nTZAFqMv0gsX6UByCgAPfsvZref7A6IkTYUtwnlnXPrno3qFKUr2Bs
	 KczEIf8XVwabUdLRwxn9i0IFtbBq9GJxtsIUA88c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D741BF805BD; Mon, 19 Jun 2023 12:17:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 230D4F805B0;
	Mon, 19 Jun 2023 12:17:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFF88F80571; Mon, 19 Jun 2023 12:17:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 71E24F80132
	for <alsa-devel@alsa-project.org>; Mon, 19 Jun 2023 12:17:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71E24F80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=s5rAk5fL
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3112902f785so1584821f8f.0
        for <alsa-devel@alsa-project.org>;
 Mon, 19 Jun 2023 03:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687169821; x=1689761821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYs30udEL8nhpF3tCDr6b0n4CbAIdCAeMZJMw59Oucc=;
        b=s5rAk5fL+527HFVNAUOWsp4wnKx2MX4c5Ul3TFnLxc2r6hC5E7Suq4kRZ3BkXk7D7M
         4YqEHVF7V3hIZEPybDue4dVIWh1Z/bPtVCMIwx0a01MUnhW4SBE3POPkfTrsJKxUN1K5
         eQAewL53ELoqd/vJ5FbJz3KDRdEGCRc2hwxXHY+EnM4/8DMzWqUzV3yns/QAbb7w2vrH
         8B+w9gImVo8ecwTqyxwuJ+7rMnQln+YBBlzz8ACN9hioq01NI0yGV8vK++nEu83mT2nv
         JXIHaLezqLjr5Vx7/DX6GwBit2pVg8XeM3DIxXWucZRJCpB7jYi2eue1QC30UJ6uQ5YG
         vZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687169821; x=1689761821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iYs30udEL8nhpF3tCDr6b0n4CbAIdCAeMZJMw59Oucc=;
        b=Cahf+srR4HBVoF6lL7HgJNdyEuN5QIh3LoJhdS34xVFsHz1cj04ABA4WTEMf1RbJhs
         Fs/2zm8a4z+fAF2ce8otrug5bv6t4FWbvT1dovZn4DVyivz5o9az159AAtoOKLMC+oc0
         u49oSCz6Yk8100F1+KETmyuISSTZissudFq9uhtX172XzVlkAdiLL85YGpiJ847qqhSk
         zgYcGRBNxMGYQCh6l3qygVKnuStq6ygBxUIJSMXVpKKL4UaJOPp62ghYyPQ29usQp9Qk
         cIOU/tZcWNIZUrqSxmjq1yKG3v8oKNCqPTa72t5udiZxlsTvsAxC8tGWqfVUFAeNCGwd
         RpRQ==
X-Gm-Message-State: AC+VfDwq6KpgJ2RcCugMN12e6KTUzhBYCn4TjQYbZv5vtTAZY1y/w9xW
	0cHgGSRiEVbSW2/FDSd85Dqdtw==
X-Google-Smtp-Source: 
 ACHHUZ5nlFKBSPgL2hxULeGcw8a0m8INaIQY81kSCHA7LcAiEOx0bFvbB+1yAnBnYTWsi0BaY1MqlA==
X-Received: by 2002:adf:f1c5:0:b0:307:7959:6461 with SMTP id
 z5-20020adff1c5000000b0030779596461mr8136462wro.31.1687169821671;
        Mon, 19 Jun 2023 03:17:01 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 c2-20020a5d5282000000b002fae7408544sm31146922wrv.108.2023.06.19.03.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 03:17:01 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org,
	Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 05/11] ASoC: q6dsp: audioreach: Add support to set compress
 format params
Date: Mon, 19 Jun 2023 11:16:47 +0100
Message-Id: <20230619101653.9750-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230619101653.9750-1-srinivas.kandagatla@linaro.org>
References: <20230619101653.9750-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AGHDCN5QFITFQAOB3LAX35A2RERFNNE3
X-Message-ID-Hash: AGHDCN5QFITFQAOB3LAX35A2RERFNNE3
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AGHDCN5QFITFQAOB3LAX35A2RERFNNE3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

Add function for setting compress params.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.c | 139 ++++++++++++++++++++++++++----
 sound/soc/qcom/qdsp6/audioreach.h |  28 ++++++
 sound/soc/qcom/qdsp6/q6apm-dai.c  |   1 +
 3 files changed, 149 insertions(+), 19 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 34cbc4d05918..ba262408b27a 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -834,6 +834,99 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 	return rc;
 }
 
+static int audioreach_set_compr_media_format(struct media_format *media_fmt_hdr,
+					     void *p, struct audioreach_module_config *mcfg)
+{
+	struct payload_media_fmt_aac_t *aac_cfg;
+	struct payload_media_fmt_pcm *mp3_cfg;
+	struct payload_media_fmt_flac_t *flac_cfg;
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
+
+	return 0;
+}
+
+int audioreach_compr_set_param(struct q6apm_graph *graph, struct audioreach_module_config *mcfg)
+{
+	struct media_format *header;
+	struct gpr_pkt *pkt;
+	int iid, payload_size, rc;
+	void *p;
+
+	payload_size = sizeof(struct apm_sh_module_media_fmt_cmd);
+
+	iid = q6apm_graph_get_rx_shmem_module_iid(graph);
+	pkt = audioreach_alloc_cmd_pkt(payload_size, DATA_CMD_WR_SH_MEM_EP_MEDIA_FORMAT,
+			0, graph->port->id, iid);
+
+	if (IS_ERR(pkt))
+		return -ENOMEM;
+
+	p = (void *)pkt + GPR_HDR_SIZE;
+	header = p;
+	rc = audioreach_set_compr_media_format(header, p, mcfg);
+	if (rc) {
+		kfree(pkt);
+		return rc;
+	}
+
+	rc = gpr_send_port_pkt(graph->port, pkt);
+	kfree(pkt);
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(audioreach_compr_set_param);
+
 static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
 					   struct audioreach_module *module,
 					   struct audioreach_module_config *cfg)
@@ -1037,25 +1130,33 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
 	p = p + APM_MODULE_PARAM_DATA_SIZE;
 
 	header = p;
-	header->data_format = DATA_FORMAT_FIXED_POINT;
-	header->fmt_id = MEDIA_FMT_ID_PCM;
-	header->payload_size = payload_size - sizeof(*header);
-
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
+	if (mcfg->fmt == SND_AUDIOCODEC_PCM) {
+		header->data_format = DATA_FORMAT_FIXED_POINT;
+		header->fmt_id =  MEDIA_FMT_ID_PCM;
+		header->payload_size = payload_size - sizeof(*header);
+
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
+	} else {
+		rc = audioreach_set_compr_media_format(header, p, mcfg);
+		if (rc) {
+			kfree(pkt);
+			return rc;
+		}
 	}
 
 	rc = audioreach_graph_send_cmd_sync(graph, pkt, 0);
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index c4e03a49ac82..dc089879b501 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -148,12 +148,15 @@ struct param_id_enc_bitrate_param {
 } __packed;
 
 #define DATA_FORMAT_FIXED_POINT		1
+#define DATA_FORMAT_GENERIC_COMPRESSED	5
+#define DATA_FORMAT_RAW_COMPRESSED	6
 #define PCM_LSB_ALIGNED			1
 #define PCM_MSB_ALIGNED			2
 #define PCM_LITTLE_ENDIAN		1
 #define PCM_BIT_ENDIAN			2
 
 #define MEDIA_FMT_ID_PCM	0x09001000
+#define MEDIA_FMT_ID_MP3	0x09001009
 #define PCM_CHANNEL_L		1
 #define PCM_CHANNEL_R		2
 #define SAMPLE_RATE_48K		48000
@@ -231,6 +234,28 @@ struct apm_media_format {
 	uint32_t payload_size;
 } __packed;
 
+#define MEDIA_FMT_ID_FLAC	0x09001004
+
+struct payload_media_fmt_flac_t {
+	uint16_t num_channels;
+	uint16_t sample_size;
+	uint16_t min_blk_size;
+	uint16_t max_blk_size;
+	uint32_t sample_rate;
+	uint32_t min_frame_size;
+	uint32_t max_frame_size;
+} __packed;
+
+#define MEDIA_FMT_ID_AAC	0x09001001
+
+struct payload_media_fmt_aac_t {
+	uint16_t aac_fmt_flag;
+	uint16_t audio_obj_type;
+	uint16_t num_channels;
+	uint16_t total_size_of_PCE_bits;
+	uint32_t sample_rate;
+} __packed;
+
 #define DATA_CMD_WR_SH_MEM_EP_EOS			0x04001002
 #define WR_SH_MEM_EP_EOS_POLICY_LAST	1
 #define WR_SH_MEM_EP_EOS_POLICY_EACH	2
@@ -730,6 +755,7 @@ struct audioreach_module_config {
 	u32	channel_allocation;
 	u32	sd_line_mask;
 	int	fmt;
+	struct snd_codec codec;
 	u8 channel_map[AR_PCM_MAX_NUM_CHANNEL];
 };
 
@@ -768,4 +794,6 @@ int audioreach_gain_set_vol_ctrl(struct q6apm *apm,
 				 struct audioreach_module *module, int vol);
 int audioreach_send_u32_param(struct q6apm_graph *graph, struct audioreach_module *module,
 			      uint32_t param_id, uint32_t param_val);
+int audioreach_compr_set_param(struct q6apm_graph *graph, struct audioreach_module_config *mcfg);
+
 #endif /* __AUDIOREACH_H__ */
diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 7f02f5b2c33f..9fff41ee98eb 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -155,6 +155,7 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
 	cfg.sample_rate = runtime->rate;
 	cfg.num_channels = runtime->channels;
 	cfg.bit_width = prtd->bits_per_sample;
+	cfg.fmt = SND_AUDIOCODEC_PCM;
 
 	if (prtd->state) {
 		/* clear the previous setup if any  */
-- 
2.21.0

