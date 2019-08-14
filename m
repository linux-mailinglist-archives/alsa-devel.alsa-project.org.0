Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F5C8DE01
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 21:43:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2098168D;
	Wed, 14 Aug 2019 21:42:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2098168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565811813;
	bh=Tgel4fXi1GlDBjPlGFv6uA2ddjiXdoBZCrR0b0hlQbI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PrZSoKIr/wWQO7dQfsAKPIicKZbDV5zJqrkX9IrQHI4xacUF1WwYWOiwH9lJ7kxOA
	 RWNHOSJHaLHu0unE3NYNrGx4/yFNg++h0b62FaaZCx2orfMsAKLlAU8Zz6XQxvqFAB
	 V/ySBjMX/laxhKUcDfe4VFcKjWyl1syqmKNW+6Fc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 401C2F805FE;
	Wed, 14 Aug 2019 21:39:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACCD8F8058C; Wed, 14 Aug 2019 21:39:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FB65F80268
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 21:39:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FB65F80268
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B6A8CAF80
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 19:39:09 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Wed, 14 Aug 2019 21:39:03 +0200
Message-Id: <20190814193905.5530-3-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190814193905.5530-1-tiwai@suse.de>
References: <20190814193905.5530-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 2/4] ALSA: hda: Add codec on bus address table
	lately
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

The call of snd_hdac_bus_add_device() is needed only for registering
the codec onto the bus caddr_tbl[] that is referred essentially only
in the unsol event handler.  That is, the reason of this call and the
release by the counter-part function snd_hdac_bus_remove_device() is
just to assure that the unsol event gets notified to the codec.

But the current implementation of the unsol notification wouldn't work
properly when the codec is still in a premature init state.  So this
patch tries to work around it by delaying the caddr_tbl[] registration
at the point of snd_hdac_device_register().

Also, the order of snd_hdac_bus_remove_device() and device_del() calls
are shuffled to make sure that the unsol event is masked before
deleting the device.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=204565
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/hdac_device.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index b26cc93e7e10..033bcef8751a 100644
--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -61,10 +61,6 @@ int snd_hdac_device_init(struct hdac_device *codec, struct hdac_bus *bus,
 	pm_runtime_get_noresume(&codec->dev);
 	atomic_set(&codec->in_pm, 0);
 
-	err = snd_hdac_bus_add_device(bus, codec);
-	if (err < 0)
-		goto error;
-
 	/* fill parameters */
 	codec->vendor_id = snd_hdac_read_parm(codec, AC_NODE_ROOT,
 					      AC_PAR_VENDOR_ID);
@@ -143,15 +139,22 @@ int snd_hdac_device_register(struct hdac_device *codec)
 	err = device_add(&codec->dev);
 	if (err < 0)
 		return err;
+	err = snd_hdac_bus_add_device(codec->bus, codec);
+	if (err < 0)
+		goto error;
 	mutex_lock(&codec->widget_lock);
 	err = hda_widget_sysfs_init(codec);
 	mutex_unlock(&codec->widget_lock);
-	if (err < 0) {
-		device_del(&codec->dev);
-		return err;
-	}
+	if (err < 0)
+		goto error_remove;
 
 	return 0;
+
+ error_remove:
+	snd_hdac_bus_remove_device(codec->bus, codec);
+ error:
+	device_del(&codec->dev);
+	return err;
 }
 EXPORT_SYMBOL_GPL(snd_hdac_device_register);
 
@@ -165,8 +168,8 @@ void snd_hdac_device_unregister(struct hdac_device *codec)
 		mutex_lock(&codec->widget_lock);
 		hda_widget_sysfs_exit(codec);
 		mutex_unlock(&codec->widget_lock);
-		device_del(&codec->dev);
 		snd_hdac_bus_remove_device(codec->bus, codec);
+		device_del(&codec->dev);
 	}
 }
 EXPORT_SYMBOL_GPL(snd_hdac_device_unregister);
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
