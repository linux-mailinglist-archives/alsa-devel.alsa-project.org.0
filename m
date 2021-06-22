Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C5F3B0B19
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Jun 2021 19:06:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFA5815E2;
	Tue, 22 Jun 2021 19:06:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFA5815E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624381618;
	bh=Cc9KT2WY2cGEPBwuA7xKDFlK6aTN+Dm+jv1v454vW+4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YacF+M2+PHLrWLdFsLTY5/bOaOhfWqnHJDQrqeqBHHwf8Z/rOw4IXs9VxsgchKHgp
	 XJfkvoyT8YpLpxcN36U9ISnOnJVKYW1L9NOVsP7jmU7ZTqFVgewtb0Sjvogd/7fuwS
	 kB0WNNDOmokrgN+VIaWbLm9i7AtonlOL8xR53iWg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B447CF80517;
	Tue, 22 Jun 2021 19:03:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82D07F804E2; Tue, 22 Jun 2021 19:03:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC41CF804D9
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 19:03:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC41CF804D9
Received: by m.b4.vu (Postfix, from userid 1000)
 id 766DC61E286E; Wed, 23 Jun 2021 02:33:36 +0930 (ACST)
Date: Wed, 23 Jun 2021 02:33:36 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 12/17] ALSA: usb-audio: scarlett2: Split up
 sw_hw_enum_ctl_put()
Message-ID: <f2cf91841ba067b490e7709bc4b14f4532b4ddd5.1624379707.git.g@b4.vu>
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

Split part of scarlett2_sw_hw_enum_ctl_put() out into
scarlett2_sw_hw_change() so that the code which actually makes the
change is available in its own function. This will be used by the
speaker switching support which needs to set the SW/HW switch to HW
when speaker switching is enabled.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 46 ++++++++++++++++++++-------------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 59c9147c5cb5..37e35016db12 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -1904,23 +1904,12 @@ static void scarlett2_vol_ctl_set_writable(struct usb_mixer_interface *mixer,
 		       &private->mute_ctls[index]->id);
 }
 
-static int scarlett2_sw_hw_enum_ctl_put(struct snd_kcontrol *kctl,
-					struct snd_ctl_elem_value *ucontrol)
+static int scarlett2_sw_hw_change(struct usb_mixer_interface *mixer,
+				  int ctl_index, int val)
 {
-	struct usb_mixer_elem_info *elem = kctl->private_data;
-	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	int ctl_index = elem->control;
 	int index = line_out_remap(private, ctl_index);
-	int oval, val, err = 0;
-
-	mutex_lock(&private->data_mutex);
-
-	oval = private->vol_sw_hw_switch[index];
-	val = !!ucontrol->value.enumerated.item[0];
-
-	if (oval == val)
-		goto unlock;
+	int err;
 
 	private->vol_sw_hw_switch[index] = val;
 
@@ -1938,18 +1927,39 @@ static int scarlett2_sw_hw_enum_ctl_put(struct snd_kcontrol *kctl,
 		mixer, SCARLETT2_CONFIG_LINE_OUT_VOLUME,
 		index, private->master_vol - SCARLETT2_VOLUME_BIAS);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	/* Set SW mute to current HW mute */
 	err = scarlett2_usb_set_config(
 		mixer, SCARLETT2_CONFIG_MUTE_SWITCH,
 		index, private->dim_mute[SCARLETT2_BUTTON_MUTE]);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	/* Send SW/HW switch change to the device */
-	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_SW_HW_SWITCH,
-				       index, val);
+	return scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_SW_HW_SWITCH,
+					index, val);
+}
+
+static int scarlett2_sw_hw_enum_ctl_put(struct snd_kcontrol *kctl,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
+	int ctl_index = elem->control;
+	int index = line_out_remap(private, ctl_index);
+	int oval, val, err = 0;
+
+	mutex_lock(&private->data_mutex);
+
+	oval = private->vol_sw_hw_switch[index];
+	val = !!ucontrol->value.enumerated.item[0];
+
+	if (oval == val)
+		goto unlock;
+
+	err = scarlett2_sw_hw_change(mixer, ctl_index, val);
 	if (err == 0)
 		err = 1;
 
-- 
2.31.1

