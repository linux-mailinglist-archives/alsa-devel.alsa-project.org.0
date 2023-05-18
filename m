Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E28707CFC
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 11:33:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B99782B;
	Thu, 18 May 2023 11:32:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B99782B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684402391;
	bh=GOJkc0yzi/M2xHC0lsUpQmZ2NnvV3WDkmmTbG5q55uY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=l3cZwK7BnWsY91ftesMIaSoTq3r9HxDyCFMvrYgWjyZoFry4EmHziBiRgzyGMs0OU
	 frI375uQmrPpIxAKZpDztXrkJGl51ObxQPXl0iSvYFBHkjr3lfluf8rJO/vDpxpyit
	 1uBZw0WSqQh/1n4XBnJGc0gqntNOabkV2ENa3TLw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D141F8025A; Thu, 18 May 2023 11:31:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C36A8F8025A;
	Thu, 18 May 2023 11:31:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC95AF8025A; Thu, 18 May 2023 11:31:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D3677F80542
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 11:31:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3677F80542
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 44BFB23E25;
	Thu, 18 May 2023 05:31:34 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pzZyw-W0a-00; Thu, 18 May 2023 11:31:34 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH] ALSA: emu10k1: introduce and use
 snd_emu10k1_ptr_write_multiple()
Date: Thu, 18 May 2023 11:31:34 +0200
Message-Id: <20230518093134.3697955-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HLKJZKU3UWYSR2F5K4CEFDIQTGPBZTXU
X-Message-ID-Hash: HLKJZKU3UWYSR2F5K4CEFDIQTGPBZTXU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HLKJZKU3UWYSR2F5K4CEFDIQTGPBZTXU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

While this nicely denoises the code, the real intent is being able to
write many registers pseudo-atomically, which will come in handy later.

Idea stolen from kX-project.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>

---

This patch needs to be applied on top of the patch titled "ALSA:
emu10k1: fix PCM playback buffer size constraints".
---
 include/sound/emu10k1.h              |   4 +
 sound/pci/emu10k1/emu10k1_callback.c | 209 +++++++++++++--------------
 sound/pci/emu10k1/emu10k1_main.c     | 164 +++++++++++----------
 sound/pci/emu10k1/emumixer.c         |   8 +-
 sound/pci/emu10k1/emupcm.c           | 110 +++++++-------
 sound/pci/emu10k1/io.c               |  31 ++++
 6 files changed, 292 insertions(+), 234 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index ee662a1b0dc7..9c5de1f45566 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -64,6 +64,9 @@
 #define REG_VAL_GET(r, v) ((v & REG_MASK(r)) >> REG_SHIFT(r))
 #define REG_VAL_PUT(r, v) ((v) << REG_SHIFT(r))
 
+// List terminator for snd_emu10k1_ptr_write_multiple()
+#define REGLIST_END ~0
+
 // Audigy specify registers are prefixed with 'A_'
 
 /************************************************************************************************/
@@ -1793,6 +1796,7 @@ int snd_emu10k1_done(struct snd_emu10k1 * emu);
 /* I/O functions */
 unsigned int snd_emu10k1_ptr_read(struct snd_emu10k1 * emu, unsigned int reg, unsigned int chn);
 void snd_emu10k1_ptr_write(struct snd_emu10k1 *emu, unsigned int reg, unsigned int chn, unsigned int data);
+void snd_emu10k1_ptr_write_multiple(struct snd_emu10k1 *emu, unsigned int chn, ...);
 unsigned int snd_emu10k1_ptr20_read(struct snd_emu10k1 * emu, unsigned int reg, unsigned int chn);
 void snd_emu10k1_ptr20_write(struct snd_emu10k1 *emu, unsigned int reg, unsigned int chn, unsigned int data);
 int snd_emu10k1_spi_write(struct snd_emu10k1 * emu, unsigned int data);
diff --git a/sound/pci/emu10k1/emu10k1_callback.c b/sound/pci/emu10k1/emu10k1_callback.c
index 9455df18f7b2..06440b97b5d7 100644
--- a/sound/pci/emu10k1/emu10k1_callback.c
+++ b/sound/pci/emu10k1/emu10k1_callback.c
@@ -33,9 +33,8 @@ static void release_voice(struct snd_emux_voice *vp);
 static void update_voice(struct snd_emux_voice *vp, int update);
 static void terminate_voice(struct snd_emux_voice *vp);
 static void free_voice(struct snd_emux_voice *vp);
-static void set_fmmod(struct snd_emu10k1 *hw, struct snd_emux_voice *vp);
-static void set_fm2frq2(struct snd_emu10k1 *hw, struct snd_emux_voice *vp);
-static void set_filterQ(struct snd_emu10k1 *hw, struct snd_emux_voice *vp);
+static u32 make_fmmod(struct snd_emux_voice *vp);
+static u32 make_fm2frq2(struct snd_emux_voice *vp);
 
 /*
  * Ensure a value is between two points
@@ -116,14 +115,13 @@ snd_emu10k1_synth_get_voice(struct snd_emu10k1 *hw)
 static void
 release_voice(struct snd_emux_voice *vp)
 {
-	int dcysusv;
 	struct snd_emu10k1 *hw;
 	
 	hw = vp->hw;
-	dcysusv = (unsigned char)vp->reg.parm.modrelease | DCYSUSM_PHASE1_MASK;
-	snd_emu10k1_ptr_write(hw, DCYSUSM, vp->ch, dcysusv);
-	dcysusv = (unsigned char)vp->reg.parm.volrelease | DCYSUSV_PHASE1_MASK | DCYSUSV_CHANNELENABLE_MASK;
-	snd_emu10k1_ptr_write(hw, DCYSUSV, vp->ch, dcysusv);
+	snd_emu10k1_ptr_write_multiple(hw, vp->ch,
+		DCYSUSM, (unsigned char)vp->reg.parm.modrelease | DCYSUSM_PHASE1_MASK,
+		DCYSUSV, (unsigned char)vp->reg.parm.volrelease | DCYSUSV_PHASE1_MASK | DCYSUSV_CHANNELENABLE_MASK,
+		REGLIST_END);
 }
 
 
@@ -192,13 +190,13 @@ update_voice(struct snd_emux_voice *vp, int update)
 		snd_emu10k1_ptr_write(hw, PTRX_FXSENDAMOUNT_B, vp->ch, vp->aaux);
 	}
 	if (update & SNDRV_EMUX_UPDATE_FMMOD)
-		set_fmmod(hw, vp);
+		snd_emu10k1_ptr_write(hw, FMMOD, vp->ch, make_fmmod(vp));
 	if (update & SNDRV_EMUX_UPDATE_TREMFREQ)
 		snd_emu10k1_ptr_write(hw, TREMFRQ, vp->ch, vp->reg.parm.tremfrq);
 	if (update & SNDRV_EMUX_UPDATE_FM2FRQ2)
-		set_fm2frq2(hw, vp);
+		snd_emu10k1_ptr_write(hw, FM2FRQ2, vp->ch, make_fm2frq2(vp));
 	if (update & SNDRV_EMUX_UPDATE_Q)
-		set_filterQ(hw, vp);
+		snd_emu10k1_ptr_write(hw, CCCA_RESONANCE, vp->ch, vp->reg.parm.filterQ);
 }
 
 
@@ -310,6 +308,7 @@ start_voice(struct snd_emux_voice *vp)
 {
 	unsigned int temp;
 	int ch;
+	u32 psst, dsl, map, ccca, vtarget;
 	unsigned int addr, mapped_offset;
 	struct snd_midi_channel *chan;
 	struct snd_emu10k1 *hw;
@@ -347,66 +346,93 @@ start_voice(struct snd_emux_voice *vp)
 		snd_emu10k1_ptr_write(hw, FXRT, ch, temp);
 	}
 
-	/* channel to be silent and idle */
-	snd_emu10k1_ptr_write(hw, DCYSUSV, ch, 0);
-	snd_emu10k1_ptr_write(hw, VTFT, ch, VTFT_FILTERTARGET_MASK);
-	snd_emu10k1_ptr_write(hw, CVCF, ch, CVCF_CURRENTFILTER_MASK);
-	snd_emu10k1_ptr_write(hw, PTRX, ch, 0);
-	snd_emu10k1_ptr_write(hw, CPF, ch, 0);
-
-	/* set pitch offset */
-	snd_emu10k1_ptr_write(hw, IP, vp->ch, vp->apitch);
-
-	/* set envelope parameters */
-	snd_emu10k1_ptr_write(hw, ENVVAL, ch, vp->reg.parm.moddelay);
-	snd_emu10k1_ptr_write(hw, ATKHLDM, ch, vp->reg.parm.modatkhld);
-	snd_emu10k1_ptr_write(hw, DCYSUSM, ch, vp->reg.parm.moddcysus);
-	snd_emu10k1_ptr_write(hw, ENVVOL, ch, vp->reg.parm.voldelay);
-	snd_emu10k1_ptr_write(hw, ATKHLDV, ch, vp->reg.parm.volatkhld);
-	/* decay/sustain parameter for volume envelope is used
-	   for triggerg the voice */
-
-	/* cutoff and volume */
-	temp = (unsigned int)vp->acutoff << 8 | (unsigned char)vp->avol;
-	snd_emu10k1_ptr_write(hw, IFATN, vp->ch, temp);
-
-	/* modulation envelope heights */
-	snd_emu10k1_ptr_write(hw, PEFE, ch, vp->reg.parm.pefe);
-
-	/* lfo1/2 delay */
-	snd_emu10k1_ptr_write(hw, LFOVAL1, ch, vp->reg.parm.lfo1delay);
-	snd_emu10k1_ptr_write(hw, LFOVAL2, ch, vp->reg.parm.lfo2delay);
-
-	/* lfo1 pitch & cutoff shift */
-	set_fmmod(hw, vp);
-	/* lfo1 volume & freq */
-	snd_emu10k1_ptr_write(hw, TREMFRQ, vp->ch, vp->reg.parm.tremfrq);
-	/* lfo2 pitch & freq */
-	set_fm2frq2(hw, vp);
-
-	/* reverb and loop start (reverb 8bit, MSB) */
 	temp = vp->reg.parm.reverb;
 	temp += (int)vp->chan->control[MIDI_CTL_E1_REVERB_DEPTH] * 9 / 10;
 	LIMITMAX(temp, 255);
 	addr = vp->reg.loopstart;
-	snd_emu10k1_ptr_write(hw, PSST, vp->ch, (temp << 24) | addr);
+	psst = (temp << 24) | addr;
 
-	/* chorus & loop end (chorus 8bit, MSB) */
 	addr = vp->reg.loopend;
 	temp = vp->reg.parm.chorus;
 	temp += (int)chan->control[MIDI_CTL_E3_CHORUS_DEPTH] * 9 / 10;
 	LIMITMAX(temp, 255);
-	temp = (temp <<24) | addr;
-	snd_emu10k1_ptr_write(hw, DSL, ch, temp);
+	dsl = (temp << 24) | addr;
 
-	/* clear filter delay memory */
-	snd_emu10k1_ptr_write(hw, Z1, ch, 0);
-	snd_emu10k1_ptr_write(hw, Z2, ch, 0);
+	map = (hw->silent_page.addr << hw->address_mode) | (hw->address_mode ? MAP_PTI_MASK1 : MAP_PTI_MASK0);
 
-	/* invalidate maps */
-	temp = (hw->silent_page.addr << hw->address_mode) | (hw->address_mode ? MAP_PTI_MASK1 : MAP_PTI_MASK0);
-	snd_emu10k1_ptr_write(hw, MAPA, ch, temp);
-	snd_emu10k1_ptr_write(hw, MAPB, ch, temp);
+	addr = vp->reg.start;
+	temp = vp->reg.parm.filterQ;
+	ccca = (temp << 28) | addr;
+	if (vp->apitch < 0xe400)
+		ccca |= CCCA_INTERPROM_0;
+	else {
+		unsigned int shift = (vp->apitch - 0xe000) >> 10;
+		ccca |= shift << 25;
+	}
+	if (vp->reg.sample_mode & SNDRV_SFNT_SAMPLE_8BITS)
+		ccca |= CCCA_8BITSELECT;
+
+	vtarget = (unsigned int)vp->vtarget << 16;
+
+	snd_emu10k1_ptr_write_multiple(hw, ch,
+		/* channel to be silent and idle */
+		DCYSUSV, 0,
+		VTFT, VTFT_FILTERTARGET_MASK,
+		CVCF, CVCF_CURRENTFILTER_MASK,
+		PTRX, 0,
+		CPF, 0,
+
+		/* set pitch offset */
+		IP, vp->apitch,
+
+		/* set envelope parameters */
+		ENVVAL, vp->reg.parm.moddelay,
+		ATKHLDM, vp->reg.parm.modatkhld,
+		DCYSUSM, vp->reg.parm.moddcysus,
+		ENVVOL, vp->reg.parm.voldelay,
+		ATKHLDV, vp->reg.parm.volatkhld,
+		/* decay/sustain parameter for volume envelope is used
+		   for triggerg the voice */
+
+		/* cutoff and volume */
+		IFATN, (unsigned int)vp->acutoff << 8 | (unsigned char)vp->avol,
+
+		/* modulation envelope heights */
+		PEFE, vp->reg.parm.pefe,
+
+		/* lfo1/2 delay */
+		LFOVAL1, vp->reg.parm.lfo1delay,
+		LFOVAL2, vp->reg.parm.lfo2delay,
+
+		/* lfo1 pitch & cutoff shift */
+		FMMOD, make_fmmod(vp),
+		/* lfo1 volume & freq */
+		TREMFRQ, vp->reg.parm.tremfrq,
+		/* lfo2 pitch & freq */
+		FM2FRQ2, make_fm2frq2(vp),
+
+		/* reverb and loop start (reverb 8bit, MSB) */
+		PSST, psst,
+
+		/* chorus & loop end (chorus 8bit, MSB) */
+		DSL, dsl,
+
+		/* clear filter delay memory */
+		Z1, 0,
+		Z2, 0,
+
+		/* invalidate maps */
+		MAPA, map,
+		MAPB, map,
+
+		/* Q & current address (Q 4bit value, MSB) */
+		CCCA, ccca,
+
+		/* reset volume */
+		VTFT, vtarget | vp->ftarget,
+		CVCF, vtarget | CVCF_CURRENTFILTER_MASK,
+
+		REGLIST_END);
 #if 0
 	/* cache */
 	{
@@ -437,34 +463,16 @@ start_voice(struct snd_emux_voice *vp)
 	}
 #endif
 
-	/* Q & current address (Q 4bit value, MSB) */
-	addr = vp->reg.start;
-	temp = vp->reg.parm.filterQ;
-	temp = (temp<<28) | addr;
-	if (vp->apitch < 0xe400)
-		temp |= CCCA_INTERPROM_0;
-	else {
-		unsigned int shift = (vp->apitch - 0xe000) >> 10;
-		temp |= shift << 25;
-	}
-	if (vp->reg.sample_mode & SNDRV_SFNT_SAMPLE_8BITS)
-		temp |= CCCA_8BITSELECT;
-	snd_emu10k1_ptr_write(hw, CCCA, ch, temp);
-
-	/* reset volume */
-	temp = (unsigned int)vp->vtarget << 16;
-	snd_emu10k1_ptr_write(hw, VTFT, ch, temp | vp->ftarget);
-	snd_emu10k1_ptr_write(hw, CVCF, ch, temp | CVCF_CURRENTFILTER_MASK);
 	return 0;
 }
 
 /*
  * Start envelope
  */
 static void
 trigger_voice(struct snd_emux_voice *vp)
 {
-	unsigned int temp, ptarget;
+	unsigned int ptarget;
 	struct snd_emu10k1 *hw;
 	struct snd_emu10k1_memblk *emem;
 	
@@ -479,58 +487,49 @@ trigger_voice(struct snd_emux_voice *vp)
 #else
 	ptarget = IP_TO_CP(vp->apitch);
 #endif
-	/* set pitch target and pan (volume) */
-	temp = ptarget | (vp->apan << 8) | vp->aaux;
-	snd_emu10k1_ptr_write(hw, PTRX, vp->ch, temp);
+	snd_emu10k1_ptr_write_multiple(hw, vp->ch,
+		/* set pitch target and pan (volume) */
+		PTRX, ptarget | (vp->apan << 8) | vp->aaux,
 
-	/* pitch target */
-	snd_emu10k1_ptr_write(hw, CPF, vp->ch, ptarget);
+		/* current pitch and fractional address */
+		CPF, ptarget,
 
-	/* trigger voice */
-	snd_emu10k1_ptr_write(hw, DCYSUSV, vp->ch, vp->reg.parm.voldcysus|DCYSUSV_CHANNELENABLE_MASK);
+		/* enable envelope engine */
+		DCYSUSV, vp->reg.parm.voldcysus | DCYSUSV_CHANNELENABLE_MASK,
+
+		REGLIST_END);
 }
 
 #define MOD_SENSE 18
 
-/* set lfo1 modulation height and cutoff */
-static void
-set_fmmod(struct snd_emu10k1 *hw, struct snd_emux_voice *vp)
+/* calculate lfo1 modulation height and cutoff register */
+static u32
+make_fmmod(struct snd_emux_voice *vp)
 {
-	unsigned short fmmod;
 	short pitch;
 	unsigned char cutoff;
 	int modulation;
 
 	pitch = (char)(vp->reg.parm.fmmod>>8);
 	cutoff = (vp->reg.parm.fmmod & 0xff);
 	modulation = vp->chan->gm_modulation + vp->chan->midi_pressure;
 	pitch += (MOD_SENSE * modulation) / 1200;
 	LIMITVALUE(pitch, -128, 127);
-	fmmod = ((unsigned char)pitch<<8) | cutoff;
-	snd_emu10k1_ptr_write(hw, FMMOD, vp->ch, fmmod);
+	return ((unsigned char)pitch << 8) | cutoff;
 }
 
-/* set lfo2 pitch & frequency */
-static void
-set_fm2frq2(struct snd_emu10k1 *hw, struct snd_emux_voice *vp)
+/* calculate set lfo2 pitch & frequency register */
+static u32
+make_fm2frq2(struct snd_emux_voice *vp)
 {
-	unsigned short fm2frq2;
 	short pitch;
 	unsigned char freq;
 	int modulation;
 
 	pitch = (char)(vp->reg.parm.fm2frq2>>8);
 	freq = vp->reg.parm.fm2frq2 & 0xff;
 	modulation = vp->chan->gm_modulation + vp->chan->midi_pressure;
 	pitch += (MOD_SENSE * modulation) / 1200;
 	LIMITVALUE(pitch, -128, 127);
-	fm2frq2 = ((unsigned char)pitch<<8) | freq;
-	snd_emu10k1_ptr_write(hw, FM2FRQ2, vp->ch, fm2frq2);
-}
-
-/* set filterQ */
-static void
-set_filterQ(struct snd_emu10k1 *hw, struct snd_emux_voice *vp)
-{
-	snd_emu10k1_ptr_write(hw, CCCA_RESONANCE, vp->ch, vp->reg.parm.filterQ);
+	return ((unsigned char)pitch << 8) | freq;
 }
diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index da7c988b5c97..65207ef689cb 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -57,44 +57,49 @@ MODULE_FIRMWARE(EMU1010_NOTEBOOK_FILENAME);
 
 void snd_emu10k1_voice_init(struct snd_emu10k1 *emu, int ch)
 {
-	snd_emu10k1_ptr_write(emu, DCYSUSV, ch, 0);
-	snd_emu10k1_ptr_write(emu, VTFT, ch, VTFT_FILTERTARGET_MASK);
-	snd_emu10k1_ptr_write(emu, CVCF, ch, CVCF_CURRENTFILTER_MASK);
-	snd_emu10k1_ptr_write(emu, PTRX, ch, 0);
-	snd_emu10k1_ptr_write(emu, CPF, ch, 0);
-	snd_emu10k1_ptr_write(emu, CCR, ch, 0);
+	snd_emu10k1_ptr_write_multiple(emu, ch,
+		DCYSUSV, 0,
+		VTFT, VTFT_FILTERTARGET_MASK,
+		CVCF, CVCF_CURRENTFILTER_MASK,
+		PTRX, 0,
+		CPF, 0,
+		CCR, 0,
 
-	snd_emu10k1_ptr_write(emu, PSST, ch, 0);
-	snd_emu10k1_ptr_write(emu, DSL, ch, 0x10);
-	snd_emu10k1_ptr_write(emu, CCCA, ch, 0);
-	snd_emu10k1_ptr_write(emu, Z1, ch, 0);
-	snd_emu10k1_ptr_write(emu, Z2, ch, 0);
-	snd_emu10k1_ptr_write(emu, FXRT, ch, 0x32100000);
+		PSST, 0,
+		DSL, 0x10,
+		CCCA, 0,
+		Z1, 0,
+		Z2, 0,
+		FXRT, 0x32100000,
 
-	// The rest is meaningless as long as DCYSUSV_CHANNELENABLE_MASK is zero
-	snd_emu10k1_ptr_write(emu, DCYSUSM, ch, 0);
-	snd_emu10k1_ptr_write(emu, ATKHLDV, ch, 0);
-	snd_emu10k1_ptr_write(emu, ATKHLDM, ch, 0);
-	snd_emu10k1_ptr_write(emu, IP, ch, 0);
-	snd_emu10k1_ptr_write(emu, IFATN, ch, IFATN_FILTERCUTOFF_MASK | IFATN_ATTENUATION_MASK);
-	snd_emu10k1_ptr_write(emu, PEFE, ch, 0);
-	snd_emu10k1_ptr_write(emu, FMMOD, ch, 0);
-	snd_emu10k1_ptr_write(emu, TREMFRQ, ch, 24);	/* 1 Hz */
-	snd_emu10k1_ptr_write(emu, FM2FRQ2, ch, 24);	/* 1 Hz */
-	snd_emu10k1_ptr_write(emu, LFOVAL2, ch, 0);
-	snd_emu10k1_ptr_write(emu, LFOVAL1, ch, 0);
-	snd_emu10k1_ptr_write(emu, ENVVOL, ch, 0);
-	snd_emu10k1_ptr_write(emu, ENVVAL, ch, 0);
+		// The rest is meaningless as long as DCYSUSV_CHANNELENABLE_MASK is zero
+		DCYSUSM, 0,
+		ATKHLDV, 0,
+		ATKHLDM, 0,
+		IP, 0,
+		IFATN, IFATN_FILTERCUTOFF_MASK | IFATN_ATTENUATION_MASK,
+		PEFE, 0,
+		FMMOD, 0,
+		TREMFRQ, 24,	/* 1 Hz */
+		FM2FRQ2, 24,	/* 1 Hz */
+		LFOVAL2, 0,
+		LFOVAL1, 0,
+		ENVVOL, 0,
+		ENVVAL, 0,
+
+		REGLIST_END);
 
 	/* Audigy extra stuffs */
 	if (emu->audigy) {
-		snd_emu10k1_ptr_write(emu, A_CSBA, ch, 0);
-		snd_emu10k1_ptr_write(emu, A_CSDC, ch, 0);
-		snd_emu10k1_ptr_write(emu, A_CSFE, ch, 0);
-		snd_emu10k1_ptr_write(emu, A_CSHG, ch, 0);
-		snd_emu10k1_ptr_write(emu, A_FXRT1, ch, 0x03020100);
-		snd_emu10k1_ptr_write(emu, A_FXRT2, ch, 0x07060504);
-		snd_emu10k1_ptr_write(emu, A_SENDAMOUNTS, ch, 0);
+		snd_emu10k1_ptr_write_multiple(emu, ch,
+			A_CSBA, 0,
+			A_CSDC, 0,
+			A_CSFE, 0,
+			A_CSHG, 0,
+			A_FXRT1, 0x03020100,
+			A_FXRT2, 0x07060504,
+			A_SENDAMOUNTS, 0,
+			REGLIST_END);
 	}
 }
 
@@ -148,22 +153,26 @@ static int snd_emu10k1_init(struct snd_emu10k1 *emu, int enable_ir)
 	outl(HCFG_LOCKSOUNDCACHE | HCFG_LOCKTANKCACHE_MASK |
 		HCFG_MUTEBUTTONENABLE, emu->port + HCFG);
 
-	/* reset recording buffers */
-	snd_emu10k1_ptr_write(emu, MICBS, 0, ADCBS_BUFSIZE_NONE);
-	snd_emu10k1_ptr_write(emu, MICBA, 0, 0);
-	snd_emu10k1_ptr_write(emu, FXBS, 0, ADCBS_BUFSIZE_NONE);
-	snd_emu10k1_ptr_write(emu, FXBA, 0, 0);
-	snd_emu10k1_ptr_write(emu, ADCBS, 0, ADCBS_BUFSIZE_NONE);
-	snd_emu10k1_ptr_write(emu, ADCBA, 0, 0);
-
-	/* disable channel interrupt */
 	outl(0, emu->port + INTE);
-	snd_emu10k1_ptr_write(emu, CLIEL, 0, 0);
-	snd_emu10k1_ptr_write(emu, CLIEH, 0, 0);
 
-	/* disable stop on loop end */
-	snd_emu10k1_ptr_write(emu, SOLEL, 0, 0);
-	snd_emu10k1_ptr_write(emu, SOLEH, 0, 0);
+	snd_emu10k1_ptr_write_multiple(emu, 0,
+		/* reset recording buffers */
+		MICBS, ADCBS_BUFSIZE_NONE,
+		MICBA, 0,
+		FXBS, ADCBS_BUFSIZE_NONE,
+		FXBA, 0,
+		ADCBS, ADCBS_BUFSIZE_NONE,
+		ADCBA, 0,
+
+		/* disable channel interrupt */
+		CLIEL, 0,
+		CLIEH, 0,
+
+		/* disable stop on loop end */
+		SOLEL, 0,
+		SOLEH, 0,
+
+		REGLIST_END);
 
 	if (emu->audigy) {
 		/* set SPDIF bypass mode */
@@ -177,9 +186,11 @@ static int snd_emu10k1_init(struct snd_emu10k1 *emu, int enable_ir)
 	for (ch = 0; ch < NUM_G; ch++)
 		snd_emu10k1_voice_init(emu, ch);
 
-	snd_emu10k1_ptr_write(emu, SPCS0, 0, emu->spdif_bits[0]);
-	snd_emu10k1_ptr_write(emu, SPCS1, 0, emu->spdif_bits[1]);
-	snd_emu10k1_ptr_write(emu, SPCS2, 0, emu->spdif_bits[2]);
+	snd_emu10k1_ptr_write_multiple(emu, 0,
+		SPCS0, emu->spdif_bits[0],
+		SPCS1, emu->spdif_bits[1],
+		SPCS2, emu->spdif_bits[2],
+		REGLIST_END);
 
 	if (emu->card_capabilities->emu_model) {
 	} else if (emu->card_capabilities->ca0151_chip) { /* audigy2 */
@@ -390,41 +401,48 @@ int snd_emu10k1_done(struct snd_emu10k1 *emu)
 	outl(0, emu->port + INTE);
 
 	/*
-	 *  Shutdown the chip
+	 *  Shutdown the voices
 	 */
-	for (ch = 0; ch < NUM_G; ch++)
-		snd_emu10k1_ptr_write(emu, DCYSUSV, ch, 0);
 	for (ch = 0; ch < NUM_G; ch++) {
-		snd_emu10k1_ptr_write(emu, VTFT, ch, 0);
-		snd_emu10k1_ptr_write(emu, CVCF, ch, 0);
-		snd_emu10k1_ptr_write(emu, PTRX, ch, 0);
-		snd_emu10k1_ptr_write(emu, CPF, ch, 0);
+		snd_emu10k1_ptr_write_multiple(emu, ch,
+			DCYSUSV, 0,
+			VTFT, 0,
+			CVCF, 0,
+			PTRX, 0,
+			CPF, 0,
+			REGLIST_END);
 	}
 
-	/* reset recording buffers */
-	snd_emu10k1_ptr_write(emu, MICBS, 0, 0);
-	snd_emu10k1_ptr_write(emu, MICBA, 0, 0);
-	snd_emu10k1_ptr_write(emu, FXBS, 0, 0);
-	snd_emu10k1_ptr_write(emu, FXBA, 0, 0);
-	snd_emu10k1_ptr_write(emu, FXWC, 0, 0);
-	snd_emu10k1_ptr_write(emu, ADCBS, 0, ADCBS_BUFSIZE_NONE);
-	snd_emu10k1_ptr_write(emu, ADCBA, 0, 0);
-	snd_emu10k1_ptr_write(emu, TCBS, 0, TCBS_BUFFSIZE_16K);
-	snd_emu10k1_ptr_write(emu, TCB, 0, 0);
+	// stop the DSP
 	if (emu->audigy)
 		snd_emu10k1_ptr_write(emu, A_DBG, 0, A_DBG_SINGLE_STEP);
 	else
 		snd_emu10k1_ptr_write(emu, DBG, 0, EMU10K1_DBG_SINGLE_STEP);
 
-	/* disable channel interrupt */
-	snd_emu10k1_ptr_write(emu, CLIEL, 0, 0);
-	snd_emu10k1_ptr_write(emu, CLIEH, 0, 0);
-	snd_emu10k1_ptr_write(emu, SOLEL, 0, 0);
-	snd_emu10k1_ptr_write(emu, SOLEH, 0, 0);
+	snd_emu10k1_ptr_write_multiple(emu, 0,
+		/* reset recording buffers */
+		MICBS, 0,
+		MICBA, 0,
+		FXBS, 0,
+		FXBA, 0,
+		FXWC, 0,
+		ADCBS, ADCBS_BUFSIZE_NONE,
+		ADCBA, 0,
+		TCBS, TCBS_BUFFSIZE_16K,
+		TCB, 0,
+
+		/* disable channel interrupt */
+		CLIEL, 0,
+		CLIEH, 0,
+		SOLEL, 0,
+		SOLEH, 0,
+
+		PTB, 0,
+
+		REGLIST_END);
 
 	/* disable audio and lock cache */
 	outl(HCFG_LOCKSOUNDCACHE | HCFG_LOCKTANKCACHE_MASK | HCFG_MUTEBUTTONENABLE, emu->port + HCFG);
-	snd_emu10k1_ptr_write(emu, PTB, 0, 0);
 
 	return 0;
 }
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 3a7f25f81504..183051e846f2 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -1396,10 +1396,10 @@ static const struct snd_kcontrol_new snd_emu10k1_spdif_control =
 static void update_emu10k1_fxrt(struct snd_emu10k1 *emu, int voice, unsigned char *route)
 {
 	if (emu->audigy) {
-		snd_emu10k1_ptr_write(emu, A_FXRT1, voice,
-				      snd_emu10k1_compose_audigy_fxrt1(route));
-		snd_emu10k1_ptr_write(emu, A_FXRT2, voice,
-				      snd_emu10k1_compose_audigy_fxrt2(route));
+		snd_emu10k1_ptr_write_multiple(emu, voice,
+			A_FXRT1, snd_emu10k1_compose_audigy_fxrt1(route),
+			A_FXRT2, snd_emu10k1_compose_audigy_fxrt2(route),
+			REGLIST_END);
 	} else {
 		snd_emu10k1_ptr_write(emu, FXRT, voice,
 				      snd_emu10k1_compose_send_routing(route));
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 9045359bb461..1ca16f0ddbed 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -268,47 +268,43 @@ static void snd_emu10k1_pcm_init_voice(struct snd_emu10k1 *emu,
 		memcpy(send_routing, &mix->send_routing[tmp][0], 8);
 		memcpy(send_amount, &mix->send_volume[tmp][0], 8);
 	}
-
-	if (stereo) {
-		// Not really necessary for the slave, but it doesn't hurt
-		snd_emu10k1_ptr_write(emu, CPF, voice, CPF_STEREO_MASK);
-	} else {
-		snd_emu10k1_ptr_write(emu, CPF, voice, 0);
-	}
-
-	/* setup routing */
-	if (emu->audigy) {
-		snd_emu10k1_ptr_write(emu, A_FXRT1, voice,
-				      snd_emu10k1_compose_audigy_fxrt1(send_routing));
-		snd_emu10k1_ptr_write(emu, A_FXRT2, voice,
-				      snd_emu10k1_compose_audigy_fxrt2(send_routing));
-		snd_emu10k1_ptr_write(emu, A_SENDAMOUNTS, voice,
-				      snd_emu10k1_compose_audigy_sendamounts(send_amount));
-	} else
-		snd_emu10k1_ptr_write(emu, FXRT, voice,
-				      snd_emu10k1_compose_send_routing(send_routing));
-	/* Assumption that PT is already 0 so no harm overwriting */
-	snd_emu10k1_ptr_write(emu, PTRX, voice, (send_amount[0] << 8) | send_amount[1]);
-	// Stereo slaves don't need to have the addresses set, but it doesn't hurt
-	snd_emu10k1_ptr_write(emu, DSL, voice, end_addr | (send_amount[3] << 24));
-	snd_emu10k1_ptr_write(emu, PSST, voice, start_addr | (send_amount[2] << 24));
 	if (emu->card_capabilities->emu_model)
 		pitch_target = PITCH_48000; /* Disable interpolators on emu1010 card */
-	else 
+	else
 		pitch_target = emu10k1_calc_pitch_target(runtime->rate);
-	snd_emu10k1_ptr_write(emu, CCCA, voice,
-			      emu10k1_select_interprom(pitch_target) |
-			      (w_16 ? 0 : CCCA_8BITSELECT));
-	/* Clear filter delay memory */
-	snd_emu10k1_ptr_write(emu, Z1, voice, 0);
-	snd_emu10k1_ptr_write(emu, Z2, voice, 0);
-	/* invalidate maps */
-	silent_page = ((unsigned int)emu->silent_page.addr << emu->address_mode) | (emu->address_mode ? MAP_PTI_MASK1 : MAP_PTI_MASK0);
-	snd_emu10k1_ptr_write(emu, MAPA, voice, silent_page);
-	snd_emu10k1_ptr_write(emu, MAPB, voice, silent_page);
-	// Disable filter (in conjunction with CCCA_RESONANCE == 0)
-	snd_emu10k1_ptr_write(emu, VTFT, voice, VTFT_FILTERTARGET_MASK);
-	snd_emu10k1_ptr_write(emu, CVCF, voice, CVCF_CURRENTFILTER_MASK);
+	silent_page = ((unsigned int)emu->silent_page.addr << emu->address_mode) |
+		      (emu->address_mode ? MAP_PTI_MASK1 : MAP_PTI_MASK0);
+	snd_emu10k1_ptr_write_multiple(emu, voice,
+		// Not really necessary for the slave, but it doesn't hurt
+		CPF, stereo ? CPF_STEREO_MASK : 0,
+		// Assumption that PT is already 0 so no harm overwriting
+		PTRX, (send_amount[0] << 8) | send_amount[1],
+		// Stereo slaves don't need to have the addresses set, but it doesn't hurt
+		DSL, end_addr | (send_amount[3] << 24),
+		PSST, start_addr | (send_amount[2] << 24),
+		CCCA, emu10k1_select_interprom(pitch_target) |
+		      (w_16 ? 0 : CCCA_8BITSELECT),
+		// Clear filter delay memory
+		Z1, 0,
+		Z2, 0,
+		// Invalidate maps
+		MAPA, silent_page,
+		MAPB, silent_page,
+		// Disable filter (in conjunction with CCCA_RESONANCE == 0)
+		VTFT, VTFT_FILTERTARGET_MASK,
+		CVCF, CVCF_CURRENTFILTER_MASK,
+		REGLIST_END);
+	// Setup routing
+	if (emu->audigy) {
+		snd_emu10k1_ptr_write_multiple(emu, voice,
+			A_FXRT1, snd_emu10k1_compose_audigy_fxrt1(send_routing),
+			A_FXRT2, snd_emu10k1_compose_audigy_fxrt2(send_routing),
+			A_SENDAMOUNTS, snd_emu10k1_compose_audigy_sendamounts(send_amount),
+			REGLIST_END);
+	} else {
+		snd_emu10k1_ptr_write(emu, FXRT, voice,
+				      snd_emu10k1_compose_send_routing(send_routing));
+	}
 
 	spin_unlock_irqrestore(&emu->reg_lock, flags);
 }
@@ -466,8 +462,10 @@ static int snd_emu10k1_capture_prepare(struct snd_pcm_substream *substream)
 		break;
 	case CAPTURE_EFX:
 		if (emu->audigy) {
-			snd_emu10k1_ptr_write(emu, A_FXWC1, 0, 0);
-			snd_emu10k1_ptr_write(emu, A_FXWC2, 0, 0);
+			snd_emu10k1_ptr_write_multiple(emu, 0,
+				A_FXWC1, 0,
+				A_FXWC2, 0,
+				REGLIST_END);
 		} else
 			snd_emu10k1_ptr_write(emu, FXWC, 0, 0);
 		break;
@@ -574,8 +572,10 @@ static void snd_emu10k1_playback_commit_volume(struct snd_emu10k1 *emu,
 					       struct snd_emu10k1_voice *evoice,
 					       unsigned int vattn)
 {
-	snd_emu10k1_ptr_write(emu, VTFT, evoice->number, vattn | VTFT_FILTERTARGET_MASK);
-	snd_emu10k1_ptr_write(emu, CVCF, evoice->number, vattn | CVCF_CURRENTFILTER_MASK);
+	snd_emu10k1_ptr_write_multiple(emu, evoice->number,
+		VTFT, vattn | VTFT_FILTERTARGET_MASK,
+		CVCF, vattn | CVCF_CURRENTFILTER_MASK,
+		REGLIST_END);
 }
 
 static void snd_emu10k1_playback_unmute_voice(struct snd_emu10k1 *emu,
@@ -716,8 +716,10 @@ static int snd_emu10k1_capture_trigger(struct snd_pcm_substream *substream,
 			break;
 		case CAPTURE_EFX:
 			if (emu->audigy) {
-				snd_emu10k1_ptr_write(emu, A_FXWC1, 0, epcm->capture_cr_val);
-				snd_emu10k1_ptr_write(emu, A_FXWC2, 0, epcm->capture_cr_val2);
+				snd_emu10k1_ptr_write_multiple(emu, 0,
+					A_FXWC1, epcm->capture_cr_val,
+					A_FXWC2, epcm->capture_cr_val2,
+					REGLIST_END);
 				dev_dbg(emu->card->dev,
 					"cr_val=0x%x, cr_val2=0x%x\n",
 					epcm->capture_cr_val,
@@ -744,8 +746,10 @@ static int snd_emu10k1_capture_trigger(struct snd_pcm_substream *substream,
 			break;
 		case CAPTURE_EFX:
 			if (emu->audigy) {
-				snd_emu10k1_ptr_write(emu, A_FXWC1, 0, 0);
-				snd_emu10k1_ptr_write(emu, A_FXWC2, 0, 0);
+				snd_emu10k1_ptr_write_multiple(emu, 0,
+					A_FXWC1, 0,
+					A_FXWC2, 0,
+					REGLIST_END);
 			} else
 				snd_emu10k1_ptr_write(emu, FXWC, 0, 0);
 			break;
@@ -1562,12 +1566,14 @@ static int snd_emu10k1_fx8010_playback_prepare(struct snd_pcm_substream *substre
 	pcm->pcm_rec.sw_buffer_size = snd_pcm_lib_buffer_bytes(substream);
 	pcm->tram_pos = INITIAL_TRAM_POS(pcm->buffer_size);
 	pcm->tram_shift = 0;
-	snd_emu10k1_ptr_write(emu, emu->gpr_base + pcm->gpr_running, 0, 0);	/* reset */
-	snd_emu10k1_ptr_write(emu, emu->gpr_base + pcm->gpr_trigger, 0, 0);	/* reset */
-	snd_emu10k1_ptr_write(emu, emu->gpr_base + pcm->gpr_size, 0, runtime->buffer_size);
-	snd_emu10k1_ptr_write(emu, emu->gpr_base + pcm->gpr_ptr, 0, 0);		/* reset ptr number */
-	snd_emu10k1_ptr_write(emu, emu->gpr_base + pcm->gpr_count, 0, runtime->period_size);
-	snd_emu10k1_ptr_write(emu, emu->gpr_base + pcm->gpr_tmpcount, 0, runtime->period_size);
+	snd_emu10k1_ptr_write_multiple(emu, 0,
+		emu->gpr_base + pcm->gpr_running, 0,	/* reset */
+		emu->gpr_base + pcm->gpr_trigger, 0,	/* reset */
+		emu->gpr_base + pcm->gpr_size, runtime->buffer_size,
+		emu->gpr_base + pcm->gpr_ptr, 0,	/* reset ptr number */
+		emu->gpr_base + pcm->gpr_count, runtime->period_size,
+		emu->gpr_base + pcm->gpr_tmpcount, runtime->period_size,
+		REGLIST_END);
 	for (i = 0; i < pcm->channels; i++)
 		snd_emu10k1_ptr_write(emu, TANKMEMADDRREGBASE + 0x80 + pcm->etram[i], 0, (TANKMEMADDRREG_READ|TANKMEMADDRREG_ALIGN) + i * (runtime->buffer_size / pcm->channels));
 	return 0;
diff --git a/sound/pci/emu10k1/io.c b/sound/pci/emu10k1/io.c
index 36fd6f7a0a2c..6419719c739c 100644
--- a/sound/pci/emu10k1/io.c
+++ b/sound/pci/emu10k1/io.c
@@ -94,6 +94,37 @@ void snd_emu10k1_ptr_write(struct snd_emu10k1 *emu, unsigned int reg, unsigned i
 
 EXPORT_SYMBOL(snd_emu10k1_ptr_write);
 
+void snd_emu10k1_ptr_write_multiple(struct snd_emu10k1 *emu, unsigned int chn, ...)
+{
+	va_list va;
+	u32 addr_mask;
+	unsigned long flags;
+
+	if (snd_BUG_ON(!emu))
+		return;
+	if (snd_BUG_ON(chn & ~PTR_CHANNELNUM_MASK))
+		return;
+	addr_mask = ~((emu->audigy ? A_PTR_ADDRESS_MASK : PTR_ADDRESS_MASK) >> 16);
+
+	va_start(va, chn);
+	spin_lock_irqsave(&emu->emu_lock, flags);
+	for (;;) {
+		u32 data;
+		u32 reg = va_arg(va, u32);
+		if (reg == REGLIST_END)
+			break;
+		data = va_arg(va, u32);
+		if (snd_BUG_ON(reg & addr_mask))  // Only raw registers supported here
+			continue;
+		outl((reg << 16) | chn, emu->port + PTR);
+		outl(data, emu->port + DATA);
+	}
+	spin_unlock_irqrestore(&emu->emu_lock, flags);
+	va_end(va);
+}
+
+EXPORT_SYMBOL(snd_emu10k1_ptr_write_multiple);
+
 unsigned int snd_emu10k1_ptr20_read(struct snd_emu10k1 * emu, 
 					  unsigned int reg, 
 					  unsigned int chn)
-- 
2.40.0.152.g15d061e6df

