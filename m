Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C124BCB651C
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Dec 2025 16:23:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B0AD60223;
	Thu, 11 Dec 2025 16:23:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B0AD60223
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765466632;
	bh=C3g2YvKDg5tg+ywQXd+NzlidADF/xrhW3zDa7SWjoWQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kZMuq7Pgmx/eHamliAH7etmbO/fuNC8fcB8LfPgya8bIghqbnVw2EGHVPxjaqIQXM
	 hs4qQ1gkc3jn1qwoTCGOyCcP7vZLkdQGxWr7Q9HX4lPuh4hrBp4erYXP86YEjTLQZn
	 i8I8ypv5h76l+LMxVE76g9K9+RLIGm9q/VmddDaA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0466F805E1; Thu, 11 Dec 2025 16:23:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EF11F805D6;
	Thu, 11 Dec 2025 16:23:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D4E9F804CC; Thu, 11 Dec 2025 16:23:02 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2DD4CF80448
	for <alsa-devel@alsa-project.org>; Thu, 11 Dec 2025 16:22:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DD4CF80448
Received: from porkkala.uworld (porkkala.uworld [IPv6:fc00::2])
	by mail.sonarnerd.net (Postfix) with ESMTP id 4EC8E2311AB;
	Thu, 11 Dec 2025 17:22:58 +0200 (EET)
From: Jussi Laako <jussi@sonarnerd.net>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	Jussi Laako <jussi@sonarnerd.net>
Subject: [PATCH 1/3] ALSA: usb-audio: Update for native DSD support quirks
Date: Thu, 11 Dec 2025 17:22:21 +0200
Message-ID: <20251211152224.1780782-1-jussi@sonarnerd.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: F7AA5TB34DIG37OCDRRLB6TNVP3G6FQE
X-Message-ID-Hash: F7AA5TB34DIG37OCDRRLB6TNVP3G6FQE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F7AA5TB34DIG37OCDRRLB6TNVP3G6FQE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Maintenance patch for native DSD support.

Add set of missing device and vendor quirks; TEAC, Esoteric, Luxman and
Musical Fidelity.

Signed-off-by: Jussi Laako <jussi@sonarnerd.net>
---
 sound/usb/quirks.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 61bd61ffb1b2..94a8fdc9c6d3 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2230,6 +2230,12 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 	DEVICE_FLG(0x0644, 0x806b, /* TEAC UD-701 */
 		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY |
 		   QUIRK_FLAG_IFACE_DELAY),
+	DEVICE_FLG(0x0644, 0x807d, /* TEAC UD-507 */
+		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY |
+		   QUIRK_FLAG_IFACE_DELAY),
+	DEVICE_FLG(0x0644, 0x806c, /* Esoteric XD */
+		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY |
+		   QUIRK_FLAG_IFACE_DELAY),
 	DEVICE_FLG(0x06f8, 0xb000, /* Hercules DJ Console (Windows Edition) */
 		   QUIRK_FLAG_IGNORE_CTL_ERROR),
 	DEVICE_FLG(0x06f8, 0xd002, /* Hercules DJ Console (Macintosh Edition) */
@@ -2388,6 +2394,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_CTL_MSG_DELAY_1M),
 	DEVICE_FLG(0x30be, 0x0101, /* Schiit Hel */
 		   QUIRK_FLAG_IGNORE_CTL_ERROR),
+	DEVICE_FLG(0x3255, 0x0000, /* Luxman D-10X */
+		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
 	DEVICE_FLG(0x339b, 0x3a07, /* Synaptics HONOR USB-C HEADSET */
 		   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
 	DEVICE_FLG(0x413c, 0xa506, /* Dell AE515 sound bar */
@@ -2431,6 +2439,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_DSD_RAW),
 	VENDOR_FLG(0x2622, /* IAG Limited devices */
 		   QUIRK_FLAG_DSD_RAW),
+	VENDOR_FLG(0x2772, /* Musical Fidelity devices */
+		   QUIRK_FLAG_DSD_RAW),
 	VENDOR_FLG(0x278b, /* Rotel? */
 		   QUIRK_FLAG_DSD_RAW),
 	VENDOR_FLG(0x292b, /* Gustard/Ess based devices */
-- 
2.43.0

