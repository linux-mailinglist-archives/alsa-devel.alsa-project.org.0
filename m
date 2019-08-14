Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA23F8C62E
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 04:13:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25A8C169D;
	Wed, 14 Aug 2019 04:13:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25A8C169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565748831;
	bh=fExdYKcpUVSbP5YJU0N690zU04ibGsi9DlnOMpSzUOI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yfuq4r4rRwkIVzqPjLpdb05pLbFvJy0iXVYbsvui8Jk07plAleIBrLo6pNebPzEXj
	 psx+DQD3nseTOXY+e2FnEVmQBn0dG6YLtM5pQ7KTWYJxk3p7IIK0XDKzGsw98g/Idi
	 Jj9+QOIPrC1vkgLO3SvSl7DmTVrJk/FlzasDnai4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40618F805F5;
	Wed, 14 Aug 2019 04:11:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7E80F80214; Wed, 14 Aug 2019 04:11:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5619F8015B
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 04:11:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5619F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IMy0nijk"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DCBA920842;
 Wed, 14 Aug 2019 02:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565748674;
 bh=1xgrUvmGxX/jYsyf1aBvQ4XPUPe/5oORHXydsIYsGis=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IMy0nijk3XxU7lEambcq1TpNPGFm+5NC3SfgcM+MFSnFkXDsZEXyiKnsXL/tc5JkS
 4fA/8rH6fZb1C+dznCGTDQDeWVD3FHezXInUtkF7hwXEavA1ZYWXHRwd8wNOAbxDMB
 5eysdHtWgpZgmMcmldbaLt9yrtTOwfYDTrcOb3BU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue, 13 Aug 2019 22:08:58 -0400
Message-Id: <20190814021047.14828-14-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190814021047.14828-1-sashal@kernel.org>
References: <20190814021047.14828-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Sangbeom Kim <sbkim73@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Wen Yang <wen.yang99@zte.com.cn>
Subject: [alsa-devel] [PATCH AUTOSEL 5.2 014/123] ASoC: samsung: odroid: fix
	a double-free issue for cpu_dai
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Wen Yang <wen.yang99@zte.com.cn>

[ Upstream commit 2abee12c0ab1924a69993d2c063a39a952e7d836 ]

The cpu_dai variable is still being used after the of_node_put() call,
which may result in double-free:

        of_node_put(cpu_dai);            ---> released here

        ret = devm_snd_soc_register_card(dev, card);
        if (ret < 0) {
...
                goto err_put_clk_i2s;    --> jump to err_put_clk_i2s
...

err_put_clk_i2s:
        clk_put(priv->clk_i2s_bus);
err_put_sclk:
        clk_put(priv->sclk_i2s);
err_put_cpu_dai:
        of_node_put(cpu_dai);            --> double-free here

Fixes: d832d2b246c5 ("ASoC: samsung: odroid: Fix of_node refcount unbalance")
Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Link: https://lore.kernel.org/r/1562989575-33785-3-git-send-email-wen.yang99@zte.com.cn
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/samsung/odroid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index 95c35e3ff3303..d606e48fe551a 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -299,7 +299,6 @@ static int odroid_audio_probe(struct platform_device *pdev)
 		ret = PTR_ERR(priv->clk_i2s_bus);
 		goto err_put_sclk;
 	}
-	of_node_put(cpu_dai);
 
 	ret = devm_snd_soc_register_card(dev, card);
 	if (ret < 0) {
@@ -307,6 +306,7 @@ static int odroid_audio_probe(struct platform_device *pdev)
 		goto err_put_clk_i2s;
 	}
 
+	of_node_put(cpu_dai);
 	of_node_put(codec);
 	return 0;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
