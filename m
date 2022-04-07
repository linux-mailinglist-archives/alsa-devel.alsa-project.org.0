Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BFD4F88C0
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 23:18:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DE501748;
	Thu,  7 Apr 2022 23:17:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DE501748
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649366298;
	bh=Xe6t/KwR7yLErk5qBWZKxsvD2JGxMceRUxiTsHmbH7M=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z/OJOpvMTSgoRC9iSJsTPo7ZuA/0MLpIxQv1te3/Uj+dPzZWy9ui940+hGULTQ2zZ
	 QI0ykc6VMv5JgakYCq81FwSwt9AbcDanqAADZpfaACMxaiJUuFMlybfsFI9AN1dbHd
	 Lvdu/oDlphgZDVROWmfefhDjxNJM8w8os9pNyw0M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F804F8026A;
	Thu,  7 Apr 2022 23:17:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE2B5F8024C; Thu,  7 Apr 2022 23:17:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74140F8012A
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 23:17:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74140F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="RSNBu+lg"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="MYI/jZM+"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 8C6041F37C
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 21:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649366228; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=riGNQT5zL5Uq+vahL0R2zp+s1dNtGbHVSfXaY7Gf6p8=;
 b=RSNBu+lguxgo12n28ktZmVE2Gp4ht18CuJ0EmUshuwS0T9nCJVsoWEbjzlKbyOAfwEtRUS
 V7DqDz7VnB/TJ9S6iA408VHevR+nIOKSFSGQGAPYTlEPFM2npypnRUf8BDYvTRZT+/Njcz
 hccVlEv4i1ZMaBu7A0OmyG/r5QpMCMg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649366228;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=riGNQT5zL5Uq+vahL0R2zp+s1dNtGbHVSfXaY7Gf6p8=;
 b=MYI/jZM+J2cnXzA4cKYH+vzT3Vily9w16vmWE0bHS9b8FRALDoRcoPEPO8/vuTNJgZWmhi
 0IHwqe8THeEqUrAg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 7C216A3B83;
 Thu,  7 Apr 2022 21:17:07 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Cap upper limits of buffer/period bytes for
 implicit fb
Date: Thu,  7 Apr 2022 23:16:57 +0200
Message-Id: <20220407211657.15087-1-tiwai@suse.de>
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

In the implicit feedback mode, some parameters are tied between both
playback and capture streams.  One of the tied parameters is the
period size, and this can be a problem if the device has different
number of channels to both streams.  Assume that an application opens
a playback stream that has an implicit feedback from a capture stream,
and it allocates up to the max period and buffer size as much as
possible.  When the capture device supports only more channels than
the playback, the minimum period and buffer sizes become larger than
the sizes the playback stream took.  That is, the minimum size will be
over the max size the driver limits, and PCM core sees as if no
available configuration is found, returning -EINVAL mercilessly.

For avoiding this problem, we have to look through the counter part of
audioformat list for each sync ep, and checks the channels.  If more
channels are found there, we reduce the max period and buffer sizes
accordingly.

You may wonder that the patch adds only the evaluation of channels
between streams, and what about other parameters?  Both the format and
the rate are tied in the implicit fb mode, hence they are always
identical.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=215792
Fixes: 5a6c3e11c9c9 ("ALSA: usb-audio: Add hw constraint for implicit fb sync")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/pcm.c | 89 +++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 87 insertions(+), 2 deletions(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index cec6e91afea2..6a460225f2e3 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -659,6 +659,9 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
 #define hwc_debug(fmt, args...) do { } while(0)
 #endif
 
+#define MAX_BUFFER_BYTES	(1024 * 1024)
+#define MAX_PERIOD_BYTES	(512 * 1024)
+
 static const struct snd_pcm_hardware snd_usb_hardware =
 {
 	.info =			SNDRV_PCM_INFO_MMAP |
@@ -669,9 +672,9 @@ static const struct snd_pcm_hardware snd_usb_hardware =
 				SNDRV_PCM_INFO_PAUSE,
 	.channels_min =		1,
 	.channels_max =		256,
-	.buffer_bytes_max =	1024 * 1024,
+	.buffer_bytes_max =	MAX_BUFFER_BYTES,
 	.period_bytes_min =	64,
-	.period_bytes_max =	512 * 1024,
+	.period_bytes_max =	MAX_PERIOD_BYTES,
 	.periods_min =		2,
 	.periods_max =		1024,
 };
@@ -971,6 +974,78 @@ static int hw_rule_periods_implicit_fb(struct snd_pcm_hw_params *params,
 				      ep->cur_buffer_periods);
 }
 
+/* get the adjusted max buffer (or period) bytes that can fit with the
+ * paired format for implicit fb
+ */
+static unsigned int
+get_adjusted_max_bytes(struct snd_usb_substream *subs,
+		       struct snd_usb_substream *pair,
+		       struct snd_pcm_hw_params *params,
+		       unsigned int max_bytes,
+		       bool reverse_map)
+{
+	const struct audioformat *fp, *pp;
+	unsigned int rmax = 0, r;
+
+	list_for_each_entry(fp, &subs->fmt_list, list) {
+		if (!fp->implicit_fb)
+			continue;
+		if (!reverse_map &&
+		    !hw_check_valid_format(subs, params, fp))
+			continue;
+		list_for_each_entry(pp, &pair->fmt_list, list) {
+			if (pp->iface != fp->sync_iface ||
+			    pp->altsetting != fp->sync_altsetting ||
+			    pp->ep_idx != fp->sync_ep_idx)
+				continue;
+			if (reverse_map &&
+			    !hw_check_valid_format(pair, params, pp))
+				break;
+			if (!reverse_map && pp->channels > fp->channels)
+				r = max_bytes * fp->channels / pp->channels;
+			else if (reverse_map && pp->channels < fp->channels)
+				r = max_bytes * pp->channels / fp->channels;
+			else
+				r = max_bytes;
+			rmax = max(rmax, r);
+			break;
+		}
+	}
+	return rmax;
+}
+
+/* Reduce the period or buffer bytes depending on the paired substream;
+ * when a paired configuration for implicit fb has a higher number of channels,
+ * we need to reduce the max size accordingly, otherwise it may become unusable
+ */
+static int hw_rule_bytes_implicit_fb(struct snd_pcm_hw_params *params,
+				     struct snd_pcm_hw_rule *rule)
+{
+	struct snd_usb_substream *subs = rule->private;
+	struct snd_usb_substream *pair;
+	struct snd_interval *it;
+	unsigned int max_bytes;
+	unsigned int rmax;
+
+	pair = &subs->stream->substream[!subs->direction];
+	if (!pair->ep_num)
+		return 0;
+
+	if (rule->var == SNDRV_PCM_HW_PARAM_PERIOD_BYTES)
+		max_bytes = MAX_PERIOD_BYTES;
+	else
+		max_bytes = MAX_BUFFER_BYTES;
+
+	rmax = get_adjusted_max_bytes(subs, pair, params, max_bytes, false);
+	if (!rmax)
+		rmax = get_adjusted_max_bytes(pair, subs, params, max_bytes, true);
+	if (!rmax)
+		return 0;
+
+	it = hw_param_interval(params, rule->var);
+	return apply_hw_params_minmax(it, 0, rmax);
+}
+
 /*
  * set up the runtime hardware information.
  */
@@ -1085,6 +1160,16 @@ static int setup_hw_info(struct snd_pcm_runtime *runtime, struct snd_usb_substre
 				  SNDRV_PCM_HW_PARAM_PERIODS, -1);
 	if (err < 0)
 		return err;
+	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
+				  hw_rule_bytes_implicit_fb, subs,
+				  SNDRV_PCM_HW_PARAM_BUFFER_BYTES, -1);
+	if (err < 0)
+		return err;
+	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
+				  hw_rule_bytes_implicit_fb, subs,
+				  SNDRV_PCM_HW_PARAM_PERIOD_BYTES, -1);
+	if (err < 0)
+		return err;
 
 	list_for_each_entry(fp, &subs->fmt_list, list) {
 		if (fp->implicit_fb) {
-- 
2.34.1

