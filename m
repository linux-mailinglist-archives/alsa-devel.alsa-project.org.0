Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF39859F0DB
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Aug 2022 03:26:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D05B161E;
	Wed, 24 Aug 2022 03:25:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D05B161E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661304371;
	bh=ZyDhA/O4UbjCipr3tv9l5MU/KyIdJId3cdwSGbP8yaA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FCFKAid/0PRadKsrWwyy21a/anf57BSfeRykuVVCJE8rLsyKhkXD/GpZn9YzAe8Gb
	 0RDCHE/Pdx9ugu8Dq3S0BZFV98BNCZKbzGxs4zYsrraGXTWDo73KbM2oXQP7x1qy7E
	 eFoLqvQFlSsSix8j6bKPRNcWLWSTRFGh2NuWa/7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBCE4F80529;
	Wed, 24 Aug 2022 03:24:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9050DF80527; Wed, 24 Aug 2022 03:24:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D316F80152;
 Wed, 24 Aug 2022 03:24:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D316F80152
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MC7b61TBrz1N7Hq;
 Wed, 24 Aug 2022 09:21:06 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 24 Aug 2022 09:24:35 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 24 Aug
 2022 09:24:35 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <alsa-devel@alsa-project.org>, <sound-open-firmware@alsa-project.org>
Subject: [PATCH -next 2/2] ASoC: SOF: imx8ulp: add missing of_node_put() in
 imx8ulp_probe()
Date: Wed, 24 Aug 2022 09:32:34 +0800
Message-ID: <20220824013234.375738-2-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220824013234.375738-1-yangyingliang@huawei.com>
References: <20220824013234.375738-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Cc: peng.zhang_8@nxp.com, broonie@kernel.org, daniel.baluta@nxp.com,
 shengjiu.wang@nxp.com
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

After using 'res_node' returned by of_parse_phandle(), of_node_put()
need be called to decrease the refcount.

Fixes: fb5319af6ad8 ("ASoC: SOF: imx: Add i.MX8ULP HW support")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 sound/soc/sof/imx/imx8ulp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/imx/imx8ulp.c b/sound/soc/sof/imx/imx8ulp.c
index afab7feab5fb..4a562c9856e9 100644
--- a/sound/soc/sof/imx/imx8ulp.c
+++ b/sound/soc/sof/imx/imx8ulp.c
@@ -234,6 +234,7 @@ static int imx8ulp_probe(struct snd_sof_dev *sdev)
 	}
 
 	ret = of_address_to_resource(res_node, 0, &res);
+	of_node_put(res_node);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to get reserved region address\n");
 		goto exit_pdev_unregister;
-- 
2.25.1

