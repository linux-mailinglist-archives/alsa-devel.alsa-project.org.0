Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C961180FF
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 08:01:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA6331726;
	Tue, 10 Dec 2019 08:00:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA6331726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575961281;
	bh=fCjfhTe1Pa6MW+3T/Pwn7zGNVIJr8m0TUPXvCZdb9vU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cDKK+b1ueUD6eR6YJH8BoxI0XkUpSXR1WAzpzrupbRVUzaSoMmS6t13ZEgP4jSMRW
	 kTXog2G5N+SIVDfqJILSDakWag3LXc9p5bA6v/zWOfwAd/KaQHzsV1uMohViNUWsfH
	 ceJ+I4kAeXiI/FvGwTvOm0ZbeZSwqCTymxhtXg5M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42FD8F803FE;
	Tue, 10 Dec 2019 07:37:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 814E8F80339; Tue, 10 Dec 2019 07:36:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 034E2F8028B
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 07:35:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 034E2F8028B
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0A254B314
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 06:35:01 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 10 Dec 2019 07:34:37 +0100
Message-Id: <20191210063454.31603-39-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210063454.31603-1-tiwai@suse.de>
References: <20191210063454.31603-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 38/55] ALSA: ymfpci: Support PCM sync_stop
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
 sound/pci/ymfpci/ymfpci_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/ymfpci/ymfpci_main.c b/sound/pci/ymfpci/ymfpci_main.c
index 61604277ae35..3bc92d236508 100644
--- a/sound/pci/ymfpci/ymfpci_main.c
+++ b/sound/pci/ymfpci/ymfpci_main.c
@@ -2371,6 +2371,7 @@ int snd_ymfpci_create(struct snd_card *card,
 		goto free_chip;
 	}
 	chip->irq = pci->irq;
+	card->sync_irq = chip->irq;
 
 	snd_ymfpci_aclink_reset(pci);
 	if (snd_ymfpci_codec_ready(chip, 0) < 0) {
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
