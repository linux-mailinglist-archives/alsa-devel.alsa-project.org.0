Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 962C33ADF7D
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Jun 2021 18:50:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21A2416D2;
	Sun, 20 Jun 2021 18:49:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21A2416D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624207849;
	bh=u8BY7hOnV4NnlXb93viCl3AnJS4Es0GhnGnw5TfrQ+k=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qogPnRW0kaGPEzuOtQvpXF/b65+t8QvXPlIKdIKpA6SB4GR4KZg+7Fhz2phYpSbNJ
	 jBstiXYzFHzapiLP2pb1Ev38O11RDABTPx42PBiMuEH6f3sLJinBcLNd6pgSj6c8Vd
	 zaPnPf61b3IlPR3Hm93BrZ4TYJo4JdyR2UU0sDhM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB79BF80508;
	Sun, 20 Jun 2021 18:46:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 873CFF804D2; Sun, 20 Jun 2021 18:46:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC545F804C2
 for <alsa-devel@alsa-project.org>; Sun, 20 Jun 2021 18:46:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC545F804C2
Received: by m.b4.vu (Postfix, from userid 1000)
 id 3426061E287B; Mon, 21 Jun 2021 02:16:34 +0930 (ACST)
Date: Mon, 21 Jun 2021 02:16:34 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 06/14] ALSA: usb-audio: scarlett2: Remove redundant
 info->button_count
Message-ID: <20210620164634.GA9193@m.b4.vu>
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

The per-model button_count value was used to determine whether
dim/mute controls should be added, but these are present iff
line_out_hw_vol is true. Remove button_count and replace with
SCARLETT2_BUTTON_MAX and a check for line_out_hw_vol true.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 41 ++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 3225ec709d98..043b0929ad9d 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -218,7 +218,6 @@ struct scarlett2_ports {
 
 struct scarlett2_device_info {
 	u8 line_out_hw_vol; /* line out hw volume is sw controlled */
-	u8 button_count; /* number of buttons */
 	u8 level_input_count; /* inputs with level selectable */
 	u8 pad_input_count; /* inputs with pad selectable */
 	const char * const line_out_descrs[SCARLETT2_ANALOGUE_MAX];
@@ -370,9 +369,6 @@ static const struct scarlett2_device_info s18i20_gen2_info = {
 	 */
 	.line_out_hw_vol = 1,
 
-	/* Mute and dim buttons */
-	.button_count = 2,
-
 	.line_out_descrs = {
 		"Monitor L",
 		"Monitor R",
@@ -1108,7 +1104,8 @@ static int scarlett2_add_new_ctl(struct usb_mixer_interface *mixer,
 static int scarlett2_update_volumes(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_mixer_data *private = mixer->private_data;
-	const struct scarlett2_ports *ports = private->info->ports;
+	const struct scarlett2_device_info *info = private->info;
+	const struct scarlett2_ports *ports = info->ports;
 	struct scarlett2_usb_volume_status volume_status;
 	int num_line_out =
 		ports[SCARLETT2_PORT_TYPE_ANALOGUE].num[SCARLETT2_PORT_OUT];
@@ -1129,8 +1126,9 @@ static int scarlett2_update_volumes(struct usb_mixer_interface *mixer)
 			private->vol[i] = private->master_vol;
 	}
 
-	for (i = 0; i < private->info->button_count; i++)
-		private->buttons[i] = !!volume_status.buttons[i];
+	if (info->line_out_hw_vol)
+		for (i = 0; i < SCARLETT2_BUTTON_MAX; i++)
+			private->buttons[i] = !!volume_status.buttons[i];
 
 	return 0;
 }
@@ -1547,13 +1545,15 @@ static int scarlett2_add_line_out_ctls(struct usb_mixer_interface *mixer)
 	}
 
 	/* Add HW button controls */
-	for (i = 0; i < private->info->button_count; i++) {
-		err = scarlett2_add_new_ctl(mixer, &scarlett2_button_ctl,
-					    i, 1, scarlett2_button_names[i],
-					    &private->button_ctls[i]);
-		if (err < 0)
-			return err;
-	}
+	if (info->line_out_hw_vol)
+		for (i = 0; i < SCARLETT2_BUTTON_MAX; i++) {
+			err = scarlett2_add_new_ctl(
+				mixer, &scarlett2_button_ctl,
+				i, 1, scarlett2_button_names[i],
+				&private->button_ctls[i]);
+			if (err < 0)
+				return err;
+		}
 
 	return 0;
 }
@@ -1961,8 +1961,9 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 		private->vol[i] = volume;
 	}
 
-	for (i = 0; i < info->button_count; i++)
-		private->buttons[i] = !!volume_status.buttons[i];
+	if (info->line_out_hw_vol)
+		for (i = 0; i < SCARLETT2_BUTTON_MAX; i++)
+			private->buttons[i] = !!volume_status.buttons[i];
 
 	for (i = 0; i < num_mixer_out; i++) {
 		err = scarlett2_usb_get_mix(mixer, i);
@@ -2001,11 +2002,15 @@ static void scarlett2_mixer_interrupt_button_change(
 	struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_mixer_data *private = mixer->private_data;
+	const struct scarlett2_device_info *info = private->info;
 	int i;
 
 	private->vol_updated = 1;
 
-	for (i = 0; i < private->info->button_count; i++)
+	if (!info->line_out_hw_vol)
+		return;
+
+	for (i = 0; i < SCARLETT2_BUTTON_MAX; i++)
 		snd_ctl_notify(mixer->chip->card, SNDRV_CTL_EVENT_MASK_VALUE,
 			       &private->button_ctls[i]->id);
 }
@@ -2109,7 +2114,7 @@ static int snd_scarlett_gen2_controls_create(struct usb_mixer_interface *mixer,
 		return err;
 
 	/* Set up the interrupt polling if there are hardware buttons */
-	if (info->button_count) {
+	if (info->line_out_hw_vol) {
 		err = scarlett2_mixer_status_create(mixer);
 		if (err < 0)
 			return err;
-- 
2.31.1

