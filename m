Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB86E6C146C
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 15:11:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19A591E8;
	Mon, 20 Mar 2023 15:10:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19A591E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679321465;
	bh=7m2MTe9GimP6CHi65IgJBkJpGAd2SX5Abq+RNG26NIw=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XErHIawInzPUjQYeRbTZr+e5lYk3CDqBK+q8DGU+q8Yrd+8pWoJzB4K2KYhgoiggT
	 9xelKYjxeeClwFXVNgPCVC1MEHkgabq8z/w7FmCRqNuusQvZixn9ysQR6GJDMpO2F/
	 ytw7B664o0FD8WqaOCKx60YXJzCna7Ib5uhQfyTw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FAABF80254;
	Mon, 20 Mar 2023 15:10:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A872F8027B; Mon, 20 Mar 2023 15:10:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 953C8F80093
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 15:10:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 953C8F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=kwWWPTV4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=WUTmSSl/
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2084021AD5;
	Mon, 20 Mar 2023 14:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1679321401;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=0FwovXto7QjIvRuSXr2FmdO7LaufHk3IeKCrMrSPXMU=;
	b=kwWWPTV4aCGJXAp3cy5cjiyzypAOangwstA6JCl1JEQDrjkWkwJYJ4hHEmJtcpe/WxJTxg
	jhhWzITv9kCoqlj/k+9OunlnBTYK1zgsxH86KrQ8hRy4jaZxOPZid5dhW2pgebADXIqeoS
	wi1HaOZ8C9j6ATv/yNED4zG3nwQFSQg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1679321401;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=0FwovXto7QjIvRuSXr2FmdO7LaufHk3IeKCrMrSPXMU=;
	b=WUTmSSl/toHIlklI2iDbyNV2c0k4xPicxqzaAZi9Kp2NkNus2z/ooYlhNJ4FNXLeZK1iE0
	VFa36hQAFvEwFABg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0154A13416;
	Mon, 20 Mar 2023 14:10:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id DfZLOzhpGGQVGQAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 20 Mar 2023 14:10:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/conexant: Partial revert of a quirk for Lenovo
Date: Mon, 20 Mar 2023 15:09:54 +0100
Message-Id: <20230320140954.31154-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GPS7ZBEICG6C765BZY2UPQ44DA3XBKQK
X-Message-ID-Hash: GPS7ZBEICG6C765BZY2UPQ44DA3XBKQK
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Jetro Jormalainen <jje-lxkl@jetro.fi>, Meng Tang <tangmeng@uniontech.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GPS7ZBEICG6C765BZY2UPQ44DA3XBKQK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The recent commit f83bb2592482 ("ALSA: hda/conexant: Add quirk for
LENOVO 20149 Notebook model") introduced a quirk for the device with
17aa:3977, but this caused a regression on another model (Lenovo
Ideadpad U31) with the very same PCI SSID.  And, through skimming over
the net, it seems that this PCI SSID is used for multiple different
models, so it's no good idea to apply the quirk with the SSID.

Although we may take a different ID check (e.g. the codec SSID instead
of the PCI SSID), unfortunately, the original patch author couldn't
identify the hardware details any longer as the machine was returned,
and we can't develop the further proper fix.

In this patch, instead, we partially revert the change so that the
quirk won't be applied as default for addressing the regression.
Meanwhile, the quirk function itself is kept, and it's now made to be
applicable via the explicit model=lenovo-20149 option.

Fixes: f83bb2592482 ("ALSA: hda/conexant: Add quirk for LENOVO 20149 Notebook model")
Reported-by: Jetro Jormalainen <jje-lxkl@jetro.fi>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/20230308215009.4d3e58a6@mopti
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_conexant.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index 75e1d00074b9..a889cccdd607 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -980,7 +980,10 @@ static const struct snd_pci_quirk cxt5066_fixups[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3905, "Lenovo G50-30", CXT_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK(0x17aa, 0x390b, "Lenovo G50-80", CXT_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK(0x17aa, 0x3975, "Lenovo U300s", CXT_FIXUP_STEREO_DMIC),
-	SND_PCI_QUIRK(0x17aa, 0x3977, "Lenovo IdeaPad U310", CXT_PINCFG_LENOVO_NOTEBOOK),
+	/* NOTE: we'd need to extend the quirk for 17aa:3977 as the same
+	 * PCI SSID is used on multiple Lenovo models
+	 */
+	SND_PCI_QUIRK(0x17aa, 0x3977, "Lenovo IdeaPad U310", CXT_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK(0x17aa, 0x3978, "Lenovo G50-70", CXT_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK(0x17aa, 0x397b, "Lenovo S205", CXT_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK_VENDOR(0x17aa, "Thinkpad", CXT_FIXUP_THINKPAD_ACPI),
@@ -1003,6 +1006,7 @@ static const struct hda_model_fixup cxt5066_fixup_models[] = {
 	{ .id = CXT_FIXUP_MUTE_LED_GPIO, .name = "mute-led-gpio" },
 	{ .id = CXT_FIXUP_HP_ZBOOK_MUTE_LED, .name = "hp-zbook-mute-led" },
 	{ .id = CXT_FIXUP_HP_MIC_NO_PRESENCE, .name = "hp-mic-fix" },
+	{ .id = CXT_PINCFG_LENOVO_NOTEBOOK, .name = "lenovo-20149" },
 	{}
 };
 
-- 
2.35.3

