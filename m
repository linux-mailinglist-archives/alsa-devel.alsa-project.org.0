Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C1C5283E4
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 14:10:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADB201652;
	Mon, 16 May 2022 14:09:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADB201652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652703033;
	bh=481t56R/EG2IQx2fP0HHlQHWNqg8zsu/2HEzZXZrZ8U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LZJQ0Ub4+e3YjenVfD5HqEjYYe6jkHi9te+LDI5XsutXBwZxY7opWDuST3x0/qlo8
	 auquQSt7Uc35pyv9dnPnwXxYdIXS17saUU8LNr2Wr62niSQlisunsNehwMVsqX5Fc8
	 9n0O0xJ3P7dtnvYGOX74jArvZU0EDEBdbxmHebnE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 128FFF80171;
	Mon, 16 May 2022 14:09:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 906B6F8014B; Mon, 16 May 2022 14:09:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B30CF800D8
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 14:09:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B30CF800D8
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4L1ybc0P3ZzCsYk;
 Mon, 16 May 2022 20:04:28 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 16 May
 2022 20:09:20 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <quic_srivasam@quicinc.com>, <quic_potturu@quicinc.com>
Subject: [PATCH -next] ASoC: codecs: lpass: Fix passing zero to 'PTR_ERR'
Date: Mon, 16 May 2022 20:09:09 +0800
Message-ID: <20220516120909.36356-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, YueHaibing <yuehaibing@huawei.com>,
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

sound/soc/codecs/lpass-macro-common.c:28 lpass_macro_pds_init() warn: passing zero to 'PTR_ERR'
sound/soc/codecs/lpass-macro-common.c:38 lpass_macro_pds_init() warn: passing zero to 'PTR_ERR'
sound/soc/codecs/lpass-macro-common.c:54 lpass_macro_pds_init() warn: passing zero to 'ERR_PTR'

dev_pm_domain_attach_by_name() may return NULL, set 'ret' as
-ENODATA to fix this warning.

Fixes: 1a8ee4cf8418 ("ASoC: codecs: Fix error handling in power domain init and exit handlers")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/codecs/lpass-macro-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-macro-common.c b/sound/soc/codecs/lpass-macro-common.c
index 3c661fd61173..1b9082d237c1 100644
--- a/sound/soc/codecs/lpass-macro-common.c
+++ b/sound/soc/codecs/lpass-macro-common.c
@@ -25,7 +25,7 @@ struct lpass_macro *lpass_macro_pds_init(struct device *dev)
 
 	l_pds->macro_pd = dev_pm_domain_attach_by_name(dev, "macro");
 	if (IS_ERR_OR_NULL(l_pds->macro_pd)) {
-		ret = PTR_ERR(l_pds->macro_pd);
+		ret = l_pds->macro_pd ? PTR_ERR(l_pds->macro_pd) : -ENODATA;
 		goto macro_err;
 	}
 
@@ -35,7 +35,7 @@ struct lpass_macro *lpass_macro_pds_init(struct device *dev)
 
 	l_pds->dcodec_pd = dev_pm_domain_attach_by_name(dev, "dcodec");
 	if (IS_ERR_OR_NULL(l_pds->dcodec_pd)) {
-		ret = PTR_ERR(l_pds->dcodec_pd);
+		ret = l_pds->dcodec_pd ? PTR_ERR(l_pds->dcodec_pd) : -ENODATA;
 		goto dcodec_err;
 	}
 
-- 
2.17.1

