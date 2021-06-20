Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E9C3ADF7C
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Jun 2021 18:50:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E957816CE;
	Sun, 20 Jun 2021 18:49:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E957816CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624207833;
	bh=ex09WMPidBI0C7Yjq7ItjztIe8KwibSQFiCslK+rV0I=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ruUuKi3SoIWIgDDeaRfu1UjvldqnKwae2Hq1KzP4U9gK368jWnMdwvitaoBZ3vAY1
	 j9GiREzrjX/eATM1/lVs3tfCk1mYE290cI6lNzOmtYBae4isukJtqd9kyj5COSjSyY
	 OdUvhXDuu8tCZgmC7kvmOWZVv/7vter52ZKliYUk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A309F80507;
	Sun, 20 Jun 2021 18:46:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49995F804D8; Sun, 20 Jun 2021 18:46:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B790CF8016D
 for <alsa-devel@alsa-project.org>; Sun, 20 Jun 2021 18:46:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B790CF8016D
Received: by m.b4.vu (Postfix, from userid 1000)
 id 457B561E5F01; Mon, 21 Jun 2021 02:16:39 +0930 (ACST)
Date: Mon, 21 Jun 2021 02:16:39 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 08/14] ALSA: usb-audio: scarlett2: Rename struct
 scarlett2_mixer_data
Message-ID: <20210620164639.GA9206@m.b4.vu>
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

Rename struct scarlett2_mixer_data to struct scarlett2_data. A
less-wordy name is better because it is used everywhere, and although
this is a mixer driver, it also controls other vendor-specific
features.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 80 ++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 4e2ee979b9bd..c1e74918425a 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -224,7 +224,7 @@ struct scarlett2_device_info {
 	struct scarlett2_ports ports[SCARLETT2_PORT_TYPE_COUNT];
 };
 
-struct scarlett2_mixer_data {
+struct scarlett2_data {
 	struct usb_mixer_interface *mixer;
 	struct mutex usb_mutex; /* prevent sending concurrent USB requests */
 	struct mutex data_mutex; /* lock access to this data */
@@ -564,7 +564,7 @@ struct scarlett2_usb_packet {
 	u8 data[];
 };
 
-static void scarlett2_fill_request_header(struct scarlett2_mixer_data *private,
+static void scarlett2_fill_request_header(struct scarlett2_data *private,
 					  struct scarlett2_usb_packet *req,
 					  u32 cmd, u16 req_size)
 {
@@ -583,7 +583,7 @@ static int scarlett2_usb(
 	struct usb_mixer_interface *mixer, u32 cmd,
 	void *req_data, u16 req_size, void *resp_data, u16 resp_size)
 {
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 	u16 req_buf_size = sizeof(struct scarlett2_usb_packet) + req_size;
 	u16 resp_buf_size = sizeof(struct scarlett2_usb_packet) + resp_size;
 	struct scarlett2_usb_packet *req, *resp = NULL;
@@ -693,8 +693,8 @@ static void scarlett2_config_save(struct usb_mixer_interface *mixer)
 /* Delayed work to save config */
 static void scarlett2_config_save_work(struct work_struct *work)
 {
-	struct scarlett2_mixer_data *private =
-		container_of(work, struct scarlett2_mixer_data, work.work);
+	struct scarlett2_data *private =
+		container_of(work, struct scarlett2_data, work.work);
 
 	scarlett2_config_save(private->mixer);
 }
@@ -715,7 +715,7 @@ static int scarlett2_usb_set_config(
 	} __packed req;
 	__le32 req2;
 	int err;
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 
 	/* Cancel any pending NVRAM save */
 	cancel_delayed_work_sync(&private->work);
@@ -786,7 +786,7 @@ static int scarlett2_usb_get_volume_status(
 static int scarlett2_usb_get_mix(struct usb_mixer_interface *mixer,
 				 int mix_num)
 {
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
 
 	int num_mixer_in =
@@ -829,7 +829,7 @@ static int scarlett2_usb_get_mix(struct usb_mixer_interface *mixer,
 static int scarlett2_usb_set_mix(struct usb_mixer_interface *mixer,
 				 int mix_num)
 {
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
 
 	struct {
@@ -895,7 +895,7 @@ static u32 scarlett2_mux_id_to_num(const struct scarlett2_ports *ports,
 }
 
 /* Convert one mux entry from the interface and load into private->mux[] */
-static void scarlett2_usb_populate_mux(struct scarlett2_mixer_data *private,
+static void scarlett2_usb_populate_mux(struct scarlett2_data *private,
 				       u32 mux_entry)
 {
 	const struct scarlett2_device_info *info = private->info;
@@ -933,7 +933,7 @@ static void scarlett2_usb_populate_mux(struct scarlett2_mixer_data *private,
 /* Send USB message to get mux inputs and then populate private->mux[] */
 static int scarlett2_usb_get_mux(struct usb_mixer_interface *mixer)
 {
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 	int count = private->num_mux_dsts;
 	int err, i;
 
@@ -962,7 +962,7 @@ static int scarlett2_usb_get_mux(struct usb_mixer_interface *mixer)
 /* Send USB messages to set mux inputs */
 static int scarlett2_usb_set_mux(struct usb_mixer_interface *mixer)
 {
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
 	const struct scarlett2_ports *ports = info->ports;
 	int rate, port_dir_rate;
@@ -1103,7 +1103,7 @@ static int scarlett2_add_new_ctl(struct usb_mixer_interface *mixer,
  */
 static int scarlett2_update_volumes(struct usb_mixer_interface *mixer)
 {
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
 	const struct scarlett2_ports *ports = info->ports;
 	struct scarlett2_usb_volume_status volume_status;
@@ -1151,7 +1151,7 @@ static int scarlett2_master_volume_ctl_get(struct snd_kcontrol *kctl,
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 
 	if (private->vol_updated) {
 		mutex_lock(&private->data_mutex);
@@ -1168,7 +1168,7 @@ static int scarlett2_volume_ctl_get(struct snd_kcontrol *kctl,
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 	int index = elem->control;
 
 	if (private->vol_updated) {
@@ -1186,7 +1186,7 @@ static int scarlett2_volume_ctl_put(struct snd_kcontrol *kctl,
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 	int index = elem->control;
 	int oval, val, err = 0;
 
@@ -1252,7 +1252,7 @@ static int scarlett2_sw_hw_enum_ctl_get(struct snd_kcontrol *kctl,
 					struct snd_ctl_elem_value *ucontrol)
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
-	struct scarlett2_mixer_data *private = elem->head.mixer->private_data;
+	struct scarlett2_data *private = elem->head.mixer->private_data;
 
 	ucontrol->value.enumerated.item[0] =
 		private->vol_sw_hw_switch[elem->control];
@@ -1264,7 +1264,7 @@ static int scarlett2_sw_hw_enum_ctl_put(struct snd_kcontrol *kctl,
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 
 	int index = elem->control;
 	int oval, val, err = 0;
@@ -1336,7 +1336,7 @@ static int scarlett2_level_enum_ctl_get(struct snd_kcontrol *kctl,
 					struct snd_ctl_elem_value *ucontrol)
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
-	struct scarlett2_mixer_data *private = elem->head.mixer->private_data;
+	struct scarlett2_data *private = elem->head.mixer->private_data;
 
 	ucontrol->value.enumerated.item[0] =
 		private->level_switch[elem->control];
@@ -1348,7 +1348,7 @@ static int scarlett2_level_enum_ctl_put(struct snd_kcontrol *kctl,
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 
 	int index = elem->control;
 	int oval, val, err = 0;
@@ -1386,7 +1386,7 @@ static int scarlett2_pad_ctl_get(struct snd_kcontrol *kctl,
 				 struct snd_ctl_elem_value *ucontrol)
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
-	struct scarlett2_mixer_data *private = elem->head.mixer->private_data;
+	struct scarlett2_data *private = elem->head.mixer->private_data;
 
 	ucontrol->value.enumerated.item[0] =
 		private->pad_switch[elem->control];
@@ -1398,7 +1398,7 @@ static int scarlett2_pad_ctl_put(struct snd_kcontrol *kctl,
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 
 	int index = elem->control;
 	int oval, val, err = 0;
@@ -1437,7 +1437,7 @@ static int scarlett2_dim_mute_ctl_get(struct snd_kcontrol *kctl,
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 
 	if (private->vol_updated) {
 		mutex_lock(&private->data_mutex);
@@ -1454,7 +1454,7 @@ static int scarlett2_dim_mute_ctl_put(struct snd_kcontrol *kctl,
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 
 	int index = elem->control;
 	int oval, val, err = 0;
@@ -1490,7 +1490,7 @@ static const struct snd_kcontrol_new scarlett2_dim_mute_ctl = {
 
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
@@ -1692,7 +1692,7 @@ static int scarlett2_mux_src_enum_ctl_info(struct snd_kcontrol *kctl,
 					   struct snd_ctl_elem_info *uinfo)
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
-	struct scarlett2_mixer_data *private = elem->head.mixer->private_data;
+	struct scarlett2_data *private = elem->head.mixer->private_data;
 	const struct scarlett2_ports *ports = private->info->ports;
 	unsigned int item = uinfo->value.enumerated.item;
 	int items = private->num_mux_srcs;
@@ -1724,7 +1724,7 @@ static int scarlett2_mux_src_enum_ctl_get(struct snd_kcontrol *kctl,
 					  struct snd_ctl_elem_value *ucontrol)
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
-	struct scarlett2_mixer_data *private = elem->head.mixer->private_data;
+	struct scarlett2_data *private = elem->head.mixer->private_data;
 
 	ucontrol->value.enumerated.item[0] = private->mux[elem->control];
 	return 0;
@@ -1735,7 +1735,7 @@ static int scarlett2_mux_src_enum_ctl_put(struct snd_kcontrol *kctl,
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 	int index = elem->control;
 	int oval, val, err = 0;
 
@@ -1768,7 +1768,7 @@ static const struct snd_kcontrol_new scarlett2_mux_src_enum_ctl = {
 
 static int scarlett2_add_mux_enums(struct usb_mixer_interface *mixer)
 {
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_ports *ports = private->info->ports;
 	int port_type, channel, i;
 
@@ -1847,7 +1847,7 @@ static int scarlett2_add_meter_ctl(struct usb_mixer_interface *mixer)
 
 static void scarlett2_private_free(struct usb_mixer_interface *mixer)
 {
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 
 	cancel_delayed_work_sync(&private->work);
 	kfree(private);
@@ -1856,7 +1856,7 @@ static void scarlett2_private_free(struct usb_mixer_interface *mixer)
 
 static void scarlett2_private_suspend(struct usb_mixer_interface *mixer)
 {
-	struct scarlett2_mixer_data *private = mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 
 	if (cancel_delayed_work_sync(&private->work))
 		scarlett2_config_save(private->mixer);
@@ -1864,7 +1864,7 @@ static void scarlett2_private_suspend(struct usb_mixer_interface *mixer)
 
 /*** Initialisation ***/
 
-static void scarlett2_count_mux_io(struct scarlett2_mixer_data *private)
+static void scarlett2_count_mux_io(struct scarlett2_data *private)
 {
 	const struct scarlett2_ports *ports = private->info->ports;
 	int port_type, srcs = 0, dsts = 0;
@@ -1884,8 +1884,8 @@ static void scarlett2_count_mux_io(struct scarlett2_mixer_data *private)
 static int scarlett2_init_private(struct usb_mixer_interface *mixer,
 				  const struct scarlett2_device_info *info)
 {
-	struct scarlett2_mixer_data *private =
-		kzalloc(sizeof(struct scarlett2_mixer_data), GFP_KERNEL);
+	struct scarlett2_data *private =
+		kzalloc(sizeof(struct scarlett2_data), GFP_KERNEL);
 
 	if (!private)
 		return -ENOMEM;
@@ -1908,7 +1908,7 @@ static int scarlett2_init_private(struct usb_mixer_interface *mixer,
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
 	const struct scarlett2_device_info *info = private->info;
 	int i;
 
-- 
2.31.1

