Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5E33AF48D
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 20:12:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 963921692;
	Mon, 21 Jun 2021 20:11:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 963921692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624299155;
	bh=P97SMPViDKVEN44nSuPOSgzrarM9rZ+TQ/Wt8IWnaqs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QKz7++ouSCueqaErEre8jj2ji0fKPIncjwpIQW5t8KBIGma0pu8wIPKJuzyCZ94D5
	 LbnPCYjpG3e92NUvxXY5g3X2X9QNvxmsfGOPuZO06va+RKKEGzpEdo9WDwqCUkSDPC
	 Bh7sbPT6qojKnaLwfxzrhQwUUZz9h6XXTEjC23Ls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6000F804FA;
	Mon, 21 Jun 2021 20:09:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC7DFF804F2; Mon, 21 Jun 2021 20:09:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93132F804DA
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 20:09:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93132F804DA
Received: by m.b4.vu (Postfix, from userid 1000)
 id 1E5B961E287F; Tue, 22 Jun 2021 03:39:24 +0930 (ACST)
Date: Tue, 22 Jun 2021 03:39:24 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 05/31] ALSA: usb-audio: scarlett2: Add "Sync Status" control
Message-ID: <d6967d7a34b2ea7e0672ba819e4ed8b99e8dcd35.1624294591.git.g@b4.vu>
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

Add "Sync Status" control to display the sync locked/unlocked status.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 101 +++++++++++++++++++++++++++++++-
 1 file changed, 100 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 620f1e814f0d..4c2ae81f94a8 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -237,13 +237,16 @@ struct scarlett2_data {
 	int num_mux_srcs;
 	int num_mux_dsts;
 	u16 scarlett2_seq;
+	u8 sync_updated;
 	u8 vol_updated;
+	u8 sync;
 	u8 master_vol;
 	u8 vol[SCARLETT2_ANALOGUE_MAX];
 	u8 vol_sw_hw_switch[SCARLETT2_ANALOGUE_MAX];
 	u8 level_switch[SCARLETT2_LEVEL_SWITCH_MAX];
 	u8 pad_switch[SCARLETT2_PAD_SWITCH_MAX];
 	u8 dim_mute[SCARLETT2_DIM_MUTE_COUNT];
+	struct snd_kcontrol *sync_ctl;
 	struct snd_kcontrol *master_vol_ctl;
 	struct snd_kcontrol *vol_ctls[SCARLETT2_ANALOGUE_MAX];
 	struct snd_kcontrol *dim_mute_ctls[SCARLETT2_DIM_MUTE_COUNT];
@@ -448,7 +451,8 @@ static int scarlett2_get_port_start_num(const struct scarlett2_ports *ports,
 
 /*** USB Interactions ***/
 
-/* Interrupt flags for dim/mute button and monitor changes */
+/* Notifications from the interface */
+#define SCARLETT2_USB_NOTIFY_SYNC     0x00000008
 #define SCARLETT2_USB_NOTIFY_DIM_MUTE 0x00200000
 #define SCARLETT2_USB_NOTIFY_MONITOR  0x00400000
 
@@ -464,6 +468,7 @@ static int scarlett2_get_port_start_num(const struct scarlett2_ports *ports,
 #define SCARLETT2_USB_SET_MIX   0x00002002
 #define SCARLETT2_USB_GET_MUX   0x00003001
 #define SCARLETT2_USB_SET_MUX   0x00003002
+#define SCARLETT2_USB_GET_SYNC  0x00006004
 #define SCARLETT2_USB_GET_DATA  0x00800000
 #define SCARLETT2_USB_SET_DATA  0x00800001
 #define SCARLETT2_USB_DATA_CMD  0x00800002
@@ -784,6 +789,23 @@ static int scarlett2_usb_get_config(
 	return scarlett2_usb_get(mixer, config_item->offset, buf, size);
 }
 
+/* Send a USB message to get sync status; result placed in *sync */
+static int scarlett2_usb_get_sync_status(
+	struct usb_mixer_interface *mixer,
+	u8 *sync)
+{
+	__le32 data;
+	int err;
+
+	err = scarlett2_usb(mixer, SCARLETT2_USB_GET_SYNC,
+			    NULL, 0, &data, sizeof(data));
+	if (err < 0)
+		return err;
+
+	*sync = !!data;
+	return 0;
+}
+
 /* Send a USB message to get volume status; result placed in *buf */
 static int scarlett2_usb_get_volume_status(
 	struct usb_mixer_interface *mixer,
@@ -1109,6 +1131,60 @@ static int scarlett2_add_new_ctl(struct usb_mixer_interface *mixer,
 	return 0;
 }
 
+/*** Sync Control ***/
+
+/* Update sync control after receiving notification that the status
+ * has changed
+ */
+static int scarlett2_update_sync(struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+
+	private->sync_updated = 0;
+	return scarlett2_usb_get_sync_status(mixer, &private->sync);
+}
+
+static int scarlett2_sync_ctl_info(struct snd_kcontrol *kctl,
+				   struct snd_ctl_elem_info *uinfo)
+{
+	static const char *texts[2] = {
+		"Unlocked", "Locked"
+	};
+	return snd_ctl_enum_info(uinfo, 1, 2, texts);
+}
+
+static int scarlett2_sync_ctl_get(struct snd_kcontrol *kctl,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
+
+	mutex_lock(&private->data_mutex);
+	if (private->sync_updated)
+		scarlett2_update_sync(mixer);
+	ucontrol->value.enumerated.item[0] = private->sync;
+	mutex_unlock(&private->data_mutex);
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new scarlett2_sync_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.access = SNDRV_CTL_ELEM_ACCESS_READ,
+	.name = "",
+	.info = scarlett2_sync_ctl_info,
+	.get  = scarlett2_sync_ctl_get
+};
+
+static int scarlett2_add_sync_ctl(struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+
+	return scarlett2_add_new_ctl(mixer, &scarlett2_sync_ctl,
+				     0, 1, "Sync Status", &private->sync_ctl);
+}
+
 /*** Analogue Line Out Volume Controls ***/
 
 /* Update hardware volume controls after receiving notification that
@@ -2018,6 +2094,10 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 			return err;
 	}
 
+	err = scarlett2_update_sync(mixer);
+	if (err < 0)
+		return err;
+
 	err = scarlett2_usb_get_volume_status(mixer, &volume_status);
 	if (err < 0)
 		return err;
@@ -2054,6 +2134,18 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 	return scarlett2_usb_get_mux(mixer);
 }
 
+/* Notify on sync change */
+static void scarlett2_notify_sync(
+	struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+
+	private->sync_updated = 1;
+
+	snd_ctl_notify(mixer->chip->card, SNDRV_CTL_EVENT_MASK_VALUE,
+		       &private->sync_ctl->id);
+}
+
 /* Notify on monitor change */
 static void scarlett2_notify_monitor(
 	struct usb_mixer_interface *mixer)
@@ -2112,6 +2204,8 @@ static void scarlett2_notify(struct urb *urb)
 		goto requeue;
 
 	data = le32_to_cpu(*(__le32 *)urb->transfer_buffer);
+	if (data & SCARLETT2_USB_NOTIFY_SYNC)
+		scarlett2_notify_sync(mixer);
 	if (data & SCARLETT2_USB_NOTIFY_MONITOR)
 		scarlett2_notify_monitor(mixer);
 	if (data & SCARLETT2_USB_NOTIFY_DIM_MUTE)
@@ -2202,6 +2296,11 @@ static int snd_scarlett_gen2_controls_create(struct usb_mixer_interface *mixer,
 	if (err < 0)
 		return err;
 
+	/* Create the sync control */
+	err = scarlett2_add_sync_ctl(mixer);
+	if (err < 0)
+		return err;
+
 	/* Set up the interrupt polling */
 	err = scarlett2_init_notify(mixer);
 	if (err < 0)
-- 
2.31.1

