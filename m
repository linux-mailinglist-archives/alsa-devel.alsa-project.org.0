Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0BC2C01E3
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 10:02:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBD5516BA;
	Mon, 23 Nov 2020 10:01:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBD5516BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606122151;
	bh=1Ai5AFhp2hzBie3IWe/urEZ6u9o+eqG1bVGZ9cwqm8s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=doa1jAtW8TdxHKvVW32UKSByT4Ra2FKCKP9oIK2ry54VeG+BhcMowlkzCVUkVDYf7
	 l4efrD9LQXyKd5d5CwcLB1uljI2eWBf3YcWWr/JGah9dOscVle3bt+JZkv3COckYr0
	 TIKID15MDLO+3e69/kIAsTFRL7xRxHtROzkyIPGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3A04F80566;
	Mon, 23 Nov 2020 09:54:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 497FAF80533; Mon, 23 Nov 2020 09:54:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DA08F804DF
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:54:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DA08F804DF
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 73BE5AFCE;
 Mon, 23 Nov 2020 08:53:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 27/41] ALSA: usb-audio: Constify audioformat pointer references
Date: Mon, 23 Nov 2020 09:53:33 +0100
Message-Id: <20201123085347.19667-28-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20201123085347.19667-1-tiwai@suse.de>
References: <20201123085347.19667-1-tiwai@suse.de>
Cc: Matwey Kornilov <matwey.kornilov@gmail.com>,
 Dylan Robinson <dylan_robinson@motu.com>,
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

The audioformat is referred in many places but most of usages are
read-only.  Let's add const prefix in the possible places.

Tested-by: Keith Milner <kamilner@superlative.org>
Tested-by: Dylan Robinson <dylan_robinson@motu.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.h     |  4 ++--
 sound/usb/clock.c    | 16 ++++++++--------
 sound/usb/clock.h    |  4 ++--
 sound/usb/endpoint.c |  2 +-
 sound/usb/endpoint.h |  2 +-
 sound/usb/pcm.c      | 32 ++++++++++++++++----------------
 sound/usb/pcm.h      |  2 +-
 sound/usb/quirks.c   |  9 +++++----
 sound/usb/quirks.h   |  6 +++---
 9 files changed, 39 insertions(+), 38 deletions(-)

diff --git a/sound/usb/card.h b/sound/usb/card.h
index cde492e9581a..53f0ce61f858 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -120,7 +120,7 @@ struct snd_usb_endpoint {
 	bool need_setup;		/* (re-)need for configure? */
 
 	/* for hw constraints */
-	struct audioformat *cur_audiofmt;
+	const struct audioformat *cur_audiofmt;
 	unsigned int cur_rate;
 	snd_pcm_format_t cur_format;
 	unsigned int cur_channels;
@@ -142,7 +142,7 @@ struct snd_usb_substream {
 	int direction;	/* playback or capture */
 	int interface;	/* current interface */
 	int endpoint;	/* assigned endpoint */
-	struct audioformat *cur_audiofmt;	/* current audioformat pointer (for hw_params callback) */
+	const struct audioformat *cur_audiofmt;	/* current audioformat pointer (for hw_params callback) */
 	struct snd_usb_power_domain *str_pd;	/* UAC3 Power Domain for streaming path */
 	snd_pcm_format_t pcm_format;	/* current audio format (for hw_params callback) */
 	unsigned int channels;		/* current number of channels (for hw_params callback) */
diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index b869a711afbf..e940dcee792b 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -152,7 +152,7 @@ static int uac_clock_selector_set_val(struct snd_usb_audio *chip, int selector_i
 }
 
 static bool uac_clock_source_is_valid_quirk(struct snd_usb_audio *chip,
-					    struct audioformat *fmt,
+					    const struct audioformat *fmt,
 					    int source_id)
 {
 	bool ret = false;
@@ -215,7 +215,7 @@ static bool uac_clock_source_is_valid_quirk(struct snd_usb_audio *chip,
 }
 
 static bool uac_clock_source_is_valid(struct snd_usb_audio *chip,
-				      struct audioformat *fmt,
+				      const struct audioformat *fmt,
 				      int source_id)
 {
 	int err;
@@ -264,7 +264,7 @@ static bool uac_clock_source_is_valid(struct snd_usb_audio *chip,
 }
 
 static int __uac_clock_find_source(struct snd_usb_audio *chip,
-				   struct audioformat *fmt, int entity_id,
+				   const struct audioformat *fmt, int entity_id,
 				   unsigned long *visited, bool validate)
 {
 	struct uac_clock_source_descriptor *source;
@@ -358,7 +358,7 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
 }
 
 static int __uac3_clock_find_source(struct snd_usb_audio *chip,
-				    struct audioformat *fmt, int entity_id,
+				    const struct audioformat *fmt, int entity_id,
 				    unsigned long *visited, bool validate)
 {
 	struct uac3_clock_source_descriptor *source;
@@ -464,7 +464,7 @@ static int __uac3_clock_find_source(struct snd_usb_audio *chip,
  * Returns the clock source UnitID (>=0) on success, or an error.
  */
 int snd_usb_clock_find_source(struct snd_usb_audio *chip,
-			      struct audioformat *fmt, bool validate)
+			      const struct audioformat *fmt, bool validate)
 {
 	DECLARE_BITMAP(visited, 256);
 	memset(visited, 0, sizeof(visited));
@@ -482,7 +482,7 @@ int snd_usb_clock_find_source(struct snd_usb_audio *chip,
 }
 
 static int set_sample_rate_v1(struct snd_usb_audio *chip,
-			      struct audioformat *fmt, int rate)
+			      const struct audioformat *fmt, int rate)
 {
 	struct usb_device *dev = chip->dev;
 	struct usb_host_interface *alts;
@@ -611,7 +611,7 @@ int snd_usb_set_sample_rate_v2v3(struct snd_usb_audio *chip,
 }
 
 static int set_sample_rate_v2v3(struct snd_usb_audio *chip,
-				struct audioformat *fmt, int rate)
+				const struct audioformat *fmt, int rate)
 {
 	int cur_rate, prev_rate;
 	int clock;
@@ -663,7 +663,7 @@ static int set_sample_rate_v2v3(struct snd_usb_audio *chip,
 }
 
 int snd_usb_init_sample_rate(struct snd_usb_audio *chip,
-			     struct audioformat *fmt, int rate)
+			     const struct audioformat *fmt, int rate)
 {
 	usb_audio_dbg(chip, "%d:%d Set sample rate %d, clock %d\n",
 		      fmt->iface, fmt->altsetting, rate, fmt->clock);
diff --git a/sound/usb/clock.h b/sound/usb/clock.h
index 8d406ed294d6..ed9fc2dc0510 100644
--- a/sound/usb/clock.h
+++ b/sound/usb/clock.h
@@ -3,10 +3,10 @@
 #define __USBAUDIO_CLOCK_H
 
 int snd_usb_init_sample_rate(struct snd_usb_audio *chip,
-			     struct audioformat *fmt, int rate);
+			     const struct audioformat *fmt, int rate);
 
 int snd_usb_clock_find_source(struct snd_usb_audio *chip,
-			      struct audioformat *fmt, bool validate);
+			      const struct audioformat *fmt, bool validate);
 
 int snd_usb_set_sample_rate_v2v3(struct snd_usb_audio *chip,
 				 const struct audioformat *fmt,
diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index b8f06a75fc2a..49fb934ee432 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -623,7 +623,7 @@ bool snd_usb_endpoint_compatible(struct snd_usb_audio *chip,
  */
 struct snd_usb_endpoint *
 snd_usb_endpoint_open(struct snd_usb_audio *chip,
-		      struct audioformat *fp,
+		      const struct audioformat *fp,
 		      const struct snd_pcm_hw_params *params,
 		      bool is_sync_ep)
 {
diff --git a/sound/usb/endpoint.h b/sound/usb/endpoint.h
index 2bfa6d3e029c..201011d89659 100644
--- a/sound/usb/endpoint.h
+++ b/sound/usb/endpoint.h
@@ -12,7 +12,7 @@ int snd_usb_add_endpoint(struct snd_usb_audio *chip, int ep_num, int type);
 
 struct snd_usb_endpoint *
 snd_usb_endpoint_open(struct snd_usb_audio *chip,
-		      struct audioformat *fp,
+		      const struct audioformat *fp,
 		      const struct snd_pcm_hw_params *params,
 		      bool is_sync_ep);
 void snd_usb_endpoint_close(struct snd_usb_audio *chip,
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index e80e8cf1e863..fc028492dd1a 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -80,13 +80,13 @@ static snd_pcm_uframes_t snd_usb_pcm_pointer(struct snd_pcm_substream *substream
 /*
  * find a matching audio format
  */
-static struct audioformat *
+static const struct audioformat *
 find_format(struct list_head *fmt_list_head, snd_pcm_format_t format,
 	    unsigned int rate, unsigned int channels, bool strict_match,
 	    struct snd_usb_substream *subs)
 {
-	struct audioformat *fp;
-	struct audioformat *found = NULL;
+	const struct audioformat *fp;
+	const struct audioformat *found = NULL;
 	int cur_attr = 0, attr;
 
 	list_for_each_entry(fp, fmt_list_head, list) {
@@ -141,7 +141,7 @@ find_format(struct list_head *fmt_list_head, snd_pcm_format_t format,
 	return found;
 }
 
-static struct audioformat *
+static const struct audioformat *
 find_substream_format(struct snd_usb_substream *subs,
 		      const struct snd_pcm_hw_params *params)
 {
@@ -182,7 +182,7 @@ static int init_pitch_v2(struct snd_usb_audio *chip, int ep)
  * initialize the pitch control and sample rate
  */
 int snd_usb_init_pitch(struct snd_usb_audio *chip,
-		       struct audioformat *fmt)
+		       const struct audioformat *fmt)
 {
 	int err;
 
@@ -641,14 +641,14 @@ find_matching_substream(struct snd_usb_audio *chip, int stream, int ep_num,
 	return NULL;
 }
 
-static struct audioformat *
+static const struct audioformat *
 find_implicit_fb_sync_format(struct snd_usb_audio *chip,
 			     const struct audioformat *target,
 			     const struct snd_pcm_hw_params *params,
 			     int stream)
 {
 	struct snd_usb_substream *subs;
-	struct audioformat *fp, *sync_fmt;
+	const struct audioformat *fp, *sync_fmt;
 	int score, high_score;
 
 	subs = find_matching_substream(chip, stream, target->sync_ep,
@@ -726,8 +726,8 @@ static int snd_usb_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_usb_substream *subs = substream->runtime->private_data;
 	struct snd_usb_audio *chip = subs->stream->chip;
-	struct audioformat *fmt;
-	struct audioformat *sync_fmt;
+	const struct audioformat *fmt;
+	const struct audioformat *sync_fmt;
 	int ret;
 
 	ret = snd_media_start_pipeline(subs);
@@ -918,7 +918,7 @@ static const struct snd_pcm_hardware snd_usb_hardware =
 
 static int hw_check_valid_format(struct snd_usb_substream *subs,
 				 struct snd_pcm_hw_params *params,
-				 struct audioformat *fp)
+				 const struct audioformat *fp)
 {
 	struct snd_interval *it = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
 	struct snd_interval *ct = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
@@ -995,7 +995,7 @@ static int hw_rule_rate(struct snd_pcm_hw_params *params,
 			struct snd_pcm_hw_rule *rule)
 {
 	struct snd_usb_substream *subs = rule->private;
-	struct audioformat *fp;
+	const struct audioformat *fp;
 	struct snd_interval *it = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
 	unsigned int rmin, rmax, r;
 	int i;
@@ -1028,7 +1028,7 @@ static int hw_rule_channels(struct snd_pcm_hw_params *params,
 			    struct snd_pcm_hw_rule *rule)
 {
 	struct snd_usb_substream *subs = rule->private;
-	struct audioformat *fp;
+	const struct audioformat *fp;
 	struct snd_interval *it = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
 	unsigned int rmin, rmax;
 
@@ -1049,7 +1049,7 @@ static int hw_rule_format(struct snd_pcm_hw_params *params,
 			  struct snd_pcm_hw_rule *rule)
 {
 	struct snd_usb_substream *subs = rule->private;
-	struct audioformat *fp;
+	const struct audioformat *fp;
 	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 	u64 fbits;
 	u32 oldbits[2];
@@ -1080,7 +1080,7 @@ static int hw_rule_period_time(struct snd_pcm_hw_params *params,
 			       struct snd_pcm_hw_rule *rule)
 {
 	struct snd_usb_substream *subs = rule->private;
-	struct audioformat *fp;
+	const struct audioformat *fp;
 	struct snd_interval *it;
 	unsigned char min_datainterval;
 	unsigned int pmin;
@@ -1109,7 +1109,7 @@ static int apply_hw_constraint_from_sync(struct snd_pcm_runtime *runtime,
 {
 	struct snd_usb_audio *chip = subs->stream->chip;
 	struct snd_usb_endpoint *ep;
-	struct audioformat *fp;
+	const struct audioformat *fp;
 	int err;
 
 	list_for_each_entry(fp, &subs->fmt_list, list) {
@@ -1170,7 +1170,7 @@ static int apply_hw_constraint_from_sync(struct snd_pcm_runtime *runtime,
 static int setup_hw_info(struct snd_pcm_runtime *runtime, struct snd_usb_substream *subs)
 {
 	struct snd_usb_audio *chip = subs->stream->chip;
-	struct audioformat *fp;
+	const struct audioformat *fp;
 	unsigned int pt, ptmin;
 	int param_period_time_if_needed = -1;
 	int err;
diff --git a/sound/usb/pcm.h b/sound/usb/pcm.h
index a4f784225abc..06c586467d3f 100644
--- a/sound/usb/pcm.h
+++ b/sound/usb/pcm.h
@@ -10,7 +10,7 @@ int snd_usb_pcm_suspend(struct snd_usb_stream *as);
 int snd_usb_pcm_resume(struct snd_usb_stream *as);
 
 int snd_usb_init_pitch(struct snd_usb_audio *chip,
-		       struct audioformat *fmt);
+		       const struct audioformat *fmt);
 void snd_usb_preallocate_buffer(struct snd_usb_substream *subs);
 
 int snd_usb_audioformat_set_sync_ep(struct snd_usb_audio *chip,
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 7e7f258011ff..5510c8a98447 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1375,7 +1375,8 @@ int snd_usb_apply_boot_quirk_once(struct usb_device *dev,
 /*
  * check if the device uses big-endian samples
  */
-int snd_usb_is_big_endian_format(struct snd_usb_audio *chip, struct audioformat *fp)
+int snd_usb_is_big_endian_format(struct snd_usb_audio *chip,
+				 const struct audioformat *fp)
 {
 	/* it depends on altsetting whether the device is big-endian or not */
 	switch (chip->usb_id) {
@@ -1414,7 +1415,7 @@ enum {
 };
 
 static void set_format_emu_quirk(struct snd_usb_substream *subs,
-				 struct audioformat *fmt)
+				 const struct audioformat *fmt)
 {
 	unsigned char emu_samplerate_id = 0;
 
@@ -1476,7 +1477,7 @@ static int pioneer_djm_set_format_quirk(struct snd_usb_substream *subs)
 }
 
 void snd_usb_set_format_quirk(struct snd_usb_substream *subs,
-			      struct audioformat *fmt)
+			      const struct audioformat *fmt)
 {
 	switch (subs->stream->chip->usb_id) {
 	case USB_ID(0x041e, 0x3f02): /* E-Mu 0202 USB */
@@ -1543,7 +1544,7 @@ static bool is_itf_usb_dsd_dac(unsigned int id)
 }
 
 int snd_usb_select_mode_quirk(struct snd_usb_audio *chip,
-			      struct audioformat *fmt)
+			      const struct audioformat *fmt)
 {
 	struct usb_device *dev = chip->dev;
 	int err;
diff --git a/sound/usb/quirks.h b/sound/usb/quirks.h
index 011f22cf2bf6..67a02303c820 100644
--- a/sound/usb/quirks.h
+++ b/sound/usb/quirks.h
@@ -26,12 +26,12 @@ int snd_usb_apply_boot_quirk_once(struct usb_device *dev,
 				  unsigned int usb_id);
 
 void snd_usb_set_format_quirk(struct snd_usb_substream *subs,
-			      struct audioformat *fmt);
+			      const struct audioformat *fmt);
 
 bool snd_usb_get_sample_rate_quirk(struct snd_usb_audio *chip);
 
 int snd_usb_is_big_endian_format(struct snd_usb_audio *chip,
-				 struct audioformat *fp);
+				 const struct audioformat *fp);
 
 void snd_usb_endpoint_start_quirk(struct snd_usb_endpoint *ep);
 
@@ -41,7 +41,7 @@ void snd_usb_ctl_msg_quirk(struct usb_device *dev, unsigned int pipe,
 			   __u16 index, void *data, __u16 size);
 
 int snd_usb_select_mode_quirk(struct snd_usb_audio *chip,
-			      struct audioformat *fmt);
+			      const struct audioformat *fmt);
 
 u64 snd_usb_interface_dsd_format_quirks(struct snd_usb_audio *chip,
 					struct audioformat *fp,
-- 
2.16.4

