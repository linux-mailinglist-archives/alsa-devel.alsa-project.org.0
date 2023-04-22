Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D98EF6EB95C
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Apr 2023 15:26:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C67DED4;
	Sat, 22 Apr 2023 15:25:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C67DED4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682169985;
	bh=xRwb7FQUMDi6LRWmsObsC12TuI4IoZaBAO9y04cg5js=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Yo333mlb9SaxNPI4pkgv7YKo4JCB06Eynjqibbv5LerJpMw2n9PDTYv2iywNxsO4P
	 2P6AhtnlwtsaGI3XslwrmHyWEyw/YuQGvPHp6BWAxNQeCjcLFeQ+V/R3T5mAoLOuxL
	 4PMO6wzuF27JwiEItCucHBfw+eyxRP6F5g8Wtvt8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7390DF804FC;
	Sat, 22 Apr 2023 15:24:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0361EF8019B; Sat, 22 Apr 2023 15:24:42 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id DF582F80149
	for <alsa-devel@alsa-project.org>; Sat, 22 Apr 2023 15:24:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF582F80149
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 98ADD241A9;
	Sat, 22 Apr 2023 09:24:30 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pqDE6-R66-00; Sat, 22 Apr 2023 15:24:30 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/2] ALSA: emu10k1: remove unused `resume` parameter from
 snd_emu10k1_init()
Date: Sat, 22 Apr 2023 15:24:29 +0200
Message-Id: <20230422132430.1057468-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DVLGOIGKQP5PSPX7QZFKCDU2R6IHLFUH
X-Message-ID-Hash: DVLGOIGKQP5PSPX7QZFKCDU2R6IHLFUH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DVLGOIGKQP5PSPX7QZFKCDU2R6IHLFUH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This was unnecessarily added in commit 09668b441da ("emu10k1 - Add PM
support").

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
v2:
- paste subject of referenced commit
---
 sound/pci/emu10k1/emu10k1_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index 3880f359e688..cbfaa4bc70a2 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -140,7 +140,7 @@ static const unsigned int i2c_adc_init[][2] = {
 	{ 0x15, ADC_MUX_2 },  /* ADC Mixer control. Mic for A2ZS Notebook */
 };
 
-static int snd_emu10k1_init(struct snd_emu10k1 *emu, int enable_ir, int resume)
+static int snd_emu10k1_init(struct snd_emu10k1 *emu, int enable_ir)
 {
 	unsigned int silent_page;
 	int ch;
@@ -1975,7 +1975,7 @@ int snd_emu10k1_create(struct snd_card *card,
 		emu->voices[idx].number = idx;
 	}
 
-	err = snd_emu10k1_init(emu, enable_ir, 0);
+	err = snd_emu10k1_init(emu, enable_ir);
 	if (err < 0)
 		return err;
 #ifdef CONFIG_PM_SLEEP
@@ -2068,7 +2068,7 @@ void snd_emu10k1_resume_init(struct snd_emu10k1 *emu)
 		snd_emu10k1_emu1010_init(emu);
 	else
 		snd_emu10k1_ptr_write(emu, AC97SLOT, 0, AC97SLOT_CNTR|AC97SLOT_LFE);
-	snd_emu10k1_init(emu, emu->enable_ir, 1);
+	snd_emu10k1_init(emu, emu->enable_ir);
 }
 
 void snd_emu10k1_resume_regs(struct snd_emu10k1 *emu)
-- 
2.40.0.152.g15d061e6df

