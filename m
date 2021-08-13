Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 517D23EB49C
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Aug 2021 13:36:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C67051750;
	Fri, 13 Aug 2021 13:35:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C67051750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628854565;
	bh=T6xi9vNe6QnKFj3hMo8tQDlrQhqe1auCXzn3McVu/6o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hvkhtlA8Til+XBdww+rnqSkXez63KMsXP/JB0kmcntrvqQctoCGX3MldHPGEBWsXK
	 3XXRhbCFg0Gg1mBB1cvT4fiC9SgS+WnNMrxf54hKYy5h0OAR38qHQ0hZdQyTgqIqgq
	 OceUbBEi3zfs5jOdWrCboJkBnh2LF0oTRHXioOXk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C6CAF8032D;
	Fri, 13 Aug 2021 13:34:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60CBFF802D2; Fri, 13 Aug 2021 13:34:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11F9EF800E5
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 13:34:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11F9EF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=zamaudio-com.20150623.gappssmtp.com
 header.i=@zamaudio-com.20150623.gappssmtp.com header.b="AquH0UbF"
Received: by mail-pj1-x102a.google.com with SMTP id
 qe12-20020a17090b4f8c00b00179321cbae7so4975484pjb.2
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 04:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zamaudio-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=HQgz32CBpurUGQG/1Iw1g5EhqbajqOv+UNmZF4nFQLk=;
 b=AquH0UbFWk9H4w6MtKbQYjTvfItkc1oaElaaPB23ztt613UG+GfGnWiUmeghPPNkzy
 EcaztIyvyhOlBOG6pqsi9KscY1enBmr5gh6q2pwjGhaClA7zybDQzyRStZvpfKyDlBVN
 m2TQkMZuY8TSuqLNyWdt6spNITDCPa1CcocEO37kBnILKKfQxWV0eMZX4Z+jrO7VCnK+
 fZj8dPtMJn38kaGqsLaaI9FIcIWydEi/iHS+d+Pz+wQ7u1owd+oLlgjwIQiE7wsl1Yta
 MikrInhxCmjmqMKU4oZuDFmyesFJ2bY3+fnvYHKJHQZ2yfHDDjySZuFexM66M+FYPbug
 bqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=HQgz32CBpurUGQG/1Iw1g5EhqbajqOv+UNmZF4nFQLk=;
 b=K0jzQtu8sBqRbSS8ZaQSowOOTF2OqTA/NoaWmcx50tCCiMT6o3EIgrtuchNRD8VMS6
 Gn1uT6Wi9yAq6mp8Bn/C564XxSKQ5v09wNIo9thMIA8m6iRr51SoSGmGQ5Xn83DWfdWr
 X5PfyVVxhzhU0W+1mUTtgGnKuVVYV3WbSAtgQ7c6Vy5oK+TIjJ/iHSua9+Mzvmrg54IO
 02fY8eO+aytR7oJjwNYyhAwyWFxzFsSVZ8wDAWrPRxNhbpQzaUcNkXPBqglovxlN2wyM
 sngCDHs4Jl1cblxx+y+2OrgRAUqfdhWutqztc6BykXCayyqwzVGV8gxvr1uRLDGRA6Pq
 4HOA==
X-Gm-Message-State: AOAM532PyWEsf/a28tpnoYLGG0kFSoPOf9vQ6yynCuvUd4u+eP//wOnU
 8TX0LKSsQN3wDPe0IuirdytzQaGSDo208w==
X-Google-Smtp-Source: ABdhPJxNQIQfliDHffniE9JKl3D74J5wgfvnyI80uz3YynNRGU4SfDp/l2bqBCBps05if//rAZn5rQ==
X-Received: by 2002:aa7:90d4:0:b029:3b3:2746:5449 with SMTP id
 k20-20020aa790d40000b02903b327465449mr2084571pfk.81.1628854462745; 
 Fri, 13 Aug 2021 04:34:22 -0700 (PDT)
Received: from zamx.lan (119-18-22-20.771216.mel.static.aussiebb.net.
 [119.18.22.20])
 by smtp.gmail.com with ESMTPSA id p34sm1915058pfh.172.2021.08.13.04.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 04:34:22 -0700 (PDT)
From: Damien Zammit <damien@zamaudio.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] usb-audio: Input source control - digidesign mbox
Date: Fri, 13 Aug 2021 21:34:02 +1000
Message-Id: <20210813113402.11849-1-damien@zamaudio.com>
X-Mailer: git-send-email 2.13.1
Cc: tiwai@suse.de, Damien Zammit <damien@zamaudio.com>
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

This adds a second mixer control to Digidesign Mbox
to select between Analog/SPDIF capture.

Users will note that selecting the SPDIF input source
automatically switches the clock mode to sync to SPDIF,
which is a feature of the hardware.

(You can change the clock source back to internal if you want
to capture from spdif but not sync to its clock although this mode
is probably not recommended).

Unfortunately, starting the stream resets both modes
to Internally clocked and Analog input mode.

Signed-off-by: Damien Zammit <damien@zamaudio.com>
Tested-by: Damien Zammit <damien@zamaudio.com>
---
 sound/usb/mixer_quirks.c | 265 ++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 203 insertions(+), 62 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 0a3cb8fd7..a66ce0375 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -594,85 +594,208 @@ static int snd_xonar_u1_controls_create(struct usb_mixer_interface *mixer)
 					  &snd_xonar_u1_output_switch, NULL);
 }
 
+/* Digidesign Mbox 1 helper functions */
+
+static int snd_mbox1_is_spdif_synced(struct snd_usb_audio *chip)
+{
+	unsigned char buff[3];
+	int err;
+	int is_spdif_synced;
+
+	/* Read clock source */
+	err = snd_usb_ctl_msg(chip->dev,
+			      usb_rcvctrlpipe(chip->dev, 0), 0x81,
+			      USB_DIR_IN |
+			      USB_TYPE_CLASS |
+			      USB_RECIP_ENDPOINT, 0x100, 0x81, buff, 3);
+	if (err < 0)
+		return err;
+
+	/* spdif sync: buff is all zeroes */
+	is_spdif_synced = !(buff[0] | buff[1] | buff[2]);
+	return is_spdif_synced;
+}
+
+static int snd_mbox1_set_clk_source(struct snd_usb_audio *chip, int rate_or_zero)
+{
+	/* 2 possibilities:	Internal    -> expects sample rate
+	 *			S/PDIF sync -> expects rate = 0
+	 */
+	unsigned char buff[3];
+
+	buff[0] = (rate_or_zero >>  0) & 0xff;
+	buff[1] = (rate_or_zero >>  8) & 0xff;
+	buff[2] = (rate_or_zero >> 16) & 0xff;
+
+	/* Set clock source */
+	return snd_usb_ctl_msg(chip->dev,
+			       usb_sndctrlpipe(chip->dev, 0), 0x1,
+			       USB_TYPE_CLASS |
+			       USB_RECIP_ENDPOINT, 0x100, 0x81, buff, 3);
+}
+
+static int snd_mbox1_is_spdif_input(struct snd_usb_audio *chip)
+{
+	/* Hardware gives 2 possibilities:	ANALOG Source  -> 0x01
+	 *					S/PDIF Source  -> 0x02
+	 */
+	int err;
+	unsigned char source[1];
+
+	/* Read input source */
+	err = snd_usb_ctl_msg(chip->dev,
+			      usb_rcvctrlpipe(chip->dev, 0), 0x81,
+			      USB_DIR_IN |
+			      USB_TYPE_CLASS |
+			      USB_RECIP_INTERFACE, 0x00, 0x500, source, 1);
+	if (err < 0)
+		return err;
+
+	return (source[0] == 2);
+}
+
+static int snd_mbox1_set_input_source(struct snd_usb_audio *chip, int is_spdif)
+{
+	/* NB: Setting the input source to S/PDIF resets the clock source to S/PDIF
+	 * Hardware expects 2 possibilities:	ANALOG Source  -> 0x01
+	 *					S/PDIF Source  -> 0x02
+	 */
+	unsigned char buff[1];
+
+	buff[0] = (is_spdif & 1) + 1;
+
+	/* Set input source */
+	return snd_usb_ctl_msg(chip->dev,
+			       usb_sndctrlpipe(chip->dev, 0), 0x1,
+			       USB_TYPE_CLASS |
+			       USB_RECIP_INTERFACE, 0x00, 0x500, buff, 1);
+}
+
 /* Digidesign Mbox 1 clock source switch (internal/spdif) */
 
-static int snd_mbox1_switch_get(struct snd_kcontrol *kctl,
-				struct snd_ctl_elem_value *ucontrol)
+static int snd_mbox1_clk_switch_get(struct snd_kcontrol *kctl,
+				    struct snd_ctl_elem_value *ucontrol)
 {
+	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kctl);
+	struct snd_usb_audio *chip = list->mixer->chip;
+	int err;
+
+	err = snd_usb_lock_shutdown(chip);
+	if (err < 0)
+		goto err;
+
+	err = snd_mbox1_is_spdif_synced(chip);
+	if (err < 0)
+		goto err;
+
+	kctl->private_value = err;
+	err = 0;
 	ucontrol->value.enumerated.item[0] = kctl->private_value;
-	return 0;
+err:
+	snd_usb_unlock_shutdown(chip);
+	return err;
 }
 
-static int snd_mbox1_switch_update(struct usb_mixer_interface *mixer, int val)
+static int snd_mbox1_clk_switch_update(struct usb_mixer_interface *mixer, int is_spdif_sync)
 {
 	struct snd_usb_audio *chip = mixer->chip;
 	int err;
-	unsigned char buff[3];
 
 	err = snd_usb_lock_shutdown(chip);
 	if (err < 0)
 		return err;
 
-	/* Prepare for magic command to toggle clock source */
-	err = snd_usb_ctl_msg(chip->dev,
-				usb_rcvctrlpipe(chip->dev, 0), 0x81,
-				USB_DIR_IN |
-				USB_TYPE_CLASS |
-				USB_RECIP_INTERFACE, 0x00, 0x500, buff, 1);
+	err = snd_mbox1_is_spdif_input(chip);
 	if (err < 0)
 		goto err;
-	err = snd_usb_ctl_msg(chip->dev,
-				usb_rcvctrlpipe(chip->dev, 0), 0x81,
-				USB_DIR_IN |
-				USB_TYPE_CLASS |
-				USB_RECIP_ENDPOINT, 0x100, 0x81, buff, 3);
+
+	err = snd_mbox1_is_spdif_synced(chip);
 	if (err < 0)
 		goto err;
 
-	/* 2 possibilities:	Internal    -> send sample rate
-	 *			S/PDIF sync -> send zeroes
-	 * NB: Sample rate locked to 48kHz on purpose to
-	 *     prevent user from resetting the sample rate
-	 *     while S/PDIF sync is enabled and confusing
-	 *     this configuration.
-	 */
-	if (val == 0) {
-		buff[0] = 0x80;
-		buff[1] = 0xbb;
-		buff[2] = 0x00;
-	} else {
-		buff[0] = buff[1] = buff[2] = 0x00;
-	}
+	/* FIXME: hardcoded sample rate */
+	err = snd_mbox1_set_clk_source(chip, is_spdif_sync ? 0 : 48000);
+	if (err < 0)
+		goto err;
 
-	/* Send the magic command to toggle the clock source */
-	err = snd_usb_ctl_msg(chip->dev,
-				usb_sndctrlpipe(chip->dev, 0), 0x1,
-				USB_TYPE_CLASS |
-				USB_RECIP_ENDPOINT, 0x100, 0x81, buff, 3);
+	err = snd_mbox1_is_spdif_synced(chip);
+err:
+	snd_usb_unlock_shutdown(chip);
+	return err;
+}
+
+static int snd_mbox1_clk_switch_put(struct snd_kcontrol *kctl,
+				    struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kctl);
+	struct usb_mixer_interface *mixer = list->mixer;
+	int err;
+	bool cur_val, new_val;
+
+	cur_val = kctl->private_value;
+	new_val = ucontrol->value.enumerated.item[0];
+	if (cur_val == new_val)
+		return 0;
+
+	kctl->private_value = new_val;
+	err = snd_mbox1_clk_switch_update(mixer, new_val);
+	return err < 0 ? err : 1;
+}
+
+static int snd_mbox1_clk_switch_info(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_info *uinfo)
+{
+	static const char *const texts[2] = {
+		"Internal",
+		"S/PDIF"
+	};
+
+	return snd_ctl_enum_info(uinfo, 1, ARRAY_SIZE(texts), texts);
+}
+
+static int snd_mbox1_clk_switch_resume(struct usb_mixer_elem_list *list)
+{
+	return snd_mbox1_clk_switch_update(list->mixer, list->kctl->private_value);
+}
+
+/* Digidesign Mbox 1 input source switch (analog/spdif) */
+
+static int snd_mbox1_src_switch_get(struct snd_kcontrol *kctl,
+				    struct snd_ctl_elem_value *ucontrol)
+{
+	ucontrol->value.enumerated.item[0] = kctl->private_value;
+	return 0;
+}
+
+static int snd_mbox1_src_switch_update(struct usb_mixer_interface *mixer, int is_spdif_input)
+{
+	struct snd_usb_audio *chip = mixer->chip;
+	int err;
+
+	err = snd_usb_lock_shutdown(chip);
+	if (err < 0)
+		return err;
+
+	err = snd_mbox1_is_spdif_input(chip);
 	if (err < 0)
 		goto err;
-	err = snd_usb_ctl_msg(chip->dev,
-				usb_rcvctrlpipe(chip->dev, 0), 0x81,
-				USB_DIR_IN |
-				USB_TYPE_CLASS |
-				USB_RECIP_ENDPOINT, 0x100, 0x81, buff, 3);
+
+	err = snd_mbox1_set_input_source(chip, is_spdif_input);
 	if (err < 0)
 		goto err;
-	err = snd_usb_ctl_msg(chip->dev,
-				usb_rcvctrlpipe(chip->dev, 0), 0x81,
-				USB_DIR_IN |
-				USB_TYPE_CLASS |
-				USB_RECIP_ENDPOINT, 0x100, 0x2, buff, 3);
+
+	err = snd_mbox1_is_spdif_input(chip);
 	if (err < 0)
 		goto err;
 
+	err = snd_mbox1_is_spdif_synced(chip);
 err:
 	snd_usb_unlock_shutdown(chip);
 	return err;
 }
 
-static int snd_mbox1_switch_put(struct snd_kcontrol *kctl,
-				struct snd_ctl_elem_value *ucontrol)
+static int snd_mbox1_src_switch_put(struct snd_kcontrol *kctl,
+				    struct snd_ctl_elem_value *ucontrol)
 {
 	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kctl);
 	struct usb_mixer_interface *mixer = list->mixer;
@@ -685,42 +808,60 @@ static int snd_mbox1_switch_put(struct snd_kcontrol *kctl,
 		return 0;
 
 	kctl->private_value = new_val;
-	err = snd_mbox1_switch_update(mixer, new_val);
+	err = snd_mbox1_src_switch_update(mixer, new_val);
 	return err < 0 ? err : 1;
 }
 
-static int snd_mbox1_switch_info(struct snd_kcontrol *kcontrol,
-				 struct snd_ctl_elem_info *uinfo)
+static int snd_mbox1_src_switch_info(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_info *uinfo)
 {
 	static const char *const texts[2] = {
-		"Internal",
+		"Analog",
 		"S/PDIF"
 	};
 
 	return snd_ctl_enum_info(uinfo, 1, ARRAY_SIZE(texts), texts);
 }
 
-static int snd_mbox1_switch_resume(struct usb_mixer_elem_list *list)
+static int snd_mbox1_src_switch_resume(struct usb_mixer_elem_list *list)
 {
-	return snd_mbox1_switch_update(list->mixer, list->kctl->private_value);
+	return snd_mbox1_src_switch_update(list->mixer, list->kctl->private_value);
 }
 
-static const struct snd_kcontrol_new snd_mbox1_switch = {
+static const struct snd_kcontrol_new snd_mbox1_clk_switch = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "Clock Source",
 	.index = 0,
 	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
-	.info = snd_mbox1_switch_info,
-	.get = snd_mbox1_switch_get,
-	.put = snd_mbox1_switch_put,
+	.info = snd_mbox1_clk_switch_info,
+	.get = snd_mbox1_clk_switch_get,
+	.put = snd_mbox1_clk_switch_put,
+	.private_value = 0
+};
+
+static const struct snd_kcontrol_new snd_mbox1_src_switch = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "Input Source",
+	.index = 1,
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+	.info = snd_mbox1_src_switch_info,
+	.get = snd_mbox1_src_switch_get,
+	.put = snd_mbox1_src_switch_put,
 	.private_value = 0
 };
 
-static int snd_mbox1_create_sync_switch(struct usb_mixer_interface *mixer)
+static int snd_mbox1_controls_create(struct usb_mixer_interface *mixer)
 {
-	return add_single_ctl_with_resume(mixer, 0,
-					  snd_mbox1_switch_resume,
-					  &snd_mbox1_switch, NULL);
+	int err;
+	err = add_single_ctl_with_resume(mixer, 0,
+					 snd_mbox1_clk_switch_resume,
+					 &snd_mbox1_clk_switch, NULL);
+	if (err < 0)
+		return err;
+
+	return add_single_ctl_with_resume(mixer, 1,
+					  snd_mbox1_src_switch_resume,
+					  &snd_mbox1_src_switch, NULL);
 }
 
 /* Native Instruments device quirks */
@@ -3029,7 +3170,7 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 		break;
 
 	case USB_ID(0x0dba, 0x1000): /* Digidesign Mbox 1 */
-		err = snd_mbox1_create_sync_switch(mixer);
+		err = snd_mbox1_controls_create(mixer);
 		break;
 
 	case USB_ID(0x17cc, 0x1011): /* Traktor Audio 6 */
-- 
2.13.1

