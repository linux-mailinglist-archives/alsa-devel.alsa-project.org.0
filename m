Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 230A42C01E2
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 10:02:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B36E916B1;
	Mon, 23 Nov 2020 10:01:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B36E916B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606122136;
	bh=2JnhS3A0gWQW42YqMTutkjvnnfot3fbv0pGV2IFFLW4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cmvtuMSgrzJYX7h77nyawbdElUoIgbX04AIvLqirvvWn0+8NDXtynB2QbMDMJQLgz
	 WtUssUMwN/HWXKbj5DZaFBh/sPqCvnN9xzoAhnpkxCAkwqopArb5rPOYk1LelqPglI
	 v6YCtHpnJ1/ONVqC73E+xi2GeYr4Wijr36SLoq6Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9F2EF804EB;
	Mon, 23 Nov 2020 09:54:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06579F80534; Mon, 23 Nov 2020 09:54:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F369F804CC
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:54:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F369F804CC
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 07826AFC6;
 Mon, 23 Nov 2020 08:53:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 20/41] ALSA: usb-audio: Simplify snd_usb_init_pitch() arguments
Date: Mon, 23 Nov 2020 09:53:26 +0100
Message-Id: <20201123085347.19667-21-tiwai@suse.de>
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
 sound/usb/pcm.c    | 23 +++++++++--------------
 sound/usb/pcm.h    |  3 +--
 sound/usb/quirks.c |  2 +-
 sound/usb/stream.c |  2 +-
 4 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 38b461bdca86..0998be109af3 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -146,8 +146,7 @@ static struct audioformat *find_substream_format(struct snd_usb_substream *subs)
 			   subs->channels, subs);
 }
 
-static int init_pitch_v1(struct snd_usb_audio *chip, int iface,
-			 struct usb_host_interface *alts,
+static int init_pitch_v1(struct snd_usb_audio *chip,
 			 struct audioformat *fmt)
 {
 	struct usb_device *dev = chip->dev;
@@ -155,9 +154,7 @@ static int init_pitch_v1(struct snd_usb_audio *chip, int iface,
 	unsigned char data[1];
 	int err;
 
-	if (get_iface_desc(alts)->bNumEndpoints < 1)
-		return -EINVAL;
-	ep = get_endpoint(alts, 0)->bEndpointAddress;
+	ep = fmt->endpoint;
 
 	data[0] = 1;
 	err = snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0), UAC_SET_CUR,
@@ -166,15 +163,14 @@ static int init_pitch_v1(struct snd_usb_audio *chip, int iface,
 			      data, sizeof(data));
 	if (err < 0) {
 		usb_audio_err(chip, "%d:%d: cannot set enable PITCH\n",
-			      iface, ep);
+			      fmt->iface, ep);
 		return err;
 	}
 
 	return 0;
 }
 
-static int init_pitch_v2(struct snd_usb_audio *chip, int iface,
-			 struct usb_host_interface *alts,
+static int init_pitch_v2(struct snd_usb_audio *chip,
 			 struct audioformat *fmt)
 {
 	struct usb_device *dev = chip->dev;
@@ -188,7 +184,7 @@ static int init_pitch_v2(struct snd_usb_audio *chip, int iface,
 			      data, sizeof(data));
 	if (err < 0) {
 		usb_audio_err(chip, "%d:%d: cannot set enable PITCH (v2)\n",
-			      iface, fmt->altsetting);
+			      fmt->iface, fmt->altsetting);
 		return err;
 	}
 
@@ -198,8 +194,7 @@ static int init_pitch_v2(struct snd_usb_audio *chip, int iface,
 /*
  * initialize the pitch control and sample rate
  */
-int snd_usb_init_pitch(struct snd_usb_audio *chip, int iface,
-		       struct usb_host_interface *alts,
+int snd_usb_init_pitch(struct snd_usb_audio *chip,
 		       struct audioformat *fmt)
 {
 	/* if endpoint doesn't have pitch control, bail out */
@@ -209,10 +204,10 @@ int snd_usb_init_pitch(struct snd_usb_audio *chip, int iface,
 	switch (fmt->protocol) {
 	case UAC_VERSION_1:
 	default:
-		return init_pitch_v1(chip, iface, alts, fmt);
+		return init_pitch_v1(chip, fmt);
 
 	case UAC_VERSION_2:
-		return init_pitch_v2(chip, iface, alts, fmt);
+		return init_pitch_v2(chip, fmt);
 	}
 }
 
@@ -682,7 +677,7 @@ static int set_format(struct snd_usb_substream *subs, struct audioformat *fmt)
 		return err;
 
 	if (subs->need_setup_ep) {
-		err = snd_usb_init_pitch(chip, fmt->iface, alts, fmt);
+		err = snd_usb_init_pitch(chip, fmt);
 		if (err < 0)
 			return err;
 	}
diff --git a/sound/usb/pcm.h b/sound/usb/pcm.h
index 362782c2df5c..a4f784225abc 100644
--- a/sound/usb/pcm.h
+++ b/sound/usb/pcm.h
@@ -9,8 +9,7 @@ void snd_usb_set_pcm_ops(struct snd_pcm *pcm, int stream);
 int snd_usb_pcm_suspend(struct snd_usb_stream *as);
 int snd_usb_pcm_resume(struct snd_usb_stream *as);
 
-int snd_usb_init_pitch(struct snd_usb_audio *chip, int iface,
-		       struct usb_host_interface *alts,
+int snd_usb_init_pitch(struct snd_usb_audio *chip,
 		       struct audioformat *fmt);
 void snd_usb_preallocate_buffer(struct snd_usb_substream *subs);
 
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 018c6f241ffb..013ab93fb640 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -177,7 +177,7 @@ static int create_fixed_stream_quirk(struct snd_usb_audio *chip,
 	if (fp->maxpacksize == 0)
 		fp->maxpacksize = le16_to_cpu(get_endpoint(alts, 0)->wMaxPacketSize);
 	usb_set_interface(chip->dev, fp->iface, 0);
-	snd_usb_init_pitch(chip, fp->iface, alts, fp);
+	snd_usb_init_pitch(chip, fp);
 	snd_usb_init_sample_rate(chip, fp, fp->rate_max);
 	return 0;
 
diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index 23e881985123..7f58c7625cd4 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -1224,7 +1224,7 @@ static int __snd_usb_parse_audio_interface(struct snd_usb_audio *chip,
 
 		/* try to set the interface... */
 		usb_set_interface(chip->dev, iface_no, 0);
-		snd_usb_init_pitch(chip, iface_no, alts, fp);
+		snd_usb_init_pitch(chip, fp);
 		snd_usb_init_sample_rate(chip, fp, fp->rate_max);
 		usb_set_interface(chip->dev, iface_no, altno);
 	}
-- 
2.16.4

