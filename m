Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2D23DA0EE
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jul 2021 12:15:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD8071F32;
	Thu, 29 Jul 2021 12:14:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD8071F32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627553738;
	bh=wfS8e2UyQAPemhfC6gdPzMLN8v74/DqMZhKh5Tirjuo=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QNJcS2L1x6hV86YKSMJmM3kH9EaFvM/nckY3c2poN8iYXyI5PlWW09nolTECS5VC8
	 Ai+ql60jiCPi8nzBHNUzBvvEKN4mcQyEGSlK80/PAgaggi/Opl+vz7C9NZXyYmH2JZ
	 lYaAMz2ErZN9Xvj4GiC4FpfvRCzv+/1/fqwmGq4U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFE0DF804E2;
	Thu, 29 Jul 2021 12:13:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1F75F804C1; Thu, 29 Jul 2021 12:13:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DFA2F8026C
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 12:13:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DFA2F8026C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="E3ufEODy"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="nhXXY8/Q"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 417B42247B
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 10:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627553626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eHdOP7R/rOkuKLOZV8yLUt0xEeeaNZf2T5yEMLnlvto=;
 b=E3ufEODyLKAhSSyOWIP5MYDxSNqmO3P3BSAfeXVR35tPOLb7LyKJLg5+iV3v91tUaFJpjN
 OOnzZyR9lIJD+lV2NMoNP2ajkIThQw5K8o7FMr4PqeBQpemqnsfMei0DuRhrUFCoydUizW
 X3+4B/RELW407LSNJI9cUNvaEM6dLRQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627553626;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eHdOP7R/rOkuKLOZV8yLUt0xEeeaNZf2T5yEMLnlvto=;
 b=nhXXY8/QFo273Er+AV0Bzs4pNCeVQ4Ij5boTksUYFiVmCLUy8EY4wGVD5qi1UBGvksRl5G
 BQHisD0XJgL98IAw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 12F54A3C87;
 Thu, 29 Jul 2021 07:44:06 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 14/15] ALSA: usb-audio: Add quirk_flags module option
Date: Thu, 29 Jul 2021 09:44:03 +0200
Message-Id: <20210729074404.19728-5-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210729073855.19043-1-tiwai@suse.de>
References: <20210729073855.19043-1-tiwai@suse.de>
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

This patch adds a new module option, quirk_flags, for allowing user to
try some additional device-specific quirk behavior more easily.
When this option is set to non-zero, it overrides the quirk_flags, and
the specific workaround is applied.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 9535df39c02f..cf8f3953f78f 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -71,6 +71,7 @@ static bool autoclock = true;
 static char *quirk_alias[SNDRV_CARDS];
 static char *delayed_register[SNDRV_CARDS];
 static bool implicit_fb[SNDRV_CARDS];
+static unsigned int quirk_flags[SNDRV_CARDS];
 
 bool snd_usb_use_vmalloc = true;
 bool snd_usb_skip_validation;
@@ -98,6 +99,8 @@ module_param_array(delayed_register, charp, NULL, 0444);
 MODULE_PARM_DESC(delayed_register, "Quirk for delayed registration, given by id:iface, e.g. 0123abcd:4.");
 module_param_array(implicit_fb, bool, NULL, 0444);
 MODULE_PARM_DESC(implicit_fb, "Apply generic implicit feedback sync mode.");
+module_param_array(quirk_flags, uint, NULL, 0444);
+MODULE_PARM_DESC(quirk_flags, "Driver quirk bit flags.");
 module_param_named(use_vmalloc, snd_usb_use_vmalloc, bool, 0444);
 MODULE_PARM_DESC(use_vmalloc, "Use vmalloc for PCM intermediate buffers (default: yes).");
 module_param_named(skip_validation, snd_usb_skip_validation, bool, 0444);
@@ -631,7 +634,10 @@ static int snd_usb_audio_create(struct usb_interface *intf,
 	INIT_LIST_HEAD(&chip->midi_list);
 	INIT_LIST_HEAD(&chip->mixer_list);
 
-	snd_usb_init_quirk_flags(chip);
+	if (quirk_flags[idx])
+		chip->quirk_flags = quirk_flags[idx];
+	else
+		snd_usb_init_quirk_flags(chip);
 
 	card->private_free = snd_usb_audio_free;
 
-- 
2.26.2

