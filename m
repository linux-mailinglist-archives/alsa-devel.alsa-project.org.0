Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7DF3E38EC
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Aug 2021 07:11:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE01A1684;
	Sun,  8 Aug 2021 07:10:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE01A1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628399486;
	bh=9l6p9ssq3IJo7+pSpuhZ4FPQZ+a15+rdXRt93b6F3nA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MKopYbq9eZfF1KUGxNk4TL3RFSgtmzqnwp1xNBZCdeYTUeNjLnDOuNXs1XXKgIi/K
	 ZFNfuPL6CbJNNQm/uAPRKNkqkF/zofGAwAFR1gb/qWgoLWX+j4SlN2ygREV8lGl/os
	 eRLBUvy166w0VvRxr3PZdv8E+1H10TenAayvJAyA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EBF1F8007E;
	Sun,  8 Aug 2021 07:09:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDAB3F801DB; Sun,  8 Aug 2021 07:09:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8FCCF800C9
 for <alsa-devel@alsa-project.org>; Sun,  8 Aug 2021 07:09:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8FCCF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=zamaudio-com.20150623.gappssmtp.com
 header.i=@zamaudio-com.20150623.gappssmtp.com header.b="Pmn7WX9q"
Received: by mail-pj1-x1036.google.com with SMTP id
 m10-20020a17090a34cab0290176b52c60ddso24423144pjf.4
 for <alsa-devel@alsa-project.org>; Sat, 07 Aug 2021 22:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zamaudio-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=vH3BJ/lPIglQ7rKFQqdEx7ox8fg9OJkD86wDQxbSjmk=;
 b=Pmn7WX9qrIYPpsXVJcCNREy2Oqa30s9U2L9QEQ475pQXDam9UwRDjmiqWZDTFkVGF1
 HxnWyymnGUvnJREvHTlMbpWtkfPXpkYP+c6omG6keL2txwoX8nEtjma+qLrhcCiDOOq7
 R937ryugHv1EJlUydreEuF7jPn4it4zHGBUmQ9ym1S1wtXd3Z8928adnaE/rGjQ/6auH
 aimz0yf6c9f6gSWEyvb0I464Kx1rrvfeE4G91GU35IieVFnCZIM9SOgdOOGvnFwEClRK
 BWoIWzDKjl0xulRcEqf0fx/vO2lWIh/FpwAdGRzGAmUedtCJXoVo3SdiiySUpO2Eb7Ej
 ERSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=vH3BJ/lPIglQ7rKFQqdEx7ox8fg9OJkD86wDQxbSjmk=;
 b=RR5UPyKwNUu557z7IRQ9nLcO8M66MwgefEUbrn6DAFJUSYuorjqzDnLNcsp5gncb7I
 5AMFSdPhA2BkitxHX96f0LHN3ienHJy6yTXzWJe/JtvgaBfykVh1u9V6gsUxMPmltZCB
 yGxcJA7+B6OSOqqp9OKyjk5BONkNSht4TvI71o3iOPG5tuTvzeijBBDJxyonuQbj/15D
 eCJfKE6bxXDUe+HqL/+ifDlPhEIr5/qofXU3zs2HYvFI+PFSaf6FByZzsocikKbgk/kL
 DA2Sr1vyL4j6gPtuw527khH7gFn/BHbKiffD1RGzROg9VtJo+j3F6KsDue1XpIkZI/cQ
 4q5A==
X-Gm-Message-State: AOAM532cJ/FF3p9bc6O6+BPTl2iJ/+FWaru/N/7zQpwFtIAlFhynfnz7
 vcpfGlcyuh/vy3qW5hsLsAeqyIVmM2SPZQ==
X-Google-Smtp-Source: ABdhPJzD70Zp21zEDl6iHXONGyfCbZrAQkXgNF6h2K5y/X7ICeb4MF6iEGTYeVwnwXWpt2fb8/x9+Q==
X-Received: by 2002:a63:fd52:: with SMTP id m18mr607990pgj.210.1628399384152; 
 Sat, 07 Aug 2021 22:09:44 -0700 (PDT)
Received: from zamx.lan (119-18-22-20.771216.mel.static.aussiebb.net.
 [119.18.22.20])
 by smtp.gmail.com with ESMTPSA id gz12sm17613731pjb.8.2021.08.07.22.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 22:09:43 -0700 (PDT)
From: Damien Zammit <damien@zamaudio.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] usb-audio: Input source control - digidesign mbox
Date: Sun,  8 Aug 2021 15:09:31 +1000
Message-Id: <20210808050931.59356-1-damien@zamaudio.com>
X-Mailer: git-send-email 2.13.1
Cc: Damien Zammit <damien@zamaudio.com>
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
---
 sound/usb/mixer_quirks.c | 197 +++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 175 insertions(+), 22 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 0a3cb8fd7..ef771bb3e 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -596,31 +596,53 @@ static int snd_xonar_u1_controls_create(struct usb_mixer_interface *mixer)
 
 /* Digidesign Mbox 1 clock source switch (internal/spdif) */
 
-static int snd_mbox1_switch_get(struct snd_kcontrol *kctl,
-				struct snd_ctl_elem_value *ucontrol)
+static int snd_mbox1_clk_switch_get(struct snd_kcontrol *kctl,
+				    struct snd_ctl_elem_value *ucontrol)
 {
+	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kctl);
+	struct snd_usb_audio *chip = list->mixer->chip;
+	unsigned char buff[3];
+
+	/* Read clock source */
+	snd_usb_ctl_msg(chip->dev,
+				usb_rcvctrlpipe(chip->dev, 0), 0x81,
+				USB_DIR_IN |
+				USB_TYPE_CLASS |
+				USB_RECIP_ENDPOINT, 0x100, 0x81, buff, 3);
+
+	if (!buff[0] && !buff[1] && !buff[2]) {
+		/* SPDIF synced */
+		kctl->private_value = 1;
+	} else {
+		/* Internally clocked */
+		kctl->private_value = 0;
+	}
+
 	ucontrol->value.enumerated.item[0] = kctl->private_value;
 	return 0;
 }
 
-static int snd_mbox1_switch_update(struct usb_mixer_interface *mixer, int val)
+static int snd_mbox1_clk_switch_update(struct usb_mixer_interface *mixer, int val)
 {
 	struct snd_usb_audio *chip = mixer->chip;
 	int err;
 	unsigned char buff[3];
+	unsigned char source[1];
 
 	err = snd_usb_lock_shutdown(chip);
 	if (err < 0)
 		return err;
 
-	/* Prepare for magic command to toggle clock source */
+	/* Read input source */
 	err = snd_usb_ctl_msg(chip->dev,
 				usb_rcvctrlpipe(chip->dev, 0), 0x81,
 				USB_DIR_IN |
 				USB_TYPE_CLASS |
-				USB_RECIP_INTERFACE, 0x00, 0x500, buff, 1);
+				USB_RECIP_INTERFACE, 0x00, 0x500, source, 1);
 	if (err < 0)
 		goto err;
+
+	/* Read clock source */
 	err = snd_usb_ctl_msg(chip->dev,
 				usb_rcvctrlpipe(chip->dev, 0), 0x81,
 				USB_DIR_IN |
@@ -644,13 +666,15 @@ static int snd_mbox1_switch_update(struct usb_mixer_interface *mixer, int val)
 		buff[0] = buff[1] = buff[2] = 0x00;
 	}
 
-	/* Send the magic command to toggle the clock source */
+	/* Toggle clock source */
 	err = snd_usb_ctl_msg(chip->dev,
 				usb_sndctrlpipe(chip->dev, 0), 0x1,
 				USB_TYPE_CLASS |
 				USB_RECIP_ENDPOINT, 0x100, 0x81, buff, 3);
 	if (err < 0)
 		goto err;
+
+	/* Read clock source */
 	err = snd_usb_ctl_msg(chip->dev,
 				usb_rcvctrlpipe(chip->dev, 0), 0x81,
 				USB_DIR_IN |
@@ -671,8 +695,8 @@ static int snd_mbox1_switch_update(struct usb_mixer_interface *mixer, int val)
 	return err;
 }
 
-static int snd_mbox1_switch_put(struct snd_kcontrol *kctl,
-				struct snd_ctl_elem_value *ucontrol)
+static int snd_mbox1_clk_switch_put(struct snd_kcontrol *kctl,
+				    struct snd_ctl_elem_value *ucontrol)
 {
 	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kctl);
 	struct usb_mixer_interface *mixer = list->mixer;
@@ -685,12 +709,12 @@ static int snd_mbox1_switch_put(struct snd_kcontrol *kctl,
 		return 0;
 
 	kctl->private_value = new_val;
-	err = snd_mbox1_switch_update(mixer, new_val);
+	err = snd_mbox1_clk_switch_update(mixer, new_val);
 	return err < 0 ? err : 1;
 }
 
-static int snd_mbox1_switch_info(struct snd_kcontrol *kcontrol,
-				 struct snd_ctl_elem_info *uinfo)
+static int snd_mbox1_clk_switch_info(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_info *uinfo)
 {
 	static const char *const texts[2] = {
 		"Internal",
@@ -700,27 +724,156 @@ static int snd_mbox1_switch_info(struct snd_kcontrol *kcontrol,
 	return snd_ctl_enum_info(uinfo, 1, ARRAY_SIZE(texts), texts);
 }
 
-static int snd_mbox1_switch_resume(struct usb_mixer_elem_list *list)
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
+	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kctl);
+	struct snd_usb_audio *chip = list->mixer->chip;
+	unsigned char source[1];
+
+	/* Read input source */
+	snd_usb_ctl_msg(chip->dev,
+				usb_rcvctrlpipe(chip->dev, 0), 0x81,
+				USB_DIR_IN |
+				USB_TYPE_CLASS |
+				USB_RECIP_INTERFACE, 0x00, 0x500, source, 1);
+
+	kctl->private_value = source[0] - 1;
+	ucontrol->value.enumerated.item[0] = kctl->private_value;
+	return 0;
+}
+
+static int snd_mbox1_src_switch_update(struct usb_mixer_interface *mixer, int val)
+{
+	struct snd_usb_audio *chip = mixer->chip;
+	int err;
+	unsigned char buff[3];
+	unsigned char source[1];
+
+	err = snd_usb_lock_shutdown(chip);
+	if (err < 0)
+		return err;
+
+	/* Read input source */
+	err = snd_usb_ctl_msg(chip->dev,
+				usb_rcvctrlpipe(chip->dev, 0), 0x81,
+				USB_DIR_IN |
+				USB_TYPE_CLASS |
+				USB_RECIP_INTERFACE, 0x00, 0x500, source, 1);
+	if (err < 0)
+		goto err;
+
+	/* 2 possibilities:	ANALOG Source  -> 0x01
+	 *			S/PDIF Source  -> 0x02
+	 * Setting the input source to S/PDIF resets the clock source to S/PDIF
+	 */
+	source[0] = (val + 1) & 0xff;
+
+	/* Toggle the input source */
+	err = snd_usb_ctl_msg(chip->dev,
+				usb_sndctrlpipe(chip->dev, 0), 0x1,
+				USB_TYPE_CLASS |
+				USB_RECIP_INTERFACE, 0x00, 0x500, source, 1);
+	if (err < 0)
+		goto err;
+
+	/* Read input source */
+	err = snd_usb_ctl_msg(chip->dev,
+				usb_rcvctrlpipe(chip->dev, 0), 0x81,
+				USB_DIR_IN |
+				USB_TYPE_CLASS |
+				USB_RECIP_INTERFACE, 0x00, 0x500, source, 1);
+	if (err < 0)
+		goto err;
+
+	/* Read clock source */
+	err = snd_usb_ctl_msg(chip->dev,
+				usb_rcvctrlpipe(chip->dev, 0), 0x81,
+				USB_DIR_IN |
+				USB_TYPE_CLASS |
+				USB_RECIP_ENDPOINT, 0x100, 0x81, buff, 3);
+	if (err < 0)
+		goto err;
+err:
+	snd_usb_unlock_shutdown(chip);
+	return err;
+}
+
+static int snd_mbox1_src_switch_put(struct snd_kcontrol *kctl,
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
+	err = snd_mbox1_src_switch_update(mixer, new_val);
+	return err < 0 ? err : 1;
+}
+
+static int snd_mbox1_src_switch_info(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_info *uinfo)
+{
+	static const char *const texts[2] = {
+		"Analog",
+		"S/PDIF"
+	};
+
+	return snd_ctl_enum_info(uinfo, 1, ARRAY_SIZE(texts), texts);
+}
+
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
@@ -3029,7 +3182,7 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 		break;
 
 	case USB_ID(0x0dba, 0x1000): /* Digidesign Mbox 1 */
-		err = snd_mbox1_create_sync_switch(mixer);
+		err = snd_mbox1_controls_create(mixer);
 		break;
 
 	case USB_ID(0x17cc, 0x1011): /* Traktor Audio 6 */
-- 
2.13.1

