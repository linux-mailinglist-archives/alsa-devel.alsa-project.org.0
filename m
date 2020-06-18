Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 348E41FF04E
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 13:13:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1A191757;
	Thu, 18 Jun 2020 13:12:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1A191757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592478790;
	bh=aue6oACR4XDwktUQjF9dOTYSW+DTzONYAg1R1gioEyE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vuqPXZ+wKUsE9EmvO4OdJm6eHmGjIMWhe/yAamrEfl2NBoIoHllzvtg6fAXuv2fYv
	 LXtXWdU38ezbOgtfMnV0v0PmucqZHPnYWb9h8YHNH+bhoDZ45E9SqiRgOBhLeF1wZW
	 JckiWJgQ3BItWM7vA6Jd3rQ+mAMcIAul/v7AbqIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33D43F80255;
	Thu, 18 Jun 2020 13:09:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8C6EF802BD; Thu, 18 Jun 2020 13:09:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B710F80171
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 13:08:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B710F80171
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A4FD2AF39;
 Thu, 18 Jun 2020 11:08:49 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/13] ALSA: hda: generic: Drop unused
 snd_hda_gen_fixup_micmute_led()
Date: Thu, 18 Jun 2020 13:08:35 +0200
Message-Id: <20200618110842.27238-7-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200618110842.27238-1-tiwai@suse.de>
References: <20200618110842.27238-1-tiwai@suse.de>
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>
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

The fixup function is no longer used.  Let's drop.

Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_generic.c | 23 -----------------------
 sound/pci/hda/hda_generic.h |  2 --
 2 files changed, 25 deletions(-)

diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
index 419cfbd0dc5c..53a328d21e96 100644
--- a/sound/pci/hda/hda_generic.c
+++ b/sound/pci/hda/hda_generic.c
@@ -4026,29 +4026,6 @@ int snd_hda_gen_add_micmute_led(struct hda_codec *codec,
 }
 EXPORT_SYMBOL_GPL(snd_hda_gen_add_micmute_led);
 
-/**
- * snd_hda_gen_fixup_micmute_led - A fixup for mic-mute LED trigger
- *
- * Pass this function to the quirk entry if another driver supports the
- * audio mic-mute LED trigger.  Then this will bind the mixer capture switch
- * change with the LED.
- *
- * Note that this fixup has to be called after other fixup that sets
- * cap_sync_hook.  Otherwise the chaining wouldn't work.
- *
- * @codec: the HDA codec
- * @fix: fixup pointer
- * @action: only supports HDA_FIXUP_ACT_PROBE value
- *
- */
-void snd_hda_gen_fixup_micmute_led(struct hda_codec *codec,
-				   const struct hda_fixup *fix, int action)
-{
-	if (action == HDA_FIXUP_ACT_PROBE)
-		snd_hda_gen_add_micmute_led(codec, NULL);
-}
-EXPORT_SYMBOL_GPL(snd_hda_gen_fixup_micmute_led);
-
 /**
  * snd_dha_gen_add_micmute_led_cdev - Create a LED classdev and enable as mic-mute LED
  * @codec: the HDA codec
diff --git a/sound/pci/hda/hda_generic.h b/sound/pci/hda/hda_generic.h
index f56bc8da20b2..6fcb62ed30c6 100644
--- a/sound/pci/hda/hda_generic.h
+++ b/sound/pci/hda/hda_generic.h
@@ -357,8 +357,6 @@ int snd_hda_gen_fix_pin_power(struct hda_codec *codec, hda_nid_t pin);
 
 int snd_hda_gen_add_micmute_led(struct hda_codec *codec,
 				void (*hook)(struct hda_codec *));
-void snd_hda_gen_fixup_micmute_led(struct hda_codec *codec,
-				   const struct hda_fixup *fix, int action);
 int snd_hda_gen_add_micmute_led_cdev(struct hda_codec *codec,
 				     int (*callback)(struct led_classdev *,
 						     enum led_brightness));
-- 
2.16.4

