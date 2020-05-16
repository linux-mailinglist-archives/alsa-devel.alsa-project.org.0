Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8AA1D5F23
	for <lists+alsa-devel@lfdr.de>; Sat, 16 May 2020 08:31:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C848B165E;
	Sat, 16 May 2020 08:31:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C848B165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589610712;
	bh=tTaMOxHcWP+vYlSETwWDiNryXSA7xvtYMSFacDwwaG4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T7rV+xwd74KbyfwleGLB1WDjvbHZTtOL1DAZwk3AoQ/A6xgqSS+2tzbm37LrfXYJk
	 7vlorFEto6S2ugq/wwrsfczaNlyJttBi1yf4zVHHWIp0Yma8j2QEIgTipVg9UJVUjq
	 QNF5hZQZNxMMSAmHzsOKUg9ac86ar2eqleD2pAwI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EE09F80269;
	Sat, 16 May 2020 08:29:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 445ABF8014C; Sat, 16 May 2020 08:29:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85CB0F800FE
 for <alsa-devel@alsa-project.org>; Sat, 16 May 2020 08:28:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85CB0F800FE
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D8382AD68
 for <alsa-devel@alsa-project.org>; Sat, 16 May 2020 06:29:00 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: hda: Unexport some local helper functions
Date: Sat, 16 May 2020 08:28:54 +0200
Message-Id: <20200516062854.22141-3-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200516062854.22141-1-tiwai@suse.de>
References: <20200516062854.22141-1-tiwai@suse.de>
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

snd_hdac_bus_queue_event() and snd_hdac_bus_exec_verb() are used only
internally in HD-audio core.  Let's drop the exports and move the
declarations into local.h.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/hdaudio.h     | 3 ---
 sound/hda/hdac_bus.c        | 2 --
 sound/hda/hdac_controller.c | 1 +
 sound/hda/local.h           | 3 +++
 4 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 10945963d727..c1f78d9a6e47 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -372,11 +372,8 @@ struct hdac_bus {
 int snd_hdac_bus_init(struct hdac_bus *bus, struct device *dev,
 		      const struct hdac_bus_ops *ops);
 void snd_hdac_bus_exit(struct hdac_bus *bus);
-int snd_hdac_bus_exec_verb(struct hdac_bus *bus, unsigned int addr,
-			   unsigned int cmd, unsigned int *res);
 int snd_hdac_bus_exec_verb_unlocked(struct hdac_bus *bus, unsigned int addr,
 				    unsigned int cmd, unsigned int *res);
-void snd_hdac_bus_queue_event(struct hdac_bus *bus, u32 res, u32 res_ex);
 
 static inline void snd_hdac_codec_link_up(struct hdac_device *codec)
 {
diff --git a/sound/hda/hdac_bus.c b/sound/hda/hdac_bus.c
index dee04792ca86..09ddab5f5cae 100644
--- a/sound/hda/hdac_bus.c
+++ b/sound/hda/hdac_bus.c
@@ -81,7 +81,6 @@ int snd_hdac_bus_exec_verb(struct hdac_bus *bus, unsigned int addr,
 	mutex_unlock(&bus->cmd_mutex);
 	return err;
 }
-EXPORT_SYMBOL_GPL(snd_hdac_bus_exec_verb);
 
 /**
  * snd_hdac_bus_exec_verb_unlocked - unlocked version
@@ -150,7 +149,6 @@ void snd_hdac_bus_queue_event(struct hdac_bus *bus, u32 res, u32 res_ex)
 
 	schedule_work(&bus->unsol_work);
 }
-EXPORT_SYMBOL_GPL(snd_hdac_bus_queue_event);
 
 /*
  * process queued unsolicited events
diff --git a/sound/hda/hdac_controller.c b/sound/hda/hdac_controller.c
index ac15aa357fbd..011b17cc1efa 100644
--- a/sound/hda/hdac_controller.c
+++ b/sound/hda/hdac_controller.c
@@ -9,6 +9,7 @@
 #include <sound/core.h>
 #include <sound/hdaudio.h>
 #include <sound/hda_register.h>
+#include "local.h"
 
 /* clear CORB read pointer properly */
 static void azx_clear_corbrp(struct hdac_bus *bus)
diff --git a/sound/hda/local.h b/sound/hda/local.h
index 5b935219352f..896ba142e8bc 100644
--- a/sound/hda/local.h
+++ b/sound/hda/local.h
@@ -36,6 +36,9 @@ void hda_widget_sysfs_exit(struct hdac_device *codec);
 int snd_hdac_bus_add_device(struct hdac_bus *bus, struct hdac_device *codec);
 void snd_hdac_bus_remove_device(struct hdac_bus *bus,
 				struct hdac_device *codec);
+void snd_hdac_bus_queue_event(struct hdac_bus *bus, u32 res, u32 res_ex);
+int snd_hdac_bus_exec_verb(struct hdac_bus *bus, unsigned int addr,
+			   unsigned int cmd, unsigned int *res);
 
 int snd_hdac_exec_verb(struct hdac_device *codec, unsigned int cmd,
 		       unsigned int flags, unsigned int *res);
-- 
2.16.4

