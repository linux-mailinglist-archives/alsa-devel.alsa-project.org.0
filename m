Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A64883AB0E3
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 12:05:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D6CB16EE;
	Thu, 17 Jun 2021 12:04:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D6CB16EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623924337;
	bh=ptYpbbuux4cL3S6yzrIph5wqRKUctBJrHOQ8+t1eh6g=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=puA492XG5nzbYq7R/s+4Up+4fEZfpBtY5m6ZTap7mNiKbPtv3zy8UMjdZrycG+vL7
	 zmi0DjtbzEdr1T6yeJO5X7qQwB+L4jOJ8mS0EQ/J+xV9Zku2zRz+YPnK8p8/mZ5f3v
	 r3e1YSyFaK/Eg1JgTDSWtBg2FpbaI8WeCVPt+l20=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BF88F8025A;
	Thu, 17 Jun 2021 12:04:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B1A5F802A9; Thu, 17 Jun 2021 12:04:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13E7DF8016D
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 12:04:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13E7DF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="GmoZhiIt"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="jZGAGTO2"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id E6B0C21AF5
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 10:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623924240; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pnxKql/LyxuoEDxMyNCRMO46nY72XIS5ChGliNkyH8k=;
 b=GmoZhiItvWqwPISn7N++Sc05Y3xfgyvSArDqcEOZai9QxF2SbDcBtjJY09h3iy1j7GBMX9
 wNhphdg/KNVCQ9dA0cqmcjWalOcaXuqhaWMqJUt8cqBeNky2BbtwzLSLla6qobDivglTuO
 ACPONA5CoQg5Zz7Qf6dNCsznTJSSMR0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623924240;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pnxKql/LyxuoEDxMyNCRMO46nY72XIS5ChGliNkyH8k=;
 b=jZGAGTO2B0Tw2K6cvxpF6kHqnrKwqLWVKUqwLmr7hRraZfYjGOVhq+JYDoDAlQd6ExR9KE
 KCg9+XtBqI0MQmBg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id D729DA3BB8;
 Thu, 17 Jun 2021 10:04:00 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-plugins 1/2] rate-lav: Support multiple formats
Date: Thu, 17 Jun 2021 12:03:58 +0200
Message-Id: <20210617100359.12197-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210617100359.12197-1-tiwai@suse.de>
References: <20210617100359.12197-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Now that ALSA rate plugin core allows each rate plugin dealing with
multiple formats, this patch extends the rate-lav plugin to accept
more formats, namely, U8, S16 and S32.  The code has been carefully
modified so that it should still be compilable with old alsa-lib.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 rate-lav/rate_lavrate.c | 115 ++++++++++++++++++++++++++++++++++------
 1 file changed, 99 insertions(+), 16 deletions(-)

diff --git a/rate-lav/rate_lavrate.c b/rate-lav/rate_lavrate.c
index e9c6740ac870..2ab1d8894e63 100644
--- a/rate-lav/rate_lavrate.c
+++ b/rate-lav/rate_lavrate.c
@@ -32,6 +32,8 @@ struct rate_src {
 	unsigned int in_rate;
 	unsigned int out_rate;
 	unsigned int channels;
+
+	unsigned int version;
 };
 
 static snd_pcm_uframes_t input_frames(void *obj ATTRIBUTE_UNUSED,
@@ -52,9 +54,34 @@ static void pcm_src_free(void *obj)
 	swr_free(&rate->avr);
 }
 
+static int to_av_format(snd_pcm_format_t f)
+{
+	switch (f) {
+	case SND_PCM_FORMAT_FLOAT:
+		return AV_SAMPLE_FMT_FLT;
+	case SND_PCM_FORMAT_U8:
+		return AV_SAMPLE_FMT_U8;
+	case SND_PCM_FORMAT_S16:
+		return AV_SAMPLE_FMT_S16;
+	case SND_PCM_FORMAT_S32:
+	default:
+		return AV_SAMPLE_FMT_S32;
+	}
+}
+
+static int support_multi_format(struct rate_src *rate)
+{
+#if SND_PCM_RATE_PLUGIN_VERSION >= 0x010003
+	return rate->version >= 0x010003;
+#else
+	return 0;
+#endif
+}
+
 static int pcm_src_init(void *obj, snd_pcm_rate_info_t *info)
 {
 	struct rate_src *rate = obj;
+	int fmt;
 
 	if (!rate->avr || rate->channels != info->channels) {
 		int ret;
@@ -74,8 +101,12 @@ static int pcm_src_init(void *obj, snd_pcm_rate_info_t *info)
 					  av_get_default_channel_layout(rate->channels), 0);
 		av_opt_set_int(rate->avr, "in_sample_rate", rate->in_rate, 0);
 		av_opt_set_int(rate->avr, "out_sample_rate", rate->out_rate, 0);
-		av_opt_set_sample_fmt(rate->avr, "in_sample_fmt", AV_SAMPLE_FMT_S16, 0);
-		av_opt_set_sample_fmt(rate->avr, "out_sample_fmt", AV_SAMPLE_FMT_S16, 0);
+		fmt = support_multi_format(rate) ? info->in.format : SND_PCM_FORMAT_S16;
+		av_opt_set_sample_fmt(rate->avr, "in_sample_fmt",
+				      to_av_format(fmt), 0);
+		fmt = support_multi_format(rate) ? info->out.format : SND_PCM_FORMAT_S16;
+		av_opt_set_sample_fmt(rate->avr, "out_sample_fmt",
+				      to_av_format(fmt), 0);
 
 		ret = swr_init(rate->avr);
 		if (ret < 0) {
@@ -109,12 +140,10 @@ static void pcm_src_reset(void *obj)
 	}
 }
 
-static void pcm_src_convert_s16(void *obj, int16_t *dst,
-				unsigned int dst_frames,
-				const int16_t *src,
-				unsigned int src_frames)
+static void do_convert(struct rate_src *rate,
+		       void *dst, unsigned int dst_frames,
+		       const void *src, unsigned int src_frames)
 {
-	struct rate_src *rate = obj;
 	unsigned int total_in = swr_get_delay(rate->avr, rate->in_rate) + src_frames;
 
 	swr_convert(rate->avr, (uint8_t **)&dst, dst_frames,
@@ -125,6 +154,38 @@ static void pcm_src_convert_s16(void *obj, int16_t *dst,
 			     src_frames);
 }
 
+#if SND_PCM_RATE_PLUGIN_VERSION >= 0x010003
+static inline void *get_addr(const snd_pcm_channel_area_t *area, snd_pcm_uframes_t offset)
+{
+	return (char *)area->addr + (area->first + area->step * offset) / 8;
+}
+
+static void pcm_src_convert(void *obj,
+			    const snd_pcm_channel_area_t *dst_areas,
+			    snd_pcm_uframes_t dst_offset,
+			    unsigned int dst_frames,
+			    const snd_pcm_channel_area_t *src_areas,
+			    snd_pcm_uframes_t src_offset,
+			    unsigned int src_frames)
+{
+	struct rate_src *rate = obj;
+	const void *src = get_addr(src_areas, src_offset);
+	void *dst = get_addr(dst_areas, dst_offset);
+
+	do_convert(rate, dst, dst_frames, src, src_frames);
+}
+#endif
+
+static void pcm_src_convert_s16(void *obj, int16_t *dst,
+				unsigned int dst_frames,
+				const int16_t *src,
+				unsigned int src_frames)
+{
+	struct rate_src *rate = obj;
+
+	do_convert(rate, dst, dst_frames, src, src_frames);
+}
+
 static void pcm_src_close(void *obj)
 {
 	pcm_src_free(obj);
@@ -145,12 +206,29 @@ static void dump(void *obj ATTRIBUTE_UNUSED, snd_output_t *out)
 }
 #endif
 
+#if SND_PCM_RATE_PLUGIN_VERSION >= 0x010003
+static int get_supported_formats(void *obj, uint64_t *in_formats,
+				 uint64_t *out_formats,
+				 unsigned int *flags)
+{
+	*in_formats = *out_formats =
+		(1ULL << SND_PCM_FORMAT_U8) |
+		(1ULL << SND_PCM_FORMAT_S16) |
+		(1ULL << SND_PCM_FORMAT_S32);
+	*flags = SND_PCM_RATE_FLAG_INTERLEAVED;
+	return 0;
+}
+#endif
+
 static snd_pcm_rate_ops_t pcm_src_ops = {
 	.close = pcm_src_close,
 	.init = pcm_src_init,
 	.free = pcm_src_free,
 	.reset = pcm_src_reset,
 	.adjust_pitch = pcm_src_adjust_pitch,
+#if SND_PCM_RATE_PLUGIN_VERSION >= 0x010003
+	.convert = pcm_src_convert,
+#endif
 	.convert_s16 = pcm_src_convert_s16,
 	.input_frames = input_frames,
 	.output_frames = output_frames,
@@ -159,30 +237,35 @@ static snd_pcm_rate_ops_t pcm_src_ops = {
 	.get_supported_rates = get_supported_rates,
 	.dump = dump,
 #endif
+#if SND_PCM_RATE_PLUGIN_VERSION >= 0x010003
+	.get_supported_formats = get_supported_formats,
+#endif
 };
 
 int pcm_src_open(unsigned int version, void **objp, snd_pcm_rate_ops_t *ops)
 {
 	struct rate_src *rate;
 
-#if SND_PCM_RATE_PLUGIN_VERSION < 0x010002
-	if (version != SND_PCM_RATE_PLUGIN_VERSION) {
-		fprintf(stderr, "Invalid rate plugin version %x\n", version);
-		return -EINVAL;
-	}
-#endif
 	rate = calloc(1, sizeof(*rate));
 	if (!rate)
 		return -ENOMEM;
 
 	*objp = rate;
 	rate->avr = NULL;
+	rate->version = version;
 #if SND_PCM_RATE_PLUGIN_VERSION >= 0x010002
-	if (version == 0x010001)
+	if (version == 0x010001) {
 		memcpy(ops, &pcm_src_ops, sizeof(snd_pcm_rate_old_ops_t));
-	else
+		return 0;
+	}
+#endif
+#if SND_PCM_RATE_PLUGIN_VERSION >= 0x010003
+	if (version == 0x010002) {
+		memcpy(ops, &pcm_src_ops, sizeof(snd_pcm_rate_v2_ops_t));
+		return 0;
+	}
 #endif
-		*ops = pcm_src_ops;
+	*ops = pcm_src_ops;
 	return 0;
 }
 
-- 
2.26.2

