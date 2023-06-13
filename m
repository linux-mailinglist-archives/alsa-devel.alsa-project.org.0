Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1D872DB2E
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 09:41:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 833CD86E;
	Tue, 13 Jun 2023 09:40:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 833CD86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686642071;
	bh=xGvObuvcQVFZkUrxT1PWDFU9Jcoj1LuoPCJ7Ir2iT/w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rbysKO5YoPhR08g/sHOJTIE4xmqNljuGXldNiH7xvdEHHILxkL7/65ckEXbGmH7/f
	 FuT8ucUyCB2X3YfUpO2Vz5nvYTxMAJ4pNmzHvdK8T/jLuh3kAPOgbdXSAgyHiqPSWK
	 ofkJH/eprsDr5K3Ruc9+XSyQ8MyGHyeoUu1FO+7I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AA90F805B1; Tue, 13 Jun 2023 09:39:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91BADF805A1;
	Tue, 13 Jun 2023 09:39:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98006F805B1; Tue, 13 Jun 2023 09:39:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D512DF80301
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 09:38:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D512DF80301
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 926AB24260;
	Tue, 13 Jun 2023 03:38:22 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q8ybe-dRv-00; Tue, 13 Jun 2023 09:38:22 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 6/8] ALSA: emu10k1: add support for 2x/4x word clocks in E-MU
 D.A.S. mode
Date: Tue, 13 Jun 2023 09:38:20 +0200
Message-Id: <20230613073822.1343234-7-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230613073822.1343234-1-oswald.buddenhagen@gmx.de>
References: <20230613073822.1343234-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VQQFOZQUTHHKDXYQ4D6QG6N26DMYYDUX
X-Message-ID-Hash: VQQFOZQUTHHKDXYQ4D6QG6N26DMYYDUX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VQQFOZQUTHHKDXYQ4D6QG6N26DMYYDUX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This lays the groundwork for supporting 88.2/96/176.4/192 kHz rates
without actually doing so yet - we simply multi-feed the same samples
on playback, and throw away the excess ones on capture. Input-to-output
monitoring does actually use the full sample rate, though.

Notably, add_ctls() now uses snd_ctl_add_locked(), so it doesn't
deadlock when called from snd_emu1010_clock_shift_put(). This also
affects the initial creation of the controls, which is OK, as that is
done before the card is registered, so no concurrent access can occur.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h          |   3 +
 sound/pci/emu10k1/emu10k1_main.c |   2 +-
 sound/pci/emu10k1/emumixer.c     | 648 ++++++++++++++++++++++++++++---
 sound/pci/emu10k1/emupcm.c       |  41 +-
 sound/pci/emu10k1/io.c           |  30 +-
 5 files changed, 663 insertions(+), 61 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index cad5faa01c4c..1f827290977f 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1676,6 +1676,8 @@ struct snd_emu1010 {
 	unsigned int word_clock;  /* Cached effective value */
 	unsigned int clock_source;
 	unsigned int clock_fallback;
+	unsigned int clock_shift;  /* EMU_HANA_WCLOCK_MULT_MASK >> 3 */
+	unsigned int clock_users;
 	unsigned int optical_in; /* 0:SPDIF, 1:ADAT */
 	unsigned int optical_out; /* 0:SPDIF, 1:ADAT */
 	struct delayed_work firmware_work;
@@ -1756,6 +1758,7 @@ struct snd_emu10k1 {
 	struct snd_kcontrol *ctl_efx_send_routing;
 	struct snd_kcontrol *ctl_efx_send_volume;
 	struct snd_kcontrol *ctl_efx_attn;
+	struct snd_kcontrol *ctl_clock_shift;
 
 	void (*hwvol_interrupt)(struct snd_emu10k1 *emu, unsigned int status);
 	void (*capture_interrupt)(struct snd_emu10k1 *emu, unsigned int status);
diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index aa28a7524a67..13e9200b8fcb 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -902,12 +902,12 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k1 *emu)
 
 	emu->emu1010.clock_source = 1;  /* 48000 */
 	emu->emu1010.clock_fallback = 1;  /* 48000 */
+	emu->emu1010.clock_shift = 0;  /* 1x */
 	/* Default WCLK set to 48kHz. */
 	snd_emu1010_fpga_write(emu, EMU_HANA_DEFCLOCK, EMU_HANA_DEFCLOCK_48K);
 	/* Word Clock source, Internal 48kHz x1 */
 	emu->emu1010.wclock = EMU_HANA_WCLOCK_INT_48K;
 	snd_emu1010_fpga_write(emu, EMU_HANA_WCLOCK, EMU_HANA_WCLOCK_INT_48K);
-	/* snd_emu1010_fpga_write(emu, EMU_HANA_WCLOCK, EMU_HANA_WCLOCK_INT_48K | EMU_HANA_WCLOCK_4X); */
 	snd_emu1010_update_clock(emu);
 
 	// The routes are all set to EMU_SRC_SILENCE due to the reset,
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 8878b660ba94..844ccf3b025c 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -39,7 +39,7 @@ static int add_ctls(struct snd_emu10k1 *emu, const struct snd_kcontrol_new *tpl,
 	for (unsigned i = 0; i < nctls; i++) {
 		kctl.name = ctls[i];
 		kctl.private_value = i;
-		err = snd_ctl_add(emu->card, snd_ctl_new1(&kctl, emu));
+		err = snd_ctl_add_locked(emu->card, snd_ctl_new1(&kctl, emu));
 		if (err < 0)
 			return err;
 	}
@@ -87,15 +87,35 @@ static int snd_emu10k1_spdif_get_mask(struct snd_kcontrol *kcontrol,
 	pfx "ADAT 0" sfx, pfx "ADAT 1" sfx, pfx "ADAT 2" sfx, pfx "ADAT 3" sfx, \
 	pfx "ADAT 4" sfx, pfx "ADAT 5" sfx, pfx "ADAT 6" sfx, pfx "ADAT 7" sfx
 
+#define ADAT_2x_PS(pfx, sfx) \
+	pfx "ADAT 0-1" sfx, pfx "ADAT 2-3" sfx, pfx "ADAT 4-5" sfx, pfx "ADAT 6-7" sfx
+
+#define ADAT_4x_PS(pfx, sfx) \
+	pfx "ADAT 0-3" sfx, pfx "ADAT 4-7" sfx
+
 #define PAIR_REGS(base, one, two) \
 	base ## one ## 1, \
 	base ## two ## 1
+#define PAIR_2x_REGS(base, one, two) \
+	{ base ## one ## 1, base ## one ## 2 }, \
+	{ base ## two ## 1, base ## two ## 2 }
+#define PAIR_4x_REGS(base, one, two) \
+	{ base ## one ## 1, base ## one ## 2, base ## one ## 3, base ## one ## 4 }, \
+	{ base ## two ## 1, base ## two ## 2, base ## two ## 3, base ## two ## 4 }
 
 #define LR_REGS(base) PAIR_REGS(base, _LEFT, _RIGHT)
+#define LR_2x_REGS(base) PAIR_2x_REGS(base, _LEFT, _RIGHT)
+#define LR_4x_REGS(base) PAIR_4x_REGS(base, _LEFT, _RIGHT)
 
 #define ADAT_REGS(base) \
 	base+0, base+1, base+2, base+3, base+4, base+5, base+6, base+7
 
+#define ADAT_2x_REGS(base) \
+	{ base+0, base+1 }, { base+2, base+3 }, { base+4, base+5 }, { base+6, base+7 }
+
+#define ADAT_4x_REGS(base) \
+	{ base+0, base+1, base+2, base+3 }, { base+4, base+5, base+6, base+7 }
+
 /*
  * List of data sources available for each destination
  */
@@ -112,9 +132,16 @@ static int snd_emu10k1_spdif_get_mask(struct snd_kcontrol *kcontrol,
 	"PbChn 08", "PbChn 09", "PbChn 10", "PbChn 11", \
 	"PbChn 12", "PbChn 13", "PbChn 14", "PbChn 15"
 
+#define PB_4x_TEXTS PB_TEXTS  // Only 1x playback for now
+
 #define PAIR_TEXTS(base, one, two) PAIR_PS(base, one, two, "")
 #define LR_TEXTS(base) LR_PS(base, "")
 #define ADAT_TEXTS(pfx) ADAT_PS(pfx, "")
+#define ADAT_2x_TEXTS(pfx) ADAT_2x_PS(pfx, "")
+#define ADAT_4x_TEXTS(pfx) ADAT_4x_PS(pfx, "")
+
+#define SRC_SILENCE_2x { EMU_SRC_SILENCE, EMU_SRC_SILENCE }
+#define SRC_SILENCE_4x { EMU_SRC_SILENCE, EMU_SRC_SILENCE, EMU_SRC_SILENCE, EMU_SRC_SILENCE }
 
 #define EMU32_SRC_REGS \
 	EMU_SRC_ALICE_EMU32A, \
@@ -150,6 +177,27 @@ static int snd_emu10k1_spdif_get_mask(struct snd_kcontrol *kcontrol,
 	EMU_SRC_ALICE_EMU32B+0xe, \
 	EMU_SRC_ALICE_EMU32B+0xf
 
+// Only 1x playback for now
+#define EMU32_2x_SRC_REGS \
+	{ EMU_SRC_ALICE_EMU32A }, \
+	{ EMU_SRC_ALICE_EMU32A+1 }, \
+	{ EMU_SRC_ALICE_EMU32A+2 }, \
+	{ EMU_SRC_ALICE_EMU32A+3 }, \
+	{ EMU_SRC_ALICE_EMU32A+4 }, \
+	{ EMU_SRC_ALICE_EMU32A+5 }, \
+	{ EMU_SRC_ALICE_EMU32A+6 }, \
+	{ EMU_SRC_ALICE_EMU32A+7 }, \
+	{ EMU_SRC_ALICE_EMU32A+8 }, \
+	{ EMU_SRC_ALICE_EMU32A+9 }, \
+	{ EMU_SRC_ALICE_EMU32A+0xa }, \
+	{ EMU_SRC_ALICE_EMU32A+0xb }, \
+	{ EMU_SRC_ALICE_EMU32A+0xc }, \
+	{ EMU_SRC_ALICE_EMU32A+0xd }, \
+	{ EMU_SRC_ALICE_EMU32A+0xe }, \
+	{ EMU_SRC_ALICE_EMU32A+0xf }
+
+#define EMU32_4x_SRC_REGS EMU32_2x_SRC_REGS
+
 /* 1010 rev1 */
 
 #define EMU1010_COMMON_TEXTS \
@@ -185,6 +233,54 @@ static const unsigned short emu1010_src_regs[] = {
 };
 static_assert(ARRAY_SIZE(emu1010_src_regs) == ARRAY_SIZE(emu1010_src_texts));
 
+static const char * const emu1010_2x_src_texts[] = {
+	"Silence",
+	PAIR_TEXTS("Dock Mic", "A", "B"),
+	LR_TEXTS("Dock ADC1"),
+	LR_TEXTS("Dock ADC2"),
+	LR_TEXTS("Dock ADC3"),
+	LR_TEXTS("0202 ADC"),
+	LR_TEXTS("1010 SPDIF"),
+	ADAT_2x_TEXTS("1010 "),
+	PB_TEXTS,
+};
+
+static const unsigned short emu1010_2x_src_regs[][2] = {
+	SRC_SILENCE_2x,
+	PAIR_2x_REGS(EMU_SRC_DOCK_MIC, _A, _B),
+	LR_2x_REGS(EMU_SRC_DOCK_ADC1),
+	LR_2x_REGS(EMU_SRC_DOCK_ADC2),
+	LR_2x_REGS(EMU_SRC_DOCK_ADC3),
+	LR_2x_REGS(EMU_SRC_HAMOA_ADC),
+	LR_2x_REGS(EMU_SRC_HANA_SPDIF),
+	ADAT_2x_REGS(EMU_SRC_HANA_ADAT),
+	EMU32_2x_SRC_REGS,
+};
+static_assert(ARRAY_SIZE(emu1010_2x_src_regs) == ARRAY_SIZE(emu1010_2x_src_texts));
+
+static const char * const emu1010_4x_src_texts[] = {
+	"Silence",
+	PAIR_TEXTS("Dock Mic", "A", "B"),
+	LR_TEXTS("Dock ADC1"),
+	LR_TEXTS("Dock ADC2"),
+	LR_TEXTS("Dock ADC3"),
+	LR_TEXTS("0202 ADC"),
+	ADAT_4x_TEXTS("1010 "),
+	PB_4x_TEXTS,
+};
+
+static const unsigned short emu1010_4x_src_regs[][4] = {
+	SRC_SILENCE_4x,
+	PAIR_4x_REGS(EMU_SRC_DOCK_MIC, _A, _B),
+	LR_4x_REGS(EMU_SRC_DOCK_ADC1),
+	LR_4x_REGS(EMU_SRC_DOCK_ADC2),
+	LR_4x_REGS(EMU_SRC_DOCK_ADC3),
+	LR_4x_REGS(EMU_SRC_HAMOA_ADC),
+	ADAT_4x_REGS(EMU_SRC_HANA_ADAT),
+	EMU32_4x_SRC_REGS,
+};
+static_assert(ARRAY_SIZE(emu1010_4x_src_regs) == ARRAY_SIZE(emu1010_4x_src_texts));
+
 /* 1010 rev2 */
 
 #define EMU1010b_COMMON_TEXTS \
@@ -222,6 +318,58 @@ static const unsigned short emu1010b_src_regs[] = {
 };
 static_assert(ARRAY_SIZE(emu1010b_src_regs) == ARRAY_SIZE(emu1010b_src_texts));
 
+static const char * const emu1010b_2x_src_texts[] = {
+	"Silence",
+	PAIR_TEXTS("Dock Mic", "A", "B"),
+	LR_TEXTS("Dock ADC1"),
+	LR_TEXTS("Dock ADC2"),
+	LR_TEXTS("0202 ADC"),
+	LR_TEXTS("Dock SPDIF"),
+	LR_TEXTS("1010 SPDIF"),
+	ADAT_2x_TEXTS("Dock "),
+	ADAT_2x_TEXTS("1010 "),
+	PB_TEXTS,
+};
+
+static const unsigned short emu1010b_2x_src_regs[][2] = {
+	SRC_SILENCE_2x,
+	PAIR_2x_REGS(EMU_SRC_DOCK_MIC, _A, _B),
+	LR_2x_REGS(EMU_SRC_DOCK_ADC1),
+	LR_2x_REGS(EMU_SRC_DOCK_ADC2),
+	LR_2x_REGS(EMU_SRC_HAMOA_ADC),
+	LR_2x_REGS(EMU_SRC_MDOCK_SPDIF),
+	LR_2x_REGS(EMU_SRC_HANA_SPDIF),
+	ADAT_2x_REGS(EMU_SRC_MDOCK_ADAT),
+	ADAT_2x_REGS(EMU_SRC_HANA_ADAT),
+	EMU32_2x_SRC_REGS,
+};
+static_assert(ARRAY_SIZE(emu1010b_2x_src_regs) == ARRAY_SIZE(emu1010b_2x_src_texts));
+
+static const char * const emu1010b_4x_src_texts[] = {
+	"Silence",
+	PAIR_TEXTS("Dock Mic", "A", "B"),
+	LR_TEXTS("Dock ADC1"),
+	LR_TEXTS("Dock ADC2"),
+	LR_TEXTS("0202 ADC"),
+	LR_TEXTS("1010 SPDIF"),
+	ADAT_4x_TEXTS("Dock "),
+	ADAT_4x_TEXTS("1010 "),
+	PB_4x_TEXTS,
+};
+
+static const unsigned short emu1010b_4x_src_regs[][4] = {
+	SRC_SILENCE_4x,
+	PAIR_4x_REGS(EMU_SRC_DOCK_MIC, _A, _B),
+	LR_4x_REGS(EMU_SRC_DOCK_ADC1),
+	LR_4x_REGS(EMU_SRC_DOCK_ADC2),
+	LR_4x_REGS(EMU_SRC_HAMOA_ADC),
+	LR_4x_REGS(EMU_SRC_HANA_SPDIF),
+	ADAT_4x_REGS(EMU_SRC_MDOCK_ADAT),
+	ADAT_4x_REGS(EMU_SRC_HANA_ADAT),
+	EMU32_4x_SRC_REGS,
+};
+static_assert(ARRAY_SIZE(emu1010b_4x_src_regs) == ARRAY_SIZE(emu1010b_4x_src_texts));
+
 /* 1616(m) cardbus */
 
 #define EMU1616_COMMON_TEXTS \
@@ -253,6 +401,46 @@ static const unsigned short emu1616_src_regs[] = {
 };
 static_assert(ARRAY_SIZE(emu1616_src_regs) == ARRAY_SIZE(emu1616_src_texts));
 
+static const char * const emu1616_2x_src_texts[] = {
+	"Silence",
+	PAIR_TEXTS("Mic", "A", "B"),
+	LR_TEXTS("ADC1"),
+	LR_TEXTS("ADC2"),
+	LR_TEXTS("SPDIF"),
+	ADAT_2x_TEXTS(""),
+	PB_TEXTS,
+};
+
+static const unsigned short emu1616_2x_src_regs[][2] = {
+	SRC_SILENCE_2x,
+	PAIR_2x_REGS(EMU_SRC_DOCK_MIC, _A, _B),
+	LR_2x_REGS(EMU_SRC_DOCK_ADC1),
+	LR_2x_REGS(EMU_SRC_DOCK_ADC2),
+	LR_2x_REGS(EMU_SRC_MDOCK_SPDIF),
+	ADAT_2x_REGS(EMU_SRC_MDOCK_ADAT),
+	EMU32_2x_SRC_REGS,
+};
+static_assert(ARRAY_SIZE(emu1616_2x_src_regs) == ARRAY_SIZE(emu1616_2x_src_texts));
+
+static const char * const emu1616_4x_src_texts[] = {
+	"Silence",
+	PAIR_TEXTS("Mic", "A", "B"),
+	LR_TEXTS("ADC1"),
+	LR_TEXTS("ADC2"),
+	ADAT_4x_TEXTS(""),
+	PB_4x_TEXTS,
+};
+
+static const unsigned short emu1616_4x_src_regs[][4] = {
+	SRC_SILENCE_4x,
+	PAIR_4x_REGS(EMU_SRC_DOCK_MIC, _A, _B),
+	LR_4x_REGS(EMU_SRC_DOCK_ADC1),
+	LR_4x_REGS(EMU_SRC_DOCK_ADC2),
+	ADAT_4x_REGS(EMU_SRC_MDOCK_ADAT),
+	EMU32_4x_SRC_REGS,
+};
+static_assert(ARRAY_SIZE(emu1616_4x_src_regs) == ARRAY_SIZE(emu1616_4x_src_texts));
+
 /* 0404 rev1 & rev2 */
 
 #define EMU0404_COMMON_TEXTS \
@@ -278,13 +466,36 @@ static const unsigned short emu0404_src_regs[] = {
 };
 static_assert(ARRAY_SIZE(emu0404_src_regs) == ARRAY_SIZE(emu0404_src_texts));
 
+static const unsigned short emu0404_2x_src_regs[][2] = {
+	SRC_SILENCE_2x,
+	LR_2x_REGS(EMU_SRC_HAMOA_ADC),
+	LR_2x_REGS(EMU_SRC_HANA_SPDIF),
+	EMU32_2x_SRC_REGS,
+};
+static_assert(ARRAY_SIZE(emu0404_2x_src_regs) == ARRAY_SIZE(emu0404_das_src_texts));
+
+static const char * const emu0404_4x_src_texts[] = {
+	"Silence",
+	LR_TEXTS("ADC"),
+	PB_4x_TEXTS,
+};
+
+static const unsigned short emu0404_4x_src_regs[][4] = {
+	SRC_SILENCE_4x,
+	LR_4x_REGS(EMU_SRC_HAMOA_ADC),
+	EMU32_4x_SRC_REGS,
+};
+static_assert(ARRAY_SIZE(emu0404_4x_src_regs) == ARRAY_SIZE(emu0404_4x_src_texts));
+
 /*
  * Data destinations - physical EMU outputs.
  * Each destination has an enum mixer control to choose a data source
  */
 
 #define LR_CTLS(base) LR_PS(base, " Playback Enum")
 #define ADAT_CTLS(pfx) ADAT_PS(pfx, " Playback Enum")
+#define ADAT_2x_CTLS(pfx) ADAT_2x_PS(pfx, " Playback Enum")
+#define ADAT_4x_CTLS(pfx) ADAT_4x_PS(pfx, " Playback Enum")
 
 /* 1010 rev1 */
 
@@ -328,6 +539,52 @@ static const unsigned short emu1010_output_dflt[] = {
 };
 static_assert(ARRAY_SIZE(emu1010_output_dflt) == ARRAY_SIZE(emu1010_output_dst));
 
+static const char * const emu1010_2x_output_texts[] = {
+	LR_CTLS("Dock DAC1"),
+	LR_CTLS("Dock DAC2"),
+	LR_CTLS("Dock DAC3"),
+	LR_CTLS("Dock DAC4"),
+	LR_CTLS("Dock Phones"),
+	LR_CTLS("Dock SPDIF"),
+	LR_CTLS("0202 DAC"),
+	LR_CTLS("1010 SPDIF"),
+	ADAT_2x_CTLS("1010 "),
+};
+static_assert(ARRAY_SIZE(emu1010_2x_output_texts) <= NUM_OUTPUT_DESTS);
+
+static const unsigned short emu1010_2x_output_dst[][2] = {
+	LR_2x_REGS(EMU_DST_DOCK_DAC1),
+	LR_2x_REGS(EMU_DST_DOCK_DAC2),
+	LR_2x_REGS(EMU_DST_DOCK_DAC3),
+	LR_2x_REGS(EMU_DST_DOCK_DAC4),
+	LR_2x_REGS(EMU_DST_DOCK_PHONES),
+	LR_2x_REGS(EMU_DST_DOCK_SPDIF),
+	LR_2x_REGS(EMU_DST_HAMOA_DAC),
+	LR_2x_REGS(EMU_DST_HANA_SPDIF),
+	ADAT_2x_REGS(EMU_DST_HANA_ADAT),
+};
+static_assert(ARRAY_SIZE(emu1010_2x_output_dst) == ARRAY_SIZE(emu1010_2x_output_texts));
+
+static const char * const emu1010_4x_output_texts[] = {
+	LR_CTLS("Dock DAC1"),
+	LR_CTLS("Dock DAC2"),
+	LR_CTLS("Dock DAC3"),
+	LR_CTLS("Dock DAC4"),
+	LR_CTLS("0202 DAC"),
+	ADAT_4x_CTLS("1010 "),
+};
+static_assert(ARRAY_SIZE(emu1010_4x_output_texts) <= NUM_OUTPUT_DESTS);
+
+static const unsigned short emu1010_4x_output_dst[][4] = {
+	LR_4x_REGS(EMU_DST_DOCK_DAC1),
+	LR_4x_REGS(EMU_DST_DOCK_DAC2),
+	LR_4x_REGS(EMU_DST_DOCK_DAC3),
+	LR_4x_REGS(EMU_DST_DOCK_DAC4),
+	LR_4x_REGS(EMU_DST_HAMOA_DAC),
+	ADAT_4x_REGS(EMU_DST_HANA_ADAT),
+};
+static_assert(ARRAY_SIZE(emu1010_4x_output_dst) == ARRAY_SIZE(emu1010_4x_output_texts));
+
 /* 1010 rev2 */
 
 static const char * const snd_emu1010b_output_texts[] = {
@@ -367,6 +624,52 @@ static const unsigned short emu1010b_output_dflt[] = {
 	EMU_SRC_ALICE_EMU32A+4, EMU_SRC_ALICE_EMU32A+5, EMU_SRC_ALICE_EMU32A+6, EMU_SRC_ALICE_EMU32A+7,
 };
 
+static const char * const snd_emu1010b_2x_output_texts[] = {
+	LR_CTLS("Dock DAC1"),
+	LR_CTLS("Dock DAC2"),
+	LR_CTLS("Dock DAC3"),
+	LR_CTLS("Dock SPDIF"),
+	ADAT_2x_CTLS("Dock "),
+	LR_CTLS("0202 DAC"),
+	LR_CTLS("1010 SPDIF"),
+	ADAT_2x_CTLS("1010 "),
+};
+static_assert(ARRAY_SIZE(snd_emu1010b_2x_output_texts) <= NUM_OUTPUT_DESTS);
+
+static const unsigned short emu1010b_2x_output_dst[][2] = {
+	LR_2x_REGS(EMU_DST_DOCK_DAC1),
+	LR_2x_REGS(EMU_DST_DOCK_DAC2),
+	LR_2x_REGS(EMU_DST_DOCK_DAC3),
+	LR_2x_REGS(EMU_DST_MDOCK_SPDIF),
+	ADAT_2x_REGS(EMU_DST_MDOCK_ADAT),
+	LR_2x_REGS(EMU_DST_HAMOA_DAC),
+	LR_2x_REGS(EMU_DST_HANA_SPDIF),
+	ADAT_2x_REGS(EMU_DST_HANA_ADAT),
+};
+static_assert(ARRAY_SIZE(emu1010b_2x_output_dst) == ARRAY_SIZE(snd_emu1010b_2x_output_texts));
+
+static const char * const snd_emu1010b_4x_output_texts[] = {
+	LR_CTLS("Dock DAC1"),
+	LR_CTLS("Dock DAC2"),
+	LR_CTLS("Dock DAC3"),
+	ADAT_4x_CTLS("Dock "),
+	LR_CTLS("0202 DAC"),
+	LR_CTLS("1010 SPDIF"),
+	ADAT_4x_CTLS("1010 "),
+};
+static_assert(ARRAY_SIZE(snd_emu1010b_4x_output_texts) <= NUM_OUTPUT_DESTS);
+
+static const unsigned short emu1010b_4x_output_dst[][4] = {
+	LR_4x_REGS(EMU_DST_DOCK_DAC1),
+	LR_4x_REGS(EMU_DST_DOCK_DAC2),
+	LR_4x_REGS(EMU_DST_DOCK_DAC3),
+	ADAT_4x_REGS(EMU_DST_MDOCK_ADAT),
+	LR_4x_REGS(EMU_DST_HAMOA_DAC),
+	LR_4x_REGS(EMU_DST_HANA_SPDIF),
+	ADAT_4x_REGS(EMU_DST_HANA_ADAT),
+};
+static_assert(ARRAY_SIZE(emu1010b_4x_output_dst) == ARRAY_SIZE(snd_emu1010b_4x_output_texts));
+
 /* 1616(m) cardbus */
 
 static const char * const snd_emu1616_output_texts[] = {
@@ -400,6 +703,40 @@ static const unsigned short emu1616_output_dflt[] = {
 };
 static_assert(ARRAY_SIZE(emu1616_output_dflt) == ARRAY_SIZE(emu1616_output_dst));
 
+static const char * const snd_emu1616_2x_output_texts[] = {
+	LR_CTLS("Dock DAC1"),
+	LR_CTLS("Dock DAC2"),
+	LR_CTLS("Dock DAC3"),
+	LR_CTLS("Dock SPDIF"),
+	ADAT_2x_CTLS("Dock "),
+};
+static_assert(ARRAY_SIZE(snd_emu1616_2x_output_texts) <= NUM_OUTPUT_DESTS);
+
+static const unsigned short emu1616_2x_output_dst[][2] = {
+	LR_2x_REGS(EMU_DST_DOCK_DAC1),
+	LR_2x_REGS(EMU_DST_DOCK_DAC2),
+	LR_2x_REGS(EMU_DST_DOCK_DAC3),
+	LR_2x_REGS(EMU_DST_MDOCK_SPDIF),
+	ADAT_2x_REGS(EMU_DST_MDOCK_ADAT),
+};
+static_assert(ARRAY_SIZE(emu1616_2x_output_dst) == ARRAY_SIZE(snd_emu1616_2x_output_texts));
+
+static const char * const snd_emu1616_4x_output_texts[] = {
+	LR_CTLS("Dock DAC1"),
+	LR_CTLS("Dock DAC2"),
+	LR_CTLS("Dock DAC3"),
+	ADAT_4x_CTLS("Dock "),
+};
+static_assert(ARRAY_SIZE(snd_emu1616_4x_output_texts) <= NUM_OUTPUT_DESTS);
+
+static const unsigned short emu1616_4x_output_dst[][4] = {
+	LR_4x_REGS(EMU_DST_DOCK_DAC1),
+	LR_4x_REGS(EMU_DST_DOCK_DAC2),
+	LR_4x_REGS(EMU_DST_DOCK_DAC3),
+	ADAT_4x_REGS(EMU_DST_MDOCK_ADAT),
+};
+static_assert(ARRAY_SIZE(emu1616_4x_output_dst) == ARRAY_SIZE(snd_emu1616_4x_output_texts));
+
 /* 0404 rev1 & rev2 */
 
 static const char * const snd_emu0404_output_texts[] = {
@@ -420,6 +757,22 @@ static const unsigned short emu0404_output_dflt[] = {
 };
 static_assert(ARRAY_SIZE(emu0404_output_dflt) == ARRAY_SIZE(emu0404_output_dst));
 
+static const unsigned short emu0404_2x_output_dst[][2] = {
+	LR_2x_REGS(EMU_DST_HAMOA_DAC),
+	LR_2x_REGS(EMU_DST_HANA_SPDIF),
+};
+static_assert(ARRAY_SIZE(emu0404_2x_output_dst) == ARRAY_SIZE(snd_emu0404_output_texts));
+
+static const char * const snd_emu0404_4x_output_texts[] = {
+	LR_CTLS("DAC"),
+};
+static_assert(ARRAY_SIZE(snd_emu0404_4x_output_texts) <= NUM_OUTPUT_DESTS);
+
+static const unsigned short emu0404_4x_output_dst[][4] = {
+	LR_4x_REGS(EMU_DST_HAMOA_DAC),
+};
+static_assert(ARRAY_SIZE(emu0404_4x_output_dst) == ARRAY_SIZE(snd_emu0404_4x_output_texts));
+
 /*
  * Data destinations - FPGA outputs going to Alice2 (Audigy) for
  *   capture (EMU32 + I2S links)
@@ -549,168 +902,267 @@ static const unsigned short emu0404_input_dflt[] = {
 };
 
 struct snd_emu1010_routing_info {
-	const char * const *src_texts[2];
-	const char * const *out_texts;
-	const unsigned short *src_regs;
-	const unsigned short *out_regs;
+	const char * const *src_texts[4];
+	const char * const *out_texts[3];
+	const unsigned short *src_regs[3];
+	const unsigned short *out_regs[3];
 	const unsigned short *in_regs;
 	const unsigned short *out_dflts;
 	const unsigned short *in_dflts;
-	unsigned n_srcs[2];
-	unsigned n_outs;
-	unsigned n_ins[2];
+	unsigned n_srcs[4];
+	unsigned n_outs[3];
+	unsigned n_ins[4];
 };
 
 static const struct snd_emu1010_routing_info emu1010_routing_info[] = {
 	{
 		/* rev1 1010 */
-		.src_regs = emu1010_src_regs,
-		.src_texts = { emu1010_src_texts, emu1010_das_src_texts },
-		.n_srcs = { ARRAY_SIZE(emu1010_src_texts), ARRAY_SIZE(emu1010_das_src_texts) },
+		.src_regs = { emu1010_src_regs, emu1010_2x_src_regs[0], emu1010_4x_src_regs[0] },
+		.src_texts = { emu1010_src_texts, emu1010_das_src_texts,
+			       emu1010_2x_src_texts, emu1010_4x_src_texts },
+		.n_srcs = { ARRAY_SIZE(emu1010_src_texts), ARRAY_SIZE(emu1010_das_src_texts),
+			    ARRAY_SIZE(emu1010_2x_src_texts), ARRAY_SIZE(emu1010_4x_src_texts) },
 
 		.out_dflts = emu1010_output_dflt,
-		.out_regs = emu1010_output_dst,
-		.out_texts = emu1010_output_texts,
-		.n_outs = ARRAY_SIZE(emu1010_output_dst),
+		.out_regs = { emu1010_output_dst, emu1010_2x_output_dst[0], emu1010_4x_output_dst[0] },
+		.out_texts = { emu1010_output_texts,
+			       emu1010_2x_output_texts, emu1010_4x_output_texts },
+		.n_outs = { ARRAY_SIZE(emu1010_output_texts),
+			    ARRAY_SIZE(emu1010_2x_output_texts), ARRAY_SIZE(emu1010_4x_output_texts) },
 
 		.in_dflts = emu1010_input_dflt,
 		.in_regs = emu1010_input_dst,
-		.n_ins = { ARRAY_SIZE(emu1010_input_dst), 16 },
+		.n_ins = { ARRAY_SIZE(emu1010_input_dst), 16, 16, 16 },
 	},
 	{
 		/* rev2 1010 */
-		.src_regs = emu1010b_src_regs,
-		.src_texts = { emu1010b_src_texts, emu1010b_das_src_texts },
-		.n_srcs = { ARRAY_SIZE(emu1010b_src_texts), ARRAY_SIZE(emu1010b_das_src_texts) },
+		.src_regs = { emu1010b_src_regs, emu1010b_2x_src_regs[0], emu1010b_4x_src_regs[0] },
+		.src_texts = { emu1010b_src_texts, emu1010b_das_src_texts,
+			       emu1010b_2x_src_texts, emu1010b_4x_src_texts },
+		.n_srcs = { ARRAY_SIZE(emu1010b_src_texts), ARRAY_SIZE(emu1010b_das_src_texts),
+			    ARRAY_SIZE(emu1010b_2x_src_texts), ARRAY_SIZE(emu1010b_4x_src_texts) },
 
 		.out_dflts = emu1010b_output_dflt,
-		.out_regs = emu1010b_output_dst,
-		.out_texts = snd_emu1010b_output_texts,
-		.n_outs = ARRAY_SIZE(emu1010b_output_dst),
+		.out_regs = { emu1010b_output_dst, emu1010b_2x_output_dst[0], emu1010b_4x_output_dst[0] },
+		.out_texts = { snd_emu1010b_output_texts,
+			       snd_emu1010b_2x_output_texts, snd_emu1010b_4x_output_texts },
+		.n_outs = { ARRAY_SIZE(snd_emu1010b_output_texts),
+			    ARRAY_SIZE(snd_emu1010b_2x_output_texts), ARRAY_SIZE(snd_emu1010b_4x_output_texts) },
 
 		.in_dflts = emu1010_input_dflt,
 		.in_regs = emu1010_input_dst,
-		.n_ins = { ARRAY_SIZE(emu1010_input_dst) - 6, 16 },
+		.n_ins = { ARRAY_SIZE(emu1010_input_dst) - 6, 16, 16, 16 },
 	},
 	{
 		/* 1616(m) cardbus */
-		.src_regs = emu1616_src_regs,
-		.src_texts = { emu1616_src_texts, emu1616_das_src_texts },
-		.n_srcs = { ARRAY_SIZE(emu1616_src_texts), ARRAY_SIZE(emu1616_das_src_texts) },
+		.src_regs = { emu1616_src_regs, emu1616_2x_src_regs[0], emu1616_4x_src_regs[0] },
+		.src_texts = { emu1616_src_texts, emu1616_das_src_texts,
+			       emu1616_2x_src_texts, emu1616_4x_src_texts },
+		.n_srcs = { ARRAY_SIZE(emu1616_src_texts), ARRAY_SIZE(emu1616_das_src_texts),
+			    ARRAY_SIZE(emu1616_2x_src_texts), ARRAY_SIZE(emu1616_4x_src_texts) },
 
 		.out_dflts = emu1616_output_dflt,
-		.out_regs = emu1616_output_dst,
-		.out_texts = snd_emu1616_output_texts,
-		.n_outs = ARRAY_SIZE(emu1616_output_dst),
+		.out_regs = { emu1616_output_dst, emu1616_2x_output_dst[0], emu1616_4x_output_dst[0] },
+		.out_texts = { snd_emu1616_output_texts,
+			       snd_emu1616_2x_output_texts, snd_emu1616_4x_output_texts },
+		.n_outs = { ARRAY_SIZE(snd_emu1616_output_texts),
+			    ARRAY_SIZE(snd_emu1616_2x_output_texts), ARRAY_SIZE(snd_emu1616_4x_output_texts) },
 
 		.in_dflts = emu1010_input_dflt,
 		.in_regs = emu1010_input_dst,
-		.n_ins = { ARRAY_SIZE(emu1010_input_dst) - 6, 16 },
+		.n_ins = { ARRAY_SIZE(emu1010_input_dst) - 6, 16, 16, 16 },
 	},
 	{
 		/* 0404 */
-		.src_regs = emu0404_src_regs,
-		.src_texts = { emu0404_src_texts, emu0404_das_src_texts },
-		.n_srcs = { ARRAY_SIZE(emu0404_src_texts), ARRAY_SIZE(emu0404_das_src_texts) },
+		.src_regs = { emu0404_src_regs, emu0404_2x_src_regs[0], emu0404_4x_src_regs[0] },
+		.src_texts = { emu0404_src_texts, emu0404_das_src_texts,
+			       emu0404_das_src_texts, emu0404_4x_src_texts },
+		.n_srcs = { ARRAY_SIZE(emu0404_src_texts), ARRAY_SIZE(emu0404_das_src_texts),
+			    ARRAY_SIZE(emu0404_das_src_texts), ARRAY_SIZE(emu0404_4x_src_texts) },
 
 		.out_dflts = emu0404_output_dflt,
-		.out_regs = emu0404_output_dst,
-		.out_texts = snd_emu0404_output_texts,
-		.n_outs = ARRAY_SIZE(emu0404_output_dflt),
+		.out_regs = { emu0404_output_dst, emu0404_2x_output_dst[0], emu0404_4x_output_dst[0] },
+		.out_texts = { snd_emu0404_output_texts,
+			       snd_emu0404_output_texts, snd_emu0404_4x_output_texts },
+		.n_outs = { ARRAY_SIZE(snd_emu0404_output_texts),
+			    ARRAY_SIZE(snd_emu0404_output_texts), ARRAY_SIZE(snd_emu0404_4x_output_texts) },
 
 		.in_dflts = emu0404_input_dflt,
 		.in_regs = emu1010_input_dst,
-		.n_ins = { ARRAY_SIZE(emu1010_input_dst) - 6, 16 },
+		.n_ins = { ARRAY_SIZE(emu1010_input_dst) - 6, 16, 16, 16 },
 	},
 };
 
 static unsigned emu1010_idx(struct snd_emu10k1 *emu)
 {
 	return emu->card_capabilities->emu_model - 1;
 }
 
+static void snd_emu1010_source_apply(struct snd_emu10k1 *emu, unsigned shift,
+				     const unsigned short *regs,
+				     const unsigned short *vals)
+{
+	unsigned short avals[4];
+
+	if ((vals[0] & 0x700) == 0x300) {  // EMU32x
+		// Only 1x playback for now
+		avals[0] = avals[1] = avals[2] = avals[3] = vals[0];
+		vals = avals;
+	}
+	switch (shift) {
+	case 2:
+		snd_emu1010_fpga_link_dst_src_write(emu, regs[3], vals[3]);
+		snd_emu1010_fpga_link_dst_src_write(emu, regs[2], vals[2]);
+		fallthrough;
+	case 1:
+		snd_emu1010_fpga_link_dst_src_write(emu, regs[1], vals[1]);
+		fallthrough;
+	default:
+		snd_emu1010_fpga_link_dst_src_write(emu, regs[0], vals[0]);
+		break;
+	}
+}
+
 static void snd_emu1010_output_source_apply(struct snd_emu10k1 *emu,
 					    int channel, int src)
 {
 	const struct snd_emu1010_routing_info *emu_ri =
 		&emu1010_routing_info[emu1010_idx(emu)];
+	unsigned shift = emu->emu1010.clock_shift;
+	const unsigned short *regs = &emu_ri->out_regs[shift][channel << shift];
+	const unsigned short *vals = &emu_ri->src_regs[shift][src << shift];
 
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		emu_ri->out_regs[channel], emu_ri->src_regs[src]);
+	snd_emu1010_source_apply(emu, shift, regs, vals);
 }
 
 static void snd_emu1010_input_source_apply(struct snd_emu10k1 *emu,
 					   int channel, int src)
 {
 	const struct snd_emu1010_routing_info *emu_ri =
 		&emu1010_routing_info[emu1010_idx(emu)];
+	unsigned shift = emu->emu1010.clock_shift;
+	const unsigned short *regs = &emu_ri->in_regs[channel];
+	const unsigned short *vals = &emu_ri->src_regs[shift][src << shift];
 
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		emu_ri->in_regs[channel], emu_ri->src_regs[src]);
+	// Only 1x capture for now
+	snd_emu1010_fpga_link_dst_src_write(emu, regs[0], vals[0]);
 }
 
-static void snd_emu1010_apply_sources(struct snd_emu10k1 *emu)
+static void snd_emu1010_apply_sources(struct snd_emu10k1 *emu, int active)
 {
 	const struct snd_emu1010_routing_info *emu_ri =
 		&emu1010_routing_info[emu1010_idx(emu)];
-	unsigned iidx = emu->das_mode;
+	unsigned oidx = emu->emu1010.clock_shift;
+	unsigned iidx = emu->das_mode + oidx;
 
-	for (unsigned i = 0; i < emu_ri->n_outs; i++)
+	for (unsigned i = 0; i < emu_ri->n_outs[oidx]; i++)
 		snd_emu1010_output_source_apply(
-			emu, i, emu->emu1010.output_source[i]);
+			emu, i, active ? emu->emu1010.output_source[i] : 0);
 	for (unsigned i = 0; i < emu_ri->n_ins[iidx]; i++)
 		snd_emu1010_input_source_apply(
-			emu, i, emu->emu1010.input_source[i]);
+			emu, i, active ? emu->emu1010.input_source[i] : 0);
 }
 
 static u8 emu1010_map_source(const struct snd_emu1010_routing_info *emu_ri,
 			     unsigned das_mode, unsigned val)
 {
 	for (unsigned i = 0; i < emu_ri->n_srcs[das_mode]; i++)
-		if (val == emu_ri->src_regs[i])
+		if (val == emu_ri->src_regs[0][i])
 			return i;
 	return 0;
 }
 
+static const unsigned internal_sources[3] = { 16, 16, 8 };
+
+static unsigned emu1010_remap_source(const struct snd_emu1010_routing_info *emu_ri,
+				     unsigned oshift, unsigned nshift, unsigned src)
+{
+	unsigned ibase = emu_ri->n_srcs[oshift + 1] - internal_sources[oshift];
+	if (src >= ibase) {
+		int raw_src = src - ibase - internal_sources[nshift];
+		if (raw_src < 0)
+			return raw_src + emu_ri->n_srcs[nshift + 1];
+	} else {
+		unsigned reg = emu_ri->src_regs[oshift][src << oshift];
+		for (unsigned i = 0; i < emu_ri->n_srcs[nshift + 1]; i++)
+			if (reg == emu_ri->src_regs[nshift][i << nshift])
+				return i;
+	}
+	return 0;
+}
+
+static void snd_emu1010_remap_sources(struct snd_emu10k1 *emu, int oshift, int nshift)
+{
+	const struct snd_emu1010_routing_info *emu_ri =
+		&emu1010_routing_info[emu1010_idx(emu)];
+	unsigned char srcs[NUM_OUTPUT_DESTS];
+	unsigned o, n, n_dsts_o, n_dsts_n;
+
+	n_dsts_o = emu_ri->n_outs[oshift];
+	n_dsts_n = emu_ri->n_outs[nshift];
+	for (n = 0; n < n_dsts_n; n++) {
+		unsigned reg = emu_ri->out_regs[nshift][n << nshift];
+		unsigned src = 0;
+		for (o = 0; o < n_dsts_o; o++) {
+			if (emu_ri->out_regs[oshift][o << oshift] == reg) {
+				src = emu1010_remap_source(emu_ri, oshift, nshift,
+							   emu->emu1010.output_source[o]);
+				break;
+			}
+		}
+		srcs[n] = src;
+	}
+	memcpy(emu->emu1010.output_source, srcs, n_dsts_n);
+
+	n_dsts_o = emu_ri->n_ins[oshift + 1];
+	n_dsts_n = emu_ri->n_ins[nshift + 1];
+	for (n = 0; n < n_dsts_n; n++)
+		emu->emu1010.input_source[n] = (n >= n_dsts_o) ? 0 :
+			emu1010_remap_source(emu_ri, oshift, nshift,
+					     emu->emu1010.input_source[n]);
+}
+
 static int snd_emu1010_input_output_source_info(struct snd_kcontrol *kcontrol,
 						struct snd_ctl_elem_info *uinfo)
 {
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	const struct snd_emu1010_routing_info *emu_ri =
 		&emu1010_routing_info[emu1010_idx(emu)];
-	unsigned iidx = emu->das_mode;
+	unsigned iidx = emu->das_mode + emu->emu1010.clock_shift;
 
 	return snd_ctl_enum_info(uinfo, 1, emu_ri->n_srcs[iidx], emu_ri->src_texts[iidx]);
 }
 
 static int snd_emu1010_output_source_get(struct snd_kcontrol *kcontrol,
                                  struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	const struct snd_emu1010_routing_info *emu_ri =
 		&emu1010_routing_info[emu1010_idx(emu)];
+	unsigned oidx = emu->emu1010.clock_shift;
 	unsigned channel = kcontrol->private_value;
 
-	if (channel >= emu_ri->n_outs)
+	if (channel >= emu_ri->n_outs[oidx])
 		return -EINVAL;
 	ucontrol->value.enumerated.item[0] = emu->emu1010.output_source[channel];
 	return 0;
 }
 
 static int snd_emu1010_output_source_put(struct snd_kcontrol *kcontrol,
                                  struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	const struct snd_emu1010_routing_info *emu_ri =
 		&emu1010_routing_info[emu1010_idx(emu)];
-	unsigned iidx = emu->das_mode;
+	unsigned oidx = emu->emu1010.clock_shift;
+	unsigned iidx = emu->das_mode + oidx;
 	unsigned val = ucontrol->value.enumerated.item[0];
 	unsigned channel = kcontrol->private_value;
 	int change;
 
 	if (val >= emu_ri->n_srcs[iidx])
 		return -EINVAL;
-	if (channel >= emu_ri->n_outs)
+	if (channel >= emu_ri->n_outs[oidx])
 		return -EINVAL;
 	change = (emu->emu1010.output_source[channel] != val);
 	if (change) {
@@ -734,7 +1186,7 @@ static int snd_emu1010_input_source_get(struct snd_kcontrol *kcontrol,
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	const struct snd_emu1010_routing_info *emu_ri =
 		&emu1010_routing_info[emu1010_idx(emu)];
-	unsigned iidx = emu->das_mode;
+	unsigned iidx = emu->das_mode + emu->emu1010.clock_shift;
 	unsigned channel = kcontrol->private_value;
 
 	if (channel >= emu_ri->n_ins[iidx])
@@ -749,7 +1201,7 @@ static int snd_emu1010_input_source_put(struct snd_kcontrol *kcontrol,
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	const struct snd_emu1010_routing_info *emu_ri =
 		&emu1010_routing_info[emu1010_idx(emu)];
-	unsigned iidx = emu->das_mode;
+	unsigned iidx = emu->das_mode + emu->emu1010.clock_shift;
 	unsigned val = ucontrol->value.enumerated.item[0];
 	unsigned channel = kcontrol->private_value;
 	int change;
@@ -778,20 +1230,32 @@ static int add_emu1010_source_mixers(struct snd_emu10k1 *emu)
 {
 	const struct snd_emu1010_routing_info *emu_ri =
 		&emu1010_routing_info[emu1010_idx(emu)];
-	unsigned iidx = emu->das_mode;
+	unsigned oidx = emu->emu1010.clock_shift;
+	unsigned iidx = emu->das_mode + oidx;
 	int err;
 
 	err = add_ctls(emu, &emu1010_output_source_ctl,
-		       emu_ri->out_texts, emu_ri->n_outs);
+		       emu_ri->out_texts[oidx], emu_ri->n_outs[oidx]);
 	if (err < 0)
 		return err;
 	err = add_ctls(emu, &emu1010_input_source_ctl,
 		       iidx ? emu1010_das_input_texts :
 			      emu1010_input_texts,
 		       emu_ri->n_ins[iidx]);
 	return err;
 }
 
+static void remove_emu1010_source_mixers(struct snd_emu10k1 *emu)
+{
+	struct snd_kcontrol *kctl, *next;
+
+	list_for_each_entry_safe(kctl, next, &emu->card->controls, list) {
+		size_t nlen = strlen(kctl->id.name);
+		if (nlen > 5 && !memcmp(kctl->id.name + nlen - 5, " Enum", 5))
+			snd_ctl_remove(emu->card, kctl);
+	}
+}
+
 
 static const char * const snd_emu1010_adc_pads[] = {
 	"ADC1 14dB PAD 0202 Capture Switch",
@@ -1039,7 +1503,8 @@ static int snd_emu1010_clock_source_put(struct snd_kcontrol *kcontrol,
 	change = (emu->emu1010.clock_source != val);
 	if (change) {
 		emu->emu1010.clock_source = val;
-		emu->emu1010.wclock = emu_ci->vals[val];
+		emu->emu1010.wclock = (emu->emu1010.wclock & ~EMU_HANA_WCLOCK_SRC_MASK) |
+					emu_ci->vals[val];
 
 		snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, EMU_MUTE);
 		snd_emu1010_fpga_write(emu, EMU_HANA_WCLOCK, emu->emu1010.wclock);
@@ -1109,6 +1574,68 @@ static const struct snd_kcontrol_new snd_emu1010_clock_fallback =
 	.put = snd_emu1010_clock_fallback_put
 };
 
+static int snd_emu1010_clock_shift_info(struct snd_kcontrol *kcontrol,
+					     struct snd_ctl_elem_info *uinfo)
+{
+	static const char * const texts[3] = {
+		"x1", "x2", "x4"
+	};
+
+	return snd_ctl_enum_info(uinfo, 1, 3, texts);
+}
+
+static int snd_emu1010_clock_shift_get(struct snd_kcontrol *kcontrol,
+					    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
+
+	ucontrol->value.enumerated.item[0] = emu->emu1010.clock_shift;
+	return 0;
+}
+
+static int snd_emu1010_clock_shift_put(struct snd_kcontrol *kcontrol,
+					    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
+	unsigned int val = ucontrol->value.enumerated.item[0];
+	int change;
+
+	if (val >= 3)
+		return -EINVAL;
+	change = (emu->emu1010.clock_shift != val);
+	if (change) {
+		snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, EMU_MUTE);
+		snd_emu1010_apply_sources(emu, 0);
+
+		remove_emu1010_source_mixers(emu);
+		snd_emu1010_remap_sources(emu, emu->emu1010.clock_shift, val);
+		emu->emu1010.clock_shift = val;
+		add_emu1010_source_mixers(emu);
+
+		emu->emu1010.wclock = (emu->emu1010.wclock & ~EMU_HANA_WCLOCK_MULT_MASK) |
+					(val << 3);
+		snd_emu1010_fpga_write(emu, EMU_HANA_WCLOCK, emu->emu1010.wclock);
+		msleep(10);  // Allow DLL to settle
+
+		snd_emu1010_apply_sources(emu, 1);
+		snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, EMU_UNMUTE);
+
+		snd_emu1010_update_clock(emu);
+	}
+	return change;
+}
+
+static const struct snd_kcontrol_new snd_emu1010_clock_shift =
+{
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "Clock Multiplier",
+	.count = 1,
+	.info = snd_emu1010_clock_shift_info,
+	.get = snd_emu1010_clock_shift_get,
+	.put = snd_emu1010_clock_shift_put
+};
+
 static int snd_emu1010_optical_out_info(struct snd_kcontrol *kcontrol,
 					  struct snd_ctl_elem_info *uinfo)
 {
@@ -2396,11 +2923,18 @@ int snd_emu10k1_mixer(struct snd_emu10k1 *emu,
 		for (i = 0; i < emu_ri->n_ins[midx]; i++)
 			emu->emu1010.input_source[i] =
 				emu1010_map_source(emu_ri, midx, emu_ri->in_dflts[i]);
-		for (i = 0; i < emu_ri->n_outs; i++)
+		for (i = 0; i < emu_ri->n_outs[0]; i++)
 			emu->emu1010.output_source[i] =
 				emu1010_map_source(emu_ri, midx, emu_ri->out_dflts[i]);
-		snd_emu1010_apply_sources(emu);
+		snd_emu1010_apply_sources(emu, 1);
 
+		if (emu->das_mode) {
+			kctl = emu->ctl_clock_shift =
+					snd_ctl_new1(&snd_emu1010_clock_shift, emu);
+			err = snd_ctl_add(card, kctl);
+			if (err < 0)
+				return err;
+		}
 		err = snd_ctl_add(card,
 			snd_ctl_new1(&snd_emu1010_clock_source, emu));
 		if (err < 0)
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 7aed356637ab..69552d5c9e45 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -1188,19 +1188,42 @@ static void snd_emu10k1_pcm_efx_mixer_notify(struct snd_emu10k1 *emu, int idx, i
 	snd_emu10k1_pcm_mixer_notify1(emu, emu->ctl_efx_attn, idx, activate);
 }
 
+static void snd_emu10k1_pcm_clock_mutiplier_notify(struct snd_emu10k1 *emu)
+{
+	struct snd_kcontrol *kctl = emu->ctl_clock_shift;
+	struct snd_ctl_elem_id id;
+
+	// Modifying the clock multiplier during playback/capture
+	// would make a mess, so we lock it.
+	if (emu->emu1010.clock_users) {
+		if (!(kctl->vd[0].access & SNDRV_CTL_ELEM_ACCESS_WRITE))
+			return;
+		kctl->vd[0].access &= ~SNDRV_CTL_ELEM_ACCESS_WRITE;
+	} else {
+		if (kctl->vd[0].access & SNDRV_CTL_ELEM_ACCESS_WRITE)
+			return;
+		kctl->vd[0].access |= SNDRV_CTL_ELEM_ACCESS_WRITE;
+	}
+	snd_ctl_build_ioff(&id, kctl, 0);
+	snd_ctl_notify(emu->card, SNDRV_CTL_EVENT_MASK_INFO, &id);
+}
+
 static void snd_emu10k1_pcm_free_substream(struct snd_pcm_runtime *runtime)
 {
 	kfree(runtime->private_data);
 }
 
 static int snd_emu10k1_efx_playback_close(struct snd_pcm_substream *substream)
 {
 	struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
 	struct snd_emu10k1_pcm_mixer *mix;
 	int i;
 
-	if (emu->das_mode)
+	if (emu->das_mode) {
+		emu->emu1010.clock_users--;
+		snd_emu10k1_pcm_clock_mutiplier_notify(emu);
 		return 0;
+	}
 	for (i = 0; i < NUM_EFX_PLAYBACK; i++) {
 		mix = &emu->efx_pcm_mixer[i];
 		mix->epcm = NULL;
@@ -1254,8 +1277,11 @@ static int snd_emu10k1_efx_playback_open(struct snd_pcm_substream *substream)
 		return err;
 	}
 
-	if (emu->das_mode)
+	if (emu->das_mode) {
+		emu->emu1010.clock_users++;
+		snd_emu10k1_pcm_clock_mutiplier_notify(emu);
 		return 0;
+	}
 	for (i = 0; i < NUM_EFX_PLAYBACK; i++) {
 		mix = &emu->efx_pcm_mixer[i];
 		for (j = 0; j < 8; j++)
@@ -1464,13 +1490,24 @@ static int snd_emu10k1_capture_efx_open(struct snd_pcm_substream *substream)
 				   &hw_constraints_capture_buffer_sizes);
 	emu->capture_efx_interrupt = snd_emu10k1_pcm_efx_interrupt;
 	emu->pcm_capture_efx_substream = substream;
+
+	if (emu->das_mode) {
+		emu->emu1010.clock_users++;
+		snd_emu10k1_pcm_clock_mutiplier_notify(emu);
+	}
+
 	return 0;
 }
 
 static int snd_emu10k1_capture_efx_close(struct snd_pcm_substream *substream)
 {
 	struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
 
+	if (emu->das_mode) {
+		emu->emu1010.clock_users--;
+		snd_emu10k1_pcm_clock_mutiplier_notify(emu);
+	}
+
 	emu->capture_efx_interrupt = NULL;
 	emu->pcm_capture_efx_substream = NULL;
 	return 0;
diff --git a/sound/pci/emu10k1/io.c b/sound/pci/emu10k1/io.c
index a0d66ce3ee83..dc9c7a59e03a 100644
--- a/sound/pci/emu10k1/io.c
+++ b/sound/pci/emu10k1/io.c
@@ -404,19 +404,47 @@ void snd_emu1010_update_clock(struct snd_emu10k1 *emu)
 		clock = 48000;
 		leds = EMU_HANA_DOCK_LEDS_2_48K;
 		break;
+	case EMU_HANA_WCLOCK_INT_44_1K | EMU_HANA_WCLOCK_2X:
+		clock = 44100;
+		leds = 0;
+		break;
+	case EMU_HANA_WCLOCK_INT_48K | EMU_HANA_WCLOCK_2X:
+		clock = 48000;
+		leds = EMU_HANA_DOCK_LEDS_2_96K;
+		break;
+	case EMU_HANA_WCLOCK_INT_44_1K | EMU_HANA_WCLOCK_4X:
+		clock = 44100;
+		leds = 0;
+		break;
+	case EMU_HANA_WCLOCK_INT_48K | EMU_HANA_WCLOCK_4X:
+		clock = 48000;
+		leds = EMU_HANA_DOCK_LEDS_2_192K;
+		break;
 	default:
 		clock = snd_emu1010_get_raw_rate(
 				emu, emu->emu1010.wclock & EMU_HANA_WCLOCK_SRC_MASK);
 		// The raw rate reading is rather coarse (it cannot accurately
 		// represent 44.1 kHz) and fluctuates slightly. Luckily, the
 		// clock comes from digital inputs, which use standardized rates.
 		// So we round to the closest standard rate and ignore discrepancies.
 		if (clock < 46000) {
 			clock = 44100;
 			leds = EMU_HANA_DOCK_LEDS_2_EXT | EMU_HANA_DOCK_LEDS_2_44K;
-		} else {
+		} else if (clock < 75000) {
 			clock = 48000;
 			leds = EMU_HANA_DOCK_LEDS_2_EXT | EMU_HANA_DOCK_LEDS_2_48K;
+		} else if (clock < 92000) {
+			clock = 44100;
+			leds = EMU_HANA_DOCK_LEDS_2_EXT;
+		} else if (clock < 150000) {
+			clock = 48000;
+			leds = EMU_HANA_DOCK_LEDS_2_EXT | EMU_HANA_DOCK_LEDS_2_96K;
+		} else if (clock < 184000) {
+			clock = 44100;
+			leds = EMU_HANA_DOCK_LEDS_2_EXT;
+		} else {
+			clock = 48000;
+			leds = EMU_HANA_DOCK_LEDS_2_EXT | EMU_HANA_DOCK_LEDS_2_192K;
 		}
 		break;
 	}
-- 
2.40.0.152.g15d061e6df

