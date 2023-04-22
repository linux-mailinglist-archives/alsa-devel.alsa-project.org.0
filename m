Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 271426EBA43
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Apr 2023 18:15:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0E63EEB;
	Sat, 22 Apr 2023 18:14:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0E63EEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682180105;
	bh=gmm+t4zSBnbQSxLgkPtQU8PNw/Hh16oCfuRBVA8CEkU=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tOPwTmV3lHx/zauHdThvZEtszBOJu1WWKggb85bchOLfcqPZGJJ4aFrWgz3Q2ob1T
	 SSsm6eqX3fXc9Hle63qX70+Ioy3Iu6DcS8r0cqgIWG4IG+AgzDJQYmitNUQLhfiVeM
	 dLgZbBLPlZGynuXJoNPyikZuEZdabZvk/ErwlEWc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC0D7F80155;
	Sat, 22 Apr 2023 18:12:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD3D9F80155; Sat, 22 Apr 2023 18:12:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 911F6F8019B
	for <alsa-devel@alsa-project.org>; Sat, 22 Apr 2023 18:10:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 911F6F8019B
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 56A9C23F37;
	Sat, 22 Apr 2023 12:10:21 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pqFob-nZx-00; Sat, 22 Apr 2023 18:10:21 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: emu10k1: skip Sound Blaster-specific hacks for E-MU
 cards
Date: Sat, 22 Apr 2023 18:10:21 +0200
Message-Id: <20230422161021.1143888-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Y3EQXOM33YCFZYDF5QFQ6OYDW2TWO3VM
X-Message-ID-Hash: Y3EQXOM33YCFZYDF5QFQ6OYDW2TWO3VM
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y3EQXOM33YCFZYDF5QFQ6OYDW2TWO3VM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The rev2 cards use CA0108, but the embedded P17V goes entirely unused.
Also, A_IOCTL (which is really the GPIO port) is actually the FPGA
control port, so messing with it is no good idea.

The hacks are actually mutually exclusive, so make that explicit while
we're at it.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emu10k1_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index c37df604d470..3607d2e1c905 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -181,7 +181,8 @@ static int snd_emu10k1_init(struct snd_emu10k1 *emu, int enable_ir)
 	snd_emu10k1_ptr_write(emu, SPCS1, 0, emu->spdif_bits[1]);
 	snd_emu10k1_ptr_write(emu, SPCS2, 0, emu->spdif_bits[2]);
 
-	if (emu->card_capabilities->ca0151_chip) { /* audigy2 */
+	if (emu->card_capabilities->emu_model) {
+	} else if (emu->card_capabilities->ca0151_chip) { /* audigy2 */
 		/* Hacks for Alice3 to work independent of haP16V driver */
 		/* Setup SRCMulti_I2S SamplingRate */
 		tmp = snd_emu10k1_ptr_read(emu, A_SPDIF_SAMPLERATE, 0);
@@ -199,8 +200,7 @@ static int snd_emu10k1_init(struct snd_emu10k1 *emu, int enable_ir)
 		outl(0x0201, emu->port + HCFG2);
 		/* Set playback routing. */
 		snd_emu10k1_ptr20_write(emu, CAPTURE_P16V_SOURCE, 0, 0x78e4);
-	}
-	if (emu->card_capabilities->ca0108_chip) { /* audigy2 Value */
+	} else if (emu->card_capabilities->ca0108_chip) { /* audigy2 Value */
 		/* Hacks for Alice3 to work independent of haP16V driver */
 		dev_info(emu->card->dev, "Audigy2 value: Special config.\n");
 		/* Setup SRCMulti_I2S SamplingRate */
-- 
2.40.0.152.g15d061e6df

