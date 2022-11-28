Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A824563AF2B
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 18:39:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CA7C16AF;
	Mon, 28 Nov 2022 18:38:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CA7C16AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669657179;
	bh=yHbMGquTZpBdGaMsjnRtRspLMqIM4gl7RM/XsSw8k/g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nKtoNbpQvFuNxRqnxUQzeBIaMq35L3/F/1aNYoYbunm9OP5EPFhhUV7ElIRnYwcrr
	 lck9GFgxEi1nxIarIxcnt5Gy/5rqW4tFXaXM+K/JKuwl1jQCyqif+v0ZX2a16fyMgw
	 ykz4x5SfJq7KFNnOI1asdCKt6PGNyOS/7/K9KPJc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD25DF8027D;
	Mon, 28 Nov 2022 18:38:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE4D5F8024C; Mon, 28 Nov 2022 18:38:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21977F800B6
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 18:38:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21977F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Mb8bqsrp"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C1F94612C9;
 Mon, 28 Nov 2022 17:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6368AC433C1;
 Mon, 28 Nov 2022 17:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669657112;
 bh=yHbMGquTZpBdGaMsjnRtRspLMqIM4gl7RM/XsSw8k/g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Mb8bqsrpPxrYQh1PMuG86LjFlfksUMZVxTpngw2PGdzov1RmeJYaNL70jHaB5BLDh
 A1+4wweHQcDlDL3dTO+uL/Tpvfz56xt+W+XSGCZrqlNJvu7jY9k8AvU96k4cLdxTLP
 mZInO1ksFxaHM27aP8tNAYsob+RwP28reH8VIrzeZiyj8ySy8CSxnrracxrojm9Y6y
 Qr6YF+hQ4DBlHakjI1UakG0AEEcN3lG4qmCjEJCvT2uA451qLcaO1EFETOBP9T5R24
 POCfnpoyno5YopAeYQQy5f5TzGEfbAYqjHYCXVJJ/EU047vNSxa8w5FWvaDIPY/xhO
 IQo3+oFuFi9Hg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 16/39] ASoC: wm8962: Wait for updated value of
 WM8962_CLOCKING1 register
Date: Mon, 28 Nov 2022 12:35:56 -0500
Message-Id: <20221128173642.1441232-16-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221128173642.1441232-1-sashal@kernel.org>
References: <20221128173642.1441232-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, patches@opensource.cirrus.com,
 tiwai@suse.com, lgirdwood@gmail.com, chi.minghao@zte.com.cn,
 Mark Brown <broonie@kernel.org>, Chancel Liu <chancel.liu@nxp.com>,
 steve@sk2.org, aford173@gmail.com
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

From: Chancel Liu <chancel.liu@nxp.com>

[ Upstream commit 3ca507bf99611c82dafced73e921c1b10ee12869 ]

DSPCLK_DIV field in WM8962_CLOCKING1 register is used to generate
correct frequency of LRCLK and BCLK. Sometimes the read-only value
can't be updated timely after enabling SYSCLK. This results in wrong
calculation values. Delay is introduced here to wait for newest value
from register. The time of the delay should be at least 500~1000us
according to test.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20221109121354.123958-1-chancel.liu@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wm8962.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 6df06fba4377..ee1cad5af535 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -2503,6 +2503,14 @@ static void wm8962_configure_bclk(struct snd_soc_component *component)
 		snd_soc_component_update_bits(component, WM8962_CLOCKING2,
 				WM8962_SYSCLK_ENA_MASK, WM8962_SYSCLK_ENA);
 
+	/* DSPCLK_DIV field in WM8962_CLOCKING1 register is used to generate
+	 * correct frequency of LRCLK and BCLK. Sometimes the read-only value
+	 * can't be updated timely after enabling SYSCLK. This results in wrong
+	 * calculation values. Delay is introduced here to wait for newest
+	 * value from register. The time of the delay should be at least
+	 * 500~1000us according to test.
+	 */
+	usleep_range(500, 1000);
 	dspclk = snd_soc_component_read(component, WM8962_CLOCKING1);
 
 	if (snd_soc_component_get_bias_level(component) != SND_SOC_BIAS_ON)
-- 
2.35.1

