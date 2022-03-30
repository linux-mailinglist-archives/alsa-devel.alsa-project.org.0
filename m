Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8A84EC0D7
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 13:54:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D9D9189E;
	Wed, 30 Mar 2022 13:53:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D9D9189E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648641285;
	bh=IVt9jYETt3TQfguSpdnH8Vu6cSpfeaiBih9Ro8JSimM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DoovPOiCSinK69iW7OvAH+UO6/XX5Z5A2d+Jx4uajwML95aCfgM6SEJPu4EFxzSD9
	 6ZVSSVLq0uPzFuJmF/209FjYHSqMMCiybQYfv06T1OOzi2GGoqgrbi8cWOHbhMYGGu
	 q9CRKqXgk67g8zm5kgu/0kYWKDDGMN5s13qgUXHM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1000F805C4;
	Wed, 30 Mar 2022 13:48:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D8C3F805C8; Wed, 30 Mar 2022 13:48:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E934CF805B5
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:48:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E934CF805B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mNXOSGK1"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1A4F3B81C4B;
 Wed, 30 Mar 2022 11:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9BC4C36AE7;
 Wed, 30 Mar 2022 11:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648640906;
 bh=IVt9jYETt3TQfguSpdnH8Vu6cSpfeaiBih9Ro8JSimM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mNXOSGK1CTl6hWVK0Z/wxm7weM8pY4GOlDYF7Fzy+IcAK7Pd9XYH3iBkcAVdAYRJI
 w/PNuPUMqQz6tGbwW01LD5T5BHlomYuz2ClHjVYPKgdMDGlpxMMT/qUf41SZHMBpyw
 ppFrmW35q6RFFI/rmXMoCm1mzBaf/xkHLV6EU0qnK+v5qGfbZAnv4NX5BOzAA48A5N
 2OMl3w+Lr6WAveJoJB58oIfp8EvB6+j1Zymlj8M6zTmmE993yf/WhGA3oCC74y0dpO
 7DTQp0PM78fGeIFA276jnGqRAMTYmiuDBdWigX/3x2FyvUb98DilIdBHVTenfdCKm8
 2INYJ5w2j+RJQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 64/66] ASoC: ak4642: Use
 of_device_get_match_data()
Date: Wed, 30 Mar 2022 07:46:43 -0400
Message-Id: <20220330114646.1669334-64-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330114646.1669334-1-sashal@kernel.org>
References: <20220330114646.1669334-1-sashal@kernel.org>
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
index 4d2e78101f28..034195c83bd7 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -653,15 +653,10 @@ static int ak4613_i2c_probe(struct i2c_client *i2c,
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

