Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C286FE365
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 19:43:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7C791047;
	Wed, 10 May 2023 19:42:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7C791047
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683740623;
	bh=PxulV14ujDPBMDphFGka6Zapf02XJe244zzuFfAt82w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pbkIXdJqptOQnpk+7yS5J145FvdO3CYNJP8PQtXu9wFqDDF9rCKqBbgU4AbK7Xf15
	 IlHBoaZ4HrZfkG7P+1kPgjovGvqmuCuC0s38x5JyFc9UEGn+Sw/12uk5rJXQgpwYqF
	 RQgwoJNRvuWPAkfTYFMOMyb8PRcr4UdK0QFkb9tM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 28FD8F805B4;
	Wed, 10 May 2023 19:40:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E1E7F804B1; Wed, 10 May 2023 19:39:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2534EF8032D
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 19:39:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2534EF8032D
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 28780241AC;
	Wed, 10 May 2023 13:39:18 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pwnmX-tT6-00; Wed, 10 May 2023 19:39:17 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 05/14] ALSA: emu10k1: apply channel delay hack to all E-MU
 cards
Date: Wed, 10 May 2023 19:39:08 +0200
Message-Id: <20230510173917.3073107-6-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230510173917.3073107-1-oswald.buddenhagen@gmx.de>
References: <20230510173917.3073107-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZR3KSMJIAK4JA4KDEWQ7DAFPETTIAHAR
X-Message-ID-Hash: ZR3KSMJIAK4JA4KDEWQ7DAFPETTIAHAR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZR3KSMJIAK4JA4KDEWQ7DAFPETTIAHAR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Evidently, the channel delay bug exists in all E-MU cards; it's in the
Hana FPGA program, and was never fixed.

Note that the implementation is somewhat lazy - to localize the code
paths, we actually waste a GPR and a DSP instruction by keeping two
delay registers for the same physical source.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h   |  1 +
 sound/pci/emu10k1/emufx.c | 23 ++++++++++++++++++-----
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 8fe80dcee71b..7129b9249eb3 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1192,6 +1192,7 @@
  * emumixer.c - snd_emu1010_output_enum_ctls[], snd_emu1010_input_enum_ctls[]
  */
 #define EMU_DST_ALICE2_EMU32_0	0x000f	/* 16 EMU32 channels to Alice2 +0 to +0xf */
+					/* This channel is delayed by one sample. */
 #define EMU_DST_ALICE2_EMU32_1	0x0000	/* 16 EMU32 channels to Alice2 +0 to +0xf */
 #define EMU_DST_ALICE2_EMU32_2	0x0001	/* 16 EMU32 channels to Alice2 +0 to +0xf */
 #define EMU_DST_ALICE2_EMU32_3	0x0002	/* 16 EMU32 channels to Alice2 +0 to +0xf */
diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 8ba294138dfe..2e139ae8b41b 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -1326,13 +1326,20 @@ A_OP(icode, &ptr, iMAC0, A_GPR(var), A_GPR(var), A_GPR(vol), A_EXTIN(input))
 		if (emu->card_capabilities->ca0108_chip) {
 			// For unclear reasons, the EMU32IN cannot be the Y operand!
 			A_OP(icode, &ptr, iMAC0, A_GPR(capture+0), A_GPR(capture+0), A3_EMU32IN(0x0), A_GPR(gpr));
-			A_OP(icode, &ptr, iMAC0, A_GPR(capture+1), A_GPR(capture+1), A3_EMU32IN(0x1), A_GPR(gpr+1));
+			// A3_EMU32IN(0) is delayed by one sample, so all other A3_EMU32IN channels
+			// need to be delayed as well; we use an auxiliary register for that.
+			A_OP(icode, &ptr, iMAC0, A_GPR(capture+1), A_GPR(capture+1), A_GPR(gpr+2), A_GPR(gpr+1));
+			A_OP(icode, &ptr, iACC3, A_GPR(gpr+2), A3_EMU32IN(0x1), A_C_00000000, A_C_00000000);
 		} else {
 			A_OP(icode, &ptr, iMAC0, A_GPR(capture+0), A_GPR(capture+0), A_GPR(gpr), A_P16VIN(0x0));
-			A_OP(icode, &ptr, iMAC0, A_GPR(capture+1), A_GPR(capture+1), A_GPR(gpr+1), A_P16VIN(0x1));
+			// A_P16VIN(0) is delayed by one sample, so all other A_P16VIN channels
+			// need to be delayed as well; we use an auxiliary register for that.
+			A_OP(icode, &ptr, iMAC0, A_GPR(capture+1), A_GPR(capture+1), A_GPR(gpr+1), A_GPR(gpr+2));
+			A_OP(icode, &ptr, iACC3, A_GPR(gpr+2), A_P16VIN(0x1), A_C_00000000, A_C_00000000);
 		}
 		snd_emu10k1_init_stereo_control(&controls[nctl++], "EMU Capture Volume", gpr, 0);
-		gpr += 2;
+		gpr_map[gpr + 2] = 0x00000000;
+		gpr += 3;
 	}
 	/* AC'97 Playback Volume - used only for mic (renamed later) */
 	A_ADD_VOLUME_IN(stereo_mix, gpr, A_EXTIN_AC97_L);
@@ -1624,11 +1631,17 @@ A_OP(icode, &ptr, iMAC0, A_GPR(var), A_GPR(var), A_GPR(vol), A_EXTIN(input))
 			dev_info(emu->card->dev, "EMU2 inputs on\n");
 			/* Note that the Tina[2] DSPs have 16 more EMU32 inputs which we don't use. */
 
-			for (z = 0; z < 0x10; z++) {
+			snd_emu10k1_audigy_dsp_convert_32_to_2x16(
+				icode, &ptr, tmp, bit_shifter16, A3_EMU32IN(0), A_FXBUS2(0));
+			// A3_EMU32IN(0) is delayed by one sample, so all other A3_EMU32IN channels
+			// need to be delayed as well; we use an auxiliary register for that.
+			for (z = 1; z < 0x10; z++) {
 				snd_emu10k1_audigy_dsp_convert_32_to_2x16( icode, &ptr, tmp, 
 									bit_shifter16,
-									A3_EMU32IN(z),
+									A_GPR(gpr),
 									A_FXBUS2(z*2) );
+				A_OP(icode, &ptr, iACC3, A_GPR(gpr), A3_EMU32IN(z), A_C_00000000, A_C_00000000);
+				gpr_map[gpr++] = 0x00000000;
 			}
 		} else {
 			dev_info(emu->card->dev, "EMU inputs on\n");
-- 
2.40.0.152.g15d061e6df

