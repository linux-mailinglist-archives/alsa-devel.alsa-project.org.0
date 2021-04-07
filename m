Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD48356495
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Apr 2021 08:55:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE2461676;
	Wed,  7 Apr 2021 08:55:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE2461676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617778551;
	bh=K3VNAhQjdLw9VpW8sWkJE0mxfTmufpKjXtAun0MnsS4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VBIEqDsBFIxaqu1rO2ww4yL6A051zG/fnkkO9humbawn0RydBVLPMY/wxx7XOwF8e
	 HZuEYWe41bZRsLI6/KM3MOySqRHaNDDBQrfdDEGB1JsnQR2+kRt8cm1roqC84dvH5c
	 9zz6v4+k1KXMUt2K5kEpHZ0Dd64ziOLg6G8vQsHw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAAFDF8016D;
	Wed,  7 Apr 2021 08:54:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 773FCF8016A; Wed,  7 Apr 2021 08:54:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from zju.edu.cn (spam.zju.edu.cn [61.164.42.155])
 by alsa1.perex.cz (Postfix) with ESMTP id EF75CF80124
 for <alsa-devel@alsa-project.org>; Wed,  7 Apr 2021 08:54:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF75CF80124
Received: from localhost.localdomain (unknown [10.192.24.118])
 by mail-app3 (Coremail) with SMTP id cC_KCgBnn9QKV21g7hvcAA--.15055S4;
 Wed, 07 Apr 2021 14:54:06 +0800 (CST)
From: Dinghao Liu <dinghao.liu@zju.edu.cn>
To: dinghao.liu@zju.edu.cn,
	kjlu@umn.edu
Subject: [PATCH] ASoC: codecs: Fix rumtime PM imbalance in tas2552_probe
Date: Wed,  7 Apr 2021 14:54:00 +0800
Message-Id: <20210407065402.17729-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cC_KCgBnn9QKV21g7hvcAA--.15055S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Cry5Xw4kXF18ZFy5Ar15CFg_yoW8Xw4rp3
 y8XFZ5KF4UJryxC3yqya1kXF9Y9Fy3Wr4UA34DK3WUA3WkJ3WkKF4UKry2qF4IqrykuFyD
 WryUtFWayF1Yyw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvG1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJr0_GcWl84ACjcxK6I8E
 87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
 8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
 Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
 xGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82IY
 c2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uw4UJr1UMxC20s026xCaFVCjc4AY6r1j6r
 4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
 67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
 x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY
 6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
 73UjIFyTuYvjfU5sjjDUUUU
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgoGBlZdtTQGhAAdsd
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Mark Brown <broonie@kernel.org>,
 "Alexander A. Klimov" <grandmaster@al2klimov.de>
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

There is a rumtime PM imbalance between the error handling path
after devm_snd_soc_register_component() and all other error
handling paths. Fix this by moving PM runtime decrement to the
end of the function.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 sound/soc/codecs/tas2552.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/tas2552.c b/sound/soc/codecs/tas2552.c
index bd00c35116cd..52de6f7b4227 100644
--- a/sound/soc/codecs/tas2552.c
+++ b/sound/soc/codecs/tas2552.c
@@ -718,13 +718,6 @@ static int tas2552_probe(struct i2c_client *client,
 		return ret;
 	}
 
-	pm_runtime_set_active(&client->dev);
-	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
-	pm_runtime_use_autosuspend(&client->dev);
-	pm_runtime_enable(&client->dev);
-	pm_runtime_mark_last_busy(&client->dev);
-	pm_runtime_put_sync_autosuspend(&client->dev);
-
 	dev_set_drvdata(&client->dev, data);
 
 	ret = devm_snd_soc_register_component(&client->dev,
@@ -733,6 +726,13 @@ static int tas2552_probe(struct i2c_client *client,
 	if (ret < 0)
 		dev_err(&client->dev, "Failed to register component: %d\n", ret);
 
+	pm_runtime_set_active(&client->dev);
+	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
+	pm_runtime_use_autosuspend(&client->dev);
+	pm_runtime_enable(&client->dev);
+	pm_runtime_mark_last_busy(&client->dev);
+	pm_runtime_put_sync_autosuspend(&client->dev);
+
 	return ret;
 }
 
-- 
2.17.1

