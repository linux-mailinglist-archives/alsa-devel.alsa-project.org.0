Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A601F70497D
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 11:40:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D3B47F8;
	Tue, 16 May 2023 11:39:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D3B47F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684230001;
	bh=nm4ThY3FI0okFiCQU4W1uVvx8HAr8cnooNKZRu0diHw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jczj0KxErXfQgf8yyLIKO1S/JbsKry6q/4T0JOk4Wsbjpmufv5kypOo6ZEzOdAoEW
	 qu+juYXzuscye3TGJKk4t8wonQPaJtmZ75PiC2YzPA53y0KGLd3UyXglkntO78xFtc
	 TA7iPlJ3e95qLRobh70w99WJGlxTxNjNceiRXtPg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F262F805E6; Tue, 16 May 2023 11:36:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DA92F80553;
	Tue, 16 May 2023 11:36:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C50D3F805D2; Tue, 16 May 2023 11:36:48 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 820FFF80557
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 11:36:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 820FFF80557
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 2CCEE24299;
	Tue, 16 May 2023 05:36:13 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pyr6K-q1F-00; Tue, 16 May 2023 11:36:12 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 05/10] ALSA: emu10k1: fix return value of
 snd_emu1010_dac_pads_put()
Date: Tue, 16 May 2023 11:36:07 +0200
Message-Id: <20230516093612.3536508-6-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230516093612.3536508-1-oswald.buddenhagen@gmx.de>
References: <20230516093612.3536508-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QEFIN6P7Q5XK2IC4P74HVLQ2X4UQL37L
X-Message-ID-Hash: QEFIN6P7Q5XK2IC4P74HVLQ2X4UQL37L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QEFIN6P7Q5XK2IC4P74HVLQ2X4UQL37L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It returned zero even if the value had changed.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emumixer.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 1a606695eda7..16d37aca382c 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -559,18 +559,21 @@ static int snd_emu1010_dac_pads_put(struct snd_kcontrol *kcontrol, struct snd_ct
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	unsigned int mask = snd_emu1010_dac_regs[kcontrol->private_value];
 	unsigned int val, cache;
+	int change;
+
 	val = ucontrol->value.integer.value[0];
 	cache = emu->emu1010.dac_pads;
 	if (val == 1) 
 		cache = cache | mask;
 	else
 		cache = cache & ~mask;
-	if (cache != emu->emu1010.dac_pads) {
+	change = (cache != emu->emu1010.dac_pads);
+	if (change) {
 		snd_emu1010_fpga_write(emu, EMU_HANA_DAC_PADS, cache );
 	        emu->emu1010.dac_pads = cache;
 	}
 
-	return 0;
+	return change;
 }
 
 static const struct snd_kcontrol_new emu1010_dac_pads_ctl = {
-- 
2.40.0.152.g15d061e6df

