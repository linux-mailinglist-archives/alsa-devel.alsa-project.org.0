Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E7C597421
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 18:29:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D24FD1655;
	Wed, 17 Aug 2022 18:28:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D24FD1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660753757;
	bh=sJgnVJKK9IR4l6gWwON2dyjFR2rmjjWfZqlHSA0fSC8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UJawzZB+7P0O1ONtOJl/YsmUxFcT0M733/zvh3smItRQDAxpoHlPskPGPW2yFdJN1
	 5swJiLZr46gUXxKJWZA/KTtrqvlyjqN3jWSInm/+bG5kFQfD+t0FVTvEuvFIiUkbga
	 kTV/DawAy82s17s+qKnETTnvu+G6YiEw8WsPn4Vc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63513F800E9;
	Wed, 17 Aug 2022 18:28:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACD1EF80130; Wed, 17 Aug 2022 18:28:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E992AF800E9
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 18:28:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E992AF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RjjtlFm1"
Received: by mail-qt1-x82c.google.com with SMTP id w28so10748907qtc.7
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 09:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=84eTAGx0/iZdMs80cscY6pnAMyP5q+MBWyzS+CR0IDo=;
 b=RjjtlFm11W5bXxz0Jr1BaZhjERjchIG28Jn8oFVBKJ2amYNNIdS199JHG9XetQ80kq
 nJkW5XfveR24MWc11sA0jUHvPetzV8EzmVokn8kU6RFuopy8lgAesjr2jPippc5ymcNl
 lJaCk3ILwOVsY1m1+Pj0iQWG9yNoTTIizS5zPszvpZ5tN+eeNuc//bVdCv/welw/mpbK
 d0ayAwyrvjcQzgFj15YHWCXNtVbOU74TJOeed82KPa6Esyq1XgcVLkNHap+/aH6OavMm
 PlqY36QWIXJqtrC1cnahUHlsxd9NWtxVwixW6Smeim/2GEcskfAEE81AtJXt+TY5CAXT
 dvtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=84eTAGx0/iZdMs80cscY6pnAMyP5q+MBWyzS+CR0IDo=;
 b=JiS3vTy0e5i9MyOKQxg2eGOQGNWxIwn5RgOphEsT2DV7ftM7IVPKc7sCUXxZBKLbw6
 5uVc3nd1wZD+caJ4782DfS4VqbjEOuUmzGGUzUb+QXudAPnsH4SQrMXjpFGG14X/zzRg
 eswydMPgFxzGnKTXMc7n9jGJYplhD0Utpt2BYstLERb6RmqFuYL8yYx0s6BG4RRcd+o5
 UYSEC7frEwYL1Ey1WUsqsu0nAr6e8RFLqYxfVXb6PpK0AHrJPZCEALQRlSbkZM6Dm1S3
 wdZmk1kSgU/88IKKVa1G9xR0lLvHIMWDHl4yLkW0V1kcquRPTJUiaDffoso27MTVDBqZ
 BItw==
X-Gm-Message-State: ACgBeo0ZRlJf2tv8qy80wYomXOt/XJq4IhiOdiSkFg+ycqcuo+oI9MT3
 Ph8YAmF5rlfObXkmG55EI2g=
X-Google-Smtp-Source: AA6agR7tNr81RcYRrV1w7+gmmScN31uqahP9WBKjI1dKib3tBPf0JzC9Q3d6P8qVjyb59uA1E/iFeg==
X-Received: by 2002:ac8:5804:0:b0:344:5ba8:81e0 with SMTP id
 g4-20020ac85804000000b003445ba881e0mr13961981qtg.181.1660753688481; 
 Wed, 17 Aug 2022 09:28:08 -0700 (PDT)
Received: from archlinux.localdomain (cpe-74-140-176-199.cinci.res.rr.com.
 [74.140.176.199]) by smtp.gmail.com with ESMTPSA id
 21-20020ac85655000000b0034355a352d1sm13030071qtt.92.2022.08.17.09.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 09:28:08 -0700 (PDT)
From: connerknoxpublic@gmail.com
To: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 mbarriolinares@gmail.com
Subject: [PATCH] Add quirk to enable Avid Mbox 3 support
Date: Wed, 17 Aug 2022 12:27:26 -0400
Message-Id: <20220817162727.9646-1-connerknoxpublic@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <87r11fwbwu.wl-tiwai@suse.de>
References: <87r11fwbwu.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Conner Knox <connerknoxpublic@gmail.com>
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

From: Conner Knox <connerknoxpublic@gmail.com>

Add support for Avid Mbox3 USB audio interface at 48kHz

Signed-off-by: Conner Knox <connerknoxpublic@gmail.com>
---
 sound/usb/quirks-table.h |  76 ++++++++++
 sound/usb/quirks.c       | 311 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 387 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 0ea39565e623..5f43863e5a5f 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -2978,6 +2978,82 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 		}
 	}
 },
+/* DIGIDESIGN MBOX 3 */
+{
+	USB_DEVICE(0x0dba, 0x5000),
+	.driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
+		.vendor_name = "Digidesign",
+		.product_name = "Mbox 3",
+		.ifnum = QUIRK_ANY_INTERFACE,
+		.type = QUIRK_COMPOSITE,
+		.data = (const struct snd_usb_audio_quirk[]) {
+			{
+				.ifnum = 0,
+				.type = QUIRK_IGNORE_INTERFACE
+			},
+			{
+				.ifnum = 1,
+				.type = QUIRK_IGNORE_INTERFACE
+			},
+			{
+				.ifnum = 2,
+				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
+				.data = &(const struct audioformat) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 4,
+					.iface = 2,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.attributes = 0x00,
+					.endpoint = 0x01,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC |
+						USB_ENDPOINT_SYNC_ASYNC,
+					.rates = SNDRV_PCM_RATE_48000,
+					.rate_min = 48000,
+					.rate_max = 48000,
+					.nr_rates = 1,
+					.rate_table = (unsigned int[]) {
+						48000
+					}
+				}
+			},
+			{
+				.ifnum = 3,
+				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
+				.data = &(const struct audioformat) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 4,
+					.iface = 3,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x81,
+					.attributes = 0x00,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC |
+						USB_ENDPOINT_SYNC_ASYNC,
+					.maxpacksize = 0x009c,
+					.rates = SNDRV_PCM_RATE_48000,
+					.rate_min = 48000,
+					.rate_max = 48000,
+					.nr_rates = 1,
+					.rate_table = (unsigned int[]) {
+						48000
+					}
+				}
+			},
+			{
+				.ifnum = 4,
+				.type = QUIRK_MIDI_FIXED_ENDPOINT,
+				.data = & (const struct snd_usb_midi_endpoint_info) {
+					.out_cables = 0x0001,
+					.in_cables  = 0x0001
+				}
+			},
+			{
+				.ifnum = -1
+			}
+		}
+	}
+},
 {
 	/* Tascam US122 MKII - playback-only support */
 	USB_DEVICE_VENDOR_SPEC(0x0644, 0x8021),
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index ab9f3da49941..e7caa7eeb955 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1020,6 +1020,313 @@ static int snd_usb_axefx3_boot_quirk(struct usb_device *dev)
 	return 0;
 }
 
+static void mbox3_setup_48_24_magic(struct usb_device *dev)
+{
+	u8 com_buff[4];
+
+	/* Load 48000Hz rate into buffer */
+	com_buff[0] = 0x80;
+	com_buff[1] = 0xbb;
+	com_buff[2] = 0x00;
+	com_buff[3] = 0x00;
+
+	/* Set 48000Hz sample rate */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			0x01, 0x21, 0x0100, 0x0001, &com_buff, 0x0004);
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			0x01, 0x21, 0x0100, 0x8101, &com_buff, 0x0004);
+
+	/* Set clock source to Internal (as opposed to S/PDIF) */
+	memset(com_buff, 0x00, 4);
+	com_buff[0] = 0x01;
+	com_buff[1] = 0x00;
+	com_buff[2] = 0x00;
+	com_buff[3] = 0x00;
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0100, 0x8001, &com_buff, 1);
+
+	/* Mute the hardware loopbacks to start the device in a known state.
+	 * The Mbox 3 is little endian and
+	 * the data written here seems a bit odd.
+	 * 0x8000 (shown in big endian form) is muted
+	 * and volume increases to 0xffff it seems.
+	 * I've yet to observe 0xffff being sent.
+	 * Instead, full volume seems to be 0x0000.
+	 * Per my understanding of 16 bit integers, this is seems strange, but maybe I'm missing something
+	 */
+	memset(com_buff, 0x00, 4);
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x80;
+	com_buff[2] = 0x00;
+	com_buff[3] = 0x00;
+	/* Analogue input 1 left channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0110, 0x4001, &com_buff, 2);
+	/* Analogue input 1 right channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0111, 0x4001, &com_buff, 2);
+	/* Analogue input 2 left channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0114, 0x4001, &com_buff, 2);
+	/* Analogue input 2 right channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0115, 0x4001, &com_buff, 2);
+	/* Analogue input 3 left channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0118, 0x4001, &com_buff, 2);
+	/* Analogue input 3 right channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0119, 0x4001, &com_buff, 2);
+	/* Analogue input 4 left channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x011c, 0x4001, &com_buff, 2);
+	/* Analogue input 4 right channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x011d, 0x4001, &com_buff, 2);
+
+	/* Set software sends to output */
+	memset(com_buff, 0x00, 4);
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x00;
+	com_buff[2] = 0x00;
+	com_buff[3] = 0x00;
+	/* Analogue software return 1 left channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0100, 0x4001, &com_buff, 2);
+	/* Analogue software return 1 right channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0101, 0x4001, &com_buff, 2);
+	/* Analogue software return 2 left channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0104, 0x4001, &com_buff, 2);
+	/* Analogue software return 2 right channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0105, 0x4001, &com_buff, 2);
+	/* Analogue software return 3 left channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0108, 0x4001, &com_buff, 2);
+	/* Analogue software return 3 right channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0109, 0x4001, &com_buff, 2);
+	/* Analogue software return 4 left channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x010c, 0x4001, &com_buff, 2);
+	/* Analogue software return 4 right channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x010d, 0x4001, &com_buff, 2);
+
+	/* Return to muting sends */
+	memset(com_buff, 0x00, 4);
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x80;
+	com_buff[2] = 0x00;
+	com_buff[3] = 0x00;
+	/* Analogue fx return left channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0120, 0x4001, &com_buff, 2);
+	/* Analogue fx return right channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0121, 0x4001, &com_buff, 2);
+
+	/* Analogue software input 1 fx send: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0100, 0x4201, &com_buff, 2);
+	/* Analogue software input 2 fx send: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0101, 0x4201, &com_buff, 2);
+	/* Analogue software input 3 fx send: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0102, 0x4201, &com_buff, 2);
+	/* Analogue software input 4 fx send: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0103, 0x4201, &com_buff, 2);
+	/* Analogue input 1 fx send: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0104, 0x4201, &com_buff, 2);
+	/* Analogue input 2 fx send: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0105, 0x4201, &com_buff, 2);
+	/* Analogue input 3 fx send: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0106, 0x4201, &com_buff, 2);
+	/* Analogue input 4 fx send: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0107, 0x4201, &com_buff, 2);
+
+	/* Toggle allowing host control */
+	memset(com_buff, 0x00, 4);
+	com_buff[0] = 0x02;
+	com_buff[1] = 0x00;
+	com_buff[2] = 0x00;
+	com_buff[3] = 0x00;
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			3, 0x21, 0x0000, 0x2001, &com_buff, 1);
+
+	/* Do not dim fx returns */
+	memset(com_buff, 0x00, 4);
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x00;
+	com_buff[2] = 0x00;
+	com_buff[3] = 0x00;
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0), 3, 0x21, 0x0002, 0x2001, &com_buff, 1);
+
+	/* Do not set fx returns to mono */
+	memset(com_buff, 0x00, 4);
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x00;
+	com_buff[2] = 0x00;
+	com_buff[3] = 0x00;
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0), 3, 0x21, 0x0001, 0x2001, &com_buff, 1);
+
+	/* Mute the S/PDIF hardware loopback
+	 * same odd volume logic here as above
+	 */
+	memset(com_buff, 0x00, 4);
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x80;
+	com_buff[2] = 0x00;
+	com_buff[3] = 0x00;
+	/* S/PDIF hardware input 1 left channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0112, 0x4001, &com_buff, 2);
+	/* S/PDIF hardware input 1 right channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0113, 0x4001, &com_buff, 2);
+	/* S/PDIF hardware input 2 left channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0116, 0x4001, &com_buff, 2);
+	/* S/PDIF hardware input 2 right channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0117, 0x4001, &com_buff, 2);
+	/* S/PDIF hardware input 3 left channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x011a, 0x4001, &com_buff, 2);
+	/* S/PDIF hardware input 3 right channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x011b, 0x4001, &com_buff, 2);
+	/* S/PDIF hardware input 4 left channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x011e, 0x4001, &com_buff, 2);
+	/* S/PDIF hardware input 4 right channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x011f, 0x4001, &com_buff, 2);
+	/* S/PDIF software return 1 left channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0102, 0x4001, &com_buff, 2);
+	/* S/PDIF software return 1 right channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0103, 0x4001, &com_buff, 2);
+	/* S/PDIF software return 2 left channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0106, 0x4001, &com_buff, 2);
+	/* S/PDIF software return 2 right channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0107, 0x4001, &com_buff, 2);
+	/* S/PDIF software return 3 left channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x010a, 0x4001, &com_buff, 2);
+	/* S/PDIF software return 3 right channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x010b, 0x4001, &com_buff, 2);
+	/* S/PDIF software return 4 left channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x010e, 0x4001, &com_buff, 2);
+	/* S/PDIF software return 4 right channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x010f, 0x4001, &com_buff, 2);
+	/* S/PDIF fx returns left channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0122, 0x4001, &com_buff, 2);
+	/* S/PDIF fx returns right channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0123, 0x4001, &com_buff, 2);
+
+	/* Set the dropdown "Effect" to the first option */
+	memset(com_buff, 0x00, 4);
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x00;
+	com_buff[2] = 0x00;
+	com_buff[3] = 0x00;
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0200, 0x4301, &com_buff, 1);
+
+	/* Set the effect duration to 0 */
+	memset(com_buff, 0x00, 4);
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x00;
+	com_buff[2] = 0x00;
+	com_buff[3] = 0x00;
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0400, 0x4301, &com_buff, 2);
+
+	/* Set the effect volume and feedback to 0 */
+	memset(com_buff, 0x00, 4);
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x00;
+	com_buff[2] = 0x00;
+	com_buff[3] = 0x00;
+	/* feedback: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0500, 0x4301, &com_buff, 1);
+	/* volume: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0300, 0x4301, &com_buff, 1);
+
+	/* Set soft button hold duration */
+	memset(com_buff, 0x00, 4);
+	com_buff[0] = 0x05;
+	com_buff[1] = 0x00;
+	com_buff[2] = 0x00;
+	com_buff[3] = 0x00;
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			3, 0x21, 0x0005, 0x2001, &com_buff, 1);
+
+	/* Use dim LEDs for button of state */
+	memset(com_buff, 0x00, 4);
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x00;
+	com_buff[2] = 0x00;
+	com_buff[3] = 0x00;
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			3, 0x21, 0x0004, 0x2001, &com_buff, 1);
+
+	return;
+}
+
+#define MBOX3_DESCRIPTOR_SIZE	464
+
+static int snd_usb_mbox3_boot_quirk(struct usb_device *dev)
+{
+	struct usb_host_config *config = dev->actconfig;
+	int err;
+	int descriptor_size;
+
+	descriptor_size = le16_to_cpu(get_cfg_desc(config)->wTotalLength);
+
+	if (descriptor_size != MBOX3_DESCRIPTOR_SIZE) {
+		dev_err(&dev->dev, "Invalid descriptor size=%d.\n", descriptor_size);
+		return -ENODEV;
+	}
+
+	dev_dbg(&dev->dev, "device initialised!\n");
+
+	err = usb_get_descriptor(dev, USB_DT_DEVICE, 0,
+		&dev->descriptor, sizeof(dev->descriptor));
+	config = dev->actconfig;
+	if (err < 0)
+		dev_dbg(&dev->dev, "error usb_get_descriptor: %d\n", err);
+
+	err = usb_reset_configuration(dev);
+	if (err < 0)
+		dev_dbg(&dev->dev, "error usb_reset_configuration: %d\n", err);
+	dev_dbg(&dev->dev, "mbox3_boot: new boot length = %d\n",
+		le16_to_cpu(get_cfg_desc(config)->wTotalLength));
+
+	mbox3_setup_48_24_magic(dev);
+	dev_info(&dev->dev, "Digidesign Mbox 3: 24bit 48kHz");
+
+	return 0; /* Successful boot */
+}
 
 #define MICROBOOK_BUF_SIZE 128
 
@@ -1324,6 +1631,10 @@ int snd_usb_apply_boot_quirk(struct usb_device *dev,
 	case USB_ID(0x0dba, 0x3000):
 		/* Digidesign Mbox 2 */
 		return snd_usb_mbox2_boot_quirk(dev);
+	case USB_ID(0x0dba, 0x5000):
+		/* Digidesign Mbox 3 */
+		return snd_usb_mbox3_boot_quirk(dev);
+
 
 	case USB_ID(0x1235, 0x0010): /* Focusrite Novation Saffire 6 USB */
 	case USB_ID(0x1235, 0x0018): /* Focusrite Novation Twitch */
-- 
2.37.2

