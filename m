Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 825B66FE285
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 18:31:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58F461090;
	Wed, 10 May 2023 18:30:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58F461090
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683736288;
	bh=ZqTFDaNvMXhLEEPa8AUIV7O+Ach2Af/3ndsGuK43y5U=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=CcNS5wPytT2hVaS34UeuPfREsBDWbpLI3SyKyZFsoNJunNceQAEGdbqJcNKKhoH/4
	 U/80JCCyHD20qwcG39Lv3oUalaKac/LniMq/zelGHDXo9pyBSjAQiIhi51H9H13Z55
	 nfH/v6JWGyEenlv8VaDIGsNT3fHnxIl/EBtqMY5E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ECC75F8032D;
	Wed, 10 May 2023 18:29:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78F11F80551; Wed, 10 May 2023 18:29:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB0E4F80310
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 18:29:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB0E4F80310
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 391EB20081;
	Wed, 10 May 2023 12:29:36 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pwmh5-r3C-00; Wed, 10 May 2023 18:29:35 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/4] ALSA: emu10k1: automate encoding of sub-register
 definitions
Date: Wed, 10 May 2023 18:29:32 +0200
Message-Id: <20230510162935.3063854-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 56LNYWPGMIANRLFJN3TSPG3UWHJFJ64R
X-Message-ID-Hash: 56LNYWPGMIANRLFJN3TSPG3UWHJFJ64R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/56LNYWPGMIANRLFJN3TSPG3UWHJFJ64R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The idea to encode the bitfield manipulation in the register address is
quite clever, but doing that by hand is ugly and error-prone. So derive
it automatically from the mask instead.

Macros cannot #define other macros, so we now declare enums instead.

This also adds macros for decoding the register definitions. These will
be used by later commits.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h | 113 ++++++++++++++++++----------------------
 1 file changed, 50 insertions(+), 63 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 8fe80dcee71b..f4e05a2897e8 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -38,6 +38,22 @@
 
 #define IP_TO_CP(ip) ((ip == 0) ? 0 : (((0x00001000uL | (ip & 0x00000FFFL)) << (((ip >> 12) & 0x000FL) + 4)) & 0xFFFF0000uL))
 
+#define SUB_REG_NC(reg, field, mask) \
+	enum { \
+		field ## _MASK = mask, \
+		field = reg | \
+			(__builtin_ctz(mask) << 16) | \
+			(__builtin_popcount(mask) << 24), \
+	};
+#define SUB_REG(reg, field, mask) SUB_REG_NC(reg, reg ## _ ## field, mask)
+
+#define REG_SHIFT(r) (((r) >> 16) & 0x1f)
+#define REG_SIZE(r) (((r) >> 24) & 0x1f)
+#define REG_MASK0(r) ((1U << REG_SIZE(r)) - 1U)
+#define REG_MASK(r) (REG_MASK0(r) << REG_SHIFT(r))
+#define REG_VAL_GET(r, v) ((v & REG_MASK(r)) >> REG_SHIFT(r))
+#define REG_VAL_PUT(r, v) ((v) << REG_SHIFT(r))
+
 // Audigy specify registers are prefixed with 'A_'
 
 /************************************************************************************************/
@@ -148,12 +164,10 @@
 #define INTE_MIDIRXENABLE	0x00000001	/* Enable MIDI receive-buffer-empty interrupts	*/
 
 #define WC			0x10		/* Wall Clock register				*/
-#define WC_SAMPLECOUNTER_MASK	0x03FFFFC0	/* Sample periods elapsed since reset		*/
-#define WC_SAMPLECOUNTER	0x14060010
-#define WC_CURRENTCHANNEL_MASK	0x0000003F	/* Channel [0..63] currently being serviced	*/
+SUB_REG(WC, SAMPLECOUNTER,	0x03FFFFC0)	/* Sample periods elapsed since reset		*/
+SUB_REG(WC, CURRENTCHANNEL,	0x0000003F)	/* Channel [0..63] currently being serviced	*/
 						/* NOTE: Each channel takes 1/64th of a sample	*/
 						/* period to be serviced.			*/
-#define WC_CURRENTCHANNEL	0x06000010
 
 #define HCFG			0x14		/* Hardware config register			*/
 						/* NOTE: There is no reason to use the legacy	*/
@@ -225,9 +239,8 @@
 						/* async audio source  				*/
 #define HCFG_LOCKSOUNDCACHE	0x00000008	/* 1 = Cancel bustmaster accesses to soundcache */
 						/* NOTE: This should generally never be used.  	*/
-#define HCFG_LOCKTANKCACHE_MASK	0x00000004	/* 1 = Cancel bustmaster accesses to tankcache	*/
+SUB_REG(HCFG, LOCKTANKCACHE,	0x00000004)	/* 1 = Cancel bustmaster accesses to tankcache	*/
 						/* NOTE: This should generally never be used.  	*/
-#define HCFG_LOCKTANKCACHE	0x01020014
 #define HCFG_MUTEBUTTONENABLE	0x00000002	/* 1 = Master mute button sets AUDIOENABLE = 0.	*/
 						/* NOTE: This is a 'cheap' way to implement a	*/
 						/* master mute function on the mute button, and	*/
@@ -382,55 +395,38 @@
 //   which the current registers "swerve" gradually.
 
 #define CPF			0x00		/* Current pitch and fraction register			*/
-#define CPF_CURRENTPITCH_MASK	0xffff0000	/* Current pitch (linear, 0x4000 == unity pitch shift) 	*/
-#define CPF_CURRENTPITCH	0x10100000
+SUB_REG(CPF, CURRENTPITCH,	0xffff0000)	/* Current pitch (linear, 0x4000 == unity pitch shift) 	*/
 #define CPF_STEREO_MASK		0x00008000	/* 1 = Even channel interleave, odd channel locked	*/
 #define CPF_STOP_MASK		0x00004000	/* 1 = Current pitch forced to 0			*/
 #define CPF_FRACADDRESS_MASK	0x00003fff	/* Linear fractional address of the current channel	*/
 
 #define PTRX			0x01		/* Pitch target and send A/B amounts register		*/
-#define PTRX_PITCHTARGET_MASK	0xffff0000	/* Pitch target of specified channel			*/
-#define PTRX_PITCHTARGET	0x10100001
-#define PTRX_FXSENDAMOUNT_A_MASK 0x0000ff00	/* Linear level of channel output sent to FX send bus A	*/
-#define PTRX_FXSENDAMOUNT_A	0x08080001
-#define PTRX_FXSENDAMOUNT_B_MASK 0x000000ff	/* Linear level of channel output sent to FX send bus B	*/
-#define PTRX_FXSENDAMOUNT_B	0x08000001
+SUB_REG(PTRX, PITCHTARGET,	0xffff0000)	/* Pitch target of specified channel			*/
+SUB_REG(PTRX, FXSENDAMOUNT_A,	0x0000ff00)	/* Linear level of channel output sent to FX send bus A	*/
+SUB_REG(PTRX, FXSENDAMOUNT_B,	0x000000ff)	/* Linear level of channel output sent to FX send bus B	*/
 
 #define CVCF			0x02		/* Current volume and filter cutoff register		*/
-#define CVCF_CURRENTVOL_MASK	0xffff0000	/* Current linear volume of specified channel		*/
-#define CVCF_CURRENTVOL		0x10100002
-#define CVCF_CURRENTFILTER_MASK	0x0000ffff	/* Current filter cutoff frequency of specified channel	*/
-#define CVCF_CURRENTFILTER	0x10000002
+SUB_REG(CVCF, CURRENTVOL,	0xffff0000)	/* Current linear volume of specified channel		*/
+SUB_REG(CVCF, CURRENTFILTER,	0x0000ffff)	/* Current filter cutoff frequency of specified channel	*/
 
 #define VTFT			0x03		/* Volume target and filter cutoff target register	*/
-#define VTFT_VOLUMETARGET_MASK	0xffff0000	/* Volume target of specified channel			*/
-#define VTFT_VOLUMETARGET	0x10100003
-#define VTFT_FILTERTARGET_MASK	0x0000ffff	/* Filter cutoff target of specified channel		*/
-#define VTFT_FILTERTARGET	0x10000003
+SUB_REG(VTFT, VOLUMETARGET,	0xffff0000)	/* Volume target of specified channel			*/
+SUB_REG(VTFT, FILTERTARGET,	0x0000ffff)	/* Filter cutoff target of specified channel		*/
 
 #define Z1			0x05		/* Filter delay memory 1 register			*/
 
 #define Z2			0x04		/* Filter delay memory 2 register			*/
 
 #define PSST			0x06		/* Send C amount and loop start address register	*/
-#define PSST_FXSENDAMOUNT_C_MASK 0xff000000	/* Linear level of channel output sent to FX send bus C	*/
-
-#define PSST_FXSENDAMOUNT_C	0x08180006
-
-#define PSST_LOOPSTARTADDR_MASK	0x00ffffff	/* Loop start address of the specified channel		*/
-#define PSST_LOOPSTARTADDR	0x18000006
+SUB_REG(PSST, FXSENDAMOUNT_C,	0xff000000)	/* Linear level of channel output sent to FX send bus C	*/
+SUB_REG(PSST, LOOPSTARTADDR,	0x00ffffff)	/* Loop start address of the specified channel		*/
 
 #define DSL			0x07		/* Send D amount and loop end address register	*/
-#define DSL_FXSENDAMOUNT_D_MASK	0xff000000	/* Linear level of channel output sent to FX send bus D	*/
-
-#define DSL_FXSENDAMOUNT_D	0x08180007
-
-#define DSL_LOOPENDADDR_MASK	0x00ffffff	/* Loop end address of the specified channel		*/
-#define DSL_LOOPENDADDR		0x18000007
+SUB_REG(DSL, FXSENDAMOUNT_D,	0xff000000)	/* Linear level of channel output sent to FX send bus D	*/
+SUB_REG(DSL, LOOPENDADDR,	0x00ffffff)	/* Loop end address of the specified channel		*/
 
 #define CCCA			0x08		/* Filter Q, interp. ROM, byte size, cur. addr register */
-#define CCCA_RESONANCE_MASK	0xf0000000	/* Lowpass filter resonance (Q) height			*/
-#define CCCA_RESONANCE		0x041c0008
+SUB_REG(CCCA, RESONANCE,	0xf0000000)	/* Lowpass filter resonance (Q) height			*/
 #define CCCA_INTERPROM_MASK	0x0e000000	/* Selects passband of interpolation ROM		*/
 						/* 1 == full band, 7 == lowpass				*/
 						/* ROM 0 is used when pitch shifting downward or less	*/
@@ -447,27 +443,24 @@
 #define CCCA_INTERPROM_7	0x0e000000	/* Select interpolation ROM 7				*/
 #define CCCA_8BITSELECT		0x01000000	/* 1 = Sound memory for this channel uses 8-bit samples	*/
 						/* 8-bit samples are unsigned, 16-bit ones signed	*/
-#define CCCA_CURRADDR_MASK	0x00ffffff	/* Current address of the selected channel		*/
-#define CCCA_CURRADDR		0x18000008
+SUB_REG(CCCA, CURRADDR,		0x00ffffff)	/* Current address of the selected channel		*/
 
 #define CCR			0x09		/* Cache control register				*/
-#define CCR_CACHEINVALIDSIZE	0x07190009
-#define CCR_CACHEINVALIDSIZE_MASK 0xfe000000	/* Number of invalid samples before the read address	*/
+SUB_REG(CCR, CACHEINVALIDSIZE,	0xfe000000)	/* Number of invalid samples before the read address	*/
 #define CCR_CACHELOOPFLAG	0x01000000	/* 1 = Cache has a loop service pending			*/
 #define CCR_INTERLEAVEDSAMPLES	0x00800000	/* 1 = A cache service will fetch interleaved samples	*/
 						/* Auto-set from CPF_STEREO_MASK			*/
 #define CCR_WORDSIZEDSAMPLES	0x00400000	/* 1 = A cache service will fetch word sized samples	*/
 						/* Auto-set from CCCA_8BITSELECT			*/
-#define CCR_READADDRESS		0x06100009
-#define CCR_READADDRESS_MASK	0x003f0000	/* Next cached sample to play				*/
-#define CCR_LOOPINVALSIZE	0x0000fe00	/* Number of invalid samples in cache prior to loop	*/
+SUB_REG(CCR, READADDRESS,	0x003f0000)	/* Next cached sample to play				*/
+SUB_REG(CCR, LOOPINVALSIZE,	0x0000fe00)	/* Number of invalid samples in cache prior to loop	*/
 						/* NOTE: This is valid only if CACHELOOPFLAG is set	*/
 #define CCR_LOOPFLAG		0x00000100	/* Set for a single sample period when a loop occurs	*/
-#define CCR_CACHELOOPADDRHI	0x000000ff	/* CLP_LOOPSTARTADDR's hi byte if CACHELOOPFLAG is set	*/
+SUB_REG(CCR, CACHELOOPADDRHI,	0x000000ff)	/* CLP_LOOPSTARTADDR's hi byte if CACHELOOPFLAG is set	*/
 
 #define CLP			0x0a		/* Cache loop register (valid if CCR_CACHELOOPFLAG = 1) */
 						/* NOTE: This register is normally not used		*/
-#define CLP_CACHELOOPADDR	0x0000ffff	/* Cache loop address low word				*/
+SUB_REG(CLP, CACHELOOPADDR,	0x0000ffff)	/* Cache loop address low word				*/
 
 #define FXRT			0x0b		/* Effects send routing register			*/
 						/* NOTE: It is illegal to assign the same routing to	*/
@@ -537,20 +530,17 @@
 #define IP_UNITY		0x0000e000	/* Unity pitch shift					*/
 
 #define IFATN			0x19		/* Initial filter cutoff and attenuation register	*/
-#define IFATN_FILTERCUTOFF_MASK	0x0000ff00	/* Initial filter cutoff frequency in exponential units	*/
+SUB_REG(IFATN, FILTERCUTOFF,	0x0000ff00)	/* Initial filter cutoff frequency in exponential units	*/
 						/* 6 most significant bits are semitones		*/
 						/* 2 least significant bits are fractions		*/
-#define IFATN_FILTERCUTOFF	0x08080019
-#define IFATN_ATTENUATION_MASK	0x000000ff	/* Initial attenuation in 0.375dB steps			*/
-#define IFATN_ATTENUATION	0x08000019
+SUB_REG(IFATN, ATTENUATION,	0x000000ff)	/* Initial attenuation in 0.375dB steps			*/
 
 #define PEFE			0x1a		/* Pitch envelope and filter envelope amount register	*/
-#define PEFE_PITCHAMOUNT_MASK	0x0000ff00	/* Pitch envlope amount					*/
+SUB_REG(PEFE, PITCHAMOUNT,	0x0000ff00)	/* Pitch envlope amount					*/
 						/* Signed 2's complement, +/- one octave peak extremes	*/
-#define PEFE_PITCHAMOUNT	0x0808001a
-#define PEFE_FILTERAMOUNT_MASK	0x000000ff	/* Filter envlope amount				*/
+SUB_REG(PEFE, FILTERAMOUNT,	0x000000ff)	/* Filter envlope amount				*/
 						/* Signed 2's complement, +/- six octaves peak extremes */
-#define PEFE_FILTERAMOUNT	0x0800001a
+
 
 #define FMMOD			0x1b		/* Vibrato/filter modulation from LFO register		*/
 #define FMMOD_MODVIBRATO	0x0000ff00	/* Vibrato LFO modulation depth				*/
@@ -793,22 +783,19 @@
 #define SRCS_SPDIFRATE_96	0x00080000
 
 #define MICIDX                  0x63            /* Microphone recording buffer index register   */
-#define MICIDX_MASK             0x0000ffff      /* 16-bit value                                 */
-#define MICIDX_IDX		0x10000063
+SUB_REG(MICIDX, IDX,		0x0000ffff)
 
 #define ADCIDX			0x64		/* ADC recording buffer index register		*/
-#define ADCIDX_MASK		0x0000ffff	/* 16 bit index field				*/
-#define ADCIDX_IDX		0x10000064
+SUB_REG(ADCIDX, IDX,		0x0000ffff)
 
 #define A_ADCIDX		0x63
-#define A_ADCIDX_IDX		0x10000063
+SUB_REG(A_ADCIDX, IDX,		0x0000ffff)
 
 #define A_MICIDX		0x64
-#define A_MICIDX_IDX		0x10000064
+SUB_REG(A_MICIDX, IDX,		0x0000ffff)
 
 #define FXIDX			0x65		/* FX recording buffer index register		*/
-#define FXIDX_MASK		0x0000ffff	/* 16-bit value					*/
-#define FXIDX_IDX		0x10000065
+SUB_REG(FXIDX, IDX,		0x0000ffff)
 
 /* The 32-bit HLIEx and HLIPx registers all have one bit per channel control/status      		*/
 #define HLIEL			0x66		/* Channel half loop interrupt enable low register	*/
@@ -852,8 +839,8 @@
 #define A_SPDIF_44100		0x00000080
 #define A_SPDIF_MUTED		0x000000c0
 
-#define A_I2S_CAPTURE_RATE_MASK	0x00000e00	/* This sets the capture PCM rate, but it is    */
-#define A_I2S_CAPTURE_RATE	0x03090076	/* unclear if this sets the ADC rate as well.	*/
+SUB_REG_NC(A_EHC, A_I2S_CAPTURE_RATE, 0x00000e00)  /* This sets the capture PCM rate, but it is  */
+						   /* unclear if this sets the ADC rate as well. */
 #define A_I2S_CAPTURE_48000	0x0
 #define A_I2S_CAPTURE_192000	0x1
 #define A_I2S_CAPTURE_96000	0x2
-- 
2.40.0.152.g15d061e6df

