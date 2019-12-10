Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F071180F8
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 08:00:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2421616E0;
	Tue, 10 Dec 2019 07:59:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2421616E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575961203;
	bh=pKo+oXtdTUdYEl39k6DQMmO49P6TJ0SXWQmN2Hg0zZM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o3FYUmjLiGiFRhzBGH6vzbc6IhEBtMZgmnWBLqaFSsv4mfMP9pc4rSVOoBz8whx5I
	 VUgJDJBKNn6hZvKNYs6txcYPjhJyxIhs1W18h6WURevOcJyFMFP7ZznHIEesPPTo0r
	 U6Re12FYMx50jh74/QMbWCPyAqUMFbOCOCOuL6PE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E4DBF803EA;
	Tue, 10 Dec 2019 07:37:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9AF0F80338; Tue, 10 Dec 2019 07:36:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03726F8028C
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 07:35:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03726F8028C
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 24719AF5B
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 06:35:01 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 10 Dec 2019 07:34:39 +0100
Message-Id: <20191210063454.31603-41-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210063454.31603-1-tiwai@suse.de>
References: <20191210063454.31603-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 40/55] ALSA: es1688: Support PCM sync_stop
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
 sound/isa/es1688/es1688_lib.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/isa/es1688/es1688_lib.c b/sound/isa/es1688/es1688_lib.c
index 474d713085c7..632e867c5766 100644
--- a/sound/isa/es1688/es1688_lib.c
+++ b/sound/isa/es1688/es1688_lib.c
@@ -638,6 +638,7 @@ int snd_es1688_create(struct snd_card *card,
 	}
 
 	chip->irq = irq;
+	card->sync_irq = chip->irq;
 	err = request_dma(dma8, "ES1688");
 
 	if (err < 0) {
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
