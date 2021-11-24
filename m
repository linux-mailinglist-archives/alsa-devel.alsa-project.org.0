Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D1E45CFD5
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 23:09:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5976180F;
	Wed, 24 Nov 2021 23:08:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5976180F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637791784;
	bh=OsOturNdjtG3hBrUOewxcmKWr+GmrlJTjxY35LGB/0A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B0L3zNLv1okCFAvKkQTJySROjN6Axh3UBEgVpmUTUkpFb2vi7MLzN+cWWn+ObfHoi
	 jtkcUbA/BO/fXo1/uW6DrW0wCgYgK1LCK5509r1VE6hzUgrwtezyrw3SYbcyqV2Srm
	 Ew/o9AX55I0X5m3HUCLekDfRZIyJbld5dXeMHi3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 924CCF80518;
	Wed, 24 Nov 2021 23:06:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF774F804F2; Wed, 24 Nov 2021 23:06:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CB2FF80302
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 23:06:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CB2FF80302
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BNzkIwDk"
Received: by mail-lj1-x22c.google.com with SMTP id z8so8367966ljz.9
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 14:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GOTn7eXs/dAu+lzrstonS6bV/obhXYqPBxpagkI+NbQ=;
 b=BNzkIwDk3BqFtBCJnlx+pZQmG/hQM1mUvfdYmbK/URC1F7GJOyjCp6Dqw6Y6iSof3C
 AG6tZ/JnxcJIZp6CdFsRG30x78DWDWb+/ORdS5UeGUa9Q6EDRlcmDHjXKzDL5imjfzOz
 mHcg2mQyhXw0jwBL2Q81ZRQqvhvK74gMqRSUvJwAaiprZG7XzxytciuM4wHuDny9H2OW
 rEU1VKKCPULetRjUQHwAW9v+0p1yrCfyfYGZW9DrPxAnr/r75XAB1B3KjR7ayez0Js0Z
 5vR6nGFjosAxh4Xd7C6uZe1wY5X1BUUYZQlPCV7IoXZs8NJ7sAEhxjT/Ky10YifQqYCP
 cp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GOTn7eXs/dAu+lzrstonS6bV/obhXYqPBxpagkI+NbQ=;
 b=wieey8MaLDd1oUJcBGkSrYDRTDk2q8UwBdGIroQW4KLTtoB+FIA2/6Qx8Fj5Ew2KkS
 Mc98mCIeOePZX8f6gSX/ZKv9DCuSPTRgMs7i1m5hPAQOb1edRUrdFibc4RwprkPrOzf4
 GOF5BJbTVKmCEwqkZt77Qd6JL3PgaYXbdFZq78II+UhSDGs0zk774R4ib808jgz32InK
 T4gtKo45EXNetZL5QWDACApP6wNMEr92XT+x2x0zYuqvP4Q0geoMuSPhxOlMTCLw7YjY
 +zF+Lj9aKLipjdkO3erYx4yMzEZDvOSi/RZFwXV5Ez6yaGAUfNvj1Bw3CCZyIFavidfG
 HtEQ==
X-Gm-Message-State: AOAM532z8rjN3T9YM6vXkB5uB/WKkhY1+f4LLKKkzm1LtEoqT7RyPzCR
 RN2inRErQJdXyJOgrWcbiQg=
X-Google-Smtp-Source: ABdhPJyy8BytKEHwI+l4vFi0hWhPaJ69lP21xhKGo+0hoS+udh1c27JbDvdGiJMcQHn8m0xcPOexFA==
X-Received: by 2002:a2e:b711:: with SMTP id j17mr20929790ljo.39.1637791594526; 
 Wed, 24 Nov 2021 14:06:34 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 14:06:34 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 05/20] ASoC: tegra20-spdif: stop setting slave_id
Date: Thu, 25 Nov 2021 01:00:42 +0300
Message-Id: <20211124220057.15763-6-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124220057.15763-1-digetx@gmail.com>
References: <20211124220057.15763-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
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

From: Arnd Bergmann <arnd@arndb.de>

The DMA resource is never set up anywhere, and passing this as slave_id
has not been the proper procedure in a long time.

As a preparation for removing all slave_id references from the ALSA code,
remove this one.

According to Dmitry Osipenko, this driver has never been used and
the mechanism for configuring DMA would not work as it is implemented,
so this part will get rewritten when the driver gets put into use
again in the future.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/tegra/tegra20_spdif.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 7751575cd6d6..57a6c576b91f 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -290,7 +290,6 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 	spdif->playback_dma_data.addr = mem->start + TEGRA20_SPDIF_DATA_OUT;
 	spdif->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 	spdif->playback_dma_data.maxburst = 4;
-	spdif->playback_dma_data.slave_id = dmareq->start;
 
 	pm_runtime_enable(&pdev->dev);
 
-- 
2.33.1

