Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BE17D8801
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 20:06:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA848857;
	Thu, 26 Oct 2023 20:05:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA848857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698343610;
	bh=Gm5lKEdmAUzGHr5DsgvREl1eTfW1Ldc5Sao8k55pSbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lmSJMz6fLAUTt4/JMp/uSe0PEN4UHkyR1xYwP81qQvxaJ2JNEciJcm03FosBcZsOB
	 WaHreCC0mMjnyok2uHspgHygOHvcvfKHdZ58dw84g6WMQ0HZV/7ggAJToGxByf4vNC
	 mRLfKoJFFfXmP1uxVm4tBEoId8kQWv4hBmnmh/F4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24F70F80165; Thu, 26 Oct 2023 20:05:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BDBFEF80165;
	Thu, 26 Oct 2023 20:05:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 553C6F8019B; Thu, 26 Oct 2023 20:05:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54B92F8014B
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 20:05:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54B92F8014B
Received: by m.b4.vu (Postfix, from userid 1000)
	id B5525604F28E; Fri, 27 Oct 2023 04:35:46 +1030 (ACDT)
Date: Fri, 27 Oct 2023 04:35:46 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 3/5] ALSA: scarlett2: Add support for reading firmware version
Message-ID: <e76cd80c3445769e60c95df12c4635fc8abfe5c7.1698342632.git.g@b4.vu>
References: <cover.1698342632.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1698342632.git.g@b4.vu>
Message-ID-Hash: JK7NWJIH52RYSMG4T6QN2ZFYV4GYZVZU
X-Message-ID-Hash: JK7NWJIH52RYSMG4T6QN2ZFYV4GYZVZU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JK7NWJIH52RYSMG4T6QN2ZFYV4GYZVZU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The 84 bytes read during initialisation step 2 were previously
ignored. This patch retrieves the firmware version from bytes 8-11,
stores it in the scarlett2_data struct, and makes it available
through a new control "Firmware Version".

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 62 +++++++++++++++++++++++++++++++++++--
 1 file changed, 59 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 2f9619bc6d4f..9badb08177b5 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -406,6 +406,7 @@ struct scarlett2_data {
 	__u8 bInterval;
 	int num_mux_srcs;
 	int num_mux_dsts;
+	u32 firmware_version;
 	u16 scarlett2_seq;
 	u8 sync_updated;
 	u8 vol_updated;
@@ -1856,6 +1857,44 @@ static int scarlett2_add_new_ctl(struct usb_mixer_interface *mixer,
 	return 0;
 }
 
+/*** Firmware Version Control ***/
+
+static int scarlett2_firmware_version_ctl_get(
+	struct snd_kcontrol *kctl,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct scarlett2_data *private = elem->head.mixer->private_data;
+
+	ucontrol->value.integer.value[0] = private->firmware_version;
+
+	return 0;
+}
+
+static int scarlett2_firmware_version_ctl_info(
+	struct snd_kcontrol *kctl,
+	struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new scarlett2_firmware_version_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+	.access = SNDRV_CTL_ELEM_ACCESS_READ,
+	.name = "",
+	.info = scarlett2_firmware_version_ctl_info,
+	.get  = scarlett2_firmware_version_ctl_get
+};
+
+static int scarlett2_add_firmware_version_ctl(
+	struct usb_mixer_interface *mixer)
+{
+	return scarlett2_add_new_ctl(mixer, &scarlett2_firmware_version_ctl,
+				     0, 0, "Firmware Version", NULL);
+}
 /*** Sync Control ***/
 
 /* Update sync control after receiving notification that the status
@@ -3854,7 +3893,8 @@ static int scarlett2_usb_init(struct usb_mixer_interface *mixer)
 {
 	struct usb_device *dev = mixer->chip->dev;
 	struct scarlett2_data *private = mixer->private_data;
-	u8 buf[24];
+	u8 step0_buf[24];
+	u8 step2_buf[84];
 	int err;
 
 	if (usb_pipe_type_check(dev, usb_sndctrlpipe(dev, 0)))
@@ -3862,7 +3902,8 @@ static int scarlett2_usb_init(struct usb_mixer_interface *mixer)
 
 	/* step 0 */
 	err = scarlett2_usb_rx(dev, private->bInterfaceNumber,
-			       SCARLETT2_USB_CMD_INIT, buf, sizeof(buf));
+			       SCARLETT2_USB_CMD_INIT,
+			       step0_buf, sizeof(step0_buf));
 	if (err < 0)
 		return err;
 
@@ -3874,7 +3915,19 @@ static int scarlett2_usb_init(struct usb_mixer_interface *mixer)
 
 	/* step 2 */
 	private->scarlett2_seq = 1;
-	return scarlett2_usb(mixer, SCARLETT2_USB_INIT_2, NULL, 0, NULL, 84);
+	err = scarlett2_usb(mixer, SCARLETT2_USB_INIT_2,
+			    NULL, 0,
+			    step2_buf, sizeof(step2_buf));
+	if (err < 0)
+		return err;
+
+	/* extract 4-byte firmware version from step2_buf[8] */
+	private->firmware_version = le32_to_cpu(*(__le32 *)(step2_buf + 8));
+	usb_audio_info(mixer->chip,
+		       "Firmware version %d\n",
+		       private->firmware_version);
+
+	return 0;
 }
 
 /* Read configuration from the interface on start */
@@ -4192,6 +4245,9 @@ static int snd_scarlett2_controls_create(
 	if (err < 0)
 		return err;
 
+	/* Add firmware version control */
+	err = scarlett2_add_firmware_version_ctl(mixer);
+
 	/* Read volume levels and controls from the interface */
 	err = scarlett2_read_configs(mixer);
 	if (err < 0)
-- 
2.41.0

