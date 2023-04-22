Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FA56EB95D
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Apr 2023 15:26:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D7FDEDE;
	Sat, 22 Apr 2023 15:25:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D7FDEDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682169987;
	bh=koITwj9tn69VRkus+kZjzglCH4HFs3CC0UsaRAA8meA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K3I/0/khKUe3B48GxTM6TP6u7dDQkb/oRgKR5qLQtbu/topvrjdv0KUEgirSXSUW6
	 /LJTQH1woqaIdU++p+T+rfzrtEttCcnNsiXU0wT3SznmJzqIKR0zQo6fb7urIyauUu
	 9Hi4omI1Q1cbgxjXw7AxMfZ4jIAOEqPZlkfEKLJA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D460FF8052D;
	Sat, 22 Apr 2023 15:24:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 159E2F80155; Sat, 22 Apr 2023 15:24:43 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D281EF800AC
	for <alsa-devel@alsa-project.org>; Sat, 22 Apr 2023 15:24:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D281EF800AC
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 9AD592420A;
	Sat, 22 Apr 2023 09:24:30 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pqDE6-R6C-00; Sat, 22 Apr 2023 15:24:30 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 2/2] ALSA: emu10k1: remove unused
 emu->pcm_playback_efx_substream field
Date: Sat, 22 Apr 2023 15:24:30 +0200
Message-Id: <20230422132430.1057468-2-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230422132430.1057468-1-oswald.buddenhagen@gmx.de>
References: <20230422132430.1057468-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RW2JYR4FIII254CKBSPZDL6PA2T7MKY5
X-Message-ID-Hash: RW2JYR4FIII254CKBSPZDL6PA2T7MKY5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RW2JYR4FIII254CKBSPZDL6PA2T7MKY5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Amends historic commit 27ae958cf6 ("emu10k1 driver - add multichannel
device hw:x,3 [2-8/8]").

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
v2:
- paste subject of referenced commit and say that it's historic
---
 include/sound/emu10k1.h    | 1 -
 sound/pci/emu10k1/emupcm.c | 2 --
 2 files changed, 3 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 39787fecc8d9..d7e49935376e 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1764,7 +1764,6 @@ struct snd_emu10k1 {
 	struct snd_pcm_substream *pcm_capture_substream;
 	struct snd_pcm_substream *pcm_capture_mic_substream;
 	struct snd_pcm_substream *pcm_capture_efx_substream;
-	struct snd_pcm_substream *pcm_playback_efx_substream;
 
 	struct snd_timer *timer;
 
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 48af77ae8020..68334af64741 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -1091,8 +1091,6 @@ static int snd_emu10k1_efx_playback_open(struct snd_pcm_substream *substream)
 	epcm->type = PLAYBACK_EFX;
 	epcm->substream = substream;
 	
-	emu->pcm_playback_efx_substream = substream;
-
 	runtime->private_data = epcm;
 	runtime->private_free = snd_emu10k1_pcm_free_substream;
 	runtime->hw = snd_emu10k1_efx_playback;
-- 
2.40.0.152.g15d061e6df

