Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5A33D2D7A
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 22:14:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FBAC16FF;
	Thu, 22 Jul 2021 22:14:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FBAC16FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626984895;
	bh=c5xyAHQT6Y0+GqNfw0y21z5Q6Ft03SSvB2r4RcD4Eco=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hb9NX+8rS2kglq6Kl4MZpZmQKib2L5XxQFgGagH082hsb3Ew5gS4mEKoU85V3WEGL
	 anv1HtxUIo9xHieWj/1Ra8A7vjD/nXCtRfEEkmPyLY/d7AGvD320HR/LpxFBtPgQ0h
	 Qg8KKJIn5tzOiNa5ypW33H6nm4ELn1ZsJQFGj6Sg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C8AEF80114;
	Thu, 22 Jul 2021 22:13:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6E64F80218; Thu, 22 Jul 2021 22:13:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D438F80218
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 22:13:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D438F80218
Received: by m.b4.vu (Postfix, from userid 1000)
 id F37E9611D167; Fri, 23 Jul 2021 05:43:26 +0930 (ACST)
Date: Fri, 23 Jul 2021 05:43:26 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 4/4] ALSA: scarlett2: Fix line out/speaker switching
 notifications
Message-ID: <8192e15ba62fa4bc90425c005f265c0de530be20.1626959758.git.g@b4.vu>
References: <cover.1626959758.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1626959758.git.g@b4.vu>
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

The values of the line output controls can change when the SW/HW
switches are set to HW, and also when speaker switching is enabled.
These notifications were sent with a mask of only
SNDRV_CTL_EVENT_MASK_INFO. Change the notifications to set the
SNDRV_CTL_EVENT_MASK_VALUE mask bit as well.

When the mute control is updated, the notification was sent with a
mask of SNDRV_CTL_EVENT_MASK_INFO. Change the mask to the correct
value of SNDRV_CTL_EVENT_MASK_VALUE.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 3457fbc8108f..573e4a190f28 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -1961,10 +1961,12 @@ static void scarlett2_vol_ctl_set_writable(struct usb_mixer_interface *mixer,
 			~SNDRV_CTL_ELEM_ACCESS_WRITE;
 	}
 
-	/* Notify of write bit change */
-	snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_INFO,
+	/* Notify of write bit and possible value change */
+	snd_ctl_notify(card,
+		       SNDRV_CTL_EVENT_MASK_VALUE | SNDRV_CTL_EVENT_MASK_INFO,
 		       &private->vol_ctls[index]->id);
-	snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_INFO,
+	snd_ctl_notify(card,
+		       SNDRV_CTL_EVENT_MASK_VALUE | SNDRV_CTL_EVENT_MASK_INFO,
 		       &private->mute_ctls[index]->id);
 }
 
@@ -2599,7 +2601,9 @@ static int scarlett2_speaker_switch_enable(struct usb_mixer_interface *mixer)
 
 		/* disable the line out SW/HW switch */
 		scarlett2_sw_hw_ctl_ro(private, i);
-		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_INFO,
+		snd_ctl_notify(card,
+			       SNDRV_CTL_EVENT_MASK_VALUE |
+				 SNDRV_CTL_EVENT_MASK_INFO,
 			       &private->sw_hw_ctls[i]->id);
 	}
 
@@ -2923,7 +2927,7 @@ static int scarlett2_dim_mute_ctl_put(struct snd_kcontrol *kctl,
 			if (private->vol_sw_hw_switch[line_index]) {
 				private->mute_switch[line_index] = val;
 				snd_ctl_notify(mixer->chip->card,
-					       SNDRV_CTL_EVENT_MASK_INFO,
+					       SNDRV_CTL_EVENT_MASK_VALUE,
 					       &private->mute_ctls[i]->id);
 			}
 		}
-- 
2.31.1

