Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F5039CF88
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Jun 2021 16:32:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F51B16E1;
	Sun,  6 Jun 2021 16:32:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F51B16E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622989978;
	bh=+g6XJ78yD9/ia5egf6GCrOqVh2rY6ppqtr4n5ZPqv6s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gVo5R/CgXMdbgY5kSe4Q5btu8IonNhzel7iY4cJdQh9xfdR6Qg6cIyFRBp34us37L
	 Y4kmduKj21bn2sCUSVGotWGztkpigBjNpRC2nhBHbDdnhYjF7mQ+Fm5gB/pZoUHZOm
	 XSiVDtR0MH6t70kv+Euz19VcEFPsXel8AbbAEYK8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D68FCF80227;
	Sun,  6 Jun 2021 16:31:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BCC0F80218; Sun,  6 Jun 2021 16:31:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp02.smtpout.orange.fr
 [80.12.242.124])
 (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BBC3F80103
 for <alsa-devel@alsa-project.org>; Sun,  6 Jun 2021 16:31:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BBC3F80103
Received: from localhost.localdomain ([86.243.172.93]) by mwinf5d04 with ME
 id DqXB2500121Fzsu03qXBtD; Sun, 06 Jun 2021 16:31:18 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 06 Jun 2021 16:31:18 +0200
X-ME-IP: 86.243.172.93
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com, pierre-louis.bossart@linux.intel.com,
 lumi.lee@mediatek.com, kaichieh.chuang@mediatek.com
Subject: [PATCH] ASoC: mediatek: mtk-btcvsd: Fix an error handling path in
 'mtk_btcvsd_snd_probe()'
Date: Sun,  6 Jun 2021 16:31:09 +0200
Message-Id: <0c2ba562c3364e61bfbd5b3013a99dfa0d9045d7.1622989685.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

If an error occurs after a successful 'of_iomap()' call, it must be undone
by a corresponding 'iounmap()' call, as already done in the remove
function.

While at it, remove the useless initialization of 'ret' at the beginning of
the function.

Fixes: 4bd8597dc36c ("ASoC: mediatek: add btcvsd driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This is NOT compile tested.

Even if CONFIG_SND_SOC_MTK_BTCVSD is correctly set in my .config file, I've
not been able to have this file compiled.
---
 sound/soc/mediatek/common/mtk-btcvsd.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-btcvsd.c b/sound/soc/mediatek/common/mtk-btcvsd.c
index f85b5ea180ec..d884bb7c0fc7 100644
--- a/sound/soc/mediatek/common/mtk-btcvsd.c
+++ b/sound/soc/mediatek/common/mtk-btcvsd.c
@@ -1281,7 +1281,7 @@ static const struct snd_soc_component_driver mtk_btcvsd_snd_platform = {
 
 static int mtk_btcvsd_snd_probe(struct platform_device *pdev)
 {
-	int ret = 0;
+	int ret;
 	int irq_id;
 	u32 offset[5] = {0, 0, 0, 0, 0};
 	struct mtk_btcvsd_snd *btcvsd;
@@ -1337,7 +1337,8 @@ static int mtk_btcvsd_snd_probe(struct platform_device *pdev)
 	btcvsd->bt_sram_bank2_base = of_iomap(dev->of_node, 1);
 	if (!btcvsd->bt_sram_bank2_base) {
 		dev_err(dev, "iomap bt_sram_bank2_base fail\n");
-		return -EIO;
+		ret = -EIO;
+		goto unmap_pkv_err;
 	}
 
 	btcvsd->infra = syscon_regmap_lookup_by_phandle(dev->of_node,
@@ -1345,7 +1346,8 @@ static int mtk_btcvsd_snd_probe(struct platform_device *pdev)
 	if (IS_ERR(btcvsd->infra)) {
 		dev_err(dev, "cannot find infra controller: %ld\n",
 			PTR_ERR(btcvsd->infra));
-		return PTR_ERR(btcvsd->infra);
+		ret = PTR_ERR(btcvsd->infra);
+		goto unmap_bank2_err;
 	}
 
 	/* get offset */
@@ -1354,7 +1356,7 @@ static int mtk_btcvsd_snd_probe(struct platform_device *pdev)
 					 ARRAY_SIZE(offset));
 	if (ret) {
 		dev_warn(dev, "%s(), get offset fail, ret %d\n", __func__, ret);
-		return ret;
+		goto unmap_bank2_err;
 	}
 	btcvsd->infra_misc_offset = offset[0];
 	btcvsd->conn_bt_cvsd_mask = offset[1];
@@ -1373,8 +1375,18 @@ static int mtk_btcvsd_snd_probe(struct platform_device *pdev)
 	mtk_btcvsd_snd_set_state(btcvsd, btcvsd->tx, BT_SCO_STATE_IDLE);
 	mtk_btcvsd_snd_set_state(btcvsd, btcvsd->rx, BT_SCO_STATE_IDLE);
 
-	return devm_snd_soc_register_component(dev, &mtk_btcvsd_snd_platform,
-					       NULL, 0);
+	ret = devm_snd_soc_register_component(dev, &mtk_btcvsd_snd_platform,
+					      NULL, 0);
+	if (ret)
+		goto unmap_bank2_err;
+
+	return 0;
+
+unmap_bank2_err:
+	iounmap(btcvsd->bt_sram_bank2_base);
+unmap_pkv_err:
+	iounmap(btcvsd->bt_pkv_base);
+	return ret;
 }
 
 static int mtk_btcvsd_snd_remove(struct platform_device *pdev)
-- 
2.30.2

