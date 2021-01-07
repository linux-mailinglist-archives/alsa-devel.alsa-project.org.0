Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A9D2ED144
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 15:01:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09A9F16C3;
	Thu,  7 Jan 2021 15:00:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09A9F16C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610028096;
	bh=IxY4iK/Pr/neK9BHTZeIlppfivdamm0HciIQ/LWqYL8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FwRl7X9fau0MbPVjF2O4It/FWLXTtkETnclyEdzlDsOvPwt3rCOHGwfLcG/wOMPl6
	 Lbprvzh6AJvTIyQRE3GIlZu8X3sHLVmY6FIEVX9Mwvr/DNC7wzh4U9AraboO398h1a
	 lOx62o2rx9Tut/+byI0JUUIYGpZRh3yx+CJ8rOZw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69167F804ED;
	Thu,  7 Jan 2021 14:58:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71D2CF804D6; Thu,  7 Jan 2021 14:58:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60D38F80268
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 14:58:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60D38F80268
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9CED1B719;
 Thu,  7 Jan 2021 13:58:05 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 1/5] ALSA: usb-audio: Fix the missing endpoints creations
 for quirks
Date: Thu,  7 Jan 2021 14:57:57 +0100
Message-Id: <20210107135801.23860-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107135801.23860-1-tiwai@suse.de>
References: <20210107135801.23860-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Franti=C5=A1ek=20Ku=C4=8Dera?= <konference@frantovo.cz>,
 Geraldo <geraldogabriel@gmail.com>
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

The recent change in the endpoint management moved the endpoint object
creation from the stream open time to the parser of the audio
descriptor.  It works fine for the standard audio, but it overlooked
the other places that create audio streams via quirks
(QUIRK_AUDIO_FIXED_ENDPOINT) like the reported a few Pioneer devices;
those call snd_usb_add_audio_stream() manually, hence they miss the
endpoints, eventually resulting in the error at opening streams.
Moreover, now the sync EP setup was moved to the explicit call of
snd_usb_audioformat_set_sync_ep(), and this needs to be added for
those places, too.

This patch addresses those regressions for quirks.  It adds a local
helper function add_audio_stream_from_fixed_fmt(), which does the all
needed tasks, and replaces the calls of snd_usb_add_audio_stream()
with this new function.

Fixes: 54cb31901b83 ("ALSA: usb-audio: Create endpoint objects at parsing phase")
Reported-by: František Kučera <konference@frantovo.cz>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/quirks.c | 54 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 10 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index e4a690bb4c99..b70e2ebc3e29 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -120,6 +120,40 @@ static int create_standard_audio_quirk(struct snd_usb_audio *chip,
 	return 0;
 }
 
+/* create the audio stream and the corresponding endpoints from the fixed
+ * audioformat object; this is used for quirks with the fixed EPs
+ */
+static int add_audio_stream_from_fixed_fmt(struct snd_usb_audio *chip,
+					   struct audioformat *fp)
+{
+	int stream, err;
+
+	stream = (fp->endpoint & USB_DIR_IN) ?
+		SNDRV_PCM_STREAM_CAPTURE : SNDRV_PCM_STREAM_PLAYBACK;
+
+	snd_usb_audioformat_set_sync_ep(chip, fp);
+
+	err = snd_usb_add_audio_stream(chip, stream, fp);
+	if (err < 0)
+		return err;
+
+	err = snd_usb_add_endpoint(chip, fp->endpoint,
+				   SND_USB_ENDPOINT_TYPE_DATA);
+	if (err < 0)
+		return err;
+
+	if (fp->sync_ep) {
+		err = snd_usb_add_endpoint(chip, fp->sync_ep,
+					   fp->implicit_fb ?
+					   SND_USB_ENDPOINT_TYPE_DATA :
+					   SND_USB_ENDPOINT_TYPE_SYNC);
+		if (err < 0)
+			return err;
+	}
+
+	return 0;
+}
+
 /*
  * create a stream for an endpoint/altsetting without proper descriptors
  */
@@ -131,8 +165,8 @@ static int create_fixed_stream_quirk(struct snd_usb_audio *chip,
 	struct audioformat *fp;
 	struct usb_host_interface *alts;
 	struct usb_interface_descriptor *altsd;
-	int stream, err;
 	unsigned *rate_table = NULL;
+	int err;
 
 	fp = kmemdup(quirk->data, sizeof(*fp), GFP_KERNEL);
 	if (!fp)
@@ -153,11 +187,6 @@ static int create_fixed_stream_quirk(struct snd_usb_audio *chip,
 		fp->rate_table = rate_table;
 	}
 
-	stream = (fp->endpoint & USB_DIR_IN)
-		? SNDRV_PCM_STREAM_CAPTURE : SNDRV_PCM_STREAM_PLAYBACK;
-	err = snd_usb_add_audio_stream(chip, stream, fp);
-	if (err < 0)
-		goto error;
 	if (fp->iface != get_iface_desc(&iface->altsetting[0])->bInterfaceNumber ||
 	    fp->altset_idx >= iface->num_altsetting) {
 		err = -EINVAL;
@@ -176,6 +205,13 @@ static int create_fixed_stream_quirk(struct snd_usb_audio *chip,
 		fp->datainterval = snd_usb_parse_datainterval(chip, alts);
 	if (fp->maxpacksize == 0)
 		fp->maxpacksize = le16_to_cpu(get_endpoint(alts, 0)->wMaxPacketSize);
+	if (!fp->fmt_type)
+		fp->fmt_type = UAC_FORMAT_TYPE_I;
+
+	err = add_audio_stream_from_fixed_fmt(chip, fp);
+	if (err < 0)
+		goto error;
+
 	usb_set_interface(chip->dev, fp->iface, 0);
 	snd_usb_init_pitch(chip, fp);
 	snd_usb_init_sample_rate(chip, fp, fp->rate_max);
@@ -417,7 +453,7 @@ static int create_uaxx_quirk(struct snd_usb_audio *chip,
 	struct usb_host_interface *alts;
 	struct usb_interface_descriptor *altsd;
 	struct audioformat *fp;
-	int stream, err;
+	int err;
 
 	/* both PCM and MIDI interfaces have 2 or more altsettings */
 	if (iface->num_altsetting < 2)
@@ -482,9 +518,7 @@ static int create_uaxx_quirk(struct snd_usb_audio *chip,
 		return -ENXIO;
 	}
 
-	stream = (fp->endpoint & USB_DIR_IN)
-		? SNDRV_PCM_STREAM_CAPTURE : SNDRV_PCM_STREAM_PLAYBACK;
-	err = snd_usb_add_audio_stream(chip, stream, fp);
+	err = add_audio_stream_from_fixed_fmt(chip, fp);
 	if (err < 0) {
 		list_del(&fp->list); /* unlink for avoiding double-free */
 		kfree(fp);
-- 
2.26.2

