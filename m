Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D14873AB0D6
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 12:03:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6061F16EE;
	Thu, 17 Jun 2021 12:02:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6061F16EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623924192;
	bh=Z9gce58q7xxt9vvUPCasvDnaokCyT+WZlyLnOIJ9Zsg=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ORo2otpxC/D67uBBMc14lowztQfKVqx1kzWBV+GnaSYgr6XVYXAWK6aJ1Icl+rtSA
	 BH7hCPFOrKlH5uEDKdWMSRnFvdlI9mQbIlC3KoerDeOVLX8YLfilhOuHLnobZDMkNH
	 M17XQ2aI2lKP//bNxSqkZK/UO9Ov3QvWpF7baJo8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2E6AF8016D;
	Thu, 17 Jun 2021 12:01:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0793F8016D; Thu, 17 Jun 2021 12:01:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E38EBF8016D
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 12:01:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E38EBF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="BxBX3c+r"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="o3YavPXs"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 0A0871FDBF
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 10:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623924095; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=600Peaz/qiv1ltqvmcMStORQ/46GgIGinZtajOl6zFA=;
 b=BxBX3c+r9I8Y/dmJv3eaMfF8cnps2zg7vSPtOWJua/iNDHtWuC+lDr7GLVLb0l2/MfJlNW
 dxcMwWSIauC5+CaWsX39kJwweKnlByJSPIPYHCKSzdlyqzbKLEDuRxk4cabO7UP8rYAhF1
 ZBMooGoCL1VdhNPgKVzawgE382scfsI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623924095;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=600Peaz/qiv1ltqvmcMStORQ/46GgIGinZtajOl6zFA=;
 b=o3YavPXsDpEQUTMFPkKmUHwpumMlQ6HHxPEkrvBupZmvg8st0cWVkyoD8BzsTY8kagsXda
 v3LFfaH02iR5nXDw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id EB398A3BB7;
 Thu, 17 Jun 2021 10:01:34 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 2/2] pcm: rate: Improve the support multiple formats
Date: Thu, 17 Jun 2021 12:01:27 +0200
Message-Id: <20210617100127.12068-3-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210617100127.12068-1-tiwai@suse.de>
References: <20210617100127.12068-1-tiwai@suse.de>
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

This patch extends the PCM rate plugin for allowing its converter
plugin to deal with multiple formats.  Currently, the converter plugin
is allowed to take different formats only when convert callback is
defined.  And for this way (so far only the standard linear rate
plugin does), all linear formats have to be handled, and it's
cumbersome.

OTOH, most other rate plugins are implemented with convert_s16
callback, which accepts only S16 format.  This is often not ideal
because many converter engines can handle 32bit formats.  Also, the
target format is often 32bit format, hence this would require
additional conversion even if the converter engine can output 32bit
natively.

In this patch, for addressing the problems above, the rate plugin API
is extended in the following way:

- The new get_supported_formats callback is added; this stores the bit
  masks of the supported input and output formats, as well as the
  behavior flags.  Currently only linear formats are allowed.
- When the plugin accepts only the interleaved stream, set
  SND_PCM_RATE_FLAG_INTERLEAVED flag bit.  Otherwise the code has to
  handle snd_pcm_channel_area at each call.
- When both input and output formats have to be identical, pass
  SND_PCM_RATE_FLAG_SYNC_FORMATS flag bit.
- When the converter wants to process different formats, use convert
  callback instead of convert_s16.  You can put both in the ops for
  compatibility, too.
  The input and output formats are found in the info argument of init
  callback.
- Now the PCM rate plugin core will skip the temporary buffer
  allocation and conversions for pre- and post-process if not needed
  (i.e. matching with the requested input or output format).

The rate plugin API version is bumped to 0x010003.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/pcm_rate.h |  36 ++++-
 src/pcm/pcm_rate.c | 358 +++++++++++++++++++++++++++------------------
 2 files changed, 251 insertions(+), 143 deletions(-)

diff --git a/include/pcm_rate.h b/include/pcm_rate.h
index 4171fb9d19cb..48473ed4ea04 100644
--- a/include/pcm_rate.h
+++ b/include/pcm_rate.h
@@ -38,7 +38,7 @@ extern "C" {
 /**
  * Protocol version
  */
-#define SND_PCM_RATE_PLUGIN_VERSION	0x010002
+#define SND_PCM_RATE_PLUGIN_VERSION	0x010003
 
 /** hw_params information for a single side */
 typedef struct snd_pcm_rate_side_info {
@@ -55,6 +55,11 @@ typedef struct snd_pcm_rate_info {
 	unsigned int channels;
 } snd_pcm_rate_info_t;
 
+enum {
+	SND_PCM_RATE_FLAG_INTERLEAVED = (1U << 0),	/** only interleaved format */
+	SND_PCM_RATE_FLAG_SYNC_FORMATS = (1U << 1),	/** both input and output formats have to be identical */
+};
+
 /** Callback table of rate-converter */
 typedef struct snd_pcm_rate_ops {
 	/**
@@ -114,6 +119,13 @@ typedef struct snd_pcm_rate_ops {
 	 * new ops since version 0x010002
 	 */
 	void (*dump)(void *obj, snd_output_t *out);
+	/**
+	 * get the supported input and output formats (optional);
+	 * new ops since version 0x010003
+	 */
+	int (*get_supported_formats)(void *obj, uint64_t *in_formats,
+				     uint64_t *out_formats,
+				     unsigned int *flags);
 } snd_pcm_rate_ops_t;
 
 /** open function type */
@@ -147,6 +159,28 @@ typedef struct snd_pcm_rate_old_ops {
 	snd_pcm_uframes_t (*input_frames)(void *obj, snd_pcm_uframes_t frames);
 	snd_pcm_uframes_t (*output_frames)(void *obj, snd_pcm_uframes_t frames);
 } snd_pcm_rate_old_ops_t;
+
+/* old rate_ops for protocol version 0x010002 */
+typedef struct snd_pcm_rate_v2_ops {
+	void (*close)(void *obj);
+	int (*init)(void *obj, snd_pcm_rate_info_t *info);
+	void (*free)(void *obj);
+	void (*reset)(void *obj);
+	int (*adjust_pitch)(void *obj, snd_pcm_rate_info_t *info);
+	void (*convert)(void *obj,
+			const snd_pcm_channel_area_t *dst_areas,
+			snd_pcm_uframes_t dst_offset, unsigned int dst_frames,
+			const snd_pcm_channel_area_t *src_areas,
+			snd_pcm_uframes_t src_offset, unsigned int src_frames);
+	void (*convert_s16)(void *obj, int16_t *dst, unsigned int dst_frames,
+			    const int16_t *src, unsigned int src_frames);
+	snd_pcm_uframes_t (*input_frames)(void *obj, snd_pcm_uframes_t frames);
+	snd_pcm_uframes_t (*output_frames)(void *obj, snd_pcm_uframes_t frames);
+	unsigned int version;
+	int (*get_supported_rates)(void *obj, unsigned int *rate_min,
+				   unsigned int *rate_max);
+	void (*dump)(void *obj, snd_output_t *out);
+} snd_pcm_rate_v2_ops_t;
 #endif
 
 #ifdef __cplusplus
diff --git a/src/pcm/pcm_rate.c b/src/pcm/pcm_rate.c
index 1e9961346a7c..13111d290c90 100644
--- a/src/pcm/pcm_rate.c
+++ b/src/pcm/pcm_rate.c
@@ -62,18 +62,22 @@ struct _snd_pcm_rate {
 	void *open_func;
 	void *obj;
 	snd_pcm_rate_ops_t ops;
-	unsigned int get_idx;
-	unsigned int put_idx;
-	int16_t *src_buf;
-	int16_t *dst_buf;
+	unsigned int src_conv_idx;
+	unsigned int dst_conv_idx;
+	snd_pcm_channel_area_t *src_buf;
+	snd_pcm_channel_area_t *dst_buf;
 	int start_pending; /* start is triggered but not commited to slave */
 	snd_htimestamp_t trigger_tstamp;
 	unsigned int plugin_version;
 	unsigned int rate_min, rate_max;
+	snd_pcm_format_t orig_in_format;
+	snd_pcm_format_t orig_out_format;
+	uint64_t in_formats;
+	uint64_t out_formats;
+	unsigned int format_flags;
 };
 
 #define SND_PCM_RATE_PLUGIN_VERSION_OLD	0x010001	/* old rate plugin */
-
 #endif /* DOC_HIDDEN */
 
 /* allocate a channel area and a temporary buffer for the given size */
@@ -274,12 +278,84 @@ static int snd_pcm_rate_hw_refine(snd_pcm_t *pcm,
 				       snd_pcm_generic_hw_refine);
 }
 
+/* evaluate the best matching available format to the given format */
+static int get_best_format(uint64_t mask, snd_pcm_format_t orig)
+{
+	int pwidth = snd_pcm_format_physical_width(orig);
+	int width = snd_pcm_format_width(orig);
+	int signd = snd_pcm_format_signed(orig);
+	int best_score = -1;
+	int match = -1;
+	int f, score;
+
+	for (f = 0; f <= SND_PCM_FORMAT_LAST; f++) {
+		if (!(mask & (1ULL << f)))
+			continue;
+		score = 0;
+		if (snd_pcm_format_linear(f)) {
+			if (snd_pcm_format_physical_width(f) == pwidth)
+				score++;
+			if (snd_pcm_format_physical_width(f) >= pwidth)
+				score++;
+			if (snd_pcm_format_width(f) == width)
+				score++;
+			if (snd_pcm_format_signed(f) == signd)
+				score++;
+		}
+		if (score > best_score) {
+			match = f;
+			best_score = score;
+		}
+	}
+
+	return match;
+}
+
+/* set up the input and output formats from the available lists */
+static int choose_preferred_format(snd_pcm_rate_t *rate)
+{
+	uint64_t in_mask = rate->in_formats;
+	uint64_t out_mask = rate->out_formats;
+	int in, out;
+
+	if (!in_mask || !out_mask)
+		return 0;
+
+	if (rate->orig_in_format == rate->orig_out_format)
+		if (in_mask & out_mask & (1ULL << rate->orig_in_format))
+			return 0; /* nothing changed */
+
+ repeat:
+	in = get_best_format(in_mask, rate->orig_in_format);
+	out = get_best_format(out_mask, rate->orig_out_format);
+	if (in < 0 || out < 0)
+		return -ENOENT;
+
+	if ((rate->format_flags & SND_PCM_RATE_FLAG_SYNC_FORMATS) &&
+	    in != out) {
+		if (out_mask & (1ULL << in))
+			out = in;
+		else if (in_mask & (1ULL << out))
+			in = out;
+		else {
+			in_mask &= ~(1ULL << in);
+			out_mask &= ~(1ULL << out);
+			goto repeat;
+		}
+	}
+
+	rate->info.in.format = in;
+	rate->info.out.format = out;
+	return 0;
+}
+
 static int snd_pcm_rate_hw_params(snd_pcm_t *pcm, snd_pcm_hw_params_t * params)
 {
 	snd_pcm_rate_t *rate = pcm->private_data;
 	snd_pcm_t *slave = rate->gen.slave;
 	snd_pcm_rate_side_info_t *sinfo, *cinfo;
-	unsigned int channels, cwidth, swidth, chn;
+	unsigned int channels, cwidth, swidth, chn, acc;
+	int need_src_buf, need_dst_buf;
 	int err = snd_pcm_hw_params_slave(pcm, params,
 					  snd_pcm_rate_hw_refine_cchange,
 					  snd_pcm_rate_hw_refine_sprepare,
@@ -308,6 +384,9 @@ static int snd_pcm_rate_hw_params(snd_pcm_t *pcm, snd_pcm_hw_params_t * params)
 	if (err < 0)
 		return err;
 	err = INTERNAL(snd_pcm_hw_params_get_channels)(params, &channels);
+	if (err < 0)
+		return err;
+	err = INTERNAL(snd_pcm_hw_params_get_access)(params, &acc);
 	if (err < 0)
 		return err;
 
@@ -321,36 +400,80 @@ static int snd_pcm_rate_hw_params(snd_pcm_t *pcm, snd_pcm_hw_params_t * params)
 		SNDMSG("rate plugin already in use");
 		return -EBUSY;
 	}
-	err = rate->ops.init(rate->obj, &rate->info);
-	if (err < 0)
-		return err;
 
 	rate->pareas = rate_alloc_tmp_buf(rate, cinfo->format, channels,
 					  cinfo->period_size);
 	rate->sareas = rate_alloc_tmp_buf(rate, sinfo->format, channels,
 					  sinfo->period_size);
-	if (!rate->pareas || !rate->sareas)
-		goto error;
-
-	if (rate->ops.convert_s16) {
-		rate->get_idx = snd_pcm_linear_get_index(rate->info.in.format, SND_PCM_FORMAT_S16);
-		rate->put_idx = snd_pcm_linear_put_index(SND_PCM_FORMAT_S16, rate->info.out.format);
-		free(rate->src_buf);
-		rate->src_buf = malloc(channels * rate->info.in.period_size * 2);
-		free(rate->dst_buf);
-		rate->dst_buf = malloc(channels * rate->info.out.period_size * 2);
-		if (! rate->src_buf || ! rate->dst_buf)
+	if (!rate->pareas || !rate->sareas) {
+		err = -ENOMEM;
+		goto error_pareas;
+	}
+
+	rate->orig_in_format = rate->info.in.format;
+	rate->orig_out_format = rate->info.out.format;
+	if (choose_preferred_format(rate) < 0) {
+		SNDERR("No matching format in rate plugin");
+		err = -EINVAL;
+		goto error_pareas;
+	}
+
+	err = rate->ops.init(rate->obj, &rate->info);
+	if (err < 0)
+		goto error_init;
+
+	rate_free_tmp_buf(&rate->src_buf);
+	rate_free_tmp_buf(&rate->dst_buf);
+
+	need_src_buf = need_dst_buf = 0;
+
+	if ((rate->format_flags & SND_PCM_RATE_FLAG_INTERLEAVED) &&
+	    !(acc == SND_PCM_ACCESS_MMAP_INTERLEAVED ||
+	      acc == SND_PCM_ACCESS_RW_INTERLEAVED)) {
+		need_src_buf = need_dst_buf = 1;
+	} else {
+		if (rate->orig_in_format != rate->info.in.format)
+			need_src_buf = 1;
+		if (rate->orig_out_format != rate->info.out.format)
+			need_dst_buf = 1;
+	}
+
+	if (need_src_buf) {
+		rate->src_conv_idx =
+			snd_pcm_linear_convert_index(rate->orig_in_format,
+						     rate->info.in.format);
+		rate->src_buf = rate_alloc_tmp_buf(rate, rate->info.in.format,
+						   channels, rate->info.in.period_size);
+		if (!rate->src_buf) {
+			err = -ENOMEM;
 			goto error;
+		}
+	}
+
+	if (need_dst_buf) {
+		rate->dst_conv_idx =
+			snd_pcm_linear_convert_index(rate->info.out.format,
+						     rate->orig_out_format);
+		rate->dst_buf = rate_alloc_tmp_buf(rate, rate->info.out.format,
+						   channels, rate->info.out.period_size);
+		if (!rate->dst_buf) {
+			err = -ENOMEM;
+			goto error;
+		}
 	}
 
 	return 0;
 
  error:
-	rate_free_tmp_buf(&rate->pareas);
-	rate_free_tmp_buf(&rate->sareas);
+	rate_free_tmp_buf(&rate->src_buf);
+	rate_free_tmp_buf(&rate->dst_buf);
+ error_init:
 	if (rate->ops.free)
 		rate->ops.free(rate->obj);
-	return -ENOMEM;
+ error_pareas:
+	rate_free_tmp_buf(&rate->pareas);
+	rate_free_tmp_buf(&rate->sareas);
+	return err;
 }
 
 static int snd_pcm_rate_hw_free(snd_pcm_t *pcm)
@@ -361,9 +484,8 @@ static int snd_pcm_rate_hw_free(snd_pcm_t *pcm)
 	rate_free_tmp_buf(&rate->sareas);
 	if (rate->ops.free)
 		rate->ops.free(rate->obj);
-	free(rate->src_buf);
-	free(rate->dst_buf);
-	rate->src_buf = rate->dst_buf = NULL;
+	rate_free_tmp_buf(&rate->src_buf);
+	rate_free_tmp_buf(&rate->dst_buf);
 	return snd_pcm_hw_free(rate->gen.slave);
 }
 
@@ -444,82 +566,6 @@ static int snd_pcm_rate_init(snd_pcm_t *pcm)
 	return 0;
 }
 
-static void convert_to_s16(snd_pcm_rate_t *rate, int16_t *buf,
-			   const snd_pcm_channel_area_t *areas,
-			   snd_pcm_uframes_t offset, unsigned int frames,
-			   unsigned int channels)
-{
-#ifndef DOC_HIDDEN
-#define GET16_LABELS
-#include "plugin_ops.h"
-#undef GET16_LABELS
-#endif /* DOC_HIDDEN */
-	void *get = get16_labels[rate->get_idx];
-	const char *src;
-	int16_t sample;
-	const char *srcs[channels];
-	int src_step[channels];
-	unsigned int c;
-
-	for (c = 0; c < channels; c++) {
-		srcs[c] = snd_pcm_channel_area_addr(areas + c, offset);
-		src_step[c] = snd_pcm_channel_area_step(areas + c);
-	}
-
-	while (frames--) {
-		for (c = 0; c < channels; c++) {
-			src = srcs[c];
-			goto *get;
-#ifndef DOC_HIDDEN
-#define GET16_END after_get
-#include "plugin_ops.h"
-#undef GET16_END
-#endif /* DOC_HIDDEN */
-		after_get:
-			*buf++ = sample;
-			srcs[c] += src_step[c];
-		}
-	}
-}
-
-static void convert_from_s16(snd_pcm_rate_t *rate, const int16_t *buf,
-			     const snd_pcm_channel_area_t *areas,
-			     snd_pcm_uframes_t offset, unsigned int frames,
-			     unsigned int channels)
-{
-#ifndef DOC_HIDDEN
-#define PUT16_LABELS
-#include "plugin_ops.h"
-#undef PUT16_LABELS
-#endif /* DOC_HIDDEN */
-	void *put = put16_labels[rate->put_idx];
-	char *dst;
-	int16_t sample;
-	char *dsts[channels];
-	int dst_step[channels];
-	unsigned int c;
-
-	for (c = 0; c < channels; c++) {
-		dsts[c] = snd_pcm_channel_area_addr(areas + c, offset);
-		dst_step[c] = snd_pcm_channel_area_step(areas + c);
-	}
-
-	while (frames--) {
-		for (c = 0; c < channels; c++) {
-			dst = dsts[c];
-			sample = *buf++;
-			goto *put;
-#ifndef DOC_HIDDEN
-#define PUT16_END after_put
-#include "plugin_ops.h"
-#undef PUT16_END
-#endif /* DOC_HIDDEN */
-		after_put:
-			dsts[c] += dst_step[c];
-		}
-	}
-}
-
 static void do_convert(const snd_pcm_channel_area_t *dst_areas,
 		       snd_pcm_uframes_t dst_offset, unsigned int dst_frames,
 		       const snd_pcm_channel_area_t *src_areas,
@@ -527,28 +573,40 @@ static void do_convert(const snd_pcm_channel_area_t *dst_areas,
 		       unsigned int channels,
 		       snd_pcm_rate_t *rate)
 {
-	if (rate->ops.convert_s16) {
-		const int16_t *src;
-		int16_t *dst;
-		if (! rate->src_buf)
-			src = (int16_t *)src_areas->addr + src_offset * channels;
-		else {
-			convert_to_s16(rate, rate->src_buf, src_areas, src_offset,
-				       src_frames, channels);
-			src = rate->src_buf;
-		}
-		if (! rate->dst_buf)
-			dst = (int16_t *)dst_areas->addr + dst_offset * channels;
-		else
-			dst = rate->dst_buf;
-		rate->ops.convert_s16(rate->obj, dst, dst_frames, src, src_frames);
-		if (dst == rate->dst_buf)
-			convert_from_s16(rate, rate->dst_buf, dst_areas, dst_offset,
-					 dst_frames, channels);
+	const snd_pcm_channel_area_t *out_areas;
+	snd_pcm_uframes_t out_offset;
+
+	if (rate->dst_buf) {
+		out_areas = rate->dst_buf;
+		out_offset = 0;
 	} else {
-		rate->ops.convert(rate->obj, dst_areas, dst_offset, dst_frames,
-				   src_areas, src_offset, src_frames);
+		out_areas = dst_areas;
+		out_offset = dst_offset;
+	}
+
+	if (rate->src_buf) {
+		snd_pcm_linear_convert(rate->src_buf, 0,
+				       src_areas, src_offset,
+				       channels, src_frames,
+				       rate->src_conv_idx);
+		src_areas = rate->src_buf;
+		src_offset = 0;
 	}
+
+	if (rate->ops.convert)
+		rate->ops.convert(rate->obj, out_areas, out_offset, dst_frames,
+				   src_areas, src_offset, src_frames);
+	else
+		rate->ops.convert_s16(rate->obj,
+				      snd_pcm_channel_area_addr(out_areas, out_offset),
+				      dst_frames,
+				      snd_pcm_channel_area_addr(src_areas, src_offset),
+				      src_frames);
+	if (rate->dst_buf)
+		snd_pcm_linear_convert(dst_areas, dst_offset,
+				       rate->dst_buf, 0,
+				       channels, dst_frames,
+				       rate->dst_conv_idx);
 }
 
 static inline void
@@ -1276,6 +1334,30 @@ const snd_config_t *snd_pcm_rate_get_default_converter(snd_config_t *root)
 	return NULL;
 }
 
+static void rate_initial_setup(snd_pcm_rate_t *rate)
+{
+	if (rate->plugin_version == SND_PCM_RATE_PLUGIN_VERSION)
+		rate->plugin_version = rate->ops.version;
+
+	if (rate->plugin_version >= 0x010002 &&
+	    rate->ops.get_supported_rates)
+		rate->ops.get_supported_rates(rate->obj,
+					      &rate->rate_min,
+					      &rate->rate_max);
+
+	if (rate->plugin_version >= 0x010003 &&
+	    rate->ops.get_supported_formats) {
+		rate->ops.get_supported_formats(rate->obj,
+						&rate->in_formats,
+						&rate->out_formats,
+						&rate->format_flags);
+	} else if (!rate->ops.convert && rate->ops.convert_s16) {
+		rate->in_formats = rate->out_formats =
+			1ULL << SND_PCM_FORMAT_S16;
+		rate->format_flags = SND_PCM_RATE_FLAG_INTERLEAVED;
+	}
+}
+
 #ifdef PIC
 static int is_builtin_plugin(const char *type)
 {
@@ -1301,20 +1383,11 @@ static int rate_open_func(snd_pcm_rate_t *rate, const char *type, const snd_conf
 		lib = lib_name;
 	}
 
-	rate->rate_min = SND_PCM_PLUGIN_RATE_MIN;
-	rate->rate_max = SND_PCM_PLUGIN_RATE_MAX;
-	rate->plugin_version = SND_PCM_RATE_PLUGIN_VERSION;
-
 	open_conf_func = snd_dlobj_cache_get(lib, open_conf_name, NULL, verbose && converter_conf != NULL);
 	if (open_conf_func) {
 		err = open_conf_func(SND_PCM_RATE_PLUGIN_VERSION,
 				     &rate->obj, &rate->ops, converter_conf);
 		if (!err) {
-			rate->plugin_version = rate->ops.version;
-			if (rate->ops.get_supported_rates)
-				rate->ops.get_supported_rates(rate->obj,
-							      &rate->rate_min,
-							      &rate->rate_max);
 			rate->open_func = open_conf_func;
 			return 0;
 		} else {
@@ -1330,23 +1403,18 @@ static int rate_open_func(snd_pcm_rate_t *rate, const char *type, const snd_conf
 	rate->open_func = open_func;
 
 	err = open_func(SND_PCM_RATE_PLUGIN_VERSION, &rate->obj, &rate->ops);
-	if (!err) {
-		rate->plugin_version = rate->ops.version;
-		if (rate->ops.get_supported_rates)
-			rate->ops.get_supported_rates(rate->obj,
-						      &rate->rate_min,
-						      &rate->rate_max);
+	if (!err)
 		return 0;
-	}
 
 	/* try to open with the old protocol version */
 	rate->plugin_version = SND_PCM_RATE_PLUGIN_VERSION_OLD;
 	err = open_func(SND_PCM_RATE_PLUGIN_VERSION_OLD,
 			&rate->obj, &rate->ops);
-	if (err) {
-		snd_dlobj_cache_put(open_func);
-		rate->open_func = NULL;
-	}
+	if (!err)
+		return 0;
+
+	snd_dlobj_cache_put(open_func);
+	rate->open_func = NULL;
 	return err;
 }
 #endif
@@ -1417,6 +1485,10 @@ int snd_pcm_rate_open(snd_pcm_t **pcmp, const char *name,
 	rate->srate = srate;
 	rate->sformat = sformat;
 
+	rate->rate_min = SND_PCM_PLUGIN_RATE_MIN;
+	rate->rate_max = SND_PCM_PLUGIN_RATE_MAX;
+	rate->plugin_version = SND_PCM_RATE_PLUGIN_VERSION;
+
 	err = snd_pcm_new(&pcm, SND_PCM_TYPE_RATE, name, slave->stream, slave->mode);
 	if (err < 0) {
 		free(rate);
@@ -1496,6 +1568,8 @@ int snd_pcm_rate_open(snd_pcm_t **pcmp, const char *name,
 		return err;
 	}
 
+	rate_initial_setup(rate);
+
 	pcm->ops = &snd_pcm_rate_ops;
 	pcm->fast_ops = &snd_pcm_rate_fast_ops;
 	pcm->private_data = rate;
-- 
2.26.2

