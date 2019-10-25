Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7017E479B
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 11:43:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40D3A1797;
	Fri, 25 Oct 2019 11:42:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40D3A1797
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571996604;
	bh=K9t/s1FcMjm8zmZfs/ZjYKUOsYcwgaBnAh6NshzKZZI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sx3lwUR1MzJxKzij3IYa8Uh4fe/bgGORj9wIb3z6S8tdU/pzEIJ4GZqpP2XilvLbN
	 9O1SdEMJ/RMbtscfAoPIRhIMNpAufKTyPSn3biqOyeHbooj9rkA75SwdJ82khVS3bX
	 aEW6cg3T/Tig/ogpLGlHSuxp4atMBL1Qh9ac8fZE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76D1FF803A6;
	Fri, 25 Oct 2019 11:41:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AD35F8036F; Fri, 25 Oct 2019 11:41:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F313F802A0
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 11:41:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F313F802A0
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 22BAF41C31F77EDDEC00;
 Fri, 25 Oct 2019 17:41:23 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Fri, 25 Oct 2019
 17:41:13 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <ville.syrjala@linux.intel.com>,
 <chris@chris-wilson.co.uk>, <allison@lohutok.net>,
 <alexios.zavras@intel.com>, <yuehaibing@huawei.com>, <tglx@linutronix.de>
Date: Fri, 25 Oct 2019 17:39:05 +0800
Message-ID: <20191025093905.14888-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH -next] ALSA: intel_hdmi: Remove dev_err() on
	platform_get_irq() failure
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

platform_get_irq() will call dev_err() itself on failure,
so there is no need for the driver to also do this.
This is detected by coccinelle.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/x86/intel_hdmi_audio.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/x86/intel_hdmi_audio.c b/sound/x86/intel_hdmi_audio.c
index 5fd4e32..cd389d2 100644
--- a/sound/x86/intel_hdmi_audio.c
+++ b/sound/x86/intel_hdmi_audio.c
@@ -1708,10 +1708,8 @@ static int hdmi_lpe_audio_probe(struct platform_device *pdev)
 
 	/* get resources */
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "Could not get irq resource: %d\n", irq);
+	if (irq < 0)
 		return irq;
-	}
 
 	res_mmio = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res_mmio) {
-- 
2.7.4


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
