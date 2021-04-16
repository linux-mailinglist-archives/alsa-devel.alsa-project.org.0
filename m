Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B9C361CE6
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 12:01:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A27BF86E;
	Fri, 16 Apr 2021 12:00:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A27BF86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618567293;
	bh=OXAZzQ96o10Jv0EEugqf/9Ad1BMpIoFrFz15dWe/lo0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mfTOvRWwSRt/GKlIyZruhT6Ew3sDvGlfdRu+hUkpESIFIpWbXoKSL15nKPwj+krtH
	 J/ikCEr1WGgyrPSDcvb/Prin3MXPDz8zAHxhCaGuVzx+GvTIHv31uNhdiZwMJs7nRO
	 yAnKBNmC66Gt7jXWZ3/nBcwMgPj5wE8j/Z0+yjLM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8693F80271;
	Fri, 16 Apr 2021 12:00:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15720F8025B; Fri, 16 Apr 2021 12:00:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6448F800FF
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 12:00:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6448F800FF
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R481e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=5; SR=0; TI=SMTPD_---0UVjzO5K_1618567200; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0UVjzO5K_1618567200) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 16 Apr 2021 18:00:01 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: perex@perex.cz
Subject: [PATCH] ALSA: isa: Fix inconsistent indenting
Date: Fri, 16 Apr 2021 17:59:58 +0800
Message-Id: <1618567198-5120-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Cc: alsa-devel@alsa-project.org, Yang Li <yang.lee@linux.alibaba.com>,
 tiwai@suse.com, linux-kernel@vger.kernel.org
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

Kernel test robot throws below warning ->

smatch warnings:
sound/isa/opti9xx/opti92x-ad1848.c:191 snd_opti9xx_init() warn:
inconsistent indenting
sound/isa/opti9xx/opti92x-ad1848.c:488 snd_opti9xx_init() warn:
inconsistent indenting

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 sound/isa/opti9xx/opti92x-ad1848.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/isa/opti9xx/opti92x-ad1848.c b/sound/isa/opti9xx/opti92x-ad1848.c
index 08e61d9..234f023 100644
--- a/sound/isa/opti9xx/opti92x-ad1848.c
+++ b/sound/isa/opti9xx/opti92x-ad1848.c
@@ -188,7 +188,7 @@ static int snd_opti9xx_init(struct snd_opti9xx *chip,
 		chip->mc_base_size = opti9xx_mc_size[hardware];
 	}
 #else
-		chip->mc_base_size = opti9xx_mc_size[hardware];
+	chip->mc_base_size = opti9xx_mc_size[hardware];
 #endif
 
 	switch (hardware) {
@@ -485,7 +485,7 @@ static int snd_opti9xx_configure(struct snd_opti9xx *chip,
 #endif	/* CS4231 || OPTi93X */
 
 #ifndef OPTi93X
-	 outb(irq_bits << 3 | dma_bits, chip->wss_base);
+	outb(irq_bits << 3 | dma_bits, chip->wss_base);
 #else /* OPTi93X */
 	snd_opti9xx_write(chip, OPTi9XX_MC_REG(3), (irq_bits << 3 | dma_bits));
 #endif /* OPTi93X */
-- 
1.8.3.1

