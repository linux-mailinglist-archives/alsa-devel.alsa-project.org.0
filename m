Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F33F525BF5D
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 12:49:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 989AB16F4;
	Thu,  3 Sep 2020 12:48:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 989AB16F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599130187;
	bh=iPFpLVEZ5zN58fWEZU6RErFBiOPRgazuZJni7xEvC2s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HIFHIJZ0MiougO8WhLxiV4MUmMNczSnrP1IRY6aNLcpy84gNXeCUCNRldGhUYWTfu
	 Fbi2pHtgLVawKfkClDRQTQ9lyShMRAzjXG9/rt3RG1jXrLUesIGH/A6Ftc2ZW19V2f
	 bXMNqmYGucHnq2GxOfs7UH5ssgeGdO5+BQrZV+ZY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28AEEF8033D;
	Thu,  3 Sep 2020 12:42:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FDBAF80307; Thu,  3 Sep 2020 12:42:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AEB6F802D2
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 12:41:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AEB6F802D2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1910DB160;
 Thu,  3 Sep 2020 10:41:39 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/11] ALSA: mixart: Correct comment wrt obsoleted tasklet
 usage
Date: Thu,  3 Sep 2020 12:41:31 +0200
Message-Id: <20200903104131.21097-12-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200903104131.21097-1-tiwai@suse.de>
References: <20200903104131.21097-1-tiwai@suse.de>
Cc: Clemens Ladisch <clemens@ladisch.de>
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

The miXart driver has been already converted to use the threaded IRQ
instead of tasklet while there is a remaining comment still mentioning
a tasklet.  Update the comment appropriately.

Fixes: 8d3a8b5cb57d ("ALSA: mixart: Use nonatomic PCM ops")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/mixart/mixart.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/mixart/mixart.h b/sound/pci/mixart/mixart.h
index 42111562e9bc..cbed6d9a9f2e 100644
--- a/sound/pci/mixart/mixart.h
+++ b/sound/pci/mixart/mixart.h
@@ -69,7 +69,7 @@ struct mixart_mgr {
 	u32 msg_fifo[MSG_FIFO_SIZE];
 	int msg_fifo_readptr;
 	int msg_fifo_writeptr;
-	atomic_t msg_processed;       /* number of messages to be processed in tasklet */
+	atomic_t msg_processed;       /* number of messages to be processed in irq thread */
 
 	struct mutex lock;              /* interrupt lock */
 	struct mutex msg_lock;		/* mailbox lock */
-- 
2.16.4

