Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 006CA70E63E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 22:09:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 157FD208;
	Tue, 23 May 2023 22:08:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 157FD208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684872547;
	bh=NNllFbQfxMmxpda7oE9xtQeoofSWqxgllWUVDKHARlA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vFiBLXQYFkr9xQvlL0iZYQwfpopGgYL5rHJfPRBXUqpSV4NE+nDfh/y7+4Ryl7nUf
	 h1hotueebEJWuCnBD0v6SnVhb+uPmKm+zxrbtbuOw4bTwJMm3aK2E7N+oHnvqXOtZG
	 6NJ27kvcgIIovjI1OQjQ8rx0WBaI+X+X1Dt7Q8uw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32519F80579; Tue, 23 May 2023 22:07:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 60C4CF80568;
	Tue, 23 May 2023 22:07:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5716F80548; Tue, 23 May 2023 22:07:15 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3BF3CF8053D
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 22:07:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BF3CF8053D
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 468892421C;
	Tue, 23 May 2023 16:07:10 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q1YHm-zPo-00; Tue, 23 May 2023 22:07:10 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 2/4] ALSA: emu10k1: fix support for 24 kHz capture
Date: Tue, 23 May 2023 22:07:07 +0200
Message-Id: <20230523200709.236059-3-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230523200709.236059-1-oswald.buddenhagen@gmx.de>
References: <20230523200709.236059-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7M7MUMNWSNQPPI3H2EM7SJVHJJACR5AD
X-Message-ID-Hash: 7M7MUMNWSNQPPI3H2EM7SJVHJJACR5AD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7M7MUMNWSNQPPI3H2EM7SJVHJJACR5AD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We need to specify that the hardware supports non-standard rates, as
otherwise the sound core creates a constraint which limits the rate to
the specified standard rates. That also made the rate constraint we were
already adding meaningless.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emupcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 6a24e3e80aea..fd3fc96c08e9 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -941,7 +941,7 @@ static const struct snd_pcm_hardware snd_emu10k1_capture =
 				 SNDRV_PCM_INFO_RESUME |
 				 SNDRV_PCM_INFO_MMAP_VALID),
 	.formats =		SNDRV_PCM_FMTBIT_S16_LE,
-	.rates =		SNDRV_PCM_RATE_8000_48000,
+	.rates =		SNDRV_PCM_RATE_8000_48000 | SNDRV_PCM_RATE_KNOT,
 	.rate_min =		8000,
 	.rate_max =		48000,
 	.channels_min =		1,
-- 
2.40.0.152.g15d061e6df

