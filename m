Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE783ADF77
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Jun 2021 18:49:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E71616B4;
	Sun, 20 Jun 2021 18:48:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E71616B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624207789;
	bh=+hRmgP2GZB/HvQmOCXmX66vmU3hPah1+HCo8SBg5gA0=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HOvBfjrHIbcUhYPB2E0bS7glBJjTWX4IA4IUxF0QgUHDtiCIgruJ7oWntnliUy359
	 7foJrkhWZEx87kOvai2r8/JAl55o5w6Q5z5rnFgvx5+9Y0u4lW1+KdK2GX8eoUaMwY
	 EsO9hEkSP0CIe5ebh+d2Nt1wjCL9RahhawMi1vMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15B2DF804F2;
	Sun, 20 Jun 2021 18:46:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73716F804D8; Sun, 20 Jun 2021 18:46:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DC7EF8026A
 for <alsa-devel@alsa-project.org>; Sun, 20 Jun 2021 18:46:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DC7EF8026A
Received: by m.b4.vu (Postfix, from userid 1000)
 id B0DF661E287D; Mon, 21 Jun 2021 02:16:36 +0930 (ACST)
Date: Mon, 21 Jun 2021 02:16:36 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 07/14] ALSA: usb-audio: scarlett2: Rename
 buttons/interrupts/vol
Message-ID: <20210620164636.GA9199@m.b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

To match the vendor's terminology, change #defines, identifiers, and
comments:
- mute/dim/hardware buttons are now called dim/mute
- mixer status/interrupt is now notify
- vol is now monitor

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 94 ++++++++++++++++-----------------
 1 file changed, 47 insertions(+), 47 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 043b0929ad9d..4e2ee979b9bd 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -194,10 +194,10 @@ enum {
 	SCARLETT2_PORT_DIRNS   = 5,
 };
 
-/* Hardware buttons on the 18i20 */
-#define SCARLETT2_BUTTON_MAX 2
+/* Dim/Mute buttons on the 18i20 */
+#define SCARLETT2_DIM_MUTE_COUNT 2
 
-static const char *const scarlett2_button_names[SCARLETT2_BUTTON_MAX] = {
+static const char *const scarlett2_dim_mute_names[SCARLETT2_DIM_MUTE_COUNT] = {
 	"Mute", "Dim"
 };
 
@@ -239,10 +239,10 @@ struct scarlett2_mixer_data {
 	u8 vol_sw_hw_switch[SCARLETT2_ANALOGUE_MAX];
 	u8 level_switch[SCARLETT2_LEVEL_SWITCH_MAX];
 	u8 pad_switch[SCARLETT2_PAD_SWITCH_MAX];
-	u8 buttons[SCARLETT2_BUTTON_MAX];
+	u8 dim_mute[SCARLETT2_DIM_MUTE_COUNT];
 	struct snd_kcontrol *master_vol_ctl;
 	struct snd_kcontrol *vol_ctls[SCARLETT2_ANALOGUE_MAX];
-	struct snd_kcontrol *button_ctls[SCARLETT2_BUTTON_MAX];
+	struct snd_kcontrol *dim_mute_ctls[SCARLETT2_DIM_MUTE_COUNT];
 	u8 mux[SCARLETT2_MUX_MAX];
 	u8 mix[SCARLETT2_INPUT_MIX_MAX * SCARLETT2_OUTPUT_MIX_MAX];
 };
@@ -450,9 +450,9 @@ static int scarlett2_get_port_start_num(const struct scarlett2_ports *ports,
 #define SCARLETT2_USB_INTERRUPT_MAX_DATA 64
 #define SCARLETT2_USB_INTERRUPT_INTERVAL 3
 
-/* Interrupt flags for volume and mute/dim button changes */
-#define SCARLETT2_USB_INTERRUPT_VOL_CHANGE    0x00400000
-#define SCARLETT2_USB_INTERRUPT_BUTTON_CHANGE 0x00200000
+/* Interrupt flags for dim/mute button and monitor changes */
+#define SCARLETT2_USB_NOTIFY_DIM_MUTE 0x00200000
+#define SCARLETT2_USB_NOTIFY_MONITOR  0x00400000
 
 /* Commands for sending/receiving requests/responses */
 #define SCARLETT2_USB_VENDOR_SPECIFIC_CMD_REQ  2
@@ -475,8 +475,8 @@ static int scarlett2_get_port_start_num(const struct scarlett2_ports *ports,
 
 /* volume status is read together (matches scarlett2_config_items[]) */
 struct scarlett2_usb_volume_status {
-	/* mute & dim buttons */
-	u8 buttons[SCARLETT2_BUTTON_MAX];
+	/* dim/mute buttons */
+	u8 dim_mute[SCARLETT2_DIM_MUTE_COUNT];
 
 	u8 pad1;
 
@@ -499,7 +499,7 @@ struct scarlett2_usb_volume_status {
 
 /* Configuration parameters that can be read and written */
 enum {
-	SCARLETT2_CONFIG_BUTTONS = 0,
+	SCARLETT2_CONFIG_DIM_MUTE = 0,
 	SCARLETT2_CONFIG_LINE_OUT_VOLUME = 1,
 	SCARLETT2_CONFIG_SW_HW_SWITCH = 2,
 	SCARLETT2_CONFIG_LEVEL_SWITCH = 3,
@@ -518,7 +518,7 @@ struct scarlett2_config {
 
 static const struct scarlett2_config
 		scarlett2_config_items[SCARLETT2_CONFIG_COUNT] = {
-	/* Mute/Dim Buttons */
+	/* Dim/Mute Buttons */
 	{
 		.offset = 0x31,
 		.size = 1,
@@ -1127,8 +1127,8 @@ static int scarlett2_update_volumes(struct usb_mixer_interface *mixer)
 	}
 
 	if (info->line_out_hw_vol)
-		for (i = 0; i < SCARLETT2_BUTTON_MAX; i++)
-			private->buttons[i] = !!volume_status.buttons[i];
+		for (i = 0; i < SCARLETT2_DIM_MUTE_COUNT; i++)
+			private->dim_mute[i] = !!volume_status.dim_mute[i];
 
 	return 0;
 }
@@ -1430,10 +1430,10 @@ static const struct snd_kcontrol_new scarlett2_pad_ctl = {
 	.put  = scarlett2_pad_ctl_put,
 };
 
-/*** Mute/Dim Controls ***/
+/*** Dim/Mute Controls ***/
 
-static int scarlett2_button_ctl_get(struct snd_kcontrol *kctl,
-				    struct snd_ctl_elem_value *ucontrol)
+static int scarlett2_dim_mute_ctl_get(struct snd_kcontrol *kctl,
+				      struct snd_ctl_elem_value *ucontrol)
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
@@ -1445,12 +1445,12 @@ static int scarlett2_button_ctl_get(struct snd_kcontrol *kctl,
 		mutex_unlock(&private->data_mutex);
 	}
 
-	ucontrol->value.enumerated.item[0] = private->buttons[elem->control];
+	ucontrol->value.enumerated.item[0] = private->dim_mute[elem->control];
 	return 0;
 }
 
-static int scarlett2_button_ctl_put(struct snd_kcontrol *kctl,
-				    struct snd_ctl_elem_value *ucontrol)
+static int scarlett2_dim_mute_ctl_put(struct snd_kcontrol *kctl,
+				      struct snd_ctl_elem_value *ucontrol)
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
@@ -1461,16 +1461,16 @@ static int scarlett2_button_ctl_put(struct snd_kcontrol *kctl,
 
 	mutex_lock(&private->data_mutex);
 
-	oval = private->buttons[index];
+	oval = private->dim_mute[index];
 	val = !!ucontrol->value.integer.value[0];
 
 	if (oval == val)
 		goto unlock;
 
-	private->buttons[index] = val;
+	private->dim_mute[index] = val;
 
 	/* Send switch change to the device */
-	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_BUTTONS,
+	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_DIM_MUTE,
 				       index, val);
 
 unlock:
@@ -1478,12 +1478,12 @@ static int scarlett2_button_ctl_put(struct snd_kcontrol *kctl,
 	return err;
 }
 
-static const struct snd_kcontrol_new scarlett2_button_ctl = {
+static const struct snd_kcontrol_new scarlett2_dim_mute_ctl = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "",
 	.info = snd_ctl_boolean_mono_info,
-	.get  = scarlett2_button_ctl_get,
-	.put  = scarlett2_button_ctl_put
+	.get  = scarlett2_dim_mute_ctl_get,
+	.put  = scarlett2_dim_mute_ctl_put
 };
 
 /*** Create the analogue output controls ***/
@@ -1544,13 +1544,13 @@ static int scarlett2_add_line_out_ctls(struct usb_mixer_interface *mixer)
 		}
 	}
 
-	/* Add HW button controls */
+	/* Add dim/mute controls */
 	if (info->line_out_hw_vol)
-		for (i = 0; i < SCARLETT2_BUTTON_MAX; i++) {
+		for (i = 0; i < SCARLETT2_DIM_MUTE_COUNT; i++) {
 			err = scarlett2_add_new_ctl(
-				mixer, &scarlett2_button_ctl,
-				i, 1, scarlett2_button_names[i],
-				&private->button_ctls[i]);
+				mixer, &scarlett2_dim_mute_ctl,
+				i, 1, scarlett2_dim_mute_names[i],
+				&private->dim_mute_ctls[i]);
 			if (err < 0)
 				return err;
 		}
@@ -1962,8 +1962,8 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 	}
 
 	if (info->line_out_hw_vol)
-		for (i = 0; i < SCARLETT2_BUTTON_MAX; i++)
-			private->buttons[i] = !!volume_status.buttons[i];
+		for (i = 0; i < SCARLETT2_DIM_MUTE_COUNT; i++)
+			private->dim_mute[i] = !!volume_status.dim_mute[i];
 
 	for (i = 0; i < num_mixer_out; i++) {
 		err = scarlett2_usb_get_mix(mixer, i);
@@ -1974,8 +1974,8 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 	return scarlett2_usb_get_mux(mixer);
 }
 
-/* Notify on volume change */
-static void scarlett2_mixer_interrupt_vol_change(
+/* Notify on monitor change */
+static void scarlett2_notify_monitor(
 	struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_mixer_data *private = mixer->private_data;
@@ -1997,8 +1997,8 @@ static void scarlett2_mixer_interrupt_vol_change(
 	}
 }
 
-/* Notify on button change */
-static void scarlett2_mixer_interrupt_button_change(
+/* Notify on dim/mute change */
+static void scarlett2_notify_dim_mute(
 	struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_mixer_data *private = mixer->private_data;
@@ -2010,13 +2010,13 @@ static void scarlett2_mixer_interrupt_button_change(
 	if (!info->line_out_hw_vol)
 		return;
 
-	for (i = 0; i < SCARLETT2_BUTTON_MAX; i++)
+	for (i = 0; i < SCARLETT2_DIM_MUTE_COUNT; i++)
 		snd_ctl_notify(mixer->chip->card, SNDRV_CTL_EVENT_MASK_VALUE,
-			       &private->button_ctls[i]->id);
+			       &private->dim_mute_ctls[i]->id);
 }
 
 /* Interrupt callback */
-static void scarlett2_mixer_interrupt(struct urb *urb)
+static void scarlett2_notify(struct urb *urb)
 {
 	struct usb_mixer_interface *mixer = urb->context;
 	int len = urb->actual_length;
@@ -2027,10 +2027,10 @@ static void scarlett2_mixer_interrupt(struct urb *urb)
 		goto requeue;
 
 	data = le32_to_cpu(*(__le32 *)urb->transfer_buffer);
-	if (data & SCARLETT2_USB_INTERRUPT_VOL_CHANGE)
-		scarlett2_mixer_interrupt_vol_change(mixer);
-	if (data & SCARLETT2_USB_INTERRUPT_BUTTON_CHANGE)
-		scarlett2_mixer_interrupt_button_change(mixer);
+	if (data & SCARLETT2_USB_NOTIFY_MONITOR)
+		scarlett2_notify_monitor(mixer);
+	if (data & SCARLETT2_USB_NOTIFY_DIM_MUTE)
+		scarlett2_notify_dim_mute(mixer);
 
 requeue:
 	if (ustatus != -ENOENT &&
@@ -2041,7 +2041,7 @@ static void scarlett2_mixer_interrupt(struct urb *urb)
 	}
 }
 
-static int scarlett2_mixer_status_create(struct usb_mixer_interface *mixer)
+static int scarlett2_init_notify(struct usb_mixer_interface *mixer)
 {
 	struct usb_device *dev = mixer->chip->dev;
 	unsigned int pipe = usb_rcvintpipe(dev,
@@ -2067,7 +2067,7 @@ static int scarlett2_mixer_status_create(struct usb_mixer_interface *mixer)
 
 	usb_fill_int_urb(mixer->urb, dev, pipe,
 			 transfer_buffer, SCARLETT2_USB_INTERRUPT_MAX_DATA,
-			 scarlett2_mixer_interrupt, mixer,
+			 scarlett2_notify, mixer,
 			 SCARLETT2_USB_INTERRUPT_INTERVAL);
 
 	return usb_submit_urb(mixer->urb, GFP_KERNEL);
@@ -2115,7 +2115,7 @@ static int snd_scarlett_gen2_controls_create(struct usb_mixer_interface *mixer,
 
 	/* Set up the interrupt polling if there are hardware buttons */
 	if (info->line_out_hw_vol) {
-		err = scarlett2_mixer_status_create(mixer);
+		err = scarlett2_init_notify(mixer);
 		if (err < 0)
 			return err;
 	}
-- 
2.31.1

