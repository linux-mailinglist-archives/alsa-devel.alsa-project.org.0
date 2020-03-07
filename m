Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5845F17D24F
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Mar 2020 08:52:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2FD9167F;
	Sun,  8 Mar 2020 08:51:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2FD9167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583653926;
	bh=zT7f4+CCyNdB1Pi3oViMds8OfwoEV/Ivaa1zpi9mzWk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iWb3pjPGCrEzG9OLbLIVrNOCi/RVfcUgc8f3MorninkCP3DTRDUWd8bt9g1XeAbgh
	 sub0BwOUC06FmVZDzg1OwwZ5G/t6rGTzpHG6BJ/p8429msac8eRHs1KpEYmw6MB/K8
	 tbwP815wYzlTzLediMZ2Vl29K3UwwVvHkKKC8Zws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFF1CF802C3;
	Sun,  8 Mar 2020 08:46:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A13BF80266; Sat,  7 Mar 2020 19:57:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 900C5F80130;
 Sat,  7 Mar 2020 19:57:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 900C5F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TDSSBGeL"
Received: by mail-yw1-xc43.google.com with SMTP id x5so4878228ywb.13;
 Sat, 07 Mar 2020 10:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W3CY8lMYNprZ5dAt94aJtLZOZW04lS1eDinvVtLpyp0=;
 b=TDSSBGeLlE8SKXPvtd+lImqYM8WIP3+7OwKciFPcc31M/Hsj5zPtCvd1EoZ7eO6HkI
 e5HeWyHRU42og9I6jzFSoqIltSG/HmL81W8kILpM/Tcwb9SpE3cP1Ro6/49TLc5c+8Z1
 ABD6lAimDhXe3HsOo8Jhn2nmcNwHQpB4yxxlNn51ayf3PXxvoM44Ssupx9bPfivOB9DJ
 N8MFBn68ediVFEb6LnOo8Ilylc1U0COXu1d5XqzFGyXcGc9+fAzY72epTOxTTFufHVmC
 /mwvh7FOFvwGeJlt00NRtfdEnrk5nJZZkfoexFw4dsGoCa6f530siOjQj/fDe9WNjdis
 1mVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W3CY8lMYNprZ5dAt94aJtLZOZW04lS1eDinvVtLpyp0=;
 b=pRghToZB3jwtOP7pTk/82x1sbI7vLPfaJW8ATFq2XjGzt54b8sr/6t402niHXCPyAh
 pXeWCeip68zlsY3CyOOW3XIzEFS4fKvPtxUfnprIooPiGA1mZkdVZi5FmWIfAKBrvjFy
 SOc+vl6gydPRCw8Cn8dlV5iNVplyWjrQe/QRmGBrKJNjgQLBZFQBZJHulwbhZoEGfRSM
 L0u//OmgumP2Yc/M9DtzP3cPF7SOWroVDWsqAvpn9Vs33czMGsjnaIK+EOax1K7OIQs8
 3bsIibeQa7tVo4SZazeAqDFPV9YUOm1HrvTLVMr0mvo6bWZn1lKsZz+W4A8NdlsIc2dm
 p8Uw==
X-Gm-Message-State: ANhLgQ3mXG4cvkJJdd+oI0cn0GMzH1G+sCuQ/0R5m//T/liweaWeDuwx
 5pOoTf71VoXZJVN5qomUG+pynzR+
X-Google-Smtp-Source: ADFU+vtDNXKQbcXDL574KaAtPyD24y2F4HIRZ1FVuNepChNDeQoVXA+K0hLlJ4IQ7u33OZbx12/xsA==
X-Received: by 2002:a25:8446:: with SMTP id r6mr9947372ybm.451.1583607445247; 
 Sat, 07 Mar 2020 10:57:25 -0800 (PST)
Received: from cybertron.pseudoangel.com
 (cpe-172-101-252-194.rochester.res.rr.com. [172.101.252.194])
 by smtp.gmail.com with ESMTPSA id e62sm15863903ywe.37.2020.03.07.10.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Mar 2020 10:57:24 -0800 (PST)
From: crwulff@gmail.com
To: patch@alsa-project.org
Subject: [PATCH Fix for Kingston HyperX Amp (0951:16d8) 1/1] snd-usb-audio:
 Fix Kingston HyperX Amp (0951:16d8).
Date: Sat,  7 Mar 2020 13:57:41 -0500
Message-Id: <20200307185741.32578-2-crwulff@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200307185741.32578-1-crwulff@gmail.com>
References: <20200307185741.32578-1-crwulff@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 08 Mar 2020 08:46:09 +0100
Cc: alsa-devel@alsa-project.org, Chris Wulff <crwulff@gmail.com>
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

The newer version of the HyperX Amp has controls on two
separate USB interfaces (0 and 2.)

This patch fixes the use of two separate usb interfaces
for controls and audio by using the controls mixer interface
instead of the card interface for each control and by not
merging new streams with a pcm device that has already
been registered.

Signed-off-by: Chris Wulff <crwulff@gmail.com>

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 45eee5cc312e..2498107ca89f 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -306,7 +306,7 @@ static int get_ctl_value_v1(struct usb_mixer_elem_info *cval, int request,
 		return -EIO;
 
 	while (timeout-- > 0) {
-		idx = snd_usb_ctrl_intf(chip) | (cval->head.id << 8);
+		idx = cval->head.mixer->hostif->desc.bInterfaceNumber | (cval->head.id << 8);
 		err = snd_usb_ctl_msg(chip->dev, usb_rcvctrlpipe(chip->dev, 0), request,
 				      USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_IN,
 				      validx, idx, buf, val_len);
@@ -354,7 +354,7 @@ static int get_ctl_value_v2(struct usb_mixer_elem_info *cval, int request,
 	if (ret)
 		goto error;
 
-	idx = snd_usb_ctrl_intf(chip) | (cval->head.id << 8);
+	idx = cval->head.mixer->hostif->desc.bInterfaceNumber | (cval->head.id << 8);
 	ret = snd_usb_ctl_msg(chip->dev, usb_rcvctrlpipe(chip->dev, 0), bRequest,
 			      USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_IN,
 			      validx, idx, buf, size);
@@ -479,7 +479,7 @@ int snd_usb_mixer_set_ctl_value(struct usb_mixer_elem_info *cval,
 		return -EIO;
 
 	while (timeout-- > 0) {
-		idx = snd_usb_ctrl_intf(chip) | (cval->head.id << 8);
+		idx = cval->head.mixer->hostif->desc.bInterfaceNumber | (cval->head.id << 8);
 		err = snd_usb_ctl_msg(chip->dev,
 				      usb_sndctrlpipe(chip->dev, 0), request,
 				      USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_OUT,
@@ -1195,7 +1195,7 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
 		    get_ctl_value(cval, UAC_GET_MIN, (cval->control << 8) | minchn, &cval->min) < 0) {
 			usb_audio_err(cval->head.mixer->chip,
 				      "%d:%d: cannot get min/max values for control %d (id %d)\n",
-				   cval->head.id, snd_usb_ctrl_intf(cval->head.mixer->chip),
+				   cval->head.id, cval->head.mixer->hostif->desc.bInterfaceNumber,
 							       cval->control, cval->head.id);
 			return -EINVAL;
 		}
@@ -1414,7 +1414,7 @@ static int mixer_ctl_connector_get(struct snd_kcontrol *kcontrol,
 	if (ret)
 		goto error;
 
-	idx = snd_usb_ctrl_intf(chip) | (cval->head.id << 8);
+	idx = cval->head.mixer->hostif->desc.bInterfaceNumber | (cval->head.id << 8);
 	if (cval->head.mixer->protocol == UAC_VERSION_2) {
 		struct uac2_connectors_ctl_blk uac2_conn;
 
@@ -3192,7 +3192,7 @@ static void snd_usb_mixer_proc_read(struct snd_info_entry *entry,
 	list_for_each_entry(mixer, &chip->mixer_list, list) {
 		snd_iprintf(buffer,
 			"USB Mixer: usb_id=0x%08x, ctrlif=%i, ctlerr=%i\n",
-				chip->usb_id, snd_usb_ctrl_intf(chip),
+				chip->usb_id, mixer->hostif->desc.bInterfaceNumber,
 				mixer->ignore_ctl_error);
 		snd_iprintf(buffer, "Card: %s\n", chip->card->longname);
 		for (unitid = 0; unitid < MAX_ID_ELEMS; unitid++) {
diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index 11785f9652ad..d286c18f8d43 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -482,6 +482,7 @@ static int __snd_usb_add_audio_stream(struct snd_usb_audio *chip,
 	struct snd_usb_stream *as;
 	struct snd_usb_substream *subs;
 	struct snd_pcm *pcm;
+	struct snd_device *dev;
 	int err;
 
 	list_for_each_entry(as, &chip->pcm_list, list) {
@@ -502,6 +503,13 @@ static int __snd_usb_add_audio_stream(struct snd_usb_audio *chip,
 		subs = &as->substream[stream];
 		if (subs->ep_num)
 			continue;
+
+		list_for_each_entry(dev, &as->pcm->card->devices, list)
+			if (dev->device_data == as->pcm)
+				break;
+		if (dev && (dev->state == SNDRV_DEV_REGISTERED))
+			continue;
+
 		err = snd_pcm_new_stream(as->pcm, stream, 1);
 		if (err < 0)
 			return err;
-- 
2.20.1

