Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 831DE72CF0C
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 21:14:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98BC5827;
	Mon, 12 Jun 2023 21:13:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98BC5827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686597275;
	bh=VpbpPVjBIEUNN5+8lyh1sfXAIPL4tS7/bizPTJgra48=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MsaQJzo9vSLkR3+O1gNAmv/GYMA73E7YboJKyimjrmoCofUp9In0BC1sXYLPixqSQ
	 VSzta/n0p/xFMf0o1DGbpGUvcO7R0tKqbozj0S0+/RBY/8DJqt6DxVYqwgbOcB/v5K
	 EEFF8JEnBw21ua7kg9KTwgVUgEU0F4mQcp+gFEeQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FF93F80557; Mon, 12 Jun 2023 21:13:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7A05F800ED;
	Mon, 12 Jun 2023 21:13:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C21FDF80549; Mon, 12 Jun 2023 21:13:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B928F800BA
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 21:13:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B928F800BA
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id D5A94241C4;
	Mon, 12 Jun 2023 15:13:25 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q8myj-WK3-00; Mon, 12 Jun 2023 21:13:25 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 3/9] ALSA: emu10k1: query rate of external clock sources on
 E-MU cards
Date: Mon, 12 Jun 2023 21:13:19 +0200
Message-Id: <20230612191325.1315854-4-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230612191325.1315854-1-oswald.buddenhagen@gmx.de>
References: <20230612191325.1315854-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: M26TGBKOLHAC2BNBKBM3SWRTHLQ42AHG
X-Message-ID-Hash: M26TGBKOLHAC2BNBKBM3SWRTHLQ42AHG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M26TGBKOLHAC2BNBKBM3SWRTHLQ42AHG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The value isn't used yet; the subsequent commits will do that.

This ignores the existence of rates above 48 kHz, which is fine, as the
hardware will just switch to the fallback clock source when fed with a
rate which is incompatible with the base clock multiplier, which
currently is always x1.

The sample rate display in /proc spdif-in is adjusted to reflect our
understanding of the input rates.

This is tested only with an 0404b card without sync card, so there is a
lot of room for improvement.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>

---

FIXME: needs a lot of testing to figure out things for real: 0404, 1010,
1010b, and 1616 hardware, with adat, s/pdif on 1010 and dock, and bnc
sync. what are the lock status and the displayed rates with no signal,
good signal async to internal clock, and synced signal? test s/pdif at
least with 48 & 96 khz (192 works on 1010b & 1616m cards on the RCA
port).
---
 include/sound/emu10k1.h     |  5 ++++
 sound/pci/emu10k1/emuproc.c | 43 ++++++++++++++++---------------
 sound/pci/emu10k1/io.c      | 51 ++++++++++++++++++++++++++++++++++++-
 3 files changed, 78 insertions(+), 21 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 703ef441bb2a..d64cf1697586 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1110,6 +1110,9 @@ SUB_REG_NC(A_EHC, A_I2S_CAPTURE_RATE, 0x00000e00)  /* This sets the capture PCM
 #define EMU_DOCK_BOARD_ID0		0x00	/* ID bit 0 */
 #define EMU_DOCK_BOARD_ID1		0x03	/* ID bit 1 */
 
+// The actual code disagrees about the bit width of the registers -
+// the formula used is freq = 0x1770000 / (((X_HI << 5) | X_LO) + 1)
+
 #define EMU_HANA_WC_SPDIF_HI	0x28	/* 0xxxxxx  6 bit  SPDIF IN Word clock, upper 6 bits */
 #define EMU_HANA_WC_SPDIF_LO	0x29	/* 0xxxxxx  6 bit  SPDIF IN Word clock, lower 6 bits */
 
@@ -1669,6 +1672,7 @@ struct snd_emu1010 {
 	unsigned int adc_pads; /* bit mask */
 	unsigned int dac_pads; /* bit mask */
 	unsigned int wclock;  /* Cached register value */
+	unsigned int word_clock;  /* Cached effective value */
 	unsigned int clock_source;
 	unsigned int clock_fallback;
 	unsigned int optical_in; /* 0:SPDIF, 1:ADAT */
@@ -1825,6 +1829,7 @@ void snd_emu1010_fpga_write(struct snd_emu10k1 *emu, u32 reg, u32 value);
 void snd_emu1010_fpga_read(struct snd_emu10k1 *emu, u32 reg, u32 *value);
 void snd_emu1010_fpga_link_dst_src_write(struct snd_emu10k1 *emu, u32 dst, u32 src);
 u32 snd_emu1010_fpga_link_dst_src_read(struct snd_emu10k1 *emu, u32 dst);
+int snd_emu1010_get_raw_rate(struct snd_emu10k1 *emu, u8 src);
 void snd_emu1010_update_clock(struct snd_emu10k1 *emu);
 unsigned int snd_emu10k1_efx_read(struct snd_emu10k1 *emu, unsigned int pc);
 void snd_emu10k1_intr_enable(struct snd_emu10k1 *emu, unsigned int intrenb);
diff --git a/sound/pci/emu10k1/emuproc.c b/sound/pci/emu10k1/emuproc.c
index ca7b4dddbea8..993b35362499 100644
--- a/sound/pci/emu10k1/emuproc.c
+++ b/sound/pci/emu10k1/emuproc.c
@@ -168,29 +168,32 @@ static void snd_emu10k1_proc_spdif_read(struct snd_info_entry *entry,
 	struct snd_emu10k1 *emu = entry->private_data;
 	u32 value;
 	u32 value2;
-	u32 rate;
 
 	if (emu->card_capabilities->emu_model) {
-		if (!emu->card_capabilities->no_adat) {
-			snd_emu1010_fpga_read(emu, 0x38, &value);
-			if ((value & 0x1) == 0) {
-				snd_emu1010_fpga_read(emu, 0x2a, &value);
-				snd_emu1010_fpga_read(emu, 0x2b, &value2);
-				rate = 0x1770000 / (((value << 5) | value2)+1);
-				snd_iprintf(buffer, "ADAT Locked : %u\n", rate);
-			} else {
-				snd_iprintf(buffer, "ADAT Unlocked\n");
-			}
-		}
-		snd_emu1010_fpga_read(emu, 0x20, &value);
-		if ((value & 0x4) == 0) {
-			snd_emu1010_fpga_read(emu, 0x28, &value);
-			snd_emu1010_fpga_read(emu, 0x29, &value2);
-			rate = 0x1770000 / (((value << 5) | value2)+1);	
-			snd_iprintf(buffer, "SPDIF Locked : %d\n", rate);
-		} else {
-			snd_iprintf(buffer, "SPDIF Unlocked\n");
+		// This represents the S/PDIF lock status on 0404b, which is
+		// kinda weird and unhelpful, because monitoring it via IRQ is
+		// impractical (one gets an IRQ flood as long as it is desynced).
+		snd_emu1010_fpga_read(emu, EMU_HANA_IRQ_STATUS, &value);
+		snd_iprintf(buffer, "Lock status 1: %#x\n", value & 0x10);
+
+		// Bit 0x1 in LO being 0 is supposedly for ADAT lock.
+		// The registers are always all zero on 0404b.
+		snd_emu1010_fpga_read(emu, EMU_HANA_LOCK_STS_LO, &value);
+		snd_emu1010_fpga_read(emu, EMU_HANA_LOCK_STS_HI, &value2);
+		snd_iprintf(buffer, "Lock status 2: %#x %#x\n", value, value2);
+
+		snd_iprintf(buffer, "S/PDIF rate: %dHz\n",
+			    snd_emu1010_get_raw_rate(emu, EMU_HANA_WCLOCK_HANA_SPDIF_IN));
+		if (emu->card_capabilities->emu_model != EMU_MODEL_EMU0404) {
+			snd_iprintf(buffer, "ADAT rate: %dHz\n",
+				    snd_emu1010_get_raw_rate(emu, EMU_HANA_WCLOCK_HANA_ADAT_IN));
+			snd_iprintf(buffer, "Dock rate: %dHz\n",
+				    snd_emu1010_get_raw_rate(emu, EMU_HANA_WCLOCK_2ND_HANA));
 		}
+		if (emu->card_capabilities->emu_model == EMU_MODEL_EMU0404 ||
+		    emu->card_capabilities->emu_model == EMU_MODEL_EMU1010)
+			snd_iprintf(buffer, "BNC rate: %dHz\n",
+				    snd_emu1010_get_raw_rate(emu, EMU_HANA_WCLOCK_SYNC_BNC));
 	} else {
 		snd_emu10k1_proc_spdif_status(emu, buffer, "CD-ROM S/PDIF In", CDCS, CDSRCS);
 		snd_emu10k1_proc_spdif_status(emu, buffer, "Optical or Coax S/PDIF In", GPSCS, GPSRCS);
diff --git a/sound/pci/emu10k1/io.c b/sound/pci/emu10k1/io.c
index e7a44443023a..a0d66ce3ee83 100644
--- a/sound/pci/emu10k1/io.c
+++ b/sound/pci/emu10k1/io.c
@@ -357,21 +357,70 @@ u32 snd_emu1010_fpga_link_dst_src_read(struct snd_emu10k1 *emu, u32 dst)
 	return (hi << 8) | lo;
 }
 
+int snd_emu1010_get_raw_rate(struct snd_emu10k1 *emu, u8 src)
+{
+	u32 reg_lo, reg_hi, value, value2;
+
+	switch (src) {
+	case EMU_HANA_WCLOCK_HANA_SPDIF_IN:
+		snd_emu1010_fpga_read(emu, EMU_HANA_SPDIF_MODE, &value);
+		if (value & EMU_HANA_SPDIF_MODE_RX_INVALID)
+			return 0;
+		reg_lo = EMU_HANA_WC_SPDIF_LO;
+		reg_hi = EMU_HANA_WC_SPDIF_HI;
+		break;
+	case EMU_HANA_WCLOCK_HANA_ADAT_IN:
+		reg_lo = EMU_HANA_WC_ADAT_LO;
+		reg_hi = EMU_HANA_WC_ADAT_HI;
+		break;
+	case EMU_HANA_WCLOCK_SYNC_BNC:
+		reg_lo = EMU_HANA_WC_BNC_LO;
+		reg_hi = EMU_HANA_WC_BNC_HI;
+		break;
+	case EMU_HANA_WCLOCK_2ND_HANA:
+		reg_lo = EMU_HANA2_WC_SPDIF_LO;
+		reg_hi = EMU_HANA2_WC_SPDIF_HI;
+		break;
+	default:
+		return 0;
+	}
+	snd_emu1010_fpga_read(emu, reg_hi, &value);
+	snd_emu1010_fpga_read(emu, reg_lo, &value2);
+	// FIXME: The /4 is valid for 0404b, but contradicts all other info.
+	return 0x1770000 / 4 / (((value << 5) | value2) + 1);
+}
+
 void snd_emu1010_update_clock(struct snd_emu10k1 *emu)
 {
+	int clock;
 	u32 leds;
 
 	switch (emu->emu1010.wclock) {
 	case EMU_HANA_WCLOCK_INT_44_1K | EMU_HANA_WCLOCK_1X:
+		clock = 44100;
 		leds = EMU_HANA_DOCK_LEDS_2_44K;
 		break;
 	case EMU_HANA_WCLOCK_INT_48K | EMU_HANA_WCLOCK_1X:
+		clock = 48000;
 		leds = EMU_HANA_DOCK_LEDS_2_48K;
 		break;
 	default:
-		leds = EMU_HANA_DOCK_LEDS_2_EXT;
+		clock = snd_emu1010_get_raw_rate(
+				emu, emu->emu1010.wclock & EMU_HANA_WCLOCK_SRC_MASK);
+		// The raw rate reading is rather coarse (it cannot accurately
+		// represent 44.1 kHz) and fluctuates slightly. Luckily, the
+		// clock comes from digital inputs, which use standardized rates.
+		// So we round to the closest standard rate and ignore discrepancies.
+		if (clock < 46000) {
+			clock = 44100;
+			leds = EMU_HANA_DOCK_LEDS_2_EXT | EMU_HANA_DOCK_LEDS_2_44K;
+		} else {
+			clock = 48000;
+			leds = EMU_HANA_DOCK_LEDS_2_EXT | EMU_HANA_DOCK_LEDS_2_48K;
+		}
 		break;
 	}
+	emu->emu1010.word_clock = clock;
 
 	// FIXME: this should probably represent the AND of all currently
 	// used sources' lock status. But we don't know how to get that ...
-- 
2.40.0.152.g15d061e6df

