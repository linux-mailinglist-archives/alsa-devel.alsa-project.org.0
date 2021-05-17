Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6DB382D44
	for <lists+alsa-devel@lfdr.de>; Mon, 17 May 2021 15:20:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BBBC1676;
	Mon, 17 May 2021 15:19:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BBBC1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621257646;
	bh=K9KbjWuEJAfkq0SmaRHPR9L0tPaDWJK6wYuCuNdaqbw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oH8SymQDOi85zeXVJFVftuW8jhdeAUxdRdJC1Z7MUMn5z/bcIZiHrfvovI6NqVQPB
	 FEu1g8zWmWpXuCPoS0XXJUjeleMY+dS4YZwxuOebH4JhLUGtoH/pxUM+kWa1UF5xoR
	 SNQUJubBBI+EkO/M0WqeMQ6dX6/txAIIyzAmXVxA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFDB4F804FA;
	Mon, 17 May 2021 15:16:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1AC9F804DA; Mon, 17 May 2021 15:16:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67FF0F8025D
 for <alsa-devel@alsa-project.org>; Mon, 17 May 2021 15:15:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67FF0F8025D
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CFA58B20F
 for <alsa-devel@alsa-project.org>; Mon, 17 May 2021 13:15:52 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/11] ALSA: usx2y: Nuke pcm_list
Date: Mon, 17 May 2021 15:15:45 +0200
Message-Id: <20210517131545.27252-12-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210517131545.27252-1-tiwai@suse.de>
References: <20210517131545.27252-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

It's nowhere actually used.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/usx2y/usbusx2y.h      | 1 -
 sound/usb/usx2y/usbusx2yaudio.c | 4 +---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/usb/usx2y/usbusx2y.h b/sound/usb/usx2y/usbusx2y.h
index 6d0e97a07bb8..8d82f5cc2fe1 100644
--- a/sound/usb/usx2y/usbusx2y.h
+++ b/sound/usb/usx2y/usbusx2y.h
@@ -46,7 +46,6 @@ struct usx2ydev {
 	struct snd_usx2y_substream	* volatile  prepare_subs;
 	wait_queue_head_t	prepare_wait_queue;
 	struct list_head	midi_list;
-	struct list_head	pcm_list;
 	int			pcm_devs;
 };
 
diff --git a/sound/usb/usx2y/usbusx2yaudio.c b/sound/usb/usx2y/usbusx2yaudio.c
index a2eeca9548f1..6154662d3097 100644
--- a/sound/usb/usx2y/usbusx2yaudio.c
+++ b/sound/usb/usx2y/usbusx2yaudio.c
@@ -1017,9 +1017,7 @@ static int usx2y_audio_stream_new(struct snd_card *card, int playback_endpoint,
  */
 int usx2y_audio_create(struct snd_card *card)
 {
-	int err = 0;
-
-	INIT_LIST_HEAD(&usx2y(card)->pcm_list);
+	int err;
 
 	err = usx2y_audio_stream_new(card, 0xA, 0x8);
 	if (err < 0)
-- 
2.26.2

