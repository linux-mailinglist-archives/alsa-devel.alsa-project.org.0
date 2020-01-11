Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 026AF138406
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Jan 2020 00:36:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9856B1696;
	Sun, 12 Jan 2020 00:35:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9856B1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578785797;
	bh=C3OBUy4WnJMI02DuF+k1wRE6BRPmJkUu16Ppt8cX8l8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Rh9OiVJ10/TqOg5XRDiEVGBQlgfbIDriG0CbsFMULbLTDQnO/uI9q5ehelON93DtT
	 vDjqPoLrh5ETxF0ICPPrK4FxkZLpXXo1ZNlutBCD6ZDtmak6Ntb9Siybs7nU86Vn7/
	 hN2y/L3xBpEPtXDREeMYl3QYbVS5C8ua4B6b79jg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 026C8F801F4;
	Sun, 12 Jan 2020 00:34:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18AABF801F4; Sun, 12 Jan 2020 00:34:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 261AEF8010B
 for <alsa-devel@alsa-project.org>; Sun, 12 Jan 2020 00:34:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 261AEF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="MxyTVggK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3QZ0I5pD5K/HCffVuVuB76vN0c9rDDP5IUOkMYf8Rks=; b=MxyTVggKtx1VcdcMEy1IUMxfnW
 svCKqAqnb69uBVKn5RMaNo3tt/jmntNenbUoyLwcOrpTfw4hVX8nf0ecIoE31XUasjYEsU8LclAqv
 qF2fgjSZQOIoJDrPxv2DMwYSjnpAQn/2ZEe1L+JAFdFkMa57KA4088r9aKndSsQRg3Ws=;
Received: from [2a00:1370:8125:8203:1dce:4cab:baac:10ca]
 (helo=home.puleglot.ru)
 by puleglot.ru with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <puleglot@puleglot.ru>)
 id 1iqQHH-000mFd-St; Sun, 12 Jan 2020 02:34:48 +0300
From: Alexander Tsoy <alexander@tsoy.me>
To: alsa-devel@alsa-project.org
Date: Sun, 12 Jan 2020 02:34:46 +0300
Message-Id: <20200111233446.72046-1-alexander@tsoy.me>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [alsa-devel] [PATCH] ALSA: usb-audio: Add boot quirk for MOTU M
	Series
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add delay to make sure that audio urbs are not sent too early.
Otherwise the device hangs. Windows driver makes ~2s delay, so use
about the same time delay value.

snd_usb_apply_boot_quirk() is called 3 times for my MOTU M4, which
is an overkill. Thus a quirk that is called only once is implemented.

Also send two vendor-specific control messages before and after
the delay. This behaviour is blindly copied from the Windows driver.

Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
---
 sound/usb/card.c   |  4 ++++
 sound/usb/quirks.c | 38 ++++++++++++++++++++++++++++++++++++++
 sound/usb/quirks.h |  5 +++++
 3 files changed, 47 insertions(+)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 9f743ebae615..2f582ac7cf78 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -600,6 +600,10 @@ static int usb_audio_probe(struct usb_interface *intf,
 		}
 	}
 	if (! chip) {
+		err = snd_usb_apply_boot_quirk_once(dev, intf, quirk, id);
+		if (err < 0)
+			return err;
+
 		/* it's a fresh one.
 		 * now look for an empty slot and create a new card instance
 		 */
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 82184036437b..c93c53126243 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1113,6 +1113,31 @@ static int snd_usb_motu_microbookii_boot_quirk(struct usb_device *dev)
 	return err;
 }
 
+static int snd_usb_motu_m_series_boot_quirk(struct usb_device *dev)
+{
+	int ret;
+
+	if (snd_usb_pipe_sanity_check(dev, usb_sndctrlpipe(dev, 0)))
+		return -EINVAL;
+	ret = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
+			      1, USB_TYPE_VENDOR | USB_RECIP_DEVICE,
+			      0x0, 0, NULL, 0, 1000);
+
+	if (ret < 0)
+		return ret;
+
+	msleep(2000);
+
+	ret = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
+			      1, USB_TYPE_VENDOR | USB_RECIP_DEVICE,
+			      0x20, 0, NULL, 0, 1000);
+
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 /*
  * Setup quirks
  */
@@ -1297,6 +1322,19 @@ int snd_usb_apply_boot_quirk(struct usb_device *dev,
 	return 0;
 }
 
+int snd_usb_apply_boot_quirk_once(struct usb_device *dev,
+			          struct usb_interface *intf,
+			          const struct snd_usb_audio_quirk *quirk,
+			          unsigned int id)
+{
+	switch (id) {
+	case USB_ID(0x07fd, 0x0008): /* MOTU M Series */
+		return snd_usb_motu_m_series_boot_quirk(dev);
+	}
+
+	return 0;
+}
+
 /*
  * check if the device uses big-endian samples
  */
diff --git a/sound/usb/quirks.h b/sound/usb/quirks.h
index a80e0ddd0736..fa83a98ad7bb 100644
--- a/sound/usb/quirks.h
+++ b/sound/usb/quirks.h
@@ -20,6 +20,11 @@ int snd_usb_apply_boot_quirk(struct usb_device *dev,
 			     const struct snd_usb_audio_quirk *quirk,
 			     unsigned int usb_id);
 
+int snd_usb_apply_boot_quirk_once(struct usb_device *dev,
+			          struct usb_interface *intf,
+			          const struct snd_usb_audio_quirk *quirk,
+			          unsigned int usb_id);
+
 void snd_usb_set_format_quirk(struct snd_usb_substream *subs,
 			      struct audioformat *fmt);
 
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
