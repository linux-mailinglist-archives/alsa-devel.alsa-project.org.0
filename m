Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BB92C020F
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 10:10:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C182516FD;
	Mon, 23 Nov 2020 10:09:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C182516FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606122632;
	bh=+iqd6rd8BTNeHP2BrxZHD0W+6KlHsYBVbXjQJve4pWU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TGMTO4pFsLxxu6dFlRkKp7OeWzrI0DwD22lhu3sEckn+rIhAoUqr6tfMTmqt5iQ7S
	 N/DQDgenlqnORCi4LOrzBI+h3xOdDISO/5YsQZ4Z0jqouBWq3OQdxa8y+PGs7szRRq
	 Yi5uAe9ijheCxdzzAkZlgBm8rTrVYApMfIfLDMnM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D67FF8061C;
	Mon, 23 Nov 2020 09:55:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECC33F80570; Mon, 23 Nov 2020 09:54:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8CDCF804FA
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:54:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8CDCF804FA
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 050FEAFDC;
 Mon, 23 Nov 2020 08:53:59 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 39/41] ALSA: usb-audio: Add implicit_fb module option
Date: Mon, 23 Nov 2020 09:53:45 +0100
Message-Id: <20201123085347.19667-40-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20201123085347.19667-1-tiwai@suse.de>
References: <20201123085347.19667-1-tiwai@suse.de>
Cc: Matwey Kornilov <matwey.kornilov@gmail.com>,
 Dylan Robinson <dylan_robinson@motu.com>,
 Keith Milner <kamilner@superlative.org>
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

A new module option, implicit_fb, is added to specify the driver
looking for the implicit feedback sync.  This can be useful for a
device that could be working better in the implicit feed back mode and
user wants to test it quickly.  When this works, we can add the quirk
entry easily.

Tested-by: Keith Milner <kamilner@superlative.org>
Tested-by: Dylan Robinson <dylan_robinson@motu.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 Documentation/sound/alsa-configuration.rst | 5 +++++
 sound/usb/card.c                           | 4 ++++
 sound/usb/implicit.c                       | 4 ++++
 sound/usb/usbaudio.h                       | 1 +
 4 files changed, 14 insertions(+)

diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
index c755b1c5e16f..fe52c314b763 100644
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -2227,6 +2227,11 @@ quirk_alias
     Quirk alias list, pass strings like ``0123abcd:5678beef``, which
     applies the existing quirk for the device 5678:beef to a new
     device 0123:abcd.
+implicit_fb
+    Apply the generic implicit feedback sync mode.  When this is set
+    and the playback stream sync mode is ASYNC, the driver tries to
+    tie an adjacent ASYNC capture stream as the implicit feedback
+    source.
 use_vmalloc
     Use vmalloc() for allocations of the PCM buffers (default: yes).
     For architectures with non-coherent memory like ARM or MIPS, the
diff --git a/sound/usb/card.c b/sound/usb/card.c
index 7940b3bff5bc..cb0b6582dfee 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -72,6 +72,7 @@ static bool ignore_ctl_error;
 static bool autoclock = true;
 static char *quirk_alias[SNDRV_CARDS];
 static char *delayed_register[SNDRV_CARDS];
+static bool implicit_fb[SNDRV_CARDS];
 
 bool snd_usb_use_vmalloc = true;
 bool snd_usb_skip_validation;
@@ -97,6 +98,8 @@ module_param_array(quirk_alias, charp, NULL, 0444);
 MODULE_PARM_DESC(quirk_alias, "Quirk aliases, e.g. 0123abcd:5678beef.");
 module_param_array(delayed_register, charp, NULL, 0444);
 MODULE_PARM_DESC(delayed_register, "Quirk for delayed registration, given by id:iface, e.g. 0123abcd:4.");
+module_param_array(implicit_fb, bool, NULL, 0444);
+MODULE_PARM_DESC(implicit_fb, "Apply generic implicit feedback sync mode.");
 module_param_named(use_vmalloc, snd_usb_use_vmalloc, bool, 0444);
 MODULE_PARM_DESC(use_vmalloc, "Use vmalloc for PCM intermediate buffers (default: yes).");
 module_param_named(skip_validation, snd_usb_skip_validation, bool, 0444);
@@ -596,6 +599,7 @@ static int snd_usb_audio_create(struct usb_interface *intf,
 	chip->dev = dev;
 	chip->card = card;
 	chip->setup = device_setup[idx];
+	chip->generic_implicit_fb = implicit_fb[idx];
 	chip->autoclock = autoclock;
 	atomic_set(&chip->active, 1); /* avoid autopm during probing */
 	atomic_set(&chip->usage_count, 0);
diff --git a/sound/usb/implicit.c b/sound/usb/implicit.c
index 16b1fb55b7b9..1d87fcdae95b 100644
--- a/sound/usb/implicit.c
+++ b/sound/usb/implicit.c
@@ -269,6 +269,10 @@ static int audioformat_implicit_fb_quirk(struct snd_usb_audio *chip,
 			return 1;
 	}
 
+	/* Try the generic implicit fb if available */
+	if (chip->generic_implicit_fb)
+		return add_generic_implicit_fb(chip, fmt, alts);
+
 	/* No quirk */
 	return 0;
 }
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index cc338e8e2597..980287aadd36 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -51,6 +51,7 @@ struct snd_usb_audio {
 	struct list_head mixer_list;	/* list of mixer interfaces */
 
 	int setup;			/* from the 'device_setup' module param */
+	bool generic_implicit_fb;	/* from the 'implicit_fb' module param */
 	bool autoclock;			/* from the 'autoclock' module param */
 
 	struct usb_host_interface *ctrl_intf;	/* the audio control interface */
-- 
2.16.4

