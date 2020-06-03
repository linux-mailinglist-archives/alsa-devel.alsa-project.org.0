Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E17B81ED390
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jun 2020 17:39:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96C061675;
	Wed,  3 Jun 2020 17:39:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96C061675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591198791;
	bh=2snlq0cxZ8iQD2X1xm5OuJ+TZ+Z3SU4BlQvn/tXn+WM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SDkxRP+htN8lMUAVL/IgPxA9b0RbcVp3IPUnWzQh8kbCqDsq2/CbkmrZgZcMh4spg
	 CKKJ7zPdZPrhQwaTH2gxm2/uMeYliqVtwRrURj+5BrWc8ixbCYO3e0bYxMBr1vhf4w
	 M0J8zsT8qJZATR4yrvaEsjbc85FLUrT0dOeTmBLo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15BB0F8027C;
	Wed,  3 Jun 2020 17:37:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B684AF80212; Wed,  3 Jun 2020 17:37:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BCDDF800D0
 for <alsa-devel@alsa-project.org>; Wed,  3 Jun 2020 17:37:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BCDDF800D0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 48BA7B12D;
 Wed,  3 Jun 2020 15:37:15 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: usb-audio: Manage auto-pm of all bundled interfaces
Date: Wed,  3 Jun 2020 17:37:09 +0200
Message-Id: <20200603153709.6293-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200603153709.6293-1-tiwai@suse.de>
References: <20200603153709.6293-1-tiwai@suse.de>
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

Currently USB-audio driver manages the auto-pm of the primary
interface although a card may consist of multiple interfaces.
This may leave the secondary and other interfaces left running
unnecessarily after the auto-suspend.

This patch allows the driver managing the auto-pm of all bundled
interfaces per card.  The chip->pm_intf field is extended as
chip->intf[] to contain the array of assigned interfaces, and the
runtime-PM is performed to all those interfaces.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.c     | 35 ++++++++++++++++++++++++++++++-----
 sound/usb/usbaudio.h |  4 +++-
 2 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 359f7a04be1c..f648587d2342 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -634,7 +634,6 @@ static int usb_audio_probe(struct usb_interface *intf,
 								   id, &chip);
 					if (err < 0)
 						goto __error;
-					chip->pm_intf = intf;
 					break;
 				} else if (vid[i] != -1 || pid[i] != -1) {
 					dev_info(&dev->dev,
@@ -651,6 +650,13 @@ static int usb_audio_probe(struct usb_interface *intf,
 			goto __error;
 		}
 	}
+
+	if (chip->num_interfaces >= MAX_CARD_INTERFACES) {
+		dev_info(&dev->dev, "Too many interfaces assigned to the single USB-audio card\n");
+		err = -EINVAL;
+		goto __error;
+	}
+
 	dev_set_drvdata(&dev->dev, chip);
 
 	/*
@@ -703,6 +709,7 @@ static int usb_audio_probe(struct usb_interface *intf,
 	}
 
 	usb_chip[chip->index] = chip;
+	chip->intf[chip->num_interfaces] = intf;
 	chip->num_interfaces++;
 	usb_set_intfdata(intf, chip);
 	atomic_dec(&chip->active);
@@ -818,19 +825,37 @@ void snd_usb_unlock_shutdown(struct snd_usb_audio *chip)
 
 int snd_usb_autoresume(struct snd_usb_audio *chip)
 {
+	int i, err;
+
 	if (atomic_read(&chip->shutdown))
 		return -EIO;
-	if (atomic_inc_return(&chip->active) == 1)
-		return usb_autopm_get_interface(chip->pm_intf);
+	if (atomic_inc_return(&chip->active) != 1)
+		return 0;
+
+	for (i = 0; i < chip->num_interfaces; i++) {
+		err = usb_autopm_get_interface(chip->intf[i]);
+		if (err < 0) {
+			/* rollback */
+			while (--i >= 0)
+				usb_autopm_put_interface(chip->intf[i]);
+			atomic_dec(&chip->active))
+			return err;
+		}
+	}
 	return 0;
 }
 
 void snd_usb_autosuspend(struct snd_usb_audio *chip)
 {
+	int i;
+
 	if (atomic_read(&chip->shutdown))
 		return;
-	if (atomic_dec_and_test(&chip->active))
-		usb_autopm_put_interface(chip->pm_intf);
+	if (!atomic_dec_and_test(&chip->active))
+		return;
+
+	for (i = 0; i < chip->num_interfaces; i++)
+		usb_autopm_put_interface(chip->intf[i]);
 }
 
 static int usb_audio_suspend(struct usb_interface *intf, pm_message_t message)
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index e0ebfb25fbd5..b91c4c0807ec 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -19,11 +19,13 @@
 struct media_device;
 struct media_intf_devnode;
 
+#define MAX_CARD_INTERFACES	16
+
 struct snd_usb_audio {
 	int index;
 	struct usb_device *dev;
 	struct snd_card *card;
-	struct usb_interface *pm_intf;
+	struct usb_interface *intf[MAX_CARD_INTERFACES];
 	u32 usb_id;
 	struct mutex mutex;
 	unsigned int system_suspend;
-- 
2.25.0

