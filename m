Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0A26EBA45
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Apr 2023 18:15:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F12F6F1A;
	Sat, 22 Apr 2023 18:14:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F12F6F1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682180138;
	bh=jvo2HPqrUvE8mUNFrBmDogG5E4DLaLWoqgDCWcqMR14=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VDXBMSpUn7sTpSXZVaaXWZXiWwTBzbFGRPwabhvkKsDQkdxCTX7lGoRE8pnQ6F4uq
	 b2EesWRB7ZZtGt7A9IdpvYhe/FzblPH8CdbgBMwZ3D68TrjTVUwRMSUD/p1DlHiAhE
	 syvmA6vvAHWqMe7v9zMWKiyLJsChqLYB9neYdR20=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CACEF80544;
	Sat, 22 Apr 2023 18:12:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10CBAF80558; Sat, 22 Apr 2023 18:12:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF05AF80212
	for <alsa-devel@alsa-project.org>; Sat, 22 Apr 2023 18:10:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF05AF80212
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 7EE3224151;
	Sat, 22 Apr 2023 12:10:21 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pqFob-naP-00; Sat, 22 Apr 2023 18:10:21 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/7] ALSA: emu10k1: comment updates
Date: Sat, 22 Apr 2023 18:10:15 +0200
Message-Id: <20230422161021.1143903-2-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230422161021.1143903-1-oswald.buddenhagen@gmx.de>
References: <20230422161021.1143903-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PL6KT7M6CQ35IC2VMNFQYVOZBK6WBHQK
X-Message-ID-Hash: PL6KT7M6CQ35IC2VMNFQYVOZBK6WBHQK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PL6KT7M6CQ35IC2VMNFQYVOZBK6WBHQK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move comments to better locations, de-duplicate, fix/remove incorrect/
outdated ones, add new ones, and unify spacing somewhat.

While at it, also add testing credits for Jonathan Dowland (SB Live!
Platinum) and myself (E-MU 0404b).

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h          | 502 +++++++++++++++----------------
 include/uapi/sound/emu10k1.h     |   3 +
 sound/pci/emu10k1/emu10k1.c      |  11 -
 sound/pci/emu10k1/emu10k1_main.c |  77 +++--
 sound/pci/emu10k1/emufx.c        |  12 +-
 sound/pci/emu10k1/emumixer.c     |   5 +-
 sound/pci/emu10k1/emupcm.c       |  26 +-
 sound/pci/emu10k1/io.c           |   8 -
 sound/pci/emu10k1/p16v.h         |   2 +-
 sound/pci/emu10k1/p17v.h         |   4 +-
 10 files changed, 311 insertions(+), 339 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 790dedd42340..7786d5807679 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -97,9 +97,9 @@
 #define IPR_CHANNELLOOP		0x00000040	/* Channel (half) loop interrupt(s) pending	*/
 #define IPR_CHANNELNUMBERMASK	0x0000003f	/* When IPR_CHANNELLOOP is set, indicates the	*/
 						/* highest set channel in CLIPL, CLIPH, HLIPL,  */
-						/* or HLIPH.  When IP is written with CL set,	*/
+						/* or HLIPH.  When IPR is written with CL set,	*/
 						/* the bit in H/CLIPL or H/CLIPH corresponding	*/
-						/* to the CIN value written will be cleared.	*/
+						/* to the CN value written will be cleared.	*/
 
 #define INTE			0x0c		/* Interrupt enable register			*/
 #define INTE_VIRTUALSB_MASK	0xc0000000	/* Virtual Soundblaster I/O port capture	*/
@@ -180,6 +180,7 @@
 #define HCFG_CODECFORMAT_MASK	0x00030000	/* CODEC format					*/
 
 /* Specific to Alice2, CA0102 */
+
 #define HCFG_CODECFORMAT_AC97_1	0x00000000	/* AC97 CODEC format -- Ver 1.03		*/
 #define HCFG_CODECFORMAT_AC97_2	0x00010000	/* AC97 CODEC format -- Ver 2.1			*/
 #define HCFG_AUTOMUTE_ASYNC	0x00008000	/* When set, the async sample rate convertors	*/
@@ -200,9 +201,8 @@
  						/* I2S format input				*/
 /* Rest of HCFG 0x0000000f same as below. LOCKSOUNDCACHE etc.  */
 
-
-
 /* Older chips */
+
 #define HCFG_CODECFORMAT_AC97	0x00000000	/* AC97 CODEC format -- Primary Output		*/
 #define HCFG_CODECFORMAT_I2S	0x00010000	/* I2S CODEC format -- Secondary (Rear) Output	*/
 #define HCFG_GPINPUT0		0x00004000	/* External pin112				*/
@@ -238,7 +238,7 @@
 						/* Should be set to 1 when the EMU10K1 is	*/
 						/* completely initialized.			*/
 
-//For Audigy, MPU port move to 0x70-0x74 ptr register
+// On Audigy, the MPU port moved to the 0x70-0x74 ptr registers
 
 #define MUDATA			0x18		/* MPU401 data register (8 bits)       		*/
 
@@ -277,12 +277,6 @@
 #define A_IOCFG_REAR_JACK       0x8000
 #define A_IOCFG_PHONES_JACK     0x0100          /* LiveDrive					*/
 
-/* outputs:
- *	for audigy2 platinum:	0xa00
- *	for a2 platinum ex:	0x1c00
- *	for a1 platinum:	0x0
- */
-
 #define TIMER			0x1a		/* Timer terminal count register		*/
 						/* NOTE: After the rate is changed, a maximum	*/
 						/* of 1024 sample periods should be allowed	*/
@@ -323,7 +317,7 @@
 						/* 0x00000000 2-channel output. */
 						/* 0x00000200 8-channel output. */
 						/* 0x00000004 pauses stream/irq fail. */
-						/* Rest of bits no nothing to sound output */
+						/* Rest of bits do nothing to sound output */
 						/* bit 0: Enable P16V audio.
 						 * bit 1: Lock P16V record memory cache.
 						 * bit 2: Lock P16V playback memory cache.
@@ -337,6 +331,7 @@
 						 */
 #define IPR3			0x38		/* Cdif interrupt pending register		*/
 #define INTE3			0x3c		/* Cdif interrupt enable register. 	*/
+
 /************************************************************************************************/
 /* PCI function 1 registers, address = <val> + PCIBASE1						*/
 /************************************************************************************************/
@@ -355,11 +350,38 @@
 #define JOYSTICK_BUTTONS	0x0f		/* Joystick button data				*/
 #define JOYSTICK_COMPARATOR	0xf0		/* Joystick comparator data			*/
 
-
 /********************************************************************************************************/
 /* Emu10k1 pointer-offset register set, accessed through the PTR and DATA registers			*/
 /********************************************************************************************************/
 
+// No official documentation was released for EMU10K1, but some info
+// about playback can be extrapolated from the EMU8K documents:
+// "AWE32/EMU8000 Programmer’s Guide" (emu8kpgm.pdf) - registers
+// "AWE32 Developer's Information Pack" (adip301.pdf) - high-level view
+
+// The short version:
+// - The engine has 64 playback channels, also called voices. The channels
+//   operate independently, except when paired for stereo (see below).
+// - PCM samples are fetched into the cache; see description of CD0 below.
+// - Samples are consumed at the rate CPF_CURRENTPITCH.
+// - 8-bit samples are transformed upon use: cooked = (raw ^ 0x80) << 8
+// - 8 samples are read at CCR_READADDRESS:CPF_FRACADDRESS and interpolated
+//   according to CCCA_INTERPROM_*. With CCCA_INTERPROM_0 selected and a zero
+//   CPF_FRACADDRESS, this results in CCR_READADDRESS[3] being used verbatim.
+// - The value is multiplied by CVCF_CURRENTVOL.
+// - The value goes through a filter with cutoff CVCF_CURRENTFILTER;
+//   delay stages Z1 and Z2.
+// - The value is added by so-called `sends` to 4 (EMU10K1) / 8 (EMU10K2)
+//   of the 16 (EMU10K1) / 64 (EMU10K2) FX bus accumulators via FXRT*,
+//   multiplied by a per-send amount (*_FXSENDAMOUNT_*).
+//   The scaling of the send amounts is exponential-ish.
+// - The DSP has a go at FXBUS* and outputs the values to EXTOUT* or EMU32OUT*.
+// - The pitch, volume, and filter cutoff can be modulated by two envelope
+//   engines and two low frequency oscillators.
+// - To avoid abrupt changes to the parameters (which may cause audible
+//   distortion), the modulation engine sets the target registers, towards
+//   which the current registers "swerve" gradually.
+
 #define CPF			0x00		/* Current pitch and fraction register			*/
 #define CPF_CURRENTPITCH_MASK	0xffff0000	/* Current pitch (linear, 0x4000 == unity pitch shift) 	*/
 #define CPF_CURRENTPITCH	0x10100000
@@ -399,7 +421,7 @@
 #define PSST_LOOPSTARTADDR_MASK	0x00ffffff	/* Loop start address of the specified channel		*/
 #define PSST_LOOPSTARTADDR	0x18000006
 
-#define DSL			0x07		/* Send D amount and loop start address register	*/
+#define DSL			0x07		/* Send D amount and loop end address register	*/
 #define DSL_FXSENDAMOUNT_D_MASK	0xff000000	/* Linear level of channel output sent to FX send bus D	*/
 
 #define DSL_FXSENDAMOUNT_D	0x08180007
@@ -424,46 +446,48 @@
 #define CCCA_INTERPROM_6	0x0c000000	/* Select interpolation ROM 6				*/
 #define CCCA_INTERPROM_7	0x0e000000	/* Select interpolation ROM 7				*/
 #define CCCA_8BITSELECT		0x01000000	/* 1 = Sound memory for this channel uses 8-bit samples	*/
+						/* 8-bit samples are unsigned, 16-bit ones signed	*/
 #define CCCA_CURRADDR_MASK	0x00ffffff	/* Current address of the selected channel		*/
 #define CCCA_CURRADDR		0x18000008
 
 #define CCR			0x09		/* Cache control register				*/
 #define CCR_CACHEINVALIDSIZE	0x07190009
-#define CCR_CACHEINVALIDSIZE_MASK	0xfe000000	/* Number of invalid samples cache for this channel    	*/
+#define CCR_CACHEINVALIDSIZE_MASK 0xfe000000	/* Number of invalid samples before the read address	*/
 #define CCR_CACHELOOPFLAG	0x01000000	/* 1 = Cache has a loop service pending			*/
 #define CCR_INTERLEAVEDSAMPLES	0x00800000	/* 1 = A cache service will fetch interleaved samples	*/
+						/* Auto-set from CPF_STEREO_MASK			*/
 #define CCR_WORDSIZEDSAMPLES	0x00400000	/* 1 = A cache service will fetch word sized samples	*/
+						/* Auto-set from CCCA_8BITSELECT			*/
 #define CCR_READADDRESS		0x06100009
-#define CCR_READADDRESS_MASK	0x003f0000	/* Location of cache just beyond current cache service	*/
+#define CCR_READADDRESS_MASK	0x003f0000	/* Next cached sample to play				*/
 #define CCR_LOOPINVALSIZE	0x0000fe00	/* Number of invalid samples in cache prior to loop	*/
 						/* NOTE: This is valid only if CACHELOOPFLAG is set	*/
 #define CCR_LOOPFLAG		0x00000100	/* Set for a single sample period when a loop occurs	*/
-#define CCR_CACHELOOPADDRHI	0x000000ff	/* DSL_LOOPSTARTADDR's hi byte if CACHELOOPFLAG is set	*/
+#define CCR_CACHELOOPADDRHI	0x000000ff	/* CLP_LOOPSTARTADDR's hi byte if CACHELOOPFLAG is set	*/
 
 #define CLP			0x0a		/* Cache loop register (valid if CCR_CACHELOOPFLAG = 1) */
 						/* NOTE: This register is normally not used		*/
-#define CLP_CACHELOOPADDR	0x0000ffff	/* Cache loop address (DSL_LOOPSTARTADDR [0..15])	*/
+#define CLP_CACHELOOPADDR	0x0000ffff	/* Cache loop address low word				*/
 
 #define FXRT			0x0b		/* Effects send routing register			*/
 						/* NOTE: It is illegal to assign the same routing to	*/
 						/* two effects sends.					*/
 #define FXRT_CHANNELA		0x000f0000	/* Effects send bus number for channel's effects send A	*/
 #define FXRT_CHANNELB		0x00f00000	/* Effects send bus number for channel's effects send B	*/
 #define FXRT_CHANNELC		0x0f000000	/* Effects send bus number for channel's effects send C	*/
 #define FXRT_CHANNELD		0xf0000000	/* Effects send bus number for channel's effects send D	*/
 
 #define A_HR			0x0b	/* High Resolution. 24bit playback from host to DSP. */
 #define MAPA			0x0c		/* Cache map A						*/
-
 #define MAPB			0x0d		/* Cache map B						*/
 
 #define MAP_PTE_MASK0		0xfffff000	/* The 20 MSBs of the PTE indexed by the PTI		*/
 #define MAP_PTI_MASK0		0x00000fff	/* The 12 bit index to one of the 4096 PTE dwords      	*/
 
 #define MAP_PTE_MASK1		0xffffe000	/* The 19 MSBs of the PTE indexed by the PTI		*/
 #define MAP_PTI_MASK1		0x00001fff	/* The 13 bit index to one of the 8192 PTE dwords      	*/
 
-/* 0x0e, 0x0f: Not used */
+/* 0x0e, 0x0f: Internal state, at least on Audigy */
 
 #define ENVVOL			0x10		/* Volume envelope register				*/
 #define ENVVOL_MASK		0x0000ffff	/* Current value of volume envelope state variable	*/  
@@ -476,9 +500,9 @@
 						/* 0 = infinite, 1 = 10.9msec, ... 0x7f = 5.5msec	*/
 
 #define DCYSUSV 		0x12		/* Volume envelope sustain and decay register		*/
-#define DCYSUSV_PHASE1_MASK	0x00008000	/* 0 = Begin attack phase, 1 = begin release phase	*/
+#define DCYSUSV_PHASE1_MASK	0x00008000	/* 0 = Begin decay phase, 1 = begin release phase	*/
 #define DCYSUSV_SUSTAINLEVEL_MASK 0x00007f00	/* 127 = full, 0 = off, 0.75dB increments		*/
-#define DCYSUSV_CHANNELENABLE_MASK 0x00000080	/* 1 = Inhibit envelope engine from writing values in	*/
+#define DCYSUSV_CHANNELENABLE_MASK 0x00000080	/* 0 = Inhibit envelope engine from writing values in	*/
 						/* this channel and from writing to pitch, filter and	*/
 						/* volume targets.					*/
 #define DCYSUSV_DECAYTIME_MASK	0x0000007f	/* Volume envelope decay time, log encoded     		*/
@@ -499,7 +523,7 @@
 						/* 0 = infinite, 1 = 11msec, ... 0x7f = 5.5msec		*/
 
 #define DCYSUSM			0x16		/* Modulation envelope decay and sustain register	*/
-#define DCYSUSM_PHASE1_MASK	0x00008000	/* 0 = Begin attack phase, 1 = begin release phase	*/
+#define DCYSUSM_PHASE1_MASK	0x00008000	/* 0 = Begin decay phase, 1 = begin release phase	*/
 #define DCYSUSM_SUSTAINLEVEL_MASK 0x00007f00	/* 127 = full, 0 = off, 0.75dB increments		*/
 #define DCYSUSM_DECAYTIME_MASK	0x0000007f	/* Envelope decay time, log encoded			*/
 						/* 0 = 43.7msec, 1 = 21.8msec, 0x7f = 22msec		*/
@@ -521,27 +545,26 @@
 #define IFATN_ATTENUATION_MASK	0x000000ff	/* Initial attenuation in 0.375dB steps			*/
 #define IFATN_ATTENUATION	0x08000019
 
-
 #define PEFE			0x1a		/* Pitch envelope and filter envelope amount register	*/
 #define PEFE_PITCHAMOUNT_MASK	0x0000ff00	/* Pitch envlope amount					*/
 						/* Signed 2's complement, +/- one octave peak extremes	*/
 #define PEFE_PITCHAMOUNT	0x0808001a
 #define PEFE_FILTERAMOUNT_MASK	0x000000ff	/* Filter envlope amount				*/
 						/* Signed 2's complement, +/- six octaves peak extremes */
 #define PEFE_FILTERAMOUNT	0x0800001a
+
 #define FMMOD			0x1b		/* Vibrato/filter modulation from LFO register		*/
 #define FMMOD_MODVIBRATO	0x0000ff00	/* Vibrato LFO modulation depth				*/
 						/* Signed 2's complement, +/- one octave extremes	*/
 #define FMMOD_MOFILTER		0x000000ff	/* Filter LFO modulation depth				*/
 						/* Signed 2's complement, +/- three octave extremes	*/
 
-
 #define TREMFRQ 		0x1c		/* Tremolo amount and modulation LFO frequency register	*/
 #define TREMFRQ_DEPTH		0x0000ff00	/* Tremolo depth					*/
 						/* Signed 2's complement, with +/- 12dB extremes	*/
-
 #define TREMFRQ_FREQUENCY	0x000000ff	/* Tremolo LFO frequency				*/
 						/* ??Hz steps, maximum of ?? Hz.			*/
+
 #define FM2FRQ2 		0x1d		/* Vibrato amount and vibrato LFO frequency register	*/
 #define FM2FRQ2_DEPTH		0x0000ff00	/* Vibrato LFO vibrato depth				*/
 						/* Signed 2's complement, +/- one octave extremes	*/
@@ -645,17 +668,15 @@
 #define FXBA			0x47		/* FX Buffer Address */
 #define FXBA_MASK		0xfffff000	/* 20 bit base address					*/
 
-#define A_HWM			0x48	/* High PCI Water Mark - word access, defaults to 3f */
+#define A_HWM			0x48		/* High PCI Water Mark - word access, defaults to 3f */
 
 #define MICBS			0x49		/* Microphone buffer size register			*/
 
 #define ADCBS			0x4a		/* ADC buffer size register				*/
 
 #define FXBS			0x4b		/* FX buffer size register				*/
 
-/* register: 0x4c..4f: ffff-ffff current amounts, per-channel */
-
-/* The following mask values define the size of the ADC, MIX and FX buffers in bytes */
+/* The following mask values define the size of the ADC, MIC and FX buffers in bytes */
 #define ADCBS_BUFSIZE_NONE	0x00000000
 #define ADCBS_BUFSIZE_384	0x00000001
 #define ADCBS_BUFSIZE_448	0x00000002
@@ -689,38 +710,30 @@
 #define ADCBS_BUFSIZE_57344	0x0000001e
 #define ADCBS_BUFSIZE_65536	0x0000001f
 
-/* Current Send B, A Amounts */
-#define A_CSBA			0x4c
+#define A_CSBA			0x4c		/* FX send B & A current amounts			*/
+#define A_CSDC			0x4d		/* FX send D & C current amounts			*/
+#define A_CSFE			0x4e		/* FX send F & E current amounts			*/
+#define A_CSHG			0x4f		/* FX send H & G current amounts			*/
 
-/* Current Send D, C Amounts */
-#define A_CSDC			0x4d
+// NOTE: 0x50,51,52: 64-bit (split over voices 0 & 1)
+#define CDCS			0x50		/* CD-ROM digital channel status register		*/
 
-/* Current Send F, E Amounts */
-#define A_CSFE			0x4e
+#define GPSCS			0x51		/* General Purpose SPDIF channel status register	*/
 
-/* Current Send H, G Amounts */
-#define A_CSHG			0x4f
+#define DBG			0x52
 
+#define A_SPSC			0x52		/* S/PDIF Input C Channel Status			*/
 
-#define CDCS			0x50		/* CD-ROM digital channel status register	*/
-
-#define GPSCS			0x51		/* General Purpose SPDIF channel status register*/
-
-#define DBG			0x52		/* DO NOT PROGRAM THIS REGISTER!!! MAY DESTROY CHIP */
-
-/* S/PDIF Input C Channel Status */
-#define A_SPSC			0x52
-
-#define REG53			0x53		/* DO NOT PROGRAM THIS REGISTER!!! MAY DESTROY CHIP */
+#define REG53			0x53		/* DO NOT PROGRAM THIS REGISTER!!! MAY DESTROY CHIP	*/
 
 #define A_DBG			 0x53
 #define A_DBG_SINGLE_STEP	 0x00020000	/* Set to zero to start dsp */
 #define A_DBG_ZC		 0x40000000	/* zero tram counter */
 #define A_DBG_STEP_ADDR		 0x000003ff
 #define A_DBG_SATURATION_OCCURED 0x20000000
 #define A_DBG_SATURATION_ADDR	 0x0ffc0000
 
-// NOTE: 0x54,55,56: 64-bit
+// NOTE: 0x54,55,56: 64-bit (split over voices 0 & 1)
 #define SPCS0			0x54		/* SPDIF output Channel Status 0 register	*/
 
 #define SPCS1			0x55		/* SPDIF output Channel Status 1 register	*/
@@ -753,33 +766,29 @@
 
 /* 0x57: Not used */
 
-/* The 32-bit CLIx and SOLx registers all have one bit per channel control/status      		*/
+/* The 32-bit CLIx and SOLEx registers all have one bit per channel control/status      	*/
 #define CLIEL			0x58		/* Channel loop interrupt enable low register	*/
-
 #define CLIEH			0x59		/* Channel loop interrupt enable high register	*/
 
 #define CLIPL			0x5a		/* Channel loop interrupt pending low register	*/
-
 #define CLIPH			0x5b		/* Channel loop interrupt pending high register	*/
 
 #define SOLEL			0x5c		/* Stop on loop enable low register		*/
-
 #define SOLEH			0x5d		/* Stop on loop enable high register		*/
 
 #define SPBYPASS		0x5e		/* SPDIF BYPASS mode register			*/
 #define SPBYPASS_SPDIF0_MASK	0x00000003	/* SPDIF 0 bypass mode				*/
 #define SPBYPASS_SPDIF1_MASK	0x0000000c	/* SPDIF 1 bypass mode				*/
 /* bypass mode: 0 - DSP; 1 - SPDIF A, 2 - SPDIF B, 3 - SPDIF C					*/
 #define SPBYPASS_FORMAT		0x00000f00      /* If 1, SPDIF XX uses 24 bit, if 0 - 20 bit	*/
 
 #define AC97SLOT		0x5f            /* additional AC97 slots enable bits		*/
-#define AC97SLOT_REAR_RIGHT	0x01		/* Rear left */
-#define AC97SLOT_REAR_LEFT	0x02		/* Rear right */
-#define AC97SLOT_CNTR		0x10            /* Center enable */
-#define AC97SLOT_LFE		0x20            /* LFE enable */
+#define AC97SLOT_REAR_RIGHT	0x01		/* Rear left					*/
+#define AC97SLOT_REAR_LEFT	0x02		/* Rear right					*/
+#define AC97SLOT_CNTR		0x10            /* Center enable				*/
+#define AC97SLOT_LFE		0x20            /* LFE enable					*/
 
-/* PCB Revision */
-#define A_PCB			0x5f
+#define A_PCB			0x5f		/* PCB Revision					*/
 
 // NOTE: 0x60,61,62: 64-bit
 #define CDSRCS			0x60		/* CD-ROM Sample Rate Converter status register	*/
@@ -819,27 +828,21 @@
 #define FXIDX_MASK		0x0000ffff	/* 16-bit value					*/
 #define FXIDX_IDX		0x10000065
 
-/* The 32-bit HLIx and HLIPx registers all have one bit per channel control/status      		*/
+/* The 32-bit HLIEx and HLIPx registers all have one bit per channel control/status      		*/
 #define HLIEL			0x66		/* Channel half loop interrupt enable low register	*/
-
 #define HLIEH			0x67		/* Channel half loop interrupt enable high register	*/
 
 #define HLIPL			0x68		/* Channel half loop interrupt pending low register	*/
-
 #define HLIPH			0x69		/* Channel half loop interrupt pending high register	*/
 
-/* S/PDIF Host Record Index (bypasses SRC) */
-#define A_SPRI			0x6a
-/* S/PDIF Host Record Address */
-#define A_SPRA			0x6b
-/* S/PDIF Host Record Control */
-#define A_SPRC			0x6c
-/* Delayed Interrupt Counter & Enable */
-#define A_DICE			0x6d
-/* Tank Table Base */
-#define A_TTB			0x6e
-/* Tank Delay Offset */
-#define A_TDOF			0x6f
+#define A_SPRI			0x6a		/* S/PDIF Host Record Index (bypasses SRC)	*/
+#define A_SPRA			0x6b		/* S/PDIF Host Record Address			*/
+#define A_SPRC			0x6c		/* S/PDIF Host Record Control			*/
+
+#define A_DICE			0x6d		/* Delayed Interrupt Counter & Enable		*/
+
+#define A_TTB			0x6e		/* Tank Table Base				*/
+#define A_TDOF			0x6f		/* Tank Delay Offset				*/
 
 /* This is the MPU port on the card (via the game port)						*/
 #define A_MUDATA1		0x70
@@ -852,7 +855,7 @@
 #define A_MUSTAT2		A_MUCMD2	
 
 /* The next two are the Audigy equivalent of FXWC						*/
-/* the Audigy can record any output (16bit, 48kHz, up to 64 channel simultaneously) 		*/
+/* the Audigy can record any output (16bit, 48kHz, up to 64 channels simultaneously) 		*/
 /* Each bit selects a channel for recording */
 #define A_FXWC1			0x74            /* Selects 0x7f-0x60 for FX recording           */
 #define A_FXWC2			0x75		/* Selects 0x9f-0x80 for FX recording           */
@@ -880,20 +883,13 @@
 #define A_PCM_96000		0x00004000
 #define A_PCM_44100		0x00008000
 
-/* I2S0 Sample Rate Tracker Status */
-#define A_SRT3			0x77
-
-/* I2S1 Sample Rate Tracker Status */
-#define A_SRT4			0x78
-
-/* I2S2 Sample Rate Tracker Status */
-#define A_SRT5			0x79
+#define A_SRT3			0x77		/* I2S0 Sample Rate Tracker Status		*/
+#define A_SRT4			0x78		/* I2S1 Sample Rate Tracker Status		*/
+#define A_SRT5			0x79		/* I2S2 Sample Rate Tracker Status		*/
 /* - default to 0x01080000 on my audigy 2 ZS --rlrevell	*/
 
-/* Tank Table DMA Address */
-#define A_TTDA			0x7a
-/* Tank Table DMA Data */
-#define A_TTDD			0x7b
+#define A_TTDA			0x7a		/* Tank Table DMA Address			*/
+#define A_TTDD			0x7b		/* Tank Table DMA Data				*/
 
 #define A_FXRT2			0x7c
 #define A_FXRT_CHANNELE		0x0000003f	/* Effects send bus number for channel's effects send E	*/
@@ -906,6 +902,7 @@
 #define A_FXSENDAMOUNT_F_MASK	0x00FF0000
 #define A_FXSENDAMOUNT_G_MASK	0x0000FF00
 #define A_FXSENDAMOUNT_H_MASK	0x000000FF
+
 /* 0x7c, 0x7e "high bit is used for filtering" */
  
 /* The send amounts for this one are the same as used with the emu10k1 */
@@ -956,15 +953,47 @@
 #define A_HIWORD_RESULT_MASK	0x007ff000
 #define A_HIWORD_OPA_MASK	0x000007ff
 
+
 /************************************************************************************************/
-/* EMU1010m HANA FPGA registers									*/
+/* E-MU Digital Audio System overview								*/
 /************************************************************************************************/
+
+// - These cards use a regular PCI-attached Audigy chip (Alice2/Tina/Tina2);
+//   the PCIe variants simply put the Audigy chip behind a PCI bridge.
+// - All physical PCM I/O is routed through an additional FPGA; the regular
+//   EXTIN/EXTOUT ports are unconnected.
+// - The FPGA has a signal routing matrix, to connect each destination (output
+//   socket or capture channel) to a source (input socket or playback channel).
+// - The FPGA is controlled via Audigy's GPIO port, while sample data is
+//   transmitted via proprietary EMU32 serial links. On first-generation
+//   E-MU 1010 cards, Audigy's I2S inputs are also used for sample data.
+// - The Audio/Micro Dock is attached to Hana via EDI, a "network" link.
+// - The Audigy chip operates in slave mode; the clock is supplied by the FPGA.
+//   Gen1 E-MU 1010 cards have two crystals (for 44.1 kHz and 48 kHz multiples),
+//   while the later cards use a single crystal and a PLL chip.
+// - The whole card is switched to 2x/4x mode to achieve 88.2/96/176.4/192 kHz
+//   sample rates. Alice2/Tina keeps running at 44.1/48 kHz, but multiple channels
+//   are bundled.
+// - The number of available EMU32/EDI channels is hit in 2x/4x mode, so the total
+//   number of usable inputs/outputs is limited, esp. with ADAT in use.
+// - S/PDIF is unavailable in 4x mode (only over TOSLINK on newer 1010 cards) due
+//   to being unspecified at 176.4/192 kHz. Therefore, the Dock's S/PDIF channels
+//   can overlap with the Dock's ADC/DAC's high channels.
+// - The code names are mentioned below and in the emu_chip_details table.
+
+/************************************************************************************************/
+/* EMU1010 FPGA registers									*/
+/************************************************************************************************/
+
 #define EMU_HANA_DESTHI		0x00	/* 0000xxx  3 bits Link Destination */
 #define EMU_HANA_DESTLO		0x01	/* 00xxxxx  5 bits */
+
 #define EMU_HANA_SRCHI		0x02	/* 0000xxx  3 bits Link Source */
 #define EMU_HANA_SRCLO		0x03	/* 00xxxxx  5 bits */
+
 #define EMU_HANA_DOCK_PWR	0x04	/* 000000x  1 bits Audio Dock power */
 #define EMU_HANA_DOCK_PWR_ON		0x01 /* Audio Dock power on */
+
 #define EMU_HANA_WCLOCK		0x05	/* 0000xxx  3 bits Word Clock source select  */
 					/* Must be written after power on to reset DLL */
 					/* One is unable to detect the Audio dock without this */
@@ -1073,21 +1102,19 @@
 #define EMU_HANA_0202_DAC_PAD1	0x10	/* 14dB Attenuation on 0202 DAC 1. Left and Right */
 
 /* 0x14 - 0x1f Unused R/W registers */
-#define EMU_HANA_IRQ_STATUS	0x20	/* 000xxxx  4 bits IRQ Status  */
-#if 0  /* Already defined for reg 0x09 IRQ_ENABLE */
-#define EMU_HANA_IRQ_WCLK_CHANGED	0x01
-#define EMU_HANA_IRQ_ADAT		0x02
-#define EMU_HANA_IRQ_DOCK		0x04
-#define EMU_HANA_IRQ_DOCK_LOST		0x08
-#endif
+
+#define EMU_HANA_IRQ_STATUS	0x20	/* 00xxxxx  5 bits IRQ Status  */
+					/* Same bits as for EMU_HANA_IRQ_ENABLE */
+					/* Reading the register resets it. */
 
 #define EMU_HANA_OPTION_CARDS	0x21	/* 000xxxx  4 bits Presence of option cards */
-#define EMU_HANA_OPTION_HAMOA	0x01	/* HAMOA card present */
+#define EMU_HANA_OPTION_HAMOA	0x01	/* Hamoa (analog I/O) card present */
 #define EMU_HANA_OPTION_SYNC	0x02	/* Sync card present */
-#define EMU_HANA_OPTION_DOCK_ONLINE	0x04	/* Audio Dock online and FPGA configured */
-#define EMU_HANA_OPTION_DOCK_OFFLINE	0x08	/* Audio Dock online and FPGA not configured */
+#define EMU_HANA_OPTION_DOCK_ONLINE	0x04	/* Audio/Micro dock present and FPGA configured */
+#define EMU_HANA_OPTION_DOCK_OFFLINE	0x08	/* Audio/Micro dock present and FPGA not configured */
 
-#define EMU_HANA_ID		0x22	/* 1010101  7 bits ID byte & 0x7f = 0x55 */
+#define EMU_HANA_ID		0x22	/* 1010101  7 bits ID byte & 0x7f = 0x55 with Alice2 */
+					/* 0010101  5 bits ID byte & 0x1f = 0x15 with Tina/2 */
 
 #define EMU_HANA_MAJOR_REV	0x23	/* 0000xxx  3 bit  Hana FPGA Major rev */
 #define EMU_HANA_MINOR_REV	0x24	/* 0000xxx  3 bit  Hana FPGA Minor rev */
@@ -1110,113 +1137,88 @@
 
 #define EMU_HANA2_WC_SPDIF_HI	0x2e	/* 0xxxxxx  6 bit  HANA2 SPDIF IN Word clock, upper 6 bits */
 #define EMU_HANA2_WC_SPDIF_LO	0x2f	/* 0xxxxxx  6 bit  HANA2 SPDIF IN Word clock, lower 6 bits */
+
 /* 0x30 - 0x3f Unused Read only registers */
 
 /************************************************************************************************/
-/* EMU1010m HANA Destinations									*/
+/* EMU1010 Audio Destinations									*/
 /************************************************************************************************/
-/* Hana, original 1010,1212,1820 using Alice2
- * Destiniations for SRATEX = 1X rates: 44.1 kHz or 48 kHz
+/* Hana, original 1010,1212m,1820[m] using Alice2
  * 0x00, 0x00-0x0f: 16 EMU32 channels to Alice2
- * 0x01, 0x10-0x1f: 32 Elink channels to Audio Dock
- * 0x01, 0x00: Dock DAC 1 Left
- * 0x01, 0x04: Dock DAC 1 Right
- * 0x01, 0x08: Dock DAC 2 Left
- * 0x01, 0x0c: Dock DAC 2 Right
- * 0x01, 0x10: Dock DAC 3 Left
- * 0x01, 0x12: PHONES Left
- * 0x01, 0x14: Dock DAC 3 Right
- * 0x01, 0x16: PHONES Right
- * 0x01, 0x18: Dock DAC 4 Left
- * 0x01, 0x1a: S/PDIF Left
- * 0x01, 0x1c: Dock DAC 4 Right
- * 0x01, 0x1e: S/PDIF Right
+ * 0x01, 0x00-0x1f: 32 EDI channels to Audio Dock
+ *       0x00: Dock DAC 1 Left
+ *       0x04: Dock DAC 1 Right
+ *       0x08: Dock DAC 2 Left
+ *       0x0c: Dock DAC 2 Right
+ *       0x10: Dock DAC 3 Left
+ *       0x12: PHONES Left (n/a in 2x/4x mode; output mirrors DAC4 Left)
+ *       0x14: Dock DAC 3 Right
+ *       0x16: PHONES Right (n/a in 2x/4x mode; output mirrors DAC4 Right)
+ *       0x18: Dock DAC 4 Left
+ *       0x1a: S/PDIF Left
+ *       0x1c: Dock DAC 4 Right
+ *       0x1e: S/PDIF Right
  * 0x02, 0x00: Hana S/PDIF Left
  * 0x02, 0x01: Hana S/PDIF Right
- * 0x03, 0x00: Hanoa DAC Left
- * 0x03, 0x01: Hanoa DAC Right
+ * 0x03, 0x00: Hamoa DAC Left
+ * 0x03, 0x01: Hamoa DAC Right
  * 0x04, 0x00-0x07: Hana ADAT
  * 0x05, 0x00: I2S0 Left to Alice2
  * 0x05, 0x01: I2S0 Right to Alice2
  * 0x06, 0x00: I2S0 Left to Alice2
  * 0x06, 0x01: I2S0 Right to Alice2
  * 0x07, 0x00: I2S0 Left to Alice2
  * 0x07, 0x01: I2S0 Right to Alice2
  *
  * Hana2 never released, but used Tina
  * Not needed.
  *
- * Hana3, rev2 1010,1212,1616 using Tina
- * Destinations for SRATEX = 1X rates: 44.1 kHz or 48 kHz
+ * Hana3, rev2 1010,1212m,1616[m] using Tina
  * 0x00, 0x00-0x0f: 16 EMU32A channels to Tina
- * 0x01, 0x10-0x1f: 32 EDI channels to Micro Dock
- * 0x01, 0x00: Dock DAC 1 Left
- * 0x01, 0x04: Dock DAC 1 Right
- * 0x01, 0x08: Dock DAC 2 Left
- * 0x01, 0x0c: Dock DAC 2 Right
- * 0x01, 0x10: Dock DAC 3 Left
- * 0x01, 0x12: Dock S/PDIF Left
- * 0x01, 0x14: Dock DAC 3 Right
- * 0x01, 0x16: Dock S/PDIF Right
- * 0x01, 0x18-0x1f: Dock ADAT 0-7
+ * 0x01, 0x00-0x1f: 32 EDI channels to Micro Dock
+ *       0x00: Dock DAC 1 Left
+ *       0x04: Dock DAC 1 Right
+ *       0x08: Dock DAC 2 Left
+ *       0x0c: Dock DAC 2 Right
+ *       0x10: Dock DAC 3 Left
+ *       0x12: Dock S/PDIF Left
+ *       0x14: Dock DAC 3 Right
+ *       0x16: Dock S/PDIF Right
+ *       0x18-0x1f: Dock ADAT 0-7
  * 0x02, 0x00: Hana3 S/PDIF Left
  * 0x02, 0x01: Hana3 S/PDIF Right
- * 0x03, 0x00: Hanoa DAC Left
- * 0x03, 0x01: Hanoa DAC Right
+ * 0x03, 0x00: Hamoa DAC Left
+ * 0x03, 0x01: Hamoa DAC Right
  * 0x04, 0x00-0x07: Hana3 ADAT 0-7
  * 0x05, 0x00-0x0f: 16 EMU32B channels to Tina
  * 0x06-0x07: Not used
  *
  * HanaLite, rev1 0404 using Alice2
- * Destiniations for SRATEX = 1X rates: 44.1 kHz or 48 kHz
- * 0x00, 0x00-0x0f: 16 EMU32 channels to Alice2
- * 0x01: Not used
- * 0x02, 0x00: S/PDIF Left
- * 0x02, 0x01: S/PDIF Right
- * 0x03, 0x00: DAC Left
- * 0x03, 0x01: DAC Right
- * 0x04-0x07: Not used
- *
- * HanaLiteLite, rev2 0404 using Alice2
- * Destiniations for SRATEX = 1X rates: 44.1 kHz or 48 kHz
- * 0x00, 0x00-0x0f: 16 EMU32 channels to Alice2
+ * HanaLiteLite, rev2 0404 using Tina
+ * 0x00, 0x00-0x0f: 16 EMU32 channels to Alice2/Tina
  * 0x01: Not used
  * 0x02, 0x00: S/PDIF Left
  * 0x02, 0x01: S/PDIF Right
  * 0x03, 0x00: DAC Left
  * 0x03, 0x01: DAC Right
  * 0x04-0x07: Not used
  *
  * Mana, Cardbus 1616 using Tina2
- * Destinations for SRATEX = 1X rates: 44.1 kHz or 48 kHz
  * 0x00, 0x00-0x0f: 16 EMU32A channels to Tina2
- * 0x01, 0x10-0x1f: 32 EDI channels to Micro Dock
- * 0x01, 0x00: Dock DAC 1 Left
- * 0x01, 0x04: Dock DAC 1 Right
- * 0x01, 0x08: Dock DAC 2 Left
- * 0x01, 0x0c: Dock DAC 2 Right
- * 0x01, 0x10: Dock DAC 3 Left
- * 0x01, 0x12: Dock S/PDIF Left
- * 0x01, 0x14: Dock DAC 3 Right
- * 0x01, 0x16: Dock S/PDIF Right
- * 0x01, 0x18-0x1f: Dock ADAT 0-7
+ * 0x01, 0x00-0x1f: 32 EDI channels to Micro Dock
+ *       (same as rev2 1010)
  * 0x02: Not used
  * 0x03, 0x00: Mana DAC Left
  * 0x03, 0x01: Mana DAC Right
  * 0x04, 0x00-0x0f: 16 EMU32B channels to Tina2
  * 0x05-0x07: Not used
- *
- *
  */
+
 /* 32-bit destinations of signal in the Hana FPGA. Destinations are either
- * physical outputs of Hana, or outputs going to Alice2 (audigy) for capture
- * - 16 x EMU_DST_ALICE2_EMU32_X.
- */
-/* EMU32 = 32-bit serial channel between Alice2 (audigy) and Hana (FPGA) */
-/* EMU_DST_ALICE2_EMU32_X - data channels from Hana to Alice2 used for capture.
- * Which data is fed into a EMU_DST_ALICE2_EMU32_X channel in Hana depends on
- * setup of mixer control for each destination - see emumixer.c -
- * snd_emu1010_output_enum_ctls[], snd_emu1010_input_enum_ctls[]
+ * physical outputs of Hana, or outputs going to Alice2/Tina for capture -
+ * 16 x EMU_DST_ALICE2_EMU32_X (2x on rev2 boards). Which data is fed into
+ * a channel depends on the mixer control setting for each destination - see
+ * emumixer.c - snd_emu1010_output_enum_ctls[], snd_emu1010_input_enum_ctls[]
  */
 #define EMU_DST_ALICE2_EMU32_0	0x000f	/* 16 EMU32 channels to Alice2 +0 to +0xf */
 #define EMU_DST_ALICE2_EMU32_1	0x0000	/* 16 EMU32 channels to Alice2 +0 to +0xf */
@@ -1286,135 +1288,100 @@
 #define EMU_DST_HAMOA_DAC_RIGHT2	0x0303	/* Hamoa DAC Right, 2nd or 96kHz */
 #define EMU_DST_HAMOA_DAC_RIGHT3	0x0305	/* Hamoa DAC Right, 3rd or 192kHz */
 #define EMU_DST_HAMOA_DAC_RIGHT4	0x0307	/* Hamoa DAC Right, 4th or 192kHz */
+// In S/MUX mode, the samples of one channel are adjacent.
 #define EMU_DST_HANA_ADAT	0x0400	/* Hana ADAT 8 channel out +0 to +7 */
 #define EMU_DST_ALICE_I2S0_LEFT		0x0500	/* Alice2 I2S0 Left */
 #define EMU_DST_ALICE_I2S0_RIGHT	0x0501	/* Alice2 I2S0 Right */
 #define EMU_DST_ALICE_I2S1_LEFT		0x0600	/* Alice2 I2S1 Left */
 #define EMU_DST_ALICE_I2S1_RIGHT	0x0601	/* Alice2 I2S1 Right */
 #define EMU_DST_ALICE_I2S2_LEFT		0x0700	/* Alice2 I2S2 Left */
 #define EMU_DST_ALICE_I2S2_RIGHT	0x0701	/* Alice2 I2S2 Right */
 
 /* Additional destinations for 1616(M)/Microdock */
-/* Microdock S/PDIF OUT Left, 1st or 48kHz only */
-#define EMU_DST_MDOCK_SPDIF_LEFT1	0x0112
-/* Microdock S/PDIF OUT Left, 2nd or 96kHz */
-#define EMU_DST_MDOCK_SPDIF_LEFT2	0x0113
-/* Microdock S/PDIF OUT Right, 1st or 48kHz only */
-#define EMU_DST_MDOCK_SPDIF_RIGHT1	0x0116
-/* Microdock S/PDIF OUT Right, 2nd or 96kHz  */
-#define EMU_DST_MDOCK_SPDIF_RIGHT2	0x0117
-/* Microdock S/PDIF ADAT 8 channel out +8 to +f */
-#define EMU_DST_MDOCK_ADAT		0x0118
 
-/* Headphone jack on 1010 cardbus? 44.1/48kHz only? */
-#define EMU_DST_MANA_DAC_LEFT		0x0300
-/* Headphone jack on 1010 cardbus? 44.1/48kHz only? */
-#define EMU_DST_MANA_DAC_RIGHT		0x0301
+#define EMU_DST_MDOCK_SPDIF_LEFT1	0x0112	/* Microdock S/PDIF OUT Left, 1st or 48kHz only */
+#define EMU_DST_MDOCK_SPDIF_LEFT2	0x0113	/* Microdock S/PDIF OUT Left, 2nd or 96kHz */
+#define EMU_DST_MDOCK_SPDIF_RIGHT1	0x0116	/* Microdock S/PDIF OUT Right, 1st or 48kHz only */
+#define EMU_DST_MDOCK_SPDIF_RIGHT2	0x0117	/* Microdock S/PDIF OUT Right, 2nd or 96kHz  */
+#define EMU_DST_MDOCK_ADAT		0x0118	/* Microdock S/PDIF ADAT 8 channel out +8 to +f */
+
+#define EMU_DST_MANA_DAC_LEFT		0x0300	/* Headphone jack on 1010 cardbus? 44.1/48kHz only? */
+#define EMU_DST_MANA_DAC_RIGHT		0x0301	/* Headphone jack on 1010 cardbus? 44.1/48kHz only? */
 
 /************************************************************************************************/
-/* EMU1010m HANA Sources									*/
+/* EMU1010 Audio Sources									*/
 /************************************************************************************************/
-/* Hana, original 1010,1212,1820 using Alice2
- * Sources SRATEX = 1X rates: 44.1 kHz or 48 kHz
- * 0x00,0x00-0x1f: Silence
- * 0x01, 0x10-0x1f: 32 Elink channels from Audio Dock
- * 0x01, 0x00: Dock Mic A
- * 0x01, 0x04: Dock Mic B
- * 0x01, 0x08: Dock ADC 1 Left
- * 0x01, 0x0c: Dock ADC 1 Right
- * 0x01, 0x10: Dock ADC 2 Left
- * 0x01, 0x14: Dock ADC 2 Right
- * 0x01, 0x18: Dock ADC 3 Left
- * 0x01, 0x1c: Dock ADC 3 Right
- * 0x02, 0x00: Hana ADC Left
- * 0x02, 0x01: Hana ADC Right
+/* Hana, original 1010,1212m,1820[m] using Alice2
+ * 0x00, 0x00-0x1f: Silence
+ * 0x01, 0x00-0x1f: 32 EDI channels from Audio Dock
+ *       0x00: Dock Mic A
+ *       0x04: Dock Mic B
+ *       0x08: Dock ADC 1 Left
+ *       0x0c: Dock ADC 1 Right
+ *       0x10: Dock ADC 2 Left
+ *       0x14: Dock ADC 2 Right
+ *       0x18: Dock ADC 3 Left
+ *       0x1c: Dock ADC 3 Right
+ * 0x02, 0x00: Hamoa ADC Left
+ * 0x02, 0x01: Hamoa ADC Right
  * 0x03, 0x00-0x0f: 16 inputs from Alice2 Emu32A output
  * 0x03, 0x10-0x1f: 16 inputs from Alice2 Emu32B output
  * 0x04, 0x00-0x07: Hana ADAT
  * 0x05, 0x00: Hana S/PDIF Left
  * 0x05, 0x01: Hana S/PDIF Right
  * 0x06-0x07: Not used
  *
  * Hana2 never released, but used Tina
  * Not needed.
  *
- * Hana3, rev2 1010,1212,1616 using Tina
- * Sources SRATEX = 1X rates: 44.1 kHz or 48 kHz
- * 0x00,0x00-0x1f: Silence
- * 0x01, 0x10-0x1f: 32 Elink channels from Audio Dock
- * 0x01, 0x00: Dock Mic A
- * 0x01, 0x04: Dock Mic B
- * 0x01, 0x08: Dock ADC 1 Left
- * 0x01, 0x0c: Dock ADC 1 Right
- * 0x01, 0x10: Dock ADC 2 Left
- * 0x01, 0x12: Dock S/PDIF Left
- * 0x01, 0x14: Dock ADC 2 Right
- * 0x01, 0x16: Dock S/PDIF Right
- * 0x01, 0x18-0x1f: Dock ADAT 0-7
- * 0x01, 0x18: Dock ADC 3 Left
- * 0x01, 0x1c: Dock ADC 3 Right
- * 0x02, 0x00: Hanoa ADC Left
- * 0x02, 0x01: Hanoa ADC Right
+ * Hana3, rev2 1010,1212m,1616[m] using Tina
+ * 0x00, 0x00-0x1f: Silence
+ * 0x01, 0x00-0x1f: 32 EDI channels from Micro Dock
+ *       0x00: Dock Mic A
+ *       0x04: Dock Mic B
+ *       0x08: Dock ADC 1 Left
+ *       0x0c: Dock ADC 1 Right
+ *       0x10: Dock ADC 2 Left
+ *       0x12: Dock S/PDIF Left
+ *       0x14: Dock ADC 2 Right
+ *       0x16: Dock S/PDIF Right
+ *       0x18-0x1f: Dock ADAT 0-7
+ * 0x02, 0x00: Hamoa ADC Left
+ * 0x02, 0x01: Hamoa ADC Right
  * 0x03, 0x00-0x0f: 16 inputs from Tina Emu32A output
  * 0x03, 0x10-0x1f: 16 inputs from Tina Emu32B output
  * 0x04, 0x00-0x07: Hana3 ADAT
  * 0x05, 0x00: Hana3 S/PDIF Left
  * 0x05, 0x01: Hana3 S/PDIF Right
  * 0x06-0x07: Not used
  *
  * HanaLite, rev1 0404 using Alice2
- * Sources SRATEX = 1X rates: 44.1 kHz or 48 kHz
- * 0x00,0x00-0x1f: Silence
+ * HanaLiteLite, rev2 0404 using Tina
+ * 0x00, 0x00-0x1f: Silence
  * 0x01: Not used
  * 0x02, 0x00: ADC Left
  * 0x02, 0x01: ADC Right
- * 0x03, 0x00-0x0f: 16 inputs from Alice2 Emu32A output
- * 0x03, 0x10-0x1f: 16 inputs from Alice2 Emu32B output
- * 0x04: Not used
- * 0x05, 0x00: S/PDIF Left
- * 0x05, 0x01: S/PDIF Right
- * 0x06-0x07: Not used
- *
- * HanaLiteLite, rev2 0404 using Alice2
- * Sources SRATEX = 1X rates: 44.1 kHz or 48 kHz
- * 0x00,0x00-0x1f: Silence
- * 0x01: Not used
- * 0x02, 0x00: ADC Left
- * 0x02, 0x01: ADC Right
- * 0x03, 0x00-0x0f: 16 inputs from Alice2 Emu32A output
- * 0x03, 0x10-0x1f: 16 inputs from Alice2 Emu32B output
+ * 0x03, 0x00-0x0f: 16 inputs from Alice2/Tina Emu32A output
+ * 0x03, 0x10-0x1f: 16 inputs from Alice2/Tina Emu32B output
  * 0x04: Not used
  * 0x05, 0x00: S/PDIF Left
  * 0x05, 0x01: S/PDIF Right
  * 0x06-0x07: Not used
  *
  * Mana, Cardbus 1616 using Tina2
- * Sources SRATEX = 1X rates: 44.1 kHz or 48 kHz
- * 0x00,0x00-0x1f: Silence
- * 0x01, 0x10-0x1f: 32 Elink channels from Audio Dock
- * 0x01, 0x00: Dock Mic A
- * 0x01, 0x04: Dock Mic B
- * 0x01, 0x08: Dock ADC 1 Left
- * 0x01, 0x0c: Dock ADC 1 Right
- * 0x01, 0x10: Dock ADC 2 Left
- * 0x01, 0x12: Dock S/PDIF Left
- * 0x01, 0x14: Dock ADC 2 Right
- * 0x01, 0x16: Dock S/PDIF Right
- * 0x01, 0x18-0x1f: Dock ADAT 0-7
- * 0x01, 0x18: Dock ADC 3 Left
- * 0x01, 0x1c: Dock ADC 3 Right
+ * 0x00, 0x00-0x1f: Silence
+ * 0x01, 0x00-0x1f: 32 EDI channels from Micro Dock
+ *       (same as rev2 1010)
  * 0x02: Not used
- * 0x03, 0x00-0x0f: 16 inputs from Tina Emu32A output
- * 0x03, 0x10-0x1f: 16 inputs from Tina Emu32B output
+ * 0x03, 0x00-0x0f: 16 inputs from Tina2 Emu32A output
+ * 0x03, 0x10-0x1f: 16 inputs from Tina2 Emu32B output
  * 0x04-0x07: Not used
- *
  */
 
 /* 32-bit sources of signal in the Hana FPGA. The sources are routed to
- * destinations using mixer control for each destination - see emumixer.c
- * Sources are either physical inputs of FPGA,
- * or outputs from Alice (audigy) - 16 x EMU_SRC_ALICE_EMU32A +
- * 16 x EMU_SRC_ALICE_EMU32B
+ * destinations using a mixer control for each destination - see emumixer.c.
+ * Sources are either physical inputs of Hana, or inputs from Alice2/Tina -
+ * 16 x EMU_SRC_ALICE_EMU32A + 16 x EMU_SRC_ALICE_EMU32B.
  */
 #define EMU_SRC_SILENCE		0x0000	/* Silence */
 #define EMU_SRC_DOCK_MIC_A1	0x0100	/* Audio Dock Mic A, 1st or 48kHz only */
@@ -1459,23 +1426,20 @@
 #define EMU_SRC_HAMOA_ADC_RIGHT4	0x0207	/* Hamoa ADC Right, 4th or 192kHz */
 #define EMU_SRC_ALICE_EMU32A		0x0300	/* Alice2 EMU32a 16 outputs. +0 to +0xf */
 #define EMU_SRC_ALICE_EMU32B		0x0310	/* Alice2 EMU32b 16 outputs. +0 to +0xf */
+// In S/MUX mode, the samples of one channel are adjacent.
 #define EMU_SRC_HANA_ADAT	0x0400	/* Hana ADAT 8 channel in +0 to +7 */
 #define EMU_SRC_HANA_SPDIF_LEFT1	0x0500	/* Hana SPDIF Left, 1st or 48kHz only */
 #define EMU_SRC_HANA_SPDIF_LEFT2	0x0502	/* Hana SPDIF Left, 2nd or 96kHz */
 #define EMU_SRC_HANA_SPDIF_RIGHT1	0x0501	/* Hana SPDIF Right, 1st or 48kHz only */
 #define EMU_SRC_HANA_SPDIF_RIGHT2	0x0503	/* Hana SPDIF Right, 2nd or 96kHz */
 
 /* Additional inputs for 1616(M)/Microdock */
-/* Microdock S/PDIF Left, 1st or 48kHz only */
-#define EMU_SRC_MDOCK_SPDIF_LEFT1	0x0112
-/* Microdock S/PDIF Left, 2nd or 96kHz */
-#define EMU_SRC_MDOCK_SPDIF_LEFT2	0x0113
-/* Microdock S/PDIF Right, 1st or 48kHz only */
-#define EMU_SRC_MDOCK_SPDIF_RIGHT1	0x0116
-/* Microdock S/PDIF Right, 2nd or 96kHz */
-#define EMU_SRC_MDOCK_SPDIF_RIGHT2	0x0117
-/* Microdock ADAT 8 channel in +8 to +f */
-#define EMU_SRC_MDOCK_ADAT		0x0118
+
+#define EMU_SRC_MDOCK_SPDIF_LEFT1	0x0112	/* Microdock S/PDIF Left, 1st or 48kHz only */
+#define EMU_SRC_MDOCK_SPDIF_LEFT2	0x0113	/* Microdock S/PDIF Left, 2nd or 96kHz */
+#define EMU_SRC_MDOCK_SPDIF_RIGHT1	0x0116	/* Microdock S/PDIF Right, 1st or 48kHz only */
+#define EMU_SRC_MDOCK_SPDIF_RIGHT2	0x0117	/* Microdock S/PDIF Right, 2nd or 96kHz */
+#define EMU_SRC_MDOCK_ADAT		0x0118	/* Microdock ADAT 8 channel in +8 to +f */
 
 /* 0x600 and 0x700 no used */
 
@@ -1642,25 +1606,37 @@ enum {
 	EMU_MODEL_EMU0404,
 };
 
+// Chip-o-logy:
+// - All SB Live! cards use EMU10K1 chips
+// - All SB Audigy cards use CA* chips, termed "emu10k2" by the driver
+// - Original Audigy uses CA0100 "Alice"
+// - Audigy 2 uses CA0102/CA10200 "Alice2"
+//   - Has an interface for CA0151 (P16V) "Alice3"
+// - Audigy 2 Value uses CA0108/CA10300 "Tina"
+//   - Approximately a CA0102 with an on-chip CA0151 (P17V)
+// - Audigy 2 ZS NB uses CA0109 "Tina2"
+//   - Cardbus version of CA0108
 struct snd_emu_chip_details {
 	u32 vendor;
 	u32 device;
 	u32 subsystem;
 	unsigned char revision;
 	unsigned char emu10k1_chip; /* Original SB Live. Not SB Live 24bit. */
+				    /* Redundant with emu10k2_chip being unset. */
 	unsigned char emu10k2_chip; /* Audigy 1 or Audigy 2. */
 	unsigned char ca0102_chip;  /* Audigy 1 or Audigy 2. Not SB Audigy 2 Value. */
+				    /* Redundant with ca0108_chip being unset. */
 	unsigned char ca0108_chip;  /* Audigy 2 Value */
 	unsigned char ca_cardbus_chip; /* Audigy 2 ZS Notebook */
 	unsigned char ca0151_chip;  /* P16V */
 	unsigned char spk71;        /* Has 7.1 speakers */
 	unsigned char sblive51;	    /* SBLive! 5.1 - extout 0x11 -> center, 0x12 -> lfe */
 	unsigned char spdif_bug;    /* Has Spdif phasing bug */
 	unsigned char ac97_chip;    /* Has an AC97 chip: 1 = mandatory, 2 = optional */
 	unsigned char ecard;        /* APS EEPROM */
 	unsigned char emu_model;     /* EMU model type */
-	unsigned char spi_dac;      /* SPI interface for DAC */
-	unsigned char i2c_adc;      /* I2C interface for ADC */
+	unsigned char spi_dac;      /* SPI interface for DAC; requires ca0108_chip */
+	unsigned char i2c_adc;      /* I2C interface for ADC; requires ca0108_chip */
 	unsigned char adc_1361t;    /* Use Philips 1361T ADC */
 	unsigned char invert_shared_spdif; /* analog/digital switch inverted */
 	const char *driver;
@@ -1734,9 +1710,9 @@ struct snd_emu10k1 {
 	void *synth;
 	int (*get_synth_voice)(struct snd_emu10k1 *emu);
 
-	spinlock_t reg_lock;
-	spinlock_t emu_lock;
-	spinlock_t voice_lock;
+	spinlock_t reg_lock;  // high-level driver lock
+	spinlock_t emu_lock;  // low-level i/o lock
+	spinlock_t voice_lock;  // voice allocator lock
 	spinlock_t spi_lock; /* serialises access to spi port */
 	spinlock_t i2c_lock; /* serialises access to i2c port */
 
diff --git a/include/uapi/sound/emu10k1.h b/include/uapi/sound/emu10k1.h
index c2414bd5aecd..33e5228f5d8c 100644
--- a/include/uapi/sound/emu10k1.h
+++ b/include/uapi/sound/emu10k1.h
@@ -111,6 +111,9 @@
 #define CC_REG_NONZERO	C_00000100
 
 /* FX buses */
+// These are arbitrary mappings; our DSP code simply expects
+// the config files to route the channels this way.
+// The numbers are documented in {audigy,sb-live}-mixer.rst.
 #define FXBUS_PCM_LEFT		0x00
 #define FXBUS_PCM_RIGHT		0x01
 #define FXBUS_PCM_LEFT_REAR	0x02
diff --git a/sound/pci/emu10k1/emu10k1.c b/sound/pci/emu10k1/emu10k1.c
index 672af4b9597b..b8163f26004a 100644
--- a/sound/pci/emu10k1/emu10k1.c
+++ b/sound/pci/emu10k1/emu10k1.c
@@ -68,17 +68,6 @@ static const struct pci_device_id snd_emu10k1_ids[] = {
 	{ 0, }
 };
 
-/*
- * Audigy 2 Value notes:
- * A_IOCFG Input (GPIO)
- * 0x400  = Front analog jack plugged in. (Green socket)
- * 0x1000 = Read analog jack plugged in. (Black socket)
- * 0x2000 = Center/LFE analog jack plugged in. (Orange socket)
- * A_IOCFG Output (GPIO)
- * 0x60 = Sound out of front Left.
- * Win sets it to 0xXX61
- */
-
 MODULE_DEVICE_TABLE(pci, snd_emu10k1_ids);
 
 static int snd_card_emu10k1_probe(struct pci_dev *pci,
diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index c37df604d470..39b63c4ca1df 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -162,6 +162,8 @@ static int snd_emu10k1_init(struct snd_emu10k1 *emu, int enable_ir)
 	outl(0, emu->port + INTE);
 	snd_emu10k1_ptr_write(emu, CLIEL, 0, 0);
 	snd_emu10k1_ptr_write(emu, CLIEH, 0, 0);
+
+	/* disable stop on loop end */
 	snd_emu10k1_ptr_write(emu, SOLEL, 0, 0);
 	snd_emu10k1_ptr_write(emu, SOLEH, 0, 0);
 
@@ -660,13 +662,14 @@ static int snd_emu1010_load_firmware_entry(struct snd_emu10k1 *emu,
 		return -EIO;
 
 	/* The FPGA is a Xilinx Spartan IIE XC2S50E */
+	/* On E-MU 0404b it is a Xilinx Spartan III XC3S50 */
 	/* GPIO7 -> FPGA PGMN
 	 * GPIO6 -> FPGA CCLK
 	 * GPIO5 -> FPGA DIN
 	 * FPGA CONFIG OFF -> FPGA PGMN
 	 */
 	spin_lock_irqsave(&emu->emu_lock, flags);
-	outw(0x00, emu->port + A_GPIO); /* Set PGMN low for 1uS. */
+	outw(0x00, emu->port + A_GPIO); /* Set PGMN low for 100uS. */
 	write_post = inw(emu->port + A_GPIO);
 	udelay(100);
 	outw(0x80, emu->port + A_GPIO); /* Leave bit 7 set during netlist setup. */
@@ -782,41 +785,18 @@ static void emu1010_firmware_work(struct work_struct *work)
 	} else if (!reg && emu->emu1010.last_reg) {
 		/* Audio Dock removed */
 		dev_info(emu->card->dev, "emu1010: Audio Dock detached\n");
-		/* Unmute all */
+		/* The hardware auto-mutes all, so we unmute again */
 		snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, EMU_UNMUTE);
 	}
 
  next:
 	emu->emu1010.last_reg = reg;
 	if (!emu->card->shutdown)
 		schedule_delayed_work(&emu->emu1010.firmware_work,
 				      msecs_to_jiffies(1000));
 }
 
 /*
- * EMU-1010 - details found out from this driver, official MS Win drivers,
- * testing the card:
- *
- * Audigy2 (aka Alice2):
- * ---------------------
- * 	* communication over PCI
- * 	* conversion of 32-bit data coming over EMU32 links from HANA FPGA
- *	  to 2 x 16-bit, using internal DSP instructions
- * 	* slave mode, clock supplied by HANA
- * 	* linked to HANA using:
- * 		32 x 32-bit serial EMU32 output channels
- * 		16 x EMU32 input channels
- * 		(?) x I2S I/O channels (?)
- *
- * FPGA (aka HANA):
- * ---------------
- * 	* provides all (?) physical inputs and outputs of the card
- * 		(ADC, DAC, SPDIF I/O, ADAT I/O, etc.)
- * 	* provides clock signal for the card and Alice2
- * 	* two crystals - for 44.1kHz and 48kHz multiples
- * 	* provides internal routing of signal sources to signal destinations
- * 	* inputs/outputs to Alice2 - see above
- *
  * Current status of the driver:
  * ----------------------------
  * 	* only 44.1/48kHz supported (the MS Win driver supports up to 192 kHz)
@@ -884,11 +864,8 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k1 *emu)
 	snd_emu1010_fpga_read(emu, EMU_HANA_OPTION_CARDS, &reg);
 	dev_info(emu->card->dev, "emu1010: Card options = 0x%x\n", reg);
 	/* Optical -> ADAT I/O  */
-	/* 0 : SPDIF
-	 * 1 : ADAT
-	 */
 	emu->emu1010.optical_in = 1; /* IN_ADAT */
-	emu->emu1010.optical_out = 1; /* IN_ADAT */
+	emu->emu1010.optical_out = 1; /* OUT_ADAT */
 	tmp = (emu->emu1010.optical_in ? EMU_HANA_OPTICAL_IN_ADAT : 0) |
 		(emu->emu1010.optical_out ? EMU_HANA_OPTICAL_OUT_ADAT : 0);
 	snd_emu1010_fpga_write(emu, EMU_HANA_OPTICAL_TYPE, tmp);
@@ -1279,6 +1256,15 @@ static const struct snd_emu_chip_details emu_chip_details[] = {
 	 * AC97: STAC9750
 	 * CA0151: None
 	 */
+	/*
+	 * A_IOCFG Input (GPIO)
+	 * 0x400  = Front analog jack plugged in. (Green socket)
+	 * 0x1000 = Rear analog jack plugged in. (Black socket)
+	 * 0x2000 = Center/LFE analog jack plugged in. (Orange socket)
+	 * A_IOCFG Output (GPIO)
+	 * 0x60 = Sound out of front Left.
+	 * Win sets it to 0xXX61
+	 */
 	{.vendor = 0x1102, .device = 0x0008, .subsystem = 0x10011102,
 	 .driver = "Audigy2", .name = "SB Audigy 2 Value [SB0400]",
 	 .id = "Audigy2",
@@ -1327,67 +1313,85 @@ static const struct snd_emu_chip_details emu_chip_details[] = {
 	 .spi_dac = 1,
 	 .i2c_adc = 1,
 	 .spk71 = 1} ,
+	/* This is MAEM8950 "Mana" */
+	/* Attach MicroDock[M] to make it an E-MU 1616[m]. */
+	/* Does NOT support sync daughter card (obviously). */
 	/* Tested by James@superbug.co.uk 4th Nov 2007. */
 	{.vendor = 0x1102, .device = 0x0008, .subsystem = 0x42011102,
 	 .driver = "Audigy2", .name = "E-mu 1010 Notebook [MAEM8950]",
 	 .id = "EMU1010",
 	 .emu10k2_chip = 1,
 	 .ca0108_chip = 1,
 	 .ca_cardbus_chip = 1,
 	 .spk71 = 1 ,
 	 .emu_model = EMU_MODEL_EMU1616},
 	/* Tested by James@superbug.co.uk 4th Nov 2007. */
-	/* This is MAEM8960, 0202 is MAEM 8980 */
+	/* This is MAEM8960 "Hana3", 0202 is MAEM8980 */
+	/* Attach 0202 daughter card to make it an E-MU 1212m, OR a
+	 * MicroDock[M] to make it an E-MU 1616[m]. */
+	/* Does NOT support sync daughter card. */
 	{.vendor = 0x1102, .device = 0x0008, .subsystem = 0x40041102,
 	 .driver = "Audigy2", .name = "E-mu 1010b PCI [MAEM8960]",
 	 .id = "EMU1010",
 	 .emu10k2_chip = 1,
 	 .ca0108_chip = 1,
 	 .spk71 = 1,
 	 .emu_model = EMU_MODEL_EMU1010B}, /* EMU 1010 new revision */
 	/* Tested by Maxim Kachur <mcdebugger@duganet.ru> 17th Oct 2012. */
 	/* This is MAEM8986, 0202 is MAEM8980 */
+	/* Attach 0202 daughter card to make it an E-MU 1212m, OR a
+	 * MicroDockM to make it an E-MU 1616m. The non-m
+	 * version was never sold with this card, but should
+	 * still work. */
+	/* Does NOT support sync daughter card. */
 	{.vendor = 0x1102, .device = 0x0008, .subsystem = 0x40071102,
 	 .driver = "Audigy2", .name = "E-mu 1010 PCIe [MAEM8986]",
 	 .id = "EMU1010",
 	 .emu10k2_chip = 1,
 	 .ca0108_chip = 1,
 	 .spk71 = 1,
 	 .emu_model = EMU_MODEL_EMU1010B}, /* EMU 1010 PCIe */
 	/* Tested by James@superbug.co.uk 8th July 2005. */
-	/* This is MAEM8810, 0202 is MAEM8820 */
+	/* This is MAEM8810 "Hana", 0202 is MAEM8820 "Hamoa" */
+	/* Attach 0202 daughter card to make it an E-MU 1212m, OR an
+	 * AudioDock[M] to make it an E-MU 1820[m]. */
+	/* Supports sync daughter card. */
 	{.vendor = 0x1102, .device = 0x0004, .subsystem = 0x40011102,
 	 .driver = "Audigy2", .name = "E-mu 1010 [MAEM8810]",
 	 .id = "EMU1010",
 	 .emu10k2_chip = 1,
 	 .ca0102_chip = 1,
 	 .spk71 = 1,
 	 .emu_model = EMU_MODEL_EMU1010}, /* EMU 1010 old revision */
-	/* EMU0404b */
+	/* This is MAEM8852 "HanaLiteLite" */
+	/* Supports sync daughter card. */
+	/* Tested by oswald.buddenhagen@gmx.de Mar 2023. */
 	{.vendor = 0x1102, .device = 0x0008, .subsystem = 0x40021102,
 	 .driver = "Audigy2", .name = "E-mu 0404b PCI [MAEM8852]",
 	 .id = "EMU0404",
 	 .emu10k2_chip = 1,
 	 .ca0108_chip = 1,
 	 .spk71 = 1,
 	 .emu_model = EMU_MODEL_EMU0404}, /* EMU 0404 new revision */
+	/* This is MAEM8850 "HanaLite" */
+	/* Supports sync daughter card. */
 	/* Tested by James@superbug.co.uk 20-3-2007. */
 	{.vendor = 0x1102, .device = 0x0004, .subsystem = 0x40021102,
 	 .driver = "Audigy2", .name = "E-mu 0404 [MAEM8850]",
 	 .id = "EMU0404",
 	 .emu10k2_chip = 1,
 	 .ca0102_chip = 1,
 	 .spk71 = 1,
 	 .emu_model = EMU_MODEL_EMU0404}, /* EMU 0404 */
 	/* EMU0404 PCIe */
+	/* Does NOT support sync daughter card. */
 	{.vendor = 0x1102, .device = 0x0008, .subsystem = 0x40051102,
 	 .driver = "Audigy2", .name = "E-mu 0404 PCIe [MAEM8984]",
 	 .id = "EMU0404",
 	 .emu10k2_chip = 1,
 	 .ca0108_chip = 1,
 	 .spk71 = 1,
 	 .emu_model = EMU_MODEL_EMU0404}, /* EMU 0404 PCIe ver_03 */
-	/* Note that all E-mu cards require kernel 2.6 or newer. */
 	{.vendor = 0x1102, .device = 0x0008,
 	 .driver = "Audigy2", .name = "SB Audigy 2 Value [Unknown]",
 	 .id = "Audigy2",
@@ -1468,6 +1472,8 @@ static const struct snd_emu_chip_details emu_chip_details[] = {
 	 .spdif_bug = 1,
 	 .adc_1361t = 1,  /* 24 bit capture instead of 16bit */
 	 .ac97_chip = 1} ,
+	/* Audigy 2 Platinum EX */
+	/* Win driver sets A_IOCFG output to 0x1c00 */
 	{.vendor = 0x1102, .device = 0x0004, .subsystem = 0x10051102,
 	 .driver = "Audigy2", .name = "Audigy 2 Platinum EX [SB0280]",
 	 .id = "Audigy2",
@@ -1488,6 +1494,8 @@ static const struct snd_emu_chip_details emu_chip_details[] = {
 	 .spdif_bug = 1,
 	 .invert_shared_spdif = 1,	/* digital/analog switch swapped */
 	 .ac97_chip = 1} ,
+	/* Audigy 2 Platinum */
+	/* Win driver sets A_IOCFG output to 0xa00 */
 	{.vendor = 0x1102, .device = 0x0004, .subsystem = 0x10021102,
 	 .driver = "Audigy2", .name = "SB Audigy 2 Platinum [SB0240P]",
 	 .id = "Audigy2",
@@ -1593,6 +1601,9 @@ static const struct snd_emu_chip_details emu_chip_details[] = {
 	 .emu10k1_chip = 1,
 	 .ac97_chip = 1,
 	 .sblive51 = 1} ,
+	/* SB Live! Platinum */
+	/* Win driver sets A_IOCFG output to 0 */
+	/* Tested by Jonathan Dowland <jon@dow.land> Apr 2023. */
 	{.vendor = 0x1102, .device = 0x0002, .subsystem = 0x80401102,
 	 .driver = "EMU10K1", .name = "SB Live! Platinum [CT4760P]",
 	 .id = "Live",
diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 6a51aed59238..510b776f856d 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -1187,8 +1187,8 @@ snd_emu10k1_init_stereo_onoff_control(struct snd_emu10k1_fx8010_control_gpr *ctl
 }
 
 /*
- * Used for emu1010 - conversion from 32-bit capture inputs from HANA
- * to 2 x 16-bit registers in audigy - their values are read via DMA.
+ * Used for emu1010 - conversion from 32-bit capture inputs from the FPGA
+ * to 2 x 16-bit registers in Audigy - their values are read via DMA.
  * Conversion is performed by Audigy DSP instructions of FX8010.
  */
 static int snd_emu10k1_audigy_dsp_convert_32_to_2x16(
@@ -1330,8 +1330,9 @@ static int _snd_emu10k1_audigy_init_efx(struct snd_emu10k1 *emu)
 #define A_ADD_VOLUME_IN(var,vol,input) \
 A_OP(icode, &ptr, iMAC0, A_GPR(var), A_GPR(var), A_GPR(vol), A_EXTIN(input))
 
-	/* emu1212 DSP 0 and DSP 1 Capture */
 	if (emu->card_capabilities->emu_model) {
+		/* EMU1010 DSP 0 and DSP 1 Capture */
+		// The 24 MSB hold the actual value. We implicitly discard the 16 LSB.
 		if (emu->card_capabilities->ca0108_chip) {
 			/* Note:JCD:No longer bit shift lower 16bits to upper 16bits of 32bit value. */
 			A_OP(icode, &ptr, iMACINT0, A_GPR(tmp), A_C_00000000, A3_EMU32IN(0x0), A_C_00000001);
@@ -1636,17 +1637,20 @@ A_OP(icode, &ptr, iMAC0, A_GPR(var), A_GPR(var), A_GPR(vol), A_EXTIN(input))
 #endif
 
 	if (emu->card_capabilities->emu_model) {
+		/* Capture 16 channels of S32_LE sound. */
 		if (emu->card_capabilities->ca0108_chip) {
 			dev_info(emu->card->dev, "EMU2 inputs on\n");
+			/* Note that the Tina[2] DSPs have 16 more EMU32 inputs which we don't use. */
+
 			for (z = 0; z < 0x10; z++) {
 				snd_emu10k1_audigy_dsp_convert_32_to_2x16( icode, &ptr, tmp, 
 									bit_shifter16,
 									A3_EMU32IN(z),
 									A_FXBUS2(z*2) );
 			}
 		} else {
 			dev_info(emu->card->dev, "EMU inputs on\n");
-			/* Capture 16 (originally 8) channels of S32_LE sound */
+			/* Note that the Alice2 DSPs have 6 I2S inputs which we don't use. */
 
 			/*
 			dev_dbg(emu->card->dev, "emufx.c: gpr=0x%x, tmp=0x%x\n",
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 754d91050af2..3d2ed5e0a59d 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -346,7 +346,7 @@ static const unsigned int emu1616_output_dst[] = {
 };
 
 /*
- * Data destinations - HANA outputs going to Alice2 (audigy) for
+ * Data destinations - FPGA outputs going to Alice2 (Audigy) for
  *   capture (EMU32 + I2S links)
  * Each destination has an enum mixer control to choose a data source
  */
@@ -367,6 +367,7 @@ static const unsigned int emu1010_input_dst[] = {
 	EMU_DST_ALICE2_EMU32_D,
 	EMU_DST_ALICE2_EMU32_E,
 	EMU_DST_ALICE2_EMU32_F,
+	/* These exist only on rev1 EMU1010 cards. */
 	EMU_DST_ALICE_I2S0_LEFT,
 	EMU_DST_ALICE_I2S0_RIGHT,
 	EMU_DST_ALICE_I2S1_LEFT,
@@ -708,7 +709,7 @@ static int snd_emu1010_internal_clock_put(struct snd_kcontrol *kcontrol,
 			/* 44100 */
 			/* Mute all */
 			snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, EMU_MUTE );
-			/* Default fallback clock 48kHz */
+			/* Default fallback clock 44.1kHz */
 			snd_emu1010_fpga_write(emu, EMU_HANA_DEFCLOCK, EMU_HANA_DEFCLOCK_44_1K );
 			/* Word Clock source, Internal 44.1kHz x1 */
 			snd_emu1010_fpga_write(emu, EMU_HANA_WCLOCK,
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 87c3b19c6b2d..ff6ca91b0d28 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -326,7 +326,6 @@ static void snd_emu10k1_pcm_init_voice(struct snd_emu10k1 *emu,
 	} else
 		snd_emu10k1_ptr_write(emu, FXRT, voice,
 				      snd_emu10k1_compose_send_routing(send_routing));
-	/* Stop CA */
 	/* Assumption that PT is already 0 so no harm overwriting */
 	snd_emu10k1_ptr_write(emu, PTRX, voice, (send_amount[0] << 8) | send_amount[1]);
 	snd_emu10k1_ptr_write(emu, DSL, voice, end_addr | (send_amount[3] << 24));
@@ -480,9 +479,6 @@ static int snd_emu10k1_efx_playback_prepare(struct snd_pcm_substream *substream)
 	start_addr = epcm->start_addr;
 	end_addr = epcm->start_addr + snd_pcm_lib_buffer_bytes(substream);
 
-	/*
-	 * the kX driver leaves some space between voices
-	 */
 	channel_size = ( end_addr - start_addr ) / NUM_EFX_PLAYBACK;
 
 	snd_emu10k1_pcm_init_voice(emu, 1, 1, epcm->extra,
@@ -1218,26 +1214,25 @@ static int snd_emu10k1_capture_efx_open(struct snd_pcm_substream *substream)
 	runtime->hw.rate_min = runtime->hw.rate_max = 48000;
 	spin_lock_irq(&emu->reg_lock);
 	if (emu->card_capabilities->emu_model) {
-		/*  Nb. of channels has been increased to 16 */
 		/* TODO
-		 * SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_LE
 		 * SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 |
 		 * SNDRV_PCM_RATE_88200 | SNDRV_PCM_RATE_96000 |
 		 * SNDRV_PCM_RATE_176400 | SNDRV_PCM_RATE_192000
 		 * rate_min = 44100,
 		 * rate_max = 192000,
 		 * channels_min = 16,
 		 * channels_max = 16,
 		 * Need to add mixer control to fix sample rate
 		 *                 
 		 * There are 32 mono channels of 16bits each.
-		 * 24bit Audio uses 2x channels over 16bit
-		 * 96kHz uses 2x channels over 48kHz
-		 * 192kHz uses 4x channels over 48kHz
-		 * So, for 48kHz 24bit, one has 16 channels
-		 * for 96kHz 24bit, one has 8 channels
-		 * for 192kHz 24bit, one has 4 channels
-		 *
+		 * 24bit Audio uses 2x channels over 16bit,
+		 * 96kHz uses 2x channels over 48kHz,
+		 * 192kHz uses 4x channels over 48kHz.
+		 * So, for 48kHz 24bit, one has 16 channels,
+		 * for 96kHz 24bit, one has 8 channels,
+		 * for 192kHz 24bit, one has 4 channels.
+		 * 1010rev2 and 1616(m) cards have double that,
+		 * but we don't exceed 16 channels anyway.
 		 */
 #if 1
 		switch (emu->emu1010.internal_clock) {
@@ -1459,11 +1454,12 @@ static int snd_emu10k1_pcm_efx_voices_mask_put(struct snd_kcontrol *kcontrol, st
 			nval[idx / 32] |= 1 << (idx % 32);
 			bits++;
 		}
-		
+
+	// Check that the number of requested channels is a power of two
+	// not bigger than the number of available channels.
 	for (idx = 0; idx < nefxb; idx++)
 		if (1 << idx == bits)
 			break;
-	
 	if (idx >= nefxb)
 		return -EINVAL;
 
diff --git a/sound/pci/emu10k1/io.c b/sound/pci/emu10k1/io.c
index 42b06f2e5552..c60573f14ea8 100644
--- a/sound/pci/emu10k1/io.c
+++ b/sound/pci/emu10k1/io.c
@@ -314,7 +314,6 @@ void snd_emu10k1_voice_intr_enable(struct snd_emu10k1 *emu, unsigned int voicenu
 	unsigned int val;
 
 	spin_lock_irqsave(&emu->emu_lock, flags);
-	/* voice interrupt */
 	if (voicenum >= 32) {
 		outl(CLIEH << 16, emu->port + PTR);
 		val = inl(emu->port + DATA);
@@ -334,7 +333,6 @@ void snd_emu10k1_voice_intr_disable(struct snd_emu10k1 *emu, unsigned int voicen
 	unsigned int val;
 
 	spin_lock_irqsave(&emu->emu_lock, flags);
-	/* voice interrupt */
 	if (voicenum >= 32) {
 		outl(CLIEH << 16, emu->port + PTR);
 		val = inl(emu->port + DATA);
@@ -353,7 +351,6 @@ void snd_emu10k1_voice_intr_ack(struct snd_emu10k1 *emu, unsigned int voicenum)
 	unsigned long flags;
 
 	spin_lock_irqsave(&emu->emu_lock, flags);
-	/* voice interrupt */
 	if (voicenum >= 32) {
 		outl(CLIPH << 16, emu->port + PTR);
 		voicenum = 1 << (voicenum - 32);
@@ -371,7 +368,6 @@ void snd_emu10k1_voice_half_loop_intr_enable(struct snd_emu10k1 *emu, unsigned i
 	unsigned int val;
 
 	spin_lock_irqsave(&emu->emu_lock, flags);
-	/* voice interrupt */
 	if (voicenum >= 32) {
 		outl(HLIEH << 16, emu->port + PTR);
 		val = inl(emu->port + DATA);
@@ -391,7 +387,6 @@ void snd_emu10k1_voice_half_loop_intr_disable(struct snd_emu10k1 *emu, unsigned
 	unsigned int val;
 
 	spin_lock_irqsave(&emu->emu_lock, flags);
-	/* voice interrupt */
 	if (voicenum >= 32) {
 		outl(HLIEH << 16, emu->port + PTR);
 		val = inl(emu->port + DATA);
@@ -410,7 +405,6 @@ void snd_emu10k1_voice_half_loop_intr_ack(struct snd_emu10k1 *emu, unsigned int
 	unsigned long flags;
 
 	spin_lock_irqsave(&emu->emu_lock, flags);
-	/* voice interrupt */
 	if (voicenum >= 32) {
 		outl(HLIPH << 16, emu->port + PTR);
 		voicenum = 1 << (voicenum - 32);
@@ -428,7 +422,6 @@ void snd_emu10k1_voice_set_loop_stop(struct snd_emu10k1 *emu, unsigned int voice
 	unsigned int sol;
 
 	spin_lock_irqsave(&emu->emu_lock, flags);
-	/* voice interrupt */
 	if (voicenum >= 32) {
 		outl(SOLEH << 16, emu->port + PTR);
 		sol = inl(emu->port + DATA);
@@ -448,7 +441,6 @@ void snd_emu10k1_voice_clear_loop_stop(struct snd_emu10k1 *emu, unsigned int voi
 	unsigned int sol;
 
 	spin_lock_irqsave(&emu->emu_lock, flags);
-	/* voice interrupt */
 	if (voicenum >= 32) {
 		outl(SOLEH << 16, emu->port + PTR);
 		sol = inl(emu->port + DATA);
diff --git a/sound/pci/emu10k1/p16v.h b/sound/pci/emu10k1/p16v.h
index 3cdafa311617..9d429ad1feff 100644
--- a/sound/pci/emu10k1/p16v.h
+++ b/sound/pci/emu10k1/p16v.h
@@ -64,7 +64,7 @@
  */
 
 /********************************************************************************************************/
-/* Audigy2 P16V pointer-offset register set, accessed through the PTR2 and DATA2 registers                     */
+/* Audigy2 P16V pointer-offset register set, accessed through the PTR2 and DATA2 registers              */
 /********************************************************************************************************/
                                                                                                                            
 /* The sample rate of the SPDIF outputs is set by modifying a register in the EMU10K2 PTR register A_SPDIF_SAMPLERATE.
diff --git a/sound/pci/emu10k1/p17v.h b/sound/pci/emu10k1/p17v.h
index 3a6568346fad..d4ada1c430c8 100644
--- a/sound/pci/emu10k1/p17v.h
+++ b/sound/pci/emu10k1/p17v.h
@@ -6,8 +6,8 @@
  */
 
 /******************************************************************************/
-/* Audigy2Value Tina (P17V) pointer-offset register set,
- * accessed through the PTR20 and DATA24 registers  */
+/* Audigy2Value Tina (P17V) pointer-offset register set,                      */
+/* accessed through the PTR2 and DATA2 registers                              */
 /******************************************************************************/
 
 /* 00 - 07: Not used */
-- 
2.40.0.152.g15d061e6df

