Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A7381DC1D
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Dec 2023 20:29:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FAA0E74;
	Sun, 24 Dec 2023 20:29:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FAA0E74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703446188;
	bh=jRzO8dhGhWomEP3xmyIhqj3GkQKVFboKa4M0S2a8tHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e733u/xdxvIgUK2rG0pQfJ07oiR1gOJ7Ku7DecuyhUTIGvhpyNWLZ1g0JsffbwjDO
	 H4WrTYp419xpl3pD4pSFf9bAH+iFMxoWuZIk8NuzQ+ixrpvo6bgJXUz4AQYtFF/Whu
	 kS/DzY+lrWmyayJ9kzRVrE6N3NqYX2L2+HxvgATI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7134DF805BF; Sun, 24 Dec 2023 20:29:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C940AF805AB;
	Sun, 24 Dec 2023 20:29:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDD33F801EB; Sun, 24 Dec 2023 20:29:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75EA1F80578
	for <alsa-devel@alsa-project.org>; Sun, 24 Dec 2023 20:28:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75EA1F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=HncVgSW8
Received: by m.b4.vu (Postfix, from userid 1000)
	id 6AA2D604B9CB; Mon, 25 Dec 2023 05:58:38 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 6AA2D604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703446118; bh=BzP9Tj2gzNidJCBHafiWhThn0CaoHDFpKpoZ6/8HWt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HncVgSW88fhS59qfqVR/LZ1aLKOyDKLmYOgG/XOOLtbZkavQiC13CpZqIYEbQ3mLw
	 g5Sdr/5ZXR6Wqs0rBYexOiUKkQMOAs7Qll98KKHvsdeXpMt8usUCo0F/3hWyTQ8hiz
	 r5XJIYhlj5yqxSlmq5/f2PO0emrp3Ou/uhJB2BXNvGjzPPTyAx9fnylyILvMZs+eD7
	 PkqQsPI+xbwSMosgkGCsEpQk7cDwM6Ku8w929FhS1ZazEabg8+jXFN9bPzKiMDZwvN
	 ck9PE4RRz2Ytb4JmXJ3RaNSQvq8NrDs8t6KlEFwAXCyqGMY+URbXVJIn2JxIsdQTN1
	 oBcUOXrCzUJyg==
Date: Mon, 25 Dec 2023 05:58:38 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 14/23] ALSA: scarlett2: Refactor common port_count lookups
Message-ID: <db0a5b56bdff476e2e31ad8e5ee15008314412b7.1703444932.git.g@b4.vu>
References: <cover.1703444932.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703444932.git.g@b4.vu>
Message-ID-Hash: TYG2UBV6PLTBHPCBIG6UQFSSNEQ3LG4H
X-Message-ID-Hash: TYG2UBV6PLTBHPCBIG6UQFSSNEQ3LG4H
X-MailFrom: g@b4.vu
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TYG2UBV6PLTBHPCBIG6UQFSSNEQ3LG4H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Rather than looking up the analogue and mixer I/O counts repeatedly in
info->port_count[SCARLETT2_PORT_TYPE_*][SCARLETT2_PORT_*], save those
numbers in private variables.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 107 ++++++++++++------------------------
 1 file changed, 35 insertions(+), 72 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 341f23d448bc..898cf2bd9655 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -609,6 +609,9 @@ struct scarlett2_data {
 	__u8 bInterval;
 	u8 num_mux_srcs;
 	u8 num_mux_dsts;
+	u8 num_mix_in;
+	u8 num_mix_out;
+	u8 num_line_out;
 	u32 firmware_version;
 	u8 flash_segment_nums[SCARLETT2_SEGMENT_ID_COUNT];
 	u8 flash_segment_blocks[SCARLETT2_SEGMENT_ID_COUNT];
@@ -1744,10 +1747,8 @@ static int scarlett2_usb_get_mix(struct usb_mixer_interface *mixer,
 				 int mix_num)
 {
 	struct scarlett2_data *private = mixer->private_data;
-	const struct scarlett2_device_info *info = private->info;
 
-	int num_mixer_in =
-		info->port_count[SCARLETT2_PORT_TYPE_MIX][SCARLETT2_PORT_OUT];
+	int num_mixer_in = private->num_mix_in;
 	int err, i, j, k;
 
 	struct {
@@ -1787,7 +1788,6 @@ static int scarlett2_usb_set_mix(struct usb_mixer_interface *mixer,
 				 int mix_num)
 {
 	struct scarlett2_data *private = mixer->private_data;
-	const struct scarlett2_device_info *info = private->info;
 
 	struct {
 		__le16 mix_num;
@@ -1795,8 +1795,7 @@ static int scarlett2_usb_set_mix(struct usb_mixer_interface *mixer,
 	} __packed req;
 
 	int i, j;
-	int num_mixer_in =
-		info->port_count[SCARLETT2_PORT_TYPE_MIX][SCARLETT2_PORT_OUT];
+	int num_mixer_in = private->num_mix_in;
 
 	req.mix_num = cpu_to_le16(mix_num);
 
@@ -1907,9 +1906,6 @@ static void scarlett2_usb_populate_mux(struct scarlett2_data *private,
 static void scarlett2_update_meter_level_map(struct scarlett2_data *private)
 {
 	const struct scarlett2_device_info *info = private->info;
-	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
-	int line_out_count =
-		port_count[SCARLETT2_PORT_TYPE_ANALOGUE][SCARLETT2_PORT_OUT];
 	const struct scarlett2_meter_entry *entry;
 
 	/* sources already assigned to a destination
@@ -1938,7 +1934,7 @@ static void scarlett2_update_meter_level_map(struct scarlett2_data *private)
 			/* convert mux_idx using line_out_unmap[] */
 			int map_mux_idx = (
 			    info->line_out_remap_enable &&
-			    mux_idx < line_out_count
+			    mux_idx < private->num_line_out
 			) ? info->line_out_unmap[mux_idx]
 			  : mux_idx;
 
@@ -2249,10 +2245,7 @@ static int scarlett2_update_volumes(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
-	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
 	struct scarlett2_usb_volume_status volume_status;
-	int num_line_out =
-		port_count[SCARLETT2_PORT_TYPE_ANALOGUE][SCARLETT2_PORT_OUT];
 	int err, i;
 	int mute;
 
@@ -2272,7 +2265,7 @@ static int scarlett2_update_volumes(struct usb_mixer_interface *mixer)
 
 	mute = private->dim_mute[SCARLETT2_BUTTON_MUTE];
 
-	for (i = 0; i < num_line_out; i++)
+	for (i = 0; i < private->num_line_out; i++)
 		if (private->vol_sw_hw_switch[i]) {
 			private->vol[i] = private->master_vol;
 			private->mute_switch[i] = mute;
@@ -2324,14 +2317,11 @@ static int scarlett2_master_volume_ctl_get(struct snd_kcontrol *kctl,
 static int line_out_remap(struct scarlett2_data *private, int index)
 {
 	const struct scarlett2_device_info *info = private->info;
-	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
-	int line_out_count =
-		port_count[SCARLETT2_PORT_TYPE_ANALOGUE][SCARLETT2_PORT_OUT];
 
 	if (!info->line_out_remap_enable)
 		return index;
 
-	if (index >= line_out_count)
+	if (index >= private->num_line_out)
 		return index;
 
 	return info->line_out_remap[index];
@@ -3104,10 +3094,6 @@ static int scarlett2_update_monitor_other(struct usb_mixer_interface *mixer)
 		private->speaker_switching_switch = monitor_other_switch[0] + 1;
 
 	if (info->has_talkback) {
-		const int (*port_count)[SCARLETT2_PORT_DIRNS] =
-			info->port_count;
-		int num_mixes =
-			port_count[SCARLETT2_PORT_TYPE_MIX][SCARLETT2_PORT_IN];
 		u16 bitmap;
 		int i;
 
@@ -3121,7 +3107,7 @@ static int scarlett2_update_monitor_other(struct usb_mixer_interface *mixer)
 					       1, &bitmap);
 		if (err < 0)
 			return err;
-		for (i = 0; i < num_mixes; i++, bitmap >>= 1)
+		for (i = 0; i < private->num_mix_out; i++, bitmap >>= 1)
 			private->talkback_map[i] = bitmap & 1;
 	}
 
@@ -3518,10 +3504,6 @@ static int scarlett2_talkback_map_ctl_put(
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	const int (*port_count)[SCARLETT2_PORT_DIRNS] =
-		private->info->port_count;
-	int num_mixes = port_count[SCARLETT2_PORT_TYPE_MIX][SCARLETT2_PORT_IN];
-
 	int index = elem->control;
 	int oval, val, err = 0, i;
 	u16 bitmap = 0;
@@ -3541,7 +3523,7 @@ static int scarlett2_talkback_map_ctl_put(
 
 	private->talkback_map[index] = val;
 
-	for (i = 0; i < num_mixes; i++)
+	for (i = 0; i < private->num_mix_out; i++)
 		bitmap |= private->talkback_map[i] << i;
 
 	/* Send updated bitmap to the device */
@@ -3567,8 +3549,6 @@ static int scarlett2_add_talkback_ctls(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
-	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
-	int num_mixes = port_count[SCARLETT2_PORT_TYPE_MIX][SCARLETT2_PORT_IN];
 	int err, i;
 	char s[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
 
@@ -3582,7 +3562,7 @@ static int scarlett2_add_talkback_ctls(struct usb_mixer_interface *mixer)
 	if (err < 0)
 		return err;
 
-	for (i = 0; i < num_mixes; i++) {
+	for (i = 0; i < private->num_mix_out; i++) {
 		snprintf(s, sizeof(s),
 			 "Talkback Mix %c Playback Switch", i + 'A');
 		err = scarlett2_add_new_ctl(mixer, &scarlett2_talkback_map_ctl,
@@ -3629,11 +3609,6 @@ static int scarlett2_dim_mute_ctl_put(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	const struct scarlett2_device_info *info = private->info;
-	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
-	int num_line_out =
-		port_count[SCARLETT2_PORT_TYPE_ANALOGUE][SCARLETT2_PORT_OUT];
-
 	int index = elem->control;
 	int oval, val, err = 0, i;
 
@@ -3659,7 +3634,7 @@ static int scarlett2_dim_mute_ctl_put(struct snd_kcontrol *kctl,
 		err = 1;
 
 	if (index == SCARLETT2_BUTTON_MUTE)
-		for (i = 0; i < num_line_out; i++) {
+		for (i = 0; i < private->num_line_out; i++) {
 			int line_index = line_out_remap(private, i);
 
 			if (private->vol_sw_hw_switch[line_index]) {
@@ -3689,9 +3664,6 @@ static int scarlett2_add_line_out_ctls(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
-	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
-	int num_line_out =
-		port_count[SCARLETT2_PORT_TYPE_ANALOGUE][SCARLETT2_PORT_OUT];
 	int err, i;
 	char s[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
 
@@ -3706,7 +3678,7 @@ static int scarlett2_add_line_out_ctls(struct usb_mixer_interface *mixer)
 	}
 
 	/* Add volume controls */
-	for (i = 0; i < num_line_out; i++) {
+	for (i = 0; i < private->num_line_out; i++) {
 		int index = line_out_remap(private, i);
 
 		/* Fader */
@@ -3883,9 +3855,7 @@ static int scarlett2_mixer_ctl_put(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	const struct scarlett2_device_info *info = private->info;
-	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
-	int oval, val, num_mixer_in, mix_num, err = 0;
+	int oval, val, mix_num, err = 0;
 	int index = elem->control;
 
 	mutex_lock(&private->data_mutex);
@@ -3898,8 +3868,7 @@ static int scarlett2_mixer_ctl_put(struct snd_kcontrol *kctl,
 	oval = private->mix[index];
 	val = clamp(ucontrol->value.integer.value[0],
 		    0L, (long)SCARLETT2_MIXER_MAX_VALUE);
-	num_mixer_in = port_count[SCARLETT2_PORT_TYPE_MIX][SCARLETT2_PORT_OUT];
-	mix_num = index / num_mixer_in;
+	mix_num = index / private->num_mix_in;
 
 	if (oval == val)
 		goto unlock;
@@ -3935,19 +3904,12 @@ static const struct snd_kcontrol_new scarlett2_mixer_ctl = {
 static int scarlett2_add_mixer_ctls(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
-	const struct scarlett2_device_info *info = private->info;
-	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
 	int err, i, j;
 	int index;
 	char s[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
 
-	int num_inputs =
-		port_count[SCARLETT2_PORT_TYPE_MIX][SCARLETT2_PORT_OUT];
-	int num_outputs =
-		port_count[SCARLETT2_PORT_TYPE_MIX][SCARLETT2_PORT_IN];
-
-	for (i = 0, index = 0; i < num_outputs; i++)
-		for (j = 0; j < num_inputs; j++, index++) {
+	for (i = 0, index = 0; i < private->num_mix_out; i++)
+		for (j = 0; j < private->num_mix_in; j++, index++) {
 			snprintf(s, sizeof(s),
 				 "Mix %c Input %02d Playback Volume",
 				 'A' + i, j + 1);
@@ -4336,12 +4298,13 @@ static void scarlett2_private_suspend(struct usb_mixer_interface *mixer)
 
 /*** Initialisation ***/
 
-static void scarlett2_count_mux_io(struct scarlett2_data *private)
+static void scarlett2_count_io(struct scarlett2_data *private)
 {
 	const struct scarlett2_device_info *info = private->info;
 	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
 	int port_type, srcs = 0, dsts = 0;
 
+	/* Count the number of mux sources and destinations */
 	for (port_type = 0;
 	     port_type < SCARLETT2_PORT_TYPE_COUNT;
 	     port_type++) {
@@ -4351,6 +4314,17 @@ static void scarlett2_count_mux_io(struct scarlett2_data *private)
 
 	private->num_mux_srcs = srcs;
 	private->num_mux_dsts = dsts;
+
+	/* Mixer inputs are mux outputs and vice versa */
+	private->num_mix_in =
+		port_count[SCARLETT2_PORT_TYPE_MIX][SCARLETT2_PORT_OUT];
+
+	private->num_mix_out =
+		port_count[SCARLETT2_PORT_TYPE_MIX][SCARLETT2_PORT_IN];
+
+	/* Number of analogue line outputs */
+	private->num_line_out =
+		port_count[SCARLETT2_PORT_TYPE_ANALOGUE][SCARLETT2_PORT_OUT];
 }
 
 /* Look through the interface descriptors for the Focusrite Control
@@ -4406,7 +4380,7 @@ static int scarlett2_init_private(struct usb_mixer_interface *mixer,
 	private->info = entry->info;
 	private->config_set = entry->info->config_set;
 	private->series_name = entry->series_name;
-	scarlett2_count_mux_io(private);
+	scarlett2_count_io(private);
 	private->scarlett2_seq = 0;
 	private->mixer = mixer;
 
@@ -4544,11 +4518,6 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
-	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
-	int num_line_out =
-		port_count[SCARLETT2_PORT_TYPE_ANALOGUE][SCARLETT2_PORT_OUT];
-	int num_mixer_out =
-		port_count[SCARLETT2_PORT_TYPE_MIX][SCARLETT2_PORT_IN];
 	struct scarlett2_usb_volume_status volume_status;
 	int err, i;
 
@@ -4601,7 +4570,7 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 		volume_status.master_vol + SCARLETT2_VOLUME_BIAS,
 		0, SCARLETT2_VOLUME_BIAS);
 
-	for (i = 0; i < num_line_out; i++) {
+	for (i = 0; i < private->num_line_out; i++) {
 		int volume, mute;
 
 		private->vol_sw_hw_switch[i] =
@@ -4621,7 +4590,7 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 		private->mute_switch[i] = mute;
 	}
 
-	for (i = 0; i < num_mixer_out; i++) {
+	for (i = 0; i < private->num_mix_out; i++) {
 		err = scarlett2_usb_get_mix(mixer, i);
 		if (err < 0)
 			return err;
@@ -4647,9 +4616,6 @@ static void scarlett2_notify_monitor(struct usb_mixer_interface *mixer)
 	struct snd_card *card = mixer->chip->card;
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
-	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
-	int num_line_out =
-		port_count[SCARLETT2_PORT_TYPE_ANALOGUE][SCARLETT2_PORT_OUT];
 	int i;
 
 	/* if line_out_hw_vol is 0, there are no controls to update */
@@ -4661,7 +4627,7 @@ static void scarlett2_notify_monitor(struct usb_mixer_interface *mixer)
 	snd_ctl_notify(mixer->chip->card, SNDRV_CTL_EVENT_MASK_VALUE,
 		       &private->master_vol_ctl->id);
 
-	for (i = 0; i < num_line_out; i++)
+	for (i = 0; i < private->num_line_out; i++)
 		if (private->vol_sw_hw_switch[line_out_remap(private, i)])
 			snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
 				       &private->vol_ctls[i]->id);
@@ -4673,9 +4639,6 @@ static void scarlett2_notify_dim_mute(struct usb_mixer_interface *mixer)
 	struct snd_card *card = mixer->chip->card;
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
-	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
-	int num_line_out =
-		port_count[SCARLETT2_PORT_TYPE_ANALOGUE][SCARLETT2_PORT_OUT];
 	int i;
 
 	private->vol_updated = 1;
@@ -4687,7 +4650,7 @@ static void scarlett2_notify_dim_mute(struct usb_mixer_interface *mixer)
 		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
 			       &private->dim_mute_ctls[i]->id);
 
-	for (i = 0; i < num_line_out; i++)
+	for (i = 0; i < private->num_line_out; i++)
 		if (private->vol_sw_hw_switch[line_out_remap(private, i)])
 			snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
 				       &private->mute_ctls[i]->id);
-- 
2.43.0

