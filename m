Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB93712462
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 12:18:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C09FD8;
	Fri, 26 May 2023 12:17:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C09FD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685096280;
	bh=9TU8LgZDp+TL6Uh085PqvaWz9moHV+g7ds7+pRx0fGQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QyBNS/QxleFyqXfZ0Wa39+HaHb+YToItDBdacJv9E+bAFU9VS+28Ci80f2veT1i5w
	 LEqBcz4qxcgkeOgESmqzWK6VV6Za7zHDbw07kSnXM3UBMKVqzXmUOzoihEke5Z+Xr2
	 0o7zRoRDwvJKZhln2x368AsC/hlPSush3Pqc58NY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73886F80086; Fri, 26 May 2023 12:17:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A3B1F8016A;
	Fri, 26 May 2023 12:17:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46FFAF80053; Fri, 26 May 2023 12:17:05 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 15D5CF80053
	for <alsa-devel@alsa-project.org>; Fri, 26 May 2023 12:17:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15D5CF80053
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id CC7D52425B;
	Fri, 26 May 2023 06:16:59 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q2UVH-pwk-00; Fri, 26 May 2023 12:16:59 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 5/6] ALSA: emu10k1: make E-MU FPGA register dump in /proc more
 useful
Date: Fri, 26 May 2023 12:16:58 +0200
Message-Id: <20230526101659.437969-6-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230526101659.437969-1-oswald.buddenhagen@gmx.de>
References: <20230526101659.437969-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ATSFGDC56N7WECW5GILUZNCCTO4WWO7O
X-Message-ID-Hash: ATSFGDC56N7WECW5GILUZNCCTO4WWO7O
X-MailFrom: ossi@kde.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ATSFGDC56N7WECW5GILUZNCCTO4WWO7O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Include the routing information, which can be actually read back.

Somewhat as a drive-by, make the register dump format less obscure - the
previous one made no sense at all.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h     |  1 +
 sound/pci/emu10k1/emuproc.c | 43 ++++++++++++++++++++++++++++++++++++-
 sound/pci/emu10k1/io.c      | 28 +++++++++++++++++++++---
 3 files changed, 68 insertions(+), 4 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 164a2374b4c2..4b9dda449917 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1812,6 +1812,7 @@ int snd_emu10k1_i2c_write(struct snd_emu10k1 *emu, u32 reg, u32 value);
 void snd_emu1010_fpga_write(struct snd_emu10k1 *emu, u32 reg, u32 value);
 void snd_emu1010_fpga_read(struct snd_emu10k1 *emu, u32 reg, u32 *value);
 void snd_emu1010_fpga_link_dst_src_write(struct snd_emu10k1 *emu, u32 dst, u32 src);
+u32 snd_emu1010_fpga_link_dst_src_read(struct snd_emu10k1 *emu, u32 dst);
 unsigned int snd_emu10k1_efx_read(struct snd_emu10k1 *emu, unsigned int pc);
 void snd_emu10k1_intr_enable(struct snd_emu10k1 *emu, unsigned int intrenb);
 void snd_emu10k1_intr_disable(struct snd_emu10k1 *emu, unsigned int intrenb);
diff --git a/sound/pci/emu10k1/emuproc.c b/sound/pci/emu10k1/emuproc.c
index 0ab7dc92c0f8..2eb42a9c72f5 100644
--- a/sound/pci/emu10k1/emuproc.c
+++ b/sound/pci/emu10k1/emuproc.c
@@ -495,17 +495,58 @@ static void snd_emu10k1_proc_voices_read(struct snd_info_entry *entry,
 }
 
 #ifdef CONFIG_SND_DEBUG
+
+static void snd_emu_proc_emu1010_link_read(struct snd_emu10k1 *emu,
+					   struct snd_info_buffer *buffer,
+					   u32 dst)
+{
+	u32 src = snd_emu1010_fpga_link_dst_src_read(emu, dst);
+	snd_iprintf(buffer, "%04x: %04x\n", dst, src);
+}
+
 static void snd_emu_proc_emu1010_reg_read(struct snd_info_entry *entry,
 				     struct snd_info_buffer *buffer)
 {
 	struct snd_emu10k1 *emu = entry->private_data;
 	u32 value;
 	int i;
 	snd_iprintf(buffer, "EMU1010 Registers:\n\n");
 
 	for(i = 0; i < 0x40; i+=1) {
 		snd_emu1010_fpga_read(emu, i, &value);
-		snd_iprintf(buffer, "%02X: %08X, %02X\n", i, value, (value >> 8) & 0x7f);
+		snd_iprintf(buffer, "%02x: %02x\n", i, value);
+	}
+
+	snd_iprintf(buffer, "\nEMU1010 Routes:\n\n");
+
+	for (i = 0; i < 16; i++)  // To Alice2/Tina[2] via EMU32
+		snd_emu_proc_emu1010_link_read(emu, buffer, i);
+	if (emu->card_capabilities->emu_model != EMU_MODEL_EMU0404)
+		for (i = 0; i < 32; i++)  // To Dock via EDI
+			snd_emu_proc_emu1010_link_read(emu, buffer, 0x100 + i);
+	if (emu->card_capabilities->emu_model != EMU_MODEL_EMU1616)
+		for (i = 0; i < 8; i++)  // To Hamoa/local
+			snd_emu_proc_emu1010_link_read(emu, buffer, 0x200 + i);
+	for (i = 0; i < 8; i++)  // To Hamoa/Mana/local
+		snd_emu_proc_emu1010_link_read(emu, buffer, 0x300 + i);
+	if (emu->card_capabilities->emu_model == EMU_MODEL_EMU1616) {
+		for (i = 0; i < 16; i++)  // To Tina2 via EMU32
+			snd_emu_proc_emu1010_link_read(emu, buffer, 0x400 + i);
+	} else if (emu->card_capabilities->emu_model != EMU_MODEL_EMU0404) {
+		for (i = 0; i < 8; i++)  // To Hana ADAT
+			snd_emu_proc_emu1010_link_read(emu, buffer, 0x400 + i);
+		if (emu->card_capabilities->emu_model == EMU_MODEL_EMU1010B) {
+			for (i = 0; i < 16; i++)  // To Tina via EMU32
+				snd_emu_proc_emu1010_link_read(emu, buffer, 0x500 + i);
+		} else {
+			// To Alice2 via I2S
+			snd_emu_proc_emu1010_link_read(emu, buffer, 0x500);
+			snd_emu_proc_emu1010_link_read(emu, buffer, 0x501);
+			snd_emu_proc_emu1010_link_read(emu, buffer, 0x600);
+			snd_emu_proc_emu1010_link_read(emu, buffer, 0x601);
+			snd_emu_proc_emu1010_link_read(emu, buffer, 0x700);
+			snd_emu_proc_emu1010_link_read(emu, buffer, 0x701);
+		}
 	}
 }
 
diff --git a/sound/pci/emu10k1/io.c b/sound/pci/emu10k1/io.c
index 9a839e7d283f..abe69ae40499 100644
--- a/sound/pci/emu10k1/io.c
+++ b/sound/pci/emu10k1/io.c
@@ -298,21 +298,27 @@ void snd_emu1010_fpga_write(struct snd_emu10k1 *emu, u32 reg, u32 value)
 	spin_unlock_irqrestore(&emu->emu_lock, flags);
 }
 
-void snd_emu1010_fpga_read(struct snd_emu10k1 *emu, u32 reg, u32 *value)
+static void snd_emu1010_fpga_read_locked(struct snd_emu10k1 *emu, u32 reg, u32 *value)
 {
 	// The higest input pin is used as the designated interrupt trigger,
 	// so it needs to be masked out.
 	u32 mask = emu->card_capabilities->ca0108_chip ? 0x1f : 0x7f;
-	unsigned long flags;
 	if (snd_BUG_ON(reg > 0x3f))
 		return;
 	reg += 0x40; /* 0x40 upwards are registers. */
-	spin_lock_irqsave(&emu->emu_lock, flags);
 	outw(reg, emu->port + A_GPIO);
 	udelay(10);
 	outw(reg | 0x80, emu->port + A_GPIO);  /* High bit clocks the value into the fpga. */
 	udelay(10);
 	*value = ((inw(emu->port + A_GPIO) >> 8) & mask);
+}
+
+void snd_emu1010_fpga_read(struct snd_emu10k1 *emu, u32 reg, u32 *value)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&emu->emu_lock, flags);
+	snd_emu1010_fpga_read_locked(emu, reg, value);
 	spin_unlock_irqrestore(&emu->emu_lock, flags);
 }
 
@@ -335,6 +341,22 @@ void snd_emu1010_fpga_link_dst_src_write(struct snd_emu10k1 *emu, u32 dst, u32 s
 	spin_unlock_irqrestore(&emu->emu_lock, flags);
 }
 
+u32 snd_emu1010_fpga_link_dst_src_read(struct snd_emu10k1 *emu, u32 dst)
+{
+	unsigned long flags;
+	u32 hi, lo;
+
+	if (snd_BUG_ON(dst & ~0x71f))
+		return 0;
+	spin_lock_irqsave(&emu->emu_lock, flags);
+	snd_emu1010_fpga_write_locked(emu, EMU_HANA_DESTHI, dst >> 8);
+	snd_emu1010_fpga_write_locked(emu, EMU_HANA_DESTLO, dst & 0x1f);
+	snd_emu1010_fpga_read_locked(emu, EMU_HANA_SRCHI, &hi);
+	snd_emu1010_fpga_read_locked(emu, EMU_HANA_SRCLO, &lo);
+	spin_unlock_irqrestore(&emu->emu_lock, flags);
+	return (hi << 8) | lo;
+}
+
 void snd_emu10k1_intr_enable(struct snd_emu10k1 *emu, unsigned int intrenb)
 {
 	unsigned long flags;
-- 
2.40.0.152.g15d061e6df

