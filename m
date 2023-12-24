Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EFC81DC1B
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Dec 2023 20:29:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 235C8E92;
	Sun, 24 Dec 2023 20:29:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 235C8E92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703446161;
	bh=/US4CaPMwSd52vB9QViUJ2fbrEEOpUIl22Bv1c7OSr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qYFYUE+hbvjv1Fygq4He9s0big5mNwGmcLSn1qHWQDzxCnwPuRPcd2IHNV1nuaUQH
	 reAzG76Wl033HAy9BlLjUxs+LMV0sZziHmxV+HXTBfsTkLwwEWsbTqS+21o4eR0IT1
	 ZmaHQmCX9/0q9pVPSgY62vsWkY8z8rFtX7KZeYZQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C478F805BD; Sun, 24 Dec 2023 20:28:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EB1FF805BD;
	Sun, 24 Dec 2023 20:28:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C086AF8057B; Sun, 24 Dec 2023 20:28:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8363F805D9
	for <alsa-devel@alsa-project.org>; Sun, 24 Dec 2023 20:27:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8363F805D9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=jnJIkbdQ
Received: by m.b4.vu (Postfix, from userid 1000)
	id 04438604B9CB; Mon, 25 Dec 2023 05:57:53 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 04438604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703446073; bh=Ws/feJ3gr1b687HwKIWHvel3DvhnN9aMuEC4acX6rVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jnJIkbdQsAhbpO5jGnkURHsnxJXPYRcq4vtBeIzspTQp9ktOP1deuS25AbYhUPEqz
	 B5WyClk3GhWuadX3v9IZPysZhGIKoc5b1PF0qtkJ19Jp4kOrzV5ZSLDYbRO5I7P5KJ
	 2X9NRPkJ2mygjP44JMgIZ37YG1DN4dBBI4aspMZBuDSDI4R9HWRhaokIbUOSGyMP03
	 lGUimIhRRjNBreOVMAujxFCyCApytbLXJjEYRRJUotzdxmFEEsrot7czMhjsL+1u8b
	 H5KKIdkyd6RvKGwTVl5ayv4XeQgWsxAXVGtlbDuI5hTiN2KQc1OSB2W4fgOXLjburV
	 UshY8YBV9pS3g==
Date: Mon, 25 Dec 2023 05:57:52 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 12/23] ALSA: scarlett2: Parameterise notifications
Message-ID: <0ee2a3786f9d30c89eeae59d7e933424e8f39162.1703444932.git.g@b4.vu>
References: <cover.1703444932.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703444932.git.g@b4.vu>
Message-ID-Hash: TIOCJFHCG6RUI44L37AVS5SRP6W2CETR
X-Message-ID-Hash: TIOCJFHCG6RUI44L37AVS5SRP6W2CETR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TIOCJFHCG6RUI44L37AVS5SRP6W2CETR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The notification values were previously #define'd, and checked with a
series of if() statements calling functions. Replace with an array of
masks/callback function pointers, and a pointer to that array in the
scarlett2_config_set definitions.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 62 +++++++++++++++++++++++++++----------
 1 file changed, 45 insertions(+), 17 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 0fd919490cc6..64476922eee8 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -263,6 +263,29 @@ static const char *const scarlett2_dim_mute_names[SCARLETT2_DIM_MUTE_COUNT] = {
 	"Mute Playback Switch", "Dim Playback Switch"
 };
 
+/* Notification callback functions */
+struct scarlett2_notification {
+	u32 mask;
+	void (*func)(struct usb_mixer_interface *mixer);
+};
+
+static void scarlett2_notify_sync(struct usb_mixer_interface *mixer);
+static void scarlett2_notify_dim_mute(struct usb_mixer_interface *mixer);
+static void scarlett2_notify_monitor(struct usb_mixer_interface *mixer);
+static void scarlett2_notify_input_other(struct usb_mixer_interface *mixer);
+static void scarlett2_notify_monitor_other(struct usb_mixer_interface *mixer);
+
+/* Array of notification callback functions */
+static const struct scarlett2_notification scarlett2_notifications[] = {
+	{ 0x00000001, NULL }, /* ack, gets ignored */
+	{ 0x00000008, scarlett2_notify_sync },
+	{ 0x00200000, scarlett2_notify_dim_mute },
+	{ 0x00400000, scarlett2_notify_monitor },
+	{ 0x00800000, scarlett2_notify_input_other },
+	{ 0x01000000, scarlett2_notify_monitor_other },
+	{ 0, NULL }
+};
+
 /* Configuration parameters that can be read and written */
 enum {
 	SCARLETT2_CONFIG_DIM_MUTE,
@@ -293,11 +316,13 @@ struct scarlett2_config {
 };
 
 struct scarlett2_config_set {
+	const struct scarlett2_notification *notifications;
 	const struct scarlett2_config items[SCARLETT2_CONFIG_COUNT];
 };
 
 /* Gen 2 devices: 6i6, 18i8, 18i20 */
 static const struct scarlett2_config_set scarlett2_config_set_gen2 = {
+	.notifications = scarlett2_notifications,
 	.items = {
 		[SCARLETT2_CONFIG_DIM_MUTE] = {
 			.offset = 0x31, .size = 8, .activate = 2 },
@@ -324,6 +349,7 @@ static const struct scarlett2_config_set scarlett2_config_set_gen2 = {
 
 /* Gen 3 devices without a mixer (Solo and 2i2) */
 static const struct scarlett2_config_set scarlett2_config_set_gen3a = {
+	.notifications = scarlett2_notifications,
 	.items = {
 		[SCARLETT2_CONFIG_MSD_SWITCH] = {
 			.offset = 0x04, .size = 8, .activate = 6 },
@@ -347,6 +373,7 @@ static const struct scarlett2_config_set scarlett2_config_set_gen3a = {
 
 /* Gen 3 devices: 4i4, 8i6, 18i8, 18i20 */
 static const struct scarlett2_config_set scarlett2_config_set_gen3b = {
+	.notifications = scarlett2_notifications,
 	.items = {
 		[SCARLETT2_CONFIG_DIM_MUTE] = {
 			.offset = 0x31, .size = 8, .activate = 2 },
@@ -394,6 +421,7 @@ static const struct scarlett2_config_set scarlett2_config_set_gen3b = {
 
 /* Clarett USB and Clarett+ devices: 2Pre, 4Pre, 8Pre */
 static const struct scarlett2_config_set scarlett2_config_set_clarett = {
+	.notifications = scarlett2_notifications,
 	.items = {
 		[SCARLETT2_CONFIG_DIM_MUTE] = {
 			.offset = 0x31, .size = 8, .activate = 2 },
@@ -1274,13 +1302,6 @@ static int scarlett2_get_port_start_num(
 
 /*** USB Interactions ***/
 
-/* Notifications from the interface */
-#define SCARLETT2_USB_NOTIFY_SYNC          0x00000008
-#define SCARLETT2_USB_NOTIFY_DIM_MUTE      0x00200000
-#define SCARLETT2_USB_NOTIFY_MONITOR       0x00400000
-#define SCARLETT2_USB_NOTIFY_INPUT_OTHER   0x00800000
-#define SCARLETT2_USB_NOTIFY_MONITOR_OTHER 0x01000000
-
 /* Commands for sending/receiving requests/responses */
 #define SCARLETT2_USB_CMD_INIT 0
 #define SCARLETT2_USB_CMD_REQ  2
@@ -4745,21 +4766,28 @@ static void scarlett2_notify(struct urb *urb)
 	int len = urb->actual_length;
 	int ustatus = urb->status;
 	u32 data;
+	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_notification *notifications =
+		private->config_set->notifications;
 
 	if (ustatus != 0 || len != 8)
 		goto requeue;
 
 	data = le32_to_cpu(*(__le32 *)urb->transfer_buffer);
-	if (data & SCARLETT2_USB_NOTIFY_SYNC)
-		scarlett2_notify_sync(mixer);
-	if (data & SCARLETT2_USB_NOTIFY_MONITOR)
-		scarlett2_notify_monitor(mixer);
-	if (data & SCARLETT2_USB_NOTIFY_DIM_MUTE)
-		scarlett2_notify_dim_mute(mixer);
-	if (data & SCARLETT2_USB_NOTIFY_INPUT_OTHER)
-		scarlett2_notify_input_other(mixer);
-	if (data & SCARLETT2_USB_NOTIFY_MONITOR_OTHER)
-		scarlett2_notify_monitor_other(mixer);
+
+	while (data && notifications->mask) {
+		if (data & notifications->mask) {
+			data &= ~notifications->mask;
+			if (notifications->func)
+				notifications->func(mixer);
+		}
+		notifications++;
+	}
+
+	if (data)
+		usb_audio_warn(mixer->chip,
+			       "%s: Unhandled notification: 0x%08x\n",
+			       __func__, data);
 
 requeue:
 	if (ustatus != -ENOENT &&
-- 
2.43.0

