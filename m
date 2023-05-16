Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1E2704980
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 11:40:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FF91207;
	Tue, 16 May 2023 11:39:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FF91207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684230017;
	bh=Xxc/1eqwVkHP4t49YQw0EP4bzBOE9i+uhDzsqQULBVo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g768l0X+/9nvAvjaM/RrPL6IfXrlBr/aR4H9fhcZqPLvq2Q1NAVRVDYYeO+Yux5Sg
	 jABuAVdFaF8tMBoghPTzyIoF9dzWnDMTjGARsSszwOaBFTqAz7utaLbwyvAmW20oI4
	 IqVVvgi8tVkIewWerhz3co44EYf3tfUzN9IwL5GU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E539DF805F2; Tue, 16 May 2023 11:36:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D389EF80558;
	Tue, 16 May 2023 11:36:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 207D7F805E7; Tue, 16 May 2023 11:36:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 80E19F80553
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 11:36:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80E19F80553
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 1FDEE24296;
	Tue, 16 May 2023 05:36:13 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pyr6K-q13-00; Tue, 16 May 2023 11:36:12 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 03/10] ALSA: emu10k1: make mixer control mass creation less
 wasteful
Date: Tue, 16 May 2023 11:36:05 +0200
Message-Id: <20230516093612.3536508-4-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230516093612.3536508-1-oswald.buddenhagen@gmx.de>
References: <20230516093612.3536508-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MQFLE6VPAOFTVVGU7CRISH2P3SGBLXLZ
X-Message-ID-Hash: MQFLE6VPAOFTVVGU7CRISH2P3SGBLXLZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MQFLE6VPAOFTVVGU7CRISH2P3SGBLXLZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Define arrays of strings instead of snd_kcontrol_new.

While at it, move the E-MU source & destination enum defs next to their
hardware defs, which is a lot more logical and will come in handy in a
followup commit. And add some static asserts to verify that the array
sizes match.

This also applies the compactization from the previous commit to the
destination registers.
While reshuffling the arrays anyway, switch the order of the HAMOA_DAC
& HANA_SPDIF output destinations for the 1010 card, so they follow a
more regular pattern. This should have no functional impact.

The code is somewhat de-duplicated by the extraction of add_ctls().

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h      |   2 +-
 sound/pci/emu10k1/emumixer.c | 455 ++++++++++++++++-------------------
 2 files changed, 206 insertions(+), 251 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 990ea66a828a..19215cfe2671 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1187,7 +1187,7 @@ SUB_REG_NC(A_EHC, A_I2S_CAPTURE_RATE, 0x00000e00)  /* This sets the capture PCM
  * physical outputs of Hana, or outputs going to Alice2/Tina for capture -
  * 16 x EMU_DST_ALICE2_EMU32_X (2x on rev2 boards). Which data is fed into
  * a channel depends on the mixer control setting for each destination - see
- * emumixer.c - snd_emu1010_output_enum_ctls[], snd_emu1010_input_enum_ctls[]
+ * the register arrays in emumixer.c.
  */
 #define EMU_DST_ALICE2_EMU32_0	0x000f	/* 16 EMU32 channels to Alice2 +0 to +0xf */
 					/* This channel is delayed by one sample. */
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index e2f70e8911f4..8d4b7c30d931 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -29,6 +29,24 @@
 
 static const DECLARE_TLV_DB_SCALE(snd_audigy_db_scale2, -10350, 50, 1); /* WM8775 gain scale */
 
+
+static int add_ctls(struct snd_emu10k1 *emu, const struct snd_kcontrol_new *tpl,
+		    const char * const *ctls, unsigned nctls)
+{
+	struct snd_kcontrol_new kctl = *tpl;
+	int err;
+
+	for (unsigned i = 0; i < nctls; i++) {
+		kctl.name = ctls[i];
+		kctl.private_value = i;
+		err = snd_ctl_add(emu->card, snd_ctl_new1(&kctl, emu));
+		if (err < 0)
+			return err;
+	}
+	return 0;
+}
+
+
 static int snd_emu10k1_spdif_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
 {
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_IEC958;
@@ -184,60 +202,88 @@ static_assert(ARRAY_SIZE(emu1616_src_regs) == ARRAY_SIZE(emu1616_src_texts));
  * Data destinations - physical EMU outputs.
  * Each destination has an enum mixer control to choose a data source
  */
-static const unsigned short emu1010_output_dst[] = {
-	EMU_DST_DOCK_DAC1_LEFT1, /* 0 */
-	EMU_DST_DOCK_DAC1_RIGHT1, /* 1 */
-	EMU_DST_DOCK_DAC2_LEFT1, /* 2 */
-	EMU_DST_DOCK_DAC2_RIGHT1, /* 3 */
-	EMU_DST_DOCK_DAC3_LEFT1, /* 4 */
-	EMU_DST_DOCK_DAC3_RIGHT1, /* 5 */
-	EMU_DST_DOCK_DAC4_LEFT1, /* 6 */
-	EMU_DST_DOCK_DAC4_RIGHT1, /* 7 */
-	EMU_DST_DOCK_PHONES_LEFT1, /* 8 */
-	EMU_DST_DOCK_PHONES_RIGHT1, /* 9 */
-	EMU_DST_DOCK_SPDIF_LEFT1, /* 10 */
-	EMU_DST_DOCK_SPDIF_RIGHT1, /* 11 */
-	EMU_DST_HANA_SPDIF_LEFT1, /* 12 */
-	EMU_DST_HANA_SPDIF_RIGHT1, /* 13 */
-	EMU_DST_HAMOA_DAC_LEFT1, /* 14 */
-	EMU_DST_HAMOA_DAC_RIGHT1, /* 15 */
-	EMU_DST_HANA_ADAT, /* 16 */
-	EMU_DST_HANA_ADAT+1, /* 17 */
-	EMU_DST_HANA_ADAT+2, /* 18 */
-	EMU_DST_HANA_ADAT+3, /* 19 */
-	EMU_DST_HANA_ADAT+4, /* 20 */
-	EMU_DST_HANA_ADAT+5, /* 21 */
-	EMU_DST_HANA_ADAT+6, /* 22 */
-	EMU_DST_HANA_ADAT+7, /* 23 */
+
+#define LR_CTLS(base) LR_PS(base, " Playback Enum")
+#define ADAT_CTLS(pfx) ADAT_PS(pfx, " Playback Enum")
+
+static const char * const emu1010_output_texts[] = {
+	LR_CTLS("Dock DAC1"),
+	LR_CTLS("Dock DAC2"),
+	LR_CTLS("Dock DAC3"),
+	LR_CTLS("Dock DAC4"),
+	LR_CTLS("Dock Phones"),
+	LR_CTLS("Dock SPDIF"),
+	LR_CTLS("0202 DAC"),
+	LR_CTLS("1010 SPDIF"),
+	ADAT_CTLS("1010 "),
 };
 
-/* 1616(m) cardbus */
-static const unsigned short emu1616_output_dst[] = {
-	EMU_DST_DOCK_DAC1_LEFT1,
-	EMU_DST_DOCK_DAC1_RIGHT1,
-	EMU_DST_DOCK_DAC2_LEFT1,
-	EMU_DST_DOCK_DAC2_RIGHT1,
-	EMU_DST_DOCK_DAC3_LEFT1,
-	EMU_DST_DOCK_DAC3_RIGHT1,
-	EMU_DST_MDOCK_SPDIF_LEFT1,
-	EMU_DST_MDOCK_SPDIF_RIGHT1,
-	EMU_DST_MDOCK_ADAT,
-	EMU_DST_MDOCK_ADAT+1,
-	EMU_DST_MDOCK_ADAT+2,
-	EMU_DST_MDOCK_ADAT+3,
-	EMU_DST_MDOCK_ADAT+4,
-	EMU_DST_MDOCK_ADAT+5,
-	EMU_DST_MDOCK_ADAT+6,
-	EMU_DST_MDOCK_ADAT+7,
-	EMU_DST_MANA_DAC_LEFT,
-	EMU_DST_MANA_DAC_RIGHT,
+static const unsigned short emu1010_output_dst[] = {
+	LR_REGS(EMU_DST_DOCK_DAC1),
+	LR_REGS(EMU_DST_DOCK_DAC2),
+	LR_REGS(EMU_DST_DOCK_DAC3),
+	LR_REGS(EMU_DST_DOCK_DAC4),
+	LR_REGS(EMU_DST_DOCK_PHONES),
+	LR_REGS(EMU_DST_DOCK_SPDIF),
+	LR_REGS(EMU_DST_HAMOA_DAC),
+	LR_REGS(EMU_DST_HANA_SPDIF),
+	ADAT_REGS(EMU_DST_HANA_ADAT),
 };
+static_assert(ARRAY_SIZE(emu1010_output_dst) == ARRAY_SIZE(emu1010_output_texts));
+
+/* 1616(m) cardbus */
+
+static const char * const snd_emu1616_output_texts[] = {
+	LR_CTLS("Dock DAC1"),
+	LR_CTLS("Dock DAC2"),
+	LR_CTLS("Dock DAC3"),
+	LR_CTLS("Dock SPDIF"),
+	ADAT_CTLS("Dock "),
+	LR_CTLS("Mana DAC"),
+};
+
+static const unsigned short emu1616_output_dst[] = {
+	LR_REGS(EMU_DST_DOCK_DAC1),
+	LR_REGS(EMU_DST_DOCK_DAC2),
+	LR_REGS(EMU_DST_DOCK_DAC3),
+	LR_REGS(EMU_DST_MDOCK_SPDIF),
+	ADAT_REGS(EMU_DST_MDOCK_ADAT),
+	EMU_DST_MANA_DAC_LEFT, EMU_DST_MANA_DAC_RIGHT,
+};
+static_assert(ARRAY_SIZE(emu1616_output_dst) == ARRAY_SIZE(snd_emu1616_output_texts));
 
 /*
  * Data destinations - FPGA outputs going to Alice2 (Audigy) for
  *   capture (EMU32 + I2S links)
  * Each destination has an enum mixer control to choose a data source
  */
+
+static const char * const emu1010_input_texts[] = {
+	"DSP 0 Capture Enum",
+	"DSP 1 Capture Enum",
+	"DSP 2 Capture Enum",
+	"DSP 3 Capture Enum",
+	"DSP 4 Capture Enum",
+	"DSP 5 Capture Enum",
+	"DSP 6 Capture Enum",
+	"DSP 7 Capture Enum",
+	"DSP 8 Capture Enum",
+	"DSP 9 Capture Enum",
+	"DSP A Capture Enum",
+	"DSP B Capture Enum",
+	"DSP C Capture Enum",
+	"DSP D Capture Enum",
+	"DSP E Capture Enum",
+	"DSP F Capture Enum",
+	/* These exist only on rev1 EMU1010 cards. */
+	"DSP 10 Capture Enum",
+	"DSP 11 Capture Enum",
+	"DSP 12 Capture Enum",
+	"DSP 13 Capture Enum",
+	"DSP 14 Capture Enum",
+	"DSP 15 Capture Enum",
+};
+
 static const unsigned short emu1010_input_dst[] = {
 	EMU_DST_ALICE2_EMU32_0,
 	EMU_DST_ALICE2_EMU32_1,
@@ -263,6 +309,7 @@ static const unsigned short emu1010_input_dst[] = {
 	EMU_DST_ALICE_I2S2_LEFT,
 	EMU_DST_ALICE_I2S2_RIGHT,
 };
+static_assert(ARRAY_SIZE(emu1010_input_dst) == ARRAY_SIZE(emu1010_input_texts));
 
 static int snd_emu1010_input_output_source_info(struct snd_kcontrol *kcontrol,
 						struct snd_ctl_elem_info *uinfo)
@@ -321,6 +368,14 @@ static int snd_emu1010_output_source_put(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
+static const struct snd_kcontrol_new emu1010_output_source_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+	.info = snd_emu1010_input_output_source_info,
+	.get = snd_emu1010_output_source_get,
+	.put = snd_emu1010_output_source_put
+};
+
 static int snd_emu1010_input_source_get(struct snd_kcontrol *kcontrol,
                                  struct snd_ctl_elem_value *ucontrol)
 {
@@ -363,118 +418,44 @@ static int snd_emu1010_input_source_put(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
-#define EMU1010_SOURCE_OUTPUT(xname,chid) \
-{								\
-	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname,	\
-	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,		\
-	.info =  snd_emu1010_input_output_source_info,		\
-	.get =   snd_emu1010_output_source_get,			\
-	.put =   snd_emu1010_output_source_put,			\
-	.private_value = chid					\
-}
-
-static const struct snd_kcontrol_new snd_emu1010_output_enum_ctls[] = {
-	EMU1010_SOURCE_OUTPUT("Dock DAC1 Left Playback Enum", 0),
-	EMU1010_SOURCE_OUTPUT("Dock DAC1 Right Playback Enum", 1),
-	EMU1010_SOURCE_OUTPUT("Dock DAC2 Left Playback Enum", 2),
-	EMU1010_SOURCE_OUTPUT("Dock DAC2 Right Playback Enum", 3),
-	EMU1010_SOURCE_OUTPUT("Dock DAC3 Left Playback Enum", 4),
-	EMU1010_SOURCE_OUTPUT("Dock DAC3 Right Playback Enum", 5),
-	EMU1010_SOURCE_OUTPUT("Dock DAC4 Left Playback Enum", 6),
-	EMU1010_SOURCE_OUTPUT("Dock DAC4 Right Playback Enum", 7),
-	EMU1010_SOURCE_OUTPUT("Dock Phones Left Playback Enum", 8),
-	EMU1010_SOURCE_OUTPUT("Dock Phones Right Playback Enum", 9),
-	EMU1010_SOURCE_OUTPUT("Dock SPDIF Left Playback Enum", 0xa),
-	EMU1010_SOURCE_OUTPUT("Dock SPDIF Right Playback Enum", 0xb),
-	EMU1010_SOURCE_OUTPUT("1010 SPDIF Left Playback Enum", 0xc),
-	EMU1010_SOURCE_OUTPUT("1010 SPDIF Right Playback Enum", 0xd),
-	EMU1010_SOURCE_OUTPUT("0202 DAC Left Playback Enum", 0xe),
-	EMU1010_SOURCE_OUTPUT("0202 DAC Right Playback Enum", 0xf),
-	EMU1010_SOURCE_OUTPUT("1010 ADAT 0 Playback Enum", 0x10),
-	EMU1010_SOURCE_OUTPUT("1010 ADAT 1 Playback Enum", 0x11),
-	EMU1010_SOURCE_OUTPUT("1010 ADAT 2 Playback Enum", 0x12),
-	EMU1010_SOURCE_OUTPUT("1010 ADAT 3 Playback Enum", 0x13),
-	EMU1010_SOURCE_OUTPUT("1010 ADAT 4 Playback Enum", 0x14),
-	EMU1010_SOURCE_OUTPUT("1010 ADAT 5 Playback Enum", 0x15),
-	EMU1010_SOURCE_OUTPUT("1010 ADAT 6 Playback Enum", 0x16),
-	EMU1010_SOURCE_OUTPUT("1010 ADAT 7 Playback Enum", 0x17),
+static const struct snd_kcontrol_new emu1010_input_source_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+	.info = snd_emu1010_input_output_source_info,
+	.get = snd_emu1010_input_source_get,
+	.put = snd_emu1010_input_source_put
 };
 
 
-/* 1616(m) cardbus */
-static const struct snd_kcontrol_new snd_emu1616_output_enum_ctls[] = {
-	EMU1010_SOURCE_OUTPUT("Dock DAC1 Left Playback Enum", 0),
-	EMU1010_SOURCE_OUTPUT("Dock DAC1 Right Playback Enum", 1),
-	EMU1010_SOURCE_OUTPUT("Dock DAC2 Left Playback Enum", 2),
-	EMU1010_SOURCE_OUTPUT("Dock DAC2 Right Playback Enum", 3),
-	EMU1010_SOURCE_OUTPUT("Dock DAC3 Left Playback Enum", 4),
-	EMU1010_SOURCE_OUTPUT("Dock DAC3 Right Playback Enum", 5),
-	EMU1010_SOURCE_OUTPUT("Dock SPDIF Left Playback Enum", 6),
-	EMU1010_SOURCE_OUTPUT("Dock SPDIF Right Playback Enum", 7),
-	EMU1010_SOURCE_OUTPUT("Dock ADAT 0 Playback Enum", 8),
-	EMU1010_SOURCE_OUTPUT("Dock ADAT 1 Playback Enum", 9),
-	EMU1010_SOURCE_OUTPUT("Dock ADAT 2 Playback Enum", 0xa),
-	EMU1010_SOURCE_OUTPUT("Dock ADAT 3 Playback Enum", 0xb),
-	EMU1010_SOURCE_OUTPUT("Dock ADAT 4 Playback Enum", 0xc),
-	EMU1010_SOURCE_OUTPUT("Dock ADAT 5 Playback Enum", 0xd),
-	EMU1010_SOURCE_OUTPUT("Dock ADAT 6 Playback Enum", 0xe),
-	EMU1010_SOURCE_OUTPUT("Dock ADAT 7 Playback Enum", 0xf),
-	EMU1010_SOURCE_OUTPUT("Mana DAC Left Playback Enum", 0x10),
-	EMU1010_SOURCE_OUTPUT("Mana DAC Right Playback Enum", 0x11),
+static const char * const snd_emu1010_adc_pads[] = {
+	"ADC1 14dB PAD Audio Dock Capture Switch",
+	"ADC2 14dB PAD Audio Dock Capture Switch",
+	"ADC3 14dB PAD Audio Dock Capture Switch",
+	"ADC1 14dB PAD 0202 Capture Switch",
 };
 
-
-#define EMU1010_SOURCE_INPUT(xname,chid) \
-{								\
-	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname,	\
-	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,		\
-	.info =  snd_emu1010_input_output_source_info,		\
-	.get =   snd_emu1010_input_source_get,			\
-	.put =   snd_emu1010_input_source_put,			\
-	.private_value = chid					\
-}
-
-static const struct snd_kcontrol_new snd_emu1010_input_enum_ctls[] = {
-	EMU1010_SOURCE_INPUT("DSP 0 Capture Enum", 0),
-	EMU1010_SOURCE_INPUT("DSP 1 Capture Enum", 1),
-	EMU1010_SOURCE_INPUT("DSP 2 Capture Enum", 2),
-	EMU1010_SOURCE_INPUT("DSP 3 Capture Enum", 3),
-	EMU1010_SOURCE_INPUT("DSP 4 Capture Enum", 4),
-	EMU1010_SOURCE_INPUT("DSP 5 Capture Enum", 5),
-	EMU1010_SOURCE_INPUT("DSP 6 Capture Enum", 6),
-	EMU1010_SOURCE_INPUT("DSP 7 Capture Enum", 7),
-	EMU1010_SOURCE_INPUT("DSP 8 Capture Enum", 8),
-	EMU1010_SOURCE_INPUT("DSP 9 Capture Enum", 9),
-	EMU1010_SOURCE_INPUT("DSP A Capture Enum", 0xa),
-	EMU1010_SOURCE_INPUT("DSP B Capture Enum", 0xb),
-	EMU1010_SOURCE_INPUT("DSP C Capture Enum", 0xc),
-	EMU1010_SOURCE_INPUT("DSP D Capture Enum", 0xd),
-	EMU1010_SOURCE_INPUT("DSP E Capture Enum", 0xe),
-	EMU1010_SOURCE_INPUT("DSP F Capture Enum", 0xf),
-	EMU1010_SOURCE_INPUT("DSP 10 Capture Enum", 0x10),
-	EMU1010_SOURCE_INPUT("DSP 11 Capture Enum", 0x11),
-	EMU1010_SOURCE_INPUT("DSP 12 Capture Enum", 0x12),
-	EMU1010_SOURCE_INPUT("DSP 13 Capture Enum", 0x13),
-	EMU1010_SOURCE_INPUT("DSP 14 Capture Enum", 0x14),
-	EMU1010_SOURCE_INPUT("DSP 15 Capture Enum", 0x15),
+static const unsigned short snd_emu1010_adc_pad_regs[] = {
+	EMU_HANA_DOCK_ADC_PAD1,
+	EMU_HANA_DOCK_ADC_PAD2,
+	EMU_HANA_DOCK_ADC_PAD3,
+	EMU_HANA_0202_ADC_PAD1,
 };
 
-
-
 #define snd_emu1010_adc_pads_info	snd_ctl_boolean_mono_info
 
 static int snd_emu1010_adc_pads_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
-	unsigned int mask = kcontrol->private_value & 0xff;
+	unsigned int mask = snd_emu1010_adc_pad_regs[kcontrol->private_value];
+
 	ucontrol->value.integer.value[0] = (emu->emu1010.adc_pads & mask) ? 1 : 0;
 	return 0;
 }
 
 static int snd_emu1010_adc_pads_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
-	unsigned int mask = kcontrol->private_value & 0xff;
+	unsigned int mask = snd_emu1010_adc_pad_regs[kcontrol->private_value];
 	unsigned int val, cache;
 	val = ucontrol->value.integer.value[0];
 	cache = emu->emu1010.adc_pads;
@@ -490,39 +471,46 @@ static int snd_emu1010_adc_pads_put(struct snd_kcontrol *kcontrol, struct snd_ct
 	return 0;
 }
 
+static const struct snd_kcontrol_new emu1010_adc_pads_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+	.info = snd_emu1010_adc_pads_info,
+	.get = snd_emu1010_adc_pads_get,
+	.put = snd_emu1010_adc_pads_put
+};
 
 
-#define EMU1010_ADC_PADS(xname,chid) \
-{								\
-	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname,	\
-	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,		\
-	.info =  snd_emu1010_adc_pads_info,			\
-	.get =   snd_emu1010_adc_pads_get,			\
-	.put =   snd_emu1010_adc_pads_put,			\
-	.private_value = chid					\
-}
+static const char * const snd_emu1010_dac_pads[] = {
+	"DAC1 Audio Dock 14dB PAD Playback Switch",
+	"DAC2 Audio Dock 14dB PAD Playback Switch",
+	"DAC3 Audio Dock 14dB PAD Playback Switch",
+	"DAC4 Audio Dock 14dB PAD Playback Switch",
+	"DAC1 0202 14dB PAD Playback Switch",
+};
 
-static const struct snd_kcontrol_new snd_emu1010_adc_pads[] = {
-	EMU1010_ADC_PADS("ADC1 14dB PAD Audio Dock Capture Switch", EMU_HANA_DOCK_ADC_PAD1),
-	EMU1010_ADC_PADS("ADC2 14dB PAD Audio Dock Capture Switch", EMU_HANA_DOCK_ADC_PAD2),
-	EMU1010_ADC_PADS("ADC3 14dB PAD Audio Dock Capture Switch", EMU_HANA_DOCK_ADC_PAD3),
-	EMU1010_ADC_PADS("ADC1 14dB PAD 0202 Capture Switch", EMU_HANA_0202_ADC_PAD1),
+static const unsigned short snd_emu1010_dac_regs[] = {
+	EMU_HANA_DOCK_DAC_PAD1,
+	EMU_HANA_DOCK_DAC_PAD2,
+	EMU_HANA_DOCK_DAC_PAD3,
+	EMU_HANA_DOCK_DAC_PAD4,
+	EMU_HANA_0202_DAC_PAD1,
 };
 
 #define snd_emu1010_dac_pads_info	snd_ctl_boolean_mono_info
 
 static int snd_emu1010_dac_pads_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
-	unsigned int mask = kcontrol->private_value & 0xff;
+	unsigned int mask = snd_emu1010_dac_regs[kcontrol->private_value];
+
 	ucontrol->value.integer.value[0] = (emu->emu1010.dac_pads & mask) ? 1 : 0;
 	return 0;
 }
 
 static int snd_emu1010_dac_pads_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
-	unsigned int mask = kcontrol->private_value & 0xff;
+	unsigned int mask = snd_emu1010_dac_regs[kcontrol->private_value];
 	unsigned int val, cache;
 	val = ucontrol->value.integer.value[0];
 	cache = emu->emu1010.dac_pads;
@@ -538,24 +526,12 @@ static int snd_emu1010_dac_pads_put(struct snd_kcontrol *kcontrol, struct snd_ct
 	return 0;
 }
 
-
-
-#define EMU1010_DAC_PADS(xname,chid) \
-{								\
-	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname,	\
-	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,		\
-	.info =  snd_emu1010_dac_pads_info,			\
-	.get =   snd_emu1010_dac_pads_get,			\
-	.put =   snd_emu1010_dac_pads_put,			\
-	.private_value = chid					\
-}
-
-static const struct snd_kcontrol_new snd_emu1010_dac_pads[] = {
-	EMU1010_DAC_PADS("DAC1 Audio Dock 14dB PAD Playback Switch", EMU_HANA_DOCK_DAC_PAD1),
-	EMU1010_DAC_PADS("DAC2 Audio Dock 14dB PAD Playback Switch", EMU_HANA_DOCK_DAC_PAD2),
-	EMU1010_DAC_PADS("DAC3 Audio Dock 14dB PAD Playback Switch", EMU_HANA_DOCK_DAC_PAD3),
-	EMU1010_DAC_PADS("DAC4 Audio Dock 14dB PAD Playback Switch", EMU_HANA_DOCK_DAC_PAD4),
-	EMU1010_DAC_PADS("DAC1 0202 14dB PAD Playback Switch", EMU_HANA_0202_DAC_PAD1),
+static const struct snd_kcontrol_new emu1010_dac_pads_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+	.info = snd_emu1010_dac_pads_info,
+	.get = snd_emu1010_dac_pads_get,
+	.put = snd_emu1010_dac_pads_put
 };
 
 
@@ -927,22 +903,19 @@ static int snd_audigy_i2c_volume_put(struct snd_kcontrol *kcontrol,
 	return change;
 }
 
-#define I2C_VOLUME(xname,chid) \
-{								\
-	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname,	\
-	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE |		\
-	          SNDRV_CTL_ELEM_ACCESS_TLV_READ,		\
-	.info =  snd_audigy_i2c_volume_info,			\
-	.get =   snd_audigy_i2c_volume_get,			\
-	.put =   snd_audigy_i2c_volume_put,			\
-	.tlv = { .p = snd_audigy_db_scale2 },			\
-	.private_value = chid					\
-}
+static const struct snd_kcontrol_new i2c_volume_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE |
+	          SNDRV_CTL_ELEM_ACCESS_TLV_READ,
+	.info = snd_audigy_i2c_volume_info,
+	.get = snd_audigy_i2c_volume_get,
+	.put = snd_audigy_i2c_volume_put,
+	.tlv = { .p = snd_audigy_db_scale2 }
+};
 
-
-static const struct snd_kcontrol_new snd_audigy_i2c_volume_ctls[] = {
-	I2C_VOLUME("Mic Capture Volume", 0),
-	I2C_VOLUME("Line Capture Volume", 0)
+static const char * const snd_audigy_i2c_volume_ctls[] = {
+	"Mic Capture Volume",
+	"Line Capture Volume",
 };
 
 #if 0
@@ -2003,34 +1976,26 @@ int snd_emu10k1_mixer(struct snd_emu10k1 *emu,
 
 	if (emu->card_capabilities->emu_model == EMU_MODEL_EMU1616) {
 		/* 1616(m) cardbus */
-		int i;
-
-		for (i = 0; i < ARRAY_SIZE(snd_emu1616_output_enum_ctls); i++) {
-			err = snd_ctl_add(card,
-				snd_ctl_new1(&snd_emu1616_output_enum_ctls[i],
-					     emu));
-			if (err < 0)
-				return err;
-		}
-		for (i = 0; i < ARRAY_SIZE(snd_emu1010_input_enum_ctls); i++) {
-			err = snd_ctl_add(card,
-				snd_ctl_new1(&snd_emu1010_input_enum_ctls[i],
-					     emu));
-			if (err < 0)
-				return err;
-		}
-		for (i = 0; i < ARRAY_SIZE(snd_emu1010_adc_pads) - 2; i++) {
-			err = snd_ctl_add(card,
-				snd_ctl_new1(&snd_emu1010_adc_pads[i], emu));
-			if (err < 0)
-				return err;
-		}
-		for (i = 0; i < ARRAY_SIZE(snd_emu1010_dac_pads) - 2; i++) {
-			err = snd_ctl_add(card,
-				snd_ctl_new1(&snd_emu1010_dac_pads[i], emu));
-			if (err < 0)
-				return err;
-		}
+		err = add_ctls(emu, &emu1010_output_source_ctl,
+			       snd_emu1616_output_texts,
+			       ARRAY_SIZE(snd_emu1616_output_texts));
+		if (err < 0)
+			return err;
+		err = add_ctls(emu, &emu1010_input_source_ctl,
+			       emu1010_input_texts,
+			       ARRAY_SIZE(emu1010_input_texts));
+		if (err < 0)
+			return err;
+		err = add_ctls(emu, &emu1010_adc_pads_ctl,
+			       snd_emu1010_adc_pads,
+			       ARRAY_SIZE(snd_emu1010_adc_pads) - 2);
+		if (err < 0)
+			return err;
+		err = add_ctls(emu, &emu1010_dac_pads_ctl,
+			       snd_emu1010_dac_pads,
+			       ARRAY_SIZE(snd_emu1010_dac_pads) - 2);
+		if (err < 0)
+			return err;
 		err = snd_ctl_add(card,
 			snd_ctl_new1(&snd_emu1010_internal_clock, emu));
 		if (err < 0)
@@ -2046,34 +2011,26 @@ int snd_emu10k1_mixer(struct snd_emu10k1 *emu,
 
 	} else if (emu->card_capabilities->emu_model) {
 		/* all other e-mu cards for now */
-		int i;
-
-		for (i = 0; i < ARRAY_SIZE(snd_emu1010_output_enum_ctls); i++) {
-			err = snd_ctl_add(card,
-				snd_ctl_new1(&snd_emu1010_output_enum_ctls[i],
-					     emu));
-			if (err < 0)
-				return err;
-		}
-		for (i = 0; i < ARRAY_SIZE(snd_emu1010_input_enum_ctls); i++) {
-			err = snd_ctl_add(card,
-				snd_ctl_new1(&snd_emu1010_input_enum_ctls[i],
-					     emu));
-			if (err < 0)
-				return err;
-		}
-		for (i = 0; i < ARRAY_SIZE(snd_emu1010_adc_pads); i++) {
-			err = snd_ctl_add(card,
-				snd_ctl_new1(&snd_emu1010_adc_pads[i], emu));
-			if (err < 0)
-				return err;
-		}
-		for (i = 0; i < ARRAY_SIZE(snd_emu1010_dac_pads); i++) {
-			err = snd_ctl_add(card,
-				snd_ctl_new1(&snd_emu1010_dac_pads[i], emu));
-			if (err < 0)
-				return err;
-		}
+		err = add_ctls(emu, &emu1010_output_source_ctl,
+			       emu1010_output_texts,
+			       ARRAY_SIZE(emu1010_output_texts));
+		if (err < 0)
+			return err;
+		err = add_ctls(emu, &emu1010_input_source_ctl,
+			       emu1010_input_texts,
+			       ARRAY_SIZE(emu1010_input_texts));
+		if (err < 0)
+			return err;
+		err = add_ctls(emu, &emu1010_adc_pads_ctl,
+			       snd_emu1010_adc_pads,
+			       ARRAY_SIZE(snd_emu1010_adc_pads));
+		if (err < 0)
+			return err;
+		err = add_ctls(emu, &emu1010_dac_pads_ctl,
+			       snd_emu1010_dac_pads,
+			       ARRAY_SIZE(snd_emu1010_dac_pads));
+		if (err < 0)
+			return err;
 		err = snd_ctl_add(card,
 			snd_ctl_new1(&snd_emu1010_internal_clock, emu));
 		if (err < 0)
@@ -2089,17 +2046,15 @@ int snd_emu10k1_mixer(struct snd_emu10k1 *emu,
 	}
 
 	if ( emu->card_capabilities->i2c_adc) {
-		int i;
-
 		err = snd_ctl_add(card, snd_ctl_new1(&snd_audigy_i2c_capture_source, emu));
 		if (err < 0)
 			return err;
 
-		for (i = 0; i < ARRAY_SIZE(snd_audigy_i2c_volume_ctls); i++) {
-			err = snd_ctl_add(card, snd_ctl_new1(&snd_audigy_i2c_volume_ctls[i], emu));
-			if (err < 0)
-				return err;
-		}
+		err = add_ctls(emu, &i2c_volume_ctl,
+			       snd_audigy_i2c_volume_ctls,
+			       ARRAY_SIZE(snd_audigy_i2c_volume_ctls));
+		if (err < 0)
+			return err;
 	}
 		
 	if (emu->card_capabilities->ac97_chip && emu->audigy) {
-- 
2.40.0.152.g15d061e6df

