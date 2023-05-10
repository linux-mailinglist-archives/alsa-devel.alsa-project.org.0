Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B97866FE363
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 19:43:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07522103F;
	Wed, 10 May 2023 19:42:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07522103F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683740595;
	bh=VaseVVvAIjy6UfrsHwNDccuOs0g9omTa1JDulHP3lRw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=po3FBtBRq34uhWw8L3vOtbv4dj1+p/8S67Voc3mOA8Aj6quCKTSvnZ0bS4JSAENgg
	 Fua3TKu63kGXwhxwL8BToE3vMS8aGPACEsGsCf8x1nFaDGMVSzJWBuROAubE9CrMYs
	 SGYWapN+ikKgbS2OOwqXTCThoIvCx4FSzWkJxkKc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 485A5F805A1;
	Wed, 10 May 2023 19:39:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03097F8052E; Wed, 10 May 2023 19:39:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8732BF80534
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 19:39:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8732BF80534
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 2BCBD2423B;
	Wed, 10 May 2023 13:39:18 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pwnmX-tT0-00; Wed, 10 May 2023 19:39:17 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 04/14] ALSA: emu10k1: simplify
 snd_emu10k1_audigy_dsp_convert_32_to_2x16()
Date: Wed, 10 May 2023 19:39:07 +0200
Message-Id: <20230510173917.3073107-5-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230510173917.3073107-1-oswald.buddenhagen@gmx.de>
References: <20230510173917.3073107-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GSRFMVRMHGAPIQHYHI5WPETBG4Q5CQTM
X-Message-ID-Hash: GSRFMVRMHGAPIQHYHI5WPETBG4Q5CQTM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GSRFMVRMHGAPIQHYHI5WPETBG4Q5CQTM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Instead of spending lots of instructions on masking and transplanting
the sign bit, sidestep the issue by replacing the last bit shift with
a wrapping addition to self.

Solution stolen from kX-project, after I pondered other ideas first.

Also, the function really doesn't need to return a constant int value.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emufx.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 795b2573fef4..8ba294138dfe 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -1184,20 +1184,22 @@ snd_emu10k1_init_stereo_onoff_control(struct snd_emu10k1_fx8010_control_gpr *ctl
  * to 2 x 16-bit registers in Audigy - their values are read via DMA.
  * Conversion is performed by Audigy DSP instructions of FX8010.
  */
-static int snd_emu10k1_audigy_dsp_convert_32_to_2x16(
+static void snd_emu10k1_audigy_dsp_convert_32_to_2x16(
 				struct snd_emu10k1_fx8010_code *icode,
 				u32 *ptr, int tmp, int bit_shifter16,
 				int reg_in, int reg_out)
 {
-	A_OP(icode, ptr, iACC3, A_GPR(tmp + 1), reg_in, A_C_00000000, A_C_00000000);
-	A_OP(icode, ptr, iANDXOR, A_GPR(tmp), A_GPR(tmp + 1), A_GPR(bit_shifter16 - 1), A_C_00000000);
-	A_OP(icode, ptr, iTSTNEG, A_GPR(tmp + 2), A_GPR(tmp), A_C_80000000, A_GPR(bit_shifter16 - 2));
-	A_OP(icode, ptr, iANDXOR, A_GPR(tmp + 2), A_GPR(tmp + 2), A_C_80000000, A_C_00000000);
-	A_OP(icode, ptr, iANDXOR, A_GPR(tmp), A_GPR(tmp), A_GPR(bit_shifter16 - 3), A_C_00000000);
-	A_OP(icode, ptr, iMACINT0, A_GPR(tmp), A_C_00000000, A_GPR(tmp), A_C_00010000);
-	A_OP(icode, ptr, iANDXOR, reg_out, A_GPR(tmp), A_C_ffffffff, A_GPR(tmp + 2));
-	A_OP(icode, ptr, iACC3, reg_out + 1, A_GPR(tmp + 1), A_C_00000000, A_C_00000000);
-	return 1;
+	// This leaves the low word in place, which is fine,
+	// as the low bits are completely ignored subsequently.
+	// reg_out[1] = reg_in
+	A_OP(icode, ptr, iACC3, reg_out + 1, reg_in, A_C_00000000, A_C_00000000);
+	// It is fine to read reg_in multiple times.
+	// tmp = reg_in << 15
+	A_OP(icode, ptr, iMACINT1, A_GPR(tmp), A_C_00000000, reg_in, A_GPR(bit_shifter16));
+	// Left-shift once more. This is a separate step, as the
+	// signed multiplication would clobber the MSB.
+	// reg_out[0] = tmp + ((tmp << 31) >> 31)
+	A_OP(icode, ptr, iMAC3, reg_out, A_GPR(tmp), A_GPR(tmp), A_C_80000000);
 }
 
 /*
@@ -1247,10 +1249,8 @@ static int _snd_emu10k1_audigy_init_efx(struct snd_emu10k1 *emu)
 	ptr = 0;
 	nctl = 0;
 	gpr = stereo_mix + 10;
-	gpr_map[gpr++] = 0x00007fff;
-	gpr_map[gpr++] = 0x00008000;
-	gpr_map[gpr++] = 0x0000ffff;
 	bit_shifter16 = gpr;
+	gpr_map[gpr++] = 0x00008000;
 
 #if 1
 	/* PCM front Playback Volume (independent from stereo mix)
-- 
2.40.0.152.g15d061e6df

