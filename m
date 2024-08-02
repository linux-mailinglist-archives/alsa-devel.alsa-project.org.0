Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23365945F5D
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2024 16:27:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65C053561;
	Fri,  2 Aug 2024 16:26:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65C053561
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722608804;
	bh=VpWJZnLb0Ux1KgLoHdxZJw13IVarAY8jIPzPvxD6Q78=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZRG1OGS8OZTyB4qj6eso7OaVXLAnQtufqkIaZPh2S2zKNTUQAVxLf0H3ltJCojtQy
	 Addot81ej1XpFyL2BubIqxGQX2GmZxyq4UT/PLMn2L3/fTfDlpQP/okwR317+Zje/5
	 8fGOvN0/81oSkRAus3Rb2sSmP39zRjI/kU3ahqjQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47072F805AE; Fri,  2 Aug 2024 16:26:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B8BBF805AE;
	Fri,  2 Aug 2024 16:26:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93C90F80269; Fri,  2 Aug 2024 16:26:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2CAD0F800B0
	for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2024 16:26:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CAD0F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=O50+dWdE
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2f15dd0b489so12531291fa.3
        for <alsa-devel@alsa-project.org>;
 Fri, 02 Aug 2024 07:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722608770; x=1723213570;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=umc11d2ln4LRUnc2S+ADp4YKmC5FbUyg1v5HI46WNZI=;
        b=O50+dWdEKZmyF330qSbyLe97n6tF3dJdbjjyWLPknWgp8Cy0WIF3mOyApTReyUUYnp
         cYcZEkTMnyqFOuOkp1/v84dMYuaVQGq3LI1H7v/ytorWm8ojt7CcIt6UlCWmbsjzME6r
         eEBniaohSE99fXa/oDCEvGfWza4MpX2mNZ8sTYsHkJG8lULhVbYfwrU55smhbYsNaOsL
         fpbguYptKEE/Gkw8dySNAjhiHeZhXo/Upgduwa8RBnEUxTcPD8MDhl9pDz+IQRlnrzCq
         tDk/5D92R5c7fl0MomoH4Q8SwGZbpQN1rkt8FtUny+ZWNa57qPcWIvd1sveithUXzGZl
         9Gpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722608770; x=1723213570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=umc11d2ln4LRUnc2S+ADp4YKmC5FbUyg1v5HI46WNZI=;
        b=LknHT2ULCfbsNUfrE7KwjhCPLIbxvWzm3sEyiBL/1izXtgGN7eHTNkMcX/+ubtxG2U
         LrBGx96wEC/6VkiYN/fqu6ZTmpRLVnQEwMFzFfLquMbi2Xj+U5a3V7GsgCOXcdv9OMig
         G4bz0F1eIwg4RQ/U+XZVQMmahHER/ORKAwc4pfBzMYGvLWS1QFICce5x1C8DoJNYp0y5
         pU6QFnFkVesw0DNxx2AILQPi1b3JxHqqJgOOx2UnGj9lTErAIz7fBjgWtTW6B7P7DMjf
         +f9bC8sV95BK1CYc4fsn30y2bTdBvKFvCWKH8/Ga/XI6WBGyNMW/nWA3rQmbk1NYXomc
         0gjA==
X-Gm-Message-State: AOJu0YwMNH/BGOfWlLsnsvcuIq9J03XVdjW54BggBXPtrM2iquldvenJ
	mIVGGcGrQBoueo7p8qJQlMP8IeYUbZeXsM1hKUwBEwuCzifj8bB58yb8qzHm
X-Google-Smtp-Source: 
 AGHT+IEjHkrd9/lQCEfWZVIMpHLDh1X+aAG4eN4oVB77YjbRYk8EEoRObmDZ3pvq6EZPyha6QevdBg==
X-Received: by 2002:a2e:979a:0:b0:2ee:84af:dfc4 with SMTP id
 38308e7fff4ca-2f15ab27c9dmr23233021fa.43.1722608769908;
        Fri, 02 Aug 2024 07:26:09 -0700 (PDT)
Received: from stefan-ms7d75.lan (84-217-106-36.customers.ownit.se.
 [84.217.106.36])
        by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f15e25e2cfsm1630221fa.101.2024.08.02.07.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 07:26:09 -0700 (PDT)
From: Stefan Stistrup <sstistrup@gmail.com>
To: alsa-devel@alsa-project.org
Cc: Stefan Stistrup <sstistrup@gmail.com>
Subject: [PATCH] ALSA: usb-audio: Add input gain and master output mixer
 controls for RME Babyface Pro
Date: Fri,  2 Aug 2024 16:24:39 +0200
Message-ID: <20240802142439.2823864-1-sstistrup@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OS2UYGQ7HMRXP2446CF4QYH5IRZAJ323
X-Message-ID-Hash: OS2UYGQ7HMRXP2446CF4QYH5IRZAJ323
X-MailFrom: sstistrup@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OS2UYGQ7HMRXP2446CF4QYH5IRZAJ323/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add missing input gain and master output mixer controls for RME Babyface Pro

This patch implements:

1. Input gain controls for 2 mic and 2 line inputs
2. Master output volume controls for all 12 output channels

These additions allow for more complete control of the Babyface Pro under Linux.

Signed-off-by: Stefan Stistrup <sstistrup@gmail.com>
---
 sound/usb/mixer_quirks.c | 162 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 161 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 065a4be0d771..26298e06b838 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -2541,14 +2541,23 @@ enum {
 #define SND_BBFPRO_CTL_REG2_PAD_AN1 4
 #define SND_BBFPRO_CTL_REG2_PAD_AN2 5
 
-#define SND_BBFPRO_MIXER_IDX_MASK 0x1ff
+#define SND_BBFPRO_MIXER_MAIN_OUT_CH_OFFSET 992
+#define SND_BBFPRO_MIXER_IDX_MASK 0x3ff
 #define SND_BBFPRO_MIXER_VAL_MASK 0x3ffff
 #define SND_BBFPRO_MIXER_VAL_SHIFT 9
 #define SND_BBFPRO_MIXER_VAL_MIN 0 // -inf
 #define SND_BBFPRO_MIXER_VAL_MAX 65536 // +6dB
 
+#define SND_BBFPRO_GAIN_CHANNEL_MASK 0x03
+#define SND_BBFPRO_GAIN_CHANNEL_SHIFT 7
+#define SND_BBFPRO_GAIN_VAL_MASK 0x7f
+#define SND_BBFPRO_GAIN_VAL_MIN 0
+#define SND_BBFPRO_GAIN_VAL_MIC_MAX 65
+#define SND_BBFPRO_GAIN_VAL_LINE_MAX 18 // 9db in 0.5db incraments
+
 #define SND_BBFPRO_USBREQ_CTL_REG1 0x10
 #define SND_BBFPRO_USBREQ_CTL_REG2 0x17
+#define SND_BBFPRO_USBREQ_GAIN 0x1a
 #define SND_BBFPRO_USBREQ_MIXER 0x12
 
 static int snd_bbfpro_ctl_update(struct usb_mixer_interface *mixer, u8 reg,
@@ -2695,6 +2704,113 @@ static int snd_bbfpro_ctl_resume(struct usb_mixer_elem_list *list)
 	return snd_bbfpro_ctl_update(list->mixer, reg, idx, value);
 }
 
+static int snd_bbfpro_gain_update(struct usb_mixer_interface *mixer,
+				  u8 channel, u8 gain)
+{
+	int err;
+
+	struct snd_usb_audio *chip = mixer->chip;
+
+	if (channel < 2) {
+		// XLR preamp: 3-bit fine, 5-bit coarse; special case >60
+		if (gain < 60)
+			gain = ((gain % 3) << 5) | (gain / 3);
+		else
+			gain = ((gain % 6) << 5) | (60 / 3);
+	}
+
+	err = snd_usb_lock_shutdown(chip);
+	if (err < 0)
+		return err;
+
+	err = snd_usb_ctl_msg(chip->dev,
+				usb_sndctrlpipe(chip->dev, 0),
+				SND_BBFPRO_USBREQ_GAIN,
+				USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
+				gain, channel, NULL, 0);
+
+	snd_usb_unlock_shutdown(chip);
+	return err;
+}
+
+static int snd_bbfpro_gain_get(struct snd_kcontrol *kcontrol,
+                               struct snd_ctl_elem_value *ucontrol)
+{
+	int value = kcontrol->private_value & SND_BBFPRO_GAIN_VAL_MASK;
+	ucontrol->value.integer.value[0] = value;
+	return 0;
+}
+
+static int snd_bbfpro_gain_info(struct snd_kcontrol *kcontrol,
+                                struct snd_ctl_elem_info *uinfo)
+{
+	int pv, channel;
+
+	pv = kcontrol->private_value;
+	channel = (pv >> SND_BBFPRO_GAIN_CHANNEL_SHIFT) &
+		  SND_BBFPRO_GAIN_CHANNEL_MASK;
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = SND_BBFPRO_GAIN_VAL_MIN;
+
+	if (channel < 2) {
+		uinfo->value.integer.max = SND_BBFPRO_GAIN_VAL_MIC_MAX;
+	} else {
+		uinfo->value.integer.max = SND_BBFPRO_GAIN_VAL_LINE_MAX;
+	}
+
+	return 0;
+}
+
+static int snd_bbfpro_gain_put(struct snd_kcontrol *kcontrol,
+                               struct snd_ctl_elem_value *ucontrol)
+{
+	int pv, channel, old_value, value, err;
+
+	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kcontrol);
+	struct usb_mixer_interface *mixer = list->mixer;
+
+	pv = kcontrol->private_value;
+	channel = (pv >> SND_BBFPRO_GAIN_CHANNEL_SHIFT) &
+		  SND_BBFPRO_GAIN_CHANNEL_MASK;
+	old_value = pv & SND_BBFPRO_GAIN_VAL_MASK;
+	value = ucontrol->value.integer.value[0];
+
+	if (channel < 2) {
+		if (value > SND_BBFPRO_GAIN_VAL_MIC_MAX)
+			return -EINVAL;
+	} else {
+		if (value > SND_BBFPRO_GAIN_VAL_LINE_MAX)
+			return -EINVAL;
+	}
+
+	if (value == old_value)
+		return 0;
+
+	err = snd_bbfpro_gain_update(mixer, channel, value);
+	if (err < 0)
+		return err;
+
+	kcontrol->private_value =
+		  (channel << SND_BBFPRO_GAIN_CHANNEL_SHIFT) | value;
+	return 1;
+}
+
+static int snd_bbfpro_gain_resume(struct usb_mixer_elem_list *list)
+{
+	int pv, channel, value;
+
+	struct snd_kcontrol *kctl = list->kctl;
+
+	pv = kctl->private_value;
+	channel = (pv >> SND_BBFPRO_GAIN_CHANNEL_SHIFT) &
+		  SND_BBFPRO_GAIN_CHANNEL_MASK;
+	value = pv & SND_BBFPRO_GAIN_VAL_MASK;
+
+	return snd_bbfpro_gain_update(list->mixer, channel, value);
+}
+
 static int snd_bbfpro_vol_update(struct usb_mixer_interface *mixer, u16 index,
 				 u32 value)
 {
@@ -2790,6 +2906,15 @@ static const struct snd_kcontrol_new snd_bbfpro_ctl_control = {
 	.put = snd_bbfpro_ctl_put
 };
 
+static const struct snd_kcontrol_new snd_bbfpro_gain_control = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+	.index = 0,
+	.info = snd_bbfpro_gain_info,
+	.get = snd_bbfpro_gain_get,
+	.put = snd_bbfpro_gain_put
+};
+
 static const struct snd_kcontrol_new snd_bbfpro_vol_control = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
@@ -2813,6 +2938,18 @@ static int snd_bbfpro_ctl_add(struct usb_mixer_interface *mixer, u8 reg,
 		&knew, NULL);
 }
 
+static int snd_bbfpro_gain_add(struct usb_mixer_interface *mixer, u8 channel,
+                               char *name)
+{
+	struct snd_kcontrol_new knew = snd_bbfpro_gain_control;
+
+	knew.name = name;
+	knew.private_value = channel << SND_BBFPRO_GAIN_CHANNEL_SHIFT;
+
+	return add_single_ctl_with_resume(mixer, 0, snd_bbfpro_gain_resume,
+		&knew, NULL);
+}
+
 static int snd_bbfpro_vol_add(struct usb_mixer_interface *mixer, u16 index,
 			      char *name)
 {
@@ -2860,6 +2997,29 @@ static int snd_bbfpro_controls_create(struct usb_mixer_interface *mixer)
 		}
 	}
 
+	// Main out volume
+	for (i = 0 ; i < 12 ; ++i) {
+		snprintf(name, sizeof(name), "Main-Out %s", output[i]);
+		// Main outs are offset to 992
+		err = snd_bbfpro_vol_add(mixer,
+					 i + SND_BBFPRO_MIXER_MAIN_OUT_CH_OFFSET,
+					 name);
+		if (err < 0)
+			return err;
+	}
+
+	// Input gain
+	for (i = 0 ; i < 4 ; ++i) {
+		if (i < 2) {
+			snprintf(name, sizeof(name), "Mic-%s Gain", input[i]);
+		} else {
+			snprintf(name, sizeof(name), "Line-%s Gain", input[i]);
+		}
+		err = snd_bbfpro_gain_add(mixer, i, name);
+		if (err < 0)
+			return err;
+	}
+
 	// Control Reg 1
 	err = snd_bbfpro_ctl_add(mixer, SND_BBFPRO_CTL_REG1,
 				 SND_BBFPRO_CTL_REG1_CLK_OPTICAL,
-- 
2.45.2

