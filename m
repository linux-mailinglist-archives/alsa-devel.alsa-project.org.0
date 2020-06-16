Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 289AB1FAFEA
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 14:11:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3823167D;
	Tue, 16 Jun 2020 14:10:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3823167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592309477;
	bh=NX17xdv/NTnqX7ef7SjwSjbt8kgDo/b2Tnf2gOXsUls=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YveZ8Zt+uwG1QpH7BQRO6a42tWjq8/TpYhEm2y1cF7YVv2oIW1eCQcdHWsL/9SLCY
	 OncNYG8RXQk5+2iXAeOVOa7a6TLXf/Evg4FjLHv17fknAUNPPWHNWf2EJ/o6Qll/30
	 hEkBpmH2roa1Ia0oD/0AwTlKT4jodo4InXZf9xs8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D19E9F80232;
	Tue, 16 Jun 2020 14:09:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD9D8F80114; Tue, 16 Jun 2020 14:09:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C711CF80114
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 14:09:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C711CF80114
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 948E2AD41;
 Tue, 16 Jun 2020 12:09:27 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Fix potential use-after-free of streams
Date: Tue, 16 Jun 2020 14:09:21 +0200
Message-Id: <20200616120921.12249-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Alexander Tsoy <alexander@tsoy.me>, Erwin Burema <e.burema@gmail.com>
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

With the recent full-duplex support of implicit feedback streams, an
endpoint can be still running after closing the capture stream as long
as the playback stream with the sync-endpoint is running.  In such a
state, the URBs are still be handled and they may call retire_data_urb
callback, which tries to transfer the data from the PCM buffer.  Since
the PCM stream gets closed, this may lead to use-after-free.

This patch adds the proper clearance of the callback at stopping the
capture stream for addressing the possible UAF above.

Fixes: 10ce77e4817f ("ALSA: usb-audio: Add duplex sound support for USB devices using implicit feedback")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/pcm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 84c0ae431936..a777d36c4f5a 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -1787,6 +1787,7 @@ static int snd_usb_substream_capture_trigger(struct snd_pcm_substream *substream
 		return 0;
 	case SNDRV_PCM_TRIGGER_STOP:
 		stop_endpoints(subs);
+		subs->data_endpoint->retire_data_urb = NULL;
 		subs->running = 0;
 		return 0;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-- 
2.25.0

