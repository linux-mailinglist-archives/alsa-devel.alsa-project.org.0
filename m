Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECC83B0B08
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Jun 2021 19:03:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7705850;
	Tue, 22 Jun 2021 19:02:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7705850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624381403;
	bh=1Uv26hc26a9gxk5XFtA4TNlmxyNQkNJU7xhOJHrSV8k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kYFHbfwF8Ucr8t36EZmtAKsCMZ7CzYIlGX5+8liyL5GVaZp6KD12Y8s3DASVnZtrq
	 cdKKrnBdV2SwNI5GS2pt4NiYFJ0y6flC7NrHSrRKOZ3xOhHfN2XRjQ1dMONtgk0Qtg
	 oV6oYN8HIB35InKPLu0d0eQjGjMXxKZrcWCLF2zE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4D35F804D9;
	Tue, 22 Jun 2021 19:01:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B1DEF804D6; Tue, 22 Jun 2021 19:01:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DE7EF804C3
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 19:01:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DE7EF804C3
Received: by m.b4.vu (Postfix, from userid 1000)
 id F1B4E61E286F; Wed, 23 Jun 2021 02:31:44 +0930 (ACST)
Date: Wed, 23 Jun 2021 02:31:44 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 03/17] ALSA: usb-audio: scarlett2: Add support for
 "input-other" notify
Message-ID: <06289a7697455e96b7dbdfd2d384d4b20f8df6e0.1624379707.git.g@b4.vu>
References: <cover.1624379707.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1624379707.git.g@b4.vu>
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

Some models allow the level and pad settings to be controlled from the
front-panel of the device. For these, the device will send an
"input-other" notification to prompt the driver to re-read the status
of those settings.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 99 ++++++++++++++++++++++++---------
 1 file changed, 73 insertions(+), 26 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index d742c939eed0..06454d4e58bf 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -318,6 +318,7 @@ struct scarlett2_data {
 	u16 scarlett2_seq;
 	u8 sync_updated;
 	u8 vol_updated;
+	u8 input_other_updated;
 	u8 sync;
 	u8 master_vol;
 	u8 vol[SCARLETT2_ANALOGUE_MAX];
@@ -331,6 +332,8 @@ struct scarlett2_data {
 	struct snd_kcontrol *vol_ctls[SCARLETT2_ANALOGUE_MAX];
 	struct snd_kcontrol *mute_ctls[SCARLETT2_ANALOGUE_MAX];
 	struct snd_kcontrol *dim_mute_ctls[SCARLETT2_DIM_MUTE_COUNT];
+	struct snd_kcontrol *level_ctls[SCARLETT2_LEVEL_SWITCH_MAX];
+	struct snd_kcontrol *pad_ctls[SCARLETT2_PAD_SWITCH_MAX];
 	u8 mux[SCARLETT2_MUX_MAX];
 	u8 mix[SCARLETT2_INPUT_MIX_MAX * SCARLETT2_OUTPUT_MIX_MAX];
 };
@@ -723,9 +726,10 @@ static int scarlett2_get_port_start_num(
 /*** USB Interactions ***/
 
 /* Notifications from the interface */
-#define SCARLETT2_USB_NOTIFY_SYNC     0x00000008
-#define SCARLETT2_USB_NOTIFY_DIM_MUTE 0x00200000
-#define SCARLETT2_USB_NOTIFY_MONITOR  0x00400000
+#define SCARLETT2_USB_NOTIFY_SYNC        0x00000008
+#define SCARLETT2_USB_NOTIFY_DIM_MUTE    0x00200000
+#define SCARLETT2_USB_NOTIFY_MONITOR     0x00400000
+#define SCARLETT2_USB_NOTIFY_INPUT_OTHER 0x00800000
 
 /* Commands for sending/receiving requests/responses */
 #define SCARLETT2_USB_CMD_INIT 0
@@ -1745,6 +1749,32 @@ static const struct snd_kcontrol_new scarlett2_sw_hw_enum_ctl = {
 
 /*** Line Level/Instrument Level Switch Controls ***/
 
+static int scarlett2_update_input_other(struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_device_info *info = private->info;
+
+	private->input_other_updated = 0;
+
+	if (info->level_input_count) {
+		int err = scarlett2_usb_get_config(
+			mixer, SCARLETT2_CONFIG_LEVEL_SWITCH,
+			info->level_input_count, private->level_switch);
+		if (err < 0)
+			return err;
+	}
+
+	if (info->pad_input_count) {
+		int err = scarlett2_usb_get_config(
+			mixer, SCARLETT2_CONFIG_PAD_SWITCH,
+			info->pad_input_count, private->pad_switch);
+		if (err < 0)
+			return err;
+	}
+
+	return 0;
+}
+
 static int scarlett2_level_enum_ctl_info(struct snd_kcontrol *kctl,
 					 struct snd_ctl_elem_info *uinfo)
 {
@@ -1759,10 +1789,16 @@ static int scarlett2_level_enum_ctl_get(struct snd_kcontrol *kctl,
 					struct snd_ctl_elem_value *ucontrol)
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
-	struct scarlett2_data *private = elem->head.mixer->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
 
+	mutex_lock(&private->data_mutex);
+	if (private->input_other_updated)
+		scarlett2_update_input_other(mixer);
 	ucontrol->value.enumerated.item[0] =
 		private->level_switch[elem->control];
+	mutex_unlock(&private->data_mutex);
+
 	return 0;
 }
 
@@ -1811,10 +1847,16 @@ static int scarlett2_pad_ctl_get(struct snd_kcontrol *kctl,
 				 struct snd_ctl_elem_value *ucontrol)
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
-	struct scarlett2_data *private = elem->head.mixer->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
 
+	mutex_lock(&private->data_mutex);
+	if (private->input_other_updated)
+		scarlett2_update_input_other(mixer);
 	ucontrol->value.integer.value[0] =
 		private->pad_switch[elem->control];
+	mutex_unlock(&private->data_mutex);
+
 	return 0;
 }
 
@@ -2025,7 +2067,7 @@ static int scarlett2_add_line_in_ctls(struct usb_mixer_interface *mixer)
 	for (i = 0; i < info->level_input_count; i++) {
 		snprintf(s, sizeof(s), fmt, i + 1, "Level", "Enum");
 		err = scarlett2_add_new_ctl(mixer, &scarlett2_level_enum_ctl,
-					    i, 1, s, NULL);
+					    i, 1, s, &private->level_ctls[i]);
 		if (err < 0)
 			return err;
 	}
@@ -2034,7 +2076,7 @@ static int scarlett2_add_line_in_ctls(struct usb_mixer_interface *mixer)
 	for (i = 0; i < info->pad_input_count; i++) {
 		snprintf(s, sizeof(s), fmt, i + 1, "Pad", "Switch");
 		err = scarlett2_add_new_ctl(mixer, &scarlett2_pad_ctl,
-					    i, 1, s, NULL);
+					    i, 1, s, &private->pad_ctls[i]);
 		if (err < 0)
 			return err;
 	}
@@ -2446,25 +2488,9 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 	struct scarlett2_usb_volume_status volume_status;
 	int err, i;
 
-	if (info->level_input_count) {
-		err = scarlett2_usb_get_config(
-			mixer,
-			SCARLETT2_CONFIG_LEVEL_SWITCH,
-			info->level_input_count,
-			private->level_switch);
-		if (err < 0)
-			return err;
-	}
-
-	if (info->pad_input_count) {
-		err = scarlett2_usb_get_config(
-			mixer,
-			SCARLETT2_CONFIG_PAD_SWITCH,
-			info->pad_input_count,
-			private->pad_switch);
-		if (err < 0)
-			return err;
-	}
+	err = scarlett2_update_input_other(mixer);
+	if (err < 0)
+		return err;
 
 	err = scarlett2_update_sync(mixer);
 	if (err < 0)
@@ -2578,6 +2604,25 @@ static void scarlett2_notify_dim_mute(
 				       &private->mute_ctls[i]->id);
 }
 
+/* Notify on "input other" change (level/pad) */
+static void scarlett2_notify_input_other(
+	struct usb_mixer_interface *mixer)
+{
+	struct snd_card *card = mixer->chip->card;
+	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_device_info *info = private->info;
+	int i;
+
+	private->input_other_updated = 1;
+
+	for (i = 0; i < info->level_input_count; i++)
+		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
+			       &private->level_ctls[i]->id);
+	for (i = 0; i < info->pad_input_count; i++)
+		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
+			       &private->pad_ctls[i]->id);
+}
+
 /* Interrupt callback */
 static void scarlett2_notify(struct urb *urb)
 {
@@ -2596,6 +2641,8 @@ static void scarlett2_notify(struct urb *urb)
 		scarlett2_notify_monitor(mixer);
 	if (data & SCARLETT2_USB_NOTIFY_DIM_MUTE)
 		scarlett2_notify_dim_mute(mixer);
+	if (data & SCARLETT2_USB_NOTIFY_INPUT_OTHER)
+		scarlett2_notify_input_other(mixer);
 
 requeue:
 	if (ustatus != -ENOENT &&
-- 
2.31.1

