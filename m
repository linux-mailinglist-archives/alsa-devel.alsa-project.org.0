Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE813CB6525
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Dec 2025 16:24:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 298B86021E;
	Thu, 11 Dec 2025 16:24:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 298B86021E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765466650;
	bh=keYYeR1MnxmZpuLvkiQ7i5LqnuG8/fUDTU3UswaNK1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DfC6+TuMXeOYG+ddwzlS0HQBswancFsGgtXErd/0qbBs0HrvYVBzGiI+XODpDahto
	 tNZmvO/oMn5YQ8KfgTTpRcXa9HlkO9XP3woyZBSSuXFQ8rWekkN1ykZPWMNDYZcCOK
	 hmC72jCwdx0/b2j0SPit8/bAShLhIkJBce4PmdA4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE455F80601; Thu, 11 Dec 2025 16:23:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FB5FF805FB;
	Thu, 11 Dec 2025 16:23:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D608F804CC; Thu, 11 Dec 2025 16:23:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail.sonarnerd.net (rankki.sonarnerd.net [213.186.235.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EA66EF80448
	for <alsa-devel@alsa-project.org>; Thu, 11 Dec 2025 16:23:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA66EF80448
Received: from porkkala.uworld (porkkala.uworld [IPv6:fc00::2])
	by mail.sonarnerd.net (Postfix) with ESMTP id 18BC42311AB;
	Thu, 11 Dec 2025 17:23:05 +0200 (EET)
From: Jussi Laako <jussi@sonarnerd.net>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	Jussi Laako <jussi@sonarnerd.net>
Subject: [PATCH 2/3] ALSA: usb-audio: Reorder USB mode selection quirk
Date: Thu, 11 Dec 2025 17:22:22 +0200
Message-ID: <20251211152224.1780782-2-jussi@sonarnerd.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211152224.1780782-1-jussi@sonarnerd.net>
References: <20251211152224.1780782-1-jussi@sonarnerd.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CLO25XB7DK4FIY7453M5DYHOL6OUUFXO
X-Message-ID-Hash: CLO25XB7DK4FIY7453M5DYHOL6OUUFXO
X-MailFrom: jussi@sonarnerd.net
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CLO25XB7DK4FIY7453M5DYHOL6OUUFXO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When using mode selection quirk, apply the quirk before rate setting.
Also apply this quirk on certain newer ITF interface devices.

Signed-off-by: Jussi Laako <jussi@sonarnerd.net>
---
 sound/usb/endpoint.c | 6 +++---
 sound/usb/quirks.c   | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index cc15624ecaff..8f9313857ee9 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -1481,15 +1481,15 @@ int snd_usb_endpoint_prepare(struct snd_usb_audio *chip,
 			return err;
 	}
 
-	err = snd_usb_init_pitch(chip, ep->cur_audiofmt);
+	err = snd_usb_select_mode_quirk(chip, ep->cur_audiofmt);
 	if (err < 0)
 		return err;
 
-	err = init_sample_rate(chip, ep);
+	err = snd_usb_init_pitch(chip, ep->cur_audiofmt);
 	if (err < 0)
 		return err;
 
-	err = snd_usb_select_mode_quirk(chip, ep->cur_audiofmt);
+	err = init_sample_rate(chip, ep);
 	if (err < 0)
 		return err;
 
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 94a8fdc9c6d3..f38330b095e9 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2221,7 +2221,7 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_IFACE_DELAY),
 	DEVICE_FLG(0x0644, 0x8044, /* Esoteric D-05X */
 		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY |
-		   QUIRK_FLAG_IFACE_DELAY),
+		   QUIRK_FLAG_IFACE_DELAY | QUIRK_FLAG_FORCE_IFACE_RESET),
 	DEVICE_FLG(0x0644, 0x804a, /* TEAC UD-301 */
 		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY |
 		   QUIRK_FLAG_IFACE_DELAY),
@@ -2229,13 +2229,13 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_FORCE_IFACE_RESET),
 	DEVICE_FLG(0x0644, 0x806b, /* TEAC UD-701 */
 		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY |
-		   QUIRK_FLAG_IFACE_DELAY),
+		   QUIRK_FLAG_IFACE_DELAY | QUIRK_FLAG_FORCE_IFACE_RESET),
 	DEVICE_FLG(0x0644, 0x807d, /* TEAC UD-507 */
 		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY |
-		   QUIRK_FLAG_IFACE_DELAY),
+		   QUIRK_FLAG_IFACE_DELAY | QUIRK_FLAG_FORCE_IFACE_RESET),
 	DEVICE_FLG(0x0644, 0x806c, /* Esoteric XD */
 		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY |
-		   QUIRK_FLAG_IFACE_DELAY),
+		   QUIRK_FLAG_IFACE_DELAY | QUIRK_FLAG_FORCE_IFACE_RESET),
 	DEVICE_FLG(0x06f8, 0xb000, /* Hercules DJ Console (Windows Edition) */
 		   QUIRK_FLAG_IGNORE_CTL_ERROR),
 	DEVICE_FLG(0x06f8, 0xd002, /* Hercules DJ Console (Macintosh Edition) */
-- 
2.43.0

