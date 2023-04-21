Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4EE6EAC95
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 16:15:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2892E9E;
	Fri, 21 Apr 2023 16:14:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2892E9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682086535;
	bh=x37UryjQicn40viHG0w3UFHBBwrnroKnUkFvCpQvnvw=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SbXVFccN5QDghUk41QEBCAJFXSa6Z70Snv8cWneyG7hD/P61gsee/5mwrvvdvMNxD
	 DJxxo8Iam4bgg0rTJlMYMe5ASqwOX80BofNam84LteW+5x9r6nuhYq44vnO3pSh9we
	 8D/6kIGQgyyQ1PIErrvOJnrK4hQ60IvsHaB+TLso=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD721F805C1;
	Fri, 21 Apr 2023 16:10:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B336F8057D; Fri, 21 Apr 2023 16:10:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA25CF8053B
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 16:10:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA25CF8053B
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 1FBF42425C;
	Fri, 21 Apr 2023 10:10:07 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pprSg-Db0-00; Fri, 21 Apr 2023 16:10:06 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/7] ALSA: emu10k1: remove apparently pointless FPGA reads
Date: Fri, 21 Apr 2023 16:10:04 +0200
Message-Id: <20230421141006.1005539-5-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230421141006.1005539-1-oswald.buddenhagen@gmx.de>
References: <20230421141006.1005539-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KTACUU6S6OYSW4JEKVAW4OXHNADJDM3E
X-Message-ID-Hash: KTACUU6S6OYSW4JEKVAW4OXHNADJDM3E
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KTACUU6S6OYSW4JEKVAW4OXHNADJDM3E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These seem to be simply cargo-culted from the Windows driver's behavior.
However, the original reason were presumably read-modify-write cycles,
which we don't do.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emu10k1_main.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index f7908e5a6e0d..ac0c8865c76b 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -885,32 +885,26 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k1 *emu)
 	dev_info(emu->card->dev, "emu1010: Card options = 0x%x\n", reg);
 	snd_emu1010_fpga_read(emu, EMU_HANA_OPTION_CARDS, &reg);
 	dev_info(emu->card->dev, "emu1010: Card options = 0x%x\n", reg);
-	snd_emu1010_fpga_read(emu, EMU_HANA_OPTICAL_TYPE, &tmp);
 	/* Optical -> ADAT I/O  */
 	/* 0 : SPDIF
 	 * 1 : ADAT
 	 */
 	emu->emu1010.optical_in = 1; /* IN_ADAT */
 	emu->emu1010.optical_out = 1; /* IN_ADAT */
 	tmp = 0;
 	tmp = (emu->emu1010.optical_in ? EMU_HANA_OPTICAL_IN_ADAT : 0) |
 		(emu->emu1010.optical_out ? EMU_HANA_OPTICAL_OUT_ADAT : 0);
 	snd_emu1010_fpga_write(emu, EMU_HANA_OPTICAL_TYPE, tmp);
-	snd_emu1010_fpga_read(emu, EMU_HANA_ADC_PADS, &tmp);
 	/* Set no attenuation on Audio Dock pads. */
 	snd_emu1010_fpga_write(emu, EMU_HANA_ADC_PADS, 0x00);
 	emu->emu1010.adc_pads = 0x00;
-	snd_emu1010_fpga_read(emu, EMU_HANA_DOCK_MISC, &tmp);
 	/* Unmute Audio dock DACs, Headphone source DAC-4. */
 	snd_emu1010_fpga_write(emu, EMU_HANA_DOCK_MISC, 0x30);
 	snd_emu1010_fpga_write(emu, EMU_HANA_DOCK_LEDS_2, 0x12);
-	snd_emu1010_fpga_read(emu, EMU_HANA_DAC_PADS, &tmp);
 	/* DAC PADs. */
 	snd_emu1010_fpga_write(emu, EMU_HANA_DAC_PADS, 0x0f);
 	emu->emu1010.dac_pads = 0x0f;
-	snd_emu1010_fpga_read(emu, EMU_HANA_DOCK_MISC, &tmp);
 	snd_emu1010_fpga_write(emu, EMU_HANA_DOCK_MISC, 0x30);
-	snd_emu1010_fpga_read(emu, EMU_HANA_SPDIF_MODE, &tmp);
 	/* SPDIF Format. Set Consumer mode, 24bit, copy enable */
 	snd_emu1010_fpga_write(emu, EMU_HANA_SPDIF_MODE, 0x10);
 	/* MIDI routing */
@@ -1068,7 +1062,6 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k1 *emu)
 	snd_emu1010_fpga_write(emu, EMU_HANA_MIDI_OUT, 0x0c); /* Unknown */
 	snd_emu1010_fpga_write(emu, EMU_HANA_MIDI_IN, 0x19); /* MIDI Route */
 	snd_emu1010_fpga_write(emu, EMU_HANA_MIDI_OUT, 0x0c); /* Unknown */
-	snd_emu1010_fpga_read(emu, EMU_HANA_SPDIF_MODE, &tmp);
 	snd_emu1010_fpga_write(emu, EMU_HANA_SPDIF_MODE, 0x10); /* SPDIF Format spdif  (or 0x11 for aes/ebu) */
 
 #if 0
-- 
2.40.0.152.g15d061e6df

