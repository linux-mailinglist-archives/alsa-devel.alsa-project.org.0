Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1821925B6
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 11:35:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92E25166A;
	Wed, 25 Mar 2020 11:34:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92E25166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585132538;
	bh=mXvtwpAwxltXeTQDd++459ShvjZ5eBwR0cq1ucQfv/8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u4eX+VcZRuxpc7YwBzB8IKAXPByHtHCYX6KMoazwv22Sy3w/ATzUlYL61mygIGE5h
	 fX8g9fdq+GCyT7kn0K6ghele67TD1WcImjqq+9o/wo/9P+5QJK5woFUM2CBM+S/I0w
	 EzFBMOUSPyHTGBfBiaD512F2ufEpWwy02KBNKcKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B97FF80095;
	Wed, 25 Mar 2020 11:33:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D1C5F80255; Wed, 25 Mar 2020 11:33:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC126F80147
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 11:33:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC126F80147
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6C59FACC2
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 10:33:25 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/4] ALSA: usb-audio: Rewrite registration quirk handling
Date: Wed, 25 Mar 2020 11:33:19 +0100
Message-Id: <20200325103322.2508-2-tiwai@suse.de>
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

A slight refactoring of the registration quirk code.  Now it uses the
table lookup for easy additions in future.  Also the return type was
changed to bool, and got a few more comments.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.c   |  2 +-
 sound/usb/quirks.c | 40 ++++++++++++++++++++++++++++++----------
 sound/usb/quirks.h |  3 +--
 3 files changed, 32 insertions(+), 13 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 16bbe2a50fb7..55d563a8154d 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -665,7 +665,7 @@ static int usb_audio_probe(struct usb_interface *intf,
 	/* we are allowed to call snd_card_register() many times, but first
 	 * check to see if a device needs to skip it or do anything special
 	 */
-	if (snd_usb_registration_quirk(chip, ifnum) == 0) {
+	if (!snd_usb_registration_quirk(chip, ifnum)) {
 		err = snd_card_register(chip->card);
 		if (err < 0)
 			goto __error;
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index d605aff801b8..86f192a3043d 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1809,16 +1809,36 @@ void snd_usb_audioformat_attributes_quirk(struct snd_usb_audio *chip,
 	}
 }
 
-int snd_usb_registration_quirk(struct snd_usb_audio *chip,
-			       int iface)
+/*
+ * registration quirk:
+ * the registration is skipped if a device matches with the given ID,
+ * unless the interface reaches to the defined one.  This is for delaying
+ * the registration until the last known interface, so that the card and
+ * devices appear at the same time.
+ */
+
+struct registration_quirk {
+	unsigned int usb_id;	/* composed via USB_ID() */
+	unsigned int interface;	/* the interface to trigger register */
+};
+
+#define REG_QUIRK_ENTRY(vendor, product, iface) \
+	{ .usb_id = USB_ID(vendor, product), .interface = (iface) }
+
+static const struct registration_quirk registration_quirks[] = {
+	REG_QUIRK_ENTRY(0x0951, 0x16d8, 2),	/* Kingston HyperX AMP */
+	{ 0 }					/* terminator */
+};
+
+/* return true if skipping registration */
+bool snd_usb_registration_quirk(struct snd_usb_audio *chip, int iface)
 {
-	switch (chip->usb_id) {
-	case USB_ID(0x0951, 0x16d8): /* Kingston HyperX AMP */
-		/* Register only when we reach interface 2 so that streams can
-		 * merge correctly into PCMs from interface 0
-		 */
-		return (iface != 2);
-	}
+	const struct registration_quirk *q;
+
+	for (q = registration_quirks; q->usb_id; q++)
+		if (chip->usb_id == q->usb_id)
+			return iface != q->interface;
+
 	/* Register as normal */
-	return 0;
+	return false;
 }
diff --git a/sound/usb/quirks.h b/sound/usb/quirks.h
index 3afc01eabc7e..c76cf24a640a 100644
--- a/sound/usb/quirks.h
+++ b/sound/usb/quirks.h
@@ -51,7 +51,6 @@ void snd_usb_audioformat_attributes_quirk(struct snd_usb_audio *chip,
 					  struct audioformat *fp,
 					  int stream);
 
-int snd_usb_registration_quirk(struct snd_usb_audio *chip,
-			       int iface);
+bool snd_usb_registration_quirk(struct snd_usb_audio *chip, int iface);
 
 #endif /* __USBAUDIO_QUIRKS_H */
-- 
2.16.4

