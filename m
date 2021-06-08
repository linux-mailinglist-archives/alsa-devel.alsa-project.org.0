Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBB139EF58
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 09:17:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E527169E;
	Tue,  8 Jun 2021 09:16:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E527169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623136626;
	bh=9/rfF3oy5t25tzeeadiNzUi6OdwYRp+MRWLMAPoyy8I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RpEaKl58qjc7seBBuN3rMAEnYq6XeeSSC9cgvKsTa8n43TAWt/8SqeKrL3DDwdVUM
	 e5jCpJOTptWeyWk4gBg+7L81OSCtXsVrCCO0wj/8UxfJQvWnuhNCQl8Gc9JHu6JluT
	 o0981u6DDV+8VwXWvNv+P4A71NdUC5DrdJEka9/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB214F800FD;
	Tue,  8 Jun 2021 09:15:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24571F80218; Tue,  8 Jun 2021 09:15:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79D0DF8019B
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 09:15:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79D0DF8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=zamaudio-com.20150623.gappssmtp.com
 header.i=@zamaudio-com.20150623.gappssmtp.com header.b="btinIJdd"
Received: by mail-pj1-x102b.google.com with SMTP id ei4so11355199pjb.3
 for <alsa-devel@alsa-project.org>; Tue, 08 Jun 2021 00:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zamaudio-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=/lRfcbLPFqaHtkOnTPj8eJLfQg1xqsT4vM9S9Ii0o6U=;
 b=btinIJddjNiCTWp67dfak0hn7nNFbR94MgkSv5D+HgTMmt2sydvVErwvZnI31hS4wL
 cpxRoKtRjrUHj/Lw1Ih2diuBYQ68CHme9qUOp5HOKM1J2GUfHfaFxtZL3tiq1FgJyulj
 aGuE7QXOgOlPc36aXUz9+V/vDdxeRj9BiV82nGuTUl37ZpQpTJdsLxE6eATOm+aio47E
 m0XGZCPA+sgStJcMhWt+kzFxH1Okg9CGHHEP7O8cPaHhqA8Q4YoHk/qFaqIiUYs7BtD8
 GU0FWSN6WQlC2G8/iqHRDsAJGFd9kUOHolFwD90znRTAeViI3ekNnzv6Q5/bwkW30eof
 dhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/lRfcbLPFqaHtkOnTPj8eJLfQg1xqsT4vM9S9Ii0o6U=;
 b=lofMDE06D66o5Eh5SVIMBkMQBzVQdYUHgxJAN58nTulbLQkMufp+uLhiDqFWRkxMJO
 mvrvhFMqqwxViRfP+wJto3hJI+wjcst2RUr6CwTPly34A6h1cWiVE+oocXv5BD18xD9R
 Kyg8d11qN6RP2wzYenMgS7QOAHv/6dQLHAtXWoc2g8IU2JDMg6EYd58ef2UNRtM5Q3yb
 vZMgc/0u4lE96fXCMf+HzTqIkMMOW8PsXCjhFDWeV8H5r7PWvXQCV9GoGkSZIMMzOl4i
 fpf/4jLnSH1xO7JBbfw0+VWiQOjSqacZZe9feLyBlndlQMOuPSv3CSZ41795yyWwA+wh
 tVQg==
X-Gm-Message-State: AOAM533SdWqGu42oV0dPwqcaxAcoBxaL+5f4nSkYWMmoKXDIPzVsDVIc
 t7ZXzrV0Xne/4oCABrBeUQMqVlc9gKVnWxDY
X-Google-Smtp-Source: ABdhPJyhvH7robp634rKGrfISeBP2fSISG4HDzYPa6UaW+LGVLRA8qKY0Vrm0HHCNTgzFLtaUcrItg==
X-Received: by 2002:a17:90a:c242:: with SMTP id
 d2mr3316895pjx.233.1623136515289; 
 Tue, 08 Jun 2021 00:15:15 -0700 (PDT)
Received: from zamx.lan (119-18-22-20.771216.mel.static.aussiebb.net.
 [119.18.22.20])
 by smtp.gmail.com with ESMTPSA id n9sm1007794pfu.121.2021.06.08.00.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 00:15:14 -0700 (PDT)
From: Damien Zammit <damien@zamaudio.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] usb-audio: Add support for Denon DN-X1600
Date: Tue,  8 Jun 2021 17:15:01 +1000
Message-Id: <20210608071501.580017-1-damien@zamaudio.com>
X-Mailer: git-send-email 2.13.1
Cc: Damien Zammit <damien@zamaudio.com>
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

This patch applies clean to tiwai/sound.git repo on hash
82b954a96c1550bae2cb1f1f4f084425ab237cd7
and was tested on this version.

This provides support for Denon DN-X1600 hardware mixer.

The device itself supports 44100, 48000 and 96000 (Hz)
sample rates, but switching rates via software is currently not working.
Therefore, this patch hardcodes the sample rate to 48000Hz which
enables all 8 channels to function correctly when the correct
sample rate is selected on the hardware itself.

MIDI also tested and works.

Signed-off-by: Damien Zammit <damien@zamaudio.com>
Tested-by: xalmoxis@gmail.com
---
 sound/usb/clock.c        |  7 +++++
 sound/usb/pcm.c          |  4 +++
 sound/usb/quirks-table.h | 70 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 81 insertions(+)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index 0afae839d..52de52288 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -534,6 +534,13 @@ static int set_sample_rate_v2v3(struct snd_usb_audio *chip,
 		 * rate.
 		 */
 		clock = snd_usb_clock_find_source(chip, fmt, false);
+
+		/* Denon DN-X1600 hardcoded
+		 * Sample rate seems to be set on the hardware itself
+		 */
+		if (chip->usb_id == USB_ID(0x154e, 0x500e))
+			return 0;
+
 		if (clock < 0)
 			return clock;
 	}
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index c66831ee1..6913a5b02 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -197,6 +197,10 @@ int snd_usb_init_pitch(struct snd_usb_audio *chip,
 	if (!(fmt->attributes & UAC_EP_CS_ATTR_PITCH_CONTROL))
 		return 0;
 
+	/* Denon DN-X1600 doesn't properly handle this, bail out too */
+	if (chip->usb_id == USB_ID(0x154e, 0x500e))
+		return 0;
+
 	usb_audio_dbg(chip, "enable PITCH for EP 0x%x\n", fmt->endpoint);
 
 	switch (fmt->protocol) {
diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index bdba37d0f..19bb499c1 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -3044,6 +3044,76 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
 	}
 },
 
+/* Denon DN-X1600 */
+{
+	USB_AUDIO_DEVICE(0x154e, 0x500e),
+	.driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
+		.vendor_name = "Denon",
+		.product_name = "DN-X1600",
+		.ifnum = QUIRK_ANY_INTERFACE,
+		.type = QUIRK_COMPOSITE,
+		.data = (const struct snd_usb_audio_quirk[]){
+			{
+				.ifnum = 0,
+				.type = QUIRK_IGNORE_INTERFACE,
+			},
+			{
+				.ifnum = 1,
+				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
+				.data = &(const struct audioformat) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 8,
+					.iface = 1,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.attributes = 0x0,
+					.endpoint = 0x01,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC |
+						USB_ENDPOINT_SYNC_ADAPTIVE,
+					.maxpacksize = 0x138,
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
+				.ifnum = 2,
+				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
+				.data = &(const struct audioformat) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 8,
+					.iface = 2,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.attributes = 0x0,
+					.endpoint = 0x85,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC |
+						USB_ENDPOINT_SYNC_ADAPTIVE,
+					.maxpacksize = 0x138,
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
+				.type = QUIRK_MIDI_STANDARD_INTERFACE,
+			},
+			{
+				.ifnum = -1
+			}
+		}
+	}
+},
+
 /* Microsoft XboxLive Headset/Xbox Communicator */
 {
 	USB_DEVICE(0x045e, 0x0283),
-- 
2.13.1

