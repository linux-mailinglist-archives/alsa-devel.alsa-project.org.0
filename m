Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FC11747A5
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Feb 2020 16:20:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E06916C7;
	Sat, 29 Feb 2020 16:19:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E06916C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582989616;
	bh=AiuBYTLnwKCxr5u4Mz7LxFqQi5+axvTG9ulG7zahD3Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Bd1sRqNQ8MaQRvsopM8yB1Hn9zXfb0sXIKo6++XYrqqb5YAmeo/xQL5ErnpRPDZeB
	 K95iRdBDaD24p++jC80441Ep6YkNrfUT/ec0TzJeNoNxmnqKwleSjsv/3O2Dukm7eF
	 aGn2k/sY5pF4WkPLxUQzCBcoAkIeDZu9dskODFic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88FBFF800C6;
	Sat, 29 Feb 2020 16:18:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0DC9F80138; Sat, 29 Feb 2020 16:18:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C83DF80138
 for <alsa-devel@alsa-project.org>; Sat, 29 Feb 2020 16:18:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C83DF80138
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="ioiFuvTv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SJPWrlHj3hThIWe+0cqHFtLlvI6lGptrpw/QRu65zjA=; b=ioiFuvTvsW58EJAbnhGEtNX6JV
 hS6MJ0Y9l+tmf9sNQ9hKBDYAgJwdKh+WDnYMAn7y8ipc0O4BIaYWDDwtVUgTgYSxXEY2zGhHu/oTI
 pBRuAO3XYVFcqkhTFQuBuSZSOFGjrQXecCowCp5pZAfIoiy+mrAn1UdmAtPGdwvZewpo=;
Received: from [2a00:1370:8125:a23e:55c9:2d3a:3db9:4bca]
 (helo=home.puleglot.ru)
 by puleglot.ru with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <puleglot@puleglot.ru>)
 id 1j83sf-0001ms-4q; Sat, 29 Feb 2020 18:18:17 +0300
From: Alexander Tsoy <alexander@tsoy.me>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Add support for MOTU MicroBook IIc
Date: Sat, 29 Feb 2020 18:18:15 +0300
Message-Id: <20200229151815.14199-1-alexander@tsoy.me>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>
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

MicroBook IIc operates in UAC2 mode by default. This patch addresses
several issues with it:

- MicroBook II and IIc shares the same USB ID. We can distinguish them
  by interface class.
- MaxPacketsOnly attribute is erroneously set in endpoint descriptors.
  As a result this card produces noise with all sample rates other than
  96 KHz. This also causes issues like IOMMU page faults and other
  problems with host controller.
- Sample rate changes takes more than 2 seconds for this device. Clock
  validity request returns false during that period, so the clock validity
  quirk is required.

Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
---
 sound/usb/clock.c        | 59 ++++++++++++++++++++++++++++++++--------
 sound/usb/pcm.c          |  7 ++++-
 sound/usb/quirks-table.h |  2 +-
 sound/usb/quirks.c       | 18 +++++++++++-
 4 files changed, 72 insertions(+), 14 deletions(-)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index a48313dfa967..b118cf97607f 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -151,16 +151,15 @@ static int uac_clock_selector_set_val(struct snd_usb_audio *chip, int selector_i
 	return ret;
 }
 
-/*
- * Assume the clock is valid if clock source supports only one single sample
- * rate, the terminal is connected directly to it (there is no clock selector)
- * and clock type is internal. This is to deal with some Denon DJ controllers
- * that always reports that clock is invalid.
- */
 static bool uac_clock_source_is_valid_quirk(struct snd_usb_audio *chip,
 					    struct audioformat *fmt,
 					    int source_id)
 {
+	bool ret = false;
+	int count;
+	unsigned char data;
+	struct usb_device *dev = chip->dev;
+
 	if (fmt->protocol == UAC_VERSION_2) {
 		struct uac_clock_source_descriptor *cs_desc =
 			snd_usb_find_clock_source(chip->ctrl_intf, source_id);
@@ -168,13 +167,51 @@ static bool uac_clock_source_is_valid_quirk(struct snd_usb_audio *chip,
 		if (!cs_desc)
 			return false;
 
-		return (fmt->nr_rates == 1 &&
-			(fmt->clock & 0xff) == cs_desc->bClockID &&
-			(cs_desc->bmAttributes & 0x3) !=
-				UAC_CLOCK_SOURCE_TYPE_EXT);
+		/*
+		 * Assume the clock is valid if clock source supports only one
+		 * single sample rate, the terminal is connected directly to it
+		 * (there is no clock selector) and clock type is internal.
+		 * This is to deal with some Denon DJ controllers that always
+		 * reports that clock is invalid.
+		 */
+		if (fmt->nr_rates == 1 &&
+		    (fmt->clock & 0xff) == cs_desc->bClockID &&
+		    (cs_desc->bmAttributes & 0x3) !=
+				UAC_CLOCK_SOURCE_TYPE_EXT)
+			return true;
+	}
+
+	/*
+	 * MOTU MicroBook IIc
+	 * Sample rate changes takes more than 2 seconds for this device. Clock
+	 * validity request returns false during that period.
+	 */
+	if (chip->usb_id == USB_ID(0x07fd, 0x0004)) {
+		count = 0;
+
+		while ((!ret) && (count < 50)) {
+			int err;
+
+			msleep(100);
+
+			err = snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0), UAC2_CS_CUR,
+					      USB_TYPE_CLASS | USB_RECIP_INTERFACE | USB_DIR_IN,
+					      UAC2_CS_CONTROL_CLOCK_VALID << 8,
+					      snd_usb_ctrl_intf(chip) | (source_id << 8),
+					      &data, sizeof(data));
+			if (err < 0) {
+				dev_warn(&dev->dev,
+					 "%s(): cannot get clock validity for id %d\n",
+					   __func__, source_id);
+				return false;
+			}
+
+			ret = !!data;
+			count++;
+		}
 	}
 
-	return false;
+	return ret;
 }
 
 static bool uac_clock_source_is_valid(struct snd_usb_audio *chip,
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index bd258f1ec2dd..a4e4064f9aee 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -357,7 +357,12 @@ static int set_sync_ep_implicit_fb_quirk(struct snd_usb_substream *subs,
 		ep = 0x81;
 		ifnum = 1;
 		goto add_sync_ep_from_ifnum;
-	case USB_ID(0x07fd, 0x0004): /* MOTU MicroBook II */
+	case USB_ID(0x07fd, 0x0004): /* MOTU MicroBook II/IIc */
+		/* MicroBook IIc */
+		if (altsd->bInterfaceClass == USB_CLASS_AUDIO)
+			return 0;
+
+		/* MicroBook II */
 		ep = 0x84;
 		ifnum = 0;
 		goto add_sync_ep_from_ifnum;
diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index d187aa6d50db..1c8719292eee 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -3472,7 +3472,7 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
 },
 /* MOTU Microbook II */
 {
-	USB_DEVICE(0x07fd, 0x0004),
+	USB_DEVICE_VENDOR_SPEC(0x07fd, 0x0004),
 	.driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
 		.vendor_name = "MOTU",
 		.product_name = "MicroBookII",
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 7f558f4b4520..a7bd32bd301c 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1316,7 +1316,15 @@ int snd_usb_apply_boot_quirk(struct usb_device *dev,
 	case USB_ID(0x2466, 0x8010): /* Fractal Audio Axe-Fx 3 */
 		return snd_usb_axefx3_boot_quirk(dev);
 	case USB_ID(0x07fd, 0x0004): /* MOTU MicroBook II */
-		return snd_usb_motu_microbookii_boot_quirk(dev);
+		/*
+		 * For some reason interface 3 with vendor-spec class is
+		 * detected on MicroBook IIc.
+		 */
+		if (get_iface_desc(intf->altsetting)->bInterfaceClass ==
+		    USB_CLASS_VENDOR_SPEC &&
+		    get_iface_desc(intf->altsetting)->bInterfaceNumber < 3)
+			return snd_usb_motu_microbookii_boot_quirk(dev);
+		break;
 	}
 
 	return 0;
@@ -1754,5 +1762,13 @@ void snd_usb_audioformat_attributes_quirk(struct snd_usb_audio *chip,
 		else
 			fp->ep_attr |= USB_ENDPOINT_SYNC_SYNC;
 		break;
+	case USB_ID(0x07fd, 0x0004):  /* MOTU MicroBook IIc */
+		/*
+		 * MaxPacketsOnly attribute is erroneously set in endpoint
+		 * descriptors. As a result this card produces noise with
+		 * all sample rates other than 96 KHz.
+		 */
+		fp->attributes &= ~UAC_EP_CS_ATTR_FILL_MAX;
+		break;
 	}
 }
-- 
2.24.1

