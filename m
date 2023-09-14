Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B49C7A0BD5
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 19:34:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F01491E0;
	Thu, 14 Sep 2023 19:33:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F01491E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694712870;
	bh=q9DqaQz3/b/RbcWo7lnx57Q/iI65CHxoAocBz+Y92BM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aIbXxP6m1X9dMRGtX/JzJ/YCmd2LjDZnbo2cxMz8Z1QO1rD3id7X7AwjwDG6GBJYC
	 m9R6KnqSTCQ2j4gvbe9sp0BSXJndjz+EKrpth5H8t3QwN+YhfSYNOPLo96oBzZquq7
	 0u2yWIPcynP0fvtxQdZQi8UYDaUyjUMP3g7abAXQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93E9BF80568; Thu, 14 Sep 2023 19:33:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04D46F80552;
	Thu, 14 Sep 2023 19:33:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15B20F80552; Thu, 14 Sep 2023 19:33:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5F77F8047D
	for <alsa-devel@alsa-project.org>; Thu, 14 Sep 2023 19:33:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5F77F8047D
Received: by m.b4.vu (Postfix, from userid 1000)
	id D0F4F604F298; Fri, 15 Sep 2023 03:03:03 +0930 (ACST)
Date: Fri, 15 Sep 2023 03:03:03 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, Philippe Perrot <philippe@perrot-net.fr>
Subject: [PATCH 4/4] ALSA: scarlett2: Add correct product series name to
 messages
Message-ID: <3774b9d35bf1fbdd6fdad9f3f4f97e9b82ac76bf.1694705811.git.g@b4.vu>
References: <cover.1694705811.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1694705811.git.g@b4.vu>
Message-ID-Hash: IEL7EVPFR4FF2S222LG4YA347XMMGHZW
X-Message-ID-Hash: IEL7EVPFR4FF2S222LG4YA347XMMGHZW
X-MailFrom: g@b4.vu
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IEL7EVPFR4FF2S222LG4YA347XMMGHZW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver was originally developed for the Focusrite Scarlett Gen 2
series, but now also supports the Scarlett Gen 3 series, the
Clarett 8Pre USB, and the Clarett+ 8Pre. The messages output by the
driver on initialisation and error include the identifying text
"Scarlett Gen 2/3", but this is no longer accurate, and writing
"Scarlett Gen 2/3/Clarett USB/Clarett+" would be unwieldy.

Add series_name field to the scarlett2_device_entry struct so that
concise and accurate messages can be output.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 81 ++++++++++++++++++++++-----------
 1 file changed, 54 insertions(+), 27 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 9b668ea57cb6..481a80e160de 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -391,6 +391,7 @@ struct scarlett2_data {
 	struct mutex data_mutex; /* lock access to this data */
 	struct delayed_work work;
 	const struct scarlett2_device_info *info;
+	const char *series_name;
 	__u8 bInterfaceNumber;
 	__u8 bEndpointAddress;
 	__u16 wMaxPacketSize;
@@ -887,25 +888,26 @@ static const struct scarlett2_device_info clarett_8pre_info = {
 struct scarlett2_device_entry {
 	const u32 usb_id; /* USB device identifier */
 	const struct scarlett2_device_info *info;
+	const char *series_name;
 };
 
 static const struct scarlett2_device_entry scarlett2_devices[] = {
 	/* Supported Gen 2 devices */
-	{ USB_ID(0x1235, 0x8203), &s6i6_gen2_info },
-	{ USB_ID(0x1235, 0x8204), &s18i8_gen2_info },
-	{ USB_ID(0x1235, 0x8201), &s18i20_gen2_info },
+	{ USB_ID(0x1235, 0x8203), &s6i6_gen2_info, "Scarlett Gen 2" },
+	{ USB_ID(0x1235, 0x8204), &s18i8_gen2_info, "Scarlett Gen 2" },
+	{ USB_ID(0x1235, 0x8201), &s18i20_gen2_info, "Scarlett Gen 2" },
 
 	/* Supported Gen 3 devices */
-	{ USB_ID(0x1235, 0x8211), &solo_gen3_info },
-	{ USB_ID(0x1235, 0x8210), &s2i2_gen3_info },
-	{ USB_ID(0x1235, 0x8212), &s4i4_gen3_info },
-	{ USB_ID(0x1235, 0x8213), &s8i6_gen3_info },
-	{ USB_ID(0x1235, 0x8214), &s18i8_gen3_info },
-	{ USB_ID(0x1235, 0x8215), &s18i20_gen3_info },
+	{ USB_ID(0x1235, 0x8211), &solo_gen3_info, "Scarlett Gen 3" },
+	{ USB_ID(0x1235, 0x8210), &s2i2_gen3_info, "Scarlett Gen 3" },
+	{ USB_ID(0x1235, 0x8212), &s4i4_gen3_info, "Scarlett Gen 3" },
+	{ USB_ID(0x1235, 0x8213), &s8i6_gen3_info, "Scarlett Gen 3" },
+	{ USB_ID(0x1235, 0x8214), &s18i8_gen3_info, "Scarlett Gen 3" },
+	{ USB_ID(0x1235, 0x8215), &s18i20_gen3_info, "Scarlett Gen 3" },
 
 	/* Supported Clarett USB/Clarett+ devices */
-	{ USB_ID(0x1235, 0x8208), &clarett_8pre_info },
-	{ USB_ID(0x1235, 0x820c), &clarett_8pre_info },
+	{ USB_ID(0x1235, 0x8208), &clarett_8pre_info, "Clarett USB" },
+	{ USB_ID(0x1235, 0x820c), &clarett_8pre_info, "Clarett+" },
 
 	/* End of list */
 	{ 0, NULL },
@@ -1205,8 +1207,8 @@ static int scarlett2_usb(
 	if (err != req_buf_size) {
 		usb_audio_err(
 			mixer->chip,
-			"Scarlett Gen 2/3 USB request result cmd %x was %d\n",
-			cmd, err);
+			"%s USB request result cmd %x was %d\n",
+			private->series_name, cmd, err);
 		err = -EINVAL;
 		goto unlock;
 	}
@@ -1222,9 +1224,8 @@ static int scarlett2_usb(
 	if (err != resp_buf_size) {
 		usb_audio_err(
 			mixer->chip,
-			"Scarlett Gen 2/3 USB response result cmd %x was %d "
-			"expected %zu\n",
-			cmd, err, resp_buf_size);
+			"%s USB response result cmd %x was %d expected %zu\n",
+			private->series_name, cmd, err, resp_buf_size);
 		err = -EINVAL;
 		goto unlock;
 	}
@@ -1240,9 +1241,10 @@ static int scarlett2_usb(
 	    resp->pad) {
 		usb_audio_err(
 			mixer->chip,
-			"Scarlett Gen 2/3 USB invalid response; "
+			"%s USB invalid response; "
 			   "cmd tx/rx %d/%d seq %d/%d size %d/%d "
 			   "error %d pad %d\n",
+			private->series_name,
 			le32_to_cpu(req->cmd), le32_to_cpu(resp->cmd),
 			le16_to_cpu(req->seq), le16_to_cpu(resp->seq),
 			resp_size, le16_to_cpu(resp->size),
@@ -3721,7 +3723,7 @@ static int scarlett2_find_fc_interface(struct usb_device *dev,
 
 /* Initialise private data */
 static int scarlett2_init_private(struct usb_mixer_interface *mixer,
-				  const struct scarlett2_device_info *info)
+				  const struct scarlett2_device_entry *entry)
 {
 	struct scarlett2_data *private =
 		kzalloc(sizeof(struct scarlett2_data), GFP_KERNEL);
@@ -3737,7 +3739,8 @@ static int scarlett2_init_private(struct usb_mixer_interface *mixer,
 	mixer->private_free = scarlett2_private_free;
 	mixer->private_suspend = scarlett2_private_suspend;
 
-	private->info = info;
+	private->info = entry->info;
+	private->series_name = entry->series_name;
 	scarlett2_count_mux_io(private);
 	private->scarlett2_seq = 0;
 	private->mixer = mixer;
@@ -4058,19 +4061,28 @@ static int scarlett2_init_notify(struct usb_mixer_interface *mixer)
 	return usb_submit_urb(mixer->urb, GFP_KERNEL);
 }
 
-static int snd_scarlett_gen2_controls_create(struct usb_mixer_interface *mixer)
+static const struct scarlett2_device_entry *get_scarlett2_device_entry(
+	struct usb_mixer_interface *mixer)
 {
 	const struct scarlett2_device_entry *entry = scarlett2_devices;
-	int err;
 
 	/* Find entry in scarlett2_devices */
 	while (entry->usb_id && entry->usb_id != mixer->chip->usb_id)
 		entry++;
 	if (!entry->usb_id)
-		return -EINVAL;
+		return NULL;
+
+	return entry;
+}
+
+static int snd_scarlett_gen2_controls_create(
+	struct usb_mixer_interface *mixer,
+	const struct scarlett2_device_entry *entry)
+{
+	int err;
 
 	/* Initialise private data */
-	err = scarlett2_init_private(mixer, entry->info);
+	err = scarlett2_init_private(mixer, entry);
 	if (err < 0)
 		return err;
 
@@ -4154,17 +4166,30 @@ static int snd_scarlett_gen2_controls_create(struct usb_mixer_interface *mixer)
 int snd_scarlett_gen2_init(struct usb_mixer_interface *mixer)
 {
 	struct snd_usb_audio *chip = mixer->chip;
+	const struct scarlett2_device_entry *entry;
 	int err;
 
 	/* only use UAC_VERSION_2 */
 	if (!mixer->protocol)
 		return 0;
 
+	/* find entry in scarlett2_devices */
+	entry = get_scarlett2_device_entry(mixer);
+	if (!entry) {
+		usb_audio_err(mixer->chip,
+			      "%s: missing device entry for %04x:%04x\n",
+			      __func__,
+			      USB_ID_VENDOR(chip->usb_id),
+			      USB_ID_PRODUCT(chip->usb_id));
+		return 0;
+	}
+
 	if (chip->setup & SCARLETT2_DISABLE) {
 		usb_audio_info(chip,
-			"Focusrite Scarlett Gen 2/3 Mixer Driver disabled "
+			"Focusrite %s Mixer Driver disabled "
 			"by modprobe options (snd_usb_audio "
 			"vid=0x%04x pid=0x%04x device_setup=%d)\n",
+			entry->series_name,
 			USB_ID_VENDOR(chip->usb_id),
 			USB_ID_PRODUCT(chip->usb_id),
 			SCARLETT2_DISABLE);
@@ -4172,14 +4197,16 @@ int snd_scarlett_gen2_init(struct usb_mixer_interface *mixer)
 	}
 
 	usb_audio_info(chip,
-		"Focusrite Scarlett Gen 2/3 Mixer Driver enabled (pid=0x%04x); "
+		"Focusrite %s Mixer Driver enabled (pid=0x%04x); "
 		"report any issues to g@b4.vu",
+		entry->series_name,
 		USB_ID_PRODUCT(chip->usb_id));
 
-	err = snd_scarlett_gen2_controls_create(mixer);
+	err = snd_scarlett_gen2_controls_create(mixer, entry);
 	if (err < 0)
 		usb_audio_err(mixer->chip,
-			      "Error initialising Scarlett Mixer Driver: %d",
+			      "Error initialising %s Mixer Driver: %d",
+			      entry->series_name,
 			      err);
 
 	return err;
-- 
2.41.0

