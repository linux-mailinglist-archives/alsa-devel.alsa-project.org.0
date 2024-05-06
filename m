Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2B98BD6EA
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2024 23:34:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B855584D;
	Mon,  6 May 2024 23:34:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B855584D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715031278;
	bh=dzRQB9uibS55Go/XXVLUjbbtqEd9ieofAZ3ha4n8qS8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d3rcP9XKYLpqywFDeBx7Me1V48a147f3pU/QNEcSGnt5ChLdu2EMfvZEhBrLZ1ML7
	 eHNgkMxCPG/USWfXDzi316Wss1unn+b8a0NOj7EbLRSxqZzebprCpziCjfBvnzAOly
	 aRHLGmqxslt01f8yywWsuvVcPTTKvpShoheVgobY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05B56F80571; Mon,  6 May 2024 23:34:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44C1CF80571;
	Mon,  6 May 2024 23:34:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D7F6F8049C; Mon,  6 May 2024 23:33:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 690DDF80152
	for <alsa-devel@alsa-project.org>; Mon,  6 May 2024 23:32:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 690DDF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mQ2B2rR1
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6f44b5e7f07so1721291b3a.2
        for <alsa-devel@alsa-project.org>;
 Mon, 06 May 2024 14:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715031175; x=1715635975;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06aTth4DtNNPEbNBcti5kUwq84Dsg7H5rl164l4ZB70=;
        b=mQ2B2rR1vHBjsOd05SALOtmnNPx6QFqkG3fI09M0SNLpxFacUJA8Ummx3VMiVaXxbI
         BpSZJ4GWUjGxaJ0seZrFITIo5rxF3QJPUut3zS2Ipn4HjWKPfONEW55ZLjl09q24kPyE
         9jQPOCwOpPMr79iZyth0kd7g57uzeqGdbkZnm7l6jtT5WnK7O0/Qx+M23T8r7rcXKPFG
         AImNZ6cWIWT5UgDBJBApbcPvRYrApusi+wuGIGFI0+5FxICv65Dfg/0JQcj7YK05o9MC
         XYI2bgQZO77Hlu3kV37D1VcDGPUepfPiRArLphC4Tq76QRO03Fi5kj3OOA+EXuu0UlS/
         us1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715031175; x=1715635975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=06aTth4DtNNPEbNBcti5kUwq84Dsg7H5rl164l4ZB70=;
        b=D7XDF5W2b40GPFP9Zj3zE1D2n3CRN1gjmY5Zn8KX4xH3trHBKXAmBSkCqNUikLGmFj
         BLc52YIDLV7w5FSsxuN6cJ9GRVlyxvnMyP7lRigOPilafX6q9NDeGbDFDG/9f7muiy2K
         mizDBrHQixN1gIFJ1RWWk1hRb5iqR+VblUjopTJBexlbMadzsixPrUlpd2PKqoPJul09
         G8NljAK4ny74FU02itEe3nbRm9Rh1F3xRP6Cm8aRuykSLic2Yb6BAl2LL9wO6Jypm7uf
         Rx6+iYMdomaJ8o+tyCeVISxY/CHVOjhDdX+y5dk8y1cWzpWBC8jfCYz35UbJZq9OteM+
         KLjQ==
X-Gm-Message-State: AOJu0YwCF613SBcWz3pbLbW3EiV45XSQbgY6FI6RB2bqiVlJQrAeWwDt
	rsRfcLpGkIz94TtrzPDEvP1R9SMvmXYAK9qEult50SbQTznoL4SzyiPkD8t3bxc=
X-Google-Smtp-Source: 
 AGHT+IEqwGT2bJ9qXEomFOySpmG2vJ7f/p5vGZ2IsmN9Di5t2TYg90whcEqfo2ChqZ9bwlx3jY+3TQ==
X-Received: by 2002:a05:6a00:1d11:b0:6f4:8008:5cd3 with SMTP id
 a17-20020a056a001d1100b006f480085cd3mr3517776pfx.34.1715031174882;
        Mon, 06 May 2024 14:32:54 -0700 (PDT)
Received: from thought.. ([181.170.161.59])
        by smtp.gmail.com with ESMTPSA id
 c25-20020aa78c19000000b006f447d95de9sm6913308pfd.29.2024.05.06.14.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 14:32:54 -0700 (PDT)
From: Manuel Barrio Linares <mbarriolinares@gmail.com>
To: alsa-devel@alsa-project.org
Cc: Manuel Barrio Linares <mbarriolinares@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	dengxiang <dengxiang@nfschina.com>,
	Max McCarthy <mmccarthy@mcintoshlabs.com>,
	Christos Skevis <xristos.thes@gmail.com>,
	Alexander Tsoy <alexander@tsoy.me>,
	Julian Sikorski <belegdol+github@gmail.com>,
	Jussi Laako <jussi@sonarnerd.net>,
	Lukasz Tyl <ltyl@hem-e.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] ALSA: usb-audio: Add sampling rates support for Mbox3
Date: Mon,  6 May 2024 18:32:38 -0300
Message-ID: <20240506213240.6191-1-mbarriolinares@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <87mspakltl.wl-tiwai@suse.de>
References: <87mspakltl.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UF5PXJ2NR7DXLJPXJ2EYSEDHOF42BLWD
X-Message-ID-Hash: UF5PXJ2NR7DXLJPXJ2EYSEDHOF42BLWD
X-MailFrom: mbarriolinares@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UF5PXJ2NR7DXLJPXJ2EYSEDHOF42BLWD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This adds support for all sample rates supported by the hardware,
Digidesign Mbox 3 supports: {44100, 48000, 88200, 96000}

Fixes syncing clock issues that presented as pops. To test this, without
this patch playing 440hz tone produces pops.

Clock is now synced between playback and capture interfaces so no more
latency drift issue when using pipewire pro-profile.
(https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/3900)

Signed-off-by: Manuel Barrio Linares <mbarriolinares@gmail.com>
---
v2: Cleaned up code. Explicit __le32 usage.
v3: Get rid of sparse warnings
v4: Fixed wrong use of usb_sndctrlpipe to usb_rcvctrlpipe, lines 1743 and 1768

 sound/usb/quirks-table.h | 38 +++++++++++++--------
 sound/usb/quirks.c       | 74 +++++++++++++++++++++++++++++++---------
 2 files changed, 81 insertions(+), 31 deletions(-)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 5d72dc8441cbb..73abc38a54006 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -3013,21 +3013,28 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
 				.data = &(const struct audioformat) {
 					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.fmt_bits = 24,
 					.channels = 4,
 					.iface = 2,
 					.altsetting = 1,
 					.altset_idx = 1,
 					.attributes = 0x00,
-					.endpoint = 0x01,
+					.endpoint = USB_RECIP_INTERFACE | USB_DIR_OUT,
 					.ep_attr = USB_ENDPOINT_XFER_ISOC |
 						USB_ENDPOINT_SYNC_ASYNC,
-					.rates = SNDRV_PCM_RATE_48000,
-					.rate_min = 48000,
-					.rate_max = 48000,
-					.nr_rates = 1,
+					.rates = SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 |
+							SNDRV_PCM_RATE_88200 | SNDRV_PCM_RATE_96000,
+					.rate_min = 44100,
+					.rate_max = 96000,
+					.nr_rates = 4,
 					.rate_table = (unsigned int[]) {
-						48000
-					}
+						44100, 48000, 88200, 96000
+					},
+					.sync_ep = USB_RECIP_INTERFACE | USB_DIR_IN,
+					.sync_iface = 3,
+					.sync_altsetting = 1,
+					.sync_ep_idx = 1,
+					.implicit_fb = 1,
 				}
 			},
 			{
@@ -3035,22 +3042,25 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
 				.data = &(const struct audioformat) {
 					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.fmt_bits = 24,
 					.channels = 4,
 					.iface = 3,
 					.altsetting = 1,
 					.altset_idx = 1,
-					.endpoint = 0x81,
 					.attributes = 0x00,
+					.endpoint = USB_RECIP_INTERFACE | USB_DIR_IN,
 					.ep_attr = USB_ENDPOINT_XFER_ISOC |
 						USB_ENDPOINT_SYNC_ASYNC,
 					.maxpacksize = 0x009c,
-					.rates = SNDRV_PCM_RATE_48000,
-					.rate_min = 48000,
-					.rate_max = 48000,
-					.nr_rates = 1,
+					.rates = SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 |
+							SNDRV_PCM_RATE_88200 | SNDRV_PCM_RATE_96000,
+					.rate_min = 44100,
+					.rate_max = 96000,
+					.nr_rates = 4,
 					.rate_table = (unsigned int[]) {
-						48000
-					}
+						44100, 48000, 88200, 96000
+					},
+					.implicit_fb = 0,
 				}
 			},
 			{
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 09712e61c606e..58156fbca02c7 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -984,21 +984,13 @@ static int snd_usb_axefx3_boot_quirk(struct usb_device *dev)
 	return 0;
 }
 
-static void mbox3_setup_48_24_magic(struct usb_device *dev)
+static void mbox3_setup_defaults(struct usb_device *dev)
 {
 	/* The Mbox 3 is "little endian" */
 	/* max volume is: 0x0000. */
 	/* min volume is: 0x0080 (shown in little endian form) */
 
-
-	/* Load 48000Hz rate into buffer */
-	u8 com_buff[4] = {0x80, 0xbb, 0x00, 0x00};
-
-	/* Set 48000Hz sample rate */
-	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
-			0x01, 0x21, 0x0100, 0x0001, &com_buff, 4);  //Is this really needed?
-	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
-			0x01, 0x21, 0x0100, 0x8101, &com_buff, 4);
+	u8 com_buff[2];
 
 	/* Deactivate Tuner */
 	/* on  = 0x01*/
@@ -1008,6 +1000,8 @@ static void mbox3_setup_48_24_magic(struct usb_device *dev)
 		0x01, 0x21, 0x0003, 0x2001, &com_buff, 1);
 
 	/* Set clock source to Internal (as opposed to S/PDIF) */
+	/* Internal  = 0x01*/
+	/* S/PDIF    = 0x02*/
 	com_buff[0] = 0x01;
 	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
 			1, 0x21, 0x0100, 0x8001, &com_buff, 1);
@@ -1113,9 +1107,11 @@ static void mbox3_setup_48_24_magic(struct usb_device *dev)
 			1, 0x21, 0x0107, 0x4201, &com_buff, 2);
 
 	/* Toggle allowing host control */
+	/* Not needed
 	com_buff[0] = 0x02;
 	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
 			3, 0x21, 0x0000, 0x2001, &com_buff, 1);
+	 */
 
 	/* Do not dim fx returns */
 	com_buff[0] = 0x00;
@@ -1259,26 +1255,27 @@ static int snd_usb_mbox3_boot_quirk(struct usb_device *dev)
 	descriptor_size = le16_to_cpu(get_cfg_desc(config)->wTotalLength);
 
 	if (descriptor_size != MBOX3_DESCRIPTOR_SIZE) {
-		dev_err(&dev->dev, "Invalid descriptor size=%d.\n", descriptor_size);
+		dev_err(&dev->dev, "MBOX3: Invalid descriptor size=%d.\n", descriptor_size);
 		return -ENODEV;
 	}
 
-	dev_dbg(&dev->dev, "device initialised!\n");
+	dev_dbg(&dev->dev, "MBOX3: device initialised!\n");
 
 	err = usb_get_descriptor(dev, USB_DT_DEVICE, 0,
 		&dev->descriptor, sizeof(dev->descriptor));
 	config = dev->actconfig;
 	if (err < 0)
-		dev_dbg(&dev->dev, "error usb_get_descriptor: %d\n", err);
+		dev_dbg(&dev->dev, "MBOX3: error usb_get_descriptor: %d\n", err);
 
 	err = usb_reset_configuration(dev);
 	if (err < 0)
-		dev_dbg(&dev->dev, "error usb_reset_configuration: %d\n", err);
-	dev_dbg(&dev->dev, "mbox3_boot: new boot length = %d\n",
+		dev_dbg(&dev->dev, "MBOX3: error usb_reset_configuration: %d\n", err);
+
+	dev_dbg(&dev->dev, "MBOX3: new boot length = %d\n",
 		le16_to_cpu(get_cfg_desc(config)->wTotalLength));
 
-	mbox3_setup_48_24_magic(dev);
-	dev_info(&dev->dev, "Digidesign Mbox 3: 24bit 48kHz");
+	mbox3_setup_defaults(dev);
+	dev_info(&dev->dev, "MBOX3: Initialized.");
 
 	return 0; /* Successful boot */
 }
@@ -1734,6 +1731,46 @@ static int pioneer_djm_set_format_quirk(struct snd_usb_substream *subs,
 	return 0;
 }
 
+static void mbox3_set_format_quirk(struct snd_usb_substream *subs,
+				const struct audioformat *fmt)
+{
+	__le32 buff4 = 0;
+	u8 buff1 = 0x01;
+	u32 new_rate = subs->data_endpoint->cur_rate;
+	u32 current_rate;
+
+	// Get current rate from card and check if changing it is needed
+	snd_usb_ctl_msg(subs->dev, usb_rcvctrlpipe(subs->dev, 0),
+					0x01, 0x21 | USB_DIR_IN, 0x0100, 0x8101, &buff4, 4);
+	current_rate = le32_to_cpu(buff4);
+	dev_dbg(&subs->dev->dev,
+			 "MBOX3: Current configured sample rate: %d", current_rate);
+	if (current_rate == new_rate) {
+		dev_dbg(&subs->dev->dev,
+			"MBOX3: No change needed (current rate:%d == new rate:%d)",
+			current_rate, new_rate);
+		return;
+	}
+
+	// Set new rate
+	dev_info(&subs->dev->dev,
+			 "MBOX3: Changing sample rate to: %d", new_rate);
+	buff4 = cpu_to_le32(new_rate);
+	snd_usb_ctl_msg(subs->dev, usb_sndctrlpipe(subs->dev, 0),
+					0x01, 0x21, 0x0100, 0x8101, &buff4, 4);
+
+	// Set clock source to Internal
+	snd_usb_ctl_msg(subs->dev, usb_sndctrlpipe(subs->dev, 0),
+					0x01, 0x21, 0x0100, 0x8001, &buff1, 1);
+
+	// Check whether the change was successful
+	buff4 = 0;
+	snd_usb_ctl_msg(subs->dev, usb_rcvctrlpipe(subs->dev, 0),
+					0x01, 0x21 | USB_DIR_IN, 0x0100, 0x8101, &buff4, 4);
+	if (new_rate != le32_to_cpu(buff4))
+		dev_warn(&subs->dev->dev, "MBOX3: Couldn't set the sample rate");
+}
+
 void snd_usb_set_format_quirk(struct snd_usb_substream *subs,
 			      const struct audioformat *fmt)
 {
@@ -1755,6 +1792,9 @@ void snd_usb_set_format_quirk(struct snd_usb_substream *subs,
 	case USB_ID(0x08e4, 0x0163): /* Pioneer DJM-850 */
 		pioneer_djm_set_format_quirk(subs, 0x0086);
 		break;
+	case USB_ID(0x0dba, 0x5000):
+		mbox3_set_format_quirk(subs, fmt); /* Digidesign Mbox 3 */
+		break;
 	}
 }
 
-- 
2.45.0

