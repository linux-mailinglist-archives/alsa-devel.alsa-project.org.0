Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E10871478A
	for <lists+alsa-devel@lfdr.de>; Mon, 29 May 2023 11:57:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6400B208;
	Mon, 29 May 2023 11:56:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6400B208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685354237;
	bh=xuK/+5pKjBEliOvLaCYMAQodAG04Uxlr7QKqpWw2gBs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n4JiTWmmqBUtv/pkbim1ACpdUBj3GHrSlYzcbo+w17n0B7YU9tb8Z6cLLg9mxGDWC
	 pfoAHFfRjYDurfmSw2NnOSoKOJL/WuuslQJwS/e0weUyQ6Z/EO74H91e0l+XEUDJLc
	 zNv8uizUDQbrMHXPJBb6HjIyYzZv6agElbuLAu8M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABFB7F8042F; Mon, 29 May 2023 11:56:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 89422F8026A;
	Mon, 29 May 2023 11:56:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB9E9F8042F; Mon, 29 May 2023 11:55:22 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4111BF800DF
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 11:55:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4111BF800DF
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 6F47B20076;
	Mon, 29 May 2023 05:55:04 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q3Zai-LR9-00; Mon, 29 May 2023 11:55:04 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v2] ALSA: emu10k1: actually disassemble DSP instructions in
 /proc
Date: Mon, 29 May 2023 11:55:04 +0200
Message-Id: <20230529095504.559054-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230526101659.437969-1-oswald.buddenhagen@gmx.de>
References: <20230526101659.437969-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PKJT22CULXKJNLE6M6PKDLJUR4WG4XZO
X-Message-ID-Hash: PKJT22CULXKJNLE6M6PKDLJUR4WG4XZO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PKJT22CULXKJNLE6M6PKDLJUR4WG4XZO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

fx8010_acode is supposed to be a human-readable representation; the
binary is already in fx8010_code.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>

---

v2:
- fixed bot warnings
---
 sound/pci/emu10k1/emuproc.c | 149 +++++++++++++++++++++++++++++++-----
 1 file changed, 130 insertions(+), 19 deletions(-)

diff --git a/sound/pci/emu10k1/emuproc.c b/sound/pci/emu10k1/emuproc.c
index 89ea3adff322..10290fc86fcf 100644
--- a/sound/pci/emu10k1/emuproc.c
+++ b/sound/pci/emu10k1/emuproc.c
@@ -275,37 +275,148 @@ static void snd_emu10k1_proc_rates_read(struct snd_info_entry *entry,
 	}
 }
 
-static void snd_emu10k1_proc_acode_read(struct snd_info_entry *entry, 
+struct emu10k1_reg_entry {
+	unsigned short base, size;
+	const char *name;
+};
+
+static const struct emu10k1_reg_entry sblive_reg_entries[] = {
+	{    0, 0x10, "FXBUS" },
+	{ 0x10, 0x10, "EXTIN" },
+	{ 0x20, 0x10, "EXTOUT" },
+	{ 0x30, 0x10, "FXBUS2" },
+	{ 0x40, 0x20, NULL },  // Constants
+	{ 0x100, 0x100, "GPR" },
+	{ 0x200, 0x80, "ITRAM_DATA" },
+	{ 0x280, 0x20, "ETRAM_DATA" },
+	{ 0x300, 0x80, "ITRAM_ADDR" },
+	{ 0x380, 0x20, "ETRAM_ADDR" },
+	{ 0x400, 0, NULL }
+};
+
+static const struct emu10k1_reg_entry audigy_reg_entries[] = {
+	{    0, 0x40, "FXBUS" },
+	{ 0x40, 0x10, "EXTIN" },
+	{ 0x50, 0x10, "P16VIN" },
+	{ 0x60, 0x20, "EXTOUT" },
+	{ 0x80, 0x20, "FXBUS2" },
+	{ 0xa0, 0x10, "EMU32OUTH" },
+	{ 0xb0, 0x10, "EMU32OUTL" },
+	{ 0xc0, 0x20, NULL },  // Constants
+	// This can't be quite right - overlap.
+	//{ 0x100, 0xc0, "ITRAM_CTL" },
+	//{ 0x1c0, 0x40, "ETRAM_CTL" },
+	{ 0x160, 0x20, "A3_EMU32IN" },
+	{ 0x1e0, 0x20, "A3_EMU32OUT" },
+	{ 0x200, 0xc0, "ITRAM_DATA" },
+	{ 0x2c0, 0x40, "ETRAM_DATA" },
+	{ 0x300, 0xc0, "ITRAM_ADDR" },
+	{ 0x3c0, 0x40, "ETRAM_ADDR" },
+	{ 0x400, 0x200, "GPR" },
+	{ 0x600, 0, NULL }
+};
+
+static const char * const emu10k1_const_entries[] = {
+	"C_00000000",
+	"C_00000001",
+	"C_00000002",
+	"C_00000003",
+	"C_00000004",
+	"C_00000008",
+	"C_00000010",
+	"C_00000020",
+	"C_00000100",
+	"C_00010000",
+	"C_00000800",
+	"C_10000000",
+	"C_20000000",
+	"C_40000000",
+	"C_80000000",
+	"C_7fffffff",
+	"C_ffffffff",
+	"C_fffffffe",
+	"C_c0000000",
+	"C_4f1bbcdc",
+	"C_5a7ef9db",
+	"C_00100000",
+	"GPR_ACCU",
+	"GPR_COND",
+	"GPR_NOISE0",
+	"GPR_NOISE1",
+	"GPR_IRQ",
+	"GPR_DBAC",
+	"GPR_DBACE",
+	"???",
+};
+
+static int disasm_emu10k1_reg(char *buffer,
+			      const struct emu10k1_reg_entry *entries,
+			      unsigned reg, const char *pfx)
+{
+	for (int i = 0; ; i++) {
+		unsigned base = entries[i].base;
+		unsigned size = entries[i].size;
+		if (!size)
+			return sprintf(buffer, "%s0x%03x", pfx, reg);
+		if (reg >= base && reg < base + size) {
+			const char *name = entries[i].name;
+			reg -= base;
+			if (name)
+				return sprintf(buffer, "%s%s(%u)", pfx, name, reg);
+			return sprintf(buffer, "%s%s", pfx, emu10k1_const_entries[reg]);
+		}
+	}
+}
+
+static int disasm_sblive_reg(char *buffer, unsigned reg, const char *pfx)
+{
+	return disasm_emu10k1_reg(buffer, sblive_reg_entries, reg, pfx);
+}
+
+static int disasm_audigy_reg(char *buffer, unsigned reg, const char *pfx)
+{
+	return disasm_emu10k1_reg(buffer, audigy_reg_entries, reg, pfx);
+}
+
+static void snd_emu10k1_proc_acode_read(struct snd_info_entry *entry,
 				        struct snd_info_buffer *buffer)
 {
 	u32 pc;
 	struct snd_emu10k1 *emu = entry->private_data;
+	static const char * const insns[16] = {
+		"MAC0", "MAC1", "MAC2", "MAC3", "MACINT0", "MACINT1", "ACC3", "MACMV",
+		"ANDXOR", "TSTNEG", "LIMITGE", "LIMITLT", "LOG", "EXP", "INTERP", "SKIP",
+	};
+	static const char spaces[] = "                              ";
+	const int nspaces = sizeof(spaces) - 1;
 
 	snd_iprintf(buffer, "FX8010 Instruction List '%s'\n", emu->fx8010.name);
 	snd_iprintf(buffer, "  Code dump      :\n");
 	for (pc = 0; pc < (emu->audigy ? 1024 : 512); pc++) {
 		u32 low, high;
+		int len;
+		char buf[100];
+		char *bufp = buf;
 			
 		low = snd_emu10k1_efx_read(emu, pc * 2);
 		high = snd_emu10k1_efx_read(emu, pc * 2 + 1);
-		if (emu->audigy)
-			snd_iprintf(buffer, "    OP(0x%02x, 0x%03x, 0x%03x, 0x%03x, 0x%03x) /* 0x%04x: 0x%08x%08x */\n",
-				    (high >> 24) & 0x0f,
-				    (high >> 12) & 0x7ff,
-				    (high >> 0) & 0x7ff,
-				    (low >> 12) & 0x7ff,
-				    (low >> 0) & 0x7ff,
-				    pc,
-				    high, low);
-		else
-			snd_iprintf(buffer, "    OP(0x%02x, 0x%03x, 0x%03x, 0x%03x, 0x%03x) /* 0x%04x: 0x%08x%08x */\n",
-				    (high >> 20) & 0x0f,
-				    (high >> 10) & 0x3ff,
-				    (high >> 0) & 0x3ff,
-				    (low >> 10) & 0x3ff,
-				    (low >> 0) & 0x3ff,
-				    pc,
-				    high, low);
+		if (emu->audigy) {
+			bufp += sprintf(bufp, "    %-7s  ", insns[(high >> 24) & 0x0f]);
+			bufp += disasm_audigy_reg(bufp, (high >> 12) & 0x7ff, "");
+			bufp += disasm_audigy_reg(bufp, (high >> 0) & 0x7ff, ", ");
+			bufp += disasm_audigy_reg(bufp, (low >> 12) & 0x7ff, ", ");
+			bufp += disasm_audigy_reg(bufp, (low >> 0) & 0x7ff, ", ");
+		} else {
+			bufp += sprintf(bufp, "    %-7s  ", insns[(high >> 20) & 0x0f]);
+			bufp += disasm_sblive_reg(bufp, (high >> 10) & 0x3ff, "");
+			bufp += disasm_sblive_reg(bufp, (high >> 0) & 0x3ff, ", ");
+			bufp += disasm_sblive_reg(bufp, (low >> 10) & 0x3ff, ", ");
+			bufp += disasm_sblive_reg(bufp, (low >> 0) & 0x3ff, ", ");
+		}
+		len = (int)(ptrdiff_t)(bufp - buf);
+		snd_iprintf(buffer, "%s %s /* 0x%04x: 0x%08x%08x */\n",
+			    buf, &spaces[nspaces - clamp(65 - len, 0, nspaces)],
+			    pc, high, low);
 	}
 }
 
-- 
2.40.0.152.g15d061e6df

