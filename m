Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B8239D043
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Jun 2021 19:48:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FEDF174A;
	Sun,  6 Jun 2021 19:47:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FEDF174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623001709;
	bh=Ve0V8LTW311YGER1/PcO8bHJm+ckQPmtdUKCU3lqClA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F3DUQ+ubCe1yk3QLBE2S2pbTwT2gdEVNRVfnYFgguBlfzBLzd7RPJ6YQEniGnTSCd
	 XW3ZINgucAilANSiEAxSrwXFL6a7Ke7Kpv8J+HH1iB9k6mebAwHyPLSHN1vLIJwfxw
	 lJXF58EzsKqZ5pO31pAg1C5f0Q9Z6AjkznF/d7Is=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 053F5F804AC;
	Sun,  6 Jun 2021 19:46:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05140F804C2; Sun,  6 Jun 2021 19:46:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49BA9F80256
 for <alsa-devel@alsa-project.org>; Sun,  6 Jun 2021 19:46:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49BA9F80256
Received: by m.b4.vu (Postfix, from userid 1000)
 id CE0CB612FB14; Mon,  7 Jun 2021 03:16:37 +0930 (ACST)
Date: Mon, 7 Jun 2021 03:16:37 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 6/8] ALSA: usb-audio: scarlett2: Rename struct
 scarlett2_mixer_data
Message-ID: <3816cbfd3a39198e9c74edff5e61c39a94041d35.1622999147.git.g@b4.vu>
References: <cover.1622999147.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1622999147.git.g@b4.vu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Vladimir Sadovnikov <sadko4u@gmail.com>
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

Rename struct scarlett2_mixer_data to struct scarlett2_data.
A less-wordy name is better because it is used everywhere, and
although this is a mixer driver, it also controls other
vendor-specific features.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 80 ++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index d240fa9a4b59..81c59463b693 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -225,7 +225,7 @@ struct scarlett2_device_info {
 	struct scarlett2_ports ports[SCARLETT2_PORT_TYPE_COUNT];
 };
 
-struct scarlett2_mixer_data {
+struct scarlett2_data {
 	struct usb_mixer_interface *mixer;
 	struct mutex usb_mutex; /* prevent sending concurrent USB requests */
 	struct mutex data_mutex; /* lock access to this data */
@@ -568,7 +568,7 @@ struct scarlett2_usb_packet {
 	u8 data[];
 };
 
-static void scarlett2_fill_request_header(struct scarlett2_mixer_data *private,
+static void scarlett2_fill_request_header(struct scarlett2_data *private,
 					  struct scarlett2_usb_packet *req,
 					  u32 cmd, u16 req_size)
 {
@@ -587,7 +587,7 @@ static int scarlett2_usb(
 	struct usb_mixer_interface *mixer, u32 cmd,
 	void *req_data, u16 req_size, void *resp_data, u16 resp_size)
 {
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 	u16 req_buf_size = sizeof(struct scarlett2_usb_packet) + req_size;
 	u16 resp_buf_size = sizeof(struct scarlett2_usb_packet) + resp_size;
 	struct scarlett2_usb_packet *req, *resp = NULL;
@@ -697,8 +697,8 @@ static void scarlett2_config_save(struct usb_mixer_interface *mixer)
 /* Delayed work to save config */
 static void scarlett2_config_save_work(struct work_struct *work)
 {
-	struct scarlett2_mixer_data *private =
-		container_of(work, struct scarlett2_mixer_data, work.work);
+	struct scarlett2_data *private =
+		container_of(work, struct scarlett2_data, work.work);
 
 	scarlett2_config_save(private->mixer);
 }
@@ -719,7 +719,7 @@ static int scarlett2_usb_set_config(
 	} __packed req;
 	__le32 req2;
 	int err;
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 
 	/* Cancel any pending NVRAM save */
 	cancel_delayed_work_sync(&private->work);
@@ -790,7 +790,7 @@ static int scarlett2_usb_get_volume_status(
 static int scarlett2_usb_get_mix(struct usb_mixer_interface *mixer,
 				 int mix_num)
 {
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
 
 	int num_mixer_in =
@@ -833,7 +833,7 @@ static int scarlett2_usb_get_mix(struct usb_mixer_interface *mixer,
 static int scarlett2_usb_set_mix(struct usb_mixer_interface *mixer,
 				 int mix_num)
 {
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
 
 	struct {
@@ -899,7 +899,7 @@ static u32 scarlett2_mux_id_to_num(const struct scarlett2_ports *ports,
 }
 
 /* Convert one mux entry from the interface and load into private->mux[] */
-static void scarlett2_usb_populate_mux(struct scarlett2_mixer_data *private,
+static void scarlett2_usb_populate_mux(struct scarlett2_data *private,
 				       u32 mux_entry)
 {
 	const struct scarlett2_device_info *info = private->info;
@@ -937,7 +937,7 @@ static void scarlett2_usb_populate_mux(struct scarlett2_mixer_data *private,
 /* Send USB message to get mux inputs and then populate private->mux[] */
 static int scarlett2_usb_get_mux(struct usb_mixer_interface *mixer)
 {
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 	int count = private->num_mux_dsts;
 	int err, i;
 
@@ -966,7 +966,7 @@ static int scarlett2_usb_get_mux(struct usb_mixer_interface *mixer)
 /* Send USB messages to set mux inputs */
 static int scarlett2_usb_set_mux(struct usb_mixer_interface *mixer)
 {
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
 	const struct scarlett2_ports *ports = info->ports;
 	int rate, port_dir_rate;
@@ -1107,7 +1107,7 @@ static int scarlett2_add_new_ctl(struct usb_mixer_interface *mixer,
  */
 static int scarlett2_update_volumes(struct usb_mixer_interface *mixer)
 {
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_ports *ports = private->info->ports;
 	struct scarlett2_usb_volume_status volume_status;
 	int num_line_out =
@@ -1153,7 +1153,7 @@ static int scarlett2_master_volume_ctl_get(struct snd_kcontrol *kctl,
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 
 	if (private->vol_updated) {
 		mutex_lock(&private->data_mutex);
@@ -1170,7 +1170,7 @@ static int scarlett2_volume_ctl_get(struct snd_kcontrol *kctl,
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 	int index = elem->control;
 
 	if (private->vol_updated) {
@@ -1188,7 +1188,7 @@ static int scarlett2_volume_ctl_put(struct snd_kcontrol *kctl,
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 	int index = elem->control;
 	int oval, val, err = 0;
 
@@ -1254,7 +1254,7 @@ static int scarlett2_sw_hw_enum_ctl_get(struct snd_kcontrol *kctl,
 					struct snd_ctl_elem_value *ucontrol)
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
-	struct scarlett2_mixer_data *private = elem->head.mixer->private_data;
+	struct scarlett2_data *private = elem->head.mixer->private_data;
 
 	ucontrol->value.enumerated.item[0] =
 		private->vol_sw_hw_switch[elem->control];
@@ -1266,7 +1266,7 @@ static int scarlett2_sw_hw_enum_ctl_put(struct snd_kcontrol *kctl,
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 
 	int index = elem->control;
 	int oval, val, err = 0;
@@ -1338,7 +1338,7 @@ static int scarlett2_level_enum_ctl_get(struct snd_kcontrol *kctl,
 					struct snd_ctl_elem_value *ucontrol)
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
-	struct scarlett2_mixer_data *private = elem->head.mixer->private_data;
+	struct scarlett2_data *private = elem->head.mixer->private_data;
 
 	ucontrol->value.enumerated.item[0] =
 		private->level_switch[elem->control];
@@ -1350,7 +1350,7 @@ static int scarlett2_level_enum_ctl_put(struct snd_kcontrol *kctl,
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 
 	int index = elem->control;
 	int oval, val, err = 0;
@@ -1388,7 +1388,7 @@ static int scarlett2_pad_ctl_get(struct snd_kcontrol *kctl,
 				 struct snd_ctl_elem_value *ucontrol)
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
-	struct scarlett2_mixer_data *private = elem->head.mixer->private_data;
+	struct scarlett2_data *private = elem->head.mixer->private_data;
 
 	ucontrol->value.enumerated.item[0] =
 		private->pad_switch[elem->control];
@@ -1400,7 +1400,7 @@ static int scarlett2_pad_ctl_put(struct snd_kcontrol *kctl,
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 
 	int index = elem->control;
 	int oval, val, err = 0;
@@ -1439,7 +1439,7 @@ static int scarlett2_button_ctl_get(struct snd_kcontrol *kctl,
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 
 	if (private->vol_updated) {
 		mutex_lock(&private->data_mutex);
@@ -1456,7 +1456,7 @@ static int scarlett2_button_ctl_put(struct snd_kcontrol *kctl,
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 
 	int index = elem->control;
 	int oval, val, err = 0;
@@ -1492,7 +1492,7 @@ static const struct snd_kcontrol_new scarlett2_button_ctl = {
 
 static int scarlett2_add_line_out_ctls(struct usb_mixer_interface *mixer)
 {
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
 	const struct scarlett2_ports *ports = info->ports;
 	int num_line_out =
@@ -1562,7 +1562,7 @@ static int scarlett2_add_line_out_ctls(struct usb_mixer_interface *mixer)
 
 static int scarlett2_add_line_in_ctls(struct usb_mixer_interface *mixer)
 {
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
 	int err, i;
 	char s[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
@@ -1607,7 +1607,7 @@ static int scarlett2_mixer_ctl_get(struct snd_kcontrol *kctl,
 				   struct snd_ctl_elem_value *ucontrol)
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
-	struct scarlett2_mixer_data *private = elem->head.mixer->private_data;
+	struct scarlett2_data *private = elem->head.mixer->private_data;
 
 	ucontrol->value.integer.value[0] = private->mix[elem->control];
 	return 0;
@@ -1618,7 +1618,7 @@ static int scarlett2_mixer_ctl_put(struct snd_kcontrol *kctl,
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
 	const struct scarlett2_ports *ports = info->ports;
 	int oval, val, num_mixer_in, mix_num, err = 0;
@@ -1663,7 +1663,7 @@ static const struct snd_kcontrol_new scarlett2_mixer_ctl = {
 
 static int scarlett2_add_mixer_ctls(struct usb_mixer_interface *mixer)
 {
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_ports *ports = private->info->ports;
 	int err, i, j;
 	int index;
@@ -1693,7 +1693,7 @@ static int scarlett2_mux_src_enum_ctl_info(struct snd_kcontrol *kctl,
 					   struct snd_ctl_elem_info *uinfo)
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
-	struct scarlett2_mixer_data *private = elem->head.mixer->private_data;
+	struct scarlett2_data *private = elem->head.mixer->private_data;
 	const struct scarlett2_ports *ports = private->info->ports;
 	unsigned int item = uinfo->value.enumerated.item;
 	int items = private->num_mux_srcs;
@@ -1725,7 +1725,7 @@ static int scarlett2_mux_src_enum_ctl_get(struct snd_kcontrol *kctl,
 					  struct snd_ctl_elem_value *ucontrol)
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
-	struct scarlett2_mixer_data *private = elem->head.mixer->private_data;
+	struct scarlett2_data *private = elem->head.mixer->private_data;
 
 	ucontrol->value.enumerated.item[0] = private->mux[elem->control];
 	return 0;
@@ -1736,7 +1736,7 @@ static int scarlett2_mux_src_enum_ctl_put(struct snd_kcontrol *kctl,
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 	int index = elem->control;
 	int oval, val, err = 0;
 
@@ -1769,7 +1769,7 @@ static const struct snd_kcontrol_new scarlett2_mux_src_enum_ctl = {
 
 static int scarlett2_add_mux_enums(struct usb_mixer_interface *mixer)
 {
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_ports *ports = private->info->ports;
 	int port_type, channel, i;
 
@@ -1848,7 +1848,7 @@ static int scarlett2_add_meter_ctl(struct usb_mixer_interface *mixer)
 
 static void scarlett2_private_free(struct usb_mixer_interface *mixer)
 {
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 
 	cancel_delayed_work_sync(&private->work);
 	kfree(private);
@@ -1857,7 +1857,7 @@ static void scarlett2_private_free(struct usb_mixer_interface *mixer)
 
 static void scarlett2_private_suspend(struct usb_mixer_interface *mixer)
 {
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 
 	if (cancel_delayed_work_sync(&private->work))
 		scarlett2_config_save(private->mixer);
@@ -1865,7 +1865,7 @@ static void scarlett2_private_suspend(struct usb_mixer_interface *mixer)
 
 /*** Initialisation ***/
 
-static void scarlett2_count_mux_io(struct scarlett2_mixer_data *private)
+static void scarlett2_count_mux_io(struct scarlett2_data *private)
 {
 	const struct scarlett2_ports *ports = private->info->ports;
 	int port_type, srcs = 0, dsts = 0;
@@ -1885,8 +1885,8 @@ static void scarlett2_count_mux_io(struct scarlett2_mixer_data *private)
 static int scarlett2_init_private(struct usb_mixer_interface *mixer,
 				  const struct scarlett2_device_info *info)
 {
-	struct scarlett2_mixer_data *private =
-		kzalloc(sizeof(struct scarlett2_mixer_data), GFP_KERNEL);
+	struct scarlett2_data *private =
+		kzalloc(sizeof(struct scarlett2_data), GFP_KERNEL);
 
 	if (!private)
 		return -ENOMEM;
@@ -1909,7 +1909,7 @@ static int scarlett2_init_private(struct usb_mixer_interface *mixer,
 /* Read configuration from the interface on start */
 static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 {
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
 	const struct scarlett2_ports *ports = info->ports;
 	int num_line_out =
@@ -1978,7 +1978,7 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 static void scarlett2_notify_monitor(
 	struct usb_mixer_interface *mixer)
 {
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_ports *ports = private->info->ports;
 	int num_line_out =
 		ports[SCARLETT2_PORT_TYPE_ANALOGUE].num[SCARLETT2_PORT_OUT];
@@ -2001,7 +2001,7 @@ static void scarlett2_notify_monitor(
 static void scarlett2_notify_dim_mute(
 	struct usb_mixer_interface *mixer)
 {
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 	int i;
 
 	private->vol_updated = 1;
-- 
2.31.1

