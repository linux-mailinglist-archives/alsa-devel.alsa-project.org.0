Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F6D1C8358
	for <lists+alsa-devel@lfdr.de>; Thu,  7 May 2020 09:20:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 059F217E1;
	Thu,  7 May 2020 09:19:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 059F217E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588836015;
	bh=lD0HYUGGlJ+UhTGOvkMx/d4Ny2ZqQMesUIOI5jA2qr8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bm5gHAqlfZqadH7CRLoTAE3H2hSWgiL4/bFiuzb0vog9Jm30iw4jwFNJsEWV988hb
	 L2nFa/GIAN0grBhwsOoya2fIqF4oPkdlpeXk+bN29RR/c83ap912XM0JjKgNOxsCl1
	 WEBCAQvW3/g5j9iCuQbJLV7Rl75UdBzaSKdxvq9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F901F8029A;
	Thu,  7 May 2020 09:16:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20EB0F8015F; Thu,  7 May 2020 08:43:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91711F800AD
 for <alsa-devel@alsa-project.org>; Thu,  7 May 2020 08:43:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91711F800AD
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 42318413693EF0A90151;
 Thu,  7 May 2020 14:42:54 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 7 May 2020 14:42:45 +0800
From: Samuel Zou <zou_wei@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>
Subject: [PATCH -next] ALSA: portman2x4: Use bitwise instead of arithmetic
 operator for flags
Date: Thu, 7 May 2020 14:48:55 +0800
Message-ID: <1588834135-14842-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 07 May 2020 09:16:08 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Samuel Zou <zou_wei@huawei.com>
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

Fix the following coccinelle warning:

sound/drivers/portman2x4.c:460:34-35: WARNING: sum of probable bitmasks, consider |

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Samuel Zou <zou_wei@huawei.com>
---
 sound/drivers/portman2x4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/drivers/portman2x4.c b/sound/drivers/portman2x4.c
index ecefa7c..38603cb 100644
--- a/sound/drivers/portman2x4.c
+++ b/sound/drivers/portman2x4.c
@@ -457,7 +457,7 @@ static int portman_probe(struct parport *p)
 
 	/* Set for RXDATA0 where no damage will be done. */
 	/* 5 */
-	parport_write_control(p, RXDATA0 + STROBE);	/* Write Strobe=1 to command reg. */
+	parport_write_control(p, RXDATA0 | STROBE);	/* Write Strobe=1 to command reg. */
 
 	/* 6 */
 	if ((parport_read_status(p) & ESTB) != ESTB)
-- 
2.6.2

