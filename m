Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 325AD78A061
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Aug 2023 19:06:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C446BE0F;
	Sun, 27 Aug 2023 19:05:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C446BE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693155992;
	bh=2V+0llvqa1gZO1U5Q+M+Jug9dUcE18DzKjxwmba2mps=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Mf+7D4tLtdkNXy44h4s18nvSej4pggzET0nD1bzW3mc0QZRT2VP/GYiwpsnRKEoiG
	 4ULWTkSKsRr6qmWngDXOyjAMvuUoRSfLhzKUetUiqYIV6mBani7deGrnkL/o1OLoLb
	 NQ6rWkprCRHre50zPy1Th38xQ4g+nlY5x/9siJt0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74AA9F80605; Sun, 27 Aug 2023 19:02:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 662D4F80602;
	Sun, 27 Aug 2023 19:02:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 545AFF80553; Sat, 26 Aug 2023 00:22:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,LOTS_OF_MONEY,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E74BF80158
	for <alsa-devel@alsa-project.org>; Sat, 26 Aug 2023 00:22:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E74BF80158
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id B9942242C7;
	Fri, 25 Aug 2023 18:21:57 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1qZfBl-iTt-00; Sat, 26 Aug 2023 00:21:57 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 1/3] ALSA: emu10k1: de-duplicate audigy-mixer.rst vs.
 sb-live-mixer.rst
Date: Sat, 26 Aug 2023 00:21:55 +0200
Message-Id: <20230825222157.170978-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: H2HZKRWQVDLXY6RHPQDZW2TND62LK37O
X-Message-ID-Hash: H2HZKRWQVDLXY6RHPQDZW2TND62LK37O
X-Mailman-Approved-At: Sun, 27 Aug 2023 17:02:17 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H2HZKRWQVDLXY6RHPQDZW2TND62LK37O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Let the MANUALS/PATENTS section of the former simply refer to the latter
- there is no point in duplicating this information with little value to
end users.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 Documentation/sound/cards/audigy-mixer.rst | 67 +---------------------
 1 file changed, 1 insertion(+), 66 deletions(-)

diff --git a/Documentation/sound/cards/audigy-mixer.rst b/Documentation/sound/cards/audigy-mixer.rst
index ea66b50a2b03..51cc7ac034ce 100644
--- a/Documentation/sound/cards/audigy-mixer.rst
+++ b/Documentation/sound/cards/audigy-mixer.rst
@@ -303,69 +303,4 @@ The channel mapping is following:
 MANUALS/PATENTS
 ===============
 
-ftp://opensource.creative.com/pub/doc
--------------------------------------
-
-Note that the site is defunct, but the documents are available
-from various other locations.
-
-LM4545.pdf
-	AC97 Codec
-
-m2049.pdf
-	The EMU10K1 Digital Audio Processor
-
-hog63.ps
-	FX8010 - A DSP Chip Architecture for Audio Effects
-
-
-WIPO Patents
-------------
-
-WO 9901813 (A1)
-	Audio Effects Processor with multiple asynchronous streams
-	(Jan. 14, 1999)
-
-WO 9901814 (A1)
-	Processor with Instruction Set for Audio Effects (Jan. 14, 1999)
-
-WO 9901953 (A1)
-	Audio Effects Processor having Decoupled Instruction
-        Execution and Audio Data Sequencing (Jan. 14, 1999)
-
-
-US Patents (https://www.uspto.gov/)
------------------------------------
-
-US 5925841
-	Digital Sampling Instrument employing cache memory (Jul. 20, 1999)
-
-US 5928342
-	Audio Effects Processor integrated on a single chip
-        with a multiport memory onto which multiple asynchronous
-        digital sound samples can be concurrently loaded
-	(Jul. 27, 1999)
-
-US 5930158
-	Processor with Instruction Set for Audio Effects (Jul. 27, 1999)
-
-US 6032235
-	Memory initialization circuit (Tram) (Feb. 29, 2000)
-
-US 6138207
-	Interpolation looping of audio samples in cache connected to
-        system bus with prioritization and modification of bus transfers
-        in accordance with loop ends and minimum block sizes
-	(Oct. 24, 2000)
-
-US 6151670
-	Method for conserving memory storage using a
-        pool of  short term memory registers
-	(Nov. 21, 2000)
-
-US 6195715
-	Interrupt control for multiple programs communicating with
-        a common interrupt by associating programs to GP registers,
-        defining interrupt register, polling GP registers, and invoking
-        callback routine associated with defined interrupt register
-	(Feb. 27, 2001)
+See sb-live-mixer.rst.
-- 
2.40.0.152.g15d061e6df

