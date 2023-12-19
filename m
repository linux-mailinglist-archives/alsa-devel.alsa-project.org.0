Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BCD818E4B
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 18:38:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92151E7D;
	Tue, 19 Dec 2023 18:38:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92151E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703007534;
	bh=66a8o9rC4U4wSUF+99ngYard3PbwXPI38SOJm1dFOJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DzF6Rk2BzURvXj8AjxidCExWtXuEySHUSoSToW4MHyuyM2UkkVManJ0Lrp+YL5H15
	 NNkX5aSZ8qCM3sob4JAm60BOZ/Syl2EujmNCNGIHQReyfGxfKxS4AGdvlQswWhrygD
	 3+XhWgasmS+sq3MV1r2OBS1G3u4kfkQKSGVJzJ1Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5A86F805AC; Tue, 19 Dec 2023 18:38:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A07A9F805A9;
	Tue, 19 Dec 2023 18:38:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3747F80578; Tue, 19 Dec 2023 18:38:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 679E7F8055C
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 18:37:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 679E7F8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=cKc80OEX
Received: by m.b4.vu (Postfix, from userid 1000)
	id 6BB85604B9F7; Wed, 20 Dec 2023 04:07:37 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 6BB85604B9F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703007457; bh=/ntwoBmCyYetrlV6KCRYSBLcValc73eGigSnWiDbGIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cKc80OEXhySWbhrhuIzUN9bsLXK8Y0Ns7HDb5SvWSrb/+7A8oyD4AIMbWmj+/Dcq7
	 3YHOQSvZopiPlBoAIzsVMK+69Ag8GEOqOlz899uu06cfzYzW0O4Twm7XmBKC+Y8VfJ
	 FCAxaP0+AmQLTOq2+6qY7/YXIX41HFxzdzrTAY1tiJJ11gvOhuv6we+8M5JwgDG4U0
	 CE+Y0k1OFXlWWNHOrAxvgv2fzqkBZDuzg49AjYK/MQ6s/72+olYmtXWRNBSBiO1ItX
	 WGb1vk0rp3GYEyiloiGXFtpziQtM1ylJA+flYNXgiubG4mF53pquh6V0laW030GdK2
	 sf3XiXVB7dpeg==
Date: Wed, 20 Dec 2023 04:07:37 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH 04/11] ALSA: scarlett2: Add missing error checks to
 *_ctl_get()
Message-ID: <32a5fdc83b05fa74e0fcdd672fbf71d75c5f0a6d.1703001053.git.g@b4.vu>
References: <cover.1703001053.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703001053.git.g@b4.vu>
Message-ID-Hash: 22JIMR3B33AS7U2BGZNZXWOFWPK2KVTO
X-Message-ID-Hash: 22JIMR3B33AS7U2BGZNZXWOFWPK2KVTO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/22JIMR3B33AS7U2BGZNZXWOFWPK2KVTO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The *_ctl_get() functions which call scarlett2_update_*() were not
checking the return value. Fix to check the return value and pass to
the caller.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
Fixes: 9e4d5c1be21f ("ALSA: usb-audio: Scarlett Gen 2 mixer interface")
---
 sound/usb/mixer_scarlett2.c | 182 +++++++++++++++++++++++++-----------
 1 file changed, 130 insertions(+), 52 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 22285d8038c1..373911937487 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -2100,14 +2100,20 @@ static int scarlett2_sync_ctl_get(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
+	int err = 0;
 
 	mutex_lock(&private->data_mutex);
-	if (private->sync_updated)
-		scarlett2_update_sync(mixer);
+
+	if (private->sync_updated) {
+		err = scarlett2_update_sync(mixer);
+		if (err < 0)
+			goto unlock;
+	}
 	ucontrol->value.enumerated.item[0] = private->sync;
-	mutex_unlock(&private->data_mutex);
 
-	return 0;
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
 }
 
 static const struct snd_kcontrol_new scarlett2_sync_ctl = {
@@ -2190,14 +2196,20 @@ static int scarlett2_master_volume_ctl_get(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
+	int err = 0;
 
 	mutex_lock(&private->data_mutex);
-	if (private->vol_updated)
-		scarlett2_update_volumes(mixer);
-	mutex_unlock(&private->data_mutex);
 
+	if (private->vol_updated) {
+		err = scarlett2_update_volumes(mixer);
+		if (err < 0)
+			goto unlock;
+	}
 	ucontrol->value.integer.value[0] = private->master_vol;
-	return 0;
+
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
 }
 
 static int line_out_remap(struct scarlett2_data *private, int index)
@@ -2223,14 +2235,20 @@ static int scarlett2_volume_ctl_get(struct snd_kcontrol *kctl,
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
 	int index = line_out_remap(private, elem->control);
+	int err = 0;
 
 	mutex_lock(&private->data_mutex);
-	if (private->vol_updated)
-		scarlett2_update_volumes(mixer);
-	mutex_unlock(&private->data_mutex);
 
+	if (private->vol_updated) {
+		err = scarlett2_update_volumes(mixer);
+		if (err < 0)
+			goto unlock;
+	}
 	ucontrol->value.integer.value[0] = private->vol[index];
-	return 0;
+
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
 }
 
 static int scarlett2_volume_ctl_put(struct snd_kcontrol *kctl,
@@ -2297,14 +2315,20 @@ static int scarlett2_mute_ctl_get(struct snd_kcontrol *kctl,
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
 	int index = line_out_remap(private, elem->control);
+	int err = 0;
 
 	mutex_lock(&private->data_mutex);
-	if (private->vol_updated)
-		scarlett2_update_volumes(mixer);
-	mutex_unlock(&private->data_mutex);
 
+	if (private->vol_updated) {
+		err = scarlett2_update_volumes(mixer);
+		if (err < 0)
+			goto unlock;
+	}
 	ucontrol->value.integer.value[0] = private->mute_switch[index];
-	return 0;
+
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
 }
 
 static int scarlett2_mute_ctl_put(struct snd_kcontrol *kctl,
@@ -2550,14 +2574,20 @@ static int scarlett2_level_enum_ctl_get(struct snd_kcontrol *kctl,
 	const struct scarlett2_device_info *info = private->info;
 
 	int index = elem->control + info->level_input_first;
+	int err = 0;
 
 	mutex_lock(&private->data_mutex);
-	if (private->input_other_updated)
-		scarlett2_update_input_other(mixer);
+
+	if (private->input_other_updated) {
+		err = scarlett2_update_input_other(mixer);
+		if (err < 0)
+			goto unlock;
+	}
 	ucontrol->value.enumerated.item[0] = private->level_switch[index];
-	mutex_unlock(&private->data_mutex);
 
-	return 0;
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
 }
 
 static int scarlett2_level_enum_ctl_put(struct snd_kcontrol *kctl,
@@ -2608,15 +2638,21 @@ static int scarlett2_pad_ctl_get(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
+	int err = 0;
 
 	mutex_lock(&private->data_mutex);
-	if (private->input_other_updated)
-		scarlett2_update_input_other(mixer);
+
+	if (private->input_other_updated) {
+		err = scarlett2_update_input_other(mixer);
+		if (err < 0)
+			goto unlock;
+	}
 	ucontrol->value.integer.value[0] =
 		private->pad_switch[elem->control];
-	mutex_unlock(&private->data_mutex);
 
-	return 0;
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
 }
 
 static int scarlett2_pad_ctl_put(struct snd_kcontrol *kctl,
@@ -2666,14 +2702,20 @@ static int scarlett2_air_ctl_get(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
+	int err = 0;
 
 	mutex_lock(&private->data_mutex);
-	if (private->input_other_updated)
-		scarlett2_update_input_other(mixer);
+
+	if (private->input_other_updated) {
+		err = scarlett2_update_input_other(mixer);
+		if (err < 0)
+			goto unlock;
+	}
 	ucontrol->value.integer.value[0] = private->air_switch[elem->control];
-	mutex_unlock(&private->data_mutex);
 
-	return 0;
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
 }
 
 static int scarlett2_air_ctl_put(struct snd_kcontrol *kctl,
@@ -2723,15 +2765,21 @@ static int scarlett2_phantom_ctl_get(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
+	int err = 0;
 
 	mutex_lock(&private->data_mutex);
-	if (private->input_other_updated)
-		scarlett2_update_input_other(mixer);
+
+	if (private->input_other_updated) {
+		err = scarlett2_update_input_other(mixer);
+		if (err < 0)
+			goto unlock;
+	}
 	ucontrol->value.integer.value[0] =
 		private->phantom_switch[elem->control];
-	mutex_unlock(&private->data_mutex);
 
-	return 0;
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
 }
 
 static int scarlett2_phantom_ctl_put(struct snd_kcontrol *kctl,
@@ -2903,14 +2951,20 @@ static int scarlett2_direct_monitor_ctl_get(
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = elem->head.mixer->private_data;
+	int err = 0;
 
 	mutex_lock(&private->data_mutex);
-	if (private->monitor_other_updated)
-		scarlett2_update_monitor_other(mixer);
+
+	if (private->monitor_other_updated) {
+		err = scarlett2_update_monitor_other(mixer);
+		if (err < 0)
+			goto unlock;
+	}
 	ucontrol->value.enumerated.item[0] = private->direct_monitor_switch;
-	mutex_unlock(&private->data_mutex);
 
-	return 0;
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
 }
 
 static int scarlett2_direct_monitor_ctl_put(
@@ -3010,14 +3064,20 @@ static int scarlett2_speaker_switch_enum_ctl_get(
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
+	int err = 0;
 
 	mutex_lock(&private->data_mutex);
-	if (private->monitor_other_updated)
-		scarlett2_update_monitor_other(mixer);
+
+	if (private->monitor_other_updated) {
+		err = scarlett2_update_monitor_other(mixer);
+		if (err < 0)
+			goto unlock;
+	}
 	ucontrol->value.enumerated.item[0] = private->speaker_switching_switch;
-	mutex_unlock(&private->data_mutex);
 
-	return 0;
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
 }
 
 /* when speaker switching gets enabled, switch the main/alt speakers
@@ -3165,14 +3225,20 @@ static int scarlett2_talkback_enum_ctl_get(
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
+	int err = 0;
 
 	mutex_lock(&private->data_mutex);
-	if (private->monitor_other_updated)
-		scarlett2_update_monitor_other(mixer);
+
+	if (private->monitor_other_updated) {
+		err = scarlett2_update_monitor_other(mixer);
+		if (err < 0)
+			goto unlock;
+	}
 	ucontrol->value.enumerated.item[0] = private->talkback_switch;
-	mutex_unlock(&private->data_mutex);
 
-	return 0;
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
 }
 
 static int scarlett2_talkback_enum_ctl_put(
@@ -3320,14 +3386,20 @@ static int scarlett2_dim_mute_ctl_get(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
+	int err = 0;
 
 	mutex_lock(&private->data_mutex);
-	if (private->vol_updated)
-		scarlett2_update_volumes(mixer);
-	mutex_unlock(&private->data_mutex);
 
+	if (private->vol_updated) {
+		err = scarlett2_update_volumes(mixer);
+		if (err < 0)
+			goto unlock;
+	}
 	ucontrol->value.integer.value[0] = private->dim_mute[elem->control];
-	return 0;
+
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
 }
 
 static int scarlett2_dim_mute_ctl_put(struct snd_kcontrol *kctl,
@@ -3698,14 +3770,20 @@ static int scarlett2_mux_src_enum_ctl_get(struct snd_kcontrol *kctl,
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
 	int index = line_out_remap(private, elem->control);
+	int err = 0;
 
 	mutex_lock(&private->data_mutex);
-	if (private->mux_updated)
-		scarlett2_usb_get_mux(mixer);
+
+	if (private->mux_updated) {
+		err = scarlett2_usb_get_mux(mixer);
+		if (err < 0)
+			goto unlock;
+	}
 	ucontrol->value.enumerated.item[0] = private->mux[index];
-	mutex_unlock(&private->data_mutex);
 
-	return 0;
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
 }
 
 static int scarlett2_mux_src_enum_ctl_put(struct snd_kcontrol *kctl,
-- 
2.43.0

