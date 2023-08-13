Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C2777A8B3
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Aug 2023 18:05:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B181C82A;
	Sun, 13 Aug 2023 18:04:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B181C82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691942716;
	bh=Wq4MQjJfnOqrdXJlfgVVogR5YrU7wvx5LT8sz5Vekkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WLu3q64AU8tx1IQpy18XCjRxQg3Dxz6D+nTPlk28HcRyiRtTJBgXtZtPWYxRhZ4Lo
	 foxokBnTqnP963SymgBMsw3fofmJpPqsFO2eeUfmI9jRX3U+kPMOpkthupNp4S5el4
	 akdq5gfqQv+2iJShUHE1jLgOX9R04HBYQWL6S+jc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0951F80557; Sun, 13 Aug 2023 18:04:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CF9BF80016;
	Sun, 13 Aug 2023 18:04:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90395F80290; Sun, 13 Aug 2023 18:04:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3EE58F801EB
	for <alsa-devel@alsa-project.org>; Sun, 13 Aug 2023 18:04:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EE58F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=a6Wnd8ei
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 25A4E6369F;
	Sun, 13 Aug 2023 16:04:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C43C433BC;
	Sun, 13 Aug 2023 16:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691942639;
	bh=Wq4MQjJfnOqrdXJlfgVVogR5YrU7wvx5LT8sz5Vekkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a6Wnd8eiKP81vKA9MI637lPUifBB5FfFa1qzdmhPVigNi7+3d4keN6QY4swgainZG
	 o3ED37u9hN0WlmdY7mq+vVwZaSIja43NYPa7YvejE5hlm7mi0RZDL3Znfvv9tgiTok
	 n4ylVDQAOfuQmm0EmnWzQIWSRf8rUVCG8DUErJNWVTe6cbIlgXdUT5dJqeDY2bSARb
	 Km5r9vW2sK3hVWbKDVkxKlJwbMijAZCw6qpvrBFl3QkZZbYZEDqrPU8keCP43mb1LV
	 6eA8zyNkz/e4gsUs5InyYKZ/JQhkjqE9uKElDVcGLc09C4L6/4wyubb8PZ0IejhEyW
	 SSP9cq+cNfQ7A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jussi Laako <jussi@sonarnerd.net>,
	Takashi Iwai <tiwai@suse.de>,
	Sasha Levin <sashal@kernel.org>,
	perex@perex.cz,
	tiwai@suse.com,
	aichao@kylinos.cn,
	connerknoxpublic@gmail.com,
	john@keeping.me.uk,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.1 44/47] ALSA: usb-audio: Update for native DSD
 support quirks
Date: Sun, 13 Aug 2023 11:59:39 -0400
Message-Id: <20230813160006.1073695-44-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230813160006.1073695-1-sashal@kernel.org>
References: <20230813160006.1073695-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.45
Content-Transfer-Encoding: 8bit
Message-ID-Hash: P3GJ6FHBEZGMKMIQOFQZWFSGPWZNBMHS
X-Message-ID-Hash: P3GJ6FHBEZGMKMIQOFQZWFSGPWZNBMHS
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P3GJ6FHBEZGMKMIQOFQZWFSGPWZNBMHS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Jussi Laako <jussi@sonarnerd.net>

[ Upstream commit f7fea075edfa085c25eb34c44ceacf3602537f98 ]

Maintenance patch for native DSD support.

Remove incorrect T+A device quirks. Move set of device quirks to vendor
quirks. Add set of missing device and vendor quirks.

Signed-off-by: Jussi Laako <jussi@sonarnerd.net>
Link: https://lore.kernel.org/r/20230726165645.404311-1-jussi@sonarnerd.net
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/quirks.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index d4a7ffef82194..4667d543f7481 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1874,8 +1874,10 @@ u64 snd_usb_interface_dsd_format_quirks(struct snd_usb_audio *chip,
 
 	/* XMOS based USB DACs */
 	switch (chip->usb_id) {
-	case USB_ID(0x1511, 0x0037): /* AURALiC VEGA */
-	case USB_ID(0x21ed, 0xd75a): /* Accuphase DAC-60 option card */
+	case USB_ID(0x139f, 0x5504): /* Nagra DAC */
+	case USB_ID(0x20b1, 0x3089): /* Mola-Mola DAC */
+	case USB_ID(0x2522, 0x0007): /* LH Labs Geek Out 1V5 */
+	case USB_ID(0x2522, 0x0009): /* LH Labs Geek Pulse X Inifinity 2V0 */
 	case USB_ID(0x2522, 0x0012): /* LH Labs VI DAC Infinity */
 	case USB_ID(0x2772, 0x0230): /* Pro-Ject Pre Box S2 Digital */
 		if (fp->altsetting == 2)
@@ -1885,14 +1887,18 @@ u64 snd_usb_interface_dsd_format_quirks(struct snd_usb_audio *chip,
 	case USB_ID(0x0d8c, 0x0316): /* Hegel HD12 DSD */
 	case USB_ID(0x10cb, 0x0103): /* The Bit Opus #3; with fp->dsd_raw */
 	case USB_ID(0x16d0, 0x06b2): /* NuPrime DAC-10 */
-	case USB_ID(0x16d0, 0x09dd): /* Encore mDSD */
+	case USB_ID(0x16d0, 0x06b4): /* NuPrime Audio HD-AVP/AVA */
 	case USB_ID(0x16d0, 0x0733): /* Furutech ADL Stratos */
+	case USB_ID(0x16d0, 0x09d8): /* NuPrime IDA-8 */
 	case USB_ID(0x16d0, 0x09db): /* NuPrime Audio DAC-9 */
+	case USB_ID(0x16d0, 0x09dd): /* Encore mDSD */
 	case USB_ID(0x1db5, 0x0003): /* Bryston BDA3 */
+	case USB_ID(0x20a0, 0x4143): /* WaveIO USB Audio 2.0 */
 	case USB_ID(0x22e1, 0xca01): /* HDTA Serenade DSD */
 	case USB_ID(0x249c, 0x9326): /* M2Tech Young MkIII */
 	case USB_ID(0x2616, 0x0106): /* PS Audio NuWave DAC */
 	case USB_ID(0x2622, 0x0041): /* Audiolab M-DAC+ */
+	case USB_ID(0x278b, 0x5100): /* Rotel RC-1590 */
 	case USB_ID(0x27f7, 0x3002): /* W4S DAC-2v2SE */
 	case USB_ID(0x29a2, 0x0086): /* Mutec MC3+ USB */
 	case USB_ID(0x6b42, 0x0042): /* MSB Technology */
@@ -1902,9 +1908,6 @@ u64 snd_usb_interface_dsd_format_quirks(struct snd_usb_audio *chip,
 
 	/* Amanero Combo384 USB based DACs with native DSD support */
 	case USB_ID(0x16d0, 0x071a):  /* Amanero - Combo384 */
-	case USB_ID(0x2ab6, 0x0004):  /* T+A DAC8DSD-V2.0, MP1000E-V2.0, MP2000R-V2.0, MP2500R-V2.0, MP3100HV-V2.0 */
-	case USB_ID(0x2ab6, 0x0005):  /* T+A USB HD Audio 1 */
-	case USB_ID(0x2ab6, 0x0006):  /* T+A USB HD Audio 2 */
 		if (fp->altsetting == 2) {
 			switch (le16_to_cpu(chip->dev->descriptor.bcdDevice)) {
 			case 0x199:
@@ -2049,6 +2052,9 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_IFACE_DELAY),
 	DEVICE_FLG(0x0644, 0x805f, /* TEAC Model 12 */
 		   QUIRK_FLAG_FORCE_IFACE_RESET),
+	DEVICE_FLG(0x0644, 0x806b, /* TEAC UD-701 */
+		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY |
+		   QUIRK_FLAG_IFACE_DELAY),
 	DEVICE_FLG(0x06f8, 0xb000, /* Hercules DJ Console (Windows Edition) */
 		   QUIRK_FLAG_IGNORE_CTL_ERROR),
 	DEVICE_FLG(0x06f8, 0xd002, /* Hercules DJ Console (Macintosh Edition) */
@@ -2087,6 +2093,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
 	DEVICE_FLG(0x154e, 0x3006, /* Marantz SA-14S1 */
 		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
+	DEVICE_FLG(0x154e, 0x300b, /* Marantz SA-KI RUBY / SA-12 */
+		   QUIRK_FLAG_DSD_RAW),
 	DEVICE_FLG(0x154e, 0x500e, /* Denon DN-X1600 */
 		   QUIRK_FLAG_IGNORE_CLOCK_SOURCE),
 	DEVICE_FLG(0x1686, 0x00dd, /* Zoom R16/24 */
@@ -2131,6 +2139,10 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x21b4, 0x0081, /* AudioQuest DragonFly */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x21b4, 0x0230, /* Ayre QB-9 Twenty */
+		   QUIRK_FLAG_DSD_RAW),
+	DEVICE_FLG(0x21b4, 0x0232, /* Ayre QX-5 Twenty */
+		   QUIRK_FLAG_DSD_RAW),
 	DEVICE_FLG(0x2522, 0x0007, /* LH Labs Geek Out HD Audio 1V5 */
 		   QUIRK_FLAG_SET_IFACE_FIRST),
 	DEVICE_FLG(0x2708, 0x0002, /* Audient iD14 */
@@ -2173,12 +2185,18 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_VALIDATE_RATES),
 	VENDOR_FLG(0x1235, /* Focusrite Novation */
 		   QUIRK_FLAG_VALIDATE_RATES),
+	VENDOR_FLG(0x1511, /* AURALiC */
+		   QUIRK_FLAG_DSD_RAW),
 	VENDOR_FLG(0x152a, /* Thesycon devices */
 		   QUIRK_FLAG_DSD_RAW),
+	VENDOR_FLG(0x18d1, /* iBasso devices */
+		   QUIRK_FLAG_DSD_RAW),
 	VENDOR_FLG(0x1de7, /* Phoenix Audio */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	VENDOR_FLG(0x20b1, /* XMOS based devices */
 		   QUIRK_FLAG_DSD_RAW),
+	VENDOR_FLG(0x21ed, /* Accuphase Laboratory */
+		   QUIRK_FLAG_DSD_RAW),
 	VENDOR_FLG(0x22d9, /* Oppo */
 		   QUIRK_FLAG_DSD_RAW),
 	VENDOR_FLG(0x23ba, /* Playback Design */
@@ -2194,10 +2212,14 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_DSD_RAW),
 	VENDOR_FLG(0x2ab6, /* T+A devices */
 		   QUIRK_FLAG_DSD_RAW),
+	VENDOR_FLG(0x2d87, /* Cayin device */
+		   QUIRK_FLAG_DSD_RAW),
 	VENDOR_FLG(0x3336, /* HEM devices */
 		   QUIRK_FLAG_DSD_RAW),
 	VENDOR_FLG(0x3353, /* Khadas devices */
 		   QUIRK_FLAG_DSD_RAW),
+	VENDOR_FLG(0x35f4, /* MSB Technology */
+		   QUIRK_FLAG_DSD_RAW),
 	VENDOR_FLG(0x3842, /* EVGA */
 		   QUIRK_FLAG_DSD_RAW),
 	VENDOR_FLG(0xc502, /* HiBy devices */
-- 
2.40.1

