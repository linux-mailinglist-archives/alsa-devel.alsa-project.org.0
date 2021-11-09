Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9035044B58C
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Nov 2021 23:18:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 175E515F2;
	Tue,  9 Nov 2021 23:17:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 175E515F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636496325;
	bh=pVycJHCOHhJHYDGpvWVmOqvqDvlFgZCXvpf4/RBRYyI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IlvpqWXme6Af/5L5NoItL5juQAN7fU+6vUdxnSJ6eFQMUz5blz7MvPhVkusd4d1Zx
	 d/7U5I3Zogsi5tJ1y7ZsaM0h+EX/1HnxsiF8jEk2gOaWb6dMwVH2f1L6KFrzKNk1XR
	 QWkfS5wpdw37bcPVzccSVYNDkx1boWRurIolUoH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57ACAF801D8;
	Tue,  9 Nov 2021 23:17:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4761AF802D2; Tue,  9 Nov 2021 23:17:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAB6EF800C1
 for <alsa-devel@alsa-project.org>; Tue,  9 Nov 2021 23:17:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAB6EF800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jgiM7TRw"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E58DF61350;
 Tue,  9 Nov 2021 22:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636496236;
 bh=pVycJHCOHhJHYDGpvWVmOqvqDvlFgZCXvpf4/RBRYyI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jgiM7TRw0zhuOW4ermPjO1H7C0n/oYZwkSb+hJgEq+GbBKliiFaJ453PyE9YJKPs2
 Tzr3t6q/bhLxmOLEHhzsIIMlmHOSRsvTRE594PE1UbZ/lzkB1ZIwF971F+X1TfjHOM
 ucLUrpAAMyYbeoF+5hoUb5HzhCc8rXDQJvJBIfjmXNElPcFfqb6CnEpqzlCaGjCe1i
 HOkRmPnyBJnKiBwvFMQbWIVUkXnj3xAyAEwYuork1YjMU5I57wbH+S6q4QLXzA7Tpo
 5TDTQI3PF6wBhukRtuernNxOmTQkc1Qoh0oFLZIkwvbckxwIyFo2w+z186R94dAE7W
 AxfOdSwMpms2Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 14/82] ASoC: mediatek: mt8195: Add missing
 of_node_put()
Date: Tue,  9 Nov 2021 17:15:32 -0500
Message-Id: <20211109221641.1233217-14-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211109221641.1233217-1-sashal@kernel.org>
References: <20211109221641.1233217-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 tiwai@suse.com, lgirdwood@gmail.com, Hulk Robot <hulkci@huawei.com>,
 Mark Brown <broonie@kernel.org>, Bixuan Cui <cuibixuan@huawei.com>,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
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

From: Bixuan Cui <cuibixuan@huawei.com>

[ Upstream commit b2fc2c92d2fd34d93268f677e514936f50dd6b5c ]

The platform_node is returned by of_parse_phandle() should have
of_node_put() before return.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
Link: https://lore.kernel.org/r/20210911081246.33867-1-cuibixuan@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
index de09f67c04502..a3fa8efc8f81c 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
@@ -1040,8 +1040,10 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 	}
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
+	if (!priv) {
+		of_node_put(platform_node);
 		return -ENOMEM;
+	}
 
 	snd_soc_card_set_drvdata(card, priv);
 
@@ -1049,6 +1051,8 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 	if (ret)
 		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
 			__func__, ret);
+
+	of_node_put(platform_node);
 	return ret;
 }
 
-- 
2.33.0

