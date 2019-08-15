Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D3E8F51E
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 21:48:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 105211682;
	Thu, 15 Aug 2019 21:47:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 105211682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565898511;
	bh=95BlIaaEFoQBbxMC7zysX1rxapppqlU2vYh2TKXKFpk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nKt48i0puB5YDQY6JdXeJvWwBnwIZYJW9poFnLW+puorNPiUg7WHn/Y6Pso0mVKWh
	 Is7FRZVm71+FP7Drj+EY8IJPNylRBFSXzJVgy0u/Tf0TfNKUQu3Aj8+ufkubtnLU40
	 wO75TqNyvL9vTTPysYl9z9vJpQ/uinXp/UXeXB+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 632DEF80274;
	Thu, 15 Aug 2019 21:46:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84B77F80274; Thu, 15 Aug 2019 21:46:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7385CF8011F
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 21:46:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7385CF8011F
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5F514AD44;
 Thu, 15 Aug 2019 19:46:40 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu, 15 Aug 2019 21:46:34 +0200
Message-Id: <20190815194634.12281-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Subject: [alsa-devel] [PATCH] Revert "ALSA: hda: Add codec on bus address
	table lately"
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This reverts commit ee5f85d9290f ("ALSA: hda: Add codec on bus address
table lately").  The commit caused several regression since I've
overlooked that the function doesn't manage only the caddr_tbl but
also the codec linked list that is referred indirectly in the other
drivers.

Revert for now to make everything back to work.

Fixes: ee5f85d9290f ("ALSA: hda: Add codec on bus address table lately")
Reported-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/hdac_device.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index bf83d7062ef6..9f3e37511408 100644
--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -61,6 +61,10 @@ int snd_hdac_device_init(struct hdac_device *codec, struct hdac_bus *bus,
 	pm_runtime_get_noresume(&codec->dev);
 	atomic_set(&codec->in_pm, 0);
 
+	err = snd_hdac_bus_add_device(bus, codec);
+	if (err < 0)
+		goto error;
+
 	/* fill parameters */
 	codec->vendor_id = snd_hdac_read_parm(codec, AC_NODE_ROOT,
 					      AC_PAR_VENDOR_ID);
@@ -139,22 +143,15 @@ int snd_hdac_device_register(struct hdac_device *codec)
 	err = device_add(&codec->dev);
 	if (err < 0)
 		return err;
-	err = snd_hdac_bus_add_device(codec->bus, codec);
-	if (err < 0)
-		goto error;
 	mutex_lock(&codec->widget_lock);
 	err = hda_widget_sysfs_init(codec);
 	mutex_unlock(&codec->widget_lock);
-	if (err < 0)
-		goto error_remove;
+	if (err < 0) {
+		device_del(&codec->dev);
+		return err;
+	}
 
 	return 0;
-
- error_remove:
-	snd_hdac_bus_remove_device(codec->bus, codec);
- error:
-	device_del(&codec->dev);
-	return err;
 }
 EXPORT_SYMBOL_GPL(snd_hdac_device_register);
 
@@ -168,8 +165,8 @@ void snd_hdac_device_unregister(struct hdac_device *codec)
 		mutex_lock(&codec->widget_lock);
 		hda_widget_sysfs_exit(codec);
 		mutex_unlock(&codec->widget_lock);
-		snd_hdac_bus_remove_device(codec->bus, codec);
 		device_del(&codec->dev);
+		snd_hdac_bus_remove_device(codec->bus, codec);
 	}
 }
 EXPORT_SYMBOL_GPL(snd_hdac_device_unregister);
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
