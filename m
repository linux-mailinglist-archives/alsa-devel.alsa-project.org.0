Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 927C78DDFE
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 21:42:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F565167C;
	Wed, 14 Aug 2019 21:41:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F565167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565811758;
	bh=F12ESyroYwz94MaQr5WPF9RsKuHuNnE6r4InUDrVLF0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jxJXZ/TeSEzUa3z/Q+VTEfAYqdHr5ZLmuuiRHBSkYzoCei9J4GthAzTUdp+MFuDCW
	 YKxl3A7KL/VxRgp152sEuSKzXjxIh7bpoYS4ILKR7+jRmCT4lY6CaoUc2Z9oK0b34G
	 J1ScRbiS5OFvWScowux587KCldTQWL3AOhmryLl0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0281AF805AF;
	Wed, 14 Aug 2019 21:39:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 316C4F805A9; Wed, 14 Aug 2019 21:39:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 051D9F80214
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 21:39:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 051D9F80214
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C400AAF8C
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 19:39:09 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Wed, 14 Aug 2019 21:39:04 +0200
Message-Id: <20190814193905.5530-4-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190814193905.5530-1-tiwai@suse.de>
References: <20190814193905.5530-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 3/4] ALSA: hda: Drop export of
	snd_hdac_bus_add/remove_device()
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

snd_hdac_bus_add_device() and snd_hdac_remove_device() are called only
internally in hda-core.  Let's drop the exports of them and move the
declarations into local.h.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/hdaudio.h | 3 ---
 sound/hda/hdac_bus.c    | 3 +--
 sound/hda/local.h       | 4 ++++
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 4af4af55e854..edb176a265c7 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -374,9 +374,6 @@ int snd_hdac_bus_exec_verb_unlocked(struct hdac_bus *bus, unsigned int addr,
 				    unsigned int cmd, unsigned int *res);
 void snd_hdac_bus_queue_event(struct hdac_bus *bus, u32 res, u32 res_ex);
 
-int snd_hdac_bus_add_device(struct hdac_bus *bus, struct hdac_device *codec);
-void snd_hdac_bus_remove_device(struct hdac_bus *bus,
-				struct hdac_device *codec);
 void snd_hdac_bus_process_unsol_events(struct work_struct *work);
 
 static inline void snd_hdac_codec_link_up(struct hdac_device *codec)
diff --git a/sound/hda/hdac_bus.c b/sound/hda/hdac_bus.c
index cd25e2b3f7f2..18ed3185df82 100644
--- a/sound/hda/hdac_bus.c
+++ b/sound/hda/hdac_bus.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/export.h>
 #include <sound/hdaudio.h>
+#include "local.h"
 #include "trace.h"
 
 static const struct hdac_bus_ops default_ops = {
@@ -196,7 +197,6 @@ int snd_hdac_bus_add_device(struct hdac_bus *bus, struct hdac_device *codec)
 	bus->num_codecs++;
 	return 0;
 }
-EXPORT_SYMBOL_GPL(snd_hdac_bus_add_device);
 
 /**
  * snd_hdac_bus_remove_device - Remove a codec from bus
@@ -215,7 +215,6 @@ void snd_hdac_bus_remove_device(struct hdac_bus *bus,
 	bus->num_codecs--;
 	flush_work(&bus->unsol_work);
 }
-EXPORT_SYMBOL_GPL(snd_hdac_bus_remove_device);
 
 #ifdef CONFIG_SND_HDA_ALIGNED_MMIO
 /* Helpers for aligned read/write of mmio space, for Tegra */
diff --git a/sound/hda/local.h b/sound/hda/local.h
index 877631e39373..3a4e303169a6 100644
--- a/sound/hda/local.h
+++ b/sound/hda/local.h
@@ -33,4 +33,8 @@ int hda_widget_sysfs_reinit(struct hdac_device *codec, hda_nid_t start_nid,
 			    int num_nodes);
 void hda_widget_sysfs_exit(struct hdac_device *codec);
 
+int snd_hdac_bus_add_device(struct hdac_bus *bus, struct hdac_device *codec);
+void snd_hdac_bus_remove_device(struct hdac_bus *bus,
+				struct hdac_device *codec);
+
 #endif /* __HDAC_LOCAL_H */
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
