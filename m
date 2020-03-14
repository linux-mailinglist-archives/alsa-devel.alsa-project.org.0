Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A55185B41
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Mar 2020 09:37:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C64351868;
	Sun, 15 Mar 2020 09:36:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C64351868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584261444;
	bh=3laAiu2VvREGpgqAj0aiP30tmk5uzSErljtJ7WXKz0Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JRabx5xvXDDpIbbqnh3ZDMpTK72n7XP7Piyt2DuqvIER+3xsJCZJMnyKO0FAlYLzp
	 h5apqtNKyihpoZxpGrWnwVYvx9u0xGG1JC6W5mob2+w/PNLNZFE30GIE27URQgiwrP
	 77HT70eXx0yW3REzkbdLe0ybytaoGuwzcImS5JaU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4477F8029B;
	Sun, 15 Mar 2020 09:33:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5749EF8021C; Sat, 14 Mar 2020 17:54:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E327F8013E;
 Sat, 14 Mar 2020 17:54:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E327F8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nGwYLBk6"
Received: by mail-qt1-x842.google.com with SMTP id g16so10468554qtp.9;
 Sat, 14 Mar 2020 09:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gG0n5v0DJ2CMFnKfmL4vCD/r91Sm0q8EkQU7ojDfwss=;
 b=nGwYLBk6vfcZCKwlcHbEE6NIYIZ5jsXy3c1noMDupnxVBFt/bm/fQ1aKpR66Thdpkc
 f+DZgmP3rUjYABL9ICOqVVCEKCnf4/9dTJH/eoOwDGYxMm7zlCWUaMX13+onlTVgaKrJ
 b1UA0VR3jrF0dPIp5HuNtVe6/MXRXfYNpNtV7+rJ20Ghd9lMajR0sS2kuE8/75F03RX6
 VcAWpKJeVdXjIGMHNLEIbN0zn3yCfE4LVVgHK04ZFf+YshQZNSrIYJFJw6AIPkfqFdaJ
 F+JhLmlFQnLVWVWu3sX8nvlPH1VB7eqbLZ+eVmyG1SyN1xivp9Asft0BFUqY2l4HO6lw
 zrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gG0n5v0DJ2CMFnKfmL4vCD/r91Sm0q8EkQU7ojDfwss=;
 b=m/w9xs6LGjKFVDxoPHbCiMx3nnFmeVC87YYIhrG4O+QF3tVtichD0a+/R9eA2O7erT
 3AycoM8JQA34iBt/KnBTRl47oK0NRxAGNoY7IlZ1v+PRHJ+ojHOEqjb5fpixRJ4/ZIn4
 ZMPkLc0Bbx7k701j6Rtn8V30d7I85wcgcqASE5ZaCmZQc2yYgt2mx0yqBi4mRwm9iUPX
 tQwseej7tuDp3jogel+3HzxRPkO6+xSg4qAI6ef9OThl/DObjf9Si1GYc/TJRNfu+S4Z
 iZ8kmK2TSLiyzTeLpklAki+iFi6X6TxTfhliCE//QuT5NEm7eGw3CLm+P5LLAZjzuBsQ
 PgRg==
X-Gm-Message-State: ANhLgQ2O4RhGXx3YpE1856ODPouEHplgCGBfgmTKVPcJpm+ujKzx334v
 VHDt3BBWu+3XFWWNxDQUEpD5/NRm
X-Google-Smtp-Source: ADFU+vs9bi9uMD45mkOqwbefkxqWYV8wE/gS83OngBQTL6ziJLd2gAodnUl4ckQqlYl/ErexoECVyw==
X-Received: by 2002:ac8:534b:: with SMTP id d11mr10823086qto.101.1584204857022; 
 Sat, 14 Mar 2020 09:54:17 -0700 (PDT)
Received: from cybertron.pseudoangel.com
 (cpe-172-101-252-194.rochester.res.rr.com. [172.101.252.194])
 by smtp.gmail.com with ESMTPSA id q24sm7969363qtk.45.2020.03.14.09.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Mar 2020 09:54:16 -0700 (PDT)
From: crwulff@gmail.com
To: patch@alsa-project.org
Subject: [PATCH Fix for Kingston HyperX Amp (0951:16d8) (Try #2) 1/2]
 snd-usb-audio: Fix mixer controls' USB interface
Date: Sat, 14 Mar 2020 12:54:48 -0400
Message-Id: <20200314165449.4086-2-crwulff@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200314165449.4086-1-crwulff@gmail.com>
References: <20200314165449.4086-1-crwulff@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 15 Mar 2020 09:32:59 +0100
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Chris Wulff <crwulff@gmail.com>
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

From: Chris Wulff <crwulff@gmail.com>

Use the USB interface of the mixer that the control
was created on instead of the default control interface.

This fixes the Kingston HyperX AMP (0951:16d8) which has
controls on two interfaces.

Signed-off-by: Chris Wulff <crwulff@gmail.com>

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 81b2db0edd5f..93d7f4601751 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -292,6 +292,11 @@ static int uac2_ctl_value_size(int val_type)
  * retrieve a mixer value
  */
 
+static inline int mixer_ctrl_intf(struct usb_mixer_interface *mixer)
+{
+	return get_iface_desc(mixer->hostif)->bInterfaceNumber;
+}
+
 static int get_ctl_value_v1(struct usb_mixer_elem_info *cval, int request,
 			    int validx, int *value_ret)
 {
@@ -306,7 +311,7 @@ static int get_ctl_value_v1(struct usb_mixer_elem_info *cval, int request,
 		return -EIO;
 
 	while (timeout-- > 0) {
-		idx = snd_usb_ctrl_intf(chip) | (cval->head.id << 8);
+		idx = mixer_ctrl_intf(cval->head.mixer) | (cval->head.id << 8);
 		err = snd_usb_ctl_msg(chip->dev, usb_rcvctrlpipe(chip->dev, 0), request,
 				      USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_IN,
 				      validx, idx, buf, val_len);
@@ -354,7 +359,7 @@ static int get_ctl_value_v2(struct usb_mixer_elem_info *cval, int request,
 	if (ret)
 		goto error;
 
-	idx = snd_usb_ctrl_intf(chip) | (cval->head.id << 8);
+	idx = mixer_ctrl_intf(cval->head.mixer) | (cval->head.id << 8);
 	ret = snd_usb_ctl_msg(chip->dev, usb_rcvctrlpipe(chip->dev, 0), bRequest,
 			      USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_IN,
 			      validx, idx, buf, size);
@@ -479,7 +484,7 @@ int snd_usb_mixer_set_ctl_value(struct usb_mixer_elem_info *cval,
 		return -EIO;
 
 	while (timeout-- > 0) {
-		idx = snd_usb_ctrl_intf(chip) | (cval->head.id << 8);
+		idx = mixer_ctrl_intf(cval->head.mixer) | (cval->head.id << 8);
 		err = snd_usb_ctl_msg(chip->dev,
 				      usb_sndctrlpipe(chip->dev, 0), request,
 				      USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_OUT,
@@ -1203,7 +1208,7 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
 		    get_ctl_value(cval, UAC_GET_MIN, (cval->control << 8) | minchn, &cval->min) < 0) {
 			usb_audio_err(cval->head.mixer->chip,
 				      "%d:%d: cannot get min/max values for control %d (id %d)\n",
-				   cval->head.id, snd_usb_ctrl_intf(cval->head.mixer->chip),
+				   cval->head.id, mixer_ctrl_intf(cval->head.mixer),
 							       cval->control, cval->head.id);
 			return -EINVAL;
 		}
@@ -1422,7 +1427,7 @@ static int mixer_ctl_connector_get(struct snd_kcontrol *kcontrol,
 	if (ret)
 		goto error;
 
-	idx = snd_usb_ctrl_intf(chip) | (cval->head.id << 8);
+	idx = mixer_ctrl_intf(cval->head.mixer) | (cval->head.id << 8);
 	if (cval->head.mixer->protocol == UAC_VERSION_2) {
 		struct uac2_connectors_ctl_blk uac2_conn;
 
@@ -3203,7 +3208,7 @@ static void snd_usb_mixer_proc_read(struct snd_info_entry *entry,
 	list_for_each_entry(mixer, &chip->mixer_list, list) {
 		snd_iprintf(buffer,
 			"USB Mixer: usb_id=0x%08x, ctrlif=%i, ctlerr=%i\n",
-				chip->usb_id, snd_usb_ctrl_intf(chip),
+				chip->usb_id, mixer_ctrl_intf(mixer),
 				mixer->ignore_ctl_error);
 		snd_iprintf(buffer, "Card: %s\n", chip->card->longname);
 		for (unitid = 0; unitid < MAX_ID_ELEMS; unitid++) {
-- 
2.20.1

