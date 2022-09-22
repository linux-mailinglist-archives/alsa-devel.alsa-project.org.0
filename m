Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 334125E6000
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Sep 2022 12:36:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2D3E82A;
	Thu, 22 Sep 2022 12:35:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2D3E82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663842978;
	bh=hzZs/1aO3k2jUVZmRGLQHJ4A3hmjRyWqEEyzQ3TI83U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WRnqCrc4HQPBravR0xNtxGkn1pEb+q82tLagIDLOrb2/mbYSTwFIb7vl+c31+rHjR
	 P6sA4iuAyMgv8JHjuGwir6lNSnoxjHqjMUHwRXNG4TOQEfWM5gvd2W4KUr7HNEwvhh
	 W1OgQ5QskjlixqXi74g6yLsHQdb1zZBslmGHMiiE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32011F8030F;
	Thu, 22 Sep 2022 12:35:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3FD0F8027B; Thu, 22 Sep 2022 12:35:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D20C3F8012A
 for <alsa-devel@alsa-project.org>; Thu, 22 Sep 2022 12:35:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D20C3F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="em+faPkZ"
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 67BC9660205E;
 Thu, 22 Sep 2022 11:35:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663842908;
 bh=hzZs/1aO3k2jUVZmRGLQHJ4A3hmjRyWqEEyzQ3TI83U=;
 h=From:To:Cc:Subject:Date:From;
 b=em+faPkZ7TtqBZu1q7U/Y6wsY99Kxt1vP2PmaRUyKax9hdplgIpEq7HJF3MmnmHvf
 p61YNHBnMc8tMvKcHsqcIGk9PjhQEVCzGXBUbQd5W6ZjywNpGFe6jSlVvIYc5YX993
 GnrCGFjoSlPwBzoLRhInnohevwMN1v297YziY6wJbv46usLjXgL6W4VRxJUvv/nuci
 FI0aisjls/vNE3Z8RIFnFLPbZCCbmnTglrseptlcFA+9pRytTAj4QM51H+8iiWKhoW
 Ap0cII5uj7HzmrKKH9PTg+OqQT6d0dm9WXVuAIOkCzDjISeUt22W3f89cpeBM/4mOr
 lwHZgqTqi3B5g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Subject: [PATCH] ASoC: mediatek: mt8195-mt6359: Use snd_soc_pm_ops instead of
 custom ops
Date: Thu, 22 Sep 2022 12:35:02 +0200
Message-Id: <20220922103502.49981-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, tzungbi@google.com, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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

It is possible to use the standard snd_soc_pm_ops for this card:
remove the custom mt8195_mt6359_pm_ops.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8195/mt8195-mt6359.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index 961e769602d6..23bdde6acd1c 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -1532,16 +1532,11 @@ static const struct of_device_id mt8195_mt6359_dt_match[] = {
 	{},
 };
 
-static const struct dev_pm_ops mt8195_mt6359_pm_ops = {
-	.poweroff = snd_soc_poweroff,
-	.restore = snd_soc_resume,
-};
-
 static struct platform_driver mt8195_mt6359_driver = {
 	.driver = {
 		.name = "mt8195_mt6359",
 		.of_match_table = mt8195_mt6359_dt_match,
-		.pm = &mt8195_mt6359_pm_ops,
+		.pm = &snd_soc_pm_ops,
 	},
 	.probe = mt8195_mt6359_dev_probe,
 };
-- 
2.37.2

