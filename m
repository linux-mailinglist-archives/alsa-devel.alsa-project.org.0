Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E93FD4FE1C7
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 15:09:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 726C3186C;
	Tue, 12 Apr 2022 15:08:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 726C3186C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649768941;
	bh=CQe30nAbI4yiY3bjrjeCFsdf2cq860rhup60K/igcRc=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rTR0QIHjFZoluNen9SvOd94p9V2uedlYb9GIIiUFMgZeQAFVbo/qRTcVvsT1+joav
	 J1qqg6EYw1kIhaq9AawKPTXtio5iZCnH+3EzSvTuzGknuQ8kEI7V2VvgYuD12PvUvS
	 KwHcDiIoIIHrJxjZezwLMs28jM4irdRG0kT3KADk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE56BF80245;
	Tue, 12 Apr 2022 15:08:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9448F8011C; Tue, 12 Apr 2022 15:08:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF268F8011C
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 15:07:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF268F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="PqIreWS0"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="E0mMkDjO"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 0A32C1F856
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 13:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649768874; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4eOYi8wEsrllHG27woLS5uR+1pjQhQ35bXNbRTaiMag=;
 b=PqIreWS0kS+qrXrxOR2rdlsJP/gTndvtM11Z9IuEqiByV8Aw/hCz9Jky34Av1m+/I2ROYQ
 9UawCbdsCV+hGzzHGcws1gPQY0b/N7DeDzEvVWy6/VfSzGneTQ2xpe4oi0VhUKq12bZbHx
 DubEOJ45QVeb9AG8j76Sc7cn9rYxNaU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649768874;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4eOYi8wEsrllHG27woLS5uR+1pjQhQ35bXNbRTaiMag=;
 b=E0mMkDjONoppMokvIhrhzFENT7Ae5nl1ylLNotUu2W/0LeVv+UfDNHLBaIFGto1hfRFpbP
 z4dl99ENj7i7EcAQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 02AABA3B95;
 Tue, 12 Apr 2022 13:07:53 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Limit max buffer and period sizes per time
Date: Tue, 12 Apr 2022 15:07:40 +0200
Message-Id: <20220412130740.18933-1-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
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

In the previous fix, we increased the max buffer bytes from 1MB to 4MB
so that we can use bigger buffers for the modern HiFi devices with
higher rates, more channels and wider formats.  OTOH, extending this
has a concern that too big buffer is allowed for the lower rates, less
channels and narrower formats; when an application tries to allocate
as big buffer as possible, it'll lead to unexpectedly too huge size.

Also, we had a problem about the inconsistent max buffer and period
bytes for the implicit feedback mode when both streams have different
channels.  This was fixed by the (relatively complex) patch to reduce
the max buffer and period bytes accordingly.

This is an alternative fix for those, a patch to kill two birds with
one stone (*): instead of increasing the max buffer bytes blindly and
applying the reduction per channels, we simply use the hw constraints
for the buffer and period "time".  Meanwhile the max buffer and period
bytes are set unlimited instead.

Since the inconsistency of buffer (and period) bytes comes from the
difference of the channels in the tied streams, as long as we care
only about the buffer (and period) time, it doesn't matter; the buffer
time is same for different channels, although we still allow higher
buffer size.  Similarly, this will allow more buffer bytes for HiFi
devices while it also keeps the reasonable size for the legacy
devices, too.

As of this patch, the max period and buffer time are set to 1 and 2
seconds, which should be large enough for all possible use cases.

(*) No animals were harmed in the making of this patch.

Fixes: 98c27add5d96 ("ALSA: usb-audio: Cap upper limits of buffer/period bytes for implicit fb")
Fixes: fee2ec8cceb3 ("ALSA: usb-audio: Increase max buffer size")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/pcm.c | 101 +++++++-----------------------------------------
 1 file changed, 14 insertions(+), 87 deletions(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 37ee6df8b15a..6d699065e81a 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -659,9 +659,6 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
 #define hwc_debug(fmt, args...) do { } while(0)
 #endif
 
-#define MAX_BUFFER_BYTES	(4 * 1024 * 1024)
-#define MAX_PERIOD_BYTES	(512 * 1024)
-
 static const struct snd_pcm_hardware snd_usb_hardware =
 {
 	.info =			SNDRV_PCM_INFO_MMAP |
@@ -672,9 +669,9 @@ static const struct snd_pcm_hardware snd_usb_hardware =
 				SNDRV_PCM_INFO_PAUSE,
 	.channels_min =		1,
 	.channels_max =		256,
-	.buffer_bytes_max =	MAX_BUFFER_BYTES,
+	.buffer_bytes_max =	INT_MAX, /* limited by BUFFER_TIME later */
 	.period_bytes_min =	64,
-	.period_bytes_max =	MAX_PERIOD_BYTES,
+	.period_bytes_max =	INT_MAX, /* limited by PERIOD_TIME later */
 	.periods_min =		2,
 	.periods_max =		1024,
 };
@@ -974,78 +971,6 @@ static int hw_rule_periods_implicit_fb(struct snd_pcm_hw_params *params,
 				      ep->cur_buffer_periods);
 }
 
-/* get the adjusted max buffer (or period) bytes that can fit with the
- * paired format for implicit fb
- */
-static unsigned int
-get_adjusted_max_bytes(struct snd_usb_substream *subs,
-		       struct snd_usb_substream *pair,
-		       struct snd_pcm_hw_params *params,
-		       unsigned int max_bytes,
-		       bool reverse_map)
-{
-	const struct audioformat *fp, *pp;
-	unsigned int rmax = 0, r;
-
-	list_for_each_entry(fp, &subs->fmt_list, list) {
-		if (!fp->implicit_fb)
-			continue;
-		if (!reverse_map &&
-		    !hw_check_valid_format(subs, params, fp))
-			continue;
-		list_for_each_entry(pp, &pair->fmt_list, list) {
-			if (pp->iface != fp->sync_iface ||
-			    pp->altsetting != fp->sync_altsetting ||
-			    pp->ep_idx != fp->sync_ep_idx)
-				continue;
-			if (reverse_map &&
-			    !hw_check_valid_format(pair, params, pp))
-				break;
-			if (!reverse_map && pp->channels > fp->channels)
-				r = max_bytes * fp->channels / pp->channels;
-			else if (reverse_map && pp->channels < fp->channels)
-				r = max_bytes * pp->channels / fp->channels;
-			else
-				r = max_bytes;
-			rmax = max(rmax, r);
-			break;
-		}
-	}
-	return rmax;
-}
-
-/* Reduce the period or buffer bytes depending on the paired substream;
- * when a paired configuration for implicit fb has a higher number of channels,
- * we need to reduce the max size accordingly, otherwise it may become unusable
- */
-static int hw_rule_bytes_implicit_fb(struct snd_pcm_hw_params *params,
-				     struct snd_pcm_hw_rule *rule)
-{
-	struct snd_usb_substream *subs = rule->private;
-	struct snd_usb_substream *pair;
-	struct snd_interval *it;
-	unsigned int max_bytes;
-	unsigned int rmax;
-
-	pair = &subs->stream->substream[!subs->direction];
-	if (!pair->ep_num)
-		return 0;
-
-	if (rule->var == SNDRV_PCM_HW_PARAM_PERIOD_BYTES)
-		max_bytes = MAX_PERIOD_BYTES;
-	else
-		max_bytes = MAX_BUFFER_BYTES;
-
-	rmax = get_adjusted_max_bytes(subs, pair, params, max_bytes, false);
-	if (!rmax)
-		rmax = get_adjusted_max_bytes(pair, subs, params, max_bytes, true);
-	if (!rmax)
-		return 0;
-
-	it = hw_param_interval(params, rule->var);
-	return apply_hw_params_minmax(it, 0, rmax);
-}
-
 /*
  * set up the runtime hardware information.
  */
@@ -1139,6 +1064,18 @@ static int setup_hw_info(struct snd_pcm_runtime *runtime, struct snd_usb_substre
 			return err;
 	}
 
+	/* set max period and buffer sizes for 1 and 2 seconds, respectively */
+	err = snd_pcm_hw_constraint_minmax(runtime,
+					   SNDRV_PCM_HW_PARAM_PERIOD_TIME,
+					   0, 1000000);
+	if (err < 0)
+		return err;
+	err = snd_pcm_hw_constraint_minmax(runtime,
+					   SNDRV_PCM_HW_PARAM_BUFFER_TIME,
+					   0, 2000000);
+	if (err < 0)
+		return err;
+
 	/* additional hw constraints for implicit fb */
 	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_FORMAT,
 				  hw_rule_format_implicit_fb, subs,
@@ -1160,16 +1097,6 @@ static int setup_hw_info(struct snd_pcm_runtime *runtime, struct snd_usb_substre
 				  SNDRV_PCM_HW_PARAM_PERIODS, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
-				  hw_rule_bytes_implicit_fb, subs,
-				  SNDRV_PCM_HW_PARAM_BUFFER_BYTES, -1);
-	if (err < 0)
-		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
-				  hw_rule_bytes_implicit_fb, subs,
-				  SNDRV_PCM_HW_PARAM_PERIOD_BYTES, -1);
-	if (err < 0)
-		return err;
 
 	list_for_each_entry(fp, &subs->fmt_list, list) {
 		if (fp->implicit_fb) {
-- 
2.34.1

