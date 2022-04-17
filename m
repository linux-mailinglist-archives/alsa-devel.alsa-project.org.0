Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C863F506B90
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 13:57:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59D1E18A2;
	Tue, 19 Apr 2022 13:56:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59D1E18A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650369453;
	bh=j03/hNu6IscpUPbdQ+8Bcs+PiImMb44Izuhbs8FWLKY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tRGMa8fRFPoakKYDb7NlLb4sFANS6VyTpd35dNeCrxW32OeSeb+de1P7yyS0EQwFp
	 UpCMmaA/RayFcnboowBSYVtiCl9yTcfHGthifcOGEZ1UzqdG3MXuFx0pvkP3xGIX5b
	 QuwtezzugkH93O2PNQRKxe94y0qNuS2Fn8jDa+AM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7082F80578;
	Tue, 19 Apr 2022 13:52:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEC9FF80256; Sun, 17 Apr 2022 04:55:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0AE0F80121
 for <alsa-devel@alsa-project.org>; Sun, 17 Apr 2022 04:55:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0AE0F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eC8UJIOG"
Received: by mail-qk1-x72b.google.com with SMTP id q75so495942qke.6
 for <alsa-devel@alsa-project.org>; Sat, 16 Apr 2022 19:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=odnxlpuvUf/6Wu77uSAdJad2VLvjV47EEhSGda1cAn8=;
 b=eC8UJIOGlEI3Ge6l5GKPEv/CwIN/K96KwA1tqCw1IaIw+f/4trsoxZPwrh4ZOuGulJ
 W2n83hYDgdFD99kq+tMcHCdnes1xjq/Kd1FEL/YKu9l4ZydEzRzYZyJ7/djOmP9bVRoI
 1CW5RT2hdKW8nSVzZcZTD1n5zGigSXqZYjC/V2MUSFbrmhTDFlQTG6stAHgMBTISw7Ly
 FICWU9FBz/VrNOnrcxZT3XIYO4MY/dlV8aIDYGC475XwkBOQAlLaOOluZPIZ8F5wJ+A1
 cQ9f7TRCAkrAy1mwG/8ICLYUgWDWyQ2YQpYr4Zmz+sCG3Cklt1mvcrVi5hiVyW+R/VrL
 joJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=odnxlpuvUf/6Wu77uSAdJad2VLvjV47EEhSGda1cAn8=;
 b=6zh3hT3L+U8K7pMEiZe2ErtrAilXIWDLouSiwX3I6i/k8NBpKyNHE0kuZKZrxVE3tV
 csbXIgtcPQO5/20/n6yRvL7rTPmsHk7QUKC/Iyp6tONYF3NGBgY5I7o0gRz0bed5kbo3
 4AOlbPrA5Wm6qKeCRQsPwcd5FaLnpDPIwRv3xVQ9aKY0WhLcCfT+zdh5on7/wCkDV5+t
 Kt6KGAosOLsDlxGBIAjl/d4Aq3FAzc6aoeeeCIZjmGgM0cyLAovHiHc5cLXoGxXVcjoA
 EyGcluBAYTSAmvxQAxB1/Xzy8v9hErJ79WV+Aeji849uB3iXk+0g6HAezKG3TvBrLePd
 hxxg==
X-Gm-Message-State: AOAM532J2LFdbFOp4pL8o2u/XTr4AcvkcrNvn825omj0G50WOHmjYwmk
 DKK4uGwGGVrHzxvdeXVmPVs=
X-Google-Smtp-Source: ABdhPJwI+L1urR2KWHTzS4+dKUF5ZBPFckgnomwkUraqS5tyFbBcZb2YQl0878c/p6EFfPpt4bY0jw==
X-Received: by 2002:a05:620a:2682:b0:67e:1a58:c947 with SMTP id
 c2-20020a05620a268200b0067e1a58c947mr3228586qkp.650.1650164103743; 
 Sat, 16 Apr 2022 19:55:03 -0700 (PDT)
Received: from archlinux.localdomain (cpe-74-140-176-199.cinci.res.rr.com.
 [74.140.176.199]) by smtp.gmail.com with ESMTPSA id
 z8-20020ac87f88000000b002e1cecad0e4sm5505800qtj.33.2022.04.16.19.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Apr 2022 19:55:03 -0700 (PDT)
From: connerknoxpublic@gmail.com
To: perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH] Add quirk to enable Avid Mbox 3 support
Date: Sat, 16 Apr 2022 22:54:59 -0400
Message-Id: <20220417025459.8105-1-connerknoxpublic@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 19 Apr 2022 13:52:23 +0200
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

Hi all,

I believe these are the right emails to send this patch to,
but if I've missed something please let me know.

This patch enables the Avid Mbox 3 audio interface to
be used through ALSA.  It locks the device at a 48khz sample rate.
Then it mutes and raises the appropriate channels/inputs to allow
for expected functionality.

Thanks for your time.

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
2.35.1

