Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A1665B599
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Jan 2023 18:09:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8D16A32A;
	Mon,  2 Jan 2023 18:09:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8D16A32A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672679393;
	bh=hRP2MhpiXO2spFgi9ZlSVuS3RbXNH1V3oH8nSPSHnsg=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hMiMc9M06RDIjiFLOu4H43cf8mwRaL1f3nDgUFg2b8qCv8qqlEAr6XbaBeEPvY5n+
	 KMf3ydbV3OdNi/kzKnLPiwww3QcPP3u7OjO8a1UHUQn7sj2YhiZyxFFpobXEW9AL07
	 tScgUVU8V68pziLtlqXJnHgitOUdD+y6RWxTzF84=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07A41F80238;
	Mon,  2 Jan 2023 18:08:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 258F6F8023A; Mon,  2 Jan 2023 18:08:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F06B7F8023B
 for <alsa-devel@alsa-project.org>; Mon,  2 Jan 2023 18:08:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F06B7F8023B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=EXHiuaf5; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Hxa7ZcrS
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1AE663428A;
 Mon,  2 Jan 2023 17:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672679287; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2MuqSgL9HR4Ia6m8Am+IEey9c1JujNcXVj+T9OaMkNc=;
 b=EXHiuaf5JWGf6JkZ/lMOVYJocsv5RMHqc8/xhc5JnI/7xYtSPAPBMG+PBvsEGce+zwQmyI
 d4ZmOrSg+xP98PEudt6X3Fgw/zjPdpEkBuAbOoVwXFHqlXJwmBZjJx07nS5PYMb4xzpxt2
 h/5uUUFBEC9QfhHZrDOxFORZQQsrASg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672679287;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2MuqSgL9HR4Ia6m8Am+IEey9c1JujNcXVj+T9OaMkNc=;
 b=Hxa7ZcrSkHaZov9/uh3BkaWZqsgqnKpfbitN0JOpWXpxyZnjUCYsYYpAdT5ax5meNazDyU
 N/FS2yaksLE2pqDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 00F17139ED;
 Mon,  2 Jan 2023 17:08:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KC4oO3YPs2ODGAAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 02 Jan 2023 17:08:06 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ALSA: usb-audio: More refactoring of hw constraint rules
Date: Mon,  2 Jan 2023 18:07:59 +0100
Message-Id: <20230102170759.29610-4-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230102170759.29610-1-tiwai@suse.de>
References: <20230102170759.29610-1-tiwai@suse.de>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Although we applied a workaround for the hw constraints code with the
implicit feedback sync, it still has a potential problem.  Namely, as
the code treats only the first matching (sync) endpoint, it might be
too restrictive when multiple endpoints are listed in the substream's
format list.

This patch is another attempt to improve the hw constraint handling
for the implicit feedback sync.  The code is rewritten and the sync EP
handling for the rate and the format is put inside the fmt_list loop
in each hw_rule_*() function instead of the additional rules.  The
rules for the period size and periods are extended to loop over the
fmt_list like others, and they apply the constraints only if needed.

Link: https://lore.kernel.org/r/4e509aea-e563-e592-e652-ba44af6733fe@veniogames.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/pcm.c | 218 +++++++++++++++++++++++++++++-------------------
 1 file changed, 131 insertions(+), 87 deletions(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 2fd4ecc1b25a..fbd4798834e5 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -789,11 +789,27 @@ static int apply_hw_params_minmax(struct snd_interval *it, unsigned int rmin,
 	return changed;
 }
 
+/* get the specified endpoint object that is being used by other streams
+ * (i.e. the parameter is locked)
+ */
+static const struct snd_usb_endpoint *
+get_endpoint_in_use(struct snd_usb_audio *chip, int endpoint,
+		    const struct snd_usb_endpoint *ref_ep)
+{
+	const struct snd_usb_endpoint *ep;
+
+	ep = snd_usb_get_endpoint(chip, endpoint);
+	if (ep && ep->cur_audiofmt && (ep != ref_ep || ep->opened > 1))
+		return ep;
+	return NULL;
+}
+
 static int hw_rule_rate(struct snd_pcm_hw_params *params,
 			struct snd_pcm_hw_rule *rule)
 {
 	struct snd_usb_substream *subs = rule->private;
 	struct snd_usb_audio *chip = subs->stream->chip;
+	const struct snd_usb_endpoint *ep;
 	const struct audioformat *fp;
 	struct snd_interval *it = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
 	unsigned int rmin, rmax, r;
@@ -805,6 +821,29 @@ static int hw_rule_rate(struct snd_pcm_hw_params *params,
 	list_for_each_entry(fp, &subs->fmt_list, list) {
 		if (!hw_check_valid_format(subs, params, fp))
 			continue;
+
+		ep = get_endpoint_in_use(chip, fp->endpoint,
+					 subs->data_endpoint);
+		if (ep) {
+			hwc_debug("rate limit %d for ep#%x\n",
+				  ep->cur_rate, fp->endpoint);
+			rmin = min(rmin, ep->cur_rate);
+			rmax = max(rmax, ep->cur_rate);
+			continue;
+		}
+
+		if (fp->implicit_fb) {
+			ep = get_endpoint_in_use(chip, fp->sync_ep,
+						 subs->sync_endpoint);
+			if (ep) {
+				hwc_debug("rate limit %d for sync_ep#%x\n",
+					  ep->cur_rate, fp->sync_ep);
+				rmin = min(rmin, ep->cur_rate);
+				rmax = max(rmax, ep->cur_rate);
+				continue;
+			}
+		}
+
 		r = snd_usb_endpoint_get_clock_rate(chip, fp->clock);
 		if (r > 0) {
 			if (!snd_interval_test(it, r))
@@ -874,6 +913,8 @@ static int hw_rule_format(struct snd_pcm_hw_params *params,
 			  struct snd_pcm_hw_rule *rule)
 {
 	struct snd_usb_substream *subs = rule->private;
+	struct snd_usb_audio *chip = subs->stream->chip;
+	const struct snd_usb_endpoint *ep;
 	const struct audioformat *fp;
 	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 	u64 fbits;
@@ -883,6 +924,27 @@ static int hw_rule_format(struct snd_pcm_hw_params *params,
 	list_for_each_entry(fp, &subs->fmt_list, list) {
 		if (!hw_check_valid_format(subs, params, fp))
 			continue;
+
+		ep = get_endpoint_in_use(chip, fp->endpoint,
+					 subs->data_endpoint);
+		if (ep) {
+			hwc_debug("format limit %d for ep#%x\n",
+				  ep->cur_format, fp->endpoint);
+			fbits |= pcm_format_to_bits(ep->cur_format);
+			continue;
+		}
+
+		if (fp->implicit_fb) {
+			ep = get_endpoint_in_use(chip, fp->sync_ep,
+						 subs->sync_endpoint);
+			if (ep) {
+				hwc_debug("format limit %d for sync_ep#%x\n",
+					  ep->cur_format, fp->sync_ep);
+				fbits |= pcm_format_to_bits(ep->cur_format);
+				continue;
+			}
+		}
+
 		fbits |= fp->formats;
 	}
 	return apply_hw_params_format_bits(fmt, fbits);
@@ -915,103 +977,95 @@ static int hw_rule_period_time(struct snd_pcm_hw_params *params,
 	return apply_hw_params_minmax(it, pmin, UINT_MAX);
 }
 
-/* get the EP or the sync EP for implicit fb when it's already set up */
-static const struct snd_usb_endpoint *
-get_sync_ep_from_substream(struct snd_usb_substream *subs)
+/* additional hw constraints for implicit feedback mode */
+static int hw_rule_period_size_implicit_fb(struct snd_pcm_hw_params *params,
+					   struct snd_pcm_hw_rule *rule)
 {
+	struct snd_usb_substream *subs = rule->private;
 	struct snd_usb_audio *chip = subs->stream->chip;
 	const struct audioformat *fp;
 	const struct snd_usb_endpoint *ep;
+	struct snd_interval *it;
+	unsigned int rmin, rmax;
 
+	it = hw_param_interval(params, SNDRV_PCM_HW_PARAM_PERIOD_SIZE);
+	hwc_debug("hw_rule_period_size: (%u,%u)\n", it->min, it->max);
+	rmin = UINT_MAX;
+	rmax = 0;
 	list_for_each_entry(fp, &subs->fmt_list, list) {
-		ep = snd_usb_get_endpoint(chip, fp->endpoint);
-		if (ep && ep->cur_audiofmt) {
-			/* if EP is already opened solely for this substream,
-			 * we still allow us to change the parameter; otherwise
-			 * this substream has to follow the existing parameter
-			 */
-			if (ep->cur_audiofmt != subs->cur_audiofmt || ep->opened > 1)
-				return ep;
-		}
-		if (!fp->implicit_fb)
+		if (!hw_check_valid_format(subs, params, fp))
+			continue;
+		ep = get_endpoint_in_use(chip, fp->endpoint,
+					 subs->data_endpoint);
+		if (ep) {
+			hwc_debug("period size limit %d for ep#%x\n",
+				  ep->cur_period_frames, fp->endpoint);
+			rmin = min(rmin, ep->cur_period_frames);
+			rmax = max(rmax, ep->cur_period_frames);
 			continue;
-		/* for the implicit fb, check the sync ep as well */
-		ep = snd_usb_get_endpoint(chip, fp->sync_ep);
-		if (ep && ep->cur_audiofmt) {
-			/* ditto, if the sync (data) ep is used by others,
-			 * this stream is restricted by the sync ep
-			 */
-			if (ep != subs->sync_endpoint || ep->opened > 1)
-				return ep;
 		}
-	}
-	return NULL;
-}
 
-/* additional hw constraints for implicit feedback mode */
-static int hw_rule_format_implicit_fb(struct snd_pcm_hw_params *params,
-				      struct snd_pcm_hw_rule *rule)
-{
-	struct snd_usb_substream *subs = rule->private;
-	const struct snd_usb_endpoint *ep;
-	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
-
-	ep = get_sync_ep_from_substream(subs);
-	if (!ep)
-		return 0;
-
-	hwc_debug("applying %s\n", __func__);
-	return apply_hw_params_format_bits(fmt, pcm_format_to_bits(ep->cur_format));
-}
-
-static int hw_rule_rate_implicit_fb(struct snd_pcm_hw_params *params,
-				    struct snd_pcm_hw_rule *rule)
-{
-	struct snd_usb_substream *subs = rule->private;
-	const struct snd_usb_endpoint *ep;
-	struct snd_interval *it;
-
-	ep = get_sync_ep_from_substream(subs);
-	if (!ep)
-		return 0;
-
-	hwc_debug("applying %s\n", __func__);
-	it = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
-	return apply_hw_params_minmax(it, ep->cur_rate, ep->cur_rate);
-}
-
-static int hw_rule_period_size_implicit_fb(struct snd_pcm_hw_params *params,
-					   struct snd_pcm_hw_rule *rule)
-{
-	struct snd_usb_substream *subs = rule->private;
-	const struct snd_usb_endpoint *ep;
-	struct snd_interval *it;
-
-	ep = get_sync_ep_from_substream(subs);
-	if (!ep)
-		return 0;
+		if (fp->implicit_fb) {
+			ep = get_endpoint_in_use(chip, fp->sync_ep,
+						 subs->sync_endpoint);
+			if (ep) {
+				hwc_debug("period size limit %d for sync_ep#%x\n",
+					  ep->cur_period_frames, fp->sync_ep);
+				rmin = min(rmin, ep->cur_period_frames);
+				rmax = max(rmax, ep->cur_period_frames);
+				continue;
+			}
+		}
+	}
 
-	hwc_debug("applying %s\n", __func__);
-	it = hw_param_interval(params, SNDRV_PCM_HW_PARAM_PERIOD_SIZE);
-	return apply_hw_params_minmax(it, ep->cur_period_frames,
-				      ep->cur_period_frames);
+	if (!rmax)
+		return 0; /* no limit by implicit fb */
+	return apply_hw_params_minmax(it, rmin, rmax);
 }
 
 static int hw_rule_periods_implicit_fb(struct snd_pcm_hw_params *params,
 				       struct snd_pcm_hw_rule *rule)
 {
 	struct snd_usb_substream *subs = rule->private;
+	struct snd_usb_audio *chip = subs->stream->chip;
+	const struct audioformat *fp;
 	const struct snd_usb_endpoint *ep;
 	struct snd_interval *it;
+	unsigned int rmin, rmax;
 
-	ep = get_sync_ep_from_substream(subs);
-	if (!ep)
-		return 0;
-
-	hwc_debug("applying %s\n", __func__);
 	it = hw_param_interval(params, SNDRV_PCM_HW_PARAM_PERIODS);
-	return apply_hw_params_minmax(it, ep->cur_buffer_periods,
-				      ep->cur_buffer_periods);
+	hwc_debug("hw_rule_periods: (%u,%u)\n", it->min, it->max);
+	rmin = UINT_MAX;
+	rmax = 0;
+	list_for_each_entry(fp, &subs->fmt_list, list) {
+		if (!hw_check_valid_format(subs, params, fp))
+			continue;
+		ep = get_endpoint_in_use(chip, fp->endpoint,
+					 subs->data_endpoint);
+		if (ep) {
+			hwc_debug("periods limit %d for ep#%x\n",
+				  ep->cur_buffer_periods, fp->endpoint);
+			rmin = min(rmin, ep->cur_buffer_periods);
+			rmax = max(rmax, ep->cur_buffer_periods);
+			continue;
+		}
+
+		if (fp->implicit_fb) {
+			ep = get_endpoint_in_use(chip, fp->sync_ep,
+						 subs->sync_endpoint);
+			if (ep) {
+				hwc_debug("periods limit %d for sync_ep#%x\n",
+					  ep->cur_buffer_periods, fp->sync_ep);
+				rmin = min(rmin, ep->cur_buffer_periods);
+				rmax = max(rmax, ep->cur_buffer_periods);
+				continue;
+			}
+		}
+	}
+
+	if (!rmax)
+		return 0; /* no limit by implicit fb */
+	return apply_hw_params_minmax(it, rmin, rmax);
 }
 
 /*
@@ -1120,16 +1174,6 @@ static int setup_hw_info(struct snd_pcm_runtime *runtime, struct snd_usb_substre
 		return err;
 
 	/* additional hw constraints for implicit fb */
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_FORMAT,
-				  hw_rule_format_implicit_fb, subs,
-				  SNDRV_PCM_HW_PARAM_FORMAT, -1);
-	if (err < 0)
-		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
-				  hw_rule_rate_implicit_fb, subs,
-				  SNDRV_PCM_HW_PARAM_RATE, -1);
-	if (err < 0)
-		return err;
 	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
 				  hw_rule_period_size_implicit_fb, subs,
 				  SNDRV_PCM_HW_PARAM_PERIOD_SIZE, -1);
-- 
2.35.3

