Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A621924ECF0
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Aug 2020 13:01:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F213167D;
	Sun, 23 Aug 2020 13:00:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F213167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598180469;
	bh=bs+7doNG1YeEAmgR6/XpC4BYj5OseHSRlraAsLLVXzw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EyNzDOzud6RLIjSkPK3+YHL573DbFDsHbysAJlp6yZAvt+Y13O6fy+xdhwm39sZ5N
	 pZ6nx10xWxdwM7PT6uwPIabi78VAsCW6wTui145vYv7l8YIcRXjcw6UNpwaLvep1fd
	 +J0X2HVFD6yU9hVrcrmXYa9efi1BvZVI7EQIHaz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60796F80245;
	Sun, 23 Aug 2020 12:59:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8283F8025A; Sun, 23 Aug 2020 12:59:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=AC_FROM_MANY_DOTS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA361F800C0
 for <alsa-devel@alsa-project.org>; Sun, 23 Aug 2020 12:59:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA361F800C0
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1k9niF-0003UF-C2; Sun, 23 Aug 2020 10:59:00 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: tiwai@suse.com
Subject: [PATCH] ALSA: usb-audio: Disable autosuspend for Lenovo ThinkStation
 P620
Date: Sun, 23 Aug 2020 18:58:50 +0800
Message-Id: <20200823105854.26950-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
Cc: Jussi Laako <jussi@sonarnerd.net>, Chris Wulff <crwulff@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Hector Martin <marcan@marcan.st>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Hui Wang <hui.wang@canonical.com>, Alexander Tsoy <alexander@tsoy.me>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 =?UTF-8?q?Franti=C5=A1ek=20Ku=C4=8Dera?= <franta-linux@frantovo.cz>,
 Jesus Ramos <jesus-ramos@live.com>, Gregor Pintar <grpintar@gmail.com>,
 Dmitry Panchenko <dmitry@d-systems.ee>, Nick Kossifidis <mickflemm@gmail.com>
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

If USB autosuspend is enabled, both front and rear panel can no longer
detect jack insertion.

Enable USB remote wakeup, i.e. needs_remote_wakeup = 1, doesn't help
either.

So disable USB autosuspend to prevent missing jack detection event.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 sound/usb/quirks-table.h | 18 ++++++++++++++----
 sound/usb/quirks.c       | 10 ++++++++++
 sound/usb/usbaudio.h     |  1 +
 3 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index f4fb002e3ef4..416de71c6895 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -2827,14 +2827,24 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 /* Lenovo ThinkStation P620 Rear Line-in, Line-out and Microphone */
 {
 	USB_DEVICE(0x17aa, 0x1046),
-	QUIRK_DEVICE_PROFILE("Lenovo", "ThinkStation P620 Rear",
-			     "Lenovo-ThinkStation-P620-Rear"),
+	.driver_info = (unsigned long) & (const struct snd_usb_audio_quirk) {
+		.vendor_name = "Lenovo",
+		.product_name = "ThinkStation P620 Rear",
+		.profile_name = "Lenovo-ThinkStation-P620-Rear",
+		.ifnum = QUIRK_ANY_INTERFACE,
+		.type = QUIRK_SETUP_DISABLE_AUTOSUSPEND
+	}
 },
 /* Lenovo ThinkStation P620 Internal Speaker + Front Headset */
 {
 	USB_DEVICE(0x17aa, 0x104d),
-	QUIRK_DEVICE_PROFILE("Lenovo", "ThinkStation P620 Main",
-			     "Lenovo-ThinkStation-P620-Main"),
+	.driver_info = (unsigned long) & (const struct snd_usb_audio_quirk) {
+		.vendor_name = "Lenovo",
+		.product_name = "ThinkStation P620 Main",
+		.profile_name = "Lenovo-ThinkStation-P620-Main",
+		.ifnum = QUIRK_ANY_INTERFACE,
+		.type = QUIRK_SETUP_DISABLE_AUTOSUSPEND
+	}
 },
 
 /* Native Instruments MK2 series */
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index abf99b814a0f..b800fd92106c 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -518,6 +518,15 @@ static int setup_fmt_after_resume_quirk(struct snd_usb_audio *chip,
 	return 1;	/* Continue with creating streams and mixer */
 }
 
+static int setup_disable_autosuspend(struct snd_usb_audio *chip,
+				       struct usb_interface *iface,
+				       struct usb_driver *driver,
+				       const struct snd_usb_audio_quirk *quirk)
+{
+	driver->supports_autosuspend = 0;
+	return 1;	/* Continue with creating streams and mixer */
+}
+
 /*
  * audio-interface quirks
  *
@@ -557,6 +566,7 @@ int snd_usb_create_quirk(struct snd_usb_audio *chip,
 		[QUIRK_AUDIO_ALIGN_TRANSFER] = create_align_transfer_quirk,
 		[QUIRK_AUDIO_STANDARD_MIXER] = create_standard_mixer_quirk,
 		[QUIRK_SETUP_FMT_AFTER_RESUME] = setup_fmt_after_resume_quirk,
+		[QUIRK_SETUP_DISABLE_AUTOSUSPEND] = setup_disable_autosuspend,
 	};
 
 	if (quirk->type < QUIRK_TYPE_COUNT) {
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index b91c4c0807ec..6839915a0128 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -102,6 +102,7 @@ enum quirk_type {
 	QUIRK_AUDIO_ALIGN_TRANSFER,
 	QUIRK_AUDIO_STANDARD_MIXER,
 	QUIRK_SETUP_FMT_AFTER_RESUME,
+	QUIRK_SETUP_DISABLE_AUTOSUSPEND,
 
 	QUIRK_TYPE_COUNT
 };
-- 
2.17.1

