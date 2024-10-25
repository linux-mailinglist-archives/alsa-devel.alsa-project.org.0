Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8939B36E4
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2024 17:43:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72CDBE9D;
	Mon, 28 Oct 2024 17:43:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72CDBE9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730133799;
	bh=h3/6WNJULuCDWWmqhkPYWT98/j54MNM91apAcFvYTF0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MUCD2Po4M0DWH5mV9Vz4fjjAxxs473GchNwjtAZzTy7asUkhwyho4CkQUjLuER8Vn
	 AyQNV3gI9tMCl2AfvjQ9G3l59t9P//I+A2w9xZA866MKkxo9qMFeEnDO8SJ7IAmPQG
	 hBpQErWpNDRkmP3OjJmsV8B5bWUFQdTB7lYUsUhU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F9A3F805E4; Mon, 28 Oct 2024 17:42:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 95804F805C9;
	Mon, 28 Oct 2024 17:42:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 167CAF8016C; Fri, 25 Oct 2024 18:41:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E91C9F80104
	for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2024 18:41:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E91C9F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=srd.tw header.i=@srd.tw header.a=rsa-sha256
 header.s=google header.b=gMKXlWhW
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-37d4ac91d97so1745529f8f.2
        for <alsa-devel@alsa-project.org>;
 Fri, 25 Oct 2024 09:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=srd.tw; s=google; t=1729874495; x=1730479295; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tQJsc34/coxKjY6oHA3SPeWVflJbsHFw/+GsqUm0IIg=;
        b=gMKXlWhWxkkqJ2Zwo6Vo24QXQiwfBlaXgeVZjbFKMtZrhjBk/gwxgIrvkPa47dM0lH
         L9hY/IB9FTAscae5o3WRYcBiesUeK3xIKBqECg/q8l4KShalMg/Qj9jcsyezRtw5n6qy
         d/K/SmFxQs52efUlLuKuKsWXMHOb88DKJqIKHlfJdekqnoiAIjS5f5uUad7id0gRjtyK
         Vpg4iDkemCrQ7u8P0NIZsuveJXuEk2MbHb97WA9jcf4Gaoz8gDjw1oaAPEB+OcUjy8LT
         ZZtaq7VML5CjTaEOQHOwsYaTj0fMvRJ2FIlVjTpPQZ9CPNkIC1/FAODM6PT34Aa+AEKR
         60+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729874495; x=1730479295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tQJsc34/coxKjY6oHA3SPeWVflJbsHFw/+GsqUm0IIg=;
        b=rRvpdC79RpNbe5CDZdl+HJ2gbS1A/led0Jf2B255NPPbWBgYK33ehaZdy2img0mLb9
         MyyO7Zw1e3aoHga7xN7LZVAMHwiTkpPHLLWbXwQRgl1WFVQKbKo4Jgp3HXdw5yYiu4Fk
         hGbpHqJUXAxfTTS2BwkMGhCGgX0gKbZLL0h3ZW3zECFgQu+xuE5KuvgQUIfLBy7Uu4M4
         jqd5elctBnpJ5CHTO01IOK4ZjZyrXtl3ChcOEAUC5nw4FPmkYOzTXlFkZy3QP8LUifUP
         K4RP04evXsrVBi8mbp6TA+91+msLq0RlTXZNiOB1OVukDdz8OSs8QsHh5h7IbHxBdE+5
         ZtvA==
X-Gm-Message-State: AOJu0Yxkzxu6tBQE/NK4SBr4HmQ5Fy9q5m+o3IUfG/B+all52xCPlXE3
	yFXeInpuzxT2+eWraFHKvznuOA1sA0XX3CXV+yCEiOitTMJeBveF7YXGD/Oayhkaww49uwA2jQ/
	SlWY=
X-Google-Smtp-Source: 
 AGHT+IGpZTlTjMLUofP9zcggIWULB/HXFgjIhMIbGhhAEglYeqE9W5Wh5hbib0p7xosW80/IFSKveQ==
X-Received: by 2002:a5d:6b8d:0:b0:37d:4c40:699 with SMTP id
 ffacd0b85a97d-38061141816mr60448f8f.5.1729874494375;
        Fri, 25 Oct 2024 09:41:34 -0700 (PDT)
Received: from ip-172-26-0-221.eu-central-1.compute.internal
 ([2a05:d014:902:9b00:faf1:b017:13c5:9d60])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b92958sm1931922f8f.106.2024.10.25.09.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 09:41:34 -0700 (PDT)
From: Sarah Grant <s@srd.tw>
To: alsa-devel@alsa-project.org
Cc: Sarah Grant <s@srd.tw>,
	Olivia Mackintosh <livvy@base.nu>
Subject: [PATCH] ALSA: usb-audio: Add Pioneer DJ/AlphaTheta DJM-A9 Mixer
Date: Fri, 25 Oct 2024 16:39:28 +0000
Message-Id: <20241025163927.12662-1-s@srd.tw>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: s@srd.tw
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MU75DZXPEWB6I2Y24UYOHFFCJG3BYZHW
X-Message-ID-Hash: MU75DZXPEWB6I2Y24UYOHFFCJG3BYZHW
X-Mailman-Approved-At: Mon, 28 Oct 2024 16:42:30 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MU75DZXPEWB6I2Y24UYOHFFCJG3BYZHW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This also includes a change to the capture level as they differ with
this device, as well as additional values for prefader channels.

Acked-by: Olivia Mackintosh <livvy@base.nu>
Signed-off-by: Sarah Grant <s@srd.tw>
---
 sound/usb/mixer_quirks.c | 68 +++++++++++++++++++++++++++++++++++++---
 sound/usb/quirks-table.h | 57 +++++++++++++++++++++++++++++++++
 2 files changed, 121 insertions(+), 4 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 2a9594f34dac..15c300eddf53 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -3498,7 +3498,7 @@ static int snd_rme_digiface_controls_create(struct usb_mixer_interface *mixer)
 }
 
 /*
- * Pioneer DJ DJM Mixers
+ * Pioneer DJ / AlphaTheta DJM Mixers
  *
  * These devices generally have options for soft-switching the playback and
  * capture sources in addition to the recording level. Although different
@@ -3515,17 +3515,23 @@ static int snd_rme_digiface_controls_create(struct usb_mixer_interface *mixer)
 #define SND_DJM_CAP_CDLINE	0x01
 #define SND_DJM_CAP_DIGITAL	0x02
 #define SND_DJM_CAP_PHONO	0x03
+#define SND_DJM_CAP_PREFADER	0x05
 #define SND_DJM_CAP_PFADER	0x06
 #define SND_DJM_CAP_XFADERA	0x07
 #define SND_DJM_CAP_XFADERB	0x08
 #define SND_DJM_CAP_MIC		0x09
 #define SND_DJM_CAP_AUX		0x0d
 #define SND_DJM_CAP_RECOUT	0x0a
+#define SND_DJM_CAP_RECOUT_NOMIC	0x0e
 #define SND_DJM_CAP_NONE	0x0f
 #define SND_DJM_CAP_CH1PFADER	0x11
 #define SND_DJM_CAP_CH2PFADER	0x12
 #define SND_DJM_CAP_CH3PFADER	0x13
 #define SND_DJM_CAP_CH4PFADER	0x14
+#define SND_DJM_CAP_CH1PREFADER	0x31
+#define SND_DJM_CAP_CH2PREFADER	0x32
+#define SND_DJM_CAP_CH3PREFADER	0x33
+#define SND_DJM_CAP_CH4PREFADER	0x34
 
 // Playback types
 #define SND_DJM_PB_CH1		0x00
@@ -3551,6 +3557,7 @@ static int snd_rme_digiface_controls_create(struct usb_mixer_interface *mixer)
 #define SND_DJM_900NXS2_IDX	0x3
 #define SND_DJM_750MK2_IDX	0x4
 #define SND_DJM_450_IDX		0x5
+#define SND_DJM_A9_IDX		0x6
 
 
 #define SND_DJM_CTL(_name, suffix, _default_value, _windex) { \
@@ -3579,7 +3586,7 @@ struct snd_djm_ctl {
 	u16 wIndex;
 };
 
-static const char *snd_djm_get_label_caplevel(u16 wvalue)
+static const char *snd_djm_get_label_caplevel_common(u16 wvalue)
 {
 	switch (wvalue) {
 	case 0x0000:	return "-19dB";
@@ -3590,6 +3597,20 @@ static const char *snd_djm_get_label_caplevel(u16 wvalue)
 	}
 };
 
+// The DJM-A9 has different capture levels than other, older models
+static const char *snd_djm_get_label_caplevel_a9(u16 wvalue)
+{
+	switch (wvalue) {
+	case 0x0000:	return "+15dB";
+	case 0x0100:	return "+12dB";
+	case 0x0200:	return "+9dB";
+	case 0x0300:	return "+6dB";
+	case 0x0400:	return "+3dB";
+	case 0x0500:	return "0dB";
+	default:	return NULL;
+	}
+};
+
 static const char *snd_djm_get_label_cap_common(u16 wvalue)
 {
 	switch (wvalue & 0x00ff) {
@@ -3602,8 +3623,13 @@ static const char *snd_djm_get_label_cap_common(u16 wvalue)
 	case SND_DJM_CAP_XFADERB:	return "Cross Fader B";
 	case SND_DJM_CAP_MIC:		return "Mic";
 	case SND_DJM_CAP_RECOUT:	return "Rec Out";
+	case SND_DJM_CAP_RECOUT_NOMIC:	return "Rec Out without Mic";
 	case SND_DJM_CAP_AUX:		return "Aux";
 	case SND_DJM_CAP_NONE:		return "None";
+	case SND_DJM_CAP_CH1PREFADER:	return "Pre Fader Ch1";
+	case SND_DJM_CAP_CH2PREFADER:	return "Pre Fader Ch2";
+	case SND_DJM_CAP_CH3PREFADER:	return "Pre Fader Ch3";
+	case SND_DJM_CAP_CH4PREFADER:	return "Pre Fader Ch4";
 	case SND_DJM_CAP_CH1PFADER:	return "Post Fader Ch1";
 	case SND_DJM_CAP_CH2PFADER:	return "Post Fader Ch2";
 	case SND_DJM_CAP_CH3PFADER:	return "Post Fader Ch3";
@@ -3623,6 +3649,14 @@ static const char *snd_djm_get_label_cap_850(u16 wvalue)
 	}
 };
 
+static const char *snd_djm_get_label_caplevel(u8 device_idx, u16 wvalue)
+{
+	switch (device_idx) {
+	case SND_DJM_A9_IDX:		return snd_djm_get_label_caplevel_a9(wvalue);
+	default:			return snd_djm_get_label_caplevel_common(wvalue);
+	}
+};
+
 static const char *snd_djm_get_label_cap(u8 device_idx, u16 wvalue)
 {
 	switch (device_idx) {
@@ -3644,7 +3678,7 @@ static const char *snd_djm_get_label_pb(u16 wvalue)
 static const char *snd_djm_get_label(u8 device_idx, u16 wvalue, u16 windex)
 {
 	switch (windex) {
-	case SND_DJM_WINDEX_CAPLVL:	return snd_djm_get_label_caplevel(wvalue);
+	case SND_DJM_WINDEX_CAPLVL:	return snd_djm_get_label_caplevel(device_idx, wvalue);
 	case SND_DJM_WINDEX_CAP:	return snd_djm_get_label_cap(device_idx, wvalue);
 	case SND_DJM_WINDEX_PB:		return snd_djm_get_label_pb(wvalue);
 	default:			return NULL;
@@ -3653,7 +3687,7 @@ static const char *snd_djm_get_label(u8 device_idx, u16 wvalue, u16 windex)
 
 // common DJM capture level option values
 static const u16 snd_djm_opts_cap_level[] = {
-	0x0000, 0x0100, 0x0200, 0x0300 };
+	0x0000, 0x0100, 0x0200, 0x0300, 0x400, 0x500 };
 
 
 // DJM-250MK2
@@ -3795,6 +3829,28 @@ static const struct snd_djm_ctl snd_djm_ctls_750mk2[] = {
 };
 
 
+// DJM-A9
+static const u16 snd_djm_opts_a9_cap1[] = {
+	0x0107, 0x0108, 0x0109, 0x010a, 0x010e,
+	0x111, 0x112, 0x113, 0x114, 0x0131, 0x132, 0x133, 0x134 };
+static const u16 snd_djm_opts_a9_cap2[] = {
+	0x0201, 0x0202, 0x0203, 0x0205, 0x0206, 0x0207, 0x0208, 0x0209, 0x020a, 0x020e };
+static const u16 snd_djm_opts_a9_cap3[] = {
+	0x0301, 0x0302, 0x0303, 0x0305, 0x0306, 0x0307, 0x0308, 0x0309, 0x030a, 0x030e };
+static const u16 snd_djm_opts_a9_cap4[] = {
+	0x0401, 0x0402, 0x0403, 0x0405, 0x0406, 0x0407, 0x0408, 0x0409, 0x040a, 0x040e };
+static const u16 snd_djm_opts_a9_cap5[] = {
+	0x0501, 0x0502, 0x0503, 0x0505, 0x0506, 0x0507, 0x0508, 0x0509, 0x050a, 0x050e };
+
+static const struct snd_djm_ctl snd_djm_ctls_a9[] = {
+	SND_DJM_CTL("Capture Level", cap_level, 0, SND_DJM_WINDEX_CAPLVL),
+	SND_DJM_CTL("Master Input",  a9_cap1, 3, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Ch1 Input",     a9_cap2, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Ch2 Input",     a9_cap3, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Ch3 Input",     a9_cap4, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Ch4 Input",     a9_cap5, 2, SND_DJM_WINDEX_CAP)
+};
+
 static const struct snd_djm_device snd_djm_devices[] = {
 	[SND_DJM_250MK2_IDX] = SND_DJM_DEVICE(250mk2),
 	[SND_DJM_750_IDX] = SND_DJM_DEVICE(750),
@@ -3802,6 +3858,7 @@ static const struct snd_djm_device snd_djm_devices[] = {
 	[SND_DJM_900NXS2_IDX] = SND_DJM_DEVICE(900nxs2),
 	[SND_DJM_750MK2_IDX] = SND_DJM_DEVICE(750mk2),
 	[SND_DJM_450_IDX] = SND_DJM_DEVICE(450),
+	[SND_DJM_A9_IDX] = SND_DJM_DEVICE(a9),
 };
 
 
@@ -4076,6 +4133,9 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 	case USB_ID(0x2b73, 0x000a): /* Pioneer DJ DJM-900NXS2 */
 		err = snd_djm_controls_create(mixer, SND_DJM_900NXS2_IDX);
 		break;
+	case USB_ID(0x2b73, 0x003c): /* Pioneer DJ / AlphaTheta DJM-A9 */
+		err = snd_djm_controls_create(mixer, SND_DJM_A9_IDX);
+		break;
 	}
 
 	return err;
diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 24c981c9b240..b758655b948c 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -3119,6 +3119,63 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 	}
 },
 
+{
+	/*
+	 * Pioneer DJ / AlphaTheta DJM-A9
+	 * 10 channels playback & 12 channels capture @ 44.1/48/96kHz S24LE
+	 */
+	USB_DEVICE_VENDOR_SPEC(0x2b73, 0x003c),
+	QUIRK_DRIVER_INFO {
+		QUIRK_DATA_COMPOSITE {
+			{
+				QUIRK_DATA_AUDIOFORMAT(0) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 10,
+					.iface = 0,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x01,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC|
+					    USB_ENDPOINT_SYNC_ASYNC,
+					.rates = SNDRV_PCM_RATE_44100|
+					    SNDRV_PCM_RATE_48000|
+					    SNDRV_PCM_RATE_96000,
+					.rate_min = 44100,
+					.rate_max = 96000,
+					.nr_rates = 3,
+					.rate_table = (unsigned int[]) {
+						44100, 48000, 96000
+					}
+				}
+			},
+			{
+				QUIRK_DATA_AUDIOFORMAT(0) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 12,
+					.iface = 0,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x82,
+					.ep_idx = 1,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC|
+					    USB_ENDPOINT_SYNC_ASYNC|
+					    USB_ENDPOINT_USAGE_IMPLICIT_FB,
+					.rates = SNDRV_PCM_RATE_44100|
+					    SNDRV_PCM_RATE_48000|
+					    SNDRV_PCM_RATE_96000,
+					.rate_min = 44100,
+					.rate_max = 96000,
+					.nr_rates = 3,
+					.rate_table = (unsigned int[]) {
+						44100, 48000, 96000
+					}
+				}
+			},
+			QUIRK_COMPOSITE_END
+		}
+	}
+},
+
 /*
  * MacroSilicon MS2100/MS2106 based AV capture cards
  *
-- 
2.40.1

