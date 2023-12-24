Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 860E381DC25
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Dec 2023 20:33:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F626EDF;
	Sun, 24 Dec 2023 20:32:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F626EDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703446380;
	bh=gMETOkz2RNK3yRbNC37ftJS1xNlNvqs88S33Or+9Bnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rA5nxQ81Q5wwi3qwL+cVbdbL2PCdcF+No05MDuSGQ5Ecz+G4a4Sys4reGdLUqhwGr
	 4pneOM7L2RRws/9Ww+bFlOto5eZIu/i+Sfvw0DUvuLJJNNHPJABV7cuKZl2OSK3Sgw
	 ONz93Y5rKkfvqFpfzNe1MsYnbDwkHV7ijptXRzTU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB64CF805F8; Sun, 24 Dec 2023 20:32:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B032EF805C1;
	Sun, 24 Dec 2023 20:32:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56464F80578; Sun, 24 Dec 2023 20:32:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1EF6F8057C
	for <alsa-devel@alsa-project.org>; Sun, 24 Dec 2023 20:30:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1EF6F8057C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=BIgPSoQd
Received: by m.b4.vu (Postfix, from userid 1000)
	id C37DD604B9CB; Mon, 25 Dec 2023 06:00:53 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu C37DD604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703446253; bh=pmIqqE87vq63XRX6bTounyYoMGhBVH9N46xQXBwNGvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BIgPSoQd8s9bRJRlT7HDhsguQZg1RmpE2SMbiQFHwLjcp75eAv0n7BFTforkk43Hn
	 NzasBnsONY7LslgEaphXBTXAMgp5dMuHSA7S+jPnuPVOFjLvXRgOqIKi+n+EquV4CI
	 qiRC2gPv+SJlHmQTafk9BVXmOSzV3FKYqmDGt+j8zNmcdOTgNz4yHBvji+3AQ0JPT+
	 gpen3t2m0e+In/GJQ+sbwH639xIhI4cytFjGq3nQJ7yO9kgsKrA75Lzaz0f5JZGd6W
	 dwkhqo6J8no+1R80QXN7lwyX8EHmZNqxx5pCQXB4Xfxk3bz7YYRuDXP61y5Ri0LVAp
	 zBOLlZYIPP7mQ==
Date: Mon, 25 Dec 2023 06:00:53 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 22/23] ALSA: scarlett2: Split input_other into
 level/pad/air/phantom
Message-ID: <a1a1d190659d56689792aa20ceeb53a6175171ad.1703444932.git.g@b4.vu>
References: <cover.1703444932.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703444932.git.g@b4.vu>
Message-ID-Hash: XXWOA3ZHVBLAAK3F62PP6CPB7VCW4JQY
X-Message-ID-Hash: XXWOA3ZHVBLAAK3F62PP6CPB7VCW4JQY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XXWOA3ZHVBLAAK3F62PP6CPB7VCW4JQY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Gen 2/3 devices have a single notification value for "input other"
changes. Gen 4 has separate notification values for level, pad, air,
and phantom power changes. Therefore, split the input_other_updated
field and the scarlett2_update_input_other() function into the four
components so that they can be handled separately later.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 198 +++++++++++++++++++++++++-----------
 1 file changed, 140 insertions(+), 58 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index a9bbad29ad4f..14597428ed05 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -685,7 +685,10 @@ struct scarlett2_data {
 	u8 sync_updated;
 	u8 vol_updated;
 	u8 dim_mute_updated;
-	u8 input_other_updated;
+	u8 input_level_updated;
+	u8 input_pad_updated;
+	u8 input_air_updated;
+	u8 input_phantom_updated;
 	u8 monitor_other_updated;
 	u8 mux_updated;
 	u8 speaker_switching_switched;
@@ -2687,57 +2690,20 @@ static const struct snd_kcontrol_new scarlett2_sw_hw_enum_ctl = {
 
 /*** Line Level/Instrument Level Switch Controls ***/
 
-static int scarlett2_update_input_other(struct usb_mixer_interface *mixer)
+static int scarlett2_update_input_level(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
 
-	private->input_other_updated = 0;
+	private->input_level_updated = 0;
 
-	if (info->level_input_count) {
-		int err = scarlett2_usb_get_config(
-			mixer, SCARLETT2_CONFIG_LEVEL_SWITCH,
-			info->level_input_count + info->level_input_first,
-			private->level_switch);
-		if (err < 0)
-			return err;
-	}
-
-	if (info->pad_input_count) {
-		int err = scarlett2_usb_get_config(
-			mixer, SCARLETT2_CONFIG_PAD_SWITCH,
-			info->pad_input_count, private->pad_switch);
-		if (err < 0)
-			return err;
-	}
-
-	if (info->air_input_count) {
-		int err = scarlett2_usb_get_config(
-			mixer, SCARLETT2_CONFIG_AIR_SWITCH,
-			info->air_input_count, private->air_switch);
-		if (err < 0)
-			return err;
-	}
-
-	if (info->phantom_count) {
-		int err = scarlett2_usb_get_config(
-			mixer, SCARLETT2_CONFIG_PHANTOM_SWITCH,
-			info->phantom_count, private->phantom_switch);
-		if (err < 0)
-			return err;
-
-		if (scarlett2_has_config_item(
-				private,
-				SCARLETT2_CONFIG_PHANTOM_PERSISTENCE)) {
-			err = scarlett2_usb_get_config(
-				mixer, SCARLETT2_CONFIG_PHANTOM_PERSISTENCE,
-				1, &private->phantom_persistence);
-			if (err < 0)
-				return err;
-		}
-	}
+	if (!info->level_input_count)
+		return 0;
 
-	return 0;
+	return scarlett2_usb_get_config(
+		mixer, SCARLETT2_CONFIG_LEVEL_SWITCH,
+		info->level_input_count + info->level_input_first,
+		private->level_switch);
 }
 
 static int scarlett2_level_enum_ctl_info(struct snd_kcontrol *kctl,
@@ -2768,8 +2734,8 @@ static int scarlett2_level_enum_ctl_get(struct snd_kcontrol *kctl,
 		goto unlock;
 	}
 
-	if (private->input_other_updated) {
-		err = scarlett2_update_input_other(mixer);
+	if (private->input_level_updated) {
+		err = scarlett2_update_input_level(mixer);
 		if (err < 0)
 			goto unlock;
 	}
@@ -2827,6 +2793,21 @@ static const struct snd_kcontrol_new scarlett2_level_enum_ctl = {
 
 /*** Pad Switch Controls ***/
 
+static int scarlett2_update_input_pad(struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_device_info *info = private->info;
+
+	private->input_pad_updated = 0;
+
+	if (!info->pad_input_count)
+		return 0;
+
+	return scarlett2_usb_get_config(
+		mixer, SCARLETT2_CONFIG_PAD_SWITCH,
+		info->pad_input_count, private->pad_switch);
+}
+
 static int scarlett2_pad_ctl_get(struct snd_kcontrol *kctl,
 				 struct snd_ctl_elem_value *ucontrol)
 {
@@ -2842,8 +2823,8 @@ static int scarlett2_pad_ctl_get(struct snd_kcontrol *kctl,
 		goto unlock;
 	}
 
-	if (private->input_other_updated) {
-		err = scarlett2_update_input_other(mixer);
+	if (private->input_pad_updated) {
+		err = scarlett2_update_input_pad(mixer);
 		if (err < 0)
 			goto unlock;
 	}
@@ -2901,6 +2882,21 @@ static const struct snd_kcontrol_new scarlett2_pad_ctl = {
 
 /*** Air Switch Controls ***/
 
+static int scarlett2_update_input_air(struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_device_info *info = private->info;
+
+	private->input_air_updated = 0;
+
+	if (!info->air_input_count)
+		return 0;
+
+	return scarlett2_usb_get_config(
+		mixer, SCARLETT2_CONFIG_AIR_SWITCH,
+		info->air_input_count, private->air_switch);
+}
+
 static int scarlett2_air_ctl_get(struct snd_kcontrol *kctl,
 				 struct snd_ctl_elem_value *ucontrol)
 {
@@ -2916,8 +2912,8 @@ static int scarlett2_air_ctl_get(struct snd_kcontrol *kctl,
 		goto unlock;
 	}
 
-	if (private->input_other_updated) {
-		err = scarlett2_update_input_other(mixer);
+	if (private->input_air_updated) {
+		err = scarlett2_update_input_air(mixer);
 		if (err < 0)
 			goto unlock;
 	}
@@ -2974,6 +2970,35 @@ static const struct snd_kcontrol_new scarlett2_air_ctl = {
 
 /*** Phantom Switch Controls ***/
 
+static int scarlett2_update_input_phantom(struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_device_info *info = private->info;
+	int err;
+
+	private->input_phantom_updated = 0;
+
+	if (!info->phantom_count)
+		return 0;
+
+	err = scarlett2_usb_get_config(
+		mixer, SCARLETT2_CONFIG_PHANTOM_SWITCH,
+		info->phantom_count, private->phantom_switch);
+	if (err < 0)
+		return err;
+
+	if (scarlett2_has_config_item(private,
+				      SCARLETT2_CONFIG_PHANTOM_PERSISTENCE)) {
+		err = scarlett2_usb_get_config(
+			mixer, SCARLETT2_CONFIG_PHANTOM_PERSISTENCE,
+			1, &private->phantom_persistence);
+		if (err < 0)
+			return err;
+	}
+
+	return 0;
+}
+
 static int scarlett2_phantom_ctl_get(struct snd_kcontrol *kctl,
 				     struct snd_ctl_elem_value *ucontrol)
 {
@@ -2989,8 +3014,8 @@ static int scarlett2_phantom_ctl_get(struct snd_kcontrol *kctl,
 		goto unlock;
 	}
 
-	if (private->input_other_updated) {
-		err = scarlett2_update_input_other(mixer);
+	if (private->input_phantom_updated) {
+		err = scarlett2_update_input_phantom(mixer);
 		if (err < 0)
 			goto unlock;
 	}
@@ -4598,7 +4623,19 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 			return 0;
 	}
 
-	err = scarlett2_update_input_other(mixer);
+	err = scarlett2_update_input_level(mixer);
+	if (err < 0)
+		return err;
+
+	err = scarlett2_update_input_pad(mixer);
+	if (err < 0)
+		return err;
+
+	err = scarlett2_update_input_air(mixer);
+	if (err < 0)
+		return err;
+
+	err = scarlett2_update_input_phantom(mixer);
 	if (err < 0)
 		return err;
 
@@ -4737,30 +4774,75 @@ static void scarlett2_notify_dim_mute(struct usb_mixer_interface *mixer)
 				       &private->mute_ctls[i]->id);
 }
 
-/* Notify on "input other" change (level/pad/air) */
-static void scarlett2_notify_input_other(struct usb_mixer_interface *mixer)
+/* Notify on input level switch change */
+static void scarlett2_notify_input_level(struct usb_mixer_interface *mixer)
 {
 	struct snd_card *card = mixer->chip->card;
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
 	int i;
 
-	private->input_other_updated = 1;
+	private->input_level_updated = 1;
 
 	for (i = 0; i < info->level_input_count; i++)
 		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
 			       &private->level_ctls[i]->id);
+}
+
+/* Notify on input pad switch change */
+static void scarlett2_notify_input_pad(struct usb_mixer_interface *mixer)
+{
+	struct snd_card *card = mixer->chip->card;
+	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_device_info *info = private->info;
+	int i;
+
+	private->input_pad_updated = 1;
+
 	for (i = 0; i < info->pad_input_count; i++)
 		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
 			       &private->pad_ctls[i]->id);
+}
+
+/* Notify on input air switch change */
+static void scarlett2_notify_input_air(struct usb_mixer_interface *mixer)
+{
+	struct snd_card *card = mixer->chip->card;
+	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_device_info *info = private->info;
+	int i;
+
+	private->input_air_updated = 1;
+
 	for (i = 0; i < info->air_input_count; i++)
 		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
 			       &private->air_ctls[i]->id);
+}
+
+/* Notify on input phantom switch change */
+static void scarlett2_notify_input_phantom(struct usb_mixer_interface *mixer)
+{
+	struct snd_card *card = mixer->chip->card;
+	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_device_info *info = private->info;
+	int i;
+
+	private->input_phantom_updated = 1;
+
 	for (i = 0; i < info->phantom_count; i++)
 		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
 			       &private->phantom_ctls[i]->id);
 }
 
+/* Notify on "input other" change (level/pad/air/phantom) */
+static void scarlett2_notify_input_other(struct usb_mixer_interface *mixer)
+{
+	scarlett2_notify_input_level(mixer);
+	scarlett2_notify_input_pad(mixer);
+	scarlett2_notify_input_air(mixer);
+	scarlett2_notify_input_phantom(mixer);
+}
+
 /* Notify on "monitor other" change (direct monitor, speaker
  * switching, talkback)
  */
-- 
2.43.0

