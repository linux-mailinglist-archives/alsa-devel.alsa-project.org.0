Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 543581925C4
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 11:37:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBC4D1664;
	Wed, 25 Mar 2020 11:36:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBC4D1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585132639;
	bh=ZhmWMHf/+4q0HUlZQ5Wc4ndRMhlSxFS+NfUdwnZnPcw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AtVJdBJCjLrlvFaIDYYjJxafoKX8yx6y7v1SE57he2ei/Z+DtCvWXuh9iBZwOu2tK
	 b8YYTbHDSB9kJ4e9L3MHCMwbiAhrxxD0Z7rMnDt8wgBVUuihvV95wNeAuiNKkEkqmR
	 3I9SbJ/OUCcBQWEZaN++6btenhvVB0qBAhXZeS4s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C668EF80290;
	Wed, 25 Mar 2020 11:34:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99B9EF80095; Wed, 25 Mar 2020 11:33:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B3FDF801DA
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 11:33:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B3FDF801DA
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 893BFACCA
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 10:33:25 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/4] ALSA: usb-audio: Inform devices that need delayed
 registration
Date: Wed, 25 Mar 2020 11:33:21 +0100
Message-Id: <20200325103322.2508-4-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200325103322.2508-1-tiwai@suse.de>
References: <20200325103322.2508-1-tiwai@suse.de>
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

The USB-audio driver may call snd_card_register() multiple times as
its probe function is per USB interface while some USB-audio devices
may provide multiple interfaces to assign different streams although
they belong to the same device.  This works in most cases but the
registration is racy, hence it may miss the device recognition,
e.g. PA doesn't see certain devices when hotplugged.

The recent addition of the delayed registration quirk allows to sync
the registration at the last known interface, and the previous commit
added a new module option to allow the dynamic setup for that
purpose.

Now, this patch tries to find out and notifies for such devices that
require the delayed registration.  It shows a message like:

  Found post-registration device assignment: 1234abcd:02

If you hit this message, you can pass delayed_register module option
like:

  snd_usb_audio.delayed_register=1234abcd:02

by just copying the last shown entry.  If this works, it can be added
statically in the quirk list, registration_quirks[] found at the end
of sound/usb/quirks.c.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.c     | 7 +++++++
 sound/usb/stream.c   | 3 +++
 sound/usb/usbaudio.h | 1 +
 3 files changed, 11 insertions(+)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 951134238669..fd6fd1726ea0 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -680,6 +680,13 @@ static int usb_audio_probe(struct usb_interface *intf,
 			goto __error;
 	}
 
+	if (chip->need_delayed_register) {
+		dev_info(&dev->dev,
+			 "Found post-registration device assignment: %08x:%02x\n",
+			 chip->usb_id, ifnum);
+		chip->need_delayed_register = false; /* clear again */
+	}
+
 	/* we are allowed to call snd_card_register() many times, but first
 	 * check to see if a device needs to skip it or do anything special
 	 */
diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index afd5aa574611..15296f2c902c 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -502,6 +502,9 @@ static int __snd_usb_add_audio_stream(struct snd_usb_audio *chip,
 		subs = &as->substream[stream];
 		if (subs->ep_num)
 			continue;
+		if (snd_device_get_state(chip->card, as->pcm) !=
+		    SNDRV_DEV_BUILD)
+			chip->need_delayed_register = true;
 		err = snd_pcm_new_stream(as->pcm, stream, 1);
 		if (err < 0)
 			return err;
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 6fe3ab582ec6..1c892c7f14d7 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -34,6 +34,7 @@ struct snd_usb_audio {
 	unsigned int txfr_quirk:1; /* Subframe boundaries on transfers */
 	unsigned int tx_length_quirk:1; /* Put length specifier in transfers */
 	unsigned int setup_fmt_after_resume_quirk:1; /* setup the format to interface after resume */
+	unsigned int need_delayed_register:1; /* warn for delayed registration */
 	int num_interfaces;
 	int num_suspended_intf;
 	int sample_rate_read_error;
-- 
2.16.4

