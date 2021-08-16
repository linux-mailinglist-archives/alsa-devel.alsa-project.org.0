Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E8F3EDF2A
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Aug 2021 23:16:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C957839;
	Mon, 16 Aug 2021 23:15:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C957839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629148594;
	bh=LAlltrblAQLhRTKM8BleVl9I1O7pF9GkMhWkBkaUVkQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WR0sYWlAc7wKdkfr7lTRsZJlwDSGhhp9myOdn7/YW6QaBu85fi+linCb3sAORsWFq
	 gXhLsItQ2aoL1k4yL4vlGhSTBxZEFovMTQirQJvcLzv4k3S/BUIvcOOmRYLT0oaJqO
	 ra50AYw/bnUDuK2bj7GyPWV3N+h2ybFMdo+WVRbU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A26CF800AF;
	Mon, 16 Aug 2021 23:15:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBC7AF80259; Mon, 16 Aug 2021 23:15:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E8B7F800AF
 for <alsa-devel@alsa-project.org>; Mon, 16 Aug 2021 23:15:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E8B7F800AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QbhLCH3S"
Received: by mail-pj1-x102a.google.com with SMTP id
 w13-20020a17090aea0db029017897a5f7bcso2376363pjy.5
 for <alsa-devel@alsa-project.org>; Mon, 16 Aug 2021 14:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ti5ieSHy8bgHsKT/p42fBihkAPuECC+Byn0rag7Ilqg=;
 b=QbhLCH3SR6H9ufXcqkC6oI4jMlMlgavieMvQovzBxvt35SoUs0p9AyJBI57DfhwNQV
 7qqPZ2WQtvg5jJpTprurs1f10RSBwq81MkFYnAKAqQLQleN0qHoeqmKStPUp+7ChDXNj
 5bqoHWxMOS7nLsrssLZPgtUFlmo4kfXoPxLCepuj2FpdUoBMs88InvmK4bMbXKtOa57Q
 yJ5z50M1+WTsidQku2NEYeLed8/OzclW21ekSoCtjIVLBe+OQiSwNpnhf0e+evumT9d8
 W9J1ArxmXszhvXIva2i1U7iGzIz85x2zUqY0bkuqo06tY9KGVkiLJOUQxtMH7cmy1jxe
 hf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ti5ieSHy8bgHsKT/p42fBihkAPuECC+Byn0rag7Ilqg=;
 b=WkZN3cKq7ieet1lK5FME5UFPpOvIYs951gt1ZYePB2kuEqs1K/gxbojFDzUvpdEXPt
 j/1V9Pis9tigZd9+gtWViRBYBHQz4q2fvJMcoxlwM+FJ6DMFMJyuLwIxH6hxR/v/Ibfb
 6WB6dGu6UaG+YJPq2aiVcXy+CP/AbUYRc4kLQehR7emukQDu0bwnp4g1pHMEbi43wL6v
 BiKgm6QZByyCzlo+bDwlOaQZY04tgsIPjNWdyOkmFhtpGZRa/oTRCa1vom6h88BTrxVt
 BYBU+RIJJHosERvKG49yzLN4ltNyaZ7mZtvLZR41pF+qKDrAnW+OQWObXpTiTPdY+uw+
 XQOA==
X-Gm-Message-State: AOAM532NvQAy2QM+TyPYhwAMMnOxhqnLfMv1K+p0otmRkyx6PYKnD4hs
 r3zSG7uGMozoiSuGA3JPFm8=
X-Google-Smtp-Source: ABdhPJwJZoEwj9uB4CQ5pwLcFobvwe7gSikogI6OOkXKzyMURtFG6MN6/a7qLfHoIesuQsL1YdH47w==
X-Received: by 2002:a17:90a:ba16:: with SMTP id
 s22mr639486pjr.28.1629148507053; 
 Mon, 16 Aug 2021 14:15:07 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
 by smtp.gmail.com with ESMTPSA id b12sm103154pff.63.2021.08.16.14.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 14:15:06 -0700 (PDT)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 1/2] ASoC: tegra30: ahub: Fix incorrect usage of
 of_device_get_match_data
Date: Tue, 17 Aug 2021 02:44:51 +0530
Message-Id: <bb61c41f2ee0cf0d85fecdfea05f23a7205992e6.1629148177.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1629148177.git.aakashhemadri123@gmail.com>
References: <cover.1629148177.git.aakashhemadri123@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Bjorn Helgaas <bjorn@helgaas.com>, Thierry Reding <thierry.reding@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-tegra@vger.kernel.org
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

const struct of_device_id incorrectly assigned "match->data" using
of_device_get_match_data()

Instead assign `const struct tegra30_ahub_soc_data *soc_data` with
const void *of_device_get_match_data(...)

Fixes: 80165bb80433 ("ASoC: tegra30: ahub: Use of_device_get_match_data")

Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
---
 sound/soc/tegra/tegra30_ahub.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index 0ac109b32329..ef011a488ceb 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -512,16 +512,14 @@ static const struct of_device_id tegra30_ahub_of_match[] = {
 
 static int tegra30_ahub_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *match;
 	const struct tegra30_ahub_soc_data *soc_data;
 	struct resource *res0;
 	void __iomem *regs_apbif, *regs_ahub;
 	int ret = 0;
 
-	match = of_device_get_match_data(&pdev->dev);
-	if (!match)
+	soc_data = of_device_get_match_data(&pdev->dev);
+	if (!soc_data)
 		return -EINVAL;
-	soc_data = match->data;
 
 	ahub = devm_kzalloc(&pdev->dev, sizeof(struct tegra30_ahub),
 			    GFP_KERNEL);
-- 
2.32.0

