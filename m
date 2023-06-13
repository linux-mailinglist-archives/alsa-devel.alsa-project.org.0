Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C7A72DB28
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 09:40:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2D3583E;
	Tue, 13 Jun 2023 09:39:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2D3583E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686642026;
	bh=uVGsqNZPXwuLbM4ckGcS7Zngg92qCuT0iMwYBwVFlig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t7PjUFtx0UVma2LPtUJrNlg1A5ggFZGlzPqZcmM/TiC6ZEb4Z5ctnhDrgytm78Xxc
	 40kUacEo5Huy5i85wNGxNKcf9tOKa5Ja3pxKq3soSqOQzvV+Tdt56MaQQr20C7Mclw
	 x0c9UOhjn1F3PdPDUIh2hXoRqSQJ2AwllaUbF4fU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B46DF8057E; Tue, 13 Jun 2023 09:38:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 945A7F8057F;
	Tue, 13 Jun 2023 09:38:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63E3CF80580; Tue, 13 Jun 2023 09:38:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7E07F80130
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 09:38:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7E07F80130
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 80D0624235;
	Tue, 13 Jun 2023 03:38:22 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q8ybe-dRd-00; Tue, 13 Jun 2023 09:38:22 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 3/8] ALSA: emu10k1: set the "no filtering" bits on PCM voices
Date: Tue, 13 Jun 2023 09:38:17 +0200
Message-Id: <20230613073822.1343234-4-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230613073822.1343234-1-oswald.buddenhagen@gmx.de>
References: <20230613073822.1343234-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RMHPZNVDZBV54SBQASXXDZCXFWHEIGCI
X-Message-ID-Hash: RMHPZNVDZBV54SBQASXXDZCXFWHEIGCI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RMHPZNVDZBV54SBQASXXDZCXFWHEIGCI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

... on Audigy, when we are not pitch-shifting.

The only observable effect is that the Z1/Z2/FXBUS registers don't have
a stray bit set for negative numbers anymore. The bit is below the ones
significant for output, but it would mess with 32-bit sample
recombination, which we are about to add.

kX-project does that, but I had to figure out myself why.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emupcm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index a6fb0647d80a..bd222de7ea9f 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -318,9 +318,10 @@ static void snd_emu10k1_pcm_init_voice(struct snd_emu10k1 *emu,
 		REGLIST_END);
 	// Setup routing
 	if (emu->audigy) {
+		u32 unfiltered = (evoice->epcm->pitch_target == PITCH_48000) ? 0x80808080 : 0;
 		snd_emu10k1_ptr_write_multiple(emu, voice,
-			A_FXRT1, snd_emu10k1_compose_audigy_fxrt1(send_routing),
-			A_FXRT2, snd_emu10k1_compose_audigy_fxrt2(send_routing),
+			A_FXRT1, snd_emu10k1_compose_audigy_fxrt1(send_routing) | unfiltered,
+			A_FXRT2, snd_emu10k1_compose_audigy_fxrt2(send_routing) | unfiltered,
 			A_SENDAMOUNTS, snd_emu10k1_compose_audigy_sendamounts(send_amount),
 			REGLIST_END);
 		for (int i = 0; i < 4; i++) {
-- 
2.40.0.152.g15d061e6df

