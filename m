Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC71B4EC2FE
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 14:07:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C505192E;
	Wed, 30 Mar 2022 14:06:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C505192E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648642050;
	bh=N7VV4WU4ve5a9mkAhzkgXt2CymUm4Y3tFt0YFfoLEbo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=If9jvic7eSQa2kWOkmV5NlXqHfi2z1PbJBvnkuCjdUpxhIE/ZOjEso2iYhRWEev7y
	 P/zIVDCFNgXYNW/om//xesH/K0eF2d3Fzvme26cB6vpJp7wGJ9/7H/6LARRIen12R0
	 nA1v5JTcdV0J1jvgjf8gd+a9+rI8nl1KwzMje3U8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24EC8F805C8;
	Wed, 30 Mar 2022 13:54:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0CB1F805C8; Wed, 30 Mar 2022 13:54:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4422BF805C6
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:54:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4422BF805C6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DXdIoeDX"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3A6C66170A;
 Wed, 30 Mar 2022 11:54:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0326C340F2;
 Wed, 30 Mar 2022 11:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648641276;
 bh=N7VV4WU4ve5a9mkAhzkgXt2CymUm4Y3tFt0YFfoLEbo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DXdIoeDX0PfKBl0AOK4ma3bF3o7qHxhW+lnX9p9ERAJX5BLiQPSOtaMvrNdYethkB
 j56COJp15mHwaxdIZwF+RQnIebXF/UkEFsoTJhYRZJvmEfz71qxkptjaq2LmJgfzi1
 XBrhZoJrNeb9+7R+aRpj4AWNNKgx0twgHOntmIU3RUsVUVJjwQZx/dNEs3ebwPLdcU
 IgCjbNryV8g3fF4DIQGvKtYre7pt11EqQknDSZIg7nEQBsU7J1MBQalmXB1l8w7vpC
 Fiy8bQk4vaW6hOJ5BRZSANh/sCUnJFuqBT/Hd/Z0sqdZxemM5g4FWxEmSVsuZ4K7hg
 WBboBKvFCeOXg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 17/17] ASoC: ak4642: Use of_device_get_match_data()
Date: Wed, 30 Mar 2022 07:54:06 -0400
Message-Id: <20220330115407.1673214-17-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330115407.1673214-1-sashal@kernel.org>
References: <20220330115407.1673214-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Zeal Robot <zealci@zte.com.cn>, tiwai@suse.com, lgirdwood@gmail.com,
 Minghao Chi <chi.minghao@zte.com.cn>, Mark Brown <broonie@kernel.org>
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

From: Minghao Chi <chi.minghao@zte.com.cn>

[ Upstream commit 835ca59799f5c60b4b54bdc7aa785c99552f63e4 ]

Use of_device_get_match_data() to simplify the code.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
Link: https://lore.kernel.org/r/20220315023226.2118354-1-chi.minghao@zte.com.cn
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/ak4613.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/ak4613.c b/sound/soc/codecs/ak4613.c
index e819dd8c82fd..b6b93c2b7593 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -500,15 +500,10 @@ static int ak4613_i2c_probe(struct i2c_client *i2c,
 	struct ak4613_priv *priv;
 
 	regmap_cfg = NULL;
-	if (np) {
-		const struct of_device_id *of_id;
-
-		of_id = of_match_device(ak4613_of_match, dev);
-		if (of_id)
-			regmap_cfg = of_id->data;
-	} else {
+	if (np)
+		regmap_cfg = of_device_get_match_data(dev);
+	else
 		regmap_cfg = (const struct regmap_config *)id->driver_data;
-	}
 
 	if (!regmap_cfg)
 		return -EINVAL;
-- 
2.34.1

