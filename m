Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1B82F0DB8
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jan 2021 09:18:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28B0016AE;
	Mon, 11 Jan 2021 09:17:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28B0016AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610353085;
	bh=Gklq5NwGZ34efLpCu4v7it3BWZ+a2TjN1HKtnq1eiEQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lPS4v8MxY9A2ek2K1gqLOtf0KwHZ2Hs2P0rBbeqpIktyVJ7Jy9qEr3l/NFCeJXjFs
	 WqSs+NhMtBPxlryyr/tcECx8T68xhswgOmphS6JGWd7gOH1sU3DpqkcxvDELdgcGt0
	 9B++lVmp8wnKmUiZoDPXgjRXhkashWsXBcJUvgq8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6903FF80254;
	Mon, 11 Jan 2021 09:16:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7879AF8016D; Mon, 11 Jan 2021 09:16:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6039BF800BE
 for <alsa-devel@alsa-project.org>; Mon, 11 Jan 2021 09:16:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6039BF800BE
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 58EB9AD18;
 Mon, 11 Jan 2021 08:16:16 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Always apply the hw constraints for implicit
 fb sync
Date: Mon, 11 Jan 2021 09:16:11 +0100
Message-Id: <20210111081611.12790-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Dylan Robinson <dylan_robinson@motu.com>,
 Keith Milner <kamilner@superlative.org>
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

Since the commit 5a6c3e11c9c9 ("ALSA: usb-audio: Add hw constraint for
implicit fb sync"), we apply the hw constraints for the implicit
feedback sync to make the secondary open aligned with the already
opened stream setup.  This change assumed that the secondary open is
performed after the first stream has been already set up, and adds the
hw constraints to sync with the first stream's parameters only when
the EP setup for the first stream was confirmed at the open time.
However, most of applications handling the full-duplex operations do
open both playback and capture streams at first, then set up both
streams.  This results in skipping the additional hw constraints since
the counter-part stream hasn't been set up yet at the open of the
second stream, and it eventually leads to "incompatible EP" error in
the end.

This patch corrects the behavior by always applying the hw constraints
for the implicit fb sync.  The hw constraint rules are defined so that
they check the sync EP dynamically at each invocation, instead.  This
covers the concurrent stream setups better and lets the hw refine
calls resolving to the right configuration.

Also this patch corrects a minor error that has existed in the debug
print that isn't built as default.

Fixes: 5a6c3e11c9c9 ("ALSA: usb-audio: Add hw constraint for implicit fb sync")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

This patched was developed primarily as an attemp for the regression
of Pioneer devices.  Although Pioneer devices have still some issues
after this patch, this one itself should be good for all devices in
general.

Keith, Dylan, could you verify that this doesn't break things for your
devices?


 sound/usb/pcm.c | 171 ++++++++++++++++++++++++++++++------------------
 1 file changed, 108 insertions(+), 63 deletions(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 56079901769f..f71965bf815f 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -663,7 +663,7 @@ static int hw_check_valid_format(struct snd_usb_substream *subs,
 	check_fmts.bits[1] = (u32)(fp->formats >> 32);
 	snd_mask_intersect(&check_fmts, fmts);
 	if (snd_mask_empty(&check_fmts)) {
-		hwc_debug("   > check: no supported format %d\n", fp->format);
+		hwc_debug("   > check: no supported format 0x%llx\n", fp->formats);
 		return 0;
 	}
 	/* check the channels */
@@ -775,24 +775,11 @@ static int hw_rule_channels(struct snd_pcm_hw_params *params,
 	return apply_hw_params_minmax(it, rmin, rmax);
 }
 
-static int hw_rule_format(struct snd_pcm_hw_params *params,
-			  struct snd_pcm_hw_rule *rule)
+static int apply_hw_params_format_bits(struct snd_mask *fmt, u64 fbits)
 {
-	struct snd_usb_substream *subs = rule->private;
-	const struct audioformat *fp;
-	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
-	u64 fbits;
 	u32 oldbits[2];
 	int changed;
 
-	hwc_debug("hw_rule_format: %x:%x\n", fmt->bits[0], fmt->bits[1]);
-	fbits = 0;
-	list_for_each_entry(fp, &subs->fmt_list, list) {
-		if (!hw_check_valid_format(subs, params, fp))
-			continue;
-		fbits |= fp->formats;
-	}
-
 	oldbits[0] = fmt->bits[0];
 	oldbits[1] = fmt->bits[1];
 	fmt->bits[0] &= (u32)fbits;
@@ -806,6 +793,24 @@ static int hw_rule_format(struct snd_pcm_hw_params *params,
 	return changed;
 }
 
+static int hw_rule_format(struct snd_pcm_hw_params *params,
+			  struct snd_pcm_hw_rule *rule)
+{
+	struct snd_usb_substream *subs = rule->private;
+	const struct audioformat *fp;
+	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
+	u64 fbits;
+
+	hwc_debug("hw_rule_format: %x:%x\n", fmt->bits[0], fmt->bits[1]);
+	fbits = 0;
+	list_for_each_entry(fp, &subs->fmt_list, list) {
+		if (!hw_check_valid_format(subs, params, fp))
+			continue;
+		fbits |= fp->formats;
+	}
+	return apply_hw_params_format_bits(fmt, fbits);
+}
+
 static int hw_rule_period_time(struct snd_pcm_hw_params *params,
 			       struct snd_pcm_hw_rule *rule)
 {
@@ -833,64 +838,92 @@ static int hw_rule_period_time(struct snd_pcm_hw_params *params,
 	return apply_hw_params_minmax(it, pmin, UINT_MAX);
 }
 
-/* apply PCM hw constraints from the concurrent sync EP */
-static int apply_hw_constraint_from_sync(struct snd_pcm_runtime *runtime,
-					 struct snd_usb_substream *subs)
+/* get the EP or the sync EP for implicit fb when it's already set up */
+static const struct snd_usb_endpoint *
+get_sync_ep_from_substream(struct snd_usb_substream *subs)
 {
 	struct snd_usb_audio *chip = subs->stream->chip;
-	struct snd_usb_endpoint *ep;
 	const struct audioformat *fp;
-	int err;
+	const struct snd_usb_endpoint *ep;
 
 	list_for_each_entry(fp, &subs->fmt_list, list) {
 		ep = snd_usb_get_endpoint(chip, fp->endpoint);
 		if (ep && ep->cur_rate)
-			goto found;
+			return ep;
 		if (!fp->implicit_fb)
 			continue;
 		/* for the implicit fb, check the sync ep as well */
 		ep = snd_usb_get_endpoint(chip, fp->sync_ep);
 		if (ep && ep->cur_rate)
-			goto found;
+			return ep;
 	}
-	return 0;
+	return NULL;
+}
+
+/* additional hw constraints for implicit feedback mode */
+static int hw_rule_format_implicit_fb(struct snd_pcm_hw_params *params,
+				      struct snd_pcm_hw_rule *rule)
+{
+	struct snd_usb_substream *subs = rule->private;
+	const struct snd_usb_endpoint *ep;
+	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 
- found:
-	if (!find_format(&subs->fmt_list, ep->cur_format, ep->cur_rate,
-			 ep->cur_channels, false, NULL)) {
-		usb_audio_dbg(chip, "EP 0x%x being used, but not applicable\n",
-			      ep->ep_num);
+	ep = get_sync_ep_from_substream(subs);
+	if (!ep)
 		return 0;
-	}
 
-	usb_audio_dbg(chip, "EP 0x%x being used, using fixed params:\n",
-		      ep->ep_num);
-	usb_audio_dbg(chip, "rate=%d, period_size=%d, periods=%d\n",
-		      ep->cur_rate, ep->cur_period_frames,
-		      ep->cur_buffer_periods);
+	hwc_debug("applying %s\n", __func__);
+	return apply_hw_params_format_bits(fmt, pcm_format_to_bits(ep->cur_format));
+}
 
-	runtime->hw.formats = subs->formats;
-	runtime->hw.rate_min = runtime->hw.rate_max = ep->cur_rate;
-	runtime->hw.rates = SNDRV_PCM_RATE_KNOT;
-	runtime->hw.periods_min = runtime->hw.periods_max =
-		ep->cur_buffer_periods;
+static int hw_rule_rate_implicit_fb(struct snd_pcm_hw_params *params,
+				    struct snd_pcm_hw_rule *rule)
+{
+	struct snd_usb_substream *subs = rule->private;
+	const struct snd_usb_endpoint *ep;
+	struct snd_interval *it;
 
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
-				  hw_rule_channels, subs,
-				  SNDRV_PCM_HW_PARAM_FORMAT,
-				  SNDRV_PCM_HW_PARAM_RATE,
-				  -1);
-	if (err < 0)
-		return err;
+	ep = get_sync_ep_from_substream(subs);
+	if (!ep)
+		return 0;
 
-	err = snd_pcm_hw_constraint_minmax(runtime,
-					   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
-					   ep->cur_period_frames,
-					   ep->cur_period_frames);
-	if (err < 0)
-		return err;
+	hwc_debug("applying %s\n", __func__);
+	it = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
+	return apply_hw_params_minmax(it, ep->cur_rate, ep->cur_rate);
+}
+
+static int hw_rule_period_size_implicit_fb(struct snd_pcm_hw_params *params,
+					   struct snd_pcm_hw_rule *rule)
+{
+	struct snd_usb_substream *subs = rule->private;
+	const struct snd_usb_endpoint *ep;
+	struct snd_interval *it;
 
-	return 1; /* notify the finding */
+	ep = get_sync_ep_from_substream(subs);
+	if (!ep)
+		return 0;
+
+	hwc_debug("applying %s\n", __func__);
+	it = hw_param_interval(params, SNDRV_PCM_HW_PARAM_PERIOD_SIZE);
+	return apply_hw_params_minmax(it, ep->cur_period_frames,
+				      ep->cur_period_frames);
+}
+
+static int hw_rule_periods_implicit_fb(struct snd_pcm_hw_params *params,
+				       struct snd_pcm_hw_rule *rule)
+{
+	struct snd_usb_substream *subs = rule->private;
+	const struct snd_usb_endpoint *ep;
+	struct snd_interval *it;
+
+	ep = get_sync_ep_from_substream(subs);
+	if (!ep)
+		return 0;
+
+	hwc_debug("applying %s\n", __func__);
+	it = hw_param_interval(params, SNDRV_PCM_HW_PARAM_PERIODS);
+	return apply_hw_params_minmax(it, ep->cur_buffer_periods,
+				      ep->cur_buffer_periods);
 }
 
 /*
@@ -899,20 +932,11 @@ static int apply_hw_constraint_from_sync(struct snd_pcm_runtime *runtime,
 
 static int setup_hw_info(struct snd_pcm_runtime *runtime, struct snd_usb_substream *subs)
 {
-	struct snd_usb_audio *chip = subs->stream->chip;
 	const struct audioformat *fp;
 	unsigned int pt, ptmin;
 	int param_period_time_if_needed = -1;
 	int err;
 
-	mutex_lock(&chip->mutex);
-	err = apply_hw_constraint_from_sync(runtime, subs);
-	mutex_unlock(&chip->mutex);
-	if (err < 0)
-		return err;
-	if (err > 0) /* found the matching? */
-		goto add_extra_rules;
-
 	runtime->hw.formats = subs->formats;
 
 	runtime->hw.rate_min = 0x7fffffff;
@@ -964,7 +988,6 @@ static int setup_hw_info(struct snd_pcm_runtime *runtime, struct snd_usb_substre
 	if (err < 0)
 		return err;
 
-add_extra_rules:
 	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 				  hw_rule_channels, subs,
 				  SNDRV_PCM_HW_PARAM_FORMAT,
@@ -993,6 +1016,28 @@ static int setup_hw_info(struct snd_pcm_runtime *runtime, struct snd_usb_substre
 			return err;
 	}
 
+	/* additional hw constraints for implicit fb */
+	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_FORMAT,
+				  hw_rule_format_implicit_fb, subs,
+				  SNDRV_PCM_HW_PARAM_FORMAT, -1);
+	if (err < 0)
+		return err;
+	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+				  hw_rule_rate_implicit_fb, subs,
+				  SNDRV_PCM_HW_PARAM_RATE, -1);
+	if (err < 0)
+		return err;
+	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+				  hw_rule_period_size_implicit_fb, subs,
+				  SNDRV_PCM_HW_PARAM_PERIOD_SIZE, -1);
+	if (err < 0)
+		return err;
+	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_PERIODS,
+				  hw_rule_periods_implicit_fb, subs,
+				  SNDRV_PCM_HW_PARAM_PERIODS, -1);
+	if (err < 0)
+		return err;
+
 	return 0;
 }
 
-- 
2.26.2

