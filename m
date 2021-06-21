Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 058FA3AF4D1
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 20:19:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91044173F;
	Mon, 21 Jun 2021 20:18:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91044173F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624299579;
	bh=HmvVpvDrAgBwlg2Qs2MYTbEuOf650rSgrn34kUrXohI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O3gPFe/mVyMAkG2/Ik4WFM+GTfQP9uG0WJ8d9OA5jE9W56fWTnoR4MzO1SQ0IDomD
	 e8ZjeIRODDntvYeVz/lhUWUHV+wQX1YGPxYvZ1aE+VIzfEPrdN5rAOkLKgIgQ4RY+D
	 u8f7wXcB5AQdEmqCjBeG5VapcJJFh7w5ZbrShrzk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AF2CF805B5;
	Mon, 21 Jun 2021 20:10:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7175EF805AF; Mon, 21 Jun 2021 20:10:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F244DF8057D
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 20:10:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F244DF8057D
Received: by m.b4.vu (Postfix, from userid 1000)
 id 7363E61E5F00; Tue, 22 Jun 2021 03:40:05 +0930 (ACST)
Date: Tue, 22 Jun 2021 03:40:05 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 25/31] ALSA: usb-audio: scarlett2: Label 18i8 Gen 3 line
 outputs correctly
Message-ID: <2aa653a0b4a18020c50805952676c5c5383cd593.1624294591.git.g@b4.vu>
References: <cover.1624294591.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1624294591.git.g@b4.vu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Hin-Tak Leung <htl10@users.sourceforge.net>,
 Vladimir Sadovnikov <sadko4u@gmail.com>
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

The 18i8 Gen 3 analogue 7/8 outputs are identified as line 3/4 on the
rear of the unit. Add support for remapping the channel numbers to
match the labelling.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 82 ++++++++++++++++++++++++---------
 1 file changed, 59 insertions(+), 23 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 94de63847169..03decb35d25e 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -344,6 +344,12 @@ struct scarlett2_device_info {
 	 */
 	u8 direct_monitor;
 
+	/* remap analogue outputs; 18i8 Gen 3 has "line 3/4" connected
+	 * internally to the analogue 7/8 outputs
+	 */
+	u8 line_out_remap_enable;
+	u8 line_out_remap[SCARLETT2_ANALOGUE_MAX];
+
 	/* additional description for the line out volume controls */
 	const char * const line_out_descrs[SCARLETT2_ANALOGUE_MAX];
 
@@ -684,15 +690,18 @@ static const struct scarlett2_device_info s18i8_gen3_info = {
 	.phantom_count = 2,
 	.inputs_per_phantom = 2,
 
+	.line_out_remap_enable = 1,
+	.line_out_remap = { 0, 1, 6, 7, 2, 3, 4, 5 },
+
 	.line_out_descrs = {
 		"Monitor L",
 		"Monitor R",
+		"Alt Monitor L",
+		"Alt Monitor R",
 		"Headphones 1 L",
 		"Headphones 1 R",
 		"Headphones 2 L",
 		"Headphones 2 R",
-		"Alt Monitor L",
-		"Alt Monitor R",
 	},
 
 	.port_count = {
@@ -1711,13 +1720,22 @@ static int scarlett2_master_volume_ctl_get(struct snd_kcontrol *kctl,
 	return 0;
 }
 
+static int line_out_remap(struct scarlett2_data *private, int index)
+{
+	const struct scarlett2_device_info *info = private->info;
+
+	if (!info->line_out_remap_enable)
+		return index;
+	return info->line_out_remap[index];
+}
+
 static int scarlett2_volume_ctl_get(struct snd_kcontrol *kctl,
 				    struct snd_ctl_elem_value *ucontrol)
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	int index = elem->control;
+	int index = line_out_remap(private, elem->control);
 
 	mutex_lock(&private->data_mutex);
 	if (private->vol_updated)
@@ -1734,7 +1752,7 @@ static int scarlett2_volume_ctl_put(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	int index = elem->control;
+	int index = line_out_remap(private, elem->control);
 	int oval, val, err = 0;
 
 	mutex_lock(&private->data_mutex);
@@ -1790,7 +1808,7 @@ static int scarlett2_mute_ctl_get(struct snd_kcontrol *kctl,
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct scarlett2_data *private = elem->head.mixer->private_data;
-	int index = elem->control;
+	int index = line_out_remap(private, elem->control);
 
 	ucontrol->value.integer.value[0] = private->mute_switch[index];
 	return 0;
@@ -1802,7 +1820,7 @@ static int scarlett2_mute_ctl_put(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	int index = elem->control;
+	int index = line_out_remap(private, elem->control);
 	int oval, val, err = 0;
 
 	mutex_lock(&private->data_mutex);
@@ -1849,9 +1867,9 @@ static int scarlett2_sw_hw_enum_ctl_get(struct snd_kcontrol *kctl,
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct scarlett2_data *private = elem->head.mixer->private_data;
+	int index = line_out_remap(private, elem->control);
 
-	ucontrol->value.enumerated.item[0] =
-		private->vol_sw_hw_switch[elem->control];
+	ucontrol->value.enumerated.item[0] = private->vol_sw_hw_switch[index];
 	return 0;
 }
 
@@ -1887,8 +1905,8 @@ static int scarlett2_sw_hw_enum_ctl_put(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-
-	int index = elem->control;
+	int ctl_index = elem->control;
+	int index = line_out_remap(private, ctl_index);
 	int oval, val, err = 0;
 
 	mutex_lock(&private->data_mutex);
@@ -1904,7 +1922,7 @@ static int scarlett2_sw_hw_enum_ctl_put(struct snd_kcontrol *kctl,
 	/* Change access mode to RO (hardware controlled volume)
 	 * or RW (software controlled volume)
 	 */
-	scarlett2_vol_ctl_set_writable(mixer, index, !val);
+	scarlett2_vol_ctl_set_writable(mixer, ctl_index, !val);
 
 	/* Reset volume/mute to master volume/mute */
 	private->vol[index] = private->master_vol;
@@ -2436,13 +2454,16 @@ static int scarlett2_dim_mute_ctl_put(struct snd_kcontrol *kctl,
 		err = 1;
 
 	if (index == SCARLETT2_BUTTON_MUTE)
-		for (i = 0; i < num_line_out; i++)
-			if (private->vol_sw_hw_switch[i]) {
-				private->mute_switch[i] = val;
+		for (i = 0; i < num_line_out; i++) {
+			int line_index = line_out_remap(private, i);
+
+			if (private->vol_sw_hw_switch[line_index]) {
+				private->mute_switch[line_index] = val;
 				snd_ctl_notify(mixer->chip->card,
 					       SNDRV_CTL_EVENT_MASK_INFO,
 					       &private->mute_ctls[i]->id);
 			}
+		}
 
 unlock:
 	mutex_unlock(&private->data_mutex);
@@ -2481,6 +2502,7 @@ static int scarlett2_add_line_out_ctls(struct usb_mixer_interface *mixer)
 
 	/* Add volume controls */
 	for (i = 0; i < num_line_out; i++) {
+		int index = line_out_remap(private, i);
 
 		/* Fader */
 		if (info->line_out_descrs[i])
@@ -2511,7 +2533,7 @@ static int scarlett2_add_line_out_ctls(struct usb_mixer_interface *mixer)
 		/* Make the fader and mute controls read-only if the
 		 * SW/HW switch is set to HW
 		 */
-		if (private->vol_sw_hw_switch[i])
+		if (private->vol_sw_hw_switch[index])
 			scarlett2_vol_ctl_set_writable(mixer, i, 0);
 
 		/* SW/HW Switch */
@@ -2760,8 +2782,16 @@ static int scarlett2_mux_src_enum_ctl_get(struct snd_kcontrol *kctl,
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct scarlett2_data *private = elem->head.mixer->private_data;
+	const struct scarlett2_device_info *info = private->info;
+	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
+	int line_out_count =
+		port_count[SCARLETT2_PORT_TYPE_ANALOGUE][SCARLETT2_PORT_OUT];
+	int index = elem->control;
+
+	if (index < line_out_count)
+		index = line_out_remap(private, index);
 
-	ucontrol->value.enumerated.item[0] = private->mux[elem->control];
+	ucontrol->value.enumerated.item[0] = private->mux[index];
 	return 0;
 }
 
@@ -2771,9 +2801,16 @@ static int scarlett2_mux_src_enum_ctl_put(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_device_info *info = private->info;
+	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
+	int line_out_count =
+		port_count[SCARLETT2_PORT_TYPE_ANALOGUE][SCARLETT2_PORT_OUT];
 	int index = elem->control;
 	int oval, val, err = 0;
 
+	if (index < line_out_count)
+		index = line_out_remap(private, index);
+
 	mutex_lock(&private->data_mutex);
 
 	oval = private->mux[index];
@@ -3174,6 +3211,7 @@ static void scarlett2_notify_sync(
 static void scarlett2_notify_monitor(
 	struct usb_mixer_interface *mixer)
 {
+	struct snd_card *card = mixer->chip->card;
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
 	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
@@ -3190,12 +3228,10 @@ static void scarlett2_notify_monitor(
 	snd_ctl_notify(mixer->chip->card, SNDRV_CTL_EVENT_MASK_VALUE,
 		       &private->master_vol_ctl->id);
 
-	for (i = 0; i < num_line_out; i++) {
-		if (!private->vol_sw_hw_switch[i])
-			continue;
-		snd_ctl_notify(mixer->chip->card, SNDRV_CTL_EVENT_MASK_VALUE,
-			       &private->vol_ctls[i]->id);
-	}
+	for (i = 0; i < num_line_out; i++)
+		if (private->vol_sw_hw_switch[line_out_remap(private, i)])
+			snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
+				       &private->vol_ctls[i]->id);
 }
 
 /* Notify on dim/mute change */
@@ -3220,7 +3256,7 @@ static void scarlett2_notify_dim_mute(
 			       &private->dim_mute_ctls[i]->id);
 
 	for (i = 0; i < num_line_out; i++)
-		if (private->vol_sw_hw_switch[i])
+		if (private->vol_sw_hw_switch[line_out_remap(private, i)])
 			snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
 				       &private->mute_ctls[i]->id);
 }
-- 
2.31.1

