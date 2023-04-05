Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E446D8806
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 22:16:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA2F3741;
	Wed,  5 Apr 2023 22:15:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA2F3741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680725773;
	bh=k9j2lb9janarKJilKn9+n0RMnt2tp3PlkIrNa1pxfm0=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=sI6dplSWxjkhR4vukMhUZRHMgaOVVp4xTMlganf37M6pesVi8YGq8j4J43Uc8Fq6k
	 lL2BrF1nITcQviqutg4RDsNxX1mQ5pvm4xvjCcbKzIafWku9HYLNLt99qL09RLBfOj
	 d6LWLECpD/d72wt4nMXtaR+AHBg01FhAdvBBRcsQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A30E7F80533;
	Wed,  5 Apr 2023 22:12:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B346F8055C; Wed,  5 Apr 2023 22:12:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39EFDF80249
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 22:12:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39EFDF80249
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 3B38E2425C
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 16:12:21 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pk9US-DmW-00
	for <alsa-devel@alsa-project.org>; Wed, 05 Apr 2023 22:12:20 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: emu10k1: fix capture interrupt handler unlinking
Date: Wed,  5 Apr 2023 22:12:20 +0200
Message-Id: <20230405201220.2197923-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TLKQHWCQUPDPKJGNSI5UYH2BNUDIZCOO
X-Message-ID-Hash: TLKQHWCQUPDPKJGNSI5UYH2BNUDIZCOO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TLKQHWCQUPDPKJGNSI5UYH2BNUDIZCOO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Due to two copy/pastos, closing the MIC or EFX capture device would
make a running ADC capture hang due to unsetting its interrupt handler.
In principle, this would have also allowed dereferencing dangling
pointers, but we're actually rather thorough at disabling and flushing
the ints.

While it may sound like one, this actually wasn't a hypothetical bug:
PortAudio will open a capture stream at startup (and close it right
away) even if not asked to. If the first device is busy, it will just
proceed with the next one ... thus killing a concurrent capture.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emupcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 48af77ae8020..908f76f1bb9f 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -1236,7 +1236,7 @@ static int snd_emu10k1_capture_mic_close(struct snd_pcm_substream *substream)
 {
 	struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
 
-	emu->capture_interrupt = NULL;
+	emu->capture_mic_interrupt = NULL;
 	emu->pcm_capture_mic_substream = NULL;
 	return 0;
 }
@@ -1344,7 +1344,7 @@ static int snd_emu10k1_capture_efx_close(struct snd_pcm_substream *substream)
 {
 	struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
 
-	emu->capture_interrupt = NULL;
+	emu->capture_efx_interrupt = NULL;
 	emu->pcm_capture_efx_substream = NULL;
 	return 0;
 }
-- 
2.40.0.152.g15d061e6df

