Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB233EC7F5
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Aug 2021 09:32:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0D151748;
	Sun, 15 Aug 2021 09:31:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0D151748
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629012734;
	bh=FeDXyAKVOIJHPfM6YiYCYJH5jJDgJJKS1nNcQt1TXXY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=flHerkUHBarOJ2TeyYxOn0RcAWgxgjAd/+Q1Jbyv7N1XNXhicnZi1h5NvKk0lhWuZ
	 mEwDLtGEMkVp1smK+4hkh8YZcJjvM2uFEo3RbaYQa/RZqSb4psDZlB1dtXWy8mO+nF
	 9BFvNpAs2hftCmGdsuxTpXUV15cKz2aFTJqP9T2w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5849F804CF;
	Sun, 15 Aug 2021 09:30:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C68AAF80279; Sat, 14 Aug 2021 22:12:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35778F800AF
 for <alsa-devel@alsa-project.org>; Sat, 14 Aug 2021 22:12:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35778F800AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TWfjWcGJ"
Received: by mail-pl1-x62c.google.com with SMTP id e19so16198384pla.10
 for <alsa-devel@alsa-project.org>; Sat, 14 Aug 2021 13:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r7fFFu/BvwqmhomKLq6d7HbwgBUteESf+Ymi2dOxs6A=;
 b=TWfjWcGJ171Q7ErtMyT3b7xDskqwjeOcH3Ctict/2YtewtMPFRd9MgWWLPBQWDSU1a
 iydcCHjbZ0YlC9ObYLKxUPxobJTPka9F8xviffsg8BTHZf6gfdKR+8VWxYegFYGtX7RU
 U24omsL8HeV7FxaP18a2OUiEz5LW/XoyaFsX72aJMisrEtDrNP/inrbWNrhwrZLRgtev
 j3pFF1o7N5Q9v3ELMXwcuM/vbDG+rPDGQP5LmVsP69HmCPwkI0caGyFMlU6NxyxSqhSl
 eQqsof2tshXmojeUXFGnBbrpdWMJ+BFwc31NJMUzwd1ZCgkmIfBnBUXwuWJKp0369v7r
 fusg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r7fFFu/BvwqmhomKLq6d7HbwgBUteESf+Ymi2dOxs6A=;
 b=G6n5Ss55t6lQefGXenxOaIF1FtePCyy1MlroCJEeHJ6upWl6wSiFS/QZDGi470n/7K
 bc3QbypmF8AUBvARX87aSk9abEA0CSZRDUmHHuw4TGeFc1ZDPKdu34S9Mt5RdPvXwrQ2
 SCsqJsfiUjT012ZUypV8HXiHyFtio5jA7R5TSaUDm2KPQbV8Sh0BwnIXx8TUk78rpviV
 8WxS+5yT1T19q2TPp8j9rqa+gZvTAJcruQQAYtpCK/YxObuUuDXw+TpXoHD2/rnqsK1m
 LnqDGWIw508SvMfqrpI/uhbBicfRHETiUL2RwioZfEri/Q/Gji8cZJ3MYS50OSw2YrKo
 X12w==
X-Gm-Message-State: AOAM531jNYWFPSdF3qLpDGNzCuZAXOhxf6GcZfCK8iwmpTwH90gMffP8
 fYfN6NSZ3jwRMDT1N/NUaK4=
X-Google-Smtp-Source: ABdhPJz35Vbq7h6gBPRvLj5w3YPBueKBwz1qlYxtdKhgU93TBD+T428iIStizGGqrAHm1EsQUPxBTQ==
X-Received: by 2002:a17:90a:f186:: with SMTP id
 bv6mr8907473pjb.231.1628971953301; 
 Sat, 14 Aug 2021 13:12:33 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
 by smtp.gmail.com with ESMTPSA id u6sm7309420pgr.3.2021.08.14.13.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Aug 2021 13:12:32 -0700 (PDT)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 1/2] ASoC: tegra30: ahub: Use of_device_get_match_data
Date: Sun, 15 Aug 2021 01:42:18 +0530
Message-Id: <e568d621c9c05ee23732a6a6f9e3606a780b1707.1628971397.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1628971397.git.aakashhemadri123@gmail.com>
References: <cover.1628971397.git.aakashhemadri123@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 15 Aug 2021 09:30:27 +0200
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

Prefer `of_device_get_match_data` over `of_match_device`

Retrieve OF match data using `of_device_get_match_data`, this is cleaner
and better expresses intent.

Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
---
 sound/soc/tegra/tegra30_ahub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index b3e1df693381..0ac109b32329 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -518,7 +518,7 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 	void __iomem *regs_apbif, *regs_ahub;
 	int ret = 0;
 
-	match = of_match_device(tegra30_ahub_of_match, &pdev->dev);
+	match = of_device_get_match_data(&pdev->dev);
 	if (!match)
 		return -EINVAL;
 	soc_data = match->data;
-- 
2.32.0

