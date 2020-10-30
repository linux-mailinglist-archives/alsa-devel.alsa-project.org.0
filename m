Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB3C2A3DF3
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 08:47:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C97C16C0;
	Tue,  3 Nov 2020 08:46:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C97C16C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604389628;
	bh=/291h87g6Lm0Cx/bEUdDLObeGt9RL5v9y7XeTphzwQk=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=T2c1h/yO9Y4HeRsAifDjat5pPG0CJiTUhxXNdn0POwUEEIHungWDXiVszjEn9hAxw
	 hIOsbZV1y0fZj4cyCH19aqRO3hIimcZUY2LhmJxRlClpiL0nY+n0+w2AAutC9W2rL9
	 KYw35NGVUpEWNnFn6e85sMp6QWfktziNprkN+2jI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06827F80279;
	Tue,  3 Nov 2020 08:45:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BAF9F801D5; Fri, 30 Oct 2020 16:26:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5A55F800C0
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 16:26:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5A55F800C0
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CN5jm4vPWzhb43;
 Fri, 30 Oct 2020 23:25:48 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Fri, 30 Oct 2020
 23:25:41 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <peter.ujfalusi@ti.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <lgirdwood@gmail.com>, <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: ti: davinci-mcasp: fix possible reference leak in
 __davinci_mcasp_set_clkdiv
Date: Fri, 30 Oct 2020 23:36:26 +0800
Message-ID: <20201030153626.94150-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:45:21 +0100
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

pm_runtime_get_sync() will increment pm usage counter whatever it
does. Forgetting to call pm_runtime_put will result in reference
leak in __davinci_mcasp_set_clkdiv, so we should fix it.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 sound/soc/ti/davinci-mcasp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index a6b72ad53b43..4b46dd827f3f 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -607,6 +607,8 @@ static int davinci_mcasp_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 static int __davinci_mcasp_set_clkdiv(struct davinci_mcasp *mcasp, int div_id,
 				      int div, bool explicit)
 {
+	int ret = 0;
+
 	pm_runtime_get_sync(mcasp->dev);
 	switch (div_id) {
 	case MCASP_CLKDIV_AUXCLK:			/* MCLK divider */
@@ -644,11 +646,11 @@ static int __davinci_mcasp_set_clkdiv(struct davinci_mcasp *mcasp, int div_id,
 		break;
 
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
 	}
 
 	pm_runtime_put(mcasp->dev);
-	return 0;
+	return ret;
 }
 
 static int davinci_mcasp_set_clkdiv(struct snd_soc_dai *dai, int div_id,
-- 
2.17.1

