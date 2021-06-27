Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7853B536C
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Jun 2021 15:24:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D13516AD;
	Sun, 27 Jun 2021 15:24:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D13516AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624800293;
	bh=ReuP+yyekGA9kTbbVYwjBumh3ZIBmSpAkompdgf56VM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UeanHBzMwBph5tvyMsaPmcxNFk0xePcpt7vQH8z8UH/n6zRcce+ISVjg4cGjrV/V6
	 SFdek29M82DXD6DT3Goj3b9CjQMeGF26gtzqAnKmjDy7+XfA7rsdVmNE8294g1VrUR
	 hi9/FSHlIxf0a4AZGHgqv2ADXGIScA9/yzePPzaE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AC83F804AE;
	Sun, 27 Jun 2021 15:23:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2888DF804D6; Sun, 27 Jun 2021 15:23:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A02C3F804AE
 for <alsa-devel@alsa-project.org>; Sun, 27 Jun 2021 15:22:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A02C3F804AE
Received: by m.b4.vu (Postfix, from userid 1000)
 id 2B40361E5F34; Sun, 27 Jun 2021 22:52:56 +0930 (ACST)
Date: Sun, 27 Jun 2021 22:52:56 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 2/2] ALSA: scarlett2: Fix scarlett2_*_ctl_put() return values
 again
Message-ID: <76643f7ac81aef93351122d07881e30d51dcb1b9.1624798436.git.g@b4.vu>
References: <cover.1624798436.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1624798436.git.g@b4.vu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Aaron Wolf <aaron@wolftune.com>,
 Hin-Tak Leung <htl10@users.sourceforge.net>,
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

Mixer control put callbacks should return 1 if the value is changed.
Fix the mute, air, phantom, direct monitor, speaker switch, talkback,
and MSD controls accordingly.

Fix scarlett2_speaker_switch_enable() to not ignore the return value
of scarlett2_sw_hw_change().

Reported-by: Aaron Wolf <aaron@wolftune.com>
Tested-by: Aaron Wolf <aaron@wolftune.com>
Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 38 +++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index a6387d5c1888..346551599dd6 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -1880,6 +1880,8 @@ static int scarlett2_mute_ctl_put(struct snd_kcontrol *kctl,
 	/* Send mute change to the device */
 	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_MUTE_SWITCH,
 				       index, val);
+	if (err == 0)
+		err = 1;
 
 unlock:
 	mutex_unlock(&private->data_mutex);
@@ -2246,6 +2248,8 @@ static int scarlett2_air_ctl_put(struct snd_kcontrol *kctl,
 	/* Send switch change to the device */
 	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_AIR_SWITCH,
 				       index, val);
+	if (err == 0)
+		err = 1;
 
 unlock:
 	mutex_unlock(&private->data_mutex);
@@ -2302,6 +2306,8 @@ static int scarlett2_phantom_ctl_put(struct snd_kcontrol *kctl,
 	/* Send switch change to the device */
 	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_PHANTOM_SWITCH,
 				       index, val);
+	if (err == 0)
+		err = 1;
 
 unlock:
 	mutex_unlock(&private->data_mutex);
@@ -2351,6 +2357,8 @@ static int scarlett2_phantom_persistence_ctl_put(
 	/* Send switch change to the device */
 	err = scarlett2_usb_set_config(
 		mixer, SCARLETT2_CONFIG_PHANTOM_PERSISTENCE, index, val);
+	if (err == 0)
+		err = 1;
 
 unlock:
 	mutex_unlock(&private->data_mutex);
@@ -2475,6 +2483,8 @@ static int scarlett2_direct_monitor_ctl_put(
 	/* Send switch change to the device */
 	err = scarlett2_usb_set_config(
 		mixer, SCARLETT2_CONFIG_DIRECT_MONITOR, index, val);
+	if (err == 0)
+		err = 1;
 
 unlock:
 	mutex_unlock(&private->data_mutex);
@@ -2556,18 +2566,21 @@ static int scarlett2_speaker_switch_enum_ctl_get(
 /* when speaker switching gets enabled, switch the main/alt speakers
  * to HW volume and disable those controls
  */
-static void scarlett2_speaker_switch_enable(struct usb_mixer_interface *mixer)
+static int scarlett2_speaker_switch_enable(struct usb_mixer_interface *mixer)
 {
 	struct snd_card *card = mixer->chip->card;
 	struct scarlett2_data *private = mixer->private_data;
-	int i;
+	int i, err;
 
 	for (i = 0; i < 4; i++) {
 		int index = line_out_remap(private, i);
 
 		/* switch the main/alt speakers to HW volume */
-		if (!private->vol_sw_hw_switch[index])
-			scarlett2_sw_hw_change(private->mixer, i, 1);
+		if (!private->vol_sw_hw_switch[index]) {
+			err = scarlett2_sw_hw_change(private->mixer, i, 1);
+			if (err < 0)
+				return err;
+		}
 
 		/* disable the line out SW/HW switch */
 		scarlett2_sw_hw_ctl_ro(private, i);
@@ -2579,6 +2592,8 @@ static void scarlett2_speaker_switch_enable(struct usb_mixer_interface *mixer)
 	 * configuration
 	 */
 	private->speaker_switching_switched = 1;
+
+	return 0;
 }
 
 /* when speaker switching gets disabled, reenable the hw/sw controls
@@ -2638,10 +2653,13 @@ static int scarlett2_speaker_switch_enum_ctl_put(
 
 	/* update controls if speaker switching gets enabled or disabled */
 	if (!oval && val)
-		scarlett2_speaker_switch_enable(mixer);
+		err = scarlett2_speaker_switch_enable(mixer);
 	else if (oval && !val)
 		scarlett2_speaker_switch_disable(mixer);
 
+	if (err == 0)
+		err = 1;
+
 unlock:
 	mutex_unlock(&private->data_mutex);
 	return err;
@@ -2728,8 +2746,8 @@ static int scarlett2_talkback_enum_ctl_put(
 	err = scarlett2_usb_set_config(
 		mixer, SCARLETT2_CONFIG_MONITOR_OTHER_SWITCH,
 		1, val == 2);
-	if (err < 0)
-		goto unlock;
+	if (err == 0)
+		err = 1;
 
 unlock:
 	mutex_unlock(&private->data_mutex);
@@ -2787,8 +2805,8 @@ static int scarlett2_talkback_map_ctl_put(
 	/* Send updated bitmap to the device */
 	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_TALKBACK_MAP,
 				       0, bitmap);
-	if (err < 0)
-		goto unlock;
+	if (err == 0)
+		err = 1;
 
 unlock:
 	mutex_unlock(&private->data_mutex);
@@ -3402,6 +3420,8 @@ static int scarlett2_msd_ctl_put(struct snd_kcontrol *kctl,
 	/* Send switch change to the device */
 	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_MSD_SWITCH,
 				       0, val);
+	if (err == 0)
+		err = 1;
 
 unlock:
 	mutex_unlock(&private->data_mutex);
-- 
2.31.1

