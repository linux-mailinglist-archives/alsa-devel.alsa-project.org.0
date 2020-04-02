Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2F019C636
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Apr 2020 17:44:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC2B41674;
	Thu,  2 Apr 2020 17:44:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC2B41674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585842291;
	bh=/x8D6uK4g2xZ1i200qVDIqAYjTMEllQKn+gVt3KqJQU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QmsaDUnvNI57qyXD9vosISQSO/Zdd3sDl6CAT+3yTe4k5NJ4pFwrOGVXjfLXaXNze
	 IZQSi9/bhzYS7Dg57OPVbVn2aIjYML1MKSOd16zpt9/KjkMaXx0B1FkF/wpV7WyqNm
	 UqVoKqvX0wRaMRulRJeEVgrf6WHz0fH1yF7OO3vs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F1CAF802E8;
	Thu,  2 Apr 2020 17:37:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3241F80148; Thu,  2 Apr 2020 13:27:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cmccmta3.chinamobile.com (cmccmta3.chinamobile.com
 [221.176.66.81])
 by alsa1.perex.cz (Postfix) with ESMTP id 88258F80088
 for <alsa-devel@alsa-project.org>; Thu,  2 Apr 2020 13:26:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88258F80088
Received: from spf.mail.chinamobile.com (unknown[172.16.121.17]) by
 rmmx-syy-dmz-app12-12012 (RichMail) with SMTP id 2eec5e85ca68edc-5df98;
 Thu, 02 Apr 2020 19:20:08 +0800 (CST)
X-RM-TRANSID: 2eec5e85ca68edc-5df98
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.146])
 by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee95e85ca66ca8-bc65c;
 Thu, 02 Apr 2020 19:20:08 +0800 (CST)
X-RM-TRANSID: 2ee95e85ca66ca8-bc65c
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: perex@perex.cz,
	tiwai@suse.com,
	nicolas.ferre@microchip.com
Subject: [PATCH] ALSA:atmel:Use platform_get_irq_optional()
Date: Thu,  2 Apr 2020 19:21:35 +0800
Message-Id: <20200402112135.18604-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Apr 2020 17:37:21 +0200
Cc: alexandre.belloni@bootlin.com, Tang Bin <tangbin@cmss.chinamobile.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 ludovic.desroches@microchip.com, linux-arm-kernel@lists.infradead.org
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

In order to simply code,because platform_get_irq() already has
dev_err() message.

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/atmel/ac97c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
index a1dce9725..25cfd5710 100644
--- a/sound/atmel/ac97c.c
+++ b/sound/atmel/ac97c.c
@@ -715,7 +715,7 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 		return -ENXIO;
 	}
 
-	irq = platform_get_irq(pdev, 0);
+	irq = platform_get_irq_optional(pdev, 0);
 	if (irq < 0) {
 		dev_dbg(&pdev->dev, "could not get irq: %d\n", irq);
 		return irq;
-- 
2.20.1.windows.1



