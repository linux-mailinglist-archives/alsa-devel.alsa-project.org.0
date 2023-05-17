Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A143C7072E4
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 22:20:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA27D3E7;
	Wed, 17 May 2023 22:19:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA27D3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684354827;
	bh=EdzQf92843zcKgv2AnlrdWB7ybXMParLomwvT5wdvTA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XAuyilB+3QQSUS4tmcIowOqJi/KD8a1l5PTZCzZK2Q2zKfcEjIC90nGTPg19pOf1r
	 O0209YJ2Kjwd3Zj6jsT0O+97tIVMB26gipStT3E7y6JRGfFNjy6amURw9+EnU4xqCH
	 WmBU/r1tWyXS1i3nXhi0y27yvT5JDR0rRV7dPtg8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38140F80558; Wed, 17 May 2023 22:19:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C768EF802E8;
	Wed, 17 May 2023 22:19:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61BA6F80431; Wed, 17 May 2023 22:19:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F1E4FF80272
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 22:19:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1E4FF80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=o8RfhU1X
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B1AC464AFE;
	Wed, 17 May 2023 20:19:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DBD5C433EF;
	Wed, 17 May 2023 20:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684354767;
	bh=EdzQf92843zcKgv2AnlrdWB7ybXMParLomwvT5wdvTA=;
	h=From:To:Cc:Subject:Date:From;
	b=o8RfhU1XwiM4CAiJ0QFug+9ik8R3KZGACA7Wx+uHhMfN39xRyRlqwpjJi89DpSwpO
	 VX9j9xoaXhc8yH4Tada7xU5tVfoD6FtPrzaKg44wuGA72Ftmz8HAJF7kD1D7UtS3oq
	 raUJ2XTY0FtrhQwZUZm/xjPd8d8vi51p6CR7vtNT13opOO3lfc2yB37eJf7G80dwoc
	 T93AJN1xJ1C/5Wu/84SnDlo3xNJUTudwXC4W7bD0AOzY25baHIR0EGkvN79pqLFcgJ
	 SBY3OlQJG8emBV+bP9lIYbruMSq340tWyWv7kkvLBo2aLO4xzX915+HY241YC4RzSQ
	 7GJ4EeTkIgcOg==
From: Arnd Bergmann <arnd@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: emu10k1: fix 64-bit integer division
Date: Wed, 17 May 2023 22:19:17 +0200
Message-Id: <20230517201920.592909-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KQ2OCX4ZYTPMZ42GXJCHFKUBIFZTMZQ3
X-Message-ID-Hash: KQ2OCX4ZYTPMZ42GXJCHFKUBIFZTMZQ3
X-MailFrom: arnd@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KQ2OCX4ZYTPMZ42GXJCHFKUBIFZTMZQ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Arnd Bergmann <arnd@arndb.de>

Division of 64-bit values causes a link failure on 32-bit targets, depending
on compiler version and target architecture:

ERROR: modpost: "__divdi3" [sound/pci/emu10k1/snd-emu10k1.ko] undefined!
ERROR: modpost: "__udivdi3" [sound/pci/emu10k1/snd-emu10k1.ko] undefined!

Replace these with the safe div_u64() helpers.

Fixes: bb5ceb43b7bf ("ALSA: emu10k1: fix non-zero mixer control defaults in highres mode")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/pci/emu10k1/emufx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index f64b2b4eb348..7c28789720d1 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -1156,7 +1156,7 @@ snd_emu10k1_init_mono_control(struct snd_emu10k1_fx8010_control_gpr *ctl,
 		ctl->max = 0x7fffffff;
 		ctl->tlv = snd_emu10k1_db_linear;
 		ctl->translation = EMU10K1_GPR_TRANSLATION_NEGATE;
-		defval = defval * 0x80000000LL / 100 - 1;
+		defval = div_u64(defval * 0x80000000LL, 100) - 1;
 	} else {
 		ctl->min = 0;
 		ctl->max = 100;
@@ -1178,7 +1178,7 @@ snd_emu10k1_init_stereo_control(struct snd_emu10k1_fx8010_control_gpr *ctl,
 		ctl->max = 0x7fffffff;
 		ctl->tlv = snd_emu10k1_db_linear;
 		ctl->translation = EMU10K1_GPR_TRANSLATION_NEGATE;
-		defval = defval * 0x80000000LL / 100 - 1;
+		defval = div_u64(defval * 0x80000000LL, 100) - 1;
 	} else {
 		ctl->min = 0;
 		ctl->max = 100;
-- 
2.39.2

