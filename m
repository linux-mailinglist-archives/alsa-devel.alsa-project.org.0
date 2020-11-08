Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2AC2AD34D
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 11:17:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFCBE16FF;
	Tue, 10 Nov 2020 11:16:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFCBE16FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605003442;
	bh=090yl6NLIwM6Zg33vl+uEdmvs4nQ7S7YZNDNDPcZ1tc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YrREnokrVYXWjxc6Yh4B8+aRp8iIyBY1f8nqthota5ytENfocXoCj66tt7MrgCHuX
	 T/6MxdQhXzJAfB0oKLGuoNHkuGozwr1HUsPna0XkLgpH5W85SScc899I9oxGtBsPx+
	 19BTkwff4FJas2/TcPaX8Fxq3q1BLt32oxEiYXWk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65455F804BD;
	Tue, 10 Nov 2020 11:15:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BE57F801D5; Sun,  8 Nov 2020 09:40:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5ACFAF800D2
 for <alsa-devel@alsa-project.org>; Sun,  8 Nov 2020 09:40:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5ACFAF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gNVYtJdx"
Received: by mail-pg1-x541.google.com with SMTP id h6so4361843pgk.4
 for <alsa-devel@alsa-project.org>; Sun, 08 Nov 2020 00:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e5VwdaEjgsZk9d7Ak55UoaWyuSNZ0/fq+3rKztiMq2g=;
 b=gNVYtJdxkLhPn0jAxtNIP9etInvOqXYtCQvAHs0/MyXHH5j1+JgAIlj51Ks8nSmigf
 zwbRUe2apF6YVYksl9XrrQ8lIiGnG61h4hE62XEj8gCc0p0XHPeTLdG3S3iBmP6dv2bY
 yf8Zdf5/orZHyoKZ1NzMVk78D1f30H9D4bjzx0Ja4GaEAfonskjWwjSjrxlMK2pTDhMk
 4tbhp+0OdR3AsQkZe3gjgvmrzBdJ7whURB9iuEWhEKFxbhslvKlKLDW+dgqTbjLyBV+T
 gi6FWLDeOoPSJyY5qfRBwbc272JWgaflvA8/TWpNUztS7S672w0/HtWhk6jc+rfP1Jns
 P41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e5VwdaEjgsZk9d7Ak55UoaWyuSNZ0/fq+3rKztiMq2g=;
 b=ELxU3LvzB1pSn2qQeze3zc/aQqlL0bqmiq5cNXRxDoswQjBGT0Ddk4kdg/a+JB+uq1
 p7MaSbtJyAXLNGQ+Ei1ZrQ0BxiNRoGu3qEgK/G0NHVrI5LQbDfrJ4PDArWipVPt8/1JF
 T1BaTrALbP/FILeJ82XIZ9ygUK6jh+P9Cn1af0J+J3VcigZlSQYtdvISuSb5CWtfuhlb
 C8Fe4JfxP+l8JYWn4OLhTLJyHaWodGJrz4RpWhYPEzQMcn3lX655Vps62bcwSk7ajEF+
 9HYE6UY+ei7ecI4g0NVOOrUyjrbFkNynyCHmra0MXb7d6jh4Y0QbsHUrvYBkgCo+poM1
 o/Ng==
X-Gm-Message-State: AOAM530RP2J46CFVLT8WXjE3lOmB1GE/g4JPpsl1U9Q2kgmrFr1wahed
 1sWVbmDZ2BMZIpOCFgJAT8o=
X-Google-Smtp-Source: ABdhPJz/1JTHr0rMzRDRcdqbvq60gQKDNRij2RyfBMdfsEpTtVXzrAlcRUyWDDu3+wFa5uhw0esFFw==
X-Received: by 2002:aa7:9f0c:0:b029:18a:e524:3b90 with SMTP id
 g12-20020aa79f0c0000b029018ae5243b90mr9203629pfr.77.1604824821086; 
 Sun, 08 Nov 2020 00:40:21 -0800 (PST)
Received: from localhost.localdomain ([122.164.210.133])
 by smtp.gmail.com with ESMTPSA id q12sm616258pjl.41.2020.11.08.00.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Nov 2020 00:40:20 -0800 (PST)
From: Atul <leoatul12@gmail.com>
To: perex@perex.cz
Subject: [PATCH] ALSA: usb-audio: Fix coding style problems
Date: Sun,  8 Nov 2020 14:05:16 +0530
Message-Id: <20201108083515.5256-1-leoatul12@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 10 Nov 2020 11:14:55 +0100
Cc: gregkh@linuxfoundation.org, alsa-devel@alsa-project.org,
 Atul Gopinathan <leoatul12@gmail.com>, tiwai@suse.com,
 linux-kernel@vger.kernel.org
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

From: Atul Gopinathan <leoatul12@gmail.com>

Hi,

This patch fixes some coding style warnings and errors that were
generated using scripts/checkpatch.pl.

Signed-off-by: Atul Gopinathan <leoatul12@gmail.com>
---
 sound/usb/pcm.c    | 16 ++++++++--------
 sound/usb/quirks.c | 21 +++++++++++----------
 2 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index a860303cc522..ed5c77ce8e14 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -104,7 +104,7 @@ static struct audioformat *find_format(struct snd_usb_substream *subs)
 				continue;
 		}
 		attr = fp->ep_attr & USB_ENDPOINT_SYNCTYPE;
-		if (! found) {
+		if (!found) {
 			found = fp;
 			cur_attr = attr;
 			continue;
@@ -304,7 +304,7 @@ static int search_roland_implicit_fb(struct usb_device *dev, int ifnum,
 	if (altsd->bAlternateSetting != altsetting ||
 	    altsd->bInterfaceClass != USB_CLASS_VENDOR_SPEC ||
 	    (altsd->bInterfaceSubClass != 2 &&
-	     altsd->bInterfaceProtocol != 2   ) ||
+	     altsd->bInterfaceProtocol != 2) ||
 	    altsd->bNumEndpoints < 1)
 		return -ENOENT;
 	epd = get_endpoint(*alts, 0);
@@ -482,8 +482,9 @@ static int set_sync_endpoint(struct snd_usb_substream *subs,
 
 	/* check sync-pipe endpoint */
 	/* ... and check descriptor size before accessing bSynchAddress
-	   because there is a version of the SB Audigy 2 NX firmware lacking
-	   the audio fields in the endpoint descriptors */
+     * because there is a version of the SB Audigy 2 NX firmware lacking
+     * the audio fields in the endpoint descriptors
+     */
 	if ((get_endpoint(alts, 1)->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK) != USB_ENDPOINT_XFER_ISOC ||
 	    (get_endpoint(alts, 1)->bLength >= USB_DT_ENDPOINT_AUDIO_SIZE &&
 	     get_endpoint(alts, 1)->bSynchAddress != 0)) {
@@ -911,7 +912,7 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
 	struct usb_interface *iface;
 	int ret;
 
-	if (! subs->cur_audiofmt) {
+	if (!subs->cur_audiofmt) {
 		dev_err(&subs->dev->dev, "no format is specified!\n");
 		return -ENXIO;
 	}
@@ -973,9 +974,8 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
 	return ret;
 }
 
-static const struct snd_pcm_hardware snd_usb_hardware =
-{
-	.info =			SNDRV_PCM_INFO_MMAP |
+static const struct snd_pcm_hardware snd_usb_hardware = {
+	.info =		SNDRV_PCM_INFO_MMAP |
 				SNDRV_PCM_INFO_MMAP_VALID |
 				SNDRV_PCM_INFO_BATCH |
 				SNDRV_PCM_INFO_INTERLEAVED |
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index c989ad8052ae..b6f3345db93f 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -398,7 +398,7 @@ static int create_autodetect_quirks(struct snd_usb_audio *chip,
 }
 
 /*
- * Create a stream for an Edirol UA-700/UA-25/UA-4FX interface.  
+ * Create a stream for an Edirol UA-700/UA-25/UA-4FX interface.
  * The only way to detect the sample rate is by looking at wMaxPacketSize.
  */
 static int create_uaxx_quirk(struct snd_usb_audio *chip,
@@ -593,7 +593,7 @@ static int snd_usb_extigy_boot_quirk(struct usb_device *dev, struct usb_interfac
 	    le16_to_cpu(get_cfg_desc(config)->wTotalLength) == EXTIGY_FIRMWARE_SIZE_NEW) {
 		dev_dbg(&dev->dev, "sending Extigy boot sequence...\n");
 		/* Send message to force it to reconnect with full interface. */
-		err = snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev,0),
+		err = snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
 				      0x10, 0x43, 0x0001, 0x000a, NULL, 0);
 		if (err < 0)
 			dev_dbg(&dev->dev, "error sending boot message: %d\n", err);
@@ -646,8 +646,9 @@ static int snd_usb_fasttrackpro_boot_quirk(struct usb_device *dev)
 				"error usb_driver_set_configuration: %d\n",
 				err);
 		/* Always return an error, so that we stop creating a device
-		   that will just be destroyed and recreated with a new
-		   configuration */
+         * that will just be destroyed and recreated with a new
+         * configuration
+         */
 		return -ENODEV;
 	} else
 		dev_info(&dev->dev, "Fast Track Pro config OK\n");
@@ -895,9 +896,10 @@ static int snd_usb_nativeinstruments_boot_quirk(struct usb_device *dev)
 	usb_reset_device(dev);
 
 	/* return -EAGAIN, so the creation of an audio interface for this
-	 * temporary device is aborted. The device will reconnect with a
-	 * new product ID */
-	return -EAGAIN;
+     * temporary device is aborted. The device will reconnect with a
+     * new product ID
+     */
+    return -EAGAIN;
 }
 
 static void mbox2_setup_48_24_magic(struct usb_device *dev)
@@ -919,7 +921,6 @@ static void mbox2_setup_48_24_magic(struct usb_device *dev)
 		0x81, 0xa2, 0x0100, 0x0086, &srate, 0x0003);
 	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
 		0x81, 0xa2, 0x0100, 0x0003, &srate, 0x0003);
-	return;
 }
 
 /* Digidesign Mbox 2 needs to load firmware onboard
@@ -1830,8 +1831,8 @@ void snd_usb_audioformat_attributes_quirk(struct snd_usb_audio *chip,
 		/* doesn't set the sample rate attribute, but supports it */
 		fp->attributes |= UAC_EP_CS_ATTR_SAMPLE_RATE;
 		break;
-	case USB_ID(0x0763, 0x2001):  /* M-Audio Quattro USB */
-	case USB_ID(0x0763, 0x2012):  /* M-Audio Fast Track Pro USB */
+	case USB_ID(0x0763, 0x2001): /* M-Audio Quattro USB */
+	case USB_ID(0x0763, 0x2012): /* M-Audio Fast Track Pro USB */
 	case USB_ID(0x047f, 0x0ca1): /* plantronics headset */
 	case USB_ID(0x077d, 0x07af): /* Griffin iMic (note that there is
 					an older model 77d:223) */
-- 
2.25.1

