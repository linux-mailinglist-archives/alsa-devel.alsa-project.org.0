Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DC939F8EB
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:22:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D8A717E3;
	Tue,  8 Jun 2021 16:21:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D8A717E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623162143;
	bh=Eu0i+Wj/Gv0fA6bdIEi4sZ7/XBKt9z/MBDgbHbpznwc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CnAH9+CtKFxvljCaubPU2G6wX+mPlDVxyY191nYQlnNnVpopYvoh4EEINTi2KnLuR
	 ixzHJ6ZQo3v3TmSiHdFWBtt+bO8t7KvDCCo/fx9V6gmuZ3zs/87k7ZgghVNIYGUArQ
	 NjJXd4oU0oulo+nFGNZ9lwb50k2OesNoBIBedhSo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 885A6F8062E;
	Tue,  8 Jun 2021 16:07:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FD19F80605; Tue,  8 Jun 2021 16:06:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3D7FF804F1
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3D7FF804F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="w8cJQpZx"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="rjpa9xpn"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 80EB31FDF3
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U9PPHyh9Pnmb9u/bloTfG6MdAafchoG+mTIVdFtEqhA=;
 b=w8cJQpZxkCLnyG3mvzqrtxYCxZ8eZuwj7X+cNlL5V+39frUAQ1IEo74Y++o4vJLvozSgVQ
 UpU0K2i07HeWTddrAOUYaMs6LqObxb6m09Dn3FwNW+jRstLm4OVpYbcg3QcUHnL1X0OM9o
 XgG7IvldDA5yvgQpwftpHQIMViflpwg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U9PPHyh9Pnmb9u/bloTfG6MdAafchoG+mTIVdFtEqhA=;
 b=rjpa9xpnFrLdbJU8X87mPChrLF8gKwtq4G8GJORltbw+2ZjKcP+1OJHHso2uOdYW9p5iVO
 Rwn8K3fN1UW+zADA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 6F71AA3B89;
 Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 55/66] ALSA: oss: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:29 +0200
Message-Id: <20210608140540.17885-56-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210608140540.17885-1-tiwai@suse.de>
References: <20210608140540.17885-1-tiwai@suse.de>
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

There are a few places doing assignments in if condition in ALSA PCM
and OSS emulation layers, which is a bad coding style that may confuse
readers and occasionally lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/oss/mixer_oss.c  | 45 ++++++++++++++++--------
 sound/core/oss/pcm_oss.c    | 70 ++++++++++++++++++++++++-------------
 sound/core/oss/pcm_plugin.c | 26 ++++++++------
 3 files changed, 91 insertions(+), 50 deletions(-)

diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
index bec928327478..6a5abdd4271b 100644
--- a/sound/core/oss/mixer_oss.c
+++ b/sound/core/oss/mixer_oss.c
@@ -185,7 +185,8 @@ static int snd_mixer_oss_get_recsrc(struct snd_mixer_oss_file *fmixer)
 	if (mixer->put_recsrc && mixer->get_recsrc) {	/* exclusive */
 		int err;
 		unsigned int index;
-		if ((err = mixer->get_recsrc(fmixer, &index)) < 0)
+		err = mixer->get_recsrc(fmixer, &index);
+		if (err < 0)
 			return err;
 		result = 1 << index;
 	} else {
@@ -517,7 +518,8 @@ static void snd_mixer_oss_get_volume1_vol(struct snd_mixer_oss_file *fmixer,
 	if (numid == ID_UNKNOWN)
 		return;
 	down_read(&card->controls_rwsem);
-	if ((kctl = snd_ctl_find_numid(card, numid)) == NULL) {
+	kctl = snd_ctl_find_numid(card, numid);
+	if (!kctl) {
 		up_read(&card->controls_rwsem);
 		return;
 	}
@@ -555,7 +557,8 @@ static void snd_mixer_oss_get_volume1_sw(struct snd_mixer_oss_file *fmixer,
 	if (numid == ID_UNKNOWN)
 		return;
 	down_read(&card->controls_rwsem);
-	if ((kctl = snd_ctl_find_numid(card, numid)) == NULL) {
+	kctl = snd_ctl_find_numid(card, numid);
+	if (!kctl) {
 		up_read(&card->controls_rwsem);
 		return;
 	}
@@ -620,7 +623,8 @@ static void snd_mixer_oss_put_volume1_vol(struct snd_mixer_oss_file *fmixer,
 	if (numid == ID_UNKNOWN)
 		return;
 	down_read(&card->controls_rwsem);
-	if ((kctl = snd_ctl_find_numid(card, numid)) == NULL) {
+	kctl = snd_ctl_find_numid(card, numid);
+	if (!kctl) {
 		up_read(&card->controls_rwsem);
 		return;
 	}
@@ -636,7 +640,8 @@ static void snd_mixer_oss_put_volume1_vol(struct snd_mixer_oss_file *fmixer,
 	uctl->value.integer.value[0] = snd_mixer_oss_conv2(left, uinfo->value.integer.min, uinfo->value.integer.max);
 	if (uinfo->count > 1)
 		uctl->value.integer.value[1] = snd_mixer_oss_conv2(right, uinfo->value.integer.min, uinfo->value.integer.max);
-	if ((res = kctl->put(kctl, uctl)) < 0)
+	res = kctl->put(kctl, uctl);
+	if (res < 0)
 		goto __unalloc;
 	if (res > 0)
 		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
@@ -661,7 +666,8 @@ static void snd_mixer_oss_put_volume1_sw(struct snd_mixer_oss_file *fmixer,
 	if (numid == ID_UNKNOWN)
 		return;
 	down_read(&card->controls_rwsem);
-	if ((kctl = snd_ctl_find_numid(card, numid)) == NULL) {
+	kctl = snd_ctl_find_numid(card, numid);
+	if (!kctl) {
 		up_read(&card->controls_rwsem);
 		return;
 	}
@@ -681,7 +687,8 @@ static void snd_mixer_oss_put_volume1_sw(struct snd_mixer_oss_file *fmixer,
 	} else {
 		uctl->value.integer.value[0] = (left > 0 || right > 0) ? 1 : 0;
 	}
-	if ((res = kctl->put(kctl, uctl)) < 0)
+	res = kctl->put(kctl, uctl);
+	if (res < 0)
 		goto __unalloc;
 	if (res > 0)
 		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
@@ -809,9 +816,11 @@ static int snd_mixer_oss_get_recsrc2(struct snd_mixer_oss_file *fmixer, unsigned
 		err = -ENOENT;
 		goto __unlock;
 	}
-	if ((err = kctl->info(kctl, uinfo)) < 0)
+	err = kctl->info(kctl, uinfo);
+	if (err < 0)
 		goto __unlock;
-	if ((err = kctl->get(kctl, uctl)) < 0)
+	err = kctl->get(kctl, uctl);
+	if (err < 0)
 		goto __unlock;
 	for (idx = 0; idx < 32; idx++) {
 		if (!(mixer->mask_recsrc & (1 << idx)))
@@ -860,7 +869,8 @@ static int snd_mixer_oss_put_recsrc2(struct snd_mixer_oss_file *fmixer, unsigned
 		err = -ENOENT;
 		goto __unlock;
 	}
-	if ((err = kctl->info(kctl, uinfo)) < 0)
+	err = kctl->info(kctl, uinfo);
+	if (err < 0)
 		goto __unlock;
 	for (idx = 0; idx < 32; idx++) {
 		if (!(mixer->mask_recsrc & (1 << idx)))
@@ -915,7 +925,8 @@ static int snd_mixer_oss_build_test(struct snd_mixer_oss *mixer, struct slot *sl
 		up_read(&card->controls_rwsem);
 		return -ENOMEM;
 	}
-	if ((err = kcontrol->info(kcontrol, info)) < 0) {
+	err = kcontrol->info(kcontrol, info);
+	if (err < 0) {
 		up_read(&card->controls_rwsem);
 		kfree(info);
 		return err;
@@ -1036,7 +1047,10 @@ static int snd_mixer_oss_build_input(struct snd_mixer_oss *mixer,
 	if (snd_mixer_oss_build_test_all(mixer, ptr, &slot))
 		return 0;
 	down_read(&mixer->card->controls_rwsem);
-	if (ptr->index == 0 && (kctl = snd_mixer_oss_test_id(mixer, "Capture Source", 0)) != NULL) {
+	kctl = NULL;
+	if (!ptr->index)
+		kctl = snd_mixer_oss_test_id(mixer, "Capture Source", 0);
+	if (kctl) {
 		struct snd_ctl_elem_info *uinfo;
 
 		uinfo = kzalloc(sizeof(*uinfo), GFP_KERNEL);
@@ -1343,9 +1357,10 @@ static int snd_mixer_oss_notify_handler(struct snd_card *card, int cmd)
 		if (mixer == NULL)
 			return -ENOMEM;
 		mutex_init(&mixer->reg_mutex);
-		if ((err = snd_register_oss_device(SNDRV_OSS_DEVICE_TYPE_MIXER,
-						   card, 0,
-						   &snd_mixer_oss_f_ops, card)) < 0) {
+		err = snd_register_oss_device(SNDRV_OSS_DEVICE_TYPE_MIXER,
+					      card, 0,
+					      &snd_mixer_oss_f_ops, card);
+		if (err < 0) {
 			dev_err(card->dev,
 				"unable to register OSS mixer device %i:%i\n",
 				card->number, 0);
diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index 86c39ee01aaa..82a818734a5f 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -955,9 +955,8 @@ static int snd_pcm_oss_change_params_locked(struct snd_pcm_substream *substream)
 	if (!direct) {
 		/* add necessary plugins */
 		snd_pcm_oss_plugin_clear(substream);
-		if ((err = snd_pcm_plug_format_plugins(substream,
-						       params, 
-						       sparams)) < 0) {
+		err = snd_pcm_plug_format_plugins(substream, params, sparams);
+		if (err < 0) {
 			pcm_dbg(substream->pcm,
 				"snd_pcm_plug_format_plugins failed: %i\n", err);
 			snd_pcm_oss_plugin_clear(substream);
@@ -965,7 +964,8 @@ static int snd_pcm_oss_change_params_locked(struct snd_pcm_substream *substream)
 		}
 		if (runtime->oss.plugin_first) {
 			struct snd_pcm_plugin *plugin;
-			if ((err = snd_pcm_plugin_build_io(substream, sparams, &plugin)) < 0) {
+			err = snd_pcm_plugin_build_io(substream, sparams, &plugin);
+			if (err < 0) {
 				pcm_dbg(substream->pcm,
 					"snd_pcm_plugin_build_io failed: %i\n", err);
 				snd_pcm_oss_plugin_clear(substream);
@@ -1011,7 +1011,8 @@ static int snd_pcm_oss_change_params_locked(struct snd_pcm_substream *substream)
 		sw_params->silence_size = frames;
 	}
 
-	if ((err = snd_pcm_kernel_ioctl(substream, SNDRV_PCM_IOCTL_SW_PARAMS, sw_params)) < 0) {
+	err = snd_pcm_kernel_ioctl(substream, SNDRV_PCM_IOCTL_SW_PARAMS, sw_params);
+	if (err < 0) {
 		pcm_dbg(substream->pcm, "SW_PARAMS failed: %i\n", err);
 		goto failure;
 	}
@@ -1573,7 +1574,8 @@ static int snd_pcm_oss_post(struct snd_pcm_oss_file *pcm_oss_file)
 
 	substream = pcm_oss_file->streams[SNDRV_PCM_STREAM_PLAYBACK];
 	if (substream != NULL) {
-		if ((err = snd_pcm_oss_make_ready(substream)) < 0)
+		err = snd_pcm_oss_make_ready(substream);
+		if (err < 0)
 			return err;
 		snd_pcm_kernel_ioctl(substream, SNDRV_PCM_IOCTL_START, NULL);
 	}
@@ -1645,7 +1647,8 @@ static int snd_pcm_oss_sync(struct snd_pcm_oss_file *pcm_oss_file)
 		runtime = substream->runtime;
 		if (atomic_read(&substream->mmap_count))
 			goto __direct;
-		if ((err = snd_pcm_oss_make_ready(substream)) < 0)
+		err = snd_pcm_oss_make_ready(substream);
+		if (err < 0)
 			return err;
 		atomic_inc(&runtime->oss.rw_ref);
 		if (mutex_lock_interruptible(&runtime->oss.params_lock)) {
@@ -1711,7 +1714,8 @@ static int snd_pcm_oss_sync(struct snd_pcm_oss_file *pcm_oss_file)
 
 	substream = pcm_oss_file->streams[SNDRV_PCM_STREAM_CAPTURE];
 	if (substream != NULL) {
-		if ((err = snd_pcm_oss_make_ready(substream)) < 0)
+		err = snd_pcm_oss_make_ready(substream);
+		if (err < 0)
 			return err;
 		runtime = substream->runtime;
 		err = snd_pcm_kernel_ioctl(substream, SNDRV_PCM_IOCTL_DROP, NULL);
@@ -1758,7 +1762,8 @@ static int snd_pcm_oss_get_rate(struct snd_pcm_oss_file *pcm_oss_file)
 	struct snd_pcm_substream *substream;
 	int err;
 	
-	if ((err = snd_pcm_oss_get_active_substream(pcm_oss_file, &substream)) < 0)
+	err = snd_pcm_oss_get_active_substream(pcm_oss_file, &substream);
+	if (err < 0)
 		return err;
 	return substream->runtime->oss.rate;
 }
@@ -1795,7 +1800,8 @@ static int snd_pcm_oss_get_channels(struct snd_pcm_oss_file *pcm_oss_file)
 	struct snd_pcm_substream *substream;
 	int err;
 	
-	if ((err = snd_pcm_oss_get_active_substream(pcm_oss_file, &substream)) < 0)
+	err = snd_pcm_oss_get_active_substream(pcm_oss_file, &substream);
+	if (err < 0)
 		return err;
 	return substream->runtime->oss.channels;
 }
@@ -1805,7 +1811,8 @@ static int snd_pcm_oss_get_block_size(struct snd_pcm_oss_file *pcm_oss_file)
 	struct snd_pcm_substream *substream;
 	int err;
 	
-	if ((err = snd_pcm_oss_get_active_substream(pcm_oss_file, &substream)) < 0)
+	err = snd_pcm_oss_get_active_substream(pcm_oss_file, &substream);
+	if (err < 0)
 		return err;
 	return substream->runtime->oss.period_bytes;
 }
@@ -1820,7 +1827,8 @@ static int snd_pcm_oss_get_formats(struct snd_pcm_oss_file *pcm_oss_file)
 	const struct snd_mask *format_mask;
 	int fmt;
 
-	if ((err = snd_pcm_oss_get_active_substream(pcm_oss_file, &substream)) < 0)
+	err = snd_pcm_oss_get_active_substream(pcm_oss_file, &substream);
+	if (err < 0)
 		return err;
 	if (atomic_read(&substream->mmap_count))
 		direct = 1;
@@ -1890,7 +1898,8 @@ static int snd_pcm_oss_get_format(struct snd_pcm_oss_file *pcm_oss_file)
 	struct snd_pcm_substream *substream;
 	int err;
 	
-	if ((err = snd_pcm_oss_get_active_substream(pcm_oss_file, &substream)) < 0)
+	err = snd_pcm_oss_get_active_substream(pcm_oss_file, &substream);
+	if (err < 0)
 		return err;
 	return substream->runtime->oss.format;
 }
@@ -2050,11 +2059,13 @@ static int snd_pcm_oss_set_trigger(struct snd_pcm_oss_file *pcm_oss_file, int tr
 	csubstream = pcm_oss_file->streams[SNDRV_PCM_STREAM_CAPTURE];
 
 	if (psubstream) {
-		if ((err = snd_pcm_oss_make_ready(psubstream)) < 0)
+		err = snd_pcm_oss_make_ready(psubstream);
+		if (err < 0)
 			return err;
 	}
 	if (csubstream) {
-		if ((err = snd_pcm_oss_make_ready(csubstream)) < 0)
+		err = snd_pcm_oss_make_ready(csubstream);
+		if (err < 0)
 			return err;
 	}
       	if (psubstream) {
@@ -2141,7 +2152,8 @@ static int snd_pcm_oss_get_odelay(struct snd_pcm_oss_file *pcm_oss_file)
 	substream = pcm_oss_file->streams[SNDRV_PCM_STREAM_PLAYBACK];
 	if (substream == NULL)
 		return -EINVAL;
-	if ((err = snd_pcm_oss_make_ready(substream)) < 0)
+	err = snd_pcm_oss_make_ready(substream);
+	if (err < 0)
 		return err;
 	runtime = substream->runtime;
 	if (runtime->oss.params || runtime->oss.prepare)
@@ -2168,7 +2180,8 @@ static int snd_pcm_oss_get_ptr(struct snd_pcm_oss_file *pcm_oss_file, int stream
 	substream = pcm_oss_file->streams[stream];
 	if (substream == NULL)
 		return -EINVAL;
-	if ((err = snd_pcm_oss_make_ready(substream)) < 0)
+	err = snd_pcm_oss_make_ready(substream);
+	if (err < 0)
 		return err;
 	runtime = substream->runtime;
 	if (runtime->oss.params || runtime->oss.prepare) {
@@ -2239,9 +2252,11 @@ static int snd_pcm_oss_get_space(struct snd_pcm_oss_file *pcm_oss_file, int stre
 		return -EINVAL;
 	runtime = substream->runtime;
 
-	if (runtime->oss.params &&
-	    (err = snd_pcm_oss_change_params(substream, false)) < 0)
-		return err;
+	if (runtime->oss.params) {
+		err = snd_pcm_oss_change_params(substream, false);
+		if (err < 0)
+			return err;
+	}
 
 	info.fragsize = runtime->oss.period_bytes;
 	info.fragstotal = runtime->periods;
@@ -2601,7 +2616,8 @@ static long snd_pcm_oss_ioctl(struct file *file, unsigned int cmd, unsigned long
 	case SNDCTL_DSP_SPEED:
 		if (get_user(res, p))
 			return -EFAULT;
-		if ((res = snd_pcm_oss_set_rate(pcm_oss_file, res))<0)
+		res = snd_pcm_oss_set_rate(pcm_oss_file, res);
+		if (res < 0)
 			return res;
 		return put_user(res, p);
 	case SOUND_PCM_READ_RATE:
@@ -2613,7 +2629,8 @@ static long snd_pcm_oss_ioctl(struct file *file, unsigned int cmd, unsigned long
 		if (get_user(res, p))
 			return -EFAULT;
 		res = res > 0 ? 2 : 1;
-		if ((res = snd_pcm_oss_set_channels(pcm_oss_file, res)) < 0)
+		res = snd_pcm_oss_set_channels(pcm_oss_file, res);
+		if (res < 0)
 			return res;
 		return put_user(--res, p);
 	case SNDCTL_DSP_GETBLKSIZE:
@@ -2829,7 +2846,8 @@ static __poll_t snd_pcm_oss_poll(struct file *file, poll_table * wait)
 		snd_pcm_state_t ostate;
 		poll_wait(file, &runtime->sleep, wait);
 		snd_pcm_stream_lock_irq(csubstream);
-		if ((ostate = runtime->status->state) != SNDRV_PCM_STATE_RUNNING ||
+		ostate = runtime->status->state;
+		if (ostate != SNDRV_PCM_STATE_RUNNING ||
 		    snd_pcm_oss_capture_ready(csubstream))
 			mask |= EPOLLIN | EPOLLRDNORM;
 		snd_pcm_stream_unlock_irq(csubstream);
@@ -3043,7 +3061,8 @@ static void snd_pcm_oss_proc_init(struct snd_pcm *pcm)
 		struct snd_pcm_str *pstr = &pcm->streams[stream];
 		if (pstr->substream_count == 0)
 			continue;
-		if ((entry = snd_info_create_card_entry(pcm->card, "oss", pstr->proc_root)) != NULL) {
+		entry = snd_info_create_card_entry(pcm->card, "oss", pstr->proc_root);
+		if (entry) {
 			entry->content = SNDRV_INFO_CONTENT_TEXT;
 			entry->mode = S_IFREG | 0644;
 			entry->c.text.read = snd_pcm_oss_proc_read;
@@ -3191,7 +3210,8 @@ static int __init alsa_pcm_oss_init(void)
 			adsp_map[i] = 1;
 		}
 	}
-	if ((err = snd_pcm_notify(&snd_pcm_oss_notify, 0)) < 0)
+	err = snd_pcm_notify(&snd_pcm_oss_notify, 0);
+	if (err < 0)
 		return err;
 	return 0;
 }
diff --git a/sound/core/oss/pcm_plugin.c b/sound/core/oss/pcm_plugin.c
index d5ca161d588c..061ba06bc926 100644
--- a/sound/core/oss/pcm_plugin.c
+++ b/sound/core/oss/pcm_plugin.c
@@ -59,7 +59,8 @@ static int snd_pcm_plugin_alloc(struct snd_pcm_plugin *plugin, snd_pcm_uframes_t
 	} else {
 		format = &plugin->dst_format;
 	}
-	if ((width = snd_pcm_format_physical_width(format->format)) < 0)
+	width = snd_pcm_format_physical_width(format->format);
+	if (width < 0)
 		return width;
 	size = frames * format->channels * width;
 	if (snd_BUG_ON(size % 8))
@@ -572,7 +573,8 @@ snd_pcm_sframes_t snd_pcm_plug_client_channels_buf(struct snd_pcm_substream *plu
 	}
 	v = plugin->buf_channels;
 	*channels = v;
-	if ((width = snd_pcm_format_physical_width(format->format)) < 0)
+	width = snd_pcm_format_physical_width(format->format);
+	if (width < 0)
 		return width;
 	nchannels = format->channels;
 	if (snd_BUG_ON(plugin->access != SNDRV_PCM_ACCESS_RW_INTERLEAVED &&
@@ -600,16 +602,17 @@ snd_pcm_sframes_t snd_pcm_plug_write_transfer(struct snd_pcm_substream *plug, st
 	while (plugin) {
 		if (frames <= 0)
 			return frames;
-		if ((next = plugin->next) != NULL) {
+		next = plugin->next;
+		if (next) {
 			snd_pcm_sframes_t frames1 = frames;
 			if (plugin->dst_frames) {
 				frames1 = plugin->dst_frames(plugin, frames);
 				if (frames1 <= 0)
 					return frames1;
 			}
-			if ((err = next->client_channels(next, frames1, &dst_channels)) < 0) {
+			err = next->client_channels(next, frames1, &dst_channels);
+			if (err < 0)
 				return err;
-			}
 			if (err != frames1) {
 				frames = err;
 				if (plugin->src_frames) {
@@ -621,7 +624,8 @@ snd_pcm_sframes_t snd_pcm_plug_write_transfer(struct snd_pcm_substream *plug, st
 		} else
 			dst_channels = NULL;
 		pdprintf("write plugin: %s, %li\n", plugin->name, frames);
-		if ((frames = plugin->transfer(plugin, src_channels, dst_channels, frames)) < 0)
+		frames = plugin->transfer(plugin, src_channels, dst_channels, frames);
+		if (frames < 0)
 			return frames;
 		src_channels = dst_channels;
 		plugin = next;
@@ -643,16 +647,18 @@ snd_pcm_sframes_t snd_pcm_plug_read_transfer(struct snd_pcm_substream *plug, str
 	src_channels = NULL;
 	plugin = snd_pcm_plug_first(plug);
 	while (plugin && frames > 0) {
-		if ((next = plugin->next) != NULL) {
-			if ((err = plugin->client_channels(plugin, frames, &dst_channels)) < 0) {
+		next = plugin->next;
+		if (next) {
+			err = plugin->client_channels(plugin, frames, &dst_channels);
+			if (err < 0)
 				return err;
-			}
 			frames = err;
 		} else {
 			dst_channels = dst_channels_final;
 		}
 		pdprintf("read plugin: %s, %li\n", plugin->name, frames);
-		if ((frames = plugin->transfer(plugin, src_channels, dst_channels, frames)) < 0)
+		frames = plugin->transfer(plugin, src_channels, dst_channels, frames);
+		if (frames < 0)
 			return frames;
 		plugin = next;
 		src_channels = dst_channels;
-- 
2.26.2

