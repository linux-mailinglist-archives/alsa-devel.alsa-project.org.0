Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 370611925BD
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 11:36:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F96F1674;
	Wed, 25 Mar 2020 11:35:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F96F1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585132582;
	bh=r5kuFg5OndvFkihI2pfV/NatT/cNBi1vRe44y8aWtH4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rTc3qNEQrROaHvCLn0f+yQ9aN4ACkvIYfpyCSPPPLqo0jX/XZ5PN/GGXvuhooi9ru
	 0Hobalyz+8Sc+0b+WQP7lcx/6SqZpa0bhs5AgHORcs+sVQwXtHtn5Ym8NFhWETqL4W
	 cWRBCKb+u+j7OCfy/EyCbGJkMQal6mVtoYKYWRG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61D68F8025A;
	Wed, 25 Mar 2020 11:33:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58A72F80218; Wed, 25 Mar 2020 11:33:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8945F80095
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 11:33:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8945F80095
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7C5BCACC6
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 10:33:25 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/4] ALSA: usb-audio: Add delayed_register option
Date: Wed, 25 Mar 2020 11:33:20 +0100
Message-Id: <20200325103322.2508-3-tiwai@suse.de>
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

Add a new option for specifying the quirk for delayed registration of
the certain device.  A list of devices can be passed in a form
	ID:IFACE,ID:IFACE,ID:IFACE,....
where ID is the 32bit hex number combo of vendor and device IDs and
IFACE is the interface number to trigger the register.

When a matching device is probed, the card registration is delayed
until the given interface is probed.  It's needed for syncing the
registration until the last interface when multiple interfaces are
provided for the same card.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 55d563a8154d..951134238669 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -72,6 +72,7 @@ static int device_setup[SNDRV_CARDS]; /* device parameter for this card */
 static bool ignore_ctl_error;
 static bool autoclock = true;
 static char *quirk_alias[SNDRV_CARDS];
+static char *delayed_register[SNDRV_CARDS];
 
 bool snd_usb_use_vmalloc = true;
 bool snd_usb_skip_validation;
@@ -95,6 +96,8 @@ module_param(autoclock, bool, 0444);
 MODULE_PARM_DESC(autoclock, "Enable auto-clock selection for UAC2 devices (default: yes).");
 module_param_array(quirk_alias, charp, NULL, 0444);
 MODULE_PARM_DESC(quirk_alias, "Quirk aliases, e.g. 0123abcd:5678beef.");
+module_param_array(delayed_register, charp, NULL, 0444);
+MODULE_PARM_DESC(delayed_register, "Quirk for delayed registration, given by id:iface, e.g. 0123abcd:4.");
 module_param_named(use_vmalloc, snd_usb_use_vmalloc, bool, 0444);
 MODULE_PARM_DESC(use_vmalloc, "Use vmalloc for PCM intermediate buffers (default: yes).");
 module_param_named(skip_validation, snd_usb_skip_validation, bool, 0444);
@@ -525,6 +528,21 @@ static bool get_alias_id(struct usb_device *dev, unsigned int *id)
 	return false;
 }
 
+static bool check_delayed_register_option(struct snd_usb_audio *chip, int iface)
+{
+	int i;
+	unsigned int id, inum;
+
+	for (i = 0; i < ARRAY_SIZE(delayed_register); i++) {
+		if (delayed_register[i] &&
+		    sscanf(delayed_register[i], "%x:%x", &id, &inum) == 2 &&
+		    id == chip->usb_id)
+			return inum != iface;
+	}
+
+	return false;
+}
+
 static const struct usb_device_id usb_audio_ids[]; /* defined below */
 
 /* look for the corresponding quirk */
@@ -665,7 +683,8 @@ static int usb_audio_probe(struct usb_interface *intf,
 	/* we are allowed to call snd_card_register() many times, but first
 	 * check to see if a device needs to skip it or do anything special
 	 */
-	if (!snd_usb_registration_quirk(chip, ifnum)) {
+	if (!snd_usb_registration_quirk(chip, ifnum) &&
+	    !check_delayed_register_option(chip, ifnum)) {
 		err = snd_card_register(chip->card);
 		if (err < 0)
 			goto __error;
-- 
2.16.4

