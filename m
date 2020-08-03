Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 024DB23A8B5
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 16:41:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94AFD3E;
	Mon,  3 Aug 2020 16:41:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94AFD3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596465710;
	bh=WDmrYolz2PwS4yxkjbUZRfYVntTjmKfYhgUZ0xw7UTA=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Kbqkk0Jv0w1JTIilmJFnzVgBeVoBrVgToVt44TmL+zP8Kt+ekc1xCnvSYExDcfe+1
	 veOv4QaKaqFtfDwGUNdudL/4my3z9kAqPkUcIx+VUFaIY5TS3tMMrEuvA4YGJuW6S+
	 BWcIYsveZupsOmlaxuwmWXPge4Vil1N6FFxnZ+lM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE844F80234;
	Mon,  3 Aug 2020 16:40:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3913BF80218; Mon,  3 Aug 2020 16:40:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9910F800B7
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 16:40:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9910F800B7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2C3C4B607
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 14:40:15 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: echoaduio: Drop superfluous volatile modifier
Date: Mon,  3 Aug 2020 16:39:58 +0200
Message-Id: <20200803143958.24324-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
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

The dsp_registers field of struct echoaduio has the volatile modifier,
but it's basically superfluous; the field is accessed only for the
base pointer of readl() and writel(), hence marking with __iomem alone
should suffice.  OTOH, having the volatile prefix causes a compile
warning like:
  sound/pci/echoaudio/echoaudio.c:1878:14: warning: passing argument 1 of 'iounmap' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]

So it's better to drop this superfluous modifier.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/echoaudio/echoaudio.c | 3 +--
 sound/pci/echoaudio/echoaudio.h | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index 6aeb99aa2414..1b7a67ccabce 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -1950,8 +1950,7 @@ static int snd_echo_create(struct snd_card *card,
 		snd_echo_free(chip);
 		return -EBUSY;
 	}
-	chip->dsp_registers = (volatile u32 __iomem *)
-		ioremap(chip->dsp_registers_phys, sz);
+	chip->dsp_registers = ioremap(chip->dsp_registers_phys, sz);
 	if (!chip->dsp_registers) {
 		dev_err(chip->card->dev, "ioremap failed\n");
 		snd_echo_free(chip);
diff --git a/sound/pci/echoaudio/echoaudio.h b/sound/pci/echoaudio/echoaudio.h
index 30c640931f1e..0afe13f7b6e5 100644
--- a/sound/pci/echoaudio/echoaudio.h
+++ b/sound/pci/echoaudio/echoaudio.h
@@ -419,7 +419,7 @@ struct echoaudio {
 	short asic_code;		/* Current ASIC code */
 	u32 comm_page_phys;			/* Physical address of the
 						 * memory seen by DSP */
-	volatile u32 __iomem *dsp_registers;	/* DSP's register base */
+	u32 __iomem *dsp_registers;		/* DSP's register base */
 	u32 active_mask;			/* Chs. active mask or
 						 * punks out */
 #ifdef CONFIG_PM_SLEEP
-- 
2.16.4

