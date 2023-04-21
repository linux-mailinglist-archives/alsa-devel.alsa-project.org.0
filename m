Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 279F56EAC67
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 16:11:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65512E8C;
	Fri, 21 Apr 2023 16:10:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65512E8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682086268;
	bh=jW3WxjgSUzW22+r3YqzFafGwtDcnk4z1LhYUpWpaIqw=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YHS8CWwjI4FF8EkY7am0pbTCpq/tht2F1qJ2TcomFvHC28BcoNV7k6fwz0Oo0nNVT
	 LuHCokI6NddCyJOEVqo/+PeVDJKK4TIrnHaYhlw5nzkZjvCyhazzz2opJtINWrA1TT
	 ifvHJX2wFDg1lQo+Xn+QLP2naz9cpfuNAwBNriek=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A8A0F8053D;
	Fri, 21 Apr 2023 16:10:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E33CF8053D; Fri, 21 Apr 2023 16:10:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1B8CF80053
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 16:10:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1B8CF80053
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id A12C524254;
	Fri, 21 Apr 2023 10:10:06 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pprSg-DZh-00; Fri, 21 Apr 2023 16:10:06 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/7] ALSA: emu10k1: remove unused
 emu->pcm_playback_efx_substream field
Date: Fri, 21 Apr 2023 16:10:05 +0200
Message-Id: <20230421141006.1005452-6-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230421141006.1005452-1-oswald.buddenhagen@gmx.de>
References: <20230421141006.1005452-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: D55VEPJJT6USVPJPYKDI6UJQJDPV342O
X-Message-ID-Hash: D55VEPJJT6USVPJPYKDI6UJQJDPV342O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D55VEPJJT6USVPJPYKDI6UJQJDPV342O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Amends commit 27ae958cf6.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h    | 1 -
 sound/pci/emu10k1/emupcm.c | 2 --
 2 files changed, 3 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index d1bae032c05f..84ea53e9c83f 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1762,7 +1762,6 @@ struct snd_emu10k1 {
 	struct snd_pcm_substream *pcm_capture_substream;
 	struct snd_pcm_substream *pcm_capture_mic_substream;
 	struct snd_pcm_substream *pcm_capture_efx_substream;
-	struct snd_pcm_substream *pcm_playback_efx_substream;
 
 	struct snd_timer *timer;
 
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index b7830fd5c2b4..c2749ad59e10 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -1044,8 +1044,6 @@ static int snd_emu10k1_efx_playback_open(struct snd_pcm_substream *substream)
 	epcm->type = PLAYBACK_EFX;
 	epcm->substream = substream;
 	
-	emu->pcm_playback_efx_substream = substream;
-
 	runtime->private_data = epcm;
 	runtime->private_free = snd_emu10k1_pcm_free_substream;
 	runtime->hw = snd_emu10k1_efx_playback;
-- 
2.40.0.152.g15d061e6df

