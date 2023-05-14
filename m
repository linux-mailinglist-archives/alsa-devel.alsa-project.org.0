Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4D4701E70
	for <lists+alsa-devel@lfdr.de>; Sun, 14 May 2023 19:06:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 318F8E11;
	Sun, 14 May 2023 19:05:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 318F8E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684084000;
	bh=RiL1j/x36vHjGGoOfFn5o5ZufdJEzsqDt24Ff0ghNmg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pmnA09sMzsyG8yUY8lxvBFYrW02i8QtpMsygsF2OEUWYjb0IZuW+LfWKY0ECYAy9m
	 a/rGAf7HMzoHpJNH2Z5XSUNdhmnSwDhvLVTeUkO/HLFzupOWr6krNRMwAGBQl+fDF8
	 shxA6DQ3WkCZTTaE+YroUp/gco0BfzhR/j7UWmjQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 903B3F805D8; Sun, 14 May 2023 19:04:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 208C5F805D6;
	Sun, 14 May 2023 19:04:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EBB5F805C5; Sun, 14 May 2023 19:04:03 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6BACAF80552
	for <alsa-devel@alsa-project.org>; Sun, 14 May 2023 19:03:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BACAF80552
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id A80C424285;
	Sun, 14 May 2023 13:03:23 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pyF7z-Ine-00; Sun, 14 May 2023 19:03:23 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v2 2/7] ALSA: emu10k1: fix non-zero mixer control defaults in
 highres mode
Date: Sun, 14 May 2023 19:03:18 +0200
Message-Id: <20230514170323.3408834-3-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230514170323.3408834-1-oswald.buddenhagen@gmx.de>
References: <20230514170323.3408834-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BVFR5G6LKJKPRDRXY4HMFNGELVIXKZ3B
X-Message-ID-Hash: BVFR5G6LKJKPRDRXY4HMFNGELVIXKZ3B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BVFR5G6LKJKPRDRXY4HMFNGELVIXKZ3B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The default value needs to be scaled.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emufx.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 43abb6c04a7f..fbc1bfc122fc 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -1116,40 +1116,42 @@ snd_emu10k1_init_mono_control(struct snd_emu10k1_fx8010_control_gpr *ctl,
 	ctl->id.iface = (__force int)SNDRV_CTL_ELEM_IFACE_MIXER;
 	strcpy(ctl->id.name, name);
 	ctl->vcount = ctl->count = 1;
-	ctl->gpr[0] = gpr + 0; ctl->value[0] = defval;
 	if (high_res_gpr_volume) {
 		ctl->min = 0;
 		ctl->max = 0x7fffffff;
 		ctl->tlv = snd_emu10k1_db_linear;
 		ctl->translation = EMU10K1_GPR_TRANSLATION_NONE;
+		defval = defval * 0x7fffffffLL / 100;
 	} else {
 		ctl->min = 0;
 		ctl->max = 100;
 		ctl->tlv = snd_emu10k1_db_scale1;
 		ctl->translation = EMU10K1_GPR_TRANSLATION_TABLE100;
 	}
+	ctl->gpr[0] = gpr + 0; ctl->value[0] = defval;
 }
 
 static void
 snd_emu10k1_init_stereo_control(struct snd_emu10k1_fx8010_control_gpr *ctl,
 				const char *name, int gpr, int defval)
 {
 	ctl->id.iface = (__force int)SNDRV_CTL_ELEM_IFACE_MIXER;
 	strcpy(ctl->id.name, name);
 	ctl->vcount = ctl->count = 2;
-	ctl->gpr[0] = gpr + 0; ctl->value[0] = defval;
-	ctl->gpr[1] = gpr + 1; ctl->value[1] = defval;
 	if (high_res_gpr_volume) {
 		ctl->min = 0;
 		ctl->max = 0x7fffffff;
 		ctl->tlv = snd_emu10k1_db_linear;
 		ctl->translation = EMU10K1_GPR_TRANSLATION_NONE;
+		defval = defval * 0x7fffffffLL / 100;
 	} else {
 		ctl->min = 0;
 		ctl->max = 100;
 		ctl->tlv = snd_emu10k1_db_scale1;
 		ctl->translation = EMU10K1_GPR_TRANSLATION_TABLE100;
 	}
+	ctl->gpr[0] = gpr + 0; ctl->value[0] = defval;
+	ctl->gpr[1] = gpr + 1; ctl->value[1] = defval;
 }
 
 static void
-- 
2.40.0.152.g15d061e6df

