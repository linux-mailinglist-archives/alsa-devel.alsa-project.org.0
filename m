Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D543ADF81
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Jun 2021 18:52:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FACE16E7;
	Sun, 20 Jun 2021 18:51:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FACE16E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624207942;
	bh=5vKJiZ03YvH61CdgVreq/8kgSBWTd90ID6FNrq8HJy4=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qL6bix3qJqKvf0xrk02m2C8QsJpbta6nrTC0REY2ohzQmB+hW0XMK3kC/iEU1ezFf
	 fOYW0dXKbMJLzqCwm+X8nA6bQpzbgZp2H5qCWWe8bnpNitSftud9xAJWjrSjZ45dP5
	 YovOtg+6W+tzeiJYhZA6BgEil025gf5oiE5cTcFE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DEE46F80534;
	Sun, 20 Jun 2021 18:46:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96D03F804F2; Sun, 20 Jun 2021 18:46:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5307F804E3
 for <alsa-devel@alsa-project.org>; Sun, 20 Jun 2021 18:46:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5307F804E3
Received: by m.b4.vu (Postfix, from userid 1000)
 id 2C28761E5F1D; Mon, 21 Jun 2021 02:16:47 +0930 (ACST)
Date: Mon, 21 Jun 2021 02:16:47 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 12/14] ALSA: usb-audio: scarlett2: Fix union usage in mixer
 control callbacks
Message-ID: <20210620164647.GA9226@m.b4.vu>
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

Fix mixer control callbacks to use the correct members of the struct
snd_ctl_elem_value. The use of value.integer and value.enumerated were
swapped in a few places.

Update scarlett2_mux_src_enum_ctl_put() to use min() instead of
clamp() as value.enumerated.item is unsigned.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index fe142b7ddb32..49c4662531a3 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -1270,7 +1270,7 @@ static int scarlett2_sw_hw_enum_ctl_put(struct snd_kcontrol *kctl,
 	mutex_lock(&private->data_mutex);
 
 	oval = private->vol_sw_hw_switch[index];
-	val = !!ucontrol->value.integer.value[0];
+	val = !!ucontrol->value.enumerated.item[0];
 
 	if (oval == val)
 		goto unlock;
@@ -1356,7 +1356,7 @@ static int scarlett2_level_enum_ctl_put(struct snd_kcontrol *kctl,
 	mutex_lock(&private->data_mutex);
 
 	oval = private->level_switch[index];
-	val = !!ucontrol->value.integer.value[0];
+	val = !!ucontrol->value.enumerated.item[0];
 
 	if (oval == val)
 		goto unlock;
@@ -1390,7 +1390,7 @@ static int scarlett2_pad_ctl_get(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct scarlett2_data *private = elem->head.mixer->private_data;
 
-	ucontrol->value.enumerated.item[0] =
+	ucontrol->value.integer.value[0] =
 		private->pad_switch[elem->control];
 	return 0;
 }
@@ -1448,7 +1448,7 @@ static int scarlett2_dim_mute_ctl_get(struct snd_kcontrol *kctl,
 		scarlett2_update_volumes(mixer);
 	mutex_unlock(&private->data_mutex);
 
-	ucontrol->value.enumerated.item[0] = private->dim_mute[elem->control];
+	ucontrol->value.integer.value[0] = private->dim_mute[elem->control];
 	return 0;
 }
 
@@ -1748,8 +1748,8 @@ static int scarlett2_mux_src_enum_ctl_put(struct snd_kcontrol *kctl,
 	mutex_lock(&private->data_mutex);
 
 	oval = private->mux[index];
-	val = clamp(ucontrol->value.integer.value[0],
-		    0L, private->num_mux_srcs - 1L);
+	val = min(ucontrol->value.enumerated.item[0],
+		  private->num_mux_srcs - 1U);
 
 	if (oval == val)
 		goto unlock;
-- 
2.31.1

