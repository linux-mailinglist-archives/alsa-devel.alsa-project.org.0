Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B05C318FAF4
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Mar 2020 18:09:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FABE1661;
	Mon, 23 Mar 2020 18:08:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FABE1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584983360;
	bh=tZvgtYXKw9JI1ga0K/FmJNUJgpzYsMwmTczeuO/9R2c=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vHAMn5VTEB47uwV2F6QkUUgutJfPpGjdQMm8tgXXHkfILdZhpD4YKYO0ihkDl0gx7
	 bVYY5db3i7G3pb3GM8fq4N21DGVpnRxqHCIkwCFLyoTteYKe/Q+i7i4+oXneq0acHL
	 0sLOe7giFNKQdRA9DRlCBL8gx9v+XqilYegoUbkE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 858B3F80268;
	Mon, 23 Mar 2020 18:06:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3489F80158; Mon, 23 Mar 2020 18:06:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01628F800B9
 for <alsa-devel@alsa-project.org>; Mon, 23 Mar 2020 18:06:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01628F800B9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 50EC9ABBE
 for <alsa-devel@alsa-project.org>; Mon, 23 Mar 2020 17:06:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ALSA: core: Add snd_device_get_state() helper
Date: Mon, 23 Mar 2020 18:06:42 +0100
Message-Id: <20200323170643.19181-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
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

A new small helper to get the current state of the device registration
for the given object.  It'll be used for USB-audio driver to check the
delayed device registrations.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/core.h |  1 +
 sound/core/device.c  | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/include/sound/core.h b/include/sound/core.h
index ac8b692b69b4..381a010a1bd4 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -266,6 +266,7 @@ void snd_device_disconnect(struct snd_card *card, void *device_data);
 void snd_device_disconnect_all(struct snd_card *card);
 void snd_device_free(struct snd_card *card, void *device_data);
 void snd_device_free_all(struct snd_card *card);
+int snd_device_get_state(struct snd_card *card, void *device_data);
 
 /* isadma.c */
 
diff --git a/sound/core/device.c b/sound/core/device.c
index cdc5af526739..bf0b04a7ee79 100644
--- a/sound/core/device.c
+++ b/sound/core/device.c
@@ -237,3 +237,24 @@ void snd_device_free_all(struct snd_card *card)
 	list_for_each_entry_safe_reverse(dev, next, &card->devices, list)
 		__snd_device_free(dev);
 }
+
+/**
+ * snd_device_get_state - Get the current state of the given device
+ * @card: the card instance
+ * @device_data: the data pointer to release
+ *
+ * Returns the current state of the given device object.  For the valid
+ * device, either @SNDRV_DEV_BUILD, @SNDRV_DEV_REGISTERED or
+ * @SNDRV_DEV_DISCONNECTED is returned.
+ * Or for a non-existing device, -1 is returned as an error.
+ */
+int snd_device_get_state(struct snd_card *card, void *device_data)
+{
+	struct snd_device *dev;
+
+	dev = look_for_dev(card, device_data);
+	if (dev)
+		return dev->state;
+	return -1;
+}
+EXPORT_SYMBOL_GPL(snd_device_get_state);
-- 
2.16.4

