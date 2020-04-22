Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB94D1B4358
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Apr 2020 13:35:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4333316BA;
	Wed, 22 Apr 2020 13:34:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4333316BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587555315;
	bh=CgCHLacwUzYhqpq52JZ9FCAuQOfE84Yp2C6+rnaztOg=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FFCRQ/cBBMyfo2qe3oz88T+ndgPXnbm4/J37GPd295Dq9c5WqrsNbbpiRwZM0J1S6
	 jtiUDNaqJVzBCD7dHam6oHAiBwUwMXCB/WtYgKLcKSGUUIYopQ/6HcwGTyYf38Tgch
	 K1UrKDy0pgH9ZQc2GQo8D83JcIb41j9x00QXidPs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 593C9F800F2;
	Wed, 22 Apr 2020 13:33:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63777F80142; Wed, 22 Apr 2020 13:33:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3F7EF800FF
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 13:33:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3F7EF800FF
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 257A5AF2C
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 11:33:21 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Add connector notifier delegation
Date: Wed, 22 Apr 2020 13:33:20 +0200
Message-Id: <20200422113320.26664-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
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

It turned out that ALC1220-VB USB-audio device gives the interrupt
event to some PCM terminals while those don't allow the connector
state request but only the actual I/O terminals return the request.
The recent commit 7dc3c5a0172e ("ALSA: usb-audio: Don't create jack
controls for PCM terminals") excluded those phantom terminals, so
those events are ignored, too.

My first thought was that this could be easily deduced from the
associated terminals, but some of them have even no associate terminal
ID, hence it's not too trivial to figure out.

Since the number of such terminals are small and limited, this patch
implements another quirk table for the simple mapping of the
connectors.  It's not really scalable, but let's hope that there will
be not many such funky devices in future.

Fixes: 7dc3c5a0172e ("ALSA: usb-audio: Don't create jack controls for PCM terminals")
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=206873
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c      | 25 +++++++++++++++++++++++++
 sound/usb/mixer.h      | 10 ++++++++++
 sound/usb/mixer_maps.c | 13 +++++++++++++
 3 files changed, 48 insertions(+)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index ecd5036a0b44..a88d7854513b 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -3117,6 +3117,7 @@ static int snd_usb_mixer_controls(struct usb_mixer_interface *mixer)
 		if (map->id == state.chip->usb_id) {
 			state.map = map->map;
 			state.selector_map = map->selector_map;
+			mixer->connector_map = map->connector_map;
 			mixer->ignore_ctl_error |= map->ignore_ctl_error;
 			break;
 		}
@@ -3198,10 +3199,32 @@ static int snd_usb_mixer_controls(struct usb_mixer_interface *mixer)
 	return 0;
 }
 
+static int delegate_notify(struct usb_mixer_interface *mixer, int unitid,
+			   u8 *control, u8 *channel)
+{
+	const struct usbmix_connector_map *map = mixer->connector_map;
+
+	if (!map)
+		return unitid;
+
+	for (; map->id; map++) {
+		if (map->id == unitid) {
+			if (control && map->control)
+				*control = map->control;
+			if (channel && map->channel)
+				*channel = map->channel;
+			return map->delegated_id;
+		}
+	}
+	return unitid;
+}
+
 void snd_usb_mixer_notify_id(struct usb_mixer_interface *mixer, int unitid)
 {
 	struct usb_mixer_elem_list *list;
 
+	unitid = delegate_notify(mixer, unitid, NULL, NULL);
+
 	for_each_mixer_elem(list, mixer, unitid) {
 		struct usb_mixer_elem_info *info =
 			mixer_elem_list_to_info(list);
@@ -3271,6 +3294,8 @@ static void snd_usb_mixer_interrupt_v2(struct usb_mixer_interface *mixer,
 		return;
 	}
 
+	unitid = delegate_notify(mixer, unitid, &control, &channel);
+
 	for_each_mixer_elem(list, mixer, unitid)
 		count++;
 
diff --git a/sound/usb/mixer.h b/sound/usb/mixer.h
index 65d6d08c96f5..41ec9dc4139b 100644
--- a/sound/usb/mixer.h
+++ b/sound/usb/mixer.h
@@ -6,6 +6,13 @@
 
 struct media_mixer_ctl;
 
+struct usbmix_connector_map {
+	u8 id;
+	u8 delegated_id;
+	u8 control;
+	u8 channel;
+};
+
 struct usb_mixer_interface {
 	struct snd_usb_audio *chip;
 	struct usb_host_interface *hostif;
@@ -18,6 +25,9 @@ struct usb_mixer_interface {
 	/* the usb audio specification version this interface complies to */
 	int protocol;
 
+	/* optional connector delegation map */
+	const struct usbmix_connector_map *connector_map;
+
 	/* Sound Blaster remote control stuff */
 	const struct rc_config *rc_cfg;
 	u32 rc_code;
diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index fb2c4a992951..0260c750e156 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -27,6 +27,7 @@ struct usbmix_ctl_map {
 	u32 id;
 	const struct usbmix_name_map *map;
 	const struct usbmix_selector_map *selector_map;
+	const struct usbmix_connector_map *connector_map;
 	int ignore_ctl_error;
 };
 
@@ -387,6 +388,15 @@ static const struct usbmix_name_map trx40_mobo_map[] = {
 	{}
 };
 
+static const struct usbmix_connector_map trx40_mobo_connector_map[] = {
+	{ 10, 16 },	/* (Back) Speaker */
+	{ 11, 17 },	/* Front Headphone */
+	{ 13, 7 },	/* Line */
+	{ 14, 8 },	/* Mic */
+	{ 15, 9 },	/* Front Mic */
+	{}
+};
+
 /*
  * Control map entries
  */
@@ -519,6 +529,7 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
 	{	/* Gigabyte TRX40 Aorus Pro WiFi */
 		.id = USB_ID(0x0414, 0xa002),
 		.map = trx40_mobo_map,
+		.connector_map = trx40_mobo_connector_map,
 	},
 	{	/* ASUS ROG Zenith II */
 		.id = USB_ID(0x0b05, 0x1916),
@@ -531,10 +542,12 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
 	{	/* MSI TRX40 Creator */
 		.id = USB_ID(0x0db0, 0x0d64),
 		.map = trx40_mobo_map,
+		.connector_map = trx40_mobo_connector_map,
 	},
 	{	/* MSI TRX40 */
 		.id = USB_ID(0x0db0, 0x543d),
 		.map = trx40_mobo_map,
+		.connector_map = trx40_mobo_connector_map,
 	},
 	{ 0 } /* terminator */
 };
-- 
2.16.4

