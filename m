Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D646619A90E
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Apr 2020 12:01:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 585761675;
	Wed,  1 Apr 2020 12:00:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 585761675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585735264;
	bh=0KwZv8ThkJ6gb0S1hbFVZWP5HiS8UQ3XLg2YnpIxRyQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tJ1vY+5kwNDSL8OV7AlQixXdqzowI7vmRC9o0j20dK8/eWLicoQwI078Srlk9PIHV
	 0VxZA4OOeiqxsnfmO5sX+c7PsDrjS6PP4E41hkO7D36glOS2CXi405PmG6RyscJySU
	 bnXk0ng3oAxo8eLBAghew7sTLcyg6la1E8pcRdjo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 723F6F8014A;
	Wed,  1 Apr 2020 11:59:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2E60F8014B; Wed,  1 Apr 2020 11:59:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from posta.frantovo.cz (czf.frantovo.cz [91.219.244.97])
 (using TLSv1.1 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCD52F80148
 for <alsa-devel@alsa-project.org>; Wed,  1 Apr 2020 11:59:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCD52F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=frantovo.cz header.i=@frantovo.cz
 header.b="WAIX5FIa"
Received: from posta.frantovo.cz (localhost [127.0.0.1])
 by posta.frantovo.cz (Postfix) with ESMTP id 8F6A61A05AD;
 Wed,  1 Apr 2020 11:56:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=frantovo.cz;
 s=default; t=1585734965;
 bh=0KwZv8ThkJ6gb0S1hbFVZWP5HiS8UQ3XLg2YnpIxRyQ=;
 h=From:To:Subject:Date:In-Reply-To:References;
 b=WAIX5FIapcL06o0dWLMlFkRdMzZclZn4TCMwCL4Pxq1UKtMck6efPbVk40b2uusyT
 5IP+1i2AJ8e3/c6+RF81RDuoTw9aL/DuVsFaEluluneucQH2HJkorOIWcZ+TwIbPgm
 zvuEv/9qmJF8jSnKUTWBgRXHK43Z+hQAdin2n5gw=
From: =?UTF-8?q?Franti=C5=A1ek=20Ku=C4=8Dera?= <konference@frantovo.cz>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 =?UTF-8?q?Franti=C5=A1ek=20Ku=C4=8Dera?= <franta-linux@frantovo.cz>
Subject: [PATCH] ALSA: usb-audio: Add Pioneer DJ DJM-250MK2 quirk
Date: Wed,  1 Apr 2020 11:59:07 +0200
Message-Id: <20200401095907.3387-1-konference@frantovo.cz>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <s5h1rpfihvc.wl-tiwai@suse.de>
References: <s5h1rpfihvc.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.98.1 at posta
X-Virus-Status: Clean
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

From: František Kučera <franta-linux@frantovo.cz>

Pioneer DJ DJM-250MK2 is a mixer that acts like a USB sound card.
The MIDI controller part is standard but the PCM part is "vendor specific".
Output is enabled by this quirk: 8 channels, 48 000 Hz, S24_3LE.
Input is not working.

Signed-off-by: František Kučera <franta-linux@frantovo.cz>
---
 sound/usb/quirks-table.h | 42 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index d187aa6d50db..dcaf9eed9a41 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -3592,5 +3592,47 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
 		}
 	}
 },
+{
+	/*
+	 * Pioneer DJ DJM-250MK2
+	 * PCM is 8 channels out @ 48 fixed (endpoints 0x01).
+	 * The output from computer to the mixer is usable.
+	 *
+	 * The input (phono or line to computer) is not working.
+	 * It should be at endpoint 0x82 and probably also 8 channels,
+	 * but it seems that it works only with Pioneer proprietary software.
+	 * Even on officially supported OS, the Audacity was unable to record
+	 * and Mixxx to recognize the control vinyls.
+	 */
+	USB_DEVICE_VENDOR_SPEC(0x2b73, 0x0017),
+	.driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
+		.ifnum = QUIRK_ANY_INTERFACE,
+		.type = QUIRK_COMPOSITE,
+		.data = (const struct snd_usb_audio_quirk[]) {
+			{
+				.ifnum = 0,
+				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
+				.data = &(const struct audioformat) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 8, // outputs
+					.iface = 0,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x01,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC|
+						USB_ENDPOINT_SYNC_ASYNC,
+					.rates = SNDRV_PCM_RATE_48000,
+					.rate_min = 48000,
+					.rate_max = 48000,
+					.nr_rates = 1,
+					.rate_table = (unsigned int[]) { 48000 }
+				}
+			},
+			{
+				.ifnum = -1
+			}
+		}
+	}
+},
 
 #undef USB_DEVICE_VENDOR_SPEC
-- 
2.20.1

