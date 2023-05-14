Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25162701E69
	for <lists+alsa-devel@lfdr.de>; Sun, 14 May 2023 19:05:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E8FCDF5;
	Sun, 14 May 2023 19:04:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E8FCDF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684083942;
	bh=URvUhbsYfTgR4WfTJwjhQjKSwOsELxkcs1/auTQE664=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bIUeVlqp8Pppcn27TdtoqPHWrf/8N8i/QHxuZ0GQNrwPwlyE1uw+9VN7EeAXAAgBU
	 re+QArhTSWHa14fbP1X3kCqxOBqzro7cZVHgPqXdpgSb3Uda8QHhKZED575ftkSIRF
	 RZCCHdaVsbcybUd5Jw3QpT6pUIiK3M7FiyVdVSic=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70F83F805AD; Sun, 14 May 2023 19:03:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 860B8F805A9;
	Sun, 14 May 2023 19:03:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF623F80587; Sun, 14 May 2023 19:03:41 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id F157AF80544
	for <alsa-devel@alsa-project.org>; Sun, 14 May 2023 19:03:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F157AF80544
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 9B13224271;
	Sun, 14 May 2023 13:03:23 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pyF7z-InY-00; Sun, 14 May 2023 19:03:23 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v2 1/7] ALSA: emu10k1: polish audigy GPR allocation
Date: Sun, 14 May 2023 19:03:17 +0200
Message-Id: <20230514170323.3408834-2-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230514170323.3408834-1-oswald.buddenhagen@gmx.de>
References: <20230514170323.3408834-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HOCZT6L232ZQR7FKZFXWGKJ44LYK3XEY
X-Message-ID-Hash: HOCZT6L232ZQR7FKZFXWGKJ44LYK3XEY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HOCZT6L232ZQR7FKZFXWGKJ44LYK3XEY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

- Pull ahead all fixed allocations, so we don't rely on the semi-
  dynamic ones not crossing the arbitrarily determined limit
- Use an enum for the fixed allocations
- Stop arbitrarily wasting registers on unexplained "reservations"
- Don't reserve two regs for the master volume control - it's mono

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
v2: rebased out patch concerning assertions
---
 sound/pci/emu10k1/emufx.c | 69 +++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 32 deletions(-)

diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 2da1f9f1fb5a..43abb6c04a7f 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -1202,18 +1202,31 @@ static void snd_emu10k1_audigy_dsp_convert_32_to_2x16(
 	A_OP(icode, ptr, iMAC3, reg_out, A_GPR(tmp), A_GPR(tmp), A_C_80000000);
 }
 
+#define ENUM_GPR(name, size) name, name ## _dummy = name + (size) - 1
+
 /*
  * initial DSP configuration for Audigy
  */
 
 static int _snd_emu10k1_audigy_init_efx(struct snd_emu10k1 *emu)
 {
-	int err, z, gpr, nctl;
-	int bit_shifter16;
-	const int playback = 10;
-	const int capture = playback + SND_EMU10K1_PLAYBACK_CHANNELS; /* we reserve 10 voices */
-	const int stereo_mix = capture + 2;
-	const int tmp = 0x88;
+	int err, z, nctl;
+	enum {
+		ENUM_GPR(playback, SND_EMU10K1_PLAYBACK_CHANNELS),
+		ENUM_GPR(stereo_mix, 2),
+		ENUM_GPR(capture, 2),
+		ENUM_GPR(bit_shifter16, 1),
+		// The fixed allocation of these breaks the pattern, but why not.
+		// Splitting these into left/right is questionable, as it will break
+		// down for center/lfe. But it works for stereo/quadro, so whatever.
+		ENUM_GPR(bass_gpr, 2 * 5),  // two sides, five coefficients
+		ENUM_GPR(treble_gpr, 2 * 5),
+		ENUM_GPR(bass_tmp, SND_EMU10K1_PLAYBACK_CHANNELS * 4),  // four delay stages
+		ENUM_GPR(treble_tmp, SND_EMU10K1_PLAYBACK_CHANNELS * 4),
+		ENUM_GPR(tmp, 3),
+		num_static_gprs
+	};
+	int gpr = num_static_gprs;
 	u32 ptr, ptr_skip;
 	struct snd_emu10k1_fx8010_code *icode = NULL;
 	struct snd_emu10k1_fx8010_control_gpr *controls = NULL, *ctl;
@@ -1248,9 +1261,7 @@ static int _snd_emu10k1_audigy_init_efx(struct snd_emu10k1 *emu)
 	strcpy(icode->name, "Audigy DSP code for ALSA");
 	ptr = 0;
 	nctl = 0;
-	gpr = stereo_mix + 10;
-	bit_shifter16 = gpr;
-	gpr_map[gpr++] = 0x00008000;
+	gpr_map[bit_shifter16] = 0x00008000;
 
 #if 1
 	/* PCM front Playback Volume (independent from stereo mix)
@@ -1492,15 +1503,11 @@ A_OP(icode, &ptr, iMAC0, A_GPR(var), A_GPR(var), A_GPR(vol), A_EXTIN(input))
 	ctl->max = 40;
 	ctl->value[0] = ctl->value[1] = 20;
 	ctl->translation = EMU10K1_GPR_TRANSLATION_TREBLE;
-
-#define BASS_GPR	0x8c
-#define TREBLE_GPR	0x96
-
 	for (z = 0; z < 5; z++) {
 		int j;
 		for (j = 0; j < 2; j++) {
-			controls[nctl + 0].gpr[z * 2 + j] = BASS_GPR + z * 2 + j;
-			controls[nctl + 1].gpr[z * 2 + j] = TREBLE_GPR + z * 2 + j;
+			controls[nctl + 0].gpr[z * 2 + j] = bass_gpr + z * 2 + j;
+			controls[nctl + 1].gpr[z * 2 + j] = treble_gpr + z * 2 + j;
 		}
 	}
 	nctl += 2;
@@ -1513,40 +1520,37 @@ A_OP(icode, &ptr, iMAC0, A_GPR(var), A_GPR(var), A_GPR(vol), A_EXTIN(input))
 	for (z = 0; z < 4; z++) {		/* front/rear/center-lfe/side */
 		int j, k, l, d;
 		for (j = 0; j < 2; j++) {	/* left/right */
-			k = 0xb0 + (z * 8) + (j * 4);
-			l = 0xe0 + (z * 8) + (j * 4);
+			k = bass_tmp + (z * 8) + (j * 4);
+			l = treble_tmp + (z * 8) + (j * 4);
 			d = playback + z * 2 + j;
 
-			A_OP(icode, &ptr, iMAC0, A_C_00000000, A_C_00000000, A_GPR(d), A_GPR(BASS_GPR + 0 + j));
-			A_OP(icode, &ptr, iMACMV, A_GPR(k+1), A_GPR(k), A_GPR(k+1), A_GPR(BASS_GPR + 4 + j));
-			A_OP(icode, &ptr, iMACMV, A_GPR(k), A_GPR(d), A_GPR(k), A_GPR(BASS_GPR + 2 + j));
-			A_OP(icode, &ptr, iMACMV, A_GPR(k+3), A_GPR(k+2), A_GPR(k+3), A_GPR(BASS_GPR + 8 + j));
-			A_OP(icode, &ptr, iMAC0, A_GPR(k+2), A_GPR_ACCU, A_GPR(k+2), A_GPR(BASS_GPR + 6 + j));
+			A_OP(icode, &ptr, iMAC0, A_C_00000000, A_C_00000000, A_GPR(d), A_GPR(bass_gpr + 0 + j));
+			A_OP(icode, &ptr, iMACMV, A_GPR(k+1), A_GPR(k), A_GPR(k+1), A_GPR(bass_gpr + 4 + j));
+			A_OP(icode, &ptr, iMACMV, A_GPR(k), A_GPR(d), A_GPR(k), A_GPR(bass_gpr + 2 + j));
+			A_OP(icode, &ptr, iMACMV, A_GPR(k+3), A_GPR(k+2), A_GPR(k+3), A_GPR(bass_gpr + 8 + j));
+			A_OP(icode, &ptr, iMAC0, A_GPR(k+2), A_GPR_ACCU, A_GPR(k+2), A_GPR(bass_gpr + 6 + j));
 			A_OP(icode, &ptr, iACC3, A_GPR(k+2), A_GPR(k+2), A_GPR(k+2), A_C_00000000);
 
-			A_OP(icode, &ptr, iMAC0, A_C_00000000, A_C_00000000, A_GPR(k+2), A_GPR(TREBLE_GPR + 0 + j));
-			A_OP(icode, &ptr, iMACMV, A_GPR(l+1), A_GPR(l), A_GPR(l+1), A_GPR(TREBLE_GPR + 4 + j));
-			A_OP(icode, &ptr, iMACMV, A_GPR(l), A_GPR(k+2), A_GPR(l), A_GPR(TREBLE_GPR + 2 + j));
-			A_OP(icode, &ptr, iMACMV, A_GPR(l+3), A_GPR(l+2), A_GPR(l+3), A_GPR(TREBLE_GPR + 8 + j));
-			A_OP(icode, &ptr, iMAC0, A_GPR(l+2), A_GPR_ACCU, A_GPR(l+2), A_GPR(TREBLE_GPR + 6 + j));
+			A_OP(icode, &ptr, iMAC0, A_C_00000000, A_C_00000000, A_GPR(k+2), A_GPR(treble_gpr + 0 + j));
+			A_OP(icode, &ptr, iMACMV, A_GPR(l+1), A_GPR(l), A_GPR(l+1), A_GPR(treble_gpr + 4 + j));
+			A_OP(icode, &ptr, iMACMV, A_GPR(l), A_GPR(k+2), A_GPR(l), A_GPR(treble_gpr + 2 + j));
+			A_OP(icode, &ptr, iMACMV, A_GPR(l+3), A_GPR(l+2), A_GPR(l+3), A_GPR(treble_gpr + 8 + j));
+			A_OP(icode, &ptr, iMAC0, A_GPR(l+2), A_GPR_ACCU, A_GPR(l+2), A_GPR(treble_gpr + 6 + j));
 			A_OP(icode, &ptr, iMACINT0, A_GPR(l+2), A_C_00000000, A_GPR(l+2), A_C_00000010);
 
 			A_OP(icode, &ptr, iACC3, A_GPR(d), A_GPR(l+2), A_C_00000000, A_C_00000000);
 
 			if (z == 2)	/* center */
 				break;
 		}
 	}
 	gpr_map[gpr++] = ptr - ptr_skip;
 
-#undef BASS_GPR
-#undef TREBLE_GPR
-
 	/* Master volume (will be renamed later) */
 	for (z = 0; z < 8; z++)
 		A_OP(icode, &ptr, iMAC0, A_GPR(playback+z), A_C_00000000, A_GPR(gpr), A_GPR(playback+z));
 	snd_emu10k1_init_mono_control(&controls[nctl++], "Wave Master Playback Volume", gpr, 0);
-	gpr += 2;
+	gpr++;
 
 	/* analog speakers */
 	A_PUT_STEREO_OUTPUT(A_EXTOUT_AFRONT_L, A_EXTOUT_AFRONT_R, playback);
@@ -1668,11 +1672,12 @@ A_OP(icode, &ptr, iMAC0, A_GPR(var), A_GPR(var), A_GPR(vol), A_EXTIN(input))
 	 * ok, set up done..
 	 */
 
-	if (gpr > tmp) {
+	if (gpr > 512) {
 		snd_BUG();
 		err = -EIO;
 		goto __err;
 	}
+
 	/* clear remaining instruction memory */
 	while (ptr < 0x400)
 		A_OP(icode, &ptr, 0x0f, 0xc0, 0xc0, 0xcf, 0xc0);
-- 
2.40.0.152.g15d061e6df

