Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AD034E37A
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Mar 2021 10:48:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72D2B1614;
	Tue, 30 Mar 2021 10:48:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72D2B1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617094138;
	bh=5Ilm/rUSajrzN2749gIk43pBgtjV9hfhn9rsu6w7PBc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p6YLSKCIxFY6ScM6wYrLyCTmcGPTyz9Yfoe2eip7BsE/NSMN8Ph+E1+4ArYLGXuoD
	 hIiLb6yi93Z5u9TomTEG/LKtb2YQgjBK8dV0S/IH006OGGEZy7WFFM5+pBIDk6Ysag
	 0tuAvtX1YkTLkFe2rwjx0ir284TID+Z5hlnin/Co=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C944CF80141;
	Tue, 30 Mar 2021 10:47:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 661A1F80240; Tue, 30 Mar 2021 10:47:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A1EEF800B9
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 10:47:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A1EEF800B9
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1lRA1m-0004fg-PJ; Tue, 30 Mar 2021 08:47:10 +0000
From: Colin King <colin.king@canonical.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Argus Lin <argus.lin@mediatek.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH][next] ASoC: mediatek: mt6359: Fix spelling mistake "reate" ->
 "create"
Date: Tue, 30 Mar 2021 09:47:10 +0100
Message-Id: <20210330084710.997731-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/codecs/mt6359-accdet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index 0bef6eaad5ad..4222aed013f1 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -1019,7 +1019,7 @@ static int mt6359_accdet_probe(struct platform_device *pdev)
 	priv->jd_workqueue = create_singlethread_workqueue("mt6359_accdet_jd");
 	INIT_WORK(&priv->jd_work, mt6359_accdet_jd_work);
 	if (!priv->jd_workqueue) {
-		dev_err(&pdev->dev, "Failed to reate jack detect workqueue\n");
+		dev_err(&pdev->dev, "Failed to create jack detect workqueue\n");
 		ret = -1;
 		goto err_eint_wq;
 	}
-- 
2.30.2

