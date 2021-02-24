Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7479323537
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Feb 2021 02:32:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3C90167B;
	Wed, 24 Feb 2021 02:31:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3C90167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614130327;
	bh=rsvD9eHAYeJihUFa2deZVZPuu8bBVJgaeM9f7kezj3c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=F064meIaD1a00SHJ9ywZezlKySqp8oGKEWzbj2ND4xqTYKbVcqxQWtNN/A7U/5IFO
	 W2ffVSOdJyWYoFUTItQgO+CZErLLM4rcWSjYIec2AA92H3unnYpwfrG4YcTID2TwpM
	 OApQGUQdeR4/g+obV6HzsM+zuvq3UJvvv82kr7C4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31E4FF8016D;
	Wed, 24 Feb 2021 02:30:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBC15F8016A; Wed, 24 Feb 2021 02:29:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBC25F80167
 for <alsa-devel@alsa-project.org>; Wed, 24 Feb 2021 02:29:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBC25F80167
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DldZM5G9Cz16950;
 Wed, 24 Feb 2021 09:27:23 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Wed, 24 Feb 2021 09:28:52 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Hulk Robot <hulkci@huawei.com>, Jaroslav Kysela <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>, Lauri Kasanen <cand@gmx.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH -next] sound: n64: Fix return value check in n64audio_probe()
Date: Wed, 24 Feb 2021 01:38:03 +0000
Message-ID: <20210224013803.2146953-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.102.38]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, Wei Yongjun <weiyongjun1@huawei.com>,
 linux-kernel@vger.kernel.org
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

In case of error, the function devm_platform_ioremap_resource()
returns ERR_PTR() and never returns NULL. The NULL test in the
return value check should be replaced with IS_ERR().

Fixes: 1448f8acf4cc ("sound: Add n64 driver")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 sound/mips/snd-n64.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/mips/snd-n64.c b/sound/mips/snd-n64.c
index ca6b4b99da98..e35e93157755 100644
--- a/sound/mips/snd-n64.c
+++ b/sound/mips/snd-n64.c
@@ -312,14 +312,14 @@ static int __init n64audio_probe(struct platform_device *pdev)
 	}
 
 	priv->mi_reg_base = devm_platform_ioremap_resource(pdev, 0);
-	if (!priv->mi_reg_base) {
-		err = -EINVAL;
+	if (IS_ERR(priv->mi_reg_base)) {
+		err = PTR_ERR(priv->mi_reg_base);
 		goto fail_dma_alloc;
 	}
 
 	priv->ai_reg_base = devm_platform_ioremap_resource(pdev, 1);
-	if (!priv->ai_reg_base) {
-		err = -EINVAL;
+	if (IS_ERR(priv->ai_reg_base)) {
+		err = PTR_ERR(priv->ai_reg_base);
 		goto fail_dma_alloc;
 	}
 

