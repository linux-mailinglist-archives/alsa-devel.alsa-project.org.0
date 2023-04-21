Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B53856EAC89
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 16:13:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C044DF;
	Fri, 21 Apr 2023 16:12:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C044DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682086403;
	bh=9pY+bUmV2PjU8bvWmpP04KZ/9mW7dz/iMN1bbvJFKjg=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HHIzurbVYCBxkt5LeSpMPeFa76neWjYmDL2JVG8bvtDm9qf/U7NtX4LmtLRnPhDBS
	 axbpEbnYVhjAHTKZnBTEMoBNntuFF/gY0C/DnnM+oMbUBgU95eSrH4g1Y9Pb/MUXon
	 3oeKusBgeIjURl2RwvW/rxEmjKbCvyxb5omZB/6A=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B20AFF80579;
	Fri, 21 Apr 2023 16:10:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6B02F80563; Fri, 21 Apr 2023 16:10:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16A99F80510
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 16:10:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16A99F80510
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 0FCC12425A;
	Fri, 21 Apr 2023 10:10:07 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pprSg-Dao-00; Fri, 21 Apr 2023 16:10:06 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/7] ALSA: emu10k1: fix snd_emu1010_fpga_read() input masking
 for rev2 cards
Date: Fri, 21 Apr 2023 16:10:02 +0200
Message-Id: <20230421141006.1005539-3-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230421141006.1005539-1-oswald.buddenhagen@gmx.de>
References: <20230421141006.1005539-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HOPOUW4N4X4RJXIILXB3OCDTKNSVDUZT
X-Message-ID-Hash: HOPOUW4N4X4RJXIILXB3OCDTKNSVDUZT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HOPOUW4N4X4RJXIILXB3OCDTKNSVDUZT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h | 3 ++-
 sound/pci/emu10k1/io.c  | 5 ++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index d6c4c290ad1d..6867a042ebe2 100644
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

