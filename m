Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EF36EBA39
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Apr 2023 18:13:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CE75EBC;
	Sat, 22 Apr 2023 18:12:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CE75EBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682179981;
	bh=cvmPWkL9Kb9EAXYGSCaojdUIbsHwyS88nmlC65+2nRk=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=crsOXEp40JtzHhHq0Tz1mzf4k97zChmhtpBikTxIS7xfc51H9FTNv0E1wP+jeiE1x
	 XicZk8M7rptny9sJINTCA6aL7tALbTvI2iPDisJtf2ZmrHCPy8RNzhDqHHBzgx707r
	 68pf4YcMBa4KWIZ6dc9ovqkqNQujskj7ejzzI2e0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84488F8055C;
	Sat, 22 Apr 2023 18:10:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39FDEF80571; Sat, 22 Apr 2023 18:10:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BBEF1F80529
	for <alsa-devel@alsa-project.org>; Sat, 22 Apr 2023 18:10:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBEF1F80529
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 97C732421C;
	Sat, 22 Apr 2023 12:10:21 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pqFob-naz-00; Sat, 22 Apr 2023 18:10:21 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 7/7] ALSA: emu10k1: use more existing defines instead of
 open-coded numbers
Date: Sat, 22 Apr 2023 18:10:21 +0200
Message-Id: <20230422161021.1143903-8-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230422161021.1143903-1-oswald.buddenhagen@gmx.de>
References: <20230422161021.1143903-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3MR2EYMWCGNHPHX7U2UYYXUAHX2CBT22
X-Message-ID-Hash: 3MR2EYMWCGNHPHX7U2UYYXUAHX2CBT22
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3MR2EYMWCGNHPHX7U2UYYXUAHX2CBT22/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Using the *_MASK defines for "maximal value" is debatable. I got the
idea from FreeBSD, and it sorta makes sense to me.

Some hunks look a bit incomplete, because code that is going to be
subsequently removed is not touched here.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emu10k1_callback.c | 15 ++++-----
 sound/pci/emu10k1/emu10k1_main.c     | 46 ++++++++++++++--------------
 sound/pci/emu10k1/emufx.c            |  6 ++--
 sound/pci/emu10k1/emumixer.c         |  8 ++---
 sound/pci/emu10k1/emupcm.c           | 12 ++++----
 sound/pci/emu10k1/io.c               | 18 +++++------
 sound/pci/emu10k1/p16v.c             | 29 ++++++++++--------
 7 files changed, 69 insertions(+), 65 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_callback.c b/sound/pci/emu10k1/emu10k1_callback.c
index dba1e9fc2eec..44f2a61c6be8 100644
--- a/sound/pci/emu10k1/emu10k1_callback.c
+++ b/sound/pci/emu10k1/emu10k1_callback.c
@@ -120,9 +120,9 @@ release_voice(struct snd_emux_voice *vp)
 	struct snd_emu10k1 *hw;
 	
 	hw = vp->hw;
-	dcysusv = 0x8000 | (unsigned char)vp->reg.parm.modrelease;
+	dcysusv = (unsigned char)vp->reg.parm.modrelease | DCYSUSM_PHASE1_MASK;
 	snd_emu10k1_ptr_write(hw, DCYSUSM, vp->ch, dcysusv);
-	dcysusv = 0x8000 | (unsigned char)vp->reg.parm.volrelease | DCYSUSV_CHANNELENABLE_MASK;
+	dcysusv = (unsigned char)vp->reg.parm.volrelease | DCYSUSV_PHASE1_MASK | DCYSUSV_CHANNELENABLE_MASK;
 	snd_emu10k1_ptr_write(hw, DCYSUSV, vp->ch, dcysusv);
 }
 
@@ -138,7 +138,8 @@ terminate_voice(struct snd_emux_voice *vp)
 	if (snd_BUG_ON(!vp))
 		return;
 	hw = vp->hw;
-	snd_emu10k1_ptr_write(hw, DCYSUSV, vp->ch, 0x807f | DCYSUSV_CHANNELENABLE_MASK);
+	snd_emu10k1_ptr_write(hw, DCYSUSV, vp->ch,
+		DCYSUSV_PHASE1_MASK | DCYSUSV_DECAYTIME_MASK | DCYSUSV_CHANNELENABLE_MASK);
 	if (vp->block) {
 		struct snd_emu10k1_memblk *emem;
 		emem = (struct snd_emu10k1_memblk *)vp->block;
@@ -347,9 +348,9 @@ start_voice(struct snd_emux_voice *vp)
 	}
 
 	/* channel to be silent and idle */
-	snd_emu10k1_ptr_write(hw, DCYSUSV, ch, 0x0000);
-	snd_emu10k1_ptr_write(hw, VTFT, ch, 0x0000FFFF);
-	snd_emu10k1_ptr_write(hw, CVCF, ch, 0x0000FFFF);
+	snd_emu10k1_ptr_write(hw, DCYSUSV, ch, 0);
+	snd_emu10k1_ptr_write(hw, VTFT, ch, VTFT_FILTERTARGET_MASK);
+	snd_emu10k1_ptr_write(hw, CVCF, ch, CVCF_CURRENTFILTER_MASK);
 	snd_emu10k1_ptr_write(hw, PTRX, ch, 0);
 	snd_emu10k1_ptr_write(hw, CPF, ch, 0);
 
@@ -453,7 +454,7 @@ start_voice(struct snd_emux_voice *vp)
 	/* reset volume */
 	temp = (unsigned int)vp->vtarget << 16;
 	snd_emu10k1_ptr_write(hw, VTFT, ch, temp | vp->ftarget);
-	snd_emu10k1_ptr_write(hw, CVCF, ch, temp | 0xff00);
+	snd_emu10k1_ptr_write(hw, CVCF, ch, temp | CVCF_CURRENTFILTER_MASK);
 	return 0;
 }
 
diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index 007c445d72bf..e53eb7fd0883 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -59,8 +59,8 @@ void snd_emu10k1_voice_init(struct snd_emu10k1 *emu, int ch)
 {
 	snd_emu10k1_ptr_write(emu, DCYSUSV, ch, 0);
 	snd_emu10k1_ptr_write(emu, IP, ch, 0);
-	snd_emu10k1_ptr_write(emu, VTFT, ch, 0xffff);
-	snd_emu10k1_ptr_write(emu, CVCF, ch, 0xffff);
+	snd_emu10k1_ptr_write(emu, VTFT, ch, VTFT_FILTERTARGET_MASK);
+	snd_emu10k1_ptr_write(emu, CVCF, ch, CVCF_CURRENTFILTER_MASK);
 	snd_emu10k1_ptr_write(emu, PTRX, ch, 0);
 	snd_emu10k1_ptr_write(emu, CPF, ch, 0);
 	snd_emu10k1_ptr_write(emu, CCR, ch, 0);
@@ -74,7 +74,7 @@ void snd_emu10k1_voice_init(struct snd_emu10k1 *emu, int ch)
 
 	snd_emu10k1_ptr_write(emu, ATKHLDM, ch, 0);
 	snd_emu10k1_ptr_write(emu, DCYSUSM, ch, 0);
-	snd_emu10k1_ptr_write(emu, IFATN, ch, 0xffff);
+	snd_emu10k1_ptr_write(emu, IFATN, ch, IFATN_FILTERCUTOFF_MASK | IFATN_ATTENUATION_MASK);
 	snd_emu10k1_ptr_write(emu, PEFE, ch, 0);
 	snd_emu10k1_ptr_write(emu, FMMOD, ch, 0);
 	snd_emu10k1_ptr_write(emu, TREMFRQ, ch, 24);	/* 1 Hz */
@@ -90,10 +90,10 @@ void snd_emu10k1_voice_init(struct snd_emu10k1 *emu, int ch)
 
 	/* Audigy extra stuffs */
 	if (emu->audigy) {
-		snd_emu10k1_ptr_write(emu, 0x4c, ch, 0); /* ?? */
-		snd_emu10k1_ptr_write(emu, 0x4d, ch, 0); /* ?? */
-		snd_emu10k1_ptr_write(emu, 0x4e, ch, 0); /* ?? */
-		snd_emu10k1_ptr_write(emu, 0x4f, ch, 0); /* ?? */
+		snd_emu10k1_ptr_write(emu, A_CSBA, ch, 0);
+		snd_emu10k1_ptr_write(emu, A_CSDC, ch, 0);
+		snd_emu10k1_ptr_write(emu, A_CSFE, ch, 0);
+		snd_emu10k1_ptr_write(emu, A_CSHG, ch, 0);
 		snd_emu10k1_ptr_write(emu, A_FXRT1, ch, 0x03020100);
 		snd_emu10k1_ptr_write(emu, A_FXRT2, ch, 0x3f3f3f3f);
 		snd_emu10k1_ptr_write(emu, A_SENDAMOUNTS, ch, 0);
@@ -267,7 +267,7 @@ static int snd_emu10k1_init(struct snd_emu10k1 *emu, int enable_ir)
 
 	snd_emu10k1_ptr_write(emu, PTB, 0, emu->ptb_pages.addr);
 	snd_emu10k1_ptr_write(emu, TCB, 0, 0);	/* taken from original driver */
-	snd_emu10k1_ptr_write(emu, TCBS, 0, 4);	/* taken from original driver */
+	snd_emu10k1_ptr_write(emu, TCBS, 0, TCBS_BUFFSIZE_256K);	/* taken from original driver */
 
 	silent_page = (emu->silent_page.addr << emu->address_mode) | (emu->address_mode ? MAP_PTI_MASK1 : MAP_PTI_MASK0);
 	for (ch = 0; ch < NUM_G; ch++) {
@@ -826,7 +826,7 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k1 *emu)
 		/* FPGA netlist already present so clear it */
 		/* Return to programming mode */
 
-		snd_emu1010_fpga_write(emu, EMU_HANA_FPGA_CONFIG, 0x02);
+		snd_emu1010_fpga_write(emu, EMU_HANA_FPGA_CONFIG, EMU_HANA_FPGA_CONFIG_HANA);
 	}
 	snd_emu1010_fpga_read(emu, EMU_HANA_ID, &reg);
 	dev_dbg(emu->card->dev, "reg2 = 0x%x\n", reg);
@@ -866,36 +866,36 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k1 *emu)
 	/* Optical -> ADAT I/O  */
 	emu->emu1010.optical_in = 1; /* IN_ADAT */
 	emu->emu1010.optical_out = 1; /* OUT_ADAT */
-	tmp = (emu->emu1010.optical_in ? EMU_HANA_OPTICAL_IN_ADAT : 0) |
-		(emu->emu1010.optical_out ? EMU_HANA_OPTICAL_OUT_ADAT : 0);
+	tmp = (emu->emu1010.optical_in ? EMU_HANA_OPTICAL_IN_ADAT : EMU_HANA_OPTICAL_IN_SPDIF) |
+		(emu->emu1010.optical_out ? EMU_HANA_OPTICAL_OUT_ADAT : EMU_HANA_OPTICAL_OUT_SPDIF);
 	snd_emu1010_fpga_write(emu, EMU_HANA_OPTICAL_TYPE, tmp);
 	/* Set no attenuation on Audio Dock pads. */
-	snd_emu1010_fpga_write(emu, EMU_HANA_ADC_PADS, 0x00);
 	emu->emu1010.adc_pads = 0x00;
+	snd_emu1010_fpga_write(emu, EMU_HANA_ADC_PADS, emu->emu1010.adc_pads);
 	/* Unmute Audio dock DACs, Headphone source DAC-4. */
-	snd_emu1010_fpga_write(emu, EMU_HANA_DOCK_MISC, 0x30);
+	snd_emu1010_fpga_write(emu, EMU_HANA_DOCK_MISC, EMU_HANA_DOCK_PHONES_192_DAC4);
 	/* DAC PADs. */
-	snd_emu1010_fpga_write(emu, EMU_HANA_DAC_PADS, 0x0f);
-	emu->emu1010.dac_pads = 0x0f;
+	emu->emu1010.dac_pads = EMU_HANA_DOCK_DAC_PAD1 | EMU_HANA_DOCK_DAC_PAD2 |
+				EMU_HANA_DOCK_DAC_PAD3 | EMU_HANA_DOCK_DAC_PAD4;
+	snd_emu1010_fpga_write(emu, EMU_HANA_DAC_PADS, emu->emu1010.dac_pads);
 	/* SPDIF Format. Set Consumer mode, 24bit, copy enable */
-	snd_emu1010_fpga_write(emu, EMU_HANA_SPDIF_MODE, 0x10);
+	snd_emu1010_fpga_write(emu, EMU_HANA_SPDIF_MODE, EMU_HANA_SPDIF_MODE_RX_INVALID);
 	/* MIDI routing */
-	snd_emu1010_fpga_write(emu, EMU_HANA_MIDI_IN, 0x19);
-	/* Unknown. */
-	snd_emu1010_fpga_write(emu, EMU_HANA_MIDI_OUT, 0x0c);
+	snd_emu1010_fpga_write(emu, EMU_HANA_MIDI_IN, EMU_HANA_MIDI_INA_FROM_HAMOA | EMU_HANA_MIDI_INB_FROM_DOCK2);
+	snd_emu1010_fpga_write(emu, EMU_HANA_MIDI_OUT, EMU_HANA_MIDI_OUT_DOCK2 | EMU_HANA_MIDI_OUT_SYNC2);
 	/* IRQ Enable: All on */
-	/* snd_emu1010_fpga_write(emu, 0x09, 0x0f ); */
+	/* snd_emu1010_fpga_write(emu, EMU_HANA_IRQ_ENABLE, 0x0f); */
 	/* IRQ Enable: All off */
 	snd_emu1010_fpga_write(emu, EMU_HANA_IRQ_ENABLE, 0x00);
 
 	emu->emu1010.internal_clock = 1; /* 48000 */
 	/* Default WCLK set to 48kHz. */
-	snd_emu1010_fpga_write(emu, EMU_HANA_DEFCLOCK, 0x00);
+	snd_emu1010_fpga_write(emu, EMU_HANA_DEFCLOCK, EMU_HANA_DEFCLOCK_48K);
 	/* Word Clock source, Internal 48kHz x1 */
 	snd_emu1010_fpga_write(emu, EMU_HANA_WCLOCK, EMU_HANA_WCLOCK_INT_48K);
 	/* snd_emu1010_fpga_write(emu, EMU_HANA_WCLOCK, EMU_HANA_WCLOCK_INT_48K | EMU_HANA_WCLOCK_4X); */
 	/* Audio Dock LEDs. */
-	snd_emu1010_fpga_write(emu, EMU_HANA_DOCK_LEDS_2, 0x12);
+	snd_emu1010_fpga_write(emu, EMU_HANA_DOCK_LEDS_2, EMU_HANA_DOCK_LEDS_2_LOCK | EMU_HANA_DOCK_LEDS_2_48K);
 
 #if 0
 	/* For 96kHz */
@@ -1022,7 +1022,7 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k1 *emu)
 		EMU_DST_ALICE_I2S2_LEFT, EMU_SRC_DOCK_ADC3_LEFT1);
 	snd_emu1010_fpga_link_dst_src_write(emu,
 		EMU_DST_ALICE_I2S2_RIGHT, EMU_SRC_DOCK_ADC3_RIGHT1);
-	snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, 0x01); /* Unmute all */
+	snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, EMU_UNMUTE);
 
 #if 0
 	snd_emu1010_fpga_link_dst_src_write(emu,
diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 510b776f856d..317c69b22cc2 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -1358,7 +1358,7 @@ A_OP(icode, &ptr, iMAC0, A_GPR(var), A_GPR(var), A_GPR(vol), A_EXTIN(input))
 	gpr += 2;
 
 	/* mic capture buffer */	
-	A_OP(icode, &ptr, iINTERP, A_EXTOUT(A_EXTOUT_MIC_CAP), A_EXTIN(A_EXTIN_AC97_L), 0xcd, A_EXTIN(A_EXTIN_AC97_R));
+	A_OP(icode, &ptr, iINTERP, A_EXTOUT(A_EXTOUT_MIC_CAP), A_EXTIN(A_EXTIN_AC97_L), A_C_40000000, A_EXTIN(A_EXTIN_AC97_R));
 
 	/* Audigy CD Playback Volume */
 	A_ADD_VOLUME_IN(stereo_mix, gpr, A_EXTIN_SPDIF_CD_L);
@@ -1441,7 +1441,7 @@ A_OP(icode, &ptr, iMAC0, A_GPR(var), A_GPR(var), A_GPR(vol), A_EXTIN(input))
 
 	/* Stereo Mix Center Playback */
 	/* Center = sub = Left/2 + Right/2 */
-	A_OP(icode, &ptr, iINTERP, A_GPR(tmp), A_GPR(stereo_mix), 0xcd, A_GPR(stereo_mix+1));
+	A_OP(icode, &ptr, iINTERP, A_GPR(tmp), A_GPR(stereo_mix), A_C_40000000, A_GPR(stereo_mix+1));
 	A_OP(icode, &ptr, iMAC0, A_GPR(playback+4), A_GPR(playback+4), A_GPR(gpr), A_GPR(tmp));
 	snd_emu10k1_init_mono_control(&controls[nctl++], "Center Playback Volume", gpr, 0);
 	gpr++;
@@ -2484,7 +2484,7 @@ int snd_emu10k1_fx8010_tram_setup(struct snd_emu10k1 *emu, u32 size)
 	outl(HCFG_LOCKTANKCACHE_MASK | inl(emu->port + HCFG), emu->port + HCFG);
 	spin_unlock_irq(&emu->emu_lock);
 	snd_emu10k1_ptr_write(emu, TCB, 0, 0);
-	snd_emu10k1_ptr_write(emu, TCBS, 0, 0);
+	snd_emu10k1_ptr_write(emu, TCBS, 0, TCBS_BUFFSIZE_16K);
 	if (emu->fx8010.etram_pages.area != NULL) {
 		snd_dma_free_pages(&emu->fx8010.etram_pages);
 		emu->fx8010.etram_pages.area = NULL;
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 3d2ed5e0a59d..faa42ba5870a 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -827,8 +827,8 @@ static int snd_emu1010_optical_out_put(struct snd_kcontrol *kcontrol,
 	change = (emu->emu1010.optical_out != val);
 	if (change) {
 		emu->emu1010.optical_out = val;
-		tmp = (emu->emu1010.optical_in ? EMU_HANA_OPTICAL_IN_ADAT : 0) |
-			(emu->emu1010.optical_out ? EMU_HANA_OPTICAL_OUT_ADAT : 0);
+		tmp = (emu->emu1010.optical_in ? EMU_HANA_OPTICAL_IN_ADAT : EMU_HANA_OPTICAL_IN_SPDIF) |
+			(emu->emu1010.optical_out ? EMU_HANA_OPTICAL_OUT_ADAT : EMU_HANA_OPTICAL_OUT_SPDIF);
 		snd_emu1010_fpga_write(emu, EMU_HANA_OPTICAL_TYPE, tmp);
 	}
 	return change;
@@ -878,8 +878,8 @@ static int snd_emu1010_optical_in_put(struct snd_kcontrol *kcontrol,
 	change = (emu->emu1010.optical_in != val);
 	if (change) {
 		emu->emu1010.optical_in = val;
-		tmp = (emu->emu1010.optical_in ? EMU_HANA_OPTICAL_IN_ADAT : 0) |
-			(emu->emu1010.optical_out ? EMU_HANA_OPTICAL_OUT_ADAT : 0);
+		tmp = (emu->emu1010.optical_in ? EMU_HANA_OPTICAL_IN_ADAT : EMU_HANA_OPTICAL_IN_SPDIF) |
+			(emu->emu1010.optical_out ? EMU_HANA_OPTICAL_OUT_ADAT : EMU_HANA_OPTICAL_OUT_SPDIF);
 		snd_emu1010_fpga_write(emu, EMU_HANA_OPTICAL_TYPE, tmp);
 	}
 	return change;
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index b0c0ef342756..e8d2f0f6fbb3 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -352,8 +352,8 @@ static void snd_emu10k1_pcm_init_voice(struct snd_emu10k1 *emu,
 	snd_emu10k1_ptr_write(emu, MAPA, voice, silent_page);
 	snd_emu10k1_ptr_write(emu, MAPB, voice, silent_page);
 	/* modulation envelope */
-	snd_emu10k1_ptr_write(emu, CVCF, voice, 0xffff);
-	snd_emu10k1_ptr_write(emu, VTFT, voice, 0xffff);
+	snd_emu10k1_ptr_write(emu, VTFT, voice, VTFT_FILTERTARGET_MASK);
+	snd_emu10k1_ptr_write(emu, CVCF, voice, CVCF_CURRENTFILTER_MASK);
 	snd_emu10k1_ptr_write(emu, ATKHLDM, voice, 0);
 	snd_emu10k1_ptr_write(emu, DCYSUSM, voice, 0x007f);
 	snd_emu10k1_ptr_write(emu, LFOVAL1, voice, 0x8000);
@@ -621,8 +621,8 @@ static void snd_emu10k1_playback_prepare_voice(struct snd_emu10k1 *emu, struct s
 	tmp = runtime->channels == 2 ? (master ? 1 : 2) : 0;
 	vattn = mix != NULL ? (mix->attn[tmp] << 16) : 0;
 	snd_emu10k1_ptr_write(emu, IFATN, voice, attn);
-	snd_emu10k1_ptr_write(emu, VTFT, voice, vattn | 0xffff);
-	snd_emu10k1_ptr_write(emu, CVCF, voice, vattn | 0xffff);
+	snd_emu10k1_ptr_write(emu, VTFT, voice, vattn | VTFT_FILTERTARGET_MASK);
+	snd_emu10k1_ptr_write(emu, CVCF, voice, vattn | CVCF_CURRENTFILTER_MASK);
 	snd_emu10k1_ptr_write(emu, DCYSUSV, voice, 0x7f7f);
 	snd_emu10k1_voice_clear_loop_stop(emu, voice);
 }	
@@ -663,8 +663,8 @@ static void snd_emu10k1_playback_stop_voice(struct snd_emu10k1 *emu, struct snd_
 	snd_emu10k1_ptr_write(emu, PTRX_PITCHTARGET, voice, 0);
 	snd_emu10k1_ptr_write(emu, CPF_CURRENTPITCH, voice, 0);
 	snd_emu10k1_ptr_write(emu, IFATN, voice, 0xffff);
-	snd_emu10k1_ptr_write(emu, VTFT, voice, 0xffff);
-	snd_emu10k1_ptr_write(emu, CVCF, voice, 0xffff);
+	snd_emu10k1_ptr_write(emu, VTFT, voice, VTFT_FILTERTARGET_MASK);
+	snd_emu10k1_ptr_write(emu, CVCF, voice, CVCF_CURRENTFILTER_MASK);
 	snd_emu10k1_ptr_write(emu, IP, voice, 0);
 }
 
diff --git a/sound/pci/emu10k1/io.c b/sound/pci/emu10k1/io.c
index c60573f14ea8..cfb96a67aa35 100644
--- a/sound/pci/emu10k1/io.c
+++ b/sound/pci/emu10k1/io.c
@@ -95,8 +95,8 @@ unsigned int snd_emu10k1_ptr20_read(struct snd_emu10k1 * emu,
 	regptr = (reg << 16) | chn;
 
 	spin_lock_irqsave(&emu->emu_lock, flags);
-	outl(regptr, emu->port + 0x20 + PTR);
-	val = inl(emu->port + 0x20 + DATA);
+	outl(regptr, emu->port + PTR2);
+	val = inl(emu->port + DATA2);
 	spin_unlock_irqrestore(&emu->emu_lock, flags);
 	return val;
 }
@@ -112,8 +112,8 @@ void snd_emu10k1_ptr20_write(struct snd_emu10k1 *emu,
 	regptr = (reg << 16) | chn;
 
 	spin_lock_irqsave(&emu->emu_lock, flags);
-	outl(regptr, emu->port + 0x20 + PTR);
-	outl(data, emu->port + 0x20 + DATA);
+	outl(regptr, emu->port + PTR2);
+	outl(data, emu->port + DATA2);
 	spin_unlock_irqrestore(&emu->emu_lock, flags);
 }
 
@@ -128,7 +128,7 @@ int snd_emu10k1_spi_write(struct snd_emu10k1 * emu,
 	/* This function is not re-entrant, so protect against it. */
 	spin_lock(&emu->spi_lock);
 	if (emu->card_capabilities->ca0108_chip)
-		reg = 0x3c; /* PTR20, reg 0x3c */
+		reg = P17V_SPI;
 	else {
 		/* For other chip types the SPI register
 		 * is currently unknown. */
@@ -280,10 +280,10 @@ void snd_emu1010_fpga_link_dst_src_write(struct snd_emu10k1 *emu, u32 dst, u32 s
 		return;
 	if (snd_BUG_ON(src & ~0x71f))
 		return;
-	snd_emu1010_fpga_write(emu, 0x00, dst >> 8);
-	snd_emu1010_fpga_write(emu, 0x01, dst & 0x1f);
-	snd_emu1010_fpga_write(emu, 0x02, src >> 8);
-	snd_emu1010_fpga_write(emu, 0x03, src & 0x1f);
+	snd_emu1010_fpga_write(emu, EMU_HANA_DESTHI, dst >> 8);
+	snd_emu1010_fpga_write(emu, EMU_HANA_DESTLO, dst & 0x1f);
+	snd_emu1010_fpga_write(emu, EMU_HANA_SRCHI, src >> 8);
+	snd_emu1010_fpga_write(emu, EMU_HANA_SRCLO, src & 0x1f);
 }
 
 void snd_emu10k1_intr_enable(struct snd_emu10k1 *emu, unsigned int intrenb)
diff --git a/sound/pci/emu10k1/p16v.c b/sound/pci/emu10k1/p16v.c
index ce4d3450959c..e7f097cae574 100644
--- a/sound/pci/emu10k1/p16v.c
+++ b/sound/pci/emu10k1/p16v.c
@@ -254,19 +254,24 @@ static int snd_p16v_pcm_prepare_playback(struct snd_pcm_substream *substream)
 		   emu->p16v_buffer->bytes);
 #endif /* debug */
 	tmp = snd_emu10k1_ptr_read(emu, A_SPDIF_SAMPLERATE, channel);
+	tmp &= ~(A_SPDIF_RATE_MASK | A_EHC_SRC48_MASK);
         switch (runtime->rate) {
 	case 44100:
-	  snd_emu10k1_ptr_write(emu, A_SPDIF_SAMPLERATE, channel, (tmp & ~0xe0e0) | 0x8080);
+	  snd_emu10k1_ptr_write(emu, A_SPDIF_SAMPLERATE, channel,
+				tmp | A_SPDIF_44100 | A_EHC_SRC48_44);
 	  break;
 	case 96000:
-	  snd_emu10k1_ptr_write(emu, A_SPDIF_SAMPLERATE, channel, (tmp & ~0xe0e0) | 0x4040);
+	  snd_emu10k1_ptr_write(emu, A_SPDIF_SAMPLERATE, channel,
+				tmp | A_SPDIF_96000 | A_EHC_SRC48_96);
 	  break;
 	case 192000:
-	  snd_emu10k1_ptr_write(emu, A_SPDIF_SAMPLERATE, channel, (tmp & ~0xe0e0) | 0x2020);
+	  snd_emu10k1_ptr_write(emu, A_SPDIF_SAMPLERATE, channel,
+				tmp | A_SPDIF_192000 | A_EHC_SRC48_192);
 	  break;
 	case 48000:
 	default:
-	  snd_emu10k1_ptr_write(emu, A_SPDIF_SAMPLERATE, channel, (tmp & ~0xe0e0) | 0x0000);
+	  snd_emu10k1_ptr_write(emu, A_SPDIF_SAMPLERATE, channel,
+				tmp | A_SPDIF_48000 | A_EHC_SRC48_BYPASS);
 	  break;
 	}
 	/* FIXME: Check emu->buffer.size before actually writing to it. */
@@ -282,46 +287,44 @@ static int snd_p16v_pcm_prepare_playback(struct snd_pcm_substream *substream)
 	//snd_emu10k1_ptr20_write(emu, PLAYBACK_PERIOD_SIZE, channel, frames_to_bytes(runtime, runtime->period_size)<<16); // buffer size in bytes
 	snd_emu10k1_ptr20_write(emu, PLAYBACK_PERIOD_SIZE, channel, 0); // buffer size in bytes
 	snd_emu10k1_ptr20_write(emu, PLAYBACK_POINTER, channel, 0);
-	snd_emu10k1_ptr20_write(emu, 0x07, channel, 0x0);
-	snd_emu10k1_ptr20_write(emu, 0x08, channel, 0);
+	snd_emu10k1_ptr20_write(emu, PLAYBACK_FIFO_END_ADDRESS, channel, 0);
+	snd_emu10k1_ptr20_write(emu, PLAYBACK_FIFO_POINTER, channel, 0);
 
 	return 0;
 }
 
 /* prepare capture callback */
 static int snd_p16v_pcm_prepare_capture(struct snd_pcm_substream *substream)
 {
 	struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int channel = substream->pcm->device - emu->p16v_device_offset;
-	u32 tmp;
 
 	/*
 	dev_dbg(emu->card->dev, "prepare capture:channel_number=%d, rate=%d, "
 	       "format=0x%x, channels=%d, buffer_size=%ld, period_size=%ld, "
 	       "frames_to_bytes=%d\n",
 	       channel, runtime->rate, runtime->format, runtime->channels,
 	       runtime->buffer_size, runtime->period_size,
 	       frames_to_bytes(runtime, 1));
 	*/
-	tmp = snd_emu10k1_ptr_read(emu, A_SPDIF_SAMPLERATE, channel);
         switch (runtime->rate) {
 	case 44100:
-	  snd_emu10k1_ptr_write(emu, A_SPDIF_SAMPLERATE, channel, (tmp & ~0x0e00) | 0x0800);
+	  snd_emu10k1_ptr_write(emu, A_I2S_CAPTURE_RATE, channel, A_I2S_CAPTURE_44100);
 	  break;
 	case 96000:
-	  snd_emu10k1_ptr_write(emu, A_SPDIF_SAMPLERATE, channel, (tmp & ~0x0e00) | 0x0400);
+	  snd_emu10k1_ptr_write(emu, A_I2S_CAPTURE_RATE, channel, A_I2S_CAPTURE_96000);
 	  break;
 	case 192000:
-	  snd_emu10k1_ptr_write(emu, A_SPDIF_SAMPLERATE, channel, (tmp & ~0x0e00) | 0x0200);
+	  snd_emu10k1_ptr_write(emu, A_I2S_CAPTURE_RATE, channel, A_I2S_CAPTURE_192000);
 	  break;
 	case 48000:
 	default:
-	  snd_emu10k1_ptr_write(emu, A_SPDIF_SAMPLERATE, channel, (tmp & ~0x0e00) | 0x0000);
+	  snd_emu10k1_ptr_write(emu, A_I2S_CAPTURE_RATE, channel, A_I2S_CAPTURE_48000);
 	  break;
 	}
 	/* FIXME: Check emu->buffer.size before actually writing to it. */
-	snd_emu10k1_ptr20_write(emu, 0x13, channel, 0);
+	snd_emu10k1_ptr20_write(emu, CAPTURE_FIFO_POINTER, channel, 0);
 	snd_emu10k1_ptr20_write(emu, CAPTURE_DMA_ADDR, channel, runtime->dma_addr);
 	snd_emu10k1_ptr20_write(emu, CAPTURE_BUFFER_SIZE, channel, frames_to_bytes(runtime, runtime->buffer_size) << 16); // buffer size in bytes
 	snd_emu10k1_ptr20_write(emu, CAPTURE_POINTER, channel, 0);
-- 
2.40.0.152.g15d061e6df

