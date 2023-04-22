Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DAE6EB95B
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Apr 2023 15:25:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67A6AEC7;
	Sat, 22 Apr 2023 15:24:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67A6AEC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682169934;
	bh=4Yj9c9tNROo8n0O8yyzQMpPzf/t/QLuNIToNVtFZyiA=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=cTlnaqnsculUq7Rnplja2226uuksEklTSh/W0llQckSdJafsTPx/epzOjrhCUTqDP
	 jTzQM75GxsVdUsSAhn7UCDrb9d1aDx0GPB9utNMTxu/N8aGVXOejVOX3spxEZIknh+
	 i4tmG+/OHt5ejHDqy3QwS9quNOKCaLfyQisil2zQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8DA3F80149;
	Sat, 22 Apr 2023 15:24:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34BF3F80212; Sat, 22 Apr 2023 15:24:40 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 094F8F80155
	for <alsa-devel@alsa-project.org>; Sat, 22 Apr 2023 15:24:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 094F8F80155
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id BB05D2420C;
	Sat, 22 Apr 2023 09:24:30 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pqDE6-R6R-00; Sat, 22 Apr 2023 15:24:30 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ALSA: emu10k1: fix snd_emu1010_fpga_read() input masking
 for rev2 cards
Date: Sat, 22 Apr 2023 15:24:30 +0200
Message-Id: <20230422132430.1057490-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 332DHOQSARUJJX2DUN4X2OCPZMITMKJ6
X-Message-ID-Hash: 332DHOQSARUJJX2DUN4X2OCPZMITMKJ6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/332DHOQSARUJJX2DUN4X2OCPZMITMKJ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Unlike the Alice2 chips used on 1st generation E-MU cards, the
Tina/Tina2 chips used on the 2nd gen cards have only six GPIN pins,
which means that we need to use a smaller mask. Failure to do so would
falsify the read data if the FPGA tried to raise an IRQ right at that
moment. This wasn't a problem so far, as we didn't actually enable FPGA
IRQs, but that's going to change soon.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
v2:
- added description
---
 include/sound/emu10k1.h | 3 ++-
 sound/pci/emu10k1/io.c  | 5 ++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 89dbd2e93410..83130965c90a 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -252,7 +252,8 @@
 #define MUSTAT_ORDYN		0x40		/* 0 = MUDATA can accept a command or data	*/
 
 #define A_GPIO			0x18		/* GPIO on Audigy card (16bits)			*/
-#define A_GPINPUT_MASK		0xff00
+#define A_GPINPUT_MASK		0xff00		/* Alice/2 has 8 input pins			*/
+#define A3_GPINPUT_MASK		0x3f00		/* ... while Tina/2 has only 6			*/
 #define A_GPOUTPUT_MASK		0x00ff
 
 // The GPIO port is used for I/O config on Sound Blasters;
diff --git a/sound/pci/emu10k1/io.c b/sound/pci/emu10k1/io.c
index f0134689c320..42b06f2e5552 100644
--- a/sound/pci/emu10k1/io.c
+++ b/sound/pci/emu10k1/io.c
@@ -255,16 +255,19 @@ void snd_emu1010_fpga_write(struct snd_emu10k1 *emu, u32 reg, u32 value)
 
 void snd_emu1010_fpga_read(struct snd_emu10k1 *emu, u32 reg, u32 *value)
 {
+	// The higest input pin is used as the designated interrupt trigger,
+	// so it needs to be masked out.
+	u32 mask = emu->card_capabilities->ca0108_chip ? 0x1f : 0x7f;
 	unsigned long flags;
 	if (snd_BUG_ON(reg > 0x3f))
 		return;
 	reg += 0x40; /* 0x40 upwards are registers. */
 	spin_lock_irqsave(&emu->emu_lock, flags);
 	outw(reg, emu->port + A_GPIO);
 	udelay(10);
 	outw(reg | 0x80, emu->port + A_GPIO);  /* High bit clocks the value into the fpga. */
 	udelay(10);
-	*value = ((inw(emu->port + A_GPIO) >> 8) & 0x7f);
+	*value = ((inw(emu->port + A_GPIO) >> 8) & mask);
 	spin_unlock_irqrestore(&emu->emu_lock, flags);
 }
 
-- 
2.40.0.152.g15d061e6df

