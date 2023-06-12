Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D01E72CF29
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 21:15:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B9421F1;
	Mon, 12 Jun 2023 21:14:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B9421F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686597331;
	bh=DMdUTG3DzHj//2G4BscdtSUqVm5TzJuP222X7eJf/t8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AC97FNAtRYWNiGcF5g03gJJ1fo+Hrzf+gyRHW3DBrRDU/JK84k098uS/YMXqlS7sm
	 5Bu23Wqz1DF3g8SPPCXJvgd+gtNeTkTPuIeV0/FbcbnqQRTGiGYI6cpAd0yqAQmSsz
	 fsjoEi36zqZ4n34udkwblOrVK6YNtYWP70AMzk4M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73DCAF8057E; Mon, 12 Jun 2023 21:13:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3B27F80570;
	Mon, 12 Jun 2023 21:13:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B4F0F80548; Mon, 12 Jun 2023 21:13:42 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A8C89F800ED
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 21:13:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8C89F800ED
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id D001E24184;
	Mon, 12 Jun 2023 15:13:25 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q8myj-WJx-00; Mon, 12 Jun 2023 21:13:25 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 2/9] ALSA: emu10k1: make available E-MU clock sources
 card-specific
Date: Mon, 12 Jun 2023 21:13:18 +0200
Message-Id: <20230612191325.1315854-3-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230612191325.1315854-1-oswald.buddenhagen@gmx.de>
References: <20230612191325.1315854-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FIPJRIPPKOBZEE2IGU4YDZQQMDULXIXR
X-Message-ID-Hash: FIPJRIPPKOBZEE2IGU4YDZQQMDULXIXR
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The actually available clock sources depend on the available audio input
ports and dedicated clock input ports.

This includes refactoring the code to be data-driven to remain
manageable.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h          |   2 +
 sound/pci/emu10k1/emu10k1_main.c |   4 +-
 sound/pci/emu10k1/emumixer.c     | 153 ++++++++++++++++---------------
 sound/pci/emu10k1/io.c           |  23 +++++
 4 files changed, 107 insertions(+), 75 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 59e79ea1f75e..703ef441bb2a 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1668,6 +1668,7 @@ struct snd_emu1010 {
 	unsigned char input_source[NUM_INPUT_DESTS];
 	unsigned int adc_pads; /* bit mask */
 	unsigned int dac_pads; /* bit mask */
+	unsigned int wclock;  /* Cached register value */
 	unsigned int clock_source;
 	unsigned int clock_fallback;
 	unsigned int optical_in; /* 0:SPDIF, 1:ADAT */
@@ -1824,6 +1825,7 @@ void snd_emu1010_fpga_write(struct snd_emu10k1 *emu, u32 reg, u32 value);
 void snd_emu1010_fpga_read(struct snd_emu10k1 *emu, u32 reg, u32 *value);
 void snd_emu1010_fpga_link_dst_src_write(struct snd_emu10k1 *emu, u32 dst, u32 src);
 u32 snd_emu1010_fpga_link_dst_src_read(struct snd_emu10k1 *emu, u32 dst);
+void snd_emu1010_update_clock(struct snd_emu10k1 *emu);
 unsigned int snd_emu10k1_efx_read(struct snd_emu10k1 *emu, unsigned int pc);
 void snd_emu10k1_intr_enable(struct snd_emu10k1 *emu, unsigned int intrenb);
 void snd_emu10k1_intr_disable(struct snd_emu10k1 *emu, unsigned int intrenb);
diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index 2aa11d70e285..58ed72de6403 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -905,10 +905,10 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k1 *emu)
 	/* Default WCLK set to 48kHz. */
 	snd_emu1010_fpga_write(emu, EMU_HANA_DEFCLOCK, EMU_HANA_DEFCLOCK_48K);
 	/* Word Clock source, Internal 48kHz x1 */
+	emu->emu1010.wclock = EMU_HANA_WCLOCK_INT_48K;
 	snd_emu1010_fpga_write(emu, EMU_HANA_WCLOCK, EMU_HANA_WCLOCK_INT_48K);
 	/* snd_emu1010_fpga_write(emu, EMU_HANA_WCLOCK, EMU_HANA_WCLOCK_INT_48K | EMU_HANA_WCLOCK_4X); */
-	/* Audio Dock LEDs. */
-	snd_emu1010_fpga_write(emu, EMU_HANA_DOCK_LEDS_2, EMU_HANA_DOCK_LEDS_2_LOCK | EMU_HANA_DOCK_LEDS_2_48K);
+	snd_emu1010_update_clock(emu);
 
 	// The routes are all set to EMU_SRC_SILENCE due to the reset,
 	// so it is safe to simply enable the outputs.
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 5b50d9c07a60..f9500cd50a4b 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -887,15 +887,79 @@ static const struct snd_emu1010_pads_info emu1010_pads_info[] = {
 	},
 };
 
+static const char * const emu1010_clock_texts[] = {
+	"44100", "48000", "SPDIF", "ADAT", "Dock", "BNC"
+};
+
+static const u8 emu1010_clock_vals[] = {
+	EMU_HANA_WCLOCK_INT_44_1K,
+	EMU_HANA_WCLOCK_INT_48K,
+	EMU_HANA_WCLOCK_HANA_SPDIF_IN,
+	EMU_HANA_WCLOCK_HANA_ADAT_IN,
+	EMU_HANA_WCLOCK_2ND_HANA,
+	EMU_HANA_WCLOCK_SYNC_BNC,
+};
+
+static const char * const emu0404_clock_texts[] = {
+	"44100", "48000", "SPDIF", "BNC"
+};
+
+static const u8 emu0404_clock_vals[] = {
+	EMU_HANA_WCLOCK_INT_44_1K,
+	EMU_HANA_WCLOCK_INT_48K,
+	EMU_HANA_WCLOCK_HANA_SPDIF_IN,
+	EMU_HANA_WCLOCK_SYNC_BNC,
+};
+
+struct snd_emu1010_clock_info {
+	const char * const *texts;
+	const u8 *vals;
+	unsigned num;
+};
+
+static const struct snd_emu1010_clock_info emu1010_clock_info[] = {
+	{
+		// rev1 1010
+		.texts = emu1010_clock_texts,
+		.vals = emu1010_clock_vals,
+		.num = ARRAY_SIZE(emu1010_clock_vals),
+	},
+	{
+		// rev2 1010
+		.texts = emu1010_clock_texts,
+		.vals = emu1010_clock_vals,
+		.num = ARRAY_SIZE(emu1010_clock_vals) - 1,
+	},
+	{
+		// 1616(m) CardBus
+		.texts = emu1010_clock_texts,
+		// TODO: determine what is actually available.
+		// Pedantically, *every* source comes from the 2nd FPGA, as the
+		// card itself has no own (digital) audio ports. The user manual
+		// claims that ADAT and S/PDIF clock sources are separate, which
+		// can mean two things: either E-MU mapped the dock's sources to
+		// the primary ones, or they determine the meaning of the "Dock"
+		// source depending on how the ports are actually configured
+		// (which the 2nd FPGA must be doing anyway).
+		.vals = emu1010_clock_vals,
+		.num = ARRAY_SIZE(emu1010_clock_vals),
+	},
+	{
+		// 0404
+		.texts = emu0404_clock_texts,
+		.vals = emu0404_clock_vals,
+		.num = ARRAY_SIZE(emu0404_clock_vals),
+	},
+};
 
 static int snd_emu1010_clock_source_info(struct snd_kcontrol *kcontrol,
 					  struct snd_ctl_elem_info *uinfo)
 {
-	static const char * const texts[4] = {
-		"44100", "48000", "SPDIF", "ADAT"
-	};
+	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
+	const struct snd_emu1010_clock_info *emu_ci =
+		&emu1010_clock_info[emu1010_idx(emu)];
 		
-	return snd_ctl_enum_info(uinfo, 1, 4, texts);
+	return snd_ctl_enum_info(uinfo, 1, emu_ci->num, emu_ci->texts);
 }
 
 static int snd_emu1010_clock_source_get(struct snd_kcontrol *kcontrol,
@@ -911,84 +975,27 @@ static int snd_emu1010_clock_source_put(struct snd_kcontrol *kcontrol,
 					struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
+	const struct snd_emu1010_clock_info *emu_ci =
+		&emu1010_clock_info[emu1010_idx(emu)];
 	unsigned int val;
 	int change = 0;
 
 	val = ucontrol->value.enumerated.item[0] ;
-	/* Limit: uinfo->value.enumerated.items = 4; */
-	if (val >= 4)
+	if (val >= emu_ci->num)
 		return -EINVAL;
 	change = (emu->emu1010.clock_source != val);
 	if (change) {
 		emu->emu1010.clock_source = val;
-		switch (val) {
-		case 0:
-			/* 44100 */
-			/* Mute all */
-			snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, EMU_MUTE );
-			/* Word Clock source, Internal 44.1kHz x1 */
-			snd_emu1010_fpga_write(emu, EMU_HANA_WCLOCK,
-			EMU_HANA_WCLOCK_INT_44_1K | EMU_HANA_WCLOCK_1X );
-			/* Set LEDs on Audio Dock */
-			snd_emu1010_fpga_write(emu, EMU_HANA_DOCK_LEDS_2,
-				EMU_HANA_DOCK_LEDS_2_44K | EMU_HANA_DOCK_LEDS_2_LOCK );
-			/* Allow DLL to settle */
-			msleep(10);
-			/* Unmute all */
-			snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, EMU_UNMUTE );
-			break;
-		case 1:
-			/* 48000 */
-			/* Mute all */
-			snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, EMU_MUTE );
-			/* Word Clock source, Internal 48kHz x1 */
-			snd_emu1010_fpga_write(emu, EMU_HANA_WCLOCK,
-				EMU_HANA_WCLOCK_INT_48K | EMU_HANA_WCLOCK_1X );
-			/* Set LEDs on Audio Dock */
-			snd_emu1010_fpga_write(emu, EMU_HANA_DOCK_LEDS_2,
-				EMU_HANA_DOCK_LEDS_2_48K | EMU_HANA_DOCK_LEDS_2_LOCK );
-			/* Allow DLL to settle */
-			msleep(10);
-			/* Unmute all */
-			snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, EMU_UNMUTE );
-			break;
-			
-		case 2: /* Take clock from S/PDIF IN */
-			/* Mute all */
-			snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, EMU_MUTE );
-			/* Word Clock source, sync to S/PDIF input */
-			snd_emu1010_fpga_write(emu, EMU_HANA_WCLOCK,
-				EMU_HANA_WCLOCK_HANA_SPDIF_IN | EMU_HANA_WCLOCK_1X );
-			/* Set LEDs on Audio Dock */
-			snd_emu1010_fpga_write(emu, EMU_HANA_DOCK_LEDS_2,
-				EMU_HANA_DOCK_LEDS_2_EXT | EMU_HANA_DOCK_LEDS_2_LOCK );
-			/* FIXME: We should set EMU_HANA_DOCK_LEDS_2_LOCK only when clock signal is present and valid */	
-			/* Allow DLL to settle */
-			msleep(10);
-			/* Unmute all */
-			snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, EMU_UNMUTE );
-			break;
-		
-		case 3: 			
-			/* Take clock from ADAT IN */
-			/* Mute all */
-			snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, EMU_MUTE );
-			/* Word Clock source, sync to ADAT input */
-			snd_emu1010_fpga_write(emu, EMU_HANA_WCLOCK,
-				EMU_HANA_WCLOCK_HANA_ADAT_IN | EMU_HANA_WCLOCK_1X );
-			/* Set LEDs on Audio Dock */
-			snd_emu1010_fpga_write(emu, EMU_HANA_DOCK_LEDS_2, EMU_HANA_DOCK_LEDS_2_EXT | EMU_HANA_DOCK_LEDS_2_LOCK );
-			/* FIXME: We should set EMU_HANA_DOCK_LEDS_2_LOCK only when clock signal is present and valid */	
-			/* Allow DLL to settle */
-			msleep(10);
-			/*   Unmute all */
-			snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, EMU_UNMUTE );
-			 
-			
-			break;		
-		}
+		emu->emu1010.wclock = emu_ci->vals[val];
+
+		snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, EMU_MUTE);
+		snd_emu1010_fpga_write(emu, EMU_HANA_WCLOCK, emu->emu1010.wclock);
+		msleep(10);  // Allow DLL to settle
+		snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, EMU_UNMUTE);
+
+		snd_emu1010_update_clock(emu);
 	}
-        return change;
+	return change;
 }
 
 static const struct snd_kcontrol_new snd_emu1010_clock_source =
diff --git a/sound/pci/emu10k1/io.c b/sound/pci/emu10k1/io.c
index abe69ae40499..e7a44443023a 100644
--- a/sound/pci/emu10k1/io.c
+++ b/sound/pci/emu10k1/io.c
@@ -357,6 +357,29 @@ u32 snd_emu1010_fpga_link_dst_src_read(struct snd_emu10k1 *emu, u32 dst)
 	return (hi << 8) | lo;
 }
 
+void snd_emu1010_update_clock(struct snd_emu10k1 *emu)
+{
+	u32 leds;
+
+	switch (emu->emu1010.wclock) {
+	case EMU_HANA_WCLOCK_INT_44_1K | EMU_HANA_WCLOCK_1X:
+		leds = EMU_HANA_DOCK_LEDS_2_44K;
+		break;
+	case EMU_HANA_WCLOCK_INT_48K | EMU_HANA_WCLOCK_1X:
+		leds = EMU_HANA_DOCK_LEDS_2_48K;
+		break;
+	default:
+		leds = EMU_HANA_DOCK_LEDS_2_EXT;
+		break;
+	}
+
+	// FIXME: this should probably represent the AND of all currently
+	// used sources' lock status. But we don't know how to get that ...
+	leds |= EMU_HANA_DOCK_LEDS_2_LOCK;
+
+	snd_emu1010_fpga_write(emu, EMU_HANA_DOCK_LEDS_2, leds);
+}
+
 void snd_emu10k1_intr_enable(struct snd_emu10k1 *emu, unsigned int intrenb)
 {
 	unsigned long flags;
-- 
2.40.0.152.g15d061e6df

