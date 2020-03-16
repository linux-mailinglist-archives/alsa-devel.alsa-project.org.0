Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D551871F9
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Mar 2020 19:11:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8274618D5;
	Mon, 16 Mar 2020 19:10:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8274618D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584382286;
	bh=D93DZEsBLmR+vYwW8oGGFw0mFj+LartMPjjgAi+h2tM=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=GuibUsbQKcauHNO9Q/nkOPA7iZM2HOG2uwMuGyW6PKFzKVjag7beJw0/z53jnzij0
	 q723JcDn4GF83MRxkqeSgk1PLXnBP4dW31w+Of8CTbPIzAhciAAwJTs1Ulv9Um+T49
	 BPWh4WCCpiw9OWxIEW0y3EC9o+favN+wZESWAgP0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 236C9F801DB;
	Mon, 16 Mar 2020 19:08:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FEBFF8029B; Mon, 16 Mar 2020 19:08:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 5F1C4F801DB
 for <alsa-devel@alsa-project.org>; Mon, 16 Mar 2020 19:08:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F1C4F801DB
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBA9C1FB;
 Mon, 16 Mar 2020 11:08:06 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 528843F67D;
 Mon, 16 Mar 2020 11:08:06 -0700 (PDT)
Date: Mon, 16 Mar 2020 18:08:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: Applied "ASoC: qcom: q6asm: add support for alac and ape configs" to
 the asoc tree
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

   ASoC: qcom: q6asm: add support for alac and ape configs

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

From 7076bf4da0b1b53dd5d96dc930c9899a8ad6f217 Mon Sep 17 00:00:00 2001
From: Vinod Koul <vkoul@kernel.org>
Date: Mon, 16 Mar 2020 11:22:19 +0530
Subject: [PATCH] ASoC: qcom: q6asm: add support for alac and ape configs

Qualcomm DSPs expect ALAC and APE configs to be send for decoders,
so add the API to program the respective config to the DSP.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20200316055221.1944464-8-vkoul@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
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
2.20.1

