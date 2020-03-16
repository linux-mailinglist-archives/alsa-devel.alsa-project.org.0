Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B34DF1864DB
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Mar 2020 06:59:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46EC81899;
	Mon, 16 Mar 2020 06:58:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46EC81899
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584338364;
	bh=gJilxXwLTj8c2GYjN3RvcEFAZQ5/KAmE5G/jXrKmasc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BhPcQ+NNvDQpg/FcQv7X59ehA9IP5yH2Yaricop2AJDpkrK4XFL2HUDfpZ9dLgzpp
	 Lgjz1J9KLLGMJufD4Wy4CffEAsE/9CQdHEJYzObsRPrFYfshex2/bSld0SKCtaTlN1
	 K5F8Kx55FY0FePos2SehzjWeJBmvuz3Hsgq8inKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBCD3F80162;
	Mon, 16 Mar 2020 06:56:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDAC1F802A7; Mon, 16 Mar 2020 06:56:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAE40F80110
 for <alsa-devel@alsa-project.org>; Mon, 16 Mar 2020 06:56:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAE40F80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qXFTME3Q"
Received: from vkoul-mobl.Dlink (unknown [49.207.58.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1A0F220663;
 Mon, 16 Mar 2020 05:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584338180;
 bh=gJilxXwLTj8c2GYjN3RvcEFAZQ5/KAmE5G/jXrKmasc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qXFTME3QUT8VlKFZhqG36kFjLRxraQ93M6viT4WKym8pFKTWIkoALE39zoxVf8ECy
 FqPsqxdUD2RTi0PEItQ6VKnxbyOMjyRZYkVr2oKNdSo1wHvXQZi1tNxQPvnnzoQncQ
 pScwcFgRCjbVKY91ZfhkBhSniKk9Cw452KKkcLFg=
From: Vinod Koul <vkoul@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 7/9] ASoC: qcom: q6asm: add support for alac and ape configs
Date: Mon, 16 Mar 2020 11:22:19 +0530
Message-Id: <20200316055221.1944464-8-vkoul@kernel.org>
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

Qualcomm DSPs expect ALAC and APE configs to be send for decoders,
so add the API to program the respective config to the DSP.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 sound/soc/qcom/qdsp6/q6asm.c | 118 +++++++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6asm.h |  32 ++++++++++
 2 files changed, 150 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index 4cec95c657ba..0e0e8f7a460a 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -48,6 +48,8 @@
 #define ASM_STREAM_CMD_OPEN_READ_V3                 0x00010DB4
 #define ASM_DATA_EVENT_READ_DONE_V2 0x00010D9A
 #define ASM_STREAM_CMD_OPEN_READWRITE_V2        0x00010D8D
+#define ASM_MEDIA_FMT_ALAC			0x00012f31
+#define ASM_MEDIA_FMT_APE			0x00012f32
 
 
 #define ASM_LEGACY_STREAM_SESSION	0
@@ -133,6 +135,36 @@ struct asm_wmaprov10_fmt_blk_v2 {
 	u32          advanced_enc_options2;
 } __packed;
 
+struct asm_alac_fmt_blk_v2 {
+	struct asm_data_cmd_media_fmt_update_v2 fmt_blk;
+	u32 frame_length;
+	u8 compatible_version;
+	u8 bit_depth;
+	u8 pb;
+	u8 mb;
+	u8 kb;
+	u8 num_channels;
+	u16 max_run;
+	u32 max_frame_bytes;
+	u32 avg_bit_rate;
+	u32 sample_rate;
+	u32 channel_layout_tag;
+} __packed;
+
+struct asm_ape_fmt_blk_v2 {
+	struct asm_data_cmd_media_fmt_update_v2 fmt_blk;
+	u16 compatible_version;
+	u16 compression_level;
+	u32 format_flags;
+	u32 blocks_per_frame;
+	u32 final_frame_blocks;
+	u32 total_frames;
+	u16 bits_per_sample;
+	u16 num_channels;
+	u32 sample_rate;
+	u32 seek_table_present;
+} __packed;
+
 struct asm_stream_cmd_set_encdec_param {
 	u32                  param_id;
 	u32                  param_size;
@@ -941,6 +973,12 @@ int q6asm_open_write(struct audio_client *ac, uint32_t format,
 			goto err;
 		}
 		break;
+	case SND_AUDIOCODEC_ALAC:
+		open->dec_fmt_id = ASM_MEDIA_FMT_ALAC;
+		break;
+	case SND_AUDIOCODEC_APE:
+		open->dec_fmt_id = ASM_MEDIA_FMT_APE;
+		break;
 	default:
 		dev_err(ac->dev, "Invalid format 0x%x\n", format);
 		rc = -EINVAL;
@@ -1198,6 +1236,86 @@ int q6asm_stream_media_format_block_wma_v10(struct audio_client *ac,
 }
 EXPORT_SYMBOL_GPL(q6asm_stream_media_format_block_wma_v10);
 
+int q6asm_stream_media_format_block_alac(struct audio_client *ac,
+					 struct q6asm_alac_cfg *cfg)
+{
+	struct asm_alac_fmt_blk_v2 *fmt;
+	struct apr_pkt *pkt;
+	void *p;
+	int rc, pkt_size;
+
+	pkt_size = APR_HDR_SIZE + sizeof(*fmt);
+	p = kzalloc(pkt_size, GFP_KERNEL);
+	if (!p)
+		return -ENOMEM;
+
+	pkt = p;
+	fmt = p + APR_HDR_SIZE;
+
+	q6asm_add_hdr(ac, &pkt->hdr, pkt_size, true, ac->stream_id);
+
+	pkt->hdr.opcode = ASM_DATA_CMD_MEDIA_FMT_UPDATE_V2;
+	fmt->fmt_blk.fmt_blk_size = sizeof(*fmt) - sizeof(fmt->fmt_blk);
+
+	fmt->frame_length = cfg->frame_length;
+	fmt->compatible_version = cfg->compatible_version;
+	fmt->bit_depth =  cfg->bit_depth;
+	fmt->num_channels = cfg->num_channels;
+	fmt->max_run = cfg->max_run;
+	fmt->max_frame_bytes = cfg->max_frame_bytes;
+	fmt->avg_bit_rate = cfg->avg_bit_rate;
+	fmt->sample_rate = cfg->sample_rate;
+	fmt->channel_layout_tag = cfg->channel_layout_tag;
+	fmt->pb = cfg->pb;
+	fmt->mb = cfg->mb;
+	fmt->kb = cfg->kb;
+
+	rc = q6asm_ac_send_cmd_sync(ac, pkt);
+	kfree(pkt);
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(q6asm_stream_media_format_block_alac);
+
+int q6asm_stream_media_format_block_ape(struct audio_client *ac,
+					struct q6asm_ape_cfg *cfg)
+{
+	struct asm_ape_fmt_blk_v2 *fmt;
+	struct apr_pkt *pkt;
+	void *p;
+	int rc, pkt_size;
+
+	pkt_size = APR_HDR_SIZE + sizeof(*fmt);
+	p = kzalloc(pkt_size, GFP_KERNEL);
+	if (!p)
+		return -ENOMEM;
+
+	pkt = p;
+	fmt = p + APR_HDR_SIZE;
+
+	q6asm_add_hdr(ac, &pkt->hdr, pkt_size, true, ac->stream_id);
+
+	pkt->hdr.opcode = ASM_DATA_CMD_MEDIA_FMT_UPDATE_V2;
+	fmt->fmt_blk.fmt_blk_size = sizeof(*fmt) - sizeof(fmt->fmt_blk);
+
+	fmt->compatible_version = cfg->compatible_version;
+	fmt->compression_level = cfg->compression_level;
+	fmt->format_flags = cfg->format_flags;
+	fmt->blocks_per_frame = cfg->blocks_per_frame;
+	fmt->final_frame_blocks = cfg->final_frame_blocks;
+	fmt->total_frames = cfg->total_frames;
+	fmt->bits_per_sample = cfg->bits_per_sample;
+	fmt->num_channels = cfg->num_channels;
+	fmt->sample_rate = cfg->sample_rate;
+	fmt->seek_table_present = cfg->seek_table_present;
+
+	rc = q6asm_ac_send_cmd_sync(ac, pkt);
+	kfree(pkt);
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(q6asm_stream_media_format_block_ape);
+
 /**
  * q6asm_enc_cfg_blk_pcm_format_support() - setup pcm configuration for capture
  *
diff --git a/sound/soc/qcom/qdsp6/q6asm.h b/sound/soc/qcom/qdsp6/q6asm.h
index 5d9fbc75688c..38a207d6cd95 100644
--- a/sound/soc/qcom/qdsp6/q6asm.h
+++ b/sound/soc/qcom/qdsp6/q6asm.h
@@ -58,6 +58,34 @@ struct q6asm_wma_cfg {
 	u32 adv_enc_options2;
 };
 
+struct q6asm_alac_cfg {
+	u32 frame_length;
+	u8 compatible_version;
+	u8 bit_depth;
+	u8 pb;
+	u8 mb;
+	u8 kb;
+	u8 num_channels;
+	u16 max_run;
+	u32 max_frame_bytes;
+	u32 avg_bit_rate;
+	u32 sample_rate;
+	u32 channel_layout_tag;
+};
+
+struct q6asm_ape_cfg {
+	u16 compatible_version;
+	u16 compression_level;
+	u32 format_flags;
+	u32 blocks_per_frame;
+	u32 final_frame_blocks;
+	u32 total_frames;
+	u16 bits_per_sample;
+	u16 num_channels;
+	u32 sample_rate;
+	u32 seek_table_present;
+};
+
 typedef void (*q6asm_cb) (uint32_t opcode, uint32_t token,
 			  void *payload, void *priv);
 struct audio_client;
@@ -86,6 +114,10 @@ int q6asm_stream_media_format_block_wma_v9(struct audio_client *ac,
 					   struct q6asm_wma_cfg *cfg);
 int q6asm_stream_media_format_block_wma_v10(struct audio_client *ac,
 					    struct q6asm_wma_cfg *cfg);
+int q6asm_stream_media_format_block_alac(struct audio_client *ac,
+					 struct q6asm_alac_cfg *cfg);
+int q6asm_stream_media_format_block_ape(struct audio_client *ac,
+					struct q6asm_ape_cfg *cfg);
 int q6asm_run(struct audio_client *ac, uint32_t flags, uint32_t msw_ts,
 	      uint32_t lsw_ts);
 int q6asm_run_nowait(struct audio_client *ac, uint32_t flags, uint32_t msw_ts,
-- 
2.24.1

