Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BC4328277
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 16:30:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DF8516A2;
	Mon,  1 Mar 2021 16:29:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DF8516A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614612607;
	bh=8FJa4vvmvrqvDyuEF6Ng/XtOtvOPcfh6zqZXVOOsxls=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CSGMG0AOkrWh55Ab+2sJokK0HEabdyGbjYGSwtIWxoOfzeZl919x+ge8t3pzEzG7E
	 cDWO1uMQsjnUVm6jcoWFGpTvNbl2Lo0qRBLDru2t76elj4MIDOapntth4bfDcOgqHR
	 fxoq9ChiMQh315irsjoKZvATjb8i8QCZ7PlQ7f+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B926AF8026A;
	Mon,  1 Mar 2021 16:28:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEA8CF80275; Mon,  1 Mar 2021 16:28:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98B47F80150
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 16:28:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98B47F80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="o6mU2Ok/"
Received: by mail-wr1-x42f.google.com with SMTP id f12so12780560wrx.8
 for <alsa-devel@alsa-project.org>; Mon, 01 Mar 2021 07:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YS38uimQoHCCCcLQNTPdajepwcpHojM32/chajw1jgw=;
 b=o6mU2Ok/ummMlJHua8kJj+dUHIBpMiiL4oha5tOti0a/IPMIs9AjBrtDGlHcQ6Fxee
 DZmoW1a5Ui8llfakve1V5FNlPyilVNGZ/U4An1b6FP2rnWxFcemjNX8dXgl++rtvaBGV
 yxrmcS8tja0BKzQb8fDOU9mvw/xs5rTeMH+m/szWCyqqkCibmuCD05QcN4F3lOUnJqZk
 76fbLBgAKUmygPiHg2FiF0JabqrYDH98Ri3TnAI7BnKgoNPu3vQhHItJQ8TFx4XSuzkC
 +jVdosor6crYAwhdZ0mh8qAmkQFgkblWGB2OciZNaa4g6DLGELQftaTEeI4/uDEI/yaq
 0S6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YS38uimQoHCCCcLQNTPdajepwcpHojM32/chajw1jgw=;
 b=FAhEVADyipAlVF7n/qwzwS/H38/tK2O9v3hdedEjYc0iJMRzgxG6VJZN8XesCITP0f
 AoCvBvq8pDK0ZeP1IWDR71JgwQvGt9omjL0wPDJ8RwRgAHXsQ+L77W4YfPDbDfM6/KXj
 quXTFvo0RtwrRe54eMV/AUdd+7zWBJ0YsKmUxyYWg8/Irdu7/gNriu/Yn/e1PUypUGAd
 fX5fp8U8oJzIGZ14gamGC1z7zXr7hc12HCSjzQzRDxLjQcHUc5pJLeX3U2PNYx0FRE3V
 DCFPWzUJJ00b2SqbQsbOiQc1wNUfv6SCvNqBbTIohjkWvORLN2Hg5bnPcfJgmsqypf5f
 wH9Q==
X-Gm-Message-State: AOAM532f0FX2GUYehfw+UIaqHC1mbhy4hpoiqo2HteDdw/+YER81S1JN
 bYqrnynpRe35AN0j1wi1pEE=
X-Google-Smtp-Source: ABdhPJxywMgDTlvjFFpyoB3mc93hp0UH/CKFBMw3DpSC8p7X9gskVK0e9aBW9pW0TF7YPT7UwWwajg==
X-Received: by 2002:a5d:4523:: with SMTP id j3mr17866582wra.288.1614612499677; 
 Mon, 01 Mar 2021 07:28:19 -0800 (PST)
Received: from localhost.localdomain (176-171-138-112.abo.bbox.fr.
 [176.171.138.112])
 by smtp.googlemail.com with ESMTPSA id c128sm201771wme.3.2021.03.01.07.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 07:28:19 -0800 (PST)
From: Nicolas MURE <nicolas.mure2019@gmail.com>
To: tiwai@suse.de
Subject: [PATCH v2 1/4] ALSA: usb-audio: Add Pioneer DJM-850 to quirks-table
Date: Mon,  1 Mar 2021 16:27:26 +0100
Message-Id: <20210301152729.18094-2-nicolas.mure2019@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210301152729.18094-1-nicolas.mure2019@gmail.com>
References: <s5hv9abht6w.wl-tiwai@suse.de>
 <20210301152729.18094-1-nicolas.mure2019@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Nicolas MURE <nicolas.mure2019@gmail.com>, alsa-devel@alsa-project.org,
 livvy@base.nu
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

Declare the Pioneer DJM-850 interfaces for capture and playback.

See https://github.com/nm2107/Pioneer-DJM-850-driver-reverse-engineering/blob/172fb9a61055960c88c67b7c416fe5bf3609807b/doc/usb-device-specifications.md
for the complete device spec.

Signed-off-by: Nicolas MURE <nicolas.mure2019@gmail.com>
---
 sound/usb/quirks-table.h | 63 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 1165a5ac60f2..9716a9f7c095 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -3817,6 +3817,69 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
 		}
 	}
 },
+{
+	/*
+	 * Pioneer DJ DJM-850
+	 * 8 channels playback and 8 channels capture @ 44.1/48/96kHz S24LE
+	 * Playback on EP 0x05
+	 * Capture on EP 0x86
+	 */
+	USB_DEVICE_VENDOR_SPEC(0x08e4, 0x0163),
+	.driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
+		.ifnum = QUIRK_ANY_INTERFACE,
+		.type = QUIRK_COMPOSITE,
+		.data = (const struct snd_usb_audio_quirk[]) {
+			{
+				.ifnum = 0,
+				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
+				.data = &(const struct audioformat) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 8,
+					.iface = 0,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x05,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC|
+					    USB_ENDPOINT_SYNC_ASYNC|
+						USB_ENDPOINT_USAGE_DATA,
+					.rates = SNDRV_PCM_RATE_44100|
+						SNDRV_PCM_RATE_48000|
+						SNDRV_PCM_RATE_96000,
+					.rate_min = 44100,
+					.rate_max = 96000,
+					.nr_rates = 3,
+					.rate_table = (unsigned int[]) { 44100, 48000, 96000 }
+				}
+			},
+			{
+				.ifnum = 0,
+				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
+				.data = &(const struct audioformat) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 8,
+					.iface = 0,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x86,
+					.ep_idx = 1,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC|
+						USB_ENDPOINT_SYNC_ASYNC|
+						USB_ENDPOINT_USAGE_DATA,
+					.rates = SNDRV_PCM_RATE_44100|
+						SNDRV_PCM_RATE_48000|
+						SNDRV_PCM_RATE_96000,
+					.rate_min = 44100,
+					.rate_max = 96000,
+					.nr_rates = 3,
+					.rate_table = (unsigned int[]) { 44100, 48000, 96000 }
+				}
+			},
+			{
+				.ifnum = -1
+			}
+		}
+	}
+},
 {
 	/*
 	 * Pioneer DJ DJM-450
-- 
2.29.2

