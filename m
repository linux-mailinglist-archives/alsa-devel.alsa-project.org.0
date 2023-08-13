Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA93677A811
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Aug 2023 17:53:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6518584B;
	Sun, 13 Aug 2023 17:53:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6518584B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691942039;
	bh=xoWufMfn1e3dz1UYLsmn8MdPmXGbojAH7O7dCoGmzFc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Lbj/C1lh9lEK4ckLrBCHHXKFbh6rYWTWtAhklOZ3cp87BKB6fsFXGUPuUQEVGt1dK
	 fcldwSyX+qgwZz2VB44krFyFhnraVK0GcOx1FcpHlxa5q1s0OPVS6QhUOe9tGhnI3f
	 JeWyTqd475aS1M5Uet5me/vZ+pEpkFwJVzhB4RMQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9C70F8055C; Sun, 13 Aug 2023 17:51:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84211F80254;
	Sun, 13 Aug 2023 17:51:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC59BF80536; Sun, 13 Aug 2023 17:51:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0AD9EF80272
	for <alsa-devel@alsa-project.org>; Sun, 13 Aug 2023 17:51:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AD9EF80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IhMXCWpU
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EF56E632AD;
	Sun, 13 Aug 2023 15:51:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E50C433C8;
	Sun, 13 Aug 2023 15:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691941902;
	bh=xoWufMfn1e3dz1UYLsmn8MdPmXGbojAH7O7dCoGmzFc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IhMXCWpULNLzPEiQnS7B01BvdJsnF9zdpylRoT2kt+lKEFMmC26y7t50dNhHws4hF
	 OB3Uewpih7y6f0hTVdIg0njX8ede+ZhDjz/aWWq/jqXANY3d1DSlinH3cKSk19bACA
	 S59K5x34gxjG2QCmdnGvy0WH5KVzz1CfbVq0KYcFmFBynDA3dsqQ9BLawzkSLUUQN7
	 X1DHLM7Hcs8LGz3yjTAJOhCInRXOpg9Gn0uE1kgBCHov4hahuScvKOA+B+/ZLLh7NJ
	 gyrZs6tPKS313365XU+IVIFm8v9O/t1CXv/x6x9g8prMBLqGs3y4Lg7WDMNQbBFdbU
	 i9JVJ0rTqVdAw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Sasha Levin <sashal@kernel.org>,
	perex@perex.cz,
	tiwai@suse.com,
	jussi@sonarnerd.net,
	john@keeping.me.uk,
	ltyl@hem-e.com,
	aichao@kylinos.cn,
	connerknoxpublic@gmail.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.4 34/54] ALSA: usb-audio: Add quirk for Microsoft
 Modern Wireless Headset
Date: Sun, 13 Aug 2023 11:49:13 -0400
Message-Id: <20230813154934.1067569-34-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230813154934.1067569-1-sashal@kernel.org>
References: <20230813154934.1067569-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.10
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KGJ46UPK5G3RGTV5IRL4YXFY4NOHH3HU
X-Message-ID-Hash: KGJ46UPK5G3RGTV5IRL4YXFY4NOHH3HU
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KGJ46UPK5G3RGTV5IRL4YXFY4NOHH3HU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit 3da435063777f8d861ba5a165344e3f75f839357 ]

Microsoft Modern Wireless Headset (appearing on the host as "Microsoft
USB Link") has a playback and a capture mixer volume/switch, but they
are fairly broken.  The descriptor reports wrong dB ranges for
playback, and the capture volume/switch don't influence on the actual
recording at all.  Moreover, there seem instabilities in the
connection, and at best, we should disable the runtime PM.

So this ended up with a quirk entry for:
- Correct the playback dB range;
  I picked up some reasonable values but it's a guess work
- Disable the capture mixer;
  it's completely useless and confuses PA/PW
- Suppress get-sample-rate, apply the delay for message handling,
  and suppress the auto-suspend

The behavior of the wheel control on the headset is somehow flaky,
too, but it's an issue of HID.

Link: https://bugzilla.suse.com/show_bug.cgi?id=1207129
Link: https://lore.kernel.org/r/20230725092057.15115-1-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/mixer_maps.c | 14 ++++++++++++++
 sound/usb/quirks.c     |  3 +++
 2 files changed, 17 insertions(+)

diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index f4bd1e8ae4b6c..23260aa1919d3 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -374,6 +374,15 @@ static const struct usbmix_name_map corsair_virtuoso_map[] = {
 	{ 0 }
 };
 
+/* Microsoft USB Link headset */
+/* a guess work: raw playback volume values are from 2 to 129 */
+static const struct usbmix_dB_map ms_usb_link_dB = { -3225, 0, true };
+static const struct usbmix_name_map ms_usb_link_map[] = {
+	{ 9, NULL, .dB = &ms_usb_link_dB },
+	{ 10, NULL }, /* Headset Capture volume; seems non-working, disabled */
+	{ 0 }   /* terminator */
+};
+
 /* ASUS ROG Zenith II with Realtek ALC1220-VB */
 static const struct usbmix_name_map asus_zenith_ii_map[] = {
 	{ 19, NULL, 12 }, /* FU, Input Gain Pad - broken response, disabled */
@@ -668,6 +677,11 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
 		.id = USB_ID(0x1395, 0x0025),
 		.map = sennheiser_pc8_map,
 	},
+	{
+		/* Microsoft USB Link headset */
+		.id = USB_ID(0x045e, 0x083c),
+		.map = ms_usb_link_map,
+	},
 	{ 0 } /* terminator */
 };
 
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 6cf55b7f7a041..d4a7ffef82194 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2011,6 +2011,9 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_IGNORE_CTL_ERROR),
 	DEVICE_FLG(0x041e, 0x4080, /* Creative Live Cam VF0610 */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x045e, 0x083c, /* MS USB Link headset */
+		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_CTL_MSG_DELAY |
+		   QUIRK_FLAG_DISABLE_AUTOSUSPEND),
 	DEVICE_FLG(0x046d, 0x084c, /* Logitech ConferenceCam Connect */
 		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_CTL_MSG_DELAY_1M),
 	DEVICE_FLG(0x046d, 0x0991, /* Logitech QuickCam Pro */
-- 
2.40.1

