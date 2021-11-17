Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 291E8454743
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 14:32:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA21D192A;
	Wed, 17 Nov 2021 14:31:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA21D192A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637155933;
	bh=egpKftjZA4UATBX6UMVTj2AbIQQsMuLIA1YpbnnCrVY=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XndP4MvmGVtuCS5lWAsYmKMd892edd74e9Mg0f+vi2NrymFF4K6qJtFrJ5oCFXHnx
	 FtoV7FG66yN7AAAVLs9LzfdJS6u3eXPlD4MDcP27eMclJkI+ArkvDYehFuqJ1MtqAQ
	 8hyMLNTzt9yHQx5ziA/YsflKlTIeMmECNcv0bQoI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A52DF8028B;
	Wed, 17 Nov 2021 14:30:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35D30F8027D; Wed, 17 Nov 2021 14:30:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C854EF8016C
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 14:30:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C854EF8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="qBc/jJ6/"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="lVClk7C5"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id E7909212BE
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 13:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1637155841; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=WfP/WJ5UOBPscRr2Sh/ZnK2g7le7uEajckX+rx9UEvQ=;
 b=qBc/jJ6/paE3qMOJGYM5OB7KqPngR0hPtjE4F4tvc2YvTSL3zVglcoD+S+k4fv3p6UyEX8
 ZN1iBx7r/5DeaQsvuF032FQxXrLQCIdEHXrE5MyFXN8CH0tA6OoVj7kIhul12BAnrYb0G+
 UYeLluU6qOwoDOlqSf4s9dBhV4chmag=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1637155841;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=WfP/WJ5UOBPscRr2Sh/ZnK2g7le7uEajckX+rx9UEvQ=;
 b=lVClk7C5oZDaNQxjcFp27yxdxeH5CM+b+kp27VSGhadSRPPgM80eUPDWdCJBYPPmbU4Tj0
 0mN7Q7igAMevuPBA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id D7C40A3B84;
 Wed, 17 Nov 2021 13:30:41 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: Do disconnect jacks at codec unbind
Date: Wed, 17 Nov 2021 14:30:40 +0100
Message-Id: <20211117133040.20272-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The HD-audio codec driver remove may happen also at dynamically
unbinding during operation, hence it needs manual triggers of
snd_device_disconnect() calls, while it's missing for the jack objects
that are associated with the codec.

This patch adds the manual disconnection call for jacks when the
remove happens without card->shutdown (i.e. not under the full
removal).

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_bind.c |  2 ++
 sound/pci/hda/hda_jack.c | 11 +++++++++++
 sound/pci/hda/hda_jack.h |  1 +
 3 files changed, 14 insertions(+)

diff --git a/sound/pci/hda/hda_bind.c b/sound/pci/hda/hda_bind.c
index 7153bd53e189..c572fb5886d5 100644
--- a/sound/pci/hda/hda_bind.c
+++ b/sound/pci/hda/hda_bind.c
@@ -14,6 +14,7 @@
 #include <sound/core.h>
 #include <sound/hda_codec.h>
 #include "hda_local.h"
+#include "hda_jack.h"
 
 /*
  * find a matching codec id
@@ -158,6 +159,7 @@ static int hda_codec_driver_remove(struct device *dev)
 
 	refcount_dec(&codec->pcm_ref);
 	snd_hda_codec_disconnect_pcms(codec);
+	snd_hda_jack_tbl_disconnect(codec);
 	wait_event(codec->remove_sleep, !refcount_read(&codec->pcm_ref));
 	snd_power_sync_ref(codec->bus->card);
 
diff --git a/sound/pci/hda/hda_jack.c b/sound/pci/hda/hda_jack.c
index f29975e3e98d..7d7786df60ea 100644
--- a/sound/pci/hda/hda_jack.c
+++ b/sound/pci/hda/hda_jack.c
@@ -158,6 +158,17 @@ snd_hda_jack_tbl_new(struct hda_codec *codec, hda_nid_t nid, int dev_id)
 	return jack;
 }
 
+void snd_hda_jack_tbl_disconnect(struct hda_codec *codec)
+{
+	struct hda_jack_tbl *jack = codec->jacktbl.list;
+	int i;
+
+	for (i = 0; i < codec->jacktbl.used; i++, jack++) {
+		if (!codec->bus->shutdown && jack->jack)
+			snd_device_disconnect(codec->card, jack->jack);
+	}
+}
+
 void snd_hda_jack_tbl_clear(struct hda_codec *codec)
 {
 	struct hda_jack_tbl *jack = codec->jacktbl.list;
diff --git a/sound/pci/hda/hda_jack.h b/sound/pci/hda/hda_jack.h
index 2abf7aac243a..ff7d289c034b 100644
--- a/sound/pci/hda/hda_jack.h
+++ b/sound/pci/hda/hda_jack.h
@@ -69,6 +69,7 @@ struct hda_jack_tbl *
 snd_hda_jack_tbl_get_from_tag(struct hda_codec *codec,
 			      unsigned char tag, int dev_id);
 
+void snd_hda_jack_tbl_disconnect(struct hda_codec *codec);
 void snd_hda_jack_tbl_clear(struct hda_codec *codec);
 
 void snd_hda_jack_set_dirty_all(struct hda_codec *codec);
-- 
2.31.1

