Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A199EFDB69
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 11:30:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F9BC1655;
	Fri, 15 Nov 2019 11:30:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F9BC1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573813854;
	bh=BlolN/Vx2+utVhAXQ6K3fC4oz/7YFL94w3B+RqbuhUY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lY3cLeBNib4PiEOitWUcHKbzVg4EhFRhbQqbQajBMgDgavKG3y9q2BGD8N9uvhbLq
	 2OdeSznZB5hhJyfw/Iqic2kye0iSExLSW8nhF7cV4HFGhQ2uVvZT78f/m1QJ0LcJPX
	 cQDfrXLsW+oyOWu9xDRYJHbsetmaUOXtvOb7rQmk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54DC7F80115;
	Fri, 15 Nov 2019 11:27:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29BD4F8010C; Fri, 15 Nov 2019 11:27:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60F4DF8010A
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 11:27:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60F4DF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="M8lZ1JCG"
Received: from vkoul-mobl.Dlink (unknown [106.51.108.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 79D3A20740;
 Fri, 15 Nov 2019 10:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573813660;
 bh=VviqurBllp9zUxZMt68W89Zm5/kd0UC8POm57cTj8Es=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M8lZ1JCGbtWQZTti31hDdRaBWu9Y1Tpr2+YXf9cCF/HX7olgeHexrrLJtXFb3sITx
 Ax4A2vx+YLiwBJmnCGsa+T7ol34USHUD3YfqbeU60x4vVUs6gvmqP2aZ45gYls11ao
 doSksZdYXkl/JP921lZGlksKy++0l9UHclX9/jeI=
From: Vinod Koul <vkoul@kernel.org>
To: Takashi Iwai <tiwai@suse.com>
Date: Fri, 15 Nov 2019 15:57:04 +0530
Message-Id: <20191115102705.649976-3-vkoul@kernel.org>
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
Subject: [alsa-devel] [RFC PATCH 2/3] ASoC: qcom: q6asm: add support to flac
	config
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

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Qualcomm DSPs expect flac config to be set for flac decoders, so add the
API to program the flac config to the DSP

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 sound/soc/qcom/qdsp6/q6asm.c | 55 ++++++++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6asm.h | 15 ++++++++++
 2 files changed, 70 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index e8141a33a55e..36e0eab13a98 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -38,6 +38,7 @@
 #define ASM_SESSION_CMD_RUN_V2			0x00010DAA
 #define ASM_MEDIA_FMT_MULTI_CHANNEL_PCM_V2	0x00010DA5
 #define ASM_MEDIA_FMT_MP3			0x00010BE9
+#define ASM_MEDIA_FMT_FLAC			0x00010C16
 #define ASM_DATA_CMD_WRITE_V2			0x00010DAB
 #define ASM_DATA_CMD_READ_V2			0x00010DAC
 #define ASM_SESSION_CMD_SUSPEND			0x00010DEC
@@ -89,6 +90,20 @@ struct asm_multi_channel_pcm_fmt_blk_v2 {
 	u8 channel_mapping[PCM_MAX_NUM_CHANNEL];
 } __packed;
 
+struct asm_flac_fmt_blk_v2 {
+	struct asm_data_cmd_media_fmt_update_v2 fmt_blk;
+	u16 is_stream_info_present;
+	u16 num_channels;
+	u16 min_blk_size;
+	u16 max_blk_size;
+	u16 md5_sum[8];
+	u32 sample_rate;
+	u32 min_frame_size;
+	u32 max_frame_size;
+	u16 sample_size;
+	u16 reserved;
+} __packed;
+
 struct asm_stream_cmd_set_encdec_param {
 	u32                  param_id;
 	u32                  param_size;
@@ -876,6 +891,9 @@ int q6asm_open_write(struct audio_client *ac, uint32_t format,
 	case FORMAT_LINEAR_PCM:
 		open->dec_fmt_id = ASM_MEDIA_FMT_MULTI_CHANNEL_PCM_V2;
 		break;
+	case SND_AUDIOCODEC_FLAC:
+		open->dec_fmt_id = ASM_MEDIA_FMT_FLAC;
+		break;
 	default:
 		dev_err(ac->dev, "Invalid format 0x%x\n", format);
 		rc = -EINVAL;
@@ -1021,6 +1039,42 @@ int q6asm_media_format_block_multi_ch_pcm(struct audio_client *ac,
 }
 EXPORT_SYMBOL_GPL(q6asm_media_format_block_multi_ch_pcm);
 
+
+int q6asm_stream_media_format_block_flac(struct audio_client *ac,
+					 struct q6asm_flac_cfg *cfg)
+{
+	struct asm_flac_fmt_blk_v2 *fmt;
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
+	fmt->is_stream_info_present = cfg->stream_info_present;
+	fmt->num_channels = cfg->ch_cfg;
+	fmt->min_blk_size = cfg->min_blk_size;
+	fmt->max_blk_size = cfg->max_blk_size;
+	fmt->sample_rate = cfg->sample_rate;
+	fmt->min_frame_size = cfg->min_frame_size;
+	fmt->max_frame_size = cfg->max_frame_size;
+	fmt->sample_size = cfg->sample_size;
+
+	rc = q6asm_ac_send_cmd_sync(ac, pkt);
+	kfree(pkt);
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(q6asm_stream_media_format_block_flac);
 /**
  * q6asm_enc_cfg_blk_pcm_format_support() - setup pcm configuration for capture
  *
@@ -1075,6 +1129,7 @@ int q6asm_enc_cfg_blk_pcm_format_support(struct audio_client *ac,
 }
 EXPORT_SYMBOL_GPL(q6asm_enc_cfg_blk_pcm_format_support);
 
+
 /**
  * q6asm_read() - read data of period size from audio client
  *
diff --git a/sound/soc/qcom/qdsp6/q6asm.h b/sound/soc/qcom/qdsp6/q6asm.h
index 9f5fb573e4a0..6764f55f7078 100644
--- a/sound/soc/qcom/qdsp6/q6asm.h
+++ b/sound/soc/qcom/qdsp6/q6asm.h
@@ -32,6 +32,19 @@ enum {
 #define NO_TIMESTAMP    0xFF00
 #define FORMAT_LINEAR_PCM   0x0000
 
+struct q6asm_flac_cfg {
+        u32 sample_rate;
+        u32 ext_sample_rate;
+        u32 min_frame_size;
+        u32 max_frame_size;
+        u16 stream_info_present;
+        u16 min_blk_size;
+        u16 max_blk_size;
+        u16 ch_cfg;
+        u16 sample_size;
+        u16 md5_sum;
+};
+
 typedef void (*q6asm_cb) (uint32_t opcode, uint32_t token,
 			  void *payload, void *priv);
 struct audio_client;
@@ -54,6 +67,8 @@ int q6asm_media_format_block_multi_ch_pcm(struct audio_client *ac,
 					  uint32_t rate, uint32_t channels,
 					  u8 channel_map[PCM_MAX_NUM_CHANNEL],
 					  uint16_t bits_per_sample);
+int q6asm_stream_media_format_block_flac(struct audio_client *ac,
+					 struct q6asm_flac_cfg *cfg);
 int q6asm_run(struct audio_client *ac, uint32_t flags, uint32_t msw_ts,
 	      uint32_t lsw_ts);
 int q6asm_run_nowait(struct audio_client *ac, uint32_t flags, uint32_t msw_ts,
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
