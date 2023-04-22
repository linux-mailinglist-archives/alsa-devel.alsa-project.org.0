Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2826EBA41
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Apr 2023 18:14:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D401EE5;
	Sat, 22 Apr 2023 18:14:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D401EE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682180091;
	bh=9GDIbyWbJ4v96q5Dzp40g4cQVZh9OoSU1bjKC7oT4x4=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dBhMVys4x+UWNtEJjgbBImqD4mEknhVaRRNng6rAsPFJmof1m7ns4SRle74FFjL2O
	 1on2qrYr5lujTm5p3RcS4lA66pnFnpJieS/66z5owX/2++hf/1vfV+lfFDB2+ije+x
	 fmxh4hQOvT+BLowpXWeRU5s1RcJ7eZXyniXZb5Ro=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49660F805B0;
	Sat, 22 Apr 2023 18:11:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D688F8057C; Sat, 22 Apr 2023 18:11:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E1B5F8053B
	for <alsa-devel@alsa-project.org>; Sat, 22 Apr 2023 18:10:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E1B5F8053B
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id EE6402422D;
	Sat, 22 Apr 2023 12:10:21 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pqFob-nbw-00; Sat, 22 Apr 2023 18:10:21 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: emu10k1: don't stop DSP in
 _snd_emu10k1_{,audigy_}init_efx()
Date: Sat, 22 Apr 2023 18:10:21 +0200
Message-Id: <20230422161021.1144004-2-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230422161021.1144004-1-oswald.buddenhagen@gmx.de>
References: <20230422161021.1144004-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EK2E475VEA4VTEMGHIRQN6VMFCE6YVSN
X-Message-ID-Hash: EK2E475VEA4VTEMGHIRQN6VMFCE6YVSN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EK2E475VEA4VTEMGHIRQN6VMFCE6YVSN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These functions don't actually touch the DSP until they poke the code
into it, at which point it's temporarily stopped anyway. And fx8010.dbg
is already zero anyway.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emufx.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 70ec2cb9efe8..b43acf0611a2 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -1259,9 +1259,6 @@ static int _snd_emu10k1_audigy_init_efx(struct snd_emu10k1 *emu)
 	gpr_map[gpr++] = 0x0000ffff;
 	bit_shifter16 = gpr;
 
-	/* stop FX processor */
-	snd_emu10k1_ptr_write(emu, A_DBG, 0, (emu->fx8010.dbg = 0) | A_DBG_SINGLE_STEP);
-
 #if 1
 	/* PCM front Playback Volume (independent from stereo mix)
 	 * playback = 0 + ( gpr * FXBUS_PCM_LEFT_FRONT >> 31)
@@ -1899,9 +1896,6 @@ static int _snd_emu10k1_init_efx(struct snd_emu10k1 *emu)
 	tmp = 0x88;	/* we need 4 temporary GPR */
 	/* from 0x8c to 0xff is the area for tone control */
 
-	/* stop FX processor */
-	snd_emu10k1_ptr_write(emu, DBG, 0, (emu->fx8010.dbg = 0) | EMU10K1_DBG_SINGLE_STEP);
-
 	/*
 	 *  Process FX Buses
 	 */
-- 
2.40.0.152.g15d061e6df

