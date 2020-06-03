Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6171ED38E
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jun 2020 17:39:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97C391663;
	Wed,  3 Jun 2020 17:38:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97C391663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591198744;
	bh=2F+YfoDdmq54QoMwwOJmsg1z9XwM1fYOwRbkdLeO83g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YG3/mpIXjqioyUcZhuIDAPWEivAOFNah1QC9/Zb5tc7nBd3Z07YV/EdugHR6Do0Mu
	 9igtHLZlWDjQli2W7dNDaafG2IcwUu2N49Zh7hghknTgqwdD/EDmUV0oD8qbyiizo5
	 hBXUiOpf9AjIoCW/luzq4xinQHHRY335EXJfDiNc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D08D1F801F5;
	Wed,  3 Jun 2020 17:37:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9A2BF8013D; Wed,  3 Jun 2020 17:37:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F666F801EC
 for <alsa-devel@alsa-project.org>; Wed,  3 Jun 2020 17:37:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F666F801EC
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 45A0CB12A;
 Wed,  3 Jun 2020 15:37:15 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ALSA: usb-audio: Fix inconsistent card PM state after
 resume
Date: Wed,  3 Jun 2020 17:37:08 +0200
Message-Id: <20200603153709.6293-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Macpaul Lin <macpaul.lin@mediatek.com>
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

When a USB-audio interface gets runtime-suspended via auto-pm feature,
the driver suspends all functionality and increment
chip->num_suspended_intf.  Later on, when the system gets suspended to
S3, the driver increments chip->num_suspended_intf again, skips the
device changes, and sets the card power state to
SNDRV_CTL_POWER_D3hot.  In return, when the system gets resumed from
S3, the resume callback decrements chip->num_suspended_intf.  Since
this refcount is still not zero (it's been runtime-suspended), the
whole resume is skipped.  But there is a small pitfall here.

The problem is that the driver doesn't restore the card power state
after this resume call, leaving it as SNDRV_CTL_POWER_D3hot.  So,
even after the system resume finishes, the card instance still appears
as if it were system-suspended, and this confuses many ioctl accesses
that are blocked unexpectedly.

In details, we have two issues behind the scene: one is that the card
power state is changed only when the refcount becomes zero, and
another is that the prior auto-suspend check is kept in a boolean
flag.  Although the latter problem is almost negligible since the
auto-pm feature is imposed only on the primary interface, but this can
be a potential problem on the devices with multiple interfaces.

This patch addresses those issues by the following:

- Replace chip->autosuspended boolean flag with chip->system_suspend
  counter

- At the first system-suspend, chip->num_suspended_intf is recorded to
  chip->system_suspend

- At system-resume, the card power state is restored when the
  chip->num_suspended_intf refcount reaches to chip->system_suspend,
  i.e. the state returns to the auto-suspended

Also, the patch fixes yet another hidden problem by the code
refactoring along with the fixes above: namely, when some resume
procedure failed, the driver left chip->num_suspended_intf that was
already decreased, and it might lead to the refcount unbalance.
In the new code, the refcount decrement is done after the whole resume
procedure, and the problem is avoided as well.

Fixes: 0662292aec05 ("ALSA: usb-audio: Handle normal and auto-suspend equally")
Reported-and-tested-by: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.c     | 19 ++++++++++++-------
 sound/usb/usbaudio.h |  2 +-
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index fd6fd1726ea0..359f7a04be1c 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -843,9 +843,6 @@ static int usb_audio_suspend(struct usb_interface *intf, pm_message_t message)
 	if (chip == (void *)-1L)
 		return 0;
 
-	chip->autosuspended = !!PMSG_IS_AUTO(message);
-	if (!chip->autosuspended)
-		snd_power_change_state(chip->card, SNDRV_CTL_POWER_D3hot);
 	if (!chip->num_suspended_intf++) {
 		list_for_each_entry(as, &chip->pcm_list, list) {
 			snd_usb_pcm_suspend(as);
@@ -858,6 +855,11 @@ static int usb_audio_suspend(struct usb_interface *intf, pm_message_t message)
 			snd_usb_mixer_suspend(mixer);
 	}
 
+	if (!PMSG_IS_AUTO(message) && !chip->system_suspend) {
+		snd_power_change_state(chip->card, SNDRV_CTL_POWER_D3hot);
+		chip->system_suspend = chip->num_suspended_intf;
+	}
+
 	return 0;
 }
 
@@ -871,10 +873,10 @@ static int __usb_audio_resume(struct usb_interface *intf, bool reset_resume)
 
 	if (chip == (void *)-1L)
 		return 0;
-	if (--chip->num_suspended_intf)
-		return 0;
 
 	atomic_inc(&chip->active); /* avoid autopm */
+	if (chip->num_suspended_intf > 1)
+		goto out;
 
 	list_for_each_entry(as, &chip->pcm_list, list) {
 		err = snd_usb_pcm_resume(as);
@@ -896,9 +898,12 @@ static int __usb_audio_resume(struct usb_interface *intf, bool reset_resume)
 		snd_usbmidi_resume(p);
 	}
 
-	if (!chip->autosuspended)
+ out:
+	if (chip->num_suspended_intf == chip->system_suspend) {
 		snd_power_change_state(chip->card, SNDRV_CTL_POWER_D0);
-	chip->autosuspended = 0;
+		chip->system_suspend = 0;
+	}
+	chip->num_suspended_intf--;
 
 err_out:
 	atomic_dec(&chip->active); /* allow autopm after this point */
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 1c892c7f14d7..e0ebfb25fbd5 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -26,7 +26,7 @@ struct snd_usb_audio {
 	struct usb_interface *pm_intf;
 	u32 usb_id;
 	struct mutex mutex;
-	unsigned int autosuspended:1;	
+	unsigned int system_suspend;
 	atomic_t active;
 	atomic_t shutdown;
 	atomic_t usage_count;
-- 
2.25.0

