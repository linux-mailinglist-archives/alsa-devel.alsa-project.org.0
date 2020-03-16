Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2474D187203
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Mar 2020 19:13:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0D5218DC;
	Mon, 16 Mar 2020 19:12:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0D5218DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584382387;
	bh=H9OY2NGagYafL6WxzthlPvW5zHwhY+5cOZVIU2kxoNM=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Bjrfzjww87ii48ENCsN7lHW+HfTEOhFkVp416LcsTB08SuBrTmVhFx3J+ic035gR3
	 aIOsoF1Vkj53e9RyVIE1xLH4VkqwtQNPOdwV/aQpTKDRpQPH/gR1qljIe+Rm8GTc21
	 UWGobLEvTGxgqe7r0s+9QsKN6OPHaA8myKnsbTZg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6170DF802D2;
	Mon, 16 Mar 2020 19:08:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48DF4F802C4; Mon, 16 Mar 2020 19:08:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 7133CF802BD
 for <alsa-devel@alsa-project.org>; Mon, 16 Mar 2020 19:08:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7133CF802BD
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 805771FB;
 Mon, 16 Mar 2020 11:08:20 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 02FDF3F67D;
 Mon, 16 Mar 2020 11:08:19 -0700 (PDT)
Date: Mon, 16 Mar 2020 18:08:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: Applied "ASoC: qcom: q6asm: add support to wma config" to the asoc
 tree
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

   ASoC: qcom: q6asm: add support to wma config

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

From 97163eadf18bff306b1cf8a8fa81938c5509899c Mon Sep 17 00:00:00 2001
From: Vinod Koul <vkoul@kernel.org>
Date: Mon, 16 Mar 2020 11:22:16 +0530
Subject: [PATCH] ASoC: qcom: q6asm: add support to wma config

Qualcomm DSPs expect wma v9 and wma v10 configs to be set for wma
decoders, so add the API to program the respective wma config to the DSP

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20200316055221.1944464-5-vkoul@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/qcom/qdsp6/q6asm.c | 123 +++++++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6asm.h |  17 +++++
 2 files changed, 140 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index 64eb7b6ba305..4cec95c657ba 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -39,6 +39,8 @@
 #define ASM_MEDIA_FMT_MULTI_CHANNEL_PCM_V2	0x00010DA5
 #define ASM_MEDIA_FMT_MP3			0x00010BE9
 #define ASM_MEDIA_FMT_FLAC			0x00010C16
+#define ASM_MEDIA_FMT_WMA_V9			0x00010DA8
+#define ASM_MEDIA_FMT_WMA_V10			0x00010DA7
 #define ASM_DATA_CMD_WRITE_V2			0x00010DAB
 #define ASM_DATA_CMD_READ_V2			0x00010DAC
 #define ASM_SESSION_CMD_SUSPEND			0x00010DEC
@@ -104,6 +106,33 @@ struct asm_flac_fmt_blk_v2 {
 	u16 reserved;
 } __packed;
 
+struct asm_wmastdv9_fmt_blk_v2 {
+	struct asm_data_cmd_media_fmt_update_v2 fmt_blk;
+	u16          fmtag;
+	u16          num_channels;
+	u32          sample_rate;
+	u32          bytes_per_sec;
+	u16          blk_align;
+	u16          bits_per_sample;
+	u32          channel_mask;
+	u16          enc_options;
+	u16          reserved;
+} __packed;
+
+struct asm_wmaprov10_fmt_blk_v2 {
+	struct asm_data_cmd_media_fmt_update_v2 fmt_blk;
+	u16          fmtag;
+	u16          num_channels;
+	u32          sample_rate;
+	u32          bytes_per_sec;
+	u16          blk_align;
+	u16          bits_per_sample;
+	u32          channel_mask;
+	u16          enc_options;
+	u16          advanced_enc_options1;
+	u32          advanced_enc_options2;
+} __packed;
+
 struct asm_stream_cmd_set_encdec_param {
 	u32                  param_id;
 	u32                  param_size;
@@ -894,6 +923,24 @@ int q6asm_open_write(struct audio_client *ac, uint32_t format,
 	case SND_AUDIOCODEC_FLAC:
 		open->dec_fmt_id = ASM_MEDIA_FMT_FLAC;
 		break;
+	case SND_AUDIOCODEC_WMA:
+		switch (codec_profile) {
+		case SND_AUDIOPROFILE_WMA9:
+			open->dec_fmt_id = ASM_MEDIA_FMT_WMA_V9;
+			break;
+		case SND_AUDIOPROFILE_WMA10:
+		case SND_AUDIOPROFILE_WMA9_PRO:
+		case SND_AUDIOPROFILE_WMA9_LOSSLESS:
+		case SND_AUDIOPROFILE_WMA10_LOSSLESS:
+			open->dec_fmt_id = ASM_MEDIA_FMT_WMA_V10;
+			break;
+		default:
+			dev_err(ac->dev, "Invalid codec profile 0x%x\n",
+				codec_profile);
+			rc = -EINVAL;
+			goto err;
+		}
+		break;
 	default:
 		dev_err(ac->dev, "Invalid format 0x%x\n", format);
 		rc = -EINVAL;
@@ -1075,6 +1122,82 @@ int q6asm_stream_media_format_block_flac(struct audio_client *ac,
 	return rc;
 }
 EXPORT_SYMBOL_GPL(q6asm_stream_media_format_block_flac);
+
+int q6asm_stream_media_format_block_wma_v9(struct audio_client *ac,
+					   struct q6asm_wma_cfg *cfg)
+{
+	struct asm_wmastdv9_fmt_blk_v2 *fmt;
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
+	fmt->fmtag = cfg->fmtag;
+	fmt->num_channels = cfg->num_channels;
+	fmt->sample_rate = cfg->sample_rate;
+	fmt->bytes_per_sec = cfg->bytes_per_sec;
+	fmt->blk_align = cfg->block_align;
+	fmt->bits_per_sample = cfg->bits_per_sample;
+	fmt->channel_mask = cfg->channel_mask;
+	fmt->enc_options = cfg->enc_options;
+	fmt->reserved = 0;
+
+	rc = q6asm_ac_send_cmd_sync(ac, pkt);
+	kfree(pkt);
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(q6asm_stream_media_format_block_wma_v9);
+
+int q6asm_stream_media_format_block_wma_v10(struct audio_client *ac,
+					    struct q6asm_wma_cfg *cfg)
+{
+	struct asm_wmaprov10_fmt_blk_v2 *fmt;
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
+	fmt->fmtag = cfg->fmtag;
+	fmt->num_channels = cfg->num_channels;
+	fmt->sample_rate = cfg->sample_rate;
+	fmt->bytes_per_sec = cfg->bytes_per_sec;
+	fmt->blk_align = cfg->block_align;
+	fmt->bits_per_sample = cfg->bits_per_sample;
+	fmt->channel_mask = cfg->channel_mask;
+	fmt->enc_options = cfg->enc_options;
+	fmt->advanced_enc_options1 = cfg->adv_enc_options;
+	fmt->advanced_enc_options2 = cfg->adv_enc_options2;
+
+	rc = q6asm_ac_send_cmd_sync(ac, pkt);
+	kfree(pkt);
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(q6asm_stream_media_format_block_wma_v10);
+
 /**
  * q6asm_enc_cfg_blk_pcm_format_support() - setup pcm configuration for capture
  *
diff --git a/sound/soc/qcom/qdsp6/q6asm.h b/sound/soc/qcom/qdsp6/q6asm.h
index 1cff7f68b95d..5d9fbc75688c 100644
--- a/sound/soc/qcom/qdsp6/q6asm.h
+++ b/sound/soc/qcom/qdsp6/q6asm.h
@@ -45,6 +45,19 @@ struct q6asm_flac_cfg {
         u16 md5_sum;
 };
 
+struct q6asm_wma_cfg {
+	u32 fmtag;
+	u32 num_channels;
+	u32 sample_rate;
+	u32 bytes_per_sec;
+	u32 block_align;
+	u32 bits_per_sample;
+	u32 channel_mask;
+	u32 enc_options;
+	u32 adv_enc_options;
+	u32 adv_enc_options2;
+};
+
 typedef void (*q6asm_cb) (uint32_t opcode, uint32_t token,
 			  void *payload, void *priv);
 struct audio_client;
@@ -69,6 +82,10 @@ int q6asm_media_format_block_multi_ch_pcm(struct audio_client *ac,
 					  uint16_t bits_per_sample);
 int q6asm_stream_media_format_block_flac(struct audio_client *ac,
 					 struct q6asm_flac_cfg *cfg);
+int q6asm_stream_media_format_block_wma_v9(struct audio_client *ac,
+					   struct q6asm_wma_cfg *cfg);
+int q6asm_stream_media_format_block_wma_v10(struct audio_client *ac,
+					    struct q6asm_wma_cfg *cfg);
 int q6asm_run(struct audio_client *ac, uint32_t flags, uint32_t msw_ts,
 	      uint32_t lsw_ts);
 int q6asm_run_nowait(struct audio_client *ac, uint32_t flags, uint32_t msw_ts,
-- 
2.20.1

