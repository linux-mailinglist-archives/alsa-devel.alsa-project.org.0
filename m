Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B806FAF99
	for <lists+alsa-devel@lfdr.de>; Mon,  8 May 2023 14:03:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0F8D11DD;
	Mon,  8 May 2023 14:02:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0F8D11DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683547424;
	bh=KyTwThcRXrSODiFc0Dwc/NQkquxe5lSbcMP4nm+QHS8=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Fkq6XT5h7D8MaWuGcEZqxTndpraf8qJKFRyhCaSYgTW8plJpw5mzBbXCj69xS25Ro
	 KZe2oulTHd06iWJGLbzqFUlky6TUx1C+08XIzqsT/6dQVCYggcSqgVtLTbO3d5clmW
	 vtAycxfJTCydQ8ygYq7xmUoGE2GLLXTn8iBTj+sg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C7A7F80310;
	Mon,  8 May 2023 14:02:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CEFBF8032D; Mon,  8 May 2023 14:02:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED6E4F80087
	for <alsa-devel@alsa-project.org>; Mon,  8 May 2023 14:02:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED6E4F80087
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 4C3CB24184;
	Mon,  8 May 2023 08:02:29 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pvzZV-Mp9-00; Mon, 08 May 2023 14:02:29 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ALSA: emu10k1: macro-ize snd_emu10k1_ptr_{read,write}()
Date: Mon,  8 May 2023 14:02:29 +0200
Message-Id: <20230508120229.2471010-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RBRBOUEPNNH572MW5OLAHZMVJWQGOT3Z
X-Message-ID-Hash: RBRBOUEPNNH572MW5OLAHZMVJWQGOT3Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RBRBOUEPNNH572MW5OLAHZMVJWQGOT3Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The idea to encode the bitfield manipulation in the register address is
quite clever, but it's somewhat wasteful to do these calculations at
runtime, given that they are all constants. So change that. This yields
a marginal saving in runtime cost at a marginal cost in code side (less
than 400 bytes).

The call sites where the read/write is done with a non-constant register
needed adjustment, so there is a bit of churn involved. On the upside,
this makes the various use cases more obvious, and makes it easier to
grep for them.

snd_emu10k1_ptr_{read,write}() must be macros, as they check the
constness of the passed register argument, and the C language has no
provisions for doing this differently.

The added bitfield manipulation macros will be used separately as well.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
v2:
- the snd_emu10k1_ptr_{read,write} macros now check that the register
  is actually a constant
- introduced inline snd_emu10k1_ptr_{read,write}_idx functions
- replaced the incorrect usages of the macros, which saves > 2kb dead
  code
- re-arranged the declarations for a more logical order
- elaborate a bit more in the commit message
---
 include/sound/emu10k1.h          |  44 +++++++++++-
 sound/pci/emu10k1/emu10k1_main.c |   8 +--
 sound/pci/emu10k1/emufx.c        |  66 +++++++++---------
 sound/pci/emu10k1/emumixer.c     |   2 +-
 sound/pci/emu10k1/emumpu401.c    |   4 +-
 sound/pci/emu10k1/emupcm.c       |  63 +++++++++--------
 sound/pci/emu10k1/emuproc.c      |  12 ++--
 sound/pci/emu10k1/io.c           | 114 ++++++++++++++-----------------
 8 files changed, 174 insertions(+), 139 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 8fe80dcee71b..ca7be531969c 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1773,8 +1773,48 @@ int snd_emu10k1_fx8010_tram_setup(struct snd_emu10k1 *emu, u32 size);
 int snd_emu10k1_done(struct snd_emu10k1 * emu);
 
 /* I/O functions */
-unsigned int snd_emu10k1_ptr_read(struct snd_emu10k1 * emu, unsigned int reg, unsigned int chn);
-void snd_emu10k1_ptr_write(struct snd_emu10k1 *emu, unsigned int reg, unsigned int chn, unsigned int data);
+
+u32 snd_emu10k1_ptr_read_raw(struct snd_emu10k1 *emu, u32 reg);
+void snd_emu10k1_ptr_write_raw(struct snd_emu10k1 *emu, u32 reg, u32 data);
+void snd_emu10k1_ptr_modify(struct snd_emu10k1 *emu, u32 reg, u32 and_mask, u32 or_mask);
+
+static inline u32 snd_emu10k1_ptr_read_idx(struct snd_emu10k1 *emu, u16 reg, u8 voice)
+{
+	return snd_emu10k1_ptr_read_raw(emu, ((u32)reg << 16) | voice);
+}
+
+static inline void snd_emu10k1_ptr_write_idx(struct snd_emu10k1 *emu, u16 reg, u8 voice, u32 data)
+{
+	snd_emu10k1_ptr_write_raw(emu, ((u32)reg << 16) | voice, data);
+}
+
+#define REG_SHIFT(r) (((r) >> 16) & 0x1f)
+#define REG_SIZE(r) (((r) >> 24) & 0x1f)
+#define REG_MASK0(r) ((1U << REG_SIZE(r)) - 1U)
+#define REG_MASK(r) (REG_MASK0(r) << REG_SHIFT(r))
+#define REG_ADDR(r, v) ((((r) & 0xffff) << 16) | (v))
+#define REG_VAL_GET(r, v) ((v & REG_MASK(r)) >> REG_SHIFT(r))
+#define REG_VAL_PUT(r, v) ((v) << REG_SHIFT(r))
+
+#define snd_emu10k1_ptr_read(emu, reg, voice) \
+	({ \
+		enum { reg_must_be_constant = reg }; \
+		u32 data = snd_emu10k1_ptr_read_raw(emu, REG_ADDR(reg, voice)); \
+		if (REG_SIZE(reg)) \
+			data = REG_VAL_GET(reg, data); \
+		data; \
+	})
+
+#define snd_emu10k1_ptr_write(emu, reg, voice, data) \
+	do { \
+		enum { reg_must_be_constant = reg }; \
+		if (REG_SIZE(reg)) \
+			snd_emu10k1_ptr_modify(emu, REG_ADDR(reg, voice), \
+					       ~REG_MASK(reg), REG_VAL_PUT(reg, data)); \
+		else \
+			snd_emu10k1_ptr_write_raw(emu, REG_ADDR(reg, voice), data); \
+	} while (0)
+
 unsigned int snd_emu10k1_ptr20_read(struct snd_emu10k1 * emu, unsigned int reg, unsigned int chn);
 void snd_emu10k1_ptr20_write(struct snd_emu10k1 *emu, unsigned int reg, unsigned int chn, unsigned int data);
 int snd_emu10k1_spi_write(struct snd_emu10k1 * emu, unsigned int data);
diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index 3abdaf1b9624..576391a0d9c6 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -1985,11 +1985,11 @@ void snd_emu10k1_suspend_regs(struct snd_emu10k1 *emu)
 	val = emu->saved_ptr;
 	for (reg = saved_regs; *reg != 0xff; reg++)
 		for (i = 0; i < NUM_G; i++, val++)
-			*val = snd_emu10k1_ptr_read(emu, *reg, i);
+			*val = snd_emu10k1_ptr_read_idx(emu, *reg, i);
 	if (emu->audigy) {
 		for (reg = saved_regs_audigy; *reg != 0xff; reg++)
 			for (i = 0; i < NUM_G; i++, val++)
-				*val = snd_emu10k1_ptr_read(emu, *reg, i);
+				*val = snd_emu10k1_ptr_read_idx(emu, *reg, i);
 	}
 	if (emu->audigy)
 		emu->saved_a_iocfg = inw(emu->port + A_IOCFG);
@@ -2025,11 +2025,11 @@ void snd_emu10k1_resume_regs(struct snd_emu10k1 *emu)
 	val = emu->saved_ptr;
 	for (reg = saved_regs; *reg != 0xff; reg++)
 		for (i = 0; i < NUM_G; i++, val++)
-			snd_emu10k1_ptr_write(emu, *reg, i, *val);
+			snd_emu10k1_ptr_write_idx(emu, *reg, i, *val);
 	if (emu->audigy) {
 		for (reg = saved_regs_audigy; *reg != 0xff; reg++)
 			for (i = 0; i < NUM_G; i++, val++)
-				snd_emu10k1_ptr_write(emu, *reg, i, *val);
+				snd_emu10k1_ptr_write_idx(emu, *reg, i, *val);
 	}
 }
 #endif
diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index db211a6e8a47..757623687a5b 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -353,29 +353,31 @@ static int snd_emu10k1_gpr_ctl_put(struct snd_kcontrol *kcontrol, struct snd_ctl
 		val = ctl->value[i] = nval;
 		switch (ctl->translation) {
 		case EMU10K1_GPR_TRANSLATION_NONE:
-			snd_emu10k1_ptr_write(emu, emu->gpr_base + ctl->gpr[i], 0, val);
+			snd_emu10k1_ptr_write_raw(emu, emu->gpr_base + ctl->gpr[i], val);
 			break;
 		case EMU10K1_GPR_TRANSLATION_TABLE100:
-			snd_emu10k1_ptr_write(emu, emu->gpr_base + ctl->gpr[i], 0, db_table[val]);
+			snd_emu10k1_ptr_write_raw(emu, emu->gpr_base + ctl->gpr[i], db_table[val]);
 			break;
 		case EMU10K1_GPR_TRANSLATION_BASS:
 			if ((ctl->count % 5) != 0 || (ctl->count / 5) != ctl->vcount) {
 				change = -EIO;
 				goto __error;
 			}
 			for (j = 0; j < 5; j++)
-				snd_emu10k1_ptr_write(emu, emu->gpr_base + ctl->gpr[j * ctl->vcount + i], 0, bass_table[val][j]);
+				snd_emu10k1_ptr_write_raw(emu, emu->gpr_base + ctl->gpr[j * ctl->vcount + i],
+							  bass_table[val][j]);
 			break;
 		case EMU10K1_GPR_TRANSLATION_TREBLE:
 			if ((ctl->count % 5) != 0 || (ctl->count / 5) != ctl->vcount) {
 				change = -EIO;
 				goto __error;
 			}
 			for (j = 0; j < 5; j++)
-				snd_emu10k1_ptr_write(emu, emu->gpr_base + ctl->gpr[j * ctl->vcount + i], 0, treble_table[val][j]);
+				snd_emu10k1_ptr_write_raw(emu, emu->gpr_base + ctl->gpr[j * ctl->vcount + i],
+							  treble_table[val][j]);
 			break;
 		case EMU10K1_GPR_TRANSLATION_ONOFF:
-			snd_emu10k1_ptr_write(emu, emu->gpr_base + ctl->gpr[i], 0, onoff_table[val]);
+			snd_emu10k1_ptr_write_raw(emu, emu->gpr_base + ctl->gpr[i], onoff_table[val]);
 			break;
 		}
 	}
@@ -395,10 +397,10 @@ static void snd_emu10k1_fx8010_interrupt(struct snd_emu10k1 *emu)
 	irq = emu->fx8010.irq_handlers;
 	while (irq) {
 		nirq = irq->next;	/* irq ptr can be removed from list */
-		if (snd_emu10k1_ptr_read(emu, emu->gpr_base + irq->gpr_running, 0) & 0xffff0000) {
+		if (snd_emu10k1_ptr_read_raw(emu, emu->gpr_base + irq->gpr_running) & 0xffff0000) {
 			if (irq->handler)
 				irq->handler(emu, irq->private_data);
-			snd_emu10k1_ptr_write(emu, emu->gpr_base + irq->gpr_running, 0, 1);
+			snd_emu10k1_ptr_write_raw(emu, emu->gpr_base + irq->gpr_running, 1);
 		}
 		irq = nirq;
 	}
@@ -494,13 +496,13 @@ static void snd_emu10k1_audigy_write_op(struct snd_emu10k1_fx8010_code *icode,
 static void snd_emu10k1_efx_write(struct snd_emu10k1 *emu, unsigned int pc, unsigned int data)
 {
 	pc += emu->audigy ? A_MICROCODEBASE : MICROCODEBASE;
-	snd_emu10k1_ptr_write(emu, pc, 0, data);
+	snd_emu10k1_ptr_write_raw(emu, pc, data);
 }
 
 unsigned int snd_emu10k1_efx_read(struct snd_emu10k1 *emu, unsigned int pc)
 {
 	pc += emu->audigy ? A_MICROCODEBASE : MICROCODEBASE;
-	return snd_emu10k1_ptr_read(emu, pc, 0);
+	return snd_emu10k1_ptr_read_raw(emu, pc);
 }
 
 static int snd_emu10k1_gpr_poke(struct snd_emu10k1 *emu,
@@ -517,7 +519,7 @@ static int snd_emu10k1_gpr_poke(struct snd_emu10k1 *emu,
 			val = icode->gpr_map[gpr];
 		else if (get_user(val, (__user u32 *)&icode->gpr_map[gpr]))
 			return -EFAULT;
-		snd_emu10k1_ptr_write(emu, emu->gpr_base + gpr, 0, val);
+		snd_emu10k1_ptr_write_raw(emu, emu->gpr_base + gpr, val);
 	}
 	return 0;
 }
@@ -530,7 +532,7 @@ static int snd_emu10k1_gpr_peek(struct snd_emu10k1 *emu,
 
 	for (gpr = 0; gpr < (emu->audigy ? 0x200 : 0x100); gpr++) {
 		set_bit(gpr, icode->gpr_valid);
-		val = snd_emu10k1_ptr_read(emu, emu->gpr_base + gpr, 0);
+		val = snd_emu10k1_ptr_read_raw(emu, emu->gpr_base + gpr);
 		if (put_user(val, (__user u32 *)&icode->gpr_map[gpr]))
 			return -EFAULT;
 	}
@@ -555,12 +557,12 @@ static int snd_emu10k1_tram_poke(struct snd_emu10k1 *emu,
 			    get_user(addr, (__user __u32 *)&icode->tram_addr_map[tram]))
 				return -EFAULT;
 		}
-		snd_emu10k1_ptr_write(emu, TANKMEMDATAREGBASE + tram, 0, val);
+		snd_emu10k1_ptr_write_raw(emu, TANKMEMDATAREGBASE + tram, val);
 		if (!emu->audigy) {
-			snd_emu10k1_ptr_write(emu, TANKMEMADDRREGBASE + tram, 0, addr);
+			snd_emu10k1_ptr_write_raw(emu, TANKMEMADDRREGBASE + tram, addr);
 		} else {
-			snd_emu10k1_ptr_write(emu, TANKMEMADDRREGBASE + tram, 0, addr << 12);
-			snd_emu10k1_ptr_write(emu, A_TANKMEMCTLREGBASE + tram, 0, addr >> 20);
+			snd_emu10k1_ptr_write_raw(emu, TANKMEMADDRREGBASE + tram, addr << 12);
+			snd_emu10k1_ptr_write_raw(emu, A_TANKMEMCTLREGBASE + tram, addr >> 20);
 		}
 	}
 	return 0;
@@ -575,12 +577,12 @@ static int snd_emu10k1_tram_peek(struct snd_emu10k1 *emu,
 	memset(icode->tram_valid, 0, sizeof(icode->tram_valid));
 	for (tram = 0; tram < (emu->audigy ? 0x100 : 0xa0); tram++) {
 		set_bit(tram, icode->tram_valid);
-		val = snd_emu10k1_ptr_read(emu, TANKMEMDATAREGBASE + tram, 0);
+		val = snd_emu10k1_ptr_read_raw(emu, TANKMEMDATAREGBASE + tram);
 		if (!emu->audigy) {
-			addr = snd_emu10k1_ptr_read(emu, TANKMEMADDRREGBASE + tram, 0);
+			addr = snd_emu10k1_ptr_read_raw(emu, TANKMEMADDRREGBASE + tram);
 		} else {
-			addr = snd_emu10k1_ptr_read(emu, TANKMEMADDRREGBASE + tram, 0) >> 12;
-			addr |= snd_emu10k1_ptr_read(emu, A_TANKMEMCTLREGBASE + tram, 0) << 20;
+			addr = snd_emu10k1_ptr_read_raw(emu, TANKMEMADDRREGBASE + tram) >> 12;
+			addr |= snd_emu10k1_ptr_read_raw(emu, A_TANKMEMCTLREGBASE + tram) << 20;
 		}
 		if (put_user(val, (__user u32 *)&icode->tram_data_map[tram]) ||
 		    put_user(addr, (__user u32 *)&icode->tram_addr_map[tram]))
@@ -2730,16 +2732,16 @@ void snd_emu10k1_efx_suspend(struct snd_emu10k1 *emu)
 
 	len = emu->audigy ? 0x200 : 0x100;
 	for (i = 0; i < len; i++)
-		emu->saved_gpr[i] = snd_emu10k1_ptr_read(emu, emu->gpr_base + i, 0);
+		emu->saved_gpr[i] = snd_emu10k1_ptr_read_raw(emu, emu->gpr_base + i);
 
 	len = emu->audigy ? 0x100 : 0xa0;
 	for (i = 0; i < len; i++) {
-		emu->tram_val_saved[i] = snd_emu10k1_ptr_read(emu, TANKMEMDATAREGBASE + i, 0);
-		emu->tram_addr_saved[i] = snd_emu10k1_ptr_read(emu, TANKMEMADDRREGBASE + i, 0);
+		emu->tram_val_saved[i] = snd_emu10k1_ptr_read_raw(emu, TANKMEMDATAREGBASE + i);
+		emu->tram_addr_saved[i] = snd_emu10k1_ptr_read_raw(emu, TANKMEMADDRREGBASE + i);
 		if (emu->audigy) {
 			emu->tram_addr_saved[i] >>= 12;
 			emu->tram_addr_saved[i] |=
-				snd_emu10k1_ptr_read(emu, A_TANKMEMCTLREGBASE + i, 0) << 20;
+				snd_emu10k1_ptr_read_raw(emu, A_TANKMEMCTLREGBASE + i) << 20;
 		}
 	}
 
@@ -2774,20 +2776,20 @@ void snd_emu10k1_efx_resume(struct snd_emu10k1 *emu)
 
 	len = emu->audigy ? 0x200 : 0x100;
 	for (i = 0; i < len; i++)
-		snd_emu10k1_ptr_write(emu, emu->gpr_base + i, 0, emu->saved_gpr[i]);
+		snd_emu10k1_ptr_write_raw(emu, emu->gpr_base + i, emu->saved_gpr[i]);
 
 	len = emu->audigy ? 0x100 : 0xa0;
 	for (i = 0; i < len; i++) {
-		snd_emu10k1_ptr_write(emu, TANKMEMDATAREGBASE + i, 0,
-				      emu->tram_val_saved[i]);
+		snd_emu10k1_ptr_write_raw(emu, TANKMEMDATAREGBASE + i,
+					  emu->tram_val_saved[i]);
 		if (! emu->audigy)
-			snd_emu10k1_ptr_write(emu, TANKMEMADDRREGBASE + i, 0,
-					      emu->tram_addr_saved[i]);
+			snd_emu10k1_ptr_write_raw(emu, TANKMEMADDRREGBASE + i,
+						  emu->tram_addr_saved[i]);
 		else {
-			snd_emu10k1_ptr_write(emu, TANKMEMADDRREGBASE + i, 0,
-					      emu->tram_addr_saved[i] << 12);
-			snd_emu10k1_ptr_write(emu, TANKMEMADDRREGBASE + i, 0,
-					      emu->tram_addr_saved[i] >> 20);
+			snd_emu10k1_ptr_write_raw(emu, TANKMEMADDRREGBASE + i,
+						  emu->tram_addr_saved[i] << 12);
+			snd_emu10k1_ptr_write_raw(emu, TANKMEMADDRREGBASE + i,
+						  emu->tram_addr_saved[i] >> 20);
 		}
 	}
 
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 8fce3413f4ae..342fcbb8b7b5 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -1158,7 +1158,7 @@ static int snd_emu10k1_spdif_put(struct snd_kcontrol *kcontrol,
 	spin_lock_irqsave(&emu->reg_lock, flags);
 	change = val != emu->spdif_bits[idx];
 	if (change) {
-		snd_emu10k1_ptr_write(emu, SPCS0 + idx, 0, val);
+		snd_emu10k1_ptr_write_raw(emu, SPCS0 + idx, val);
 		emu->spdif_bits[idx] = val;
 	}
 	spin_unlock_irqrestore(&emu->reg_lock, flags);
diff --git a/sound/pci/emu10k1/emumpu401.c b/sound/pci/emu10k1/emumpu401.c
index 3ce9b2129ce6..0b42e42798b1 100644
--- a/sound/pci/emu10k1/emumpu401.c
+++ b/sound/pci/emu10k1/emumpu401.c
@@ -16,16 +16,16 @@ static inline unsigned char mpu401_read(struct snd_emu10k1 *emu,
 					struct snd_emu10k1_midi *mpu, int idx)
 {
 	if (emu->audigy)
-		return (unsigned char)snd_emu10k1_ptr_read(emu, mpu->port + idx, 0);
+		return (unsigned char)snd_emu10k1_ptr_read_raw(emu, mpu->port + idx);
 	else
 		return inb(emu->port + mpu->port + idx);
 }
 
 static inline void mpu401_write(struct snd_emu10k1 *emu,
 				struct snd_emu10k1_midi *mpu, int data, int idx)
 {
 	if (emu->audigy)
-		snd_emu10k1_ptr_write(emu, mpu->port + idx, 0, data);
+		snd_emu10k1_ptr_write_raw(emu, mpu->port + idx, data);
 	else
 		outb(data, emu->port + mpu->port + idx);
 }
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index b0c0ef342756..6ef4926da53c 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -528,7 +528,7 @@ static int snd_emu10k1_capture_prepare(struct snd_pcm_substream *substream)
 	int idx;
 
 	/* zeroing the buffer size will stop capture */
-	snd_emu10k1_ptr_write(emu, epcm->capture_bs_reg, 0, 0);
+	snd_emu10k1_ptr_write_raw(emu, epcm->capture_bs_reg, 0);
 	switch (epcm->type) {
 	case CAPTURE_AC97ADC:
 		snd_emu10k1_ptr_write(emu, ADCCR, 0, 0);
@@ -543,7 +543,7 @@ static int snd_emu10k1_capture_prepare(struct snd_pcm_substream *substream)
 	default:
 		break;
 	}	
-	snd_emu10k1_ptr_write(emu, epcm->capture_ba_reg, 0, runtime->dma_addr);
+	snd_emu10k1_ptr_write_raw(emu, epcm->capture_ba_reg, runtime->dma_addr);
 	epcm->capture_bufsize = snd_pcm_lib_buffer_bytes(substream);
 	epcm->capture_bs_val = 0;
 	for (idx = 0; idx < 31; idx++) {
@@ -583,9 +583,9 @@ static void snd_emu10k1_playback_invalidate_cache(struct snd_emu10k1 *emu, int e
 	cs = (sample == 0) ? (32-ccis) : (64-ccis+1) >> 1;
 	if (cs > 16) cs = 16;
 	for (i = 0; i < cs; i++) {
-		snd_emu10k1_ptr_write(emu, CD0 + i, voice, sample);
+		snd_emu10k1_ptr_write_idx(emu, CD0 + i, voice, sample);
 		if (stereo) {
-			snd_emu10k1_ptr_write(emu, CD0 + i, voice + 1, sample);
+			snd_emu10k1_ptr_write_idx(emu, CD0 + i, voice + 1, sample);
 		}
 	}
 	/* reset cache */
@@ -771,16 +771,16 @@ static int snd_emu10k1_capture_trigger(struct snd_pcm_substream *substream,
 		default:	
 			break;
 		}
-		snd_emu10k1_ptr_write(emu, epcm->capture_bs_reg, 0, epcm->capture_bs_val);
+		snd_emu10k1_ptr_write_raw(emu, epcm->capture_bs_reg, epcm->capture_bs_val);
 		epcm->running = 1;
 		epcm->first_ptr = 1;
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 		epcm->running = 0;
 		snd_emu10k1_intr_disable(emu, epcm->capture_inte);
 		outl(epcm->capture_ipr, emu->port + IPR);
-		snd_emu10k1_ptr_write(emu, epcm->capture_bs_reg, 0, 0);
+		snd_emu10k1_ptr_write_raw(emu, epcm->capture_bs_reg, 0);
 		switch (epcm->type) {
 		case CAPTURE_AC97ADC:
 			snd_emu10k1_ptr_write(emu, ADCCR, 0, 0);
@@ -812,7 +812,7 @@ static snd_pcm_uframes_t snd_emu10k1_playback_pointer(struct snd_pcm_substream *
 
 	if (!epcm->running)
 		return 0;
-	ptr = snd_emu10k1_ptr_read(emu, CCCA, epcm->voices[0]->number) & 0x00ffffff;
+	ptr = snd_emu10k1_ptr_read(emu, CCCA_CURRADDR, epcm->voices[0]->number);
 #if 0	/* Perex's code */
 	ptr += runtime->buffer_size;
 	ptr -= epcm->ccca_start_addr;
@@ -899,7 +899,8 @@ static snd_pcm_uframes_t snd_emu10k1_capture_pointer(struct snd_pcm_substream *s
 		udelay(50);	/* hack, it takes awhile until capture is started */
 		epcm->first_ptr = 0;
 	}
-	ptr = snd_emu10k1_ptr_read(emu, epcm->capture_idx_reg, 0) & 0x0000ffff;
+	ptr = REG_VAL_GET(FXIDX_IDX,  // All *IDX_MASKs are assumed to be equal
+			snd_emu10k1_ptr_read_raw(emu, epcm->capture_idx_reg));
 	return bytes_to_frames(runtime, ptr);
 }
 
@@ -1128,9 +1129,9 @@ static int snd_emu10k1_capture_open(struct snd_pcm_substream *substream)
 	epcm->substream = substream;
 	epcm->capture_ipr = IPR_ADCBUFFULL|IPR_ADCBUFHALFFULL;
 	epcm->capture_inte = INTE_ADCBUFENABLE;
-	epcm->capture_ba_reg = ADCBA;
-	epcm->capture_bs_reg = ADCBS;
-	epcm->capture_idx_reg = emu->audigy ? A_ADCIDX : ADCIDX;
+	epcm->capture_ba_reg = REG_ADDR(ADCBA, 0);
+	epcm->capture_bs_reg = REG_ADDR(ADCBS, 0);
+	epcm->capture_idx_reg = emu->audigy ? REG_ADDR(A_ADCIDX, 0) : REG_ADDR(ADCIDX, 0);
 	runtime->private_data = epcm;
 	runtime->private_free = snd_emu10k1_pcm_free_substream;
 	runtime->hw = snd_emu10k1_capture;
@@ -1164,9 +1165,9 @@ static int snd_emu10k1_capture_mic_open(struct snd_pcm_substream *substream)
 	epcm->substream = substream;
 	epcm->capture_ipr = IPR_MICBUFFULL|IPR_MICBUFHALFFULL;
 	epcm->capture_inte = INTE_MICBUFENABLE;
-	epcm->capture_ba_reg = MICBA;
-	epcm->capture_bs_reg = MICBS;
-	epcm->capture_idx_reg = emu->audigy ? A_MICIDX : MICIDX;
+	epcm->capture_ba_reg = REG_ADDR(MICBA, 0);
+	epcm->capture_bs_reg = REG_ADDR(MICBS, 0);
+	epcm->capture_idx_reg = emu->audigy ? REG_ADDR(A_MICIDX, 0) : REG_ADDR(MICIDX, 0);
 	substream->runtime->private_data = epcm;
 	substream->runtime->private_free = snd_emu10k1_pcm_free_substream;
 	runtime->hw = snd_emu10k1_capture;
@@ -1204,9 +1205,9 @@ static int snd_emu10k1_capture_efx_open(struct snd_pcm_substream *substream)
 	epcm->substream = substream;
 	epcm->capture_ipr = IPR_EFXBUFFULL|IPR_EFXBUFHALFFULL;
 	epcm->capture_inte = INTE_EFXBUFENABLE;
-	epcm->capture_ba_reg = FXBA;
-	epcm->capture_bs_reg = FXBS;
-	epcm->capture_idx_reg = FXIDX;
+	epcm->capture_ba_reg = REG_ADDR(FXBA, 0);
+	epcm->capture_bs_reg = REG_ADDR(FXBS, 0);
+	epcm->capture_idx_reg = REG_ADDR(FXIDX, 0);
 	substream->runtime->private_data = epcm;
 	substream->runtime->private_free = snd_emu10k1_pcm_free_substream;
 	runtime->hw = snd_emu10k1_capture_efx;
@@ -1570,7 +1571,7 @@ static int snd_emu10k1_fx8010_playback_hw_free(struct snd_pcm_substream *substre
 	unsigned int i;
 
 	for (i = 0; i < pcm->channels; i++)
-		snd_emu10k1_ptr_write(emu, TANKMEMADDRREGBASE + 0x80 + pcm->etram[i], 0, 0);
+		snd_emu10k1_ptr_write_raw(emu, TANKMEMADDRREGBASE + 0x80 + pcm->etram[i], 0);
 	return 0;
 }
 
@@ -1592,14 +1593,16 @@ static int snd_emu10k1_fx8010_playback_prepare(struct snd_pcm_substream *substre
 	pcm->pcm_rec.sw_buffer_size = snd_pcm_lib_buffer_bytes(substream);
 	pcm->tram_pos = INITIAL_TRAM_POS(pcm->buffer_size);
 	pcm->tram_shift = 0;
-	snd_emu10k1_ptr_write(emu, emu->gpr_base + pcm->gpr_running, 0, 0);	/* reset */
-	snd_emu10k1_ptr_write(emu, emu->gpr_base + pcm->gpr_trigger, 0, 0);	/* reset */
-	snd_emu10k1_ptr_write(emu, emu->gpr_base + pcm->gpr_size, 0, runtime->buffer_size);
-	snd_emu10k1_ptr_write(emu, emu->gpr_base + pcm->gpr_ptr, 0, 0);		/* reset ptr number */
-	snd_emu10k1_ptr_write(emu, emu->gpr_base + pcm->gpr_count, 0, runtime->period_size);
-	snd_emu10k1_ptr_write(emu, emu->gpr_base + pcm->gpr_tmpcount, 0, runtime->period_size);
+	snd_emu10k1_ptr_write_raw(emu, emu->gpr_base + pcm->gpr_running, 0);	/* reset */
+	snd_emu10k1_ptr_write_raw(emu, emu->gpr_base + pcm->gpr_trigger, 0);	/* reset */
+	snd_emu10k1_ptr_write_raw(emu, emu->gpr_base + pcm->gpr_size, runtime->buffer_size);
+	snd_emu10k1_ptr_write_raw(emu, emu->gpr_base + pcm->gpr_ptr, 0);		/* reset ptr number */
+	snd_emu10k1_ptr_write_raw(emu, emu->gpr_base + pcm->gpr_count, runtime->period_size);
+	snd_emu10k1_ptr_write_raw(emu, emu->gpr_base + pcm->gpr_tmpcount, runtime->period_size);
 	for (i = 0; i < pcm->channels; i++)
-		snd_emu10k1_ptr_write(emu, TANKMEMADDRREGBASE + 0x80 + pcm->etram[i], 0, (TANKMEMADDRREG_READ|TANKMEMADDRREG_ALIGN) + i * (runtime->buffer_size / pcm->channels));
+		snd_emu10k1_ptr_write_raw(emu, TANKMEMADDRREGBASE + 0x80 + pcm->etram[i],
+					  (TANKMEMADDRREG_READ|TANKMEMADDRREG_ALIGN) +
+					  i * (runtime->buffer_size / pcm->channels));
 	return 0;
 }
 
@@ -1623,21 +1626,21 @@ static int snd_emu10k1_fx8010_playback_trigger(struct snd_pcm_substream *substre
 			bits = SPCS_CLKACCY_1000PPM | SPCS_SAMPLERATE_48 |
 			       SPCS_CHANNELNUM_LEFT | SPCS_SOURCENUM_UNSPEC | SPCS_GENERATIONSTATUS |
 			       0x00001200 | SPCS_EMPHASIS_NONE | SPCS_COPYRIGHT | SPCS_NOTAUDIODATA;
-			snd_emu10k1_ptr_write(emu, SPCS0 + i, 0, bits);
+			snd_emu10k1_ptr_write_raw(emu, SPCS0 + i, bits);
 		}
 	}
 #endif
 		result = snd_emu10k1_fx8010_register_irq_handler(emu, snd_emu10k1_fx8010_playback_irq, pcm->gpr_running, substream, &pcm->irq);
 		if (result < 0)
 			goto __err;
 		snd_emu10k1_fx8010_playback_transfer(substream);	/* roll the ball */
-		snd_emu10k1_ptr_write(emu, emu->gpr_base + pcm->gpr_trigger, 0, 1);
+		snd_emu10k1_ptr_write_raw(emu, emu->gpr_base + pcm->gpr_trigger, 1);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 		snd_emu10k1_fx8010_unregister_irq_handler(emu, &pcm->irq);
-		snd_emu10k1_ptr_write(emu, emu->gpr_base + pcm->gpr_trigger, 0, 0);
+		snd_emu10k1_ptr_write_raw(emu, emu->gpr_base + pcm->gpr_trigger, 0);
 		pcm->tram_pos = INITIAL_TRAM_POS(pcm->buffer_size);
 		pcm->tram_shift = 0;
 		break;
@@ -1656,9 +1659,9 @@ static snd_pcm_uframes_t snd_emu10k1_fx8010_playback_pointer(struct snd_pcm_subs
 	struct snd_emu10k1_fx8010_pcm *pcm = &emu->fx8010.pcm[substream->number];
 	size_t ptr; /* byte pointer */
 
-	if (!snd_emu10k1_ptr_read(emu, emu->gpr_base + pcm->gpr_trigger, 0))
+	if (!snd_emu10k1_ptr_read_raw(emu, emu->gpr_base + pcm->gpr_trigger))
 		return 0;
-	ptr = snd_emu10k1_ptr_read(emu, emu->gpr_base + pcm->gpr_ptr, 0) << 2;
+	ptr = snd_emu10k1_ptr_read_raw(emu, emu->gpr_base + pcm->gpr_ptr) << 2;
 	return snd_pcm_indirect_playback_pointer(substream, &pcm->pcm_rec, ptr);
 }
 
diff --git a/sound/pci/emu10k1/emuproc.c b/sound/pci/emu10k1/emuproc.c
index bec72dc60a41..66a5862c3d1d 100644
--- a/sound/pci/emu10k1/emuproc.c
+++ b/sound/pci/emu10k1/emuproc.c
@@ -23,16 +23,16 @@
 static void snd_emu10k1_proc_spdif_status(struct snd_emu10k1 * emu,
 					  struct snd_info_buffer *buffer,
 					  char *title,
-					  int status_reg,
-					  int rate_reg)
+					  u8 status_reg,
+					  u8 rate_reg)
 {
 	static const char * const clkaccy[4] = { "1000ppm", "50ppm", "variable", "unknown" };
 	static const int samplerate[16] = { 44100, 1, 48000, 32000, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 };
 	static const char * const channel[16] = { "unspec", "left", "right", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15" };
 	static const char * const emphasis[8] = { "none", "50/15 usec 2 channel", "2", "3", "4", "5", "6", "7" };
 	unsigned int status, rate = 0;
 	
-	status = snd_emu10k1_ptr_read(emu, status_reg, 0);
+	status = snd_emu10k1_ptr_read_raw(emu, status_reg);
 
 	snd_iprintf(buffer, "\n%s\n", title);
 
@@ -50,7 +50,7 @@ static void snd_emu10k1_proc_spdif_status(struct snd_emu10k1 * emu,
 		snd_iprintf(buffer, "Clock Accuracy        : %s\n", clkaccy[(status & SPCS_CLKACCYMASK) >> 28]);
 
 		if (rate_reg > 0) {
-			rate = snd_emu10k1_ptr_read(emu, rate_reg, 0);
+			rate = snd_emu10k1_ptr_read_raw(emu, rate_reg);
 			snd_iprintf(buffer, "S/PDIF Valid          : %s\n", rate & SRCS_SPDIFVALID ? "on" : "off");
 			snd_iprintf(buffer, "S/PDIF Locked         : %s\n", rate & SRCS_SPDIFLOCKED ? "on" : "off");
 			snd_iprintf(buffer, "Rate Locked           : %s\n", rate & SRCS_RATELOCKED ? "on" : "off");
@@ -344,10 +344,10 @@ static ssize_t snd_emu10k1_fx8010_read(struct snd_info_entry *entry,
 		return -ENOMEM;
 	for (idx = 0; idx < ((pos & 3) + count + 3) >> 2; idx++) {
 		unsigned int val;
-		val = snd_emu10k1_ptr_read(emu, offset + idx + (pos >> 2), 0);
+		val = snd_emu10k1_ptr_read_raw(emu, offset + idx + (pos >> 2));
 		if (tram_addr && emu->audigy) {
 			val >>= 11;
-			val |= snd_emu10k1_ptr_read(emu, 0x100 + idx + (pos >> 2), 0) << 20;
+			val |= snd_emu10k1_ptr_read_raw(emu, 0x100 + idx + (pos >> 2)) << 20;
 		}
 		tmp[idx] = val;
 	}
diff --git a/sound/pci/emu10k1/io.c b/sound/pci/emu10k1/io.c
index c60573f14ea8..6fa3cbb407d9 100644
--- a/sound/pci/emu10k1/io.c
+++ b/sound/pci/emu10k1/io.c
@@ -18,72 +18,62 @@
 #include <linux/export.h>
 #include "p17v.h"
 
-unsigned int snd_emu10k1_ptr_read(struct snd_emu10k1 * emu, unsigned int reg, unsigned int chn)
+static inline bool check_ptr_reg(struct snd_emu10k1 *emu, u32 reg)
 {
-	unsigned long flags;
-	unsigned int regptr, val;
-	unsigned int mask;
-
-	mask = emu->audigy ? A_PTR_ADDRESS_MASK : PTR_ADDRESS_MASK;
-	regptr = ((reg << 16) & mask) | (chn & PTR_CHANNELNUM_MASK);
-
-	if (reg & 0xff000000) {
-		unsigned char size, offset;
-		
-		size = (reg >> 24) & 0x3f;
-		offset = (reg >> 16) & 0x1f;
-		mask = ((1 << size) - 1) << offset;
-		
-		spin_lock_irqsave(&emu->emu_lock, flags);
-		outl(regptr, emu->port + PTR);
-		val = inl(emu->port + DATA);
-		spin_unlock_irqrestore(&emu->emu_lock, flags);
-		
-		return (val & mask) >> offset;
-	} else {
-		spin_lock_irqsave(&emu->emu_lock, flags);
-		outl(regptr, emu->port + PTR);
-		val = inl(emu->port + DATA);
-		spin_unlock_irqrestore(&emu->emu_lock, flags);
-		return val;
-	}
-}
-
-EXPORT_SYMBOL(snd_emu10k1_ptr_read);
-
-void snd_emu10k1_ptr_write(struct snd_emu10k1 *emu, unsigned int reg, unsigned int chn, unsigned int data)
-{
-	unsigned int regptr;
-	unsigned long flags;
-	unsigned int mask;
-
 	if (snd_BUG_ON(!emu))
-		return;
-	mask = emu->audigy ? A_PTR_ADDRESS_MASK : PTR_ADDRESS_MASK;
-	regptr = ((reg << 16) & mask) | (chn & PTR_CHANNELNUM_MASK);
-
-	if (reg & 0xff000000) {
-		unsigned char size, offset;
-
-		size = (reg >> 24) & 0x3f;
-		offset = (reg >> 16) & 0x1f;
-		mask = ((1 << size) - 1) << offset;
-		data = (data << offset) & mask;
-
-		spin_lock_irqsave(&emu->emu_lock, flags);
-		outl(regptr, emu->port + PTR);
-		data |= inl(emu->port + DATA) & ~mask;
-		outl(data, emu->port + DATA);
-		spin_unlock_irqrestore(&emu->emu_lock, flags);		
-	} else {
-		spin_lock_irqsave(&emu->emu_lock, flags);
-		outl(regptr, emu->port + PTR);
-		outl(data, emu->port + DATA);
-		spin_unlock_irqrestore(&emu->emu_lock, flags);
-	}
+		return false;
+	if (snd_BUG_ON(reg & 0xffff0000 & (emu->audigy ? ~A_PTR_ADDRESS_MASK : ~PTR_ADDRESS_MASK)))
+		return false;
+	if (snd_BUG_ON(reg & 0xffff & ~PTR_CHANNELNUM_MASK))
+		return false;
+	return true;
 }
 
-EXPORT_SYMBOL(snd_emu10k1_ptr_write);
+unsigned int snd_emu10k1_ptr_read_raw(struct snd_emu10k1 *emu, u32 reg)
+{
+	unsigned long flags;
+	u32 val;
+
+	if (!check_ptr_reg(emu, reg))
+		return 0;
+
+	spin_lock_irqsave(&emu->emu_lock, flags);
+	outl(reg, emu->port + PTR);
+	val = inl(emu->port + DATA);
+	spin_unlock_irqrestore(&emu->emu_lock, flags);
+	return val;
+}
+EXPORT_SYMBOL(snd_emu10k1_ptr_read_raw);
+
+void snd_emu10k1_ptr_write_raw(struct snd_emu10k1 *emu, u32 reg, u32 data)
+{
+	unsigned long flags;
+
+	if (!check_ptr_reg(emu, reg))
+		return;
+
+	spin_lock_irqsave(&emu->emu_lock, flags);
+	outl(reg, emu->port + PTR);
+	outl(data, emu->port + DATA);
+	spin_unlock_irqrestore(&emu->emu_lock, flags);
+}
+EXPORT_SYMBOL(snd_emu10k1_ptr_write_raw);
+
+void snd_emu10k1_ptr_modify(struct snd_emu10k1 *emu, u32 reg, u32 and_mask, u32 or_mask)
+{
+	unsigned long flags;
+
+	if (!check_ptr_reg(emu, reg))
+		return;
+
+	spin_lock_irqsave(&emu->emu_lock, flags);
+	outl(reg, emu->port + PTR);
+	or_mask |= inl(emu->port + DATA) & and_mask;
+	outl(or_mask, emu->port + DATA);
+	spin_unlock_irqrestore(&emu->emu_lock, flags);
+}
+
+EXPORT_SYMBOL(snd_emu10k1_ptr_modify);
 
 unsigned int snd_emu10k1_ptr20_read(struct snd_emu10k1 * emu, 
 					  unsigned int reg, 
-- 
2.40.0.152.g15d061e6df

