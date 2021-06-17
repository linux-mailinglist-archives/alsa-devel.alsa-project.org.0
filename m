Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 948833AB0E4
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 12:05:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 156F51703;
	Thu, 17 Jun 2021 12:05:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 156F51703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623924352;
	bh=YAdKBLimSrV+Fh1wHERggPj1NfEKwFEec3iu+NJFteU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fKk9lE6TvQIBvouG9EpXVfVpPZYLnZlUjsGR7d5k/WbyTperXs0LF+3oVpXPppRQG
	 VAJOKDdR4WD8pe6pPZN3QJu0WbK0UgJOrFUwExXentfnwlE7PZLtHM4oI/it3WSaQ3
	 U051rt4pewwK8oM2JACLH2Ib3qMKTKMajzuHR4eU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA09EF8016D;
	Thu, 17 Jun 2021 12:04:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65C08F8016D; Thu, 17 Jun 2021 12:04:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BAF1F8025A
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 12:04:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BAF1F8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="ODTplCHa"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="aOr7raOd"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id EC40021AFC
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 10:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623924240; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=21q6YR5crVqsCHy4T4kJPjAnfiEAtL8l7MQRZcym6Fk=;
 b=ODTplCHabtG4CkfGEtMixXJ3s/kOMWIcF09OqHQQ+ldZ4NGqv2whL9WvAxdRhnr97BRBsC
 1Z4pGNdou2hF+Jw3S9BUU38+aXyZpQ+kechi0c1rEvv77HhaGlEEkqg3r/W3EcHhplKz5z
 pX+3uPrgu2cfq4/o/Z5cZO0ho6KdV9Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623924240;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=21q6YR5crVqsCHy4T4kJPjAnfiEAtL8l7MQRZcym6Fk=;
 b=aOr7raOdhnJL/pdTDs/lYdqeJ9YoP/d4ImhQ928KLskvxvq/FACU91Gzw3jDziDLI4Ew9o
 D94Iylhlz0BNniCA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id E5BD2A3BB7;
 Thu, 17 Jun 2021 10:04:00 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-plugins 2/2] samplerate: Support multiple formats
Date: Thu, 17 Jun 2021 12:03:59 +0200
Message-Id: <20210617100359.12197-3-tiwai@suse.de>
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
multiple formats, this patch extends the libsamplerate plugin to
accept more formats, namely, S16 and S32.  The code has been carefully
modified so that it should still be compilable with old alsa-lib.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 rate/rate_samplerate.c | 99 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 84 insertions(+), 15 deletions(-)

diff --git a/rate/rate_samplerate.c b/rate/rate_samplerate.c
index 100d6f2b110e..af0bf98cb4e9 100644
--- a/rate/rate_samplerate.c
+++ b/rate/rate_samplerate.c
@@ -40,9 +40,12 @@
 #include <alsa/pcm_rate.h>
 
 struct rate_src {
+	unsigned int version;
 	double ratio;
 	int converter;
 	unsigned int channels;
+	int in_int;
+	int out_int;
 	float *src_buf;
 	float *dst_buf;
 	SRC_STATE *state;
@@ -109,6 +112,13 @@ static int pcm_src_init(void *obj, snd_pcm_rate_info_t *info)
 	rate->data.src_ratio = rate->ratio;
 	rate->data.end_of_input = 0;
 
+#if SND_PCM_RATE_PLUGIN_VERSION >= 0x010003
+	if (rate->version >= 0x010003) {
+		rate->in_int = info->in.format == SND_PCM_FORMAT_S32;
+		rate->out_int = info->out.format == SND_PCM_FORMAT_S32;
+	}
+#endif
+
 	return 0;
 }
 
@@ -128,24 +138,61 @@ static void pcm_src_reset(void *obj)
 	src_reset(rate->state);
 }
 
-static void pcm_src_convert_s16(void *obj, int16_t *dst, unsigned int dst_frames,
-				const int16_t *src, unsigned int src_frames)
+static void do_convert(struct rate_src *rate,
+		       void *dst, unsigned int dst_frames,
+		       const void *src, unsigned int src_frames)
 {
-	struct rate_src *rate = obj;
 	unsigned int ofs;
 
 	rate->data.input_frames = src_frames;
 	rate->data.output_frames = dst_frames;
 	rate->data.end_of_input = 0;
 	
-	src_short_to_float_array(src, rate->src_buf, src_frames * rate->channels);
+	if (rate->in_int)
+		src_int_to_float_array(src, rate->src_buf, src_frames * rate->channels);
+	else
+		src_short_to_float_array(src, rate->src_buf, src_frames * rate->channels);
 	src_process(rate->state, &rate->data);
 	if (rate->data.output_frames_gen < dst_frames)
 		ofs = dst_frames - rate->data.output_frames_gen;
 	else
 		ofs = 0;
-	src_float_to_short_array(rate->dst_buf, dst + ofs * rate->channels,
-				 rate->data.output_frames_gen * rate->channels);
+	if (rate->out_int)
+		src_float_to_int_array(rate->dst_buf, dst + ofs * rate->channels * 4,
+				       rate->data.output_frames_gen * rate->channels);
+	else
+		src_float_to_short_array(rate->dst_buf, dst + ofs * rate->channels * 2,
+					 rate->data.output_frames_gen * rate->channels);
+}
+
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
+static void pcm_src_convert_s16(void *obj, int16_t *dst, unsigned int dst_frames,
+				const int16_t *src, unsigned int src_frames)
+{
+	struct rate_src *rate = obj;
+
+	do_convert(rate, dst, dst_frames, src, src_frames);
 }
 
 static void pcm_src_close(void *obj)
@@ -167,12 +214,28 @@ static void dump(void *obj ATTRIBUTE_UNUSED, snd_output_t *out)
 }
 #endif
 
+#if SND_PCM_RATE_PLUGIN_VERSION >= 0x010003
+static int get_supported_formats(void *obj, uint64_t *in_formats,
+				 uint64_t *out_formats,
+				 unsigned int *flags)
+{
+	*in_formats = *out_formats =
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
@@ -181,6 +244,9 @@ static snd_pcm_rate_ops_t pcm_src_ops = {
 	.get_supported_rates = get_supported_rates,
 	.dump = dump,
 #endif
+#if SND_PCM_RATE_PLUGIN_VERSION >= 0x010003
+	.get_supported_formats = get_supported_formats,
+#endif
 };
 
 static int pcm_src_open(unsigned int version, void **objp,
@@ -188,24 +254,27 @@ static int pcm_src_open(unsigned int version, void **objp,
 {
 	struct rate_src *rate;
 
-#if SND_PCM_RATE_PLUGIN_VERSION < 0x010002
-	if (version != SND_PCM_RATE_PLUGIN_VERSION) {
-		fprintf(stderr, "Invalid rate plugin version %x\n", version);
-		return -EINVAL;
-	}
-#endif
 	rate = calloc(1, sizeof(*rate));
 	if (! rate)
 		return -ENOMEM;
+
+	rate->version = version;
 	rate->converter = type;
 
 	*objp = rate;
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

