Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CC26F8648
	for <lists+alsa-devel@lfdr.de>; Fri,  5 May 2023 17:55:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3A292D4B;
	Fri,  5 May 2023 17:54:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3A292D4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683302123;
	bh=k7n7eqlG/TRgKNkzu/hg5+IuiMF7Q2VmP7rofJw5Y8I=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JvyIgHCMW0QSFxFFgSg2AHkerxzPe6LRFp2UL2zLKDJ51hnEqf4EDt9giSaxXNRuk
	 qarCW8mbNCBdy2q1xHI7b3tuDiszA5JLdKofFZzsYrICG6Ko3YpP9aloyPTeF2gaHk
	 vtrDSgHf3tPDQcVXI3rCAg2xG3IXIf6yrjvDerR4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 803CAF8057B;
	Fri,  5 May 2023 17:53:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2712CF80557; Fri,  5 May 2023 17:52:59 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E9051F80548
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 17:52:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9051F80548
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 5A4F924173;
	Fri,  5 May 2023 11:52:45 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1puxjh-hWM-00; Fri, 05 May 2023 17:52:45 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 7/7] ALSA: pcm: use exit controlled loop in
 snd_pcm_playback_silence()
Date: Fri,  5 May 2023 17:52:44 +0200
Message-Id: <20230505155244.2312199-7-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230505155244.2312199-1-oswald.buddenhagen@gmx.de>
References: <20230505155244.2312199-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6PHRD4XTIGXADYJVEDBW7CZR53QZKNYK
X-Message-ID-Hash: 6PHRD4XTIGXADYJVEDBW7CZR53QZKNYK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6PHRD4XTIGXADYJVEDBW7CZR53QZKNYK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We already know that `frames` is greater than zero, because we just
checked it. So we don't need to check the loop condition on the first
iteration.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/core/pcm_lib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 17fc80a654be..9c121a921b04 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -123,14 +123,14 @@ void snd_pcm_playback_silence(struct snd_pcm_substream *substream, snd_pcm_ufram
 	if (frames == 0)
 		return;
 	ofs = (runtime->silence_start + runtime->silence_filled) % runtime->buffer_size;
-	while (frames > 0) {
+	do {
 		transfer = ofs + frames > runtime->buffer_size ? runtime->buffer_size - ofs : frames;
 		err = fill_silence_frames(substream, ofs, transfer);
 		snd_BUG_ON(err < 0);
 		runtime->silence_filled += transfer;
 		frames -= transfer;
 		ofs = 0;
-	}
+	} while (frames > 0);
 	snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_DEVICE);
 }
 
-- 
2.40.0.152.g15d061e6df

