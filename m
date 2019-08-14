Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB248DDFD
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 21:41:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4812D166E;
	Wed, 14 Aug 2019 21:40:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4812D166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565811708;
	bh=iFdL7uJzZrbLBd1TZ+XFE1Hl9ufsrJEx52FMEKAu5AY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tJukBrJ6lKJOPydm4bDHHuBguQnWPF3CnZvS7icff2M5R/zYeIag0PHGUAEEJhfx4
	 pYTnzZnzqmTk7/9K2SJH9BoA5JNqfLOdJ1ngPBYX5LWdfriYUkbPP8kwosiYHYdywQ
	 d479uiBk+C+OhN6faeVSAY7CKm9M2sSObyMGz+LY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D688DF80214;
	Wed, 14 Aug 2019 21:39:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AEA2F80446; Wed, 14 Aug 2019 21:39:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F12B1F8015A
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 21:39:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F12B1F8015A
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D01DFAFA4
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 19:39:09 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Wed, 14 Aug 2019 21:39:05 +0200
Message-Id: <20190814193905.5530-5-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190814193905.5530-1-tiwai@suse.de>
References: <20190814193905.5530-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 4/4] ALSA: hda: Unexport a few more stuff
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

Drop EXPORT_SYMBOL*() from a few more stuff in HD-audio core that
aren't used outside.  Particular the unsol event handler can be
staticized now because the recent change removed all external
callers.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/hdaudio.h | 6 ------
 sound/hda/hdac_bus.c    | 5 +++--
 sound/hda/hdac_device.c | 6 ++----
 sound/hda/hdac_regmap.c | 1 +
 sound/hda/local.h       | 3 +++
 5 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index edb176a265c7..b260c5fd2337 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -122,10 +122,6 @@ int snd_hdac_codec_modalias(struct hdac_device *hdac, char *buf, size_t size);
 
 int snd_hdac_refresh_widgets(struct hdac_device *codec);
 
-unsigned int snd_hdac_make_cmd(struct hdac_device *codec, hda_nid_t nid,
-			       unsigned int verb, unsigned int parm);
-int snd_hdac_exec_verb(struct hdac_device *codec, unsigned int cmd,
-		       unsigned int flags, unsigned int *res);
 int snd_hdac_read(struct hdac_device *codec, hda_nid_t nid,
 		  unsigned int verb, unsigned int parm, unsigned int *res);
 int _snd_hdac_read_parm(struct hdac_device *codec, hda_nid_t nid, int parm,
@@ -374,8 +370,6 @@ int snd_hdac_bus_exec_verb_unlocked(struct hdac_bus *bus, unsigned int addr,
 				    unsigned int cmd, unsigned int *res);
 void snd_hdac_bus_queue_event(struct hdac_bus *bus, u32 res, u32 res_ex);
 
-void snd_hdac_bus_process_unsol_events(struct work_struct *work);
-
 static inline void snd_hdac_codec_link_up(struct hdac_device *codec)
 {
 	set_bit(codec->addr, &codec->bus->codec_powered);
diff --git a/sound/hda/hdac_bus.c b/sound/hda/hdac_bus.c
index 18ed3185df82..8f19876244eb 100644
--- a/sound/hda/hdac_bus.c
+++ b/sound/hda/hdac_bus.c
@@ -12,6 +12,8 @@
 #include "local.h"
 #include "trace.h"
 
+static void snd_hdac_bus_process_unsol_events(struct work_struct *work);
+
 static const struct hdac_bus_ops default_ops = {
 	.command = snd_hdac_bus_send_cmd,
 	.get_response = snd_hdac_bus_get_response,
@@ -149,7 +151,7 @@ EXPORT_SYMBOL_GPL(snd_hdac_bus_queue_event);
 /*
  * process queued unsolicited events
  */
-void snd_hdac_bus_process_unsol_events(struct work_struct *work)
+static void snd_hdac_bus_process_unsol_events(struct work_struct *work)
 {
 	struct hdac_bus *bus = container_of(work, struct hdac_bus, unsol_work);
 	struct hdac_device *codec;
@@ -172,7 +174,6 @@ void snd_hdac_bus_process_unsol_events(struct work_struct *work)
 			drv->unsol_event(codec, res);
 	}
 }
-EXPORT_SYMBOL_GPL(snd_hdac_bus_process_unsol_events);
 
 /**
  * snd_hdac_bus_add_device - Add a codec to bus
diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index 033bcef8751a..bf83d7062ef6 100644
--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -221,8 +221,8 @@ EXPORT_SYMBOL_GPL(snd_hdac_codec_modalias);
  *
  * Return an encoded command verb or -1 for error.
  */
-unsigned int snd_hdac_make_cmd(struct hdac_device *codec, hda_nid_t nid,
-			       unsigned int verb, unsigned int parm)
+static unsigned int snd_hdac_make_cmd(struct hdac_device *codec, hda_nid_t nid,
+				      unsigned int verb, unsigned int parm)
 {
 	u32 val, addr;
 
@@ -240,7 +240,6 @@ unsigned int snd_hdac_make_cmd(struct hdac_device *codec, hda_nid_t nid,
 	val |= parm;
 	return val;
 }
-EXPORT_SYMBOL_GPL(snd_hdac_make_cmd);
 
 /**
  * snd_hdac_exec_verb - execute an encoded verb
@@ -261,7 +260,6 @@ int snd_hdac_exec_verb(struct hdac_device *codec, unsigned int cmd,
 		return codec->exec_verb(codec, cmd, flags, res);
 	return snd_hdac_bus_exec_verb(codec->bus, codec->addr, cmd, res);
 }
-EXPORT_SYMBOL_GPL(snd_hdac_exec_verb);
 
 
 /**
diff --git a/sound/hda/hdac_regmap.c b/sound/hda/hdac_regmap.c
index f399a1552e73..286361ecd640 100644
--- a/sound/hda/hdac_regmap.c
+++ b/sound/hda/hdac_regmap.c
@@ -21,6 +21,7 @@
 #include <sound/core.h>
 #include <sound/hdaudio.h>
 #include <sound/hda_regmap.h>
+#include "local.h"
 
 static int codec_pm_lock(struct hdac_device *codec)
 {
diff --git a/sound/hda/local.h b/sound/hda/local.h
index 3a4e303169a6..5b935219352f 100644
--- a/sound/hda/local.h
+++ b/sound/hda/local.h
@@ -37,4 +37,7 @@ int snd_hdac_bus_add_device(struct hdac_bus *bus, struct hdac_device *codec);
 void snd_hdac_bus_remove_device(struct hdac_bus *bus,
 				struct hdac_device *codec);
 
+int snd_hdac_exec_verb(struct hdac_device *codec, unsigned int cmd,
+		       unsigned int flags, unsigned int *res);
+
 #endif /* __HDAC_LOCAL_H */
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
