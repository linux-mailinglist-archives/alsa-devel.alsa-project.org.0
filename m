Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0826EBA37
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Apr 2023 18:12:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AFECEF0;
	Sat, 22 Apr 2023 18:11:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AFECEF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682179939;
	bh=eLn3ZUMLynolx0Fh9ljtrOBVptmgdckKVeDEt4axTZI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bKUGZlvDMDngbdjarZHXze22Et7Od/Wi63a8OVmPZ7jWLstjoNrn4ISmGCBJQf4LL
	 fsD7l8T0xwtJniGh+2voASlRPv8ZobAtLuWUolh+VO2WFHtS22g/xY+SGGEOt5Umb/
	 /VKQJyH7K887iq/Py+el1S44WK2TzGJAbfpPf0zE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 338E3F80553;
	Sat, 22 Apr 2023 18:10:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71827F80549; Sat, 22 Apr 2023 18:10:32 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8908BF80155
	for <alsa-devel@alsa-project.org>; Sat, 22 Apr 2023 18:10:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8908BF80155
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 85F70241A9;
	Sat, 22 Apr 2023 12:10:21 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pqFob-nab-00; Sat, 22 Apr 2023 18:10:21 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/7] ALSA: emu10k1: eliminate some unused defines
Date: Sat, 22 Apr 2023 18:10:17 +0200
Message-Id: <20230422161021.1143903-4-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230422161021.1143903-1-oswald.buddenhagen@gmx.de>
References: <20230422161021.1143903-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: C3UUFAA2T3RHLWJ5GHBVHPGS6RZWLAHV
X-Message-ID-Hash: C3UUFAA2T3RHLWJ5GHBVHPGS6RZWLAHV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C3UUFAA2T3RHLWJ5GHBVHPGS6RZWLAHV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

One might be mislead to think that these mean anything.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 35a60bdcf641..931f3016d60d 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -25,21 +25,16 @@
 /* ------------------- DEFINES -------------------- */
 
 #define EMUPAGESIZE     4096
-#define MAXREQVOICES    8
 #define MAXPAGES0       4096	/* 32 bit mode */
 #define MAXPAGES1       8192	/* 31 bit mode */
-#define RESERVED        0
-#define NUM_MIDI        16
 #define NUM_G           64              /* use all channels */
-#define NUM_FXSENDS     4
 #define NUM_EFX_PLAYBACK    16
 
 /* FIXME? - according to the OSS driver the EMU10K1 needs a 29 bit DMA mask */
 #define EMU10K1_DMA_MASK	0x7fffffffUL	/* 31bit */
 #define AUDIGY_DMA_MASK		0xffffffffUL	/* 32bit mode */
 
 #define TMEMSIZE        256*1024
-#define TMEMSIZEREG     4
 
 #define IP_TO_CP(ip) ((ip == 0) ? 0 : (((0x00001000uL | (ip & 0x00000FFFL)) << (((ip >> 12) & 0x000FL) + 4)) & 0xFFFF0000uL))
 
@@ -283,7 +278,6 @@
 						/* before the new rate is guaranteed accurate.	*/
 #define TIMER_RATE_MASK		0x000003ff	/* Timer interrupt rate in sample periods	*/
 						/* 0 == 1024 periods, [1..4] are not useful	*/
-#define TIMER_RATE		0x0a00001a
 
 #define AC97DATA		0x1c		/* AC97 register set data register (16 bit)	*/
 
-- 
2.40.0.152.g15d061e6df

