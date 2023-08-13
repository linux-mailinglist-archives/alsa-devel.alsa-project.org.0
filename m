Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6267077A917
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Aug 2023 18:10:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0A8D950;
	Sun, 13 Aug 2023 18:09:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0A8D950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691943007;
	bh=GS+Z5Ie8MPb08boeC76G752Mhn5+/4Pvwb++EA6lp+Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K64BBYvg+q1/NWs7E6TwRPIj2EPSKUY9xIS4y/uveOUF6k9DErKLPE4NzCxEEUN+y
	 DMKRLDOdFzHdE6zvfwSfyPBqIiyqyPkfRUgSV3cwqX0krNSVrWCmX56o8G/64QMU1F
	 z+7cpCpUFIHtD+VBB/dNaXXpiSzmhAVeOQqOVd8s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF260F805B1; Sun, 13 Aug 2023 18:08:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B22EF80564;
	Sun, 13 Aug 2023 18:08:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D84EAF8025F; Sun, 13 Aug 2023 18:08:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A63C0F8025F
	for <alsa-devel@alsa-project.org>; Sun, 13 Aug 2023 18:08:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A63C0F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Jl4LESFG
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 93F2C6391F;
	Sun, 13 Aug 2023 16:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB8BEC433C8;
	Sun, 13 Aug 2023 16:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691942912;
	bh=GS+Z5Ie8MPb08boeC76G752Mhn5+/4Pvwb++EA6lp+Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jl4LESFGdfz1fzlrqwjfl3UplKx00kYmHpmYFxi5DiNHKDsC60Pa7vXsQ9+aZ8O53
	 rdYmuZjEtCDWv9QrT6g5h4obVyh7c1qLlo+FkNeBmbsOy0AbnDf7HNCvymzEX1VM1k
	 /rXrkDVP5Un0k9kFrnkfyayFe4cjpvc0BsZj9U7CQ7hLpb40Rimg0dvUg+hMsblJBf
	 +h5tlo9kuFhxne/sQ6tA4HpFPqJ+sLxy/uZAZBVMbw5DP8OPLnTyCgfPis03F5mIJ2
	 78HckGRm3UxivtwiWUCJu1AVGqceF9CvO8sJBTPW3JGkVONbQCKf3VxrTVH9sJ32pS
	 Poup0qu4RLN+w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Sasha Levin <sashal@kernel.org>,
	perex@perex.cz,
	tiwai@suse.com,
	jussi@sonarnerd.net,
	connerknoxpublic@gmail.com,
	ltyl@hem-e.com,
	aichao@kylinos.cn,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 5.15 21/31] ALSA: usb-audio: Add quirk for Microsoft
 Modern Wireless Headset
Date: Sun, 13 Aug 2023 12:05:54 -0400
Message-Id: <20230813160605.1080385-21-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230813160605.1080385-1-sashal@kernel.org>
References: <20230813160605.1080385-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.126
Content-Transfer-Encoding: 8bit
Message-ID-Hash: L6UC2WESYBON7TIAFU7AQCPCUY6E3REY
X-Message-ID-Hash: L6UC2WESYBON7TIAFU7AQCPCUY6E3REY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L6UC2WESYBON7TIAFU7AQCPCUY6E3REY/>
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
index 3f8f6056ff6a5..8e0915f02b26f 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -366,6 +366,15 @@ static const struct usbmix_name_map corsair_virtuoso_map[] = {
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
@@ -625,6 +634,11 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
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
index 8de572e774ddc..e5eab3b84b3f7 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1747,6 +1747,9 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
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

