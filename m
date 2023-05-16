Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFB570497B
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 11:39:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 775E3F0;
	Tue, 16 May 2023 11:38:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 775E3F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684229969;
	bh=B9CAmF5IVcjB7hnN3Cw/JaKTdtN7uvxX9Bh67GlbNG4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XbvuE1Xw2m/rKBkaL8EFoHe6L9gvclSGiyXPIE824gFNSh/8Hp79JYowSkoegAkRg
	 Tw6Vxic/r8Vy2hpzayL13ycFf6kY1BrZHnF9smR0IVP5MK8HQuIpM6PfZROcah1edh
	 PSBCyZgze2vqGClgZShIcvl3/Alasn9//XhjmXl0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 770E8F805D3; Tue, 16 May 2023 11:36:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5571F805C8;
	Tue, 16 May 2023 11:36:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FC22F805C7; Tue, 16 May 2023 11:36:44 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 46C02F80551
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 11:36:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46C02F80551
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 2CA6724298;
	Tue, 16 May 2023 05:36:13 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pyr6K-q1L-00; Tue, 16 May 2023 11:36:12 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 06/10] ALSA: emu10k1: make E-MU I/O routing init data-driven
Date: Tue, 16 May 2023 11:36:08 +0200
Message-Id: <20230516093612.3536508-7-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230516093612.3536508-1-oswald.buddenhagen@gmx.de>
References: <20230516093612.3536508-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EFGEYIWABRD37QMBE3QOKHKMVFDMMQYP
X-Message-ID-Hash: EFGEYIWABRD37QMBE3QOKHKMVFDMMQYP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EFGEYIWABRD37QMBE3QOKHKMVFDMMQYP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

... and move it to the mixer init, as it's logically part of it.

As a side effect, this fixes the initial values of the input destination
mixer controls, which would have previously remained at "Silent" despite
different defaults. This didn't really matter, though, as ALSA state
restoration would hide that bug beyond first use.

Note that this completely does away with clearing the output routing
registers, as it was rather pointless - we just programmed the FPGA
(resetting it first if necessary), so everything is zeroed anyway
(that's documented by Xilinx, and as further evidence, some of the loops
terminated too early, and we didn't bother clearing the high channels of
the input routes at all, all with no observed adverse effects).

As a drive-by, this also fixes some capture channel defaults - any
EMU_SRC_*2 isn't a sensible value in 1x clock mode.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emu10k1_main.c | 248 +------------------------------
 sound/pci/emu10k1/emumixer.c     |  97 ++++++++++++
 2 files changed, 99 insertions(+), 246 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index 068cb6624e36..c18ec08cf1e8 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -798,7 +798,6 @@ static void emu1010_firmware_work(struct work_struct *work)
  */
 static int snd_emu10k1_emu1010_init(struct snd_emu10k1 *emu)
 {
-	unsigned int i;
 	u32 tmp, tmp2, reg;
 	int err;
 
@@ -889,253 +888,10 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k1 *emu)
 	/* Audio Dock LEDs. */
 	snd_emu1010_fpga_write(emu, EMU_HANA_DOCK_LEDS_2, EMU_HANA_DOCK_LEDS_2_LOCK | EMU_HANA_DOCK_LEDS_2_48K);
 
-#if 0
-	/* For 96kHz */
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_0, EMU_SRC_HAMOA_ADC_LEFT1);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_1, EMU_SRC_HAMOA_ADC_RIGHT1);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_4, EMU_SRC_HAMOA_ADC_LEFT2);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_5, EMU_SRC_HAMOA_ADC_RIGHT2);
-#endif
-#if 0
-	/* For 192kHz */
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_0, EMU_SRC_HAMOA_ADC_LEFT1);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_1, EMU_SRC_HAMOA_ADC_RIGHT1);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_2, EMU_SRC_HAMOA_ADC_LEFT2);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_3, EMU_SRC_HAMOA_ADC_RIGHT2);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_4, EMU_SRC_HAMOA_ADC_LEFT3);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_5, EMU_SRC_HAMOA_ADC_RIGHT3);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_6, EMU_SRC_HAMOA_ADC_LEFT4);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_7, EMU_SRC_HAMOA_ADC_RIGHT4);
-#endif
-#if 1
-	/* For 48kHz */
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_0, EMU_SRC_DOCK_MIC_A1);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_1, EMU_SRC_DOCK_MIC_B1);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_2, EMU_SRC_HAMOA_ADC_LEFT2);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_3, EMU_SRC_HAMOA_ADC_LEFT2);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_4, EMU_SRC_DOCK_ADC1_LEFT1);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_5, EMU_SRC_DOCK_ADC1_RIGHT1);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_6, EMU_SRC_DOCK_ADC2_LEFT1);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_7, EMU_SRC_DOCK_ADC2_RIGHT1);
-	/* Pavel Hofman - setting defaults for 8 more capture channels
-	 * Defaults only, users will set their own values anyways, let's
-	 * just copy/paste.
-	 */
-
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_8, EMU_SRC_DOCK_MIC_A1);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_9, EMU_SRC_DOCK_MIC_B1);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_A, EMU_SRC_HAMOA_ADC_LEFT2);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_B, EMU_SRC_HAMOA_ADC_LEFT2);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_C, EMU_SRC_DOCK_ADC1_LEFT1);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_D, EMU_SRC_DOCK_ADC1_RIGHT1);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_E, EMU_SRC_DOCK_ADC2_LEFT1);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_F, EMU_SRC_DOCK_ADC2_RIGHT1);
-#endif
-#if 0
-	/* Original */
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_4, EMU_SRC_HANA_ADAT);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_5, EMU_SRC_HANA_ADAT + 1);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_6, EMU_SRC_HANA_ADAT + 2);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_7, EMU_SRC_HANA_ADAT + 3);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_8, EMU_SRC_HANA_ADAT + 4);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_9, EMU_SRC_HANA_ADAT + 5);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_A, EMU_SRC_HANA_ADAT + 6);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_B, EMU_SRC_HANA_ADAT + 7);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_C, EMU_SRC_DOCK_MIC_A1);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_D, EMU_SRC_DOCK_MIC_B1);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_E, EMU_SRC_HAMOA_ADC_LEFT2);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE2_EMU32_F, EMU_SRC_HAMOA_ADC_LEFT2);
-#endif
-	for (i = 0; i < 0x20; i++) {
-		/* AudioDock Elink <- Silence */
-		snd_emu1010_fpga_link_dst_src_write(emu, 0x0100 + i, EMU_SRC_SILENCE);
-	}
-	for (i = 0; i < 4; i++) {
-		/* Hana SPDIF Out <- Silence */
-		snd_emu1010_fpga_link_dst_src_write(emu, 0x0200 + i, EMU_SRC_SILENCE);
-	}
-	for (i = 0; i < 7; i++) {
-		/* Hamoa DAC <- Silence */
-		snd_emu1010_fpga_link_dst_src_write(emu, 0x0300 + i, EMU_SRC_SILENCE);
-	}
-	for (i = 0; i < 7; i++) {
-		/* Hana ADAT Out <- Silence */
-		snd_emu1010_fpga_link_dst_src_write(emu, EMU_DST_HANA_ADAT + i, EMU_SRC_SILENCE);
-	}
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE_I2S0_LEFT, EMU_SRC_DOCK_ADC1_LEFT1);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE_I2S0_RIGHT, EMU_SRC_DOCK_ADC1_RIGHT1);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE_I2S1_LEFT, EMU_SRC_DOCK_ADC2_LEFT1);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE_I2S1_RIGHT, EMU_SRC_DOCK_ADC2_RIGHT1);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE_I2S2_LEFT, EMU_SRC_DOCK_ADC3_LEFT1);
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_ALICE_I2S2_RIGHT, EMU_SRC_DOCK_ADC3_RIGHT1);
+	// The routes are all set to EMU_SRC_SILENCE due to the reset,
+	// so it is safe to simply enable the outputs.
 	snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, EMU_UNMUTE);
 
-#if 0
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_HAMOA_DAC_LEFT1, EMU_SRC_ALICE_EMU32B + 2); /* ALICE2 bus 0xa2 */
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_HAMOA_DAC_RIGHT1, EMU_SRC_ALICE_EMU32B + 3); /* ALICE2 bus 0xa3 */
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_HANA_SPDIF_LEFT1, EMU_SRC_ALICE_EMU32A + 2); /* ALICE2 bus 0xb2 */
-	snd_emu1010_fpga_link_dst_src_write(emu,
-		EMU_DST_HANA_SPDIF_RIGHT1, EMU_SRC_ALICE_EMU32A + 3); /* ALICE2 bus 0xb3 */
-#endif
-	/* Default outputs */
-	if (emu->card_capabilities->emu_model == EMU_MODEL_EMU1616) {
-		/* 1616(M) cardbus default outputs */
-		/* ALICE2 bus 0xa0 */
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			EMU_DST_DOCK_DAC1_LEFT1, EMU_SRC_ALICE_EMU32A + 0);
-		emu->emu1010.output_source[0] = 17;
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			EMU_DST_DOCK_DAC1_RIGHT1, EMU_SRC_ALICE_EMU32A + 1);
-		emu->emu1010.output_source[1] = 18;
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			EMU_DST_DOCK_DAC2_LEFT1, EMU_SRC_ALICE_EMU32A + 2);
-		emu->emu1010.output_source[2] = 19;
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			EMU_DST_DOCK_DAC2_RIGHT1, EMU_SRC_ALICE_EMU32A + 3);
-		emu->emu1010.output_source[3] = 20;
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			EMU_DST_DOCK_DAC3_LEFT1, EMU_SRC_ALICE_EMU32A + 4);
-		emu->emu1010.output_source[4] = 21;
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			EMU_DST_DOCK_DAC3_RIGHT1, EMU_SRC_ALICE_EMU32A + 5);
-		emu->emu1010.output_source[5] = 22;
-		/* ALICE2 bus 0xa0 */
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			EMU_DST_MANA_DAC_LEFT, EMU_SRC_ALICE_EMU32A + 0);
-		emu->emu1010.output_source[16] = 17;
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			EMU_DST_MANA_DAC_RIGHT, EMU_SRC_ALICE_EMU32A + 1);
-		emu->emu1010.output_source[17] = 18;
-	} else {
-		/* ALICE2 bus 0xa0 */
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			EMU_DST_DOCK_DAC1_LEFT1, EMU_SRC_ALICE_EMU32A + 0);
-		emu->emu1010.output_source[0] = 21;
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			EMU_DST_DOCK_DAC1_RIGHT1, EMU_SRC_ALICE_EMU32A + 1);
-		emu->emu1010.output_source[1] = 22;
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			EMU_DST_DOCK_DAC2_LEFT1, EMU_SRC_ALICE_EMU32A + 2);
-		emu->emu1010.output_source[2] = 23;
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			EMU_DST_DOCK_DAC2_RIGHT1, EMU_SRC_ALICE_EMU32A + 3);
-		emu->emu1010.output_source[3] = 24;
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			EMU_DST_DOCK_DAC3_LEFT1, EMU_SRC_ALICE_EMU32A + 4);
-		emu->emu1010.output_source[4] = 25;
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			EMU_DST_DOCK_DAC3_RIGHT1, EMU_SRC_ALICE_EMU32A + 5);
-		emu->emu1010.output_source[5] = 26;
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			EMU_DST_DOCK_DAC4_LEFT1, EMU_SRC_ALICE_EMU32A + 6);
-		emu->emu1010.output_source[6] = 27;
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			EMU_DST_DOCK_DAC4_RIGHT1, EMU_SRC_ALICE_EMU32A + 7);
-		emu->emu1010.output_source[7] = 28;
-		/* ALICE2 bus 0xa0 */
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			EMU_DST_DOCK_PHONES_LEFT1, EMU_SRC_ALICE_EMU32A + 0);
-		emu->emu1010.output_source[8] = 21;
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			EMU_DST_DOCK_PHONES_RIGHT1, EMU_SRC_ALICE_EMU32A + 1);
-		emu->emu1010.output_source[9] = 22;
-		/* ALICE2 bus 0xa0 */
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			EMU_DST_DOCK_SPDIF_LEFT1, EMU_SRC_ALICE_EMU32A + 0);
-		emu->emu1010.output_source[10] = 21;
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			EMU_DST_DOCK_SPDIF_RIGHT1, EMU_SRC_ALICE_EMU32A + 1);
-		emu->emu1010.output_source[11] = 22;
-		/* ALICE2 bus 0xa0 */
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			EMU_DST_HANA_SPDIF_LEFT1, EMU_SRC_ALICE_EMU32A + 0);
-		emu->emu1010.output_source[12] = 21;
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			EMU_DST_HANA_SPDIF_RIGHT1, EMU_SRC_ALICE_EMU32A + 1);
-		emu->emu1010.output_source[13] = 22;
-		/* ALICE2 bus 0xa0 */
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			EMU_DST_HAMOA_DAC_LEFT1, EMU_SRC_ALICE_EMU32A + 0);
-		emu->emu1010.output_source[14] = 21;
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			EMU_DST_HAMOA_DAC_RIGHT1, EMU_SRC_ALICE_EMU32A + 1);
-		emu->emu1010.output_source[15] = 22;
-		/* ALICE2 bus 0xa0 */
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			EMU_DST_HANA_ADAT, EMU_SRC_ALICE_EMU32A + 0);
-		emu->emu1010.output_source[16] = 21;
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			EMU_DST_HANA_ADAT + 1, EMU_SRC_ALICE_EMU32A + 1);
-		emu->emu1010.output_source[17] = 22;
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			EMU_DST_HANA_ADAT + 2, EMU_SRC_ALICE_EMU32A + 2);
-		emu->emu1010.output_source[18] = 23;
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			EMU_DST_HANA_ADAT + 3, EMU_SRC_ALICE_EMU32A + 3);
-		emu->emu1010.output_source[19] = 24;
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			EMU_DST_HANA_ADAT + 4, EMU_SRC_ALICE_EMU32A + 4);
-		emu->emu1010.output_source[20] = 25;
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			EMU_DST_HANA_ADAT + 5, EMU_SRC_ALICE_EMU32A + 5);
-		emu->emu1010.output_source[21] = 26;
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			EMU_DST_HANA_ADAT + 6, EMU_SRC_ALICE_EMU32A + 6);
-		emu->emu1010.output_source[22] = 27;
-		snd_emu1010_fpga_link_dst_src_write(emu,
-			EMU_DST_HANA_ADAT + 7, EMU_SRC_ALICE_EMU32A + 7);
-		emu->emu1010.output_source[23] = 28;
-	}
-
 	return 0;
 }
 /*
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 16d37aca382c..26e060361949 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -231,6 +231,20 @@ static const unsigned short emu1010_output_dst[] = {
 };
 static_assert(ARRAY_SIZE(emu1010_output_dst) == ARRAY_SIZE(emu1010_output_texts));
 
+static const unsigned short emu1010_output_dflt[] = {
+	EMU_SRC_ALICE_EMU32A+0, EMU_SRC_ALICE_EMU32A+1,
+	EMU_SRC_ALICE_EMU32A+2, EMU_SRC_ALICE_EMU32A+3,
+	EMU_SRC_ALICE_EMU32A+4, EMU_SRC_ALICE_EMU32A+5,
+	EMU_SRC_ALICE_EMU32A+6, EMU_SRC_ALICE_EMU32A+7,
+	EMU_SRC_ALICE_EMU32A+0, EMU_SRC_ALICE_EMU32A+1,
+	EMU_SRC_ALICE_EMU32A+0, EMU_SRC_ALICE_EMU32A+1,
+	EMU_SRC_ALICE_EMU32A+0, EMU_SRC_ALICE_EMU32A+1,
+	EMU_SRC_ALICE_EMU32A+0, EMU_SRC_ALICE_EMU32A+1,
+	EMU_SRC_ALICE_EMU32A+0, EMU_SRC_ALICE_EMU32A+1, EMU_SRC_ALICE_EMU32A+2, EMU_SRC_ALICE_EMU32A+3,
+	EMU_SRC_ALICE_EMU32A+4, EMU_SRC_ALICE_EMU32A+5, EMU_SRC_ALICE_EMU32A+6, EMU_SRC_ALICE_EMU32A+7,
+};
+static_assert(ARRAY_SIZE(emu1010_output_dflt) == ARRAY_SIZE(emu1010_output_dst));
+
 /* 1616(m) cardbus */
 
 static const char * const snd_emu1616_output_texts[] = {
@@ -252,6 +266,17 @@ static const unsigned short emu1616_output_dst[] = {
 };
 static_assert(ARRAY_SIZE(emu1616_output_dst) == ARRAY_SIZE(snd_emu1616_output_texts));
 
+static const unsigned short emu1616_output_dflt[] = {
+	EMU_SRC_ALICE_EMU32A+0, EMU_SRC_ALICE_EMU32A+1,
+	EMU_SRC_ALICE_EMU32A+2, EMU_SRC_ALICE_EMU32A+3,
+	EMU_SRC_ALICE_EMU32A+4, EMU_SRC_ALICE_EMU32A+5,
+	EMU_SRC_ALICE_EMU32A+0, EMU_SRC_ALICE_EMU32A+1,
+	EMU_SRC_ALICE_EMU32A+0, EMU_SRC_ALICE_EMU32A+1, EMU_SRC_ALICE_EMU32A+2, EMU_SRC_ALICE_EMU32A+3,
+	EMU_SRC_ALICE_EMU32A+4, EMU_SRC_ALICE_EMU32A+5, EMU_SRC_ALICE_EMU32A+6, EMU_SRC_ALICE_EMU32A+7,
+	EMU_SRC_ALICE_EMU32A+0, EMU_SRC_ALICE_EMU32A+1,
+};
+static_assert(ARRAY_SIZE(emu1616_output_dflt) == ARRAY_SIZE(emu1616_output_dst));
+
 /*
  * Data destinations - FPGA outputs going to Alice2 (Audigy) for
  *   capture (EMU32 + I2S links)
@@ -311,37 +336,73 @@ static const unsigned short emu1010_input_dst[] = {
 };
 static_assert(ARRAY_SIZE(emu1010_input_dst) == ARRAY_SIZE(emu1010_input_texts));
 
+static const unsigned short emu1010_input_dflt[] = {
+	EMU_SRC_DOCK_MIC_A1,
+	EMU_SRC_DOCK_MIC_B1,
+	EMU_SRC_HAMOA_ADC_LEFT1,
+	EMU_SRC_HAMOA_ADC_RIGHT1,
+	EMU_SRC_DOCK_ADC1_LEFT1,
+	EMU_SRC_DOCK_ADC1_RIGHT1,
+	EMU_SRC_DOCK_ADC2_LEFT1,
+	EMU_SRC_DOCK_ADC2_RIGHT1,
+	/* Pavel Hofman - setting defaults for all capture channels.
+	 * Defaults only, users will set their own values anyways, let's
+	 * just copy/paste. */
+	EMU_SRC_DOCK_MIC_A1,
+	EMU_SRC_DOCK_MIC_B1,
+	EMU_SRC_HAMOA_ADC_LEFT1,
+	EMU_SRC_HAMOA_ADC_RIGHT1,
+	EMU_SRC_DOCK_ADC1_LEFT1,
+	EMU_SRC_DOCK_ADC1_RIGHT1,
+	EMU_SRC_DOCK_ADC2_LEFT1,
+	EMU_SRC_DOCK_ADC2_RIGHT1,
+
+	EMU_SRC_DOCK_ADC1_LEFT1,
+	EMU_SRC_DOCK_ADC1_RIGHT1,
+	EMU_SRC_DOCK_ADC2_LEFT1,
+	EMU_SRC_DOCK_ADC2_RIGHT1,
+	EMU_SRC_DOCK_ADC3_LEFT1,
+	EMU_SRC_DOCK_ADC3_RIGHT1,
+};
+static_assert(ARRAY_SIZE(emu1010_input_dflt) == ARRAY_SIZE(emu1010_input_dst));
+
 struct snd_emu1010_routing_info {
 	const char * const *src_texts;
 	const unsigned short *src_regs;
 	const unsigned short *out_regs;
 	const unsigned short *in_regs;
+	const unsigned short *out_dflts;
+	const unsigned short *in_dflts;
 	unsigned n_srcs;
 	unsigned n_outs;
 	unsigned n_ins;
 };
 
 const struct snd_emu1010_routing_info emu1010_routing_info[] = {
 	{
 		.src_regs = emu1010_src_regs,
 		.src_texts = emu1010_src_texts,
 		.n_srcs = ARRAY_SIZE(emu1010_src_texts),
 
+		.out_dflts = emu1010_output_dflt,
 		.out_regs = emu1010_output_dst,
 		.n_outs = ARRAY_SIZE(emu1010_output_dst),
 
+		.in_dflts = emu1010_input_dflt,
 		.in_regs = emu1010_input_dst,
 		.n_ins = ARRAY_SIZE(emu1010_input_dst),
 	},
 	{
 		/* 1616(m) cardbus */
 		.src_regs = emu1616_src_regs,
 		.src_texts = emu1616_src_texts,
 		.n_srcs = ARRAY_SIZE(emu1616_src_texts),
 
+		.out_dflts = emu1616_output_dflt,
 		.out_regs = emu1616_output_dst,
 		.n_outs = ARRAY_SIZE(emu1616_output_dst),
 
+		.in_dflts = emu1010_input_dflt,
 		.in_regs = emu1010_input_dst,
 		.n_ins = ARRAY_SIZE(emu1010_input_dst) - 6,
 	},
@@ -375,6 +436,28 @@ static void snd_emu1010_input_source_apply(struct snd_emu10k1 *emu,
 		emu_ri->in_regs[channel], emu_ri->src_regs[src]);
 }
 
+static void snd_emu1010_apply_sources(struct snd_emu10k1 *emu)
+{
+	const struct snd_emu1010_routing_info *emu_ri =
+		&emu1010_routing_info[emu1010_idx(emu)];
+
+	for (unsigned i = 0; i < emu_ri->n_outs; i++)
+		snd_emu1010_output_source_apply(
+			emu, i, emu->emu1010.output_source[i]);
+	for (unsigned i = 0; i < emu_ri->n_ins; i++)
+		snd_emu1010_input_source_apply(
+			emu, i, emu->emu1010.input_source[i]);
+}
+
+static u8 emu1010_map_source(const struct snd_emu1010_routing_info *emu_ri,
+			     unsigned val)
+{
+	for (unsigned i = 0; i < emu_ri->n_srcs; i++)
+		if (val == emu_ri->src_regs[i])
+			return i;
+	return 0;
+}
+
 static int snd_emu1010_input_output_source_info(struct snd_kcontrol *kcontrol,
 						struct snd_ctl_elem_info *uinfo)
 {
@@ -2024,6 +2107,20 @@ int snd_emu10k1_mixer(struct snd_emu10k1 *emu,
 			return err;
 	}
 
+	if (emu->card_capabilities->emu_model) {
+		unsigned i, emu_idx = emu1010_idx(emu);
+		const struct snd_emu1010_routing_info *emu_ri =
+			&emu1010_routing_info[emu_idx];
+
+		for (i = 0; i < emu_ri->n_ins; i++)
+			emu->emu1010.input_source[i] =
+				emu1010_map_source(emu_ri, emu_ri->in_dflts[i]);
+		for (i = 0; i < emu_ri->n_outs; i++)
+			emu->emu1010.output_source[i] =
+				emu1010_map_source(emu_ri, emu_ri->out_dflts[i]);
+		snd_emu1010_apply_sources(emu);
+	}
+
 	if (emu->card_capabilities->emu_model == EMU_MODEL_EMU1616) {
 		/* 1616(m) cardbus */
 		err = add_ctls(emu, &emu1010_output_source_ctl,
-- 
2.40.0.152.g15d061e6df

