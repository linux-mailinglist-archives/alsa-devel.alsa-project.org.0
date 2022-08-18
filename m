Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B72598D95
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 22:16:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBA4F166F;
	Thu, 18 Aug 2022 22:15:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBA4F166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660853809;
	bh=zvxmbltPUjSz3FPKXkRGfoYkuim5NytzfIetSDxMNPI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p0ytIFQtLnHiaB5cyZTJ4SPVuXZG+K5Kv8jcdpR5WcDIUakgrfa5gFPqFFu4RyXT7
	 n3DVhYt2ylIm4KSSsBYEH26/Zf7wmMEWOYVfF50xIOiU9wcVdCm9+uCacudqryDOHM
	 c2w3g1rAaH5zJMjsPRhfXsKn+cLsxgLQyWFRKoAs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58C27F800EE;
	Thu, 18 Aug 2022 22:15:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4ED4FF80430; Thu, 18 Aug 2022 22:15:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7AFAF800EE
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 22:15:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7AFAF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="M5I0LKQV"
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-11cab7d7e0fso1869820fac.6
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 13:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=718UuZmLF0eZqeqQ5Lqai9Kl3qGckeeodY7/EazVofs=;
 b=M5I0LKQVjzANzCBc8dzMX8WApfa1rapxj3zRjg2i2arBdM3ZXM9EntRJPo97xidu2P
 33HIyvopau6bvIKdMSNhHvnJ9ZoK8xFb3xSkaD6oSFVhfqMuPAqbrDIFrJ0uIpT0bspa
 /JiXHBZkJI2VWjYX0uw6TwomNbQahUc49L58Q2IEMrEc0EqWZ5O2946Yh6TKZhVT975U
 XoQGxm2O1WV0ma8K2CNWnbCrXGUKpUXn7jWDvZA1816emZlK6iNNwRyygkdqMK2p2Uby
 UKqDRwEiZJP6RLuo+AKwV+twRpDmcKjNdKbF4a9/enfLwPLDeNpdr07xc5Fa4JQySI6C
 9OHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=718UuZmLF0eZqeqQ5Lqai9Kl3qGckeeodY7/EazVofs=;
 b=4ooN209bJsFbj58Nxhmnqx0Da1O8fdd1bGubgsGcdywUBNTMOWRKdxMANA+tfDMvWP
 JurufUtx4V1THsWGOl6nXu0+mXhXOImvbhhNlBA683IWNpO4XqTl5+PyDD1X7j9WCOiE
 1idvNSDc2klDgsz3yJzZzqpw+UA72h4NTOicQ5s46BqQxTbqzg0pHptt2PD7wyztdHBI
 poqWw4gI9LS53rvfJYdVrmR7tUVSzj+v8nRh7jWE/G7X3d9W20KPxBOQPCxqdqyAwDpj
 /wd7G7CghmQRhM2HzLygDo9qHUEcLtmYn0UwMsUHheU+OQcrFfgeIqPVJHKYeYVpHJXx
 0hlQ==
X-Gm-Message-State: ACgBeo2H0q+DwyxnE4I14iTdEuNNtuz7/T4lNZ5hSdMHRwx7mNZV1rTr
 9qpRulg/n1teFQfLrpD9vFc=
X-Google-Smtp-Source: AA6agR7u9OnktfL+kbLeBxjyb2Q7xt5jh+y8oto2oAhYTzPD6yq0WRkwaF7NubRZEjxJELr4MD814g==
X-Received: by 2002:a05:6870:d287:b0:11b:b9e9:33e6 with SMTP id
 d7-20020a056870d28700b0011bb9e933e6mr2218327oae.84.1660853736568; 
 Thu, 18 Aug 2022 13:15:36 -0700 (PDT)
Received: from localhost.localdomain ([186.139.87.175])
 by smtp.gmail.com with ESMTPSA id
 t19-20020a056870e75300b0011c8332922fsm713783oak.29.2022.08.18.13.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 13:15:35 -0700 (PDT)
From: mbarriolinares <mbarriolinares@gmail.com>
To: tiwai@suse.com
Subject: [PATCH] Add quirk to enable Avid Mbox 3 support
Date: Thu, 18 Aug 2022 17:14:33 -0300
Message-Id: <20220818201433.16360-1-mbarriolinares@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220817162727.9646-1-connerknoxpublic@gmail.com>
References: <20220817162727.9646-1-connerknoxpublic@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: mbarriolinares@gmail.com, alsa-devel@alsa-project.org,
 connerknoxpublic@gmail.com
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
:Added some sane defaults for Stereo to work correctly.
:Added comments to specify the complete interface api.
:Cleaned up coding style	

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index f93201a83..06dfdd45c 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -2985,6 +2985,82 @@ YAMAHA_DEVICE(0x7010, "UB99"),
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
+				.data = &(const struct snd_usb_midi_endpoint_info) {
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
index 968d90cae..1d818ee64 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1020,6 +1020,304 @@ static int snd_usb_axefx3_boot_quirk(struct usb_device *dev)
 	return 0;
 }
 
+static void mbox3_setup_48_24_magic(struct usb_device *dev)
+{
+	/* The Mbox 3 is "little endian" */
+	/* max volume is: 0x0000. */
+	/* min volume is: 0x0080 (shown in little endian form) */
+
+
+	/* Load 48000Hz rate into buffer */
+	u8 com_buff[4] = {0x80, 0xbb, 0x00, 0x00};
+
+	/* Set 48000Hz sample rate */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			0x01, 0x21, 0x0100, 0x0001, &com_buff, 4);  //Is this really needed?
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			0x01, 0x21, 0x0100, 0x8101, &com_buff, 4);
+
+	/* Deactivate Tuner */
+	/* on  = 0x01*/
+	/* off = 0x00*/
+	com_buff[0] = 0x00;
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+		0x01, 0x21, 0x0003, 0x2001, &com_buff, 1);
+
+	/* Set clock source to Internal (as opposed to S/PDIF) */
+	com_buff[0] = 0x01;
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0100, 0x8001, &com_buff, 1);
+
+	/* Mute the hardware loopbacks to start the device in a known state. */
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x80;
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
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x00;
+	/* Analogue software return 1 left channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0100, 0x4001, &com_buff, 2);
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x80;
+	/* Analogue software return 1 right channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0101, 0x4001, &com_buff, 2);
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x80;
+	/* Analogue software return 2 left channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0104, 0x4001, &com_buff, 2);
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x00;
+	/* Analogue software return 2 right channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0105, 0x4001, &com_buff, 2);
+
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x80;
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
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x80;
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
+	com_buff[0] = 0x02;
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			3, 0x21, 0x0000, 0x2001, &com_buff, 1);
+
+	/* Do not dim fx returns */
+	com_buff[0] = 0x00;
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			3, 0x21, 0x0002, 0x2001, &com_buff, 1);
+
+	/* Do not set fx returns to mono */
+	com_buff[0] = 0x00;
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			3, 0x21, 0x0001, 0x2001, &com_buff, 1);
+
+	/* Mute the S/PDIF hardware loopback
+	 * same odd volume logic here as above
+	 */
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x80;
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
+
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x00;
+	/* S/PDIF software return 3 left channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x010a, 0x4001, &com_buff, 2);
+
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x80;
+	/* S/PDIF software return 3 right channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x010b, 0x4001, &com_buff, 2);
+	/* S/PDIF software return 4 left channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x010e, 0x4001, &com_buff, 2);
+
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x00;
+	/* S/PDIF software return 4 right channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x010f, 0x4001, &com_buff, 2);
+
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x80;
+	/* S/PDIF fx returns left channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0122, 0x4001, &com_buff, 2);
+	/* S/PDIF fx returns right channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0123, 0x4001, &com_buff, 2);
+
+	/* Set the dropdown "Effect" to the first option */
+	/* Room1  = 0x00 */
+	/* Room2  = 0x01 */
+	/* Room3  = 0x02 */
+	/* Hall 1 = 0x03 */
+	/* Hall 2 = 0x04 */
+	/* Plate  = 0x05 */
+	/* Delay  = 0x06 */
+	/* Echo   = 0x07 */
+	com_buff[0] = 0x00;
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0200, 0x4301, &com_buff, 1);	/* max is 0xff */
+	/* min is 0x00 */
+
+
+	/* Set the effect duration to 0 */
+	/* max is 0xffff */
+	/* min is 0x0000 */
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x00;
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0400, 0x4301, &com_buff, 2);
+
+	/* Set the effect volume and feedback to 0 */
+	/* max is 0xff */
+	/* min is 0x00 */
+	com_buff[0] = 0x00;
+	/* feedback: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0500, 0x4301, &com_buff, 1);
+	/* volume: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0300, 0x4301, &com_buff, 1);
+
+	/* Set soft button hold duration */
+	/* 0x03 = 250ms */
+	/* 0x05 = 500ms DEFAULT */
+	/* 0x08 = 750ms */
+	/* 0x0a = 1sec */
+	com_buff[0] = 0x05;
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			3, 0x21, 0x0005, 0x2001, &com_buff, 1);
+
+	/* Use dim LEDs for button of state */
+	com_buff[0] = 0x00;
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			3, 0x21, 0x0004, 0x2001, &com_buff, 1);
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
 
@@ -1324,6 +1622,10 @@ int snd_usb_apply_boot_quirk(struct usb_device *dev,
 	case USB_ID(0x0dba, 0x3000):
 		/* Digidesign Mbox 2 */
 		return snd_usb_mbox2_boot_quirk(dev);
+	case USB_ID(0x0dba, 0x5000):
+		/* Digidesign Mbox 3 */
+		return snd_usb_mbox3_boot_quirk(dev);
+
 
 	case USB_ID(0x1235, 0x0010): /* Focusrite Novation Saffire 6 USB */
 	case USB_ID(0x1235, 0x0018): /* Focusrite Novation Twitch */
