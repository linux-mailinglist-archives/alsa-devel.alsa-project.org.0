Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AB56EAC91
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 16:14:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5E6BEB9;
	Fri, 21 Apr 2023 16:14:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5E6BEB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682086493;
	bh=qgCcG7k0SOR9XHiq6NvzGC2Co5hlk2T6pkVGoe8noEA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UyR+yPAT1a9Dc/Aiw/17gjkUHTTUA8gZEUKq/XUuFWRJGxA5NZ7BhsT0/RvPspzIU
	 3LzrQzkMa7EMJsBEH7WFY0T6J+qHOlZHzAlMiLvIXIYMB3fF2waaEvnbkqNEZwLUKs
	 UZ53GSRFd9pTKSMAYSBnDjzJ967/j0PjvxM2hwZg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 275F6F805AD;
	Fri, 21 Apr 2023 16:10:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 467B1F80567; Fri, 21 Apr 2023 16:10:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7901F80053
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 16:10:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7901F80053
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 20F192425E;
	Fri, 21 Apr 2023 10:10:07 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pprSg-Db6-00; Fri, 21 Apr 2023 16:10:06 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/7] ALSA: emu10k1: remove apparently pointless
 EMU_HANA_OPTION_CARDS reads
Date: Fri, 21 Apr 2023 16:10:05 +0200
Message-Id: <20230421141006.1005539-6-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230421141006.1005539-1-oswald.buddenhagen@gmx.de>
References: <20230421141006.1005539-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LEJSWR5NUVUZ2SPN4H4TRONP4E2KWFG7
X-Message-ID-Hash: LEJSWR5NUVUZ2SPN4H4TRONP4E2KWFG7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LEJSWR5NUVUZ2SPN4H4TRONP4E2KWFG7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These seem to be another instance of cargo-culting from the Windows
driver. It presumably queries the register to decide about the followup
actions, but we don't do that.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emu10k1_main.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index ac0c8865c76b..9d6a00bf6f2f 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -881,8 +881,6 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k1 *emu)
 	/* Enable 48Volt power to Audio Dock */
 	snd_emu1010_fpga_write(emu, EMU_HANA_DOCK_PWR, EMU_HANA_DOCK_PWR_ON);
 
-	snd_emu1010_fpga_read(emu, EMU_HANA_OPTION_CARDS, &reg);
-	dev_info(emu->card->dev, "emu1010: Card options = 0x%x\n", reg);
 	snd_emu1010_fpga_read(emu, EMU_HANA_OPTION_CARDS, &reg);
 	dev_info(emu->card->dev, "emu1010: Card options = 0x%x\n", reg);
 	/* Optical -> ADAT I/O  */
@@ -916,8 +914,6 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k1 *emu)
 	/* IRQ Enable: All off */
 	snd_emu1010_fpga_write(emu, EMU_HANA_IRQ_ENABLE, 0x00);
 
-	snd_emu1010_fpga_read(emu, EMU_HANA_OPTION_CARDS, &reg);
-	dev_info(emu->card->dev, "emu1010: Card options3 = 0x%x\n", reg);
 	/* Default WCLK set to 48kHz. */
 	snd_emu1010_fpga_write(emu, EMU_HANA_DEFCLOCK, 0x00);
 	/* Word Clock source, Internal 48kHz x1 */
@@ -1053,11 +1049,8 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k1 *emu)
 		EMU_DST_ALICE_I2S2_RIGHT, EMU_SRC_DOCK_ADC3_RIGHT1);
 	snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, 0x01); /* Unmute all */
 
-	snd_emu1010_fpga_read(emu, EMU_HANA_OPTION_CARDS, &tmp);
-
 	/* Initial boot complete. Now patches */
 
-	snd_emu1010_fpga_read(emu, EMU_HANA_OPTION_CARDS, &tmp);
 	snd_emu1010_fpga_write(emu, EMU_HANA_MIDI_IN, 0x19); /* MIDI Route */
 	snd_emu1010_fpga_write(emu, EMU_HANA_MIDI_OUT, 0x0c); /* Unknown */
 	snd_emu1010_fpga_write(emu, EMU_HANA_MIDI_IN, 0x19); /* MIDI Route */
-- 
2.40.0.152.g15d061e6df

