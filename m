Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A132A6EBA44
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Apr 2023 18:15:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 220B6F15;
	Sat, 22 Apr 2023 18:14:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 220B6F15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682180117;
	bh=saHLjnifZFvWsvSiJQhQW21hnqShBkUM2Tz6bnZdzrU=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cKBnR8O3FzmNi7dGUEXd7jDdXD9ufGHD2vxi8FIpEqdx0X2ETvmfrSxZKYlTLjCWD
	 VT0hKg5gWUd+xwML+0cnbyHfwR5Tu1/HY6DyRbL1ru3v2cQZcPH31+dhyHVCtr5LbD
	 Pxkrs4PRX7B088QqbDqgDfmzmTcaeGSZp9Z969c0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 111DDF80542;
	Sat, 22 Apr 2023 18:12:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75FBEF80155; Sat, 22 Apr 2023 18:12:34 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 966B5F80528
	for <alsa-devel@alsa-project.org>; Sat, 22 Apr 2023 18:10:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 966B5F80528
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 9575924215;
	Sat, 22 Apr 2023 12:10:21 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pqFob-nah-00; Sat, 22 Apr 2023 18:10:21 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/7] ALSA: emu10k1: remove some bogus defines
Date: Sat, 22 Apr 2023 18:10:18 +0200
Message-Id: <20230422161021.1143903-5-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230422161021.1143903-1-oswald.buddenhagen@gmx.de>
References: <20230422161021.1143903-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: L63E4SE7ABELGZPDP55XWSFHRBL7I2QR
X-Message-ID-Hash: L63E4SE7ABELGZPDP55XWSFHRBL7I2QR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L63E4SE7ABELGZPDP55XWSFHRBL7I2QR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Firstly, remove the FXWC_* defines - the comment on FXWC implies that
the relevant defines are the (A_)EXTOUT_* ones. It's unclear where this
came from - it was in the initial ALSA import, but neither the driver
from Creative nor kX-project have these defines.

Secondly, remove A_HR, which made plain no sense (was unused, and
clashed with FXRT). Amends commit cbb7d8f9b7b ("emu10k1: Update
registers defines for the Audigy 2/emu10k2.5").

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h    | 15 ---------------
 sound/pci/emu10k1/emupcm.c |  1 -
 2 files changed, 16 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 931f3016d60d..6927fac1aa5f 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -471,7 +471,6 @@
 #define FXRT_CHANNELC		0x0f000000	/* Effects send bus number for channel's effects send C	*/
 #define FXRT_CHANNELD		0xf0000000	/* Effects send bus number for channel's effects send D	*/
 
-#define A_HR			0x0b	/* High Resolution. 24bit playback from host to DSP. */
 #define MAPA			0x0c		/* Cache map A						*/
 #define MAPB			0x0d		/* Cache map B						*/
 
@@ -626,20 +625,6 @@
 						/* is 16bit, 48KHz only. All 32 channels can be enabled */
 						/* simultaneously.					*/
 
-#define FXWC_DEFAULTROUTE_C     (1<<0)		/* left emu out? */
-#define FXWC_DEFAULTROUTE_B     (1<<1)		/* right emu out? */
-#define FXWC_DEFAULTROUTE_A     (1<<12)
-#define FXWC_DEFAULTROUTE_D     (1<<13)
-#define FXWC_ADCLEFT            (1<<18)
-#define FXWC_CDROMSPDIFLEFT     (1<<18)
-#define FXWC_ADCRIGHT           (1<<19)
-#define FXWC_CDROMSPDIFRIGHT    (1<<19)
-#define FXWC_MIC                (1<<20)
-#define FXWC_ZOOMLEFT           (1<<20)
-#define FXWC_ZOOMRIGHT          (1<<21)
-#define FXWC_SPDIFLEFT          (1<<22)		/* 0x00400000 */
-#define FXWC_SPDIFRIGHT         (1<<23)		/* 0x00800000 */
-
 #define A_TBLSZ			0x43	/* Effects Tank Internal Table Size. Only low byte or register used */
 
 #define TCBS			0x44		/* Tank cache buffer size register			*/
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index ff6ca91b0d28..b0c0ef342756 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -1749,7 +1749,6 @@ int snd_emu10k1_pcm_efx(struct snd_emu10k1 *emu, int device)
 	 * to these
 	 */	
 	
-	/* emu->efx_voices_mask[0] = FXWC_DEFAULTROUTE_C | FXWC_DEFAULTROUTE_A; */
 	if (emu->audigy) {
 		emu->efx_voices_mask[0] = 0;
 		if (emu->card_capabilities->emu_model)
-- 
2.40.0.152.g15d061e6df

