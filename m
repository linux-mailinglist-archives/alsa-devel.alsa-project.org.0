Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDE7254B26
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Aug 2020 18:52:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E548B17FF;
	Thu, 27 Aug 2020 18:51:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E548B17FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598547150;
	bh=QrwSe+9DnLrTYLcJDcZJTNJRHdSTiVWryuiXFRwspD4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cq8I35PffYG8kclZtlY4sotFQynUDDFD56lzL8WRGMSy/UVccckM8umLV6zSJ1blN
	 /8izHRwKjskaMTE+E3duAKbO59a7s5a2i7r/FvbvULK5+ovgdx8Bc0LnBLM5AioZA6
	 loI6oang8MKd1zzOTAYkUj7XgRtWsdSzpsacu+0Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14C22F800EB;
	Thu, 27 Aug 2020 18:50:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADD4EF80269; Tue, 25 Aug 2020 14:06:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33A57F80245
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 14:06:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33A57F80245
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 45575E51671AF449BBA3;
 Tue, 25 Aug 2020 20:06:00 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Tue, 25 Aug 2020
 20:05:52 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <timur@kernel.org>, <nicoleotsuka@gmail.com>, <Xiubo.Lee@gmail.com>,
 <festevam@gmail.com>, <shengjiu.wang@gmail.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
 <linux-imx@nxp.com>, <xobs@kosagi.com>
Subject: [PATCH 1/2] ASoC: fsl: imx-es8328: add missing kfree() call in
 imx_es8328_probe()
Date: Tue, 25 Aug 2020 20:05:30 +0800
Message-ID: <20200825120531.1479304-2-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200825120531.1479304-1-yukuai3@huawei.com>
References: <20200825120531.1479304-1-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 27 Aug 2020 18:50:46 +0200
Cc: alsa-devel@alsa-project.org, yi.zhang@huawei.com,
 linux-kernel@vger.kernel.org, yukuai@huawei.com, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
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

If memory allocation for 'data' or 'comp' succeed, imx_es8328_probe()
doesn't have corresponding kfree() in exception handling. Thus add
kfree() for this function implementation.

Fixes: 7e7292dba215 ("ASoC: fsl: add imx-es8328 machine driver")
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 sound/soc/fsl/imx-es8328.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/imx-es8328.c b/sound/soc/fsl/imx-es8328.c
index 15a27a2cd0ca..8f71ed3a6f75 100644
--- a/sound/soc/fsl/imx-es8328.c
+++ b/sound/soc/fsl/imx-es8328.c
@@ -151,7 +151,7 @@ static int imx_es8328_probe(struct platform_device *pdev)
 	comp = devm_kzalloc(dev, 3 * sizeof(*comp), GFP_KERNEL);
 	if (!comp) {
 		ret = -ENOMEM;
-		goto fail;
+		goto free_data;
 	}
 
 	data->dev = dev;
@@ -182,12 +182,12 @@ static int imx_es8328_probe(struct platform_device *pdev)
 	ret = snd_soc_of_parse_card_name(&data->card, "model");
 	if (ret) {
 		dev_err(dev, "Unable to parse card name\n");
-		goto fail;
+		goto free_comp;
 	}
 	ret = snd_soc_of_parse_audio_routing(&data->card, "audio-routing");
 	if (ret) {
 		dev_err(dev, "Unable to parse routing: %d\n", ret);
-		goto fail;
+		goto free_comp;
 	}
 	data->card.num_links = 1;
 	data->card.owner = THIS_MODULE;
@@ -196,10 +196,14 @@ static int imx_es8328_probe(struct platform_device *pdev)
 	ret = snd_soc_register_card(&data->card);
 	if (ret) {
 		dev_err(dev, "Unable to register: %d\n", ret);
-		goto fail;
+		goto free_comp;
 	}
 
 	platform_set_drvdata(pdev, data);
+free_comp:
+	kfree(comp);
+free_data:
+	kfree(data);
 fail:
 	of_node_put(ssi_np);
 	of_node_put(codec_np);
-- 
2.25.4

