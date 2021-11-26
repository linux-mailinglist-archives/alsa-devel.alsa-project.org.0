Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C0A45F1C4
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 17:23:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE83D1A9A;
	Fri, 26 Nov 2021 17:22:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE83D1A9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637943794;
	bh=UORYBz1eeo61x50Z3tys3rviKpDlzvxFjX1T9Mjtuqw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ryOur9q/1cgR8V3rfXMCMSBVU+qkXGZ0uz3IsJDDs3KCr4PbtpEtQnkqs8DIHsRmM
	 uu2wdNfbTD9K+s1AGpmm7G6aJFJtmwubhmyYDXuYNzUaoyMjZUqzzJqE2hdOKsRbFw
	 xW9ugsmB5HySeVBPVrcldGVcWdPDP2P6EdCHuITs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28EF1F80518;
	Fri, 26 Nov 2021 17:20:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31923F804F2; Fri, 26 Nov 2021 17:19:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD929F80259
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 17:19:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD929F80259
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BJbfUBs2"
Received: by mail-lf1-x12a.google.com with SMTP id f18so25506072lfv.6
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 08:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AAin265JOVL+o94pQxCU+sQvf2Xm5+tMWz8fFEKib7U=;
 b=BJbfUBs27vN/BXdrfZVLl+mcJlwxpt03ZG4BcmkKKYWyfYJy4vev3auqKaPv6mPLXq
 sCQksErcwYoAayxWRm2Fu8khU3NBW4ciWpcYxtaOAU1bBo2TT/sdHvtcOmqRlEpEM0Qy
 cXZnwb29eLcWAJc4cKYTreTbQ0TBZ7SSjP8Bw1fIYr2bOg86wtvJ++7OrAFCPfVNO1Lc
 GNOscG8hx+Ctx4DqIOM9dMx18cRwBS2kTsf0qAFQDs7ksTgB73o+LstacLuJI/RHCsLr
 m6TYv2sSM8TQwO1xrrIfgIlP0d1HbGQfH3+2DKxyAorsM2rpA6yYn2fovZ+lr3Um2+zC
 WznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AAin265JOVL+o94pQxCU+sQvf2Xm5+tMWz8fFEKib7U=;
 b=sTnL5pGxfnXnBAf/d0X3wIHDzXGLKNCinK0P9BWXqGrp3Ol0rLXg1EftLR4mt9OCqg
 8TNU1/7fgFWNu6f/U03IbADUvXsaTHcmhLH/wiC4xdBODjddqWdMVDDopHvYvkyn2503
 FrkF9BRp9YxOjrgMnx6GfVdA8MY9+/JDwLaT5cAdHmAOQPKbUqRGKZPUzxrmpNefXQS8
 UncwEmjyu+G1qXME5GTPVmLPBqYqAbD1ynnVYxuaGMdEQZVqk8+1rVjalh6TOBqFqqIa
 PfR3+vQM/fIGXar0kB/BorlZayBEFfXjAMsM8CnfHcLIR1msvMuJ+6djGaUZxLQSSJhD
 o0wA==
X-Gm-Message-State: AOAM530M54RUXDmrbZxMlQ1ymO7UPhyLO2vB93AlYV1DIP3Ac28YzR/o
 yBdT/zIULHPy6MQKMRS8MtI=
X-Google-Smtp-Source: ABdhPJxyXEvKVmf7LUHm7Bq10BUL0d0eGbpP6e98npXd/QQMkZcwI8MdZNl5vLC50uFeRYPW04jNlQ==
X-Received: by 2002:a05:6512:3da2:: with SMTP id
 k34mr30230293lfv.605.1637943584717; 
 Fri, 26 Nov 2021 08:19:44 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:19:44 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 06/20] ASoC: tegra20-spdif: stop setting slave_id
Date: Fri, 26 Nov 2021 19:17:53 +0300
Message-Id: <20211126161807.15776-7-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
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
index 6f0570cde964..e45e371edc42 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -298,7 +298,6 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 	spdif->playback_dma_data.addr = mem->start + TEGRA20_SPDIF_DATA_OUT;
 	spdif->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 	spdif->playback_dma_data.maxburst = 4;
-	spdif->playback_dma_data.slave_id = dmareq->start;
 
 	pm_runtime_enable(&pdev->dev);
 
-- 
2.33.1

