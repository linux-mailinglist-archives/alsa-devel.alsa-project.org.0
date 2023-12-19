Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C76818E44
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 18:37:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97BC0E87;
	Tue, 19 Dec 2023 18:37:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97BC0E87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703007446;
	bh=01j4NClY1puDJN1b1SakKTY9YWrRaYS8XQWUncABbvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WtEXUGUYwsygHuqG+MiSq6w/Oae4zxzuWWM04gtrGEoUpfx4WbBTXJYsb2ugY8vWX
	 JDCkTNLqC1+velkZR9xRhj1ZVDsokbvdaphjM2u62BjsJTnnj5hVPAGRNafhSca3iW
	 XNa1TolTH1CnEdVGxhXzKDVVNxI3mfUcqBvHBEwg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C734DF80570; Tue, 19 Dec 2023 18:36:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91A7EF80431;
	Tue, 19 Dec 2023 18:36:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D7EBF80563; Tue, 19 Dec 2023 18:36:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CADAEF80431
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 18:36:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CADAEF80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=GyQqenbQ
Received: by m.b4.vu (Postfix, from userid 1000)
	id 432C4604B9F7; Wed, 20 Dec 2023 04:06:42 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 432C4604B9F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703007402; bh=w71tYLCSurTXhcu4POdZy7nJlWAOIgIw63TgCjTYSMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GyQqenbQjZ1WXJfzAHedLWE2CsJXMwI+zmf0qoABFBAm81FglS1donj/rCe4Iifpw
	 9BZToDtCMQK2we0ynaLW+JYIOaunU1BeKpQ7LL32vXrB5ifTSuuturw0vGCSoTH+NJ
	 kANqPvRV/2vr9JBoxGVr/9SXJgqQl2tjMkHjWIwvmaZHh/AsT0giCAMWkCSgXJC2B3
	 RHb+4dUJhoMuiC291AqHlQ1mTRZX0asnMAkfuxtmnLcLS4+VkqufHC0liDWCaWXllB
	 9NJGKNMciXVrIj33wEZcOlyOcJCpqDqFt0mevqXkzjs7Ek6SFS0G6x/98hqDzyPrcb
	 bXDUo5q0LCVog==
Date: Wed, 20 Dec 2023 04:06:42 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH 01/11] ALSA: scarlett2: Update maintainer info
Message-ID: <62f32404eaa8663cc304648354b85bcb5914ce72.1703001053.git.g@b4.vu>
References: <cover.1703001053.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703001053.git.g@b4.vu>
Message-ID-Hash: LDMSQH6PTI5LYHAXKFNTVQWY3ORAI2TC
X-Message-ID-Hash: LDMSQH6PTI5LYHAXKFNTVQWY3ORAI2TC
X-MailFrom: g@b4.vu
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LDMSQH6PTI5LYHAXKFNTVQWY3ORAI2TC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Update MAINTAINERS and "enabled" message with GitHub repository links.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 MAINTAINERS                 | 6 ++++--
 sound/usb/mixer_scarlett2.c | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ea790149af79..ae3f72f57854 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8272,11 +8272,13 @@ L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	drivers/input/joystick/fsia6b.c
 
-FOCUSRITE SCARLETT GEN 2/3 MIXER DRIVER
+FOCUSRITE SCARLETT2 MIXER DRIVER (Scarlett Gen 2+ and Clarett)
 M:	Geoffrey D. Bennett <g@b4.vu>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Maintained
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
+W:	https://github.com/geoffreybennett/scarlett-gen2
+B:	https://github.com/geoffreybennett/scarlett-gen2/issues
+T:	git https://github.com/geoffreybennett/scarlett-gen2.git
 F:	sound/usb/mixer_scarlett2.c
 
 FORCEDETH GIGABIT ETHERNET DRIVER
diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index f7c57a2c3028..a0dbdf921745 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -4534,7 +4534,8 @@ int snd_scarlett2_init(struct usb_mixer_interface *mixer)
 
 	usb_audio_info(chip,
 		"Focusrite %s Mixer Driver enabled (pid=0x%04x); "
-		"report any issues to g@b4.vu",
+		"report any issues to "
+		"https://github.com/geoffreybennett/scarlett-gen2/issues",
 		entry->series_name,
 		USB_ID_PRODUCT(chip->usb_id));
 
-- 
2.43.0

