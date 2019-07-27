Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE51777E8
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jul 2019 11:32:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06C13208B;
	Sat, 27 Jul 2019 11:32:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06C13208B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564219971;
	bh=dyLHRRWwPIQSrBsQN9mdy7FSXqTLZ/b2wBHt1pjQH2k=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GJXr9nm8p7ke/XstR/WFSqkBS/DRyL680yphpzitTY2zL6ZzD+GOfKjnb+RKNNFv1
	 fsuTaRBmLu8SdUVbw32sCxNzuKfKYb9d17IXkfymPKQVSq5ZHxkzi7yoHwAfWG42tI
	 Ojw+fpJ2WZ389IfbWNtGZv6PFS4jv1mFgoGW4pYk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC391F80481;
	Sat, 27 Jul 2019 11:30:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C25A9F803D0; Sat, 27 Jul 2019 11:30:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9BF9F802BD
 for <alsa-devel@alsa-project.org>; Sat, 27 Jul 2019 11:30:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9BF9F802BD
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A07F7AFE0;
 Sat, 27 Jul 2019 09:30:14 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sat, 27 Jul 2019 11:30:06 +0200
Message-Id: <20190727093006.9870-3-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190727093006.9870-1-tiwai@suse.de>
References: <20190727093006.9870-1-tiwai@suse.de>
Cc: Tanu Kaskinen <tanuk@iki.fi>, Alexander Tsoy <alexander@tsoy.me>
Subject: [alsa-devel] [PATCH v2 2/2] ALSA: usb-audio: fix PCM device order
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Alexander Tsoy <alexander@tsoy.me>

Some cards have alternate setting with non-PCM format as the first
altsetting in the interface descriptors. This confuses userspace, since
alsa-lib uses device 0 by default. So lets parse interfaces in two steps:
 1. Parse altsettings with PCM formats.
 2. Parse altsettings with non-PCM formats.

This fixes at least following cards:
 - Audinst HUD-mx2
 - Audinst HUD-mini

[ Adapted 5.3 kernel by tiwai ]

Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/stream.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index 963d425004f8..fc3e9fcfbc38 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -1077,7 +1077,9 @@ snd_usb_get_audioformat_uac3(struct snd_usb_audio *chip,
 	return fp;
 }
 
-int snd_usb_parse_audio_interface(struct snd_usb_audio *chip, int iface_no)
+static int __snd_usb_parse_audio_interface(struct snd_usb_audio *chip,
+					   int iface_no,
+					   bool *has_non_pcm, bool non_pcm)
 {
 	struct usb_device *dev;
 	struct usb_interface *iface;
@@ -1178,6 +1180,16 @@ int snd_usb_parse_audio_interface(struct snd_usb_audio *chip, int iface_no)
 		else if (IS_ERR(fp))
 			return PTR_ERR(fp);
 
+		if (fp->fmt_type != UAC_FORMAT_TYPE_I)
+			*has_non_pcm = true;
+		if ((fp->fmt_type == UAC_FORMAT_TYPE_I) == non_pcm) {
+			audioformat_free(fp);
+			kfree(pd);
+			fp = NULL;
+			pd = NULL;
+			continue;
+		}
+
 		dev_dbg(&dev->dev, "%u:%d: add audio endpoint %#x\n", iface_no, altno, fp->endpoint);
 		if (protocol == UAC_VERSION_3)
 			err = snd_usb_add_audio_stream_v3(chip, stream, fp, pd);
@@ -1197,3 +1209,23 @@ int snd_usb_parse_audio_interface(struct snd_usb_audio *chip, int iface_no)
 	return 0;
 }
 
+int snd_usb_parse_audio_interface(struct snd_usb_audio *chip, int iface_no)
+{
+	int err;
+	bool has_non_pcm = false;
+
+	/* parse PCM formats */
+	err = __snd_usb_parse_audio_interface(chip, iface_no, &has_non_pcm, false);
+	if (err < 0)
+		return err;
+
+	if (has_non_pcm) {
+		/* parse non-PCM formats */
+		err = __snd_usb_parse_audio_interface(chip, iface_no, &has_non_pcm, true);
+		if (err < 0)
+			return err;
+	}
+
+	return 0;
+}
+
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
