Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9444270E63A
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 22:08:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BF6D1E8;
	Tue, 23 May 2023 22:07:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BF6D1E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684872488;
	bh=K3UiwY24tEVNWGgDQxMgRG+jerONTyHwOvrNvJEOkRQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uBbpjs2KdpH7a/z0iNBmmy0I6M0c99HLcONYjvwi30HGBleln0gTjVeH8//HHwO4X
	 VmXb+F6uSl5WLqcRJJvZ1xQxgTJNSYQqSlhzQnAoy2yAFz/to0uXJnDNbo46la67XX
	 KurGWiv23xeiwkp8gLlNuUBm1PvK+TfwlaagN+SA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3684DF8024E; Tue, 23 May 2023 22:07:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9919F8024E;
	Tue, 23 May 2023 22:07:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9427F80542; Tue, 23 May 2023 22:07:13 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 15C40F80249
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 22:07:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15C40F80249
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 0E33A24152;
	Tue, 23 May 2023 16:07:10 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q1YHl-zP7-00; Tue, 23 May 2023 22:07:09 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 1/3] ALSA: emu10k1: don't limit multi-channel playback to two
 periods
Date: Tue, 23 May 2023 22:07:07 +0200
Message-Id: <20230523200709.236023-2-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230523200709.236023-1-oswald.buddenhagen@gmx.de>
References: <20230523200709.236023-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HKUE7PUVMVPOIRNGSMFZ6LEBZMDISLC7
X-Message-ID-Hash: HKUE7PUVMVPOIRNGSMFZ6LEBZMDISLC7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HKUE7PUVMVPOIRNGSMFZ6LEBZMDISLC7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For unclear reasons, the extra voice was set up with half the buffer
size instead of the period size. Commit 27ae958cf6 ("emu10k1 driver -
add multichannel device hw:x,3 [2-8/8]") mentions half-loop interrupts,
so maybe this was an artifact of an earlier iteration of the patch.

While at it, also fix periods_min of the regular playback - one period
makes just no sense.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emupcm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 0572dfb80943..2764e7867b33 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -429,15 +429,16 @@ static int snd_emu10k1_efx_playback_prepare(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_emu10k1_pcm *epcm = runtime->private_data;
 	unsigned int start_addr;
-	unsigned int channel_size;
+	unsigned int extra_size, channel_size;
 	int i;
 
 	start_addr = epcm->start_addr >> 1;  // 16-bit voices
 
+	extra_size = runtime->period_size;
 	channel_size = runtime->buffer_size;
 
 	snd_emu10k1_pcm_init_extra_voice(emu, epcm->extra, true,
-					 start_addr, start_addr + (channel_size / 2));
+					 start_addr, start_addr + extra_size);
 
 	epcm->ccca_start_addr = start_addr;
 	for (i = 0; i < NUM_EFX_PLAYBACK; i++) {
@@ -465,7 +466,7 @@ static const struct snd_pcm_hardware snd_emu10k1_efx_playback =
 	.buffer_bytes_max =	(128*1024),
 	.period_bytes_max =	(128*1024),
 	.periods_min =		2,
-	.periods_max =		2,
+	.periods_max =		1024,
 	.fifo_size =		0,
 };
 
@@ -925,7 +926,7 @@ static const struct snd_pcm_hardware snd_emu10k1_playback =
 	.channels_max =		2,
 	.buffer_bytes_max =	(128*1024),
 	.period_bytes_max =	(128*1024),
-	.periods_min =		1,
+	.periods_min =		2,
 	.periods_max =		1024,
 	.fifo_size =		0,
 };
-- 
2.40.0.152.g15d061e6df

