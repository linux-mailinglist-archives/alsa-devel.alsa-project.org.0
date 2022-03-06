Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C5D4CEC13
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Mar 2022 16:22:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DBEB1751;
	Sun,  6 Mar 2022 16:21:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DBEB1751
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646580165;
	bh=vmGZKzw0atA0+6HapqWmuDv8Ygh5P5o2ED2cGN9XEi4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ukEml9KbrX4cQaxOdJabv3YMyNUO/+atA/utQXOrtM+tJv80tUB5xqao+b1CfJKxM
	 hZlWnYWuVtu99kO1z2130ZshsAL7nq57AktiiSVuxp1i65QP/HN/twaetzvbLXHpQz
	 X39SsToZpY6FMXveMIgKNuBk86tdw2F34jh8n3W8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9C08F8014C;
	Sun,  6 Mar 2022 16:21:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9E95F8019D; Sun,  6 Mar 2022 16:21:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 167BAF801F5
 for <alsa-devel@alsa-project.org>; Sun,  6 Mar 2022 16:21:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 167BAF801F5
Received: by m.b4.vu (Postfix, from userid 1000)
 id 8F5EC61391F6; Mon,  7 Mar 2022 01:51:39 +1030 (ACDT)
Date: Mon, 7 Mar 2022 01:51:39 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 2/2] ALSA: scarlett2: Add support for the internal
 "standalone" switch
Message-ID: <cd88871c5e77abd5c23a4758a1f2ec9fd427fd69.1646578164.git.g@b4.vu>
References: <cover.1646578164.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1646578164.git.g@b4.vu>
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

The Focusrite Scarlett Gen 2/3 interfaces with internal mixers have a
"standalone" mode. When the interface is not connected to a USB host
and standalone mode is enabled, the interface will pass audio as
previously configured. This patch adds an ALSA control to allow
enabling/disabling that mode.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 97 ++++++++++++++++++++++++++++++---
 1 file changed, 90 insertions(+), 7 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 22e442208550..710586c8dedc 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -60,6 +60,7 @@
  *  - phantom power, direct monitor, speaker switching, and talkback
  *    controls
  *  - disable/enable MSD mode
+ *  - disable/enable standalone mode
  *
  * <ditaa>
  *    /--------------\    18chn            20chn     /--------------\
@@ -411,6 +412,7 @@ struct scarlett2_data {
 	u8 talkback_switch;
 	u8 talkback_map[SCARLETT2_OUTPUT_MIX_MAX];
 	u8 msd_switch;
+	u8 standalone_switch;
 	struct snd_kcontrol *sync_ctl;
 	struct snd_kcontrol *master_vol_ctl;
 	struct snd_kcontrol *vol_ctls[SCARLETT2_ANALOGUE_MAX];
@@ -936,13 +938,14 @@ enum {
 	SCARLETT2_CONFIG_PAD_SWITCH = 5,
 	SCARLETT2_CONFIG_MSD_SWITCH = 6,
 	SCARLETT2_CONFIG_AIR_SWITCH = 7,
-	SCARLETT2_CONFIG_PHANTOM_SWITCH = 8,
-	SCARLETT2_CONFIG_PHANTOM_PERSISTENCE = 9,
-	SCARLETT2_CONFIG_DIRECT_MONITOR = 10,
-	SCARLETT2_CONFIG_MONITOR_OTHER_SWITCH = 11,
-	SCARLETT2_CONFIG_MONITOR_OTHER_ENABLE = 12,
-	SCARLETT2_CONFIG_TALKBACK_MAP = 13,
-	SCARLETT2_CONFIG_COUNT = 14
+	SCARLETT2_CONFIG_STANDALONE_SWITCH = 8,
+	SCARLETT2_CONFIG_PHANTOM_SWITCH = 9,
+	SCARLETT2_CONFIG_PHANTOM_PERSISTENCE = 10,
+	SCARLETT2_CONFIG_DIRECT_MONITOR = 11,
+	SCARLETT2_CONFIG_MONITOR_OTHER_SWITCH = 12,
+	SCARLETT2_CONFIG_MONITOR_OTHER_ENABLE = 13,
+	SCARLETT2_CONFIG_TALKBACK_MAP = 14,
+	SCARLETT2_CONFIG_COUNT = 15
 };
 
 /* Location, size, and activation command number for the configuration
@@ -998,6 +1001,9 @@ static const struct scarlett2_config
 	[SCARLETT2_CONFIG_PAD_SWITCH] = {
 		.offset = 0x84, .size = 8, .activate = 8 },
 
+	[SCARLETT2_CONFIG_STANDALONE_SWITCH] = {
+		.offset = 0x8d, .size = 8, .activate = 6 },
+
 /* Gen 3 devices: 4i4, 8i6, 18i8, 18i20 */
 }, {
 	[SCARLETT2_CONFIG_DIM_MUTE] = {
@@ -1021,6 +1027,9 @@ static const struct scarlett2_config
 	[SCARLETT2_CONFIG_AIR_SWITCH] = {
 		.offset = 0x8c, .size = 8, .activate = 8 },
 
+	[SCARLETT2_CONFIG_STANDALONE_SWITCH] = {
+		.offset = 0x95, .size = 8, .activate = 6 },
+
 	[SCARLETT2_CONFIG_PHANTOM_SWITCH] = {
 		.offset = 0x9c, .size = 1, .activate = 8 },
 
@@ -3502,6 +3511,69 @@ static int scarlett2_add_msd_ctl(struct usb_mixer_interface *mixer)
 				     0, 1, "MSD Mode Switch", NULL);
 }
 
+/*** Standalone Control ***/
+
+static int scarlett2_standalone_ctl_get(struct snd_kcontrol *kctl,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct scarlett2_data *private = elem->head.mixer->private_data;
+
+	ucontrol->value.integer.value[0] = private->standalone_switch;
+	return 0;
+}
+
+static int scarlett2_standalone_ctl_put(struct snd_kcontrol *kctl,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
+
+	int oval, val, err = 0;
+
+	mutex_lock(&private->data_mutex);
+
+	oval = private->standalone_switch;
+	val = !!ucontrol->value.integer.value[0];
+
+	if (oval == val)
+		goto unlock;
+
+	private->standalone_switch = val;
+
+	/* Send switch change to the device */
+	err = scarlett2_usb_set_config(mixer,
+				       SCARLETT2_CONFIG_STANDALONE_SWITCH,
+				       0, val);
+	if (err == 0)
+		err = 1;
+
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
+}
+
+static const struct snd_kcontrol_new scarlett2_standalone_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "",
+	.info = snd_ctl_boolean_mono_info,
+	.get  = scarlett2_standalone_ctl_get,
+	.put  = scarlett2_standalone_ctl_put,
+};
+
+static int scarlett2_add_standalone_ctl(struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+
+	if (private->info->config_set == SCARLETT2_CONFIG_SET_NO_MIXER)
+		return 0;
+
+	/* Add standalone control */
+	return scarlett2_add_new_ctl(mixer, &scarlett2_standalone_ctl,
+				     0, 1, "Standalone Switch", NULL);
+}
+
 /*** Cleanup/Suspend Callbacks ***/
 
 static void scarlett2_private_free(struct usb_mixer_interface *mixer)
@@ -3663,6 +3735,12 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 	if (info->config_set == SCARLETT2_CONFIG_SET_NO_MIXER)
 		return 0;
 
+	err = scarlett2_usb_get_config(
+		mixer, SCARLETT2_CONFIG_STANDALONE_SWITCH,
+		1, &private->standalone_switch);
+	if (err < 0)
+		return err;
+
 	err = scarlett2_update_sync(mixer);
 	if (err < 0)
 		return err;
@@ -3985,6 +4063,11 @@ static int snd_scarlett_gen2_controls_create(struct usb_mixer_interface *mixer)
 	if (err < 0)
 		return err;
 
+	/* Create the standalone control */
+	err = scarlett2_add_standalone_ctl(mixer);
+	if (err < 0)
+		return err;
+
 	/* Set up the interrupt polling */
 	err = scarlett2_init_notify(mixer);
 	if (err < 0)
-- 
2.35.1

