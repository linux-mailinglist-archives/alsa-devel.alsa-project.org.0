Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4316EBA3C
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Apr 2023 18:13:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2A7EEE5;
	Sat, 22 Apr 2023 18:13:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2A7EEE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682180031;
	bh=VDlp2+4VGcnnAg1R6VAivVPsoruQTMByTMI9BRpBjGE=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LjeGPOGd3utQXbrHLVe8N7Pw6jYlJCckDEUX+JWg12NqzkZxWKjkvtzE7rmUrLDQG
	 62dsBwBYUMTWOtztiNDmt5WLtOYIfZuEeGSbdsX2+qpyz8pkpNdi0+cL5+iztRD/Sw
	 Huqig2VFgjrOEsyBK8BDr6zV8pK9KI6wYKH+tslI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E64FF8057A;
	Sat, 22 Apr 2023 18:11:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2A63F8057C; Sat, 22 Apr 2023 18:10:56 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E6E52F800AC
	for <alsa-devel@alsa-project.org>; Sat, 22 Apr 2023 18:10:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6E52F800AC
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id CED9524229;
	Sat, 22 Apr 2023 12:10:21 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pqFob-nba-00; Sat, 22 Apr 2023 18:10:21 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: emu10k1: fix multi-channel playback device class
Date: Sat, 22 Apr 2023 18:10:21 +0200
Message-Id: <20230422161021.1143989-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IY3N3M622I47IAPB5MMQKOJ6F6MFH6SF
X-Message-ID-Hash: IY3N3M622I47IAPB5MMQKOJ6F6MFH6SF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IY3N3M622I47IAPB5MMQKOJ6F6MFH6SF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It's multi, not mono/stereo.

AFAICT, this doesn't do anything in the kernel.
Also, I think the subclass is meaningless for devices with just one
stream, but whatever.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emupcm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 87c3b19c6b2d..c04ef6ea188e 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -1377,7 +1377,8 @@ int snd_emu10k1_pcm_multi(struct snd_emu10k1 *emu, int device)
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &snd_emu10k1_efx_playback_ops);
 
 	pcm->info_flags = 0;
-	pcm->dev_subclass = SNDRV_PCM_SUBCLASS_GENERIC_MIX;
+	pcm->dev_class = SNDRV_PCM_CLASS_MULTI;
+	pcm->dev_subclass = SNDRV_PCM_SUBCLASS_MULTI_MIX;
 	strcpy(pcm->name, "Multichannel Playback");
 	emu->pcm_multi = pcm;
 
-- 
2.40.0.152.g15d061e6df

