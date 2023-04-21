Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 779486EAC7E
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 16:12:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE42BEA4;
	Fri, 21 Apr 2023 16:11:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE42BEA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682086320;
	bh=iS67jJe84utbqy70r3AcfvZ9Ew4RSWafl9lnUt3hH2k=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s6yV13VooSNU3TtwxpiHAXUGo1wIx3Vki2eLz0DWz8IqNHPQzZtRG4HqDltFX+UGw
	 1AHpGr9tIoA6I3vbxRvEKmxcruW+XfT7zpdbBV7SG/WJ8c8ut/PhKjK9sMBP/c3bLe
	 pmBAfjNlwkjnBO41Sg6rzTnhGGDChD2+65Pef3l0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43248F80552;
	Fri, 21 Apr 2023 16:10:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58B7DF80542; Fri, 21 Apr 2023 16:10:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0099BF80149
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 16:10:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0099BF80149
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 891D4240DB;
	Fri, 21 Apr 2023 10:10:06 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pprSg-DZV-00; Fri, 21 Apr 2023 16:10:06 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/7] ALSA: emu10k1: remove unused `resume` parameter from
 snd_emu10k1_init()
Date: Fri, 21 Apr 2023 16:10:03 +0200
Message-Id: <20230421141006.1005452-4-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230421141006.1005452-1-oswald.buddenhagen@gmx.de>
References: <20230421141006.1005452-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XXQ3VJID3ZYCXPFMTMYFMDR7MU32XAHR
X-Message-ID-Hash: XXQ3VJID3ZYCXPFMTMYFMDR7MU32XAHR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XXQ3VJID3ZYCXPFMTMYFMDR7MU32XAHR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This was unnecessarily added in commit 09668b441da.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
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

