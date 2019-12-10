Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7EA118109
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 08:05:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C4751734;
	Tue, 10 Dec 2019 08:04:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C4751734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575961521;
	bh=+kcT/PrPP5Ett1Q1nDGR4gPEEOJWh15N7MyZ5/vEn5Q=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dK/h/Gs76+hi5499d23bc0Mji/vXfn51v2CAatHP3pE7NFr9p2r4ZEOzJd3e45kXq
	 eJxWSp2tPAGtuxqHqPm96DxjOP/IGGAEPfesPYBwGROmkcsTLE4dT/NFe0BdI45Q3j
	 meTUYjcXoatWsT0tDAhooxWJNrWVpgcXzWPno6bs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E6E9F80477;
	Tue, 10 Dec 2019 07:37:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29160F8034A; Tue, 10 Dec 2019 07:36:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE4B6F8028F
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 07:35:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE4B6F8028F
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 71BD7B318
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 06:35:01 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 10 Dec 2019 07:34:45 +0100
Message-Id: <20191210063454.31603-47-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210063454.31603-1-tiwai@suse.de>
References: <20191210063454.31603-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 46/55] ALSA: sb: Support PCM sync_stop
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The driver invokes snd_pcm_period_elapsed() simply from the interrupt
handler.  Set card->sync_irq for enabling the missing sync_stop PCM
operation.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/sb/sb_common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/isa/sb/sb_common.c b/sound/isa/sb/sb_common.c
index ff031d670400..4aaf9ab82afe 100644
--- a/sound/isa/sb/sb_common.c
+++ b/sound/isa/sb/sb_common.c
@@ -233,6 +233,7 @@ int snd_sbdsp_create(struct snd_card *card,
 		return -EBUSY;
 	}
 	chip->irq = irq;
+	card->sync_irq = chip->irq;
 
 	if (hardware == SB_HW_ALS4000)
 		goto __skip_allocation;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
