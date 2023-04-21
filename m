Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 545C46EAC94
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 16:15:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B57A8ED7;
	Fri, 21 Apr 2023 16:14:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B57A8ED7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682086519;
	bh=kQxQZWDLMvlFNVqP1Lm4JHZWBP/lx9EXiSo9qTKRSHE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gkO6ycQTb+IXeacZlP2cB032vCEajxsxupHeXzfq102BmiTURaEXHfQcmWaq0KFKn
	 UE6Ecbg7rX+j7b+CXmFQ9ny+Ef+e9N/qoBmFKYreQj5epmeQFqIUX4hF6qqwpwpJqx
	 LFc9BQ5+68BpZvTB6f/yZsicmU8h2B/X1Ysswm68=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C1A4F805BD;
	Fri, 21 Apr 2023 16:10:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2DCBF8057A; Fri, 21 Apr 2023 16:10:39 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 21D74F80529
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 16:10:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21D74F80529
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 250E42425F;
	Fri, 21 Apr 2023 10:10:07 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pprSg-DbC-00; Fri, 21 Apr 2023 16:10:06 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 7/7] ALSA: emu10k1: remove remaining cruft from
 snd_emu10k1_emu1010_init()
Date: Fri, 21 Apr 2023 16:10:06 +0200
Message-Id: <20230421141006.1005539-7-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230421141006.1005539-1-oswald.buddenhagen@gmx.de>
References: <20230421141006.1005539-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PP3HKECPJVI3CIIASHK7SCAC5GJ36N2S
X-Message-ID-Hash: PP3HKECPJVI3CIIASHK7SCAC5GJ36N2S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PP3HKECPJVI3CIIASHK7SCAC5GJ36N2S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Various redundant FPGA writes which were presumably also cargo-culted
from the Windows driver.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emu10k1_main.c | 27 +--------------------------
 1 file changed, 1 insertion(+), 26 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index 9d6a00bf6f2f..2f3e679e85a7 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -889,31 +889,29 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k1 *emu)
 	 */
 	emu->emu1010.optical_in = 1; /* IN_ADAT */
 	emu->emu1010.optical_out = 1; /* IN_ADAT */
-	tmp = 0;
 	tmp = (emu->emu1010.optical_in ? EMU_HANA_OPTICAL_IN_ADAT : 0) |
 		(emu->emu1010.optical_out ? EMU_HANA_OPTICAL_OUT_ADAT : 0);
 	snd_emu1010_fpga_write(emu, EMU_HANA_OPTICAL_TYPE, tmp);
 	/* Set no attenuation on Audio Dock pads. */
 	snd_emu1010_fpga_write(emu, EMU_HANA_ADC_PADS, 0x00);
 	emu->emu1010.adc_pads = 0x00;
 	/* Unmute Audio dock DACs, Headphone source DAC-4. */
 	snd_emu1010_fpga_write(emu, EMU_HANA_DOCK_MISC, 0x30);
-	snd_emu1010_fpga_write(emu, EMU_HANA_DOCK_LEDS_2, 0x12);
 	/* DAC PADs. */
 	snd_emu1010_fpga_write(emu, EMU_HANA_DAC_PADS, 0x0f);
 	emu->emu1010.dac_pads = 0x0f;
-	snd_emu1010_fpga_write(emu, EMU_HANA_DOCK_MISC, 0x30);
 	/* SPDIF Format. Set Consumer mode, 24bit, copy enable */
 	snd_emu1010_fpga_write(emu, EMU_HANA_SPDIF_MODE, 0x10);
 	/* MIDI routing */
 	snd_emu1010_fpga_write(emu, EMU_HANA_MIDI_IN, 0x19);
 	/* Unknown. */
 	snd_emu1010_fpga_write(emu, EMU_HANA_MIDI_OUT, 0x0c);
 	/* IRQ Enable: All on */
 	/* snd_emu1010_fpga_write(emu, 0x09, 0x0f ); */
 	/* IRQ Enable: All off */
 	snd_emu1010_fpga_write(emu, EMU_HANA_IRQ_ENABLE, 0x00);
 
+	emu->emu1010.internal_clock = 1; /* 48000 */
 	/* Default WCLK set to 48kHz. */
 	snd_emu1010_fpga_write(emu, EMU_HANA_DEFCLOCK, 0x00);
 	/* Word Clock source, Internal 48kHz x1 */
@@ -1049,14 +1047,6 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k1 *emu)
 		EMU_DST_ALICE_I2S2_RIGHT, EMU_SRC_DOCK_ADC3_RIGHT1);
 	snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, 0x01); /* Unmute all */
 
-	/* Initial boot complete. Now patches */
-
-	snd_emu1010_fpga_write(emu, EMU_HANA_MIDI_IN, 0x19); /* MIDI Route */
-	snd_emu1010_fpga_write(emu, EMU_HANA_MIDI_OUT, 0x0c); /* Unknown */
-	snd_emu1010_fpga_write(emu, EMU_HANA_MIDI_IN, 0x19); /* MIDI Route */
-	snd_emu1010_fpga_write(emu, EMU_HANA_MIDI_OUT, 0x0c); /* Unknown */
-	snd_emu1010_fpga_write(emu, EMU_HANA_SPDIF_MODE, 0x10); /* SPDIF Format spdif  (or 0x11 for aes/ebu) */
-
 #if 0
 	snd_emu1010_fpga_link_dst_src_write(emu,
 		EMU_DST_HAMOA_DAC_LEFT1, EMU_SRC_ALICE_EMU32B + 2); /* ALICE2 bus 0xa2 */
@@ -1176,21 +1166,6 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k1 *emu)
 			EMU_DST_HANA_ADAT + 7, EMU_SRC_ALICE_EMU32A + 7);
 		emu->emu1010.output_source[23] = 28;
 	}
-	/* TEMP: Select SPDIF in/out */
-	/* snd_emu1010_fpga_write(emu, EMU_HANA_OPTICAL_TYPE, 0x0); */ /* Output spdif */
-
-	/* TEMP: Select 48kHz SPDIF out */
-	snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, 0x0); /* Mute all */
-	snd_emu1010_fpga_write(emu, EMU_HANA_DEFCLOCK, 0x0); /* Default fallback clock 48kHz */
-	/* Word Clock source, Internal 48kHz x1 */
-	snd_emu1010_fpga_write(emu, EMU_HANA_WCLOCK, EMU_HANA_WCLOCK_INT_48K);
-	/* snd_emu1010_fpga_write(emu, EMU_HANA_WCLOCK, EMU_HANA_WCLOCK_INT_48K | EMU_HANA_WCLOCK_4X); */
-	emu->emu1010.internal_clock = 1; /* 48000 */
-	snd_emu1010_fpga_write(emu, EMU_HANA_DOCK_LEDS_2, 0x12); /* Set LEDs on Audio Dock */
-	snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, 0x1); /* Unmute all */
-	/* snd_emu1010_fpga_write(emu, 0x7, 0x0); */ /* Mute all */
-	/* snd_emu1010_fpga_write(emu, 0x7, 0x1); */ /* Unmute all */
-	/* snd_emu1010_fpga_write(emu, 0xe, 0x12); */ /* Set LEDs on Audio Dock */
 
 	return 0;
 }
-- 
2.40.0.152.g15d061e6df

