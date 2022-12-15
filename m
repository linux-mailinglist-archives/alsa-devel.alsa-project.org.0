Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA8B64DDD5
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Dec 2022 16:32:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6870C16AE;
	Thu, 15 Dec 2022 16:31:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6870C16AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671118328;
	bh=s9nYdjVxi1tqy6tIidG5ezyoWYYW7jUkcuO7WrdVMgs=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=BxYb1vW30Ymyy8dvvdq4gvcMKR1XeIvt+Nb9y3c3//aCYDOGVJZHC2kuLedQv5qxx
	 s/etR+Zoq5F04j0CJAepZrJDL9BGxGfcpUj1e4VzZNkHDzNHhEkUDeZztfDAx40Kpg
	 t0oR/rhPlH2GK+yWXED5Dw4HUlkQu628O2fanCPI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1074FF80141;
	Thu, 15 Dec 2022 16:31:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34B94F804ED; Thu, 15 Dec 2022 16:31:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A312F804CB
 for <alsa-devel@alsa-project.org>; Thu, 15 Dec 2022 16:31:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A312F804CB
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256
 header.s=default header.b=BXEeAP7w
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 6E880A0040;
 Thu, 15 Dec 2022 16:31:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 6E880A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1671118261; bh=T6qDQw1koPh3Oy1rpG2n0oa5LkWiP0RWpPNWt32qV0g=;
 h=From:To:Cc:Subject:Date:From;
 b=BXEeAP7w0gaGji6/CzRh3MsunT0YQkArCS3UsgAbj9RX7/feL70stO0qb1Wg37t3E
 +zUZ/+qyXM0R+EXwPa5AeDpFDgKNtDTPCCJzvN93Z6bIOe9kZWByVQXvmTsaZnPXTZ
 F9lIV5ikc3OES6gJDlLxaHsR0oGibfKBbnpUZ5Pk=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 15 Dec 2022 16:30:58 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH] ALSA: usb-audio: Add new quirk FIXED_RATE for JBL Quantum810
 Wireless
Date: Thu, 15 Dec 2022 16:30:37 +0100
Message-Id: <20221215153037.1163786-1-perex@perex.cz>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Takashi Iwai <tiwai@suse.de>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

It seems that the firmware is broken and does not accept
the UAC_EP_CS_ATTR_SAMPLE_RATE URB. There is only one rate (48000Hz)
available in the descriptors for the output endpoint.

Create a new quirk QUIRK_FLAG_FIXED_RATE to skip the rate setup
when only one rate is available (fixed).

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=216798
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/usb/card.h     |  1 +
 sound/usb/endpoint.c | 16 ++++++++++------
 sound/usb/endpoint.h |  3 ++-
 sound/usb/implicit.c |  6 +++++-
 sound/usb/implicit.h |  2 +-
 sound/usb/pcm.c      | 36 +++++++++++++++++++++++++++++++++---
 sound/usb/pcm.h      |  2 ++
 sound/usb/quirks.c   |  2 ++
 sound/usb/usbaudio.h |  4 ++++
 9 files changed, 60 insertions(+), 12 deletions(-)

diff --git a/sound/usb/card.h b/sound/usb/card.h
index 40061550105a..6ec95b2edf86 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -131,6 +131,7 @@ struct snd_usb_endpoint {
 	bool lowlatency_playback;	/* low-latency playback mode */
 	bool need_setup;		/* (re-)need for hw_params? */
 	bool need_prepare;		/* (re-)need for prepare? */
+	bool fixed_rate;		/* skip rate setup */
 
 	/* for hw constraints */
 	const struct audioformat *cur_audiofmt;
diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 4aaf0784940b..419302e2057e 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -769,7 +769,8 @@ struct snd_usb_endpoint *
 snd_usb_endpoint_open(struct snd_usb_audio *chip,
 		      const struct audioformat *fp,
 		      const struct snd_pcm_hw_params *params,
-		      bool is_sync_ep)
+		      bool is_sync_ep,
+		      bool fixed_rate)
 {
 	struct snd_usb_endpoint *ep;
 	int ep_num = is_sync_ep ? fp->sync_ep : fp->endpoint;
@@ -825,6 +826,7 @@ snd_usb_endpoint_open(struct snd_usb_audio *chip,
 		ep->implicit_fb_sync = fp->implicit_fb;
 		ep->need_setup = true;
 		ep->need_prepare = true;
+		ep->fixed_rate = fixed_rate;
 
 		usb_audio_dbg(chip, "  channels=%d, rate=%d, format=%s, period_bytes=%d, periods=%d, implicit_fb=%d\n",
 			      ep->cur_channels, ep->cur_rate,
@@ -1413,11 +1415,13 @@ static int init_sample_rate(struct snd_usb_audio *chip,
 	if (clock && !clock->need_setup)
 		return 0;
 
-	err = snd_usb_init_sample_rate(chip, ep->cur_audiofmt, rate);
-	if (err < 0) {
-		if (clock)
-			clock->rate = 0; /* reset rate */
-		return err;
+	if (!ep->fixed_rate) {
+		err = snd_usb_init_sample_rate(chip, ep->cur_audiofmt, rate);
+		if (err < 0) {
+			if (clock)
+				clock->rate = 0; /* reset rate */
+			return err;
+		}
 	}
 
 	if (clock)
diff --git a/sound/usb/endpoint.h b/sound/usb/endpoint.h
index e67ea28faa54..924f4351588c 100644
--- a/sound/usb/endpoint.h
+++ b/sound/usb/endpoint.h
@@ -14,7 +14,8 @@ struct snd_usb_endpoint *
 snd_usb_endpoint_open(struct snd_usb_audio *chip,
 		      const struct audioformat *fp,
 		      const struct snd_pcm_hw_params *params,
-		      bool is_sync_ep);
+		      bool is_sync_ep,
+		      bool fixed_rate);
 void snd_usb_endpoint_close(struct snd_usb_audio *chip,
 			    struct snd_usb_endpoint *ep);
 int snd_usb_endpoint_set_params(struct snd_usb_audio *chip,
diff --git a/sound/usb/implicit.c b/sound/usb/implicit.c
index f3e8484b3d9c..41ac7185b42b 100644
--- a/sound/usb/implicit.c
+++ b/sound/usb/implicit.c
@@ -15,6 +15,7 @@
 #include "usbaudio.h"
 #include "card.h"
 #include "helper.h"
+#include "pcm.h"
 #include "implicit.h"
 
 enum {
@@ -455,7 +456,8 @@ const struct audioformat *
 snd_usb_find_implicit_fb_sync_format(struct snd_usb_audio *chip,
 				     const struct audioformat *target,
 				     const struct snd_pcm_hw_params *params,
-				     int stream)
+				     int stream,
+				     bool *fixed_rate)
 {
 	struct snd_usb_substream *subs;
 	const struct audioformat *fp, *sync_fmt = NULL;
@@ -483,6 +485,8 @@ snd_usb_find_implicit_fb_sync_format(struct snd_usb_audio *chip,
 		}
 	}
 
+	if (fixed_rate)
+		*fixed_rate = snd_usb_pcm_has_fixed_rate(subs);
 	return sync_fmt;
 }
 
diff --git a/sound/usb/implicit.h b/sound/usb/implicit.h
index ccb415a0ea86..7f1577b6c4d3 100644
--- a/sound/usb/implicit.h
+++ b/sound/usb/implicit.h
@@ -9,6 +9,6 @@ const struct audioformat *
 snd_usb_find_implicit_fb_sync_format(struct snd_usb_audio *chip,
 				     const struct audioformat *target,
 				     const struct snd_pcm_hw_params *params,
-				     int stream);
+				     int stream, bool *fixed_rate);
 
 #endif /* __USBAUDIO_IMPLICIT_H */
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 9557bd4d1bbc..99a66d0ef5b2 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -157,6 +157,31 @@ find_substream_format(struct snd_usb_substream *subs,
 			   true, subs);
 }
 
+bool snd_usb_pcm_has_fixed_rate(struct snd_usb_substream *subs)
+{
+	const struct audioformat *fp;
+	struct snd_usb_audio *chip = subs->stream->chip;
+	int rate = -1;
+
+	if (!(chip->quirk_flags & QUIRK_FLAG_FIXED_RATE))
+		return false;
+	list_for_each_entry(fp, &subs->fmt_list, list) {
+		if (fp->rates & SNDRV_PCM_RATE_CONTINUOUS)
+			return false;
+		if (fp->nr_rates < 1)
+			continue;
+		if (fp->nr_rates > 1)
+			return false;
+		if (rate < 0) {
+			rate = fp->rate_table[0];
+			continue;
+		}
+		if (rate != fp->rate_table[0])
+			return false;
+	}
+	return true;
+}
+
 static int init_pitch_v1(struct snd_usb_audio *chip, int ep)
 {
 	struct usb_device *dev = chip->dev;
@@ -450,12 +475,14 @@ static int snd_usb_hw_params(struct snd_pcm_substream *substream,
 	struct snd_usb_audio *chip = subs->stream->chip;
 	const struct audioformat *fmt;
 	const struct audioformat *sync_fmt;
+	bool fixed_rate, sync_fixed_rate;
 	int ret;
 
 	ret = snd_media_start_pipeline(subs);
 	if (ret)
 		return ret;
 
+	fixed_rate = snd_usb_pcm_has_fixed_rate(subs);
 	fmt = find_substream_format(subs, hw_params);
 	if (!fmt) {
 		usb_audio_dbg(chip,
@@ -469,7 +496,8 @@ static int snd_usb_hw_params(struct snd_pcm_substream *substream,
 	if (fmt->implicit_fb) {
 		sync_fmt = snd_usb_find_implicit_fb_sync_format(chip, fmt,
 								hw_params,
-								!substream->stream);
+								!substream->stream,
+								&sync_fixed_rate);
 		if (!sync_fmt) {
 			usb_audio_dbg(chip,
 				      "cannot find sync format: ep=0x%x, iface=%d:%d, format=%s, rate=%d, channels=%d\n",
@@ -482,6 +510,7 @@ static int snd_usb_hw_params(struct snd_pcm_substream *substream,
 		}
 	} else {
 		sync_fmt = fmt;
+		sync_fixed_rate = fixed_rate;
 	}
 
 	ret = snd_usb_lock_shutdown(chip);
@@ -499,7 +528,7 @@ static int snd_usb_hw_params(struct snd_pcm_substream *substream,
 		close_endpoints(chip, subs);
 	}
 
-	subs->data_endpoint = snd_usb_endpoint_open(chip, fmt, hw_params, false);
+	subs->data_endpoint = snd_usb_endpoint_open(chip, fmt, hw_params, false, fixed_rate);
 	if (!subs->data_endpoint) {
 		ret = -EINVAL;
 		goto unlock;
@@ -508,7 +537,8 @@ static int snd_usb_hw_params(struct snd_pcm_substream *substream,
 	if (fmt->sync_ep) {
 		subs->sync_endpoint = snd_usb_endpoint_open(chip, sync_fmt,
 							    hw_params,
-							    fmt == sync_fmt);
+							    fmt == sync_fmt,
+							    sync_fixed_rate);
 		if (!subs->sync_endpoint) {
 			ret = -EINVAL;
 			goto unlock;
diff --git a/sound/usb/pcm.h b/sound/usb/pcm.h
index 493a4e34d78d..388fe2ba346d 100644
--- a/sound/usb/pcm.h
+++ b/sound/usb/pcm.h
@@ -6,6 +6,8 @@ void snd_usb_set_pcm_ops(struct snd_pcm *pcm, int stream);
 int snd_usb_pcm_suspend(struct snd_usb_stream *as);
 int snd_usb_pcm_resume(struct snd_usb_stream *as);
 
+bool snd_usb_pcm_has_fixed_rate(struct snd_usb_substream *as);
+
 int snd_usb_init_pitch(struct snd_usb_audio *chip,
 		       const struct audioformat *fmt);
 void snd_usb_preallocate_buffer(struct snd_usb_substream *subs);
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 58b37bfc885c..3d13fdf7590c 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2152,6 +2152,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x0525, 0xa4ad, /* Hamedal C20 usb camero */
 		   QUIRK_FLAG_IFACE_SKIP_CLOSE),
+	DEVICE_FLG(0x0ecb, 0x2069, /* JBL Quantum810 Wireless */
+		   QUIRK_FLAG_FIXED_RATE),
 
 	/* Vendor matches */
 	VENDOR_FLG(0x045e, /* MS Lifecam */
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 2aba508a4831..f5a8dca66457 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -175,6 +175,9 @@ extern bool snd_usb_skip_validation;
  * QUIRK_FLAG_FORCE_IFACE_RESET
  *  Force an interface reset whenever stopping & restarting a stream
  *  (e.g. after xrun)
+ * QUIRK_FLAG_FIXED_RATE
+ *  Do not set PCM rate (frequency) when only one rate is available
+ *  for the given endpoint.
  */
 
 #define QUIRK_FLAG_GET_SAMPLE_RATE	(1U << 0)
@@ -198,5 +201,6 @@ extern bool snd_usb_skip_validation;
 #define QUIRK_FLAG_SKIP_IMPLICIT_FB	(1U << 18)
 #define QUIRK_FLAG_IFACE_SKIP_CLOSE	(1U << 19)
 #define QUIRK_FLAG_FORCE_IFACE_RESET	(1U << 20)
+#define QUIRK_FLAG_FIXED_RATE		(1U << 21)
 
 #endif /* __USBAUDIO_H */
-- 
2.38.1
