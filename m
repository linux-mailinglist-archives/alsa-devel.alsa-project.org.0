Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 413E66EAC7B
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 16:12:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5CFEE9A;
	Fri, 21 Apr 2023 16:11:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5CFEE9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682086319;
	bh=6kGUDsf5gnHwpAcYeoP/ksz43zobH9QvDsZm1ErBmbA=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GCOEjDum/Dk90dxCVIbBKSBciYvZ5otspseczNYCCpizX+y+83Y+HmlvVW/LAkaRZ
	 R4lQQ+xD5N/g3KoS/aa+SqL9KAIe/cbW1vKdDHzGcnMAWCPKUZhwHH+NLU1k5Q3/ol
	 qqgbcOZWjvC5uSALgUQ/5ocsjDyPp74wLDBSdSUo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 340DFF80542;
	Fri, 21 Apr 2023 16:10:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E061FF80544; Fri, 21 Apr 2023 16:10:14 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 03F4BF80155
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 16:10:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03F4BF80155
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 824F923FE6;
	Fri, 21 Apr 2023 10:10:06 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pprSg-DZD-00; Fri, 21 Apr 2023 16:10:06 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/7] ALSA: emu10k1: drop redundant
 snd_emu10k1_efx_playback_hw_free()
Date: Fri, 21 Apr 2023 16:10:00 +0200
Message-Id: <20230421141006.1005452-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: A4HUIQQ6WQ2266WWD5MO4QBHP523D6WB
X-Message-ID-Hash: A4HUIQQ6WQ2266WWD5MO4QBHP523D6WB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A4HUIQQ6WQ2266WWD5MO4QBHP523D6WB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Or actually, replace snd_emu10k1_playback_hw_free() with it, as that is
a subset.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emupcm.c | 32 +-------------------------------
 1 file changed, 1 insertion(+), 31 deletions(-)

diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 48af77ae8020..b89382aa4db6 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -429,36 +429,6 @@ static int snd_emu10k1_playback_hw_params(struct snd_pcm_substream *substream,
 }
 
 static int snd_emu10k1_playback_hw_free(struct snd_pcm_substream *substream)
-{
-	struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_emu10k1_pcm *epcm;
-
-	if (runtime->private_data == NULL)
-		return 0;
-	epcm = runtime->private_data;
-	if (epcm->extra) {
-		snd_emu10k1_voice_free(epcm->emu, epcm->extra);
-		epcm->extra = NULL;
-	}
-	if (epcm->voices[1]) {
-		snd_emu10k1_voice_free(epcm->emu, epcm->voices[1]);
-		epcm->voices[1] = NULL;
-	}
-	if (epcm->voices[0]) {
-		snd_emu10k1_voice_free(epcm->emu, epcm->voices[0]);
-		epcm->voices[0] = NULL;
-	}
-	if (epcm->memblk) {
-		snd_emu10k1_free_pages(emu, epcm->memblk);
-		epcm->memblk = NULL;
-		epcm->start_addr = 0;
-	}
-	snd_pcm_lib_free_pages(substream);
-	return 0;
-}
-
-static int snd_emu10k1_efx_playback_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -1372,7 +1342,7 @@ static const struct snd_pcm_ops snd_emu10k1_efx_playback_ops = {
 	.open =			snd_emu10k1_efx_playback_open,
 	.close =		snd_emu10k1_efx_playback_close,
 	.hw_params =		snd_emu10k1_playback_hw_params,
-	.hw_free =		snd_emu10k1_efx_playback_hw_free,
+	.hw_free =		snd_emu10k1_playback_hw_free,
 	.prepare =		snd_emu10k1_efx_playback_prepare,
 	.trigger =		snd_emu10k1_efx_playback_trigger,
 	.pointer =		snd_emu10k1_efx_playback_pointer,
-- 
2.40.0.152.g15d061e6df

