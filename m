Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47ACE20CC21
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 05:27:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E79AD1663;
	Mon, 29 Jun 2020 05:27:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E79AD1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593401279;
	bh=e9TbCgOGwdYpaKAt94f6iRj6ewZZj82rFMEn08ED7mc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nVpZkhAlbY/dAzSqczgMcJPgA0Apo9YWXiN1Ye5S8pgu0jS4dQNZAXAGNIIiDV1s7
	 C6SmIaN7k/YfF6F1Lw0Y8Zt7qktJ9WTfYYmpHbQbZs7bTz5SYA6ZG9qPMr8NxPuccS
	 nNFZacu6Yvg4ef9NSa99NQnhOEtGbN1e7f3i8d+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FBF2F80217;
	Mon, 29 Jun 2020 05:26:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49CCCF8020C; Mon, 29 Jun 2020 05:26:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B137F800BA
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 05:26:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B137F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="QRkLrI3N"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h1fHnlBkhyeNGtpz+GN9TY+JTEc9OEglx3baMBRPrUI=; b=QRkLrI3NHI15iFPJZkw/DuTiD7
 vYnRQqHBaaKl2eNAt/8i4vd0uYbJia+Vrbk2L9UqFTv36UCFZ5Zl3z7HTxnbhQSwRQ7aWvwY34ui2
 ztwX41azgZOOup2gnPIl97QftguHD/uqMlcjKHQDOelHha3tcXDcbjie+ztniaa6WwS4=;
Received: from [2a00:1370:8125:614e:c510:d933:d0ef:dfce]
 (helo=home.puleglot.ru)
 by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93.0.4) (envelope-from <puleglot@puleglot.ru>)
 id 1jpkQr-000qpA-0E; Mon, 29 Jun 2020 06:26:09 +0300
From: Alexander Tsoy <alexander@tsoy.me>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Fix some typos
Date: Mon, 29 Jun 2020 06:26:07 +0300
Message-Id: <20200629032607.255419-1-alexander@tsoy.me>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>
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

Fix the following typos in comments and in the code:
 - KHz -> kHz
 - procssed -> processed

Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
---
 sound/usb/mixer_s1810c.c        |  6 +++---
 sound/usb/mixer_scarlett_gen2.c |  4 ++--
 sound/usb/pcm.c                 |  4 ++--
 sound/usb/quirks.c              | 14 +++++++-------
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/usb/mixer_s1810c.c b/sound/usb/mixer_s1810c.c
index 6483e47bafd0..c53a9773f310 100644
--- a/sound/usb/mixer_s1810c.c
+++ b/sound/usb/mixer_s1810c.c
@@ -554,11 +554,11 @@ int snd_sc1810_init_mixer(struct usb_mixer_interface *mixer)
 	dev_info(&dev->dev,
 		 "Presonus Studio 1810c, device_setup: %u\n", chip->setup);
 	if (chip->setup == 1)
-		dev_info(&dev->dev, "(8out/18in @ 48KHz)\n");
+		dev_info(&dev->dev, "(8out/18in @ 48kHz)\n");
 	else if (chip->setup == 2)
-		dev_info(&dev->dev, "(6out/8in @ 192KHz)\n");
+		dev_info(&dev->dev, "(6out/8in @ 192kHz)\n");
 	else
-		dev_info(&dev->dev, "(8out/14in @ 96KHz)\n");
+		dev_info(&dev->dev, "(8out/14in @ 96kHz)\n");
 
 	ret = snd_s1810c_init_mixer_maps(chip);
 	if (ret < 0)
diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 74c00c905d24..0ffff7640892 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -332,7 +332,7 @@ static const struct scarlett2_device_info s18i8_gen2_info = {
 		},
 		[SCARLETT2_PORT_TYPE_SPDIF] = {
 			.id = 0x180,
-			/* S/PDIF outputs aren't available at 192KHz
+			/* S/PDIF outputs aren't available at 192kHz
 			 * but are included in the USB mux I/O
 			 * assignment message anyway
 			 */
@@ -401,7 +401,7 @@ static const struct scarlett2_device_info s18i20_gen2_info = {
 			.dst_descr = "Analogue Output %02d Playback"
 		},
 		[SCARLETT2_PORT_TYPE_SPDIF] = {
-			/* S/PDIF outputs aren't available at 192KHz
+			/* S/PDIF outputs aren't available at 192kHz
 			 * but are included in the USB mux I/O
 			 * assignment message anyway
 			 */
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index a777d36c4f5a..e42241087b77 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -1694,8 +1694,8 @@ static void retire_playback_urb(struct snd_usb_substream *subs,
 	int processed = urb->transfer_buffer_length / ep->stride;
 	int est_delay;
 
-	/* ignore the delay accounting when procssed=0 is given, i.e.
-	 * silent payloads are procssed before handling the actual data
+	/* ignore the delay accounting when processed=0 is given, i.e.
+	 * silent payloads are processed before handling the actual data
 	 */
 	if (!processed)
 		return;
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index fca72730a802..c551141f337e 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1144,14 +1144,14 @@ static int snd_usb_motu_m_series_boot_quirk(struct usb_device *dev)
 #define MAUDIO_SET		0x01 /* parse device_setup */
 #define MAUDIO_SET_COMPATIBLE	0x80 /* use only "win-compatible" interfaces */
 #define MAUDIO_SET_DTS		0x02 /* enable DTS Digital Output */
-#define MAUDIO_SET_96K		0x04 /* 48-96KHz rate if set, 8-48KHz otherwise */
+#define MAUDIO_SET_96K		0x04 /* 48-96kHz rate if set, 8-48kHz otherwise */
 #define MAUDIO_SET_24B		0x08 /* 24bits sample if set, 16bits otherwise */
 #define MAUDIO_SET_DI		0x10 /* enable Digital Input */
 #define MAUDIO_SET_MASK		0x1f /* bit mask for setup value */
-#define MAUDIO_SET_24B_48K_DI	 0x19 /* 24bits+48KHz+Digital Input */
-#define MAUDIO_SET_24B_48K_NOTDI 0x09 /* 24bits+48KHz+No Digital Input */
-#define MAUDIO_SET_16B_48K_DI	 0x11 /* 16bits+48KHz+Digital Input */
-#define MAUDIO_SET_16B_48K_NOTDI 0x01 /* 16bits+48KHz+No Digital Input */
+#define MAUDIO_SET_24B_48K_DI	 0x19 /* 24bits+48kHz+Digital Input */
+#define MAUDIO_SET_24B_48K_NOTDI 0x09 /* 24bits+48kHz+No Digital Input */
+#define MAUDIO_SET_16B_48K_DI	 0x11 /* 16bits+48kHz+Digital Input */
+#define MAUDIO_SET_16B_48K_NOTDI 0x01 /* 16bits+48kHz+No Digital Input */
 
 static int quattro_skip_setting_quirk(struct snd_usb_audio *chip,
 				      int iface, int altno)
@@ -1597,7 +1597,7 @@ void snd_usb_endpoint_start_quirk(struct snd_usb_endpoint *ep)
 
 	/*
 	 * M-Audio Fast Track C400/C600 - when packets are not skipped, real
-	 * world latency varies by approx. +/- 50 frames (at 96KHz) each time
+	 * world latency varies by approx. +/- 50 frames (at 96kHz) each time
 	 * the stream is (re)started. When skipping packets 16 at endpoint
 	 * start up, the real world latency is stable within +/- 1 frame (also
 	 * across power cycles).
@@ -1839,7 +1839,7 @@ void snd_usb_audioformat_attributes_quirk(struct snd_usb_audio *chip,
 		/*
 		 * MaxPacketsOnly attribute is erroneously set in endpoint
 		 * descriptors. As a result this card produces noise with
-		 * all sample rates other than 96 KHz.
+		 * all sample rates other than 96 kHz.
 		 */
 		fp->attributes &= ~UAC_EP_CS_ATTR_FILL_MAX;
 		break;
-- 
2.26.2

