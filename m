Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEAA4685A8
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Dec 2021 15:40:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A681229C;
	Sat,  4 Dec 2021 15:39:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A681229C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638628816;
	bh=UORYBz1eeo61x50Z3tys3rviKpDlzvxFjX1T9Mjtuqw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UX0ttQ5AEnpsHBbP+jW093pyM2C5+lCgCb1cDCix2OVmeP6ZgaRgLc00GEtTaUJd8
	 UTIn6HHkmnZYZCF5in5NhVzHWkeXe5YE3xeD0iFys+SJ4V9ZqanY4y03vvA2B5uzWJ
	 qtrEtHDJuy3uPMarD4ra0uWlkpFVoz0/v09gInMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F47CF80507;
	Sat,  4 Dec 2021 15:37:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1949F80134; Sat,  4 Dec 2021 15:37:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CEFEF8023A
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 15:37:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CEFEF8023A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="o1KGgDtQ"
Received: by mail-lj1-x231.google.com with SMTP id l7so11976122lja.2
 for <alsa-devel@alsa-project.org>; Sat, 04 Dec 2021 06:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AAin265JOVL+o94pQxCU+sQvf2Xm5+tMWz8fFEKib7U=;
 b=o1KGgDtQWGDqmjiOgI5S/+RbDDAWjn7RwxNM6FRu5jsCI6H19PFswt6Opnx+0ODTPy
 hPRduERJtyDeRBrnfWfBGmrnXVCtAETHK85vi8EOrBil26r9K1uYi0YEDaG9Yx7axBQg
 XdmehnDB9warwOcBZ5lCnQessgtSijHJA/3I3NnRp0EOuwd1+hAqOkdWnHjNO3yeqXmO
 njnY06XzGevMbhitj2YiGsUwJwnk6d8R7aQYDcc25dvLI8cmunCmpfI1Ad+8sSHjbyLx
 LP5dGS94RECbctBvsfo86RRnIGvpGGX+7TbM91wof82ITDXGsq1vcVVEbxP5/cwGJJ4U
 JBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AAin265JOVL+o94pQxCU+sQvf2Xm5+tMWz8fFEKib7U=;
 b=x1UbxqEdJLcwZJ0mUygTE/nAxmsIdK2f/1V0hnf3DnyCS84aJBgLvj0M72vxKxLUhJ
 05uBxYT6GSx0iG38zqqJEs/3Ny+atQ3Cek/Wt57Nex5ef33/U/b7gj5R+JJdUk4izeNv
 Wgg5slsHRojVvrODwwYEtiVtcJa8Pz3B6NYrQtYtL88glg6g1+86dAb0UNoyCluZQHQU
 7JS4BHLSChRceiuxPcP9zDa+BUHjnCuIt0UNOq3BE0kxOHefljbZmsPtM8n0TxLu+Jc4
 pZQnw9vedB7eNGRmZ9y0ajGNGoJizAsN6ICMln/ThrHNI9xrJKeEnQkRyAH6FOICeB5t
 h8qA==
X-Gm-Message-State: AOAM533J4SS8Q/HritGLj96fZY1mFEhUvUtCFsZHpclO6FS29Xf3bpt6
 J5wLNIyZlFDa6MKo5I3RI/s=
X-Google-Smtp-Source: ABdhPJzCs7dQD/cZfTQiFvEEynpqpF6ANm/y7mYxAAce2J3VdDbfVr77o//xAPFMjDRP96a9qUFy5w==
X-Received: by 2002:a05:651c:1ab:: with SMTP id
 c11mr24347618ljn.378.1638628656252; 
 Sat, 04 Dec 2021 06:37:36 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id g36sm782934lfv.16.2021.12.04.06.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 06:37:35 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v4 06/22] ASoC: tegra20-spdif: stop setting slave_id
Date: Sat,  4 Dec 2021 17:37:09 +0300
Message-Id: <20211204143725.31646-7-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211204143725.31646-1-digetx@gmail.com>
References: <20211204143725.31646-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
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

