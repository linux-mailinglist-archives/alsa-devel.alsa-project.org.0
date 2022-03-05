Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2164CE4D1
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Mar 2022 13:37:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0BC21A23;
	Sat,  5 Mar 2022 13:36:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0BC21A23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646483830;
	bh=4MmrkZcyuhaHp6ojfjQwk+Ht0UeGbPGrGmKrrIJFq/4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d9nMLsvzR97lvNrkzAhGqvYVcD7J9wJGF15QPmYO9EB9uJLH7JHEKvxo9n3uoScZV
	 LOqKGHyqcKJvqhc2qosXyywt3rw0OPi1n8hX0xj0ENocE+dcXeSXtgpqOH1AT+IpeH
	 oL2Ipg+PeeBJQTTFCYzpVD4kvkHpyTYmlPrxoCBY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E212F8025D;
	Sat,  5 Mar 2022 13:36:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E099F80237; Sat,  5 Mar 2022 13:35:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27490F800E4
 for <alsa-devel@alsa-project.org>; Sat,  5 Mar 2022 13:35:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27490F800E4
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4K9kft1Gv6zBrl9;
 Sat,  5 Mar 2022 20:33:58 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Sat, 5 Mar
 2022 20:35:50 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <AjitKumar.Pandey@amd.com>, <tangmeng@uniontech.com>
Subject: [PATCH -next] ASoC: amd: acp: signedness bug in acp-renoir
Date: Sat, 5 Mar 2022 20:35:19 +0800
Message-ID: <20220305123519.26788-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
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

In renoir_audio_probe() platform_get_irq_byname() may return error,
but i2s_irq now is unsigned int so the error handling is never triggered.

Fixes: 3304a242f45a ("ASoC: amd: Use platform_get_irq_byname() to get the interrupt")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/amd/acp/amd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index 8fd38bf4d3bd..acb50d9fca58 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -96,7 +96,7 @@ struct acp_dev_data {
 	char *name;
 	struct device *dev;
 	void __iomem *acp_base;
-	unsigned int i2s_irq;
+	int i2s_irq;
 
 	/* SOC specific dais */
 	struct snd_soc_dai_driver *dai_driver;
-- 
2.17.1

