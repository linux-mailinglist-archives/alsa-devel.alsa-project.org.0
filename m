Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDFD2C0214
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 10:12:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AACC1612;
	Mon, 23 Nov 2020 10:11:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AACC1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606122720;
	bh=j9IqJjtlzMiYFmsfZ7oI1ZHXp33QYIcI/+25HgCjO00=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZZACgPafPzHpt/41Us4X27GkoNgftY3bE7INN3/VoAls2PIZxzrmN4KjOmeMTQazl
	 bfG7o7JVLvwFYEIRq+feiyPt4K2W51ngV1aZrY76epIwMVts8cfVZvczz+jLJqsUk8
	 7aRK4dVlovYaS0Be5nZUcmenC+G5qsVBGKR1/scM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77C65F805EB;
	Mon, 23 Nov 2020 09:55:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A105F8015F; Mon, 23 Nov 2020 09:54:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DD3FF804FE
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:54:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DD3FF804FE
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ECD6EAFC1;
 Mon, 23 Nov 2020 08:53:57 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 19/41] ALSA: usb-audio: Simplify snd_usb_init_sample_rate()
 arguments
Date: Mon, 23 Nov 2020 09:53:25 +0100
Message-Id: <20201123085347.19667-20-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20201123085347.19667-1-tiwai@suse.de>
References: <20201123085347.19667-1-tiwai@suse.de>
Cc: Matwey Kornilov <matwey.kornilov@gmail.com>,
 Dylan Robinson <dylan_robinson@motu.com>,
 Keith Milner <kamilner@superlative.org>
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

A preliminary change for the later big changes.  This is a minor code
refactoring to drop the unnecessary arguments that can be retrieved in
a different way.

Tested-by: Keith Milner <kamilner@superlative.org>
Tested-by: Dylan Robinson <dylan_robinson@motu.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/clock.c  | 29 +++++++++++++++--------------
 sound/usb/clock.h  |  3 +--
 sound/usb/pcm.c    |  2 --
 sound/usb/quirks.c |  2 +-
 sound/usb/stream.c |  2 +-
 5 files changed, 18 insertions(+), 20 deletions(-)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index 3298a654ce96..f25da11fce3a 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -481,15 +481,18 @@ int snd_usb_clock_find_source(struct snd_usb_audio *chip,
 	}
 }
 
-static int set_sample_rate_v1(struct snd_usb_audio *chip, int iface,
-			      struct usb_host_interface *alts,
+static int set_sample_rate_v1(struct snd_usb_audio *chip,
 			      struct audioformat *fmt, int rate)
 {
 	struct usb_device *dev = chip->dev;
+	struct usb_host_interface *alts;
 	unsigned int ep;
 	unsigned char data[3];
 	int err, crate;
 
+	alts = snd_usb_get_host_interface(chip, fmt->iface, fmt->altsetting);
+	if (!alts)
+		return -EINVAL;
 	if (get_iface_desc(alts)->bNumEndpoints < 1)
 		return -EINVAL;
 	ep = get_endpoint(alts, 0)->bEndpointAddress;
@@ -507,7 +510,7 @@ static int set_sample_rate_v1(struct snd_usb_audio *chip, int iface,
 			      data, sizeof(data));
 	if (err < 0) {
 		dev_err(&dev->dev, "%d:%d: cannot set freq %d to ep %#x\n",
-			iface, fmt->altsetting, rate, ep);
+			fmt->iface, fmt->altsetting, rate, ep);
 		return err;
 	}
 
@@ -525,7 +528,7 @@ static int set_sample_rate_v1(struct snd_usb_audio *chip, int iface,
 			      data, sizeof(data));
 	if (err < 0) {
 		dev_err(&dev->dev, "%d:%d: cannot get freq at ep %#x\n",
-			iface, fmt->altsetting, ep);
+			fmt->iface, fmt->altsetting, ep);
 		chip->sample_rate_read_error++;
 		return 0; /* some devices don't support reading */
 	}
@@ -607,8 +610,7 @@ int snd_usb_set_sample_rate_v2v3(struct snd_usb_audio *chip,
 	return get_sample_rate_v2v3(chip, fmt->iface, fmt->altsetting, clock);
 }
 
-static int set_sample_rate_v2v3(struct snd_usb_audio *chip, int iface,
-				struct usb_host_interface *alts,
+static int set_sample_rate_v2v3(struct snd_usb_audio *chip,
 				struct audioformat *fmt, int rate)
 {
 	struct usb_device *dev = chip->dev;
@@ -632,7 +634,7 @@ static int set_sample_rate_v2v3(struct snd_usb_audio *chip, int iface,
 			return clock;
 	}
 
-	prev_rate = get_sample_rate_v2v3(chip, iface, fmt->altsetting, clock);
+	prev_rate = get_sample_rate_v2v3(chip, fmt->iface, fmt->altsetting, clock);
 	if (prev_rate == rate)
 		goto validation;
 
@@ -640,7 +642,7 @@ static int set_sample_rate_v2v3(struct snd_usb_audio *chip, int iface,
 	if (cur_rate < 0) {
 		usb_audio_err(chip,
 			      "%d:%d: cannot set freq %d (v2/v3): err %d\n",
-			      iface, fmt->altsetting, rate, cur_rate);
+			      fmt->iface, fmt->altsetting, rate, cur_rate);
 		return cur_rate;
 	}
 
@@ -657,9 +659,9 @@ static int set_sample_rate_v2v3(struct snd_usb_audio *chip, int iface,
 	/* Some devices doesn't respond to sample rate changes while the
 	 * interface is active. */
 	if (rate != prev_rate) {
-		usb_set_interface(dev, iface, 0);
+		usb_set_interface(dev, fmt->iface, 0);
 		snd_usb_set_interface_quirk(chip);
-		usb_set_interface(dev, iface, fmt->altsetting);
+		usb_set_interface(dev, fmt->iface, fmt->altsetting);
 		snd_usb_set_interface_quirk(chip);
 	}
 
@@ -670,14 +672,13 @@ static int set_sample_rate_v2v3(struct snd_usb_audio *chip, int iface,
 	return 0;
 }
 
-int snd_usb_init_sample_rate(struct snd_usb_audio *chip, int iface,
-			     struct usb_host_interface *alts,
+int snd_usb_init_sample_rate(struct snd_usb_audio *chip,
 			     struct audioformat *fmt, int rate)
 {
 	switch (fmt->protocol) {
 	case UAC_VERSION_1:
 	default:
-		return set_sample_rate_v1(chip, iface, alts, fmt, rate);
+		return set_sample_rate_v1(chip, fmt, rate);
 
 	case UAC_VERSION_3:
 		if (chip->badd_profile >= UAC3_FUNCTION_SUBCLASS_GENERIC_IO) {
@@ -688,7 +689,7 @@ int snd_usb_init_sample_rate(struct snd_usb_audio *chip, int iface,
 		}
 		fallthrough;
 	case UAC_VERSION_2:
-		return set_sample_rate_v2v3(chip, iface, alts, fmt, rate);
+		return set_sample_rate_v2v3(chip, fmt, rate);
 	}
 }
 
diff --git a/sound/usb/clock.h b/sound/usb/clock.h
index 97597f5a3c18..8d406ed294d6 100644
--- a/sound/usb/clock.h
+++ b/sound/usb/clock.h
@@ -2,8 +2,7 @@
 #ifndef __USBAUDIO_CLOCK_H
 #define __USBAUDIO_CLOCK_H
 
-int snd_usb_init_sample_rate(struct snd_usb_audio *chip, int iface,
-			     struct usb_host_interface *alts,
+int snd_usb_init_sample_rate(struct snd_usb_audio *chip,
 			     struct audioformat *fmt, int rate);
 
 int snd_usb_clock_find_source(struct snd_usb_audio *chip,
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 2518d4c82ad5..38b461bdca86 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -1017,8 +1017,6 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
 		iface = usb_ifnum_to_if(subs->dev, subs->cur_audiofmt->iface);
 		alts = &iface->altsetting[subs->cur_audiofmt->altset_idx];
 		ret = snd_usb_init_sample_rate(subs->stream->chip,
-					       subs->cur_audiofmt->iface,
-					       alts,
 					       subs->cur_audiofmt,
 					       subs->cur_rate);
 		if (ret < 0)
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index bb4c1ae0a4a7..018c6f241ffb 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -178,7 +178,7 @@ static int create_fixed_stream_quirk(struct snd_usb_audio *chip,
 		fp->maxpacksize = le16_to_cpu(get_endpoint(alts, 0)->wMaxPacketSize);
 	usb_set_interface(chip->dev, fp->iface, 0);
 	snd_usb_init_pitch(chip, fp->iface, alts, fp);
-	snd_usb_init_sample_rate(chip, fp->iface, alts, fp, fp->rate_max);
+	snd_usb_init_sample_rate(chip, fp, fp->rate_max);
 	return 0;
 
  error:
diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index 4501e042a944..23e881985123 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -1225,7 +1225,7 @@ static int __snd_usb_parse_audio_interface(struct snd_usb_audio *chip,
 		/* try to set the interface... */
 		usb_set_interface(chip->dev, iface_no, 0);
 		snd_usb_init_pitch(chip, iface_no, alts, fp);
-		snd_usb_init_sample_rate(chip, iface_no, alts, fp, fp->rate_max);
+		snd_usb_init_sample_rate(chip, fp, fp->rate_max);
 		usb_set_interface(chip->dev, iface_no, altno);
 	}
 	return 0;
-- 
2.16.4

