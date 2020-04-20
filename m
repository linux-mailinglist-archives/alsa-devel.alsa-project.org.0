Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 197CE1B1891
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 23:42:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 998BF168D;
	Mon, 20 Apr 2020 23:41:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 998BF168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587418956;
	bh=m3zQMNvZ0W/ULailByyxE4Z/YL4wmH8uNsBRmIksKC4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=leQZEsOMAlDWtPv83njlZGztetlAbZFGnP6T9xiZDp9+iYBjfUuuxNSrxEsEV/r9T
	 5eN2xylHITOp9d2HeUxCJg5Zn3PyQLxaVVOfnnmfa12eG+/51L4sDyMDFpWygR7o8S
	 aybWPfvv9hQ1SUBRdxwrXSolSyvMPbCvnZ/4f1/c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE645F800C8;
	Mon, 20 Apr 2020 23:40:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 376A8F801D9; Mon, 20 Apr 2020 23:40:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7219F800E7
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 23:40:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7219F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="d631R2gw"
Received: by mail-wm1-x32e.google.com with SMTP id x25so1251483wmc.0
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 14:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4Gk/VYoQhPhQ7TbUJt9ppu0wX7IwMr6mSq4U87B4Pb4=;
 b=d631R2gwMehAjcbsqcBoh4S2uRZcvSYuoWemely5PVflzq3Ass3LCUsCfgkdWtgc9F
 TU/kozgTBVtlrpNUHjbEOMTrNAys+iW5pwg54cxSGmSkx/hQoOTACufZ8014modkhsZE
 SXC0MGzMeMwozpMkt0xhoyZg1FPP+/p8xWJpo6ypBnSUFdq3eOLAVzqFeHBi/RJetGwZ
 vCwyNvDg/FV4RHIrXnfaI06i5hbbyjuKfUKtND4vvWgvqIBd8sl4yQM1SC/T6rjpPUDn
 GCaa3YJg5naB5dXMMlfzIsuxz3oBLhV45iKht+np77NGxU/ZR1zIqJ1CdkwI8C4BgCCn
 M9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4Gk/VYoQhPhQ7TbUJt9ppu0wX7IwMr6mSq4U87B4Pb4=;
 b=oSk8/jT0KqYuOaebUE+xtpxhTgepXmMqGOVXau0e0IVilcT8b2VcqJaQ0LD+vdQn4V
 Nxe6EA9AKZarzD37PZO98tyu+bTiABZglqJ6V35J0Hw1Z0YtbwntK40Y+ayOCjsLhuEc
 YHozEOf7ImSufZi2sUel7BkyRZhssuxhAGJjD3mRsP7sVx0h5/9ZabSIgLXlvWSi/mh7
 vVDSnkAcpvUO0PWb39D6ocd+///0zSLj3ashTSSSnuR4z5r9MmjOkjvzJC6CamnZ9dob
 GzfSja+G0kMNBKURJxIV6gKv+tVTTmuqRQoNPNJzuL0xfYHUz9h9wWqe9XnpwaCMifEc
 SouQ==
X-Gm-Message-State: AGi0PuYyUroxehvMO5k0D4frySL67dc8uLtWrrpoz4NIhXHvABj6mWxE
 MntmmQqEDuKGSBgXzEORpt4=
X-Google-Smtp-Source: APiQypLvpyyDBqeAgz8buD5OJjsPdNQop2mMLHkzAHCjiqgN9PjtiPL4xXegCiReIbsQ8ECaZ/lF/A==
X-Received: by 2002:a7b:cf27:: with SMTP id m7mr1466022wmg.183.1587418847498; 
 Mon, 20 Apr 2020 14:40:47 -0700 (PDT)
Received: from localhost.localdomain ([91.221.170.230])
 by smtp.googlemail.com with ESMTPSA id q17sm755380wmj.45.2020.04.20.14.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 14:40:46 -0700 (PDT)
From: Gregor Pintar <grpintar@gmail.com>
To: tiwai@suse.com,
	perex@perex.cz,
	alexander@tsoy.me
Subject: [PATCH v2] ALSA: usb-audio: Add quirk for Focusrite Scarlett 2i2
Date: Mon, 20 Apr 2020 23:40:30 +0200
Message-Id: <20200420214030.2361-1-grpintar@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1c4b8a362761421eba0ded60bb4f0e11b7e42f3b.camel@tsoy.me>
References: <1c4b8a362761421eba0ded60bb4f0e11b7e42f3b.camel@tsoy.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: grpintar@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

Force it to use asynchronous playback.

Same quirk has already been added for Focusrite Scarlett Solo (2nd gen)
with a commit 46f5710f0b88 ("ALSA: usb-audio: Add quirk for Focusrite
Scarlett Solo").

This also seems to prevent regular clicks when playing at 44100Hz
on Scarlett 2i2 (2nd gen). I did not notice any side effects.

Moved both quirks to snd_usb_audioformat_attributes_quirk() as suggested.

Signed-off-by: Gregor Pintar <grpintar@gmail.com>
---
 sound/usb/quirks-table.h | 84 ----------------------------------------
 sound/usb/quirks.c       | 13 +++++++
 2 files changed, 13 insertions(+), 84 deletions(-)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index e009d584e..7e06ab108 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -2756,90 +2756,6 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 		.type = QUIRK_MIDI_NOVATION
 	}
 },
-{
-	/*
-	 * Focusrite Scarlett Solo 2nd generation
-	 * Reports that playback should use Synch: Synchronous
-	 * while still providing a feedback endpoint. Synchronous causes
-	 * snapping on some sample rates.
-	 * Force it to use Synch: Asynchronous.
-	 */
-	USB_DEVICE(0x1235, 0x8205),
-	.driver_info = (unsigned long) & (const struct snd_usb_audio_quirk) {
-		.ifnum = QUIRK_ANY_INTERFACE,
-		.type = QUIRK_COMPOSITE,
-		.data = (const struct snd_usb_audio_quirk[]) {
-			{
-				.ifnum = 1,
-				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
-				.data = & (const struct audioformat) {
-					.formats = SNDRV_PCM_FMTBIT_S32_LE,
-					.channels = 2,
-					.iface = 1,
-					.altsetting = 1,
-					.altset_idx = 1,
-					.attributes = 0,
-					.endpoint = 0x01,
-					.ep_attr = USB_ENDPOINT_XFER_ISOC |
-						   USB_ENDPOINT_SYNC_ASYNC,
-					.protocol = UAC_VERSION_2,
-					.rates = SNDRV_PCM_RATE_44100 |
-						 SNDRV_PCM_RATE_48000 |
-						 SNDRV_PCM_RATE_88200 |
-						 SNDRV_PCM_RATE_96000 |
-						 SNDRV_PCM_RATE_176400 |
-						 SNDRV_PCM_RATE_192000,
-					.rate_min = 44100,
-					.rate_max = 192000,
-					.nr_rates = 6,
-					.rate_table = (unsigned int[]) {
-						44100, 48000, 88200,
-						96000, 176400, 192000
-					},
-					.clock = 41
-				}
-			},
-			{
-				.ifnum = 2,
-				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
-				.data = & (const struct audioformat) {
-					.formats = SNDRV_PCM_FMTBIT_S32_LE,
-					.channels = 2,
-					.iface = 2,
-					.altsetting = 1,
-					.altset_idx = 1,
-					.attributes = 0,
-					.endpoint = 0x82,
-					.ep_attr = USB_ENDPOINT_XFER_ISOC |
-						   USB_ENDPOINT_SYNC_ASYNC |
-						   USB_ENDPOINT_USAGE_IMPLICIT_FB,
-					.protocol = UAC_VERSION_2,
-					.rates = SNDRV_PCM_RATE_44100 |
-						 SNDRV_PCM_RATE_48000 |
-						 SNDRV_PCM_RATE_88200 |
-						 SNDRV_PCM_RATE_96000 |
-						 SNDRV_PCM_RATE_176400 |
-						 SNDRV_PCM_RATE_192000,
-					.rate_min = 44100,
-					.rate_max = 192000,
-					.nr_rates = 6,
-					.rate_table = (unsigned int[]) {
-						44100, 48000, 88200,
-						96000, 176400, 192000
-					},
-					.clock = 41
-				}
-			},
-			{
-				.ifnum = 3,
-				.type = QUIRK_IGNORE_INTERFACE
-			},
-			{
-				.ifnum = -1
-			}
-		}
-	}
-},
 
 /* Access Music devices */
 {
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index a8ece1701..6c2dfd3bf 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1806,6 +1806,19 @@ void snd_usb_audioformat_attributes_quirk(struct snd_usb_audio *chip,
 		 */
 		fp->attributes &= ~UAC_EP_CS_ATTR_FILL_MAX;
 		break;
+	case USB_ID(0x1235, 0x8202):  /* Focusrite Scarlett 2i2 2nd gen */
+	case USB_ID(0x1235, 0x8205):  /* Focusrite Scarlett Solo 2nd gen */
+		/*
+		 * Reports that playback should use Synch: Synchronous
+		 * while still providing a feedback endpoint.
+		 * Synchronous causes snapping on some sample rates.
+		 * Force it to use Synch: Asynchronous.
+		 */
+		if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			fp->ep_attr &= ~USB_ENDPOINT_SYNCTYPE;
+			fp->ep_attr |= USB_ENDPOINT_SYNC_ASYNC;
+		}
+		break;
 	}
 }
 
-- 
2.20.1

