Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 701506FE351
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 19:38:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58190101A;
	Wed, 10 May 2023 19:37:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58190101A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683740300;
	bh=XXJr1tgoAPJbZ1oJ/P8rlLa1cbxLccGxHOSyvGO/sx0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=d5ee/Iq12U1TE/Ex3F8PGQCGGvfZMYdtch4b+0XmGi72pAD8fQoKwRFD3KYUGusGg
	 tFsoD5Tf8TfvZy022708Dn8SAs25sDNHIhYoZuBhGhAR3fuU6+6xX7jg6C0WQF2+XD
	 zL+1MaMOZbA6r4meBtiLtMNeceJVtzWUVzFwc+EY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5FF4F80310;
	Wed, 10 May 2023 19:37:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 710FCF8032D; Wed, 10 May 2023 19:37:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90019F80087
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 19:37:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90019F80087
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 777802008A;
	Wed, 10 May 2023 13:37:22 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pwnkg-tHc-00; Wed, 10 May 2023 19:37:22 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH] ALSA: emu10k1: don't create regular S/PDIF controls for E-MU
 cards
Date: Wed, 10 May 2023 19:37:22 +0200
Message-Id: <20230510173722.3072439-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YL3IV37HSLTSLUIEMBYJXSZXGEOKTNJQ
X-Message-ID-Hash: YL3IV37HSLTSLUIEMBYJXSZXGEOKTNJQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YL3IV37HSLTSLUIEMBYJXSZXGEOKTNJQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These ports are unused on these cards.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emumixer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 610700be1e37..48f0d3f8b8e7 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -2055,7 +2055,7 @@ int snd_emu10k1_mixer(struct snd_emu10k1 *emu,
 		mix->attn[0] = 0xffff;
 	}
 	
-	if (! emu->card_capabilities->ecard) { /* FIXME: APS has these controls? */
+	if (!emu->card_capabilities->ecard && !emu->card_capabilities->emu_model) {
 		/* sb live! and audigy */
 		kctl = snd_ctl_new1(&snd_emu10k1_spdif_mask_control, emu);
 		if (!kctl)
-- 
2.40.0.152.g15d061e6df

