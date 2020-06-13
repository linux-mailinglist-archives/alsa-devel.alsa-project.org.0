Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CAA1F8DD3
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jun 2020 08:28:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77CCD167B;
	Mon, 15 Jun 2020 08:27:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77CCD167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592202520;
	bh=lWj6OROVeKEZk09wCHJnuP62vbUo6KyU9qMQKdtmGuo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GklZ0mrxm034YmpdPGNoJ7hGer7xesf1xCfy3Q+RhRslmDrnHI4bli+Xo23gXKAfQ
	 KUFuHc2UKClcbQIPZg08qqoj0KlfJp+9Rt8R9+kE4V4u1n+l/ygBQig/5xh5d29cqX
	 NVdNcNSh55c68eRZTvld+ozTYETMnBWdETLlkXpc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16F59F80274;
	Mon, 15 Jun 2020 08:26:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43B6DF80279; Sat, 13 Jun 2020 22:44:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mta-p8.oit.umn.edu (mta-p8.oit.umn.edu [134.84.196.208])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4538F800CD
 for <alsa-devel@alsa-project.org>; Sat, 13 Jun 2020 22:44:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4538F800CD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=umn.edu header.i=@umn.edu
 header.b="bOdSaBZJ"
Received: from localhost (unknown [127.0.0.1])
 by mta-p8.oit.umn.edu (Postfix) with ESMTP id 49kqMf6zTwz9vC9N
 for <alsa-devel@alsa-project.org>; Sat, 13 Jun 2020 20:44:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E9Wf4i3Pi3CH for <alsa-devel@alsa-project.org>;
 Sat, 13 Jun 2020 15:44:30 -0500 (CDT)
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 49kqMf5HDDz9vBtg
 for <alsa-devel@alsa-project.org>; Sat, 13 Jun 2020 15:44:30 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 49kqMf5HDDz9vBtg
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 49kqMf5HDDz9vBtg
Received: by mail-il1-f198.google.com with SMTP id s4so9122174ilc.7
 for <alsa-devel@alsa-project.org>; Sat, 13 Jun 2020 13:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=b+iEIISmV4Ee/AXAA3HOB7wr+a6MNiCQ3dfMd9OfhgA=;
 b=bOdSaBZJyTwhn3YzlHvp7XflMqAXEC1LpqwMml0xxBo5lSuHSEclQyM/T+uTA3IZzc
 HEO/kBe9rFXMiKJRk3a8ITNQhwu+BCUnLYS+hBSKoK8Ku25nLty0vAuqscqrUK76nYvV
 TuYLPgp7WsAg5VrDyySlBlUZzgOt8QDJLcJJ0xqXFrTUQzlLDWOt80HDhJRJaJ1BOeH6
 AhJl+Hl4QQQV2/JQZWVLX2BVdaba0VD3zbvqjFDl1Xkdwc0JL713elOt7Gvu3nrdWcCQ
 bReuBufMwdFIEVOhMswp6HS4S/OL/jnNj5MuyrwVJ9/g1IzBA/sxtlaCU+At7lFPgC4T
 PGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=b+iEIISmV4Ee/AXAA3HOB7wr+a6MNiCQ3dfMd9OfhgA=;
 b=mFhDpksS5AKwZF4DysgzsDw5O3SCZvucw+chtwMyPNL6x4gS/H2JR/d+7b2LWewyAV
 tDp7fVh7u3/6up5gTbreLfaO3MHalIoPVPYFlh9BQeI3QQZ5fzUgyxbNbVZPKh7gzWyo
 6/jpZGBptL+YT9/9EHnp+v1KwdGfwdpiPVoPo7HEs7byKcj3xUBbGnbzYrC8a9du/jd+
 J+fbeI6AyJvbHWhEBKuFUxQ91knf7WT94zw+HXUrokP4VjDSweLX7TYPSz9zAGZz9MON
 b1qWhDXCkHZ9vlSz/xA7rgrGwhvuoLZLcUFVEU/J4o8SGxVwsY2kAgyZF4iEpDtAQj57
 rjdw==
X-Gm-Message-State: AOAM532/lPX54KphY5SWgUyVDZcSnkl9gh0h7lPze7yeBDjdbVWKil6V
 saAl2bKXm+39WeODSJEV0LuZQtAvWCTw1a1GfPaWxKipxi2VS7jpzrlheE/4jPD2mTTmtl1lhJi
 nyBguZprSFADDSk5h1heDX59O9os=
X-Received: by 2002:a05:6602:491:: with SMTP id
 y17mr20185655iov.72.1592081069821; 
 Sat, 13 Jun 2020 13:44:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuUH0JGzr6A1aKGQO/t0YzwjO1OxoyYGiXTl5u65tMnE63FPrdxzR6es2yGQb9rtR6FHN2PQ==
X-Received: by 2002:a05:6602:491:: with SMTP id
 y17mr20185631iov.72.1592081069282; 
 Sat, 13 Jun 2020 13:44:29 -0700 (PDT)
Received: from qiushi.cs.umn.edu ([2607:ea00:101:3c74:4874:45:bcb4:df60])
 by smtp.gmail.com with ESMTPSA id t14sm5083251ilp.73.2020.06.13.13.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2020 13:44:28 -0700 (PDT)
From: wu000273@umn.edu
To: kjlu@umn.edu
Subject: [PATCH] ASoC: tegra: Fix reference count leaks.
Date: Sat, 13 Jun 2020 15:44:19 -0500
Message-Id: <20200613204422.24484-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 15 Jun 2020 08:26:10 +0200
Cc: Jonathan Hunter <jonathanh@nvidia.com>, alsa-devel@alsa-project.org,
 Edward Cragg <edward.cragg@codethink.co.uk>, linux-kernel@vger.kernel.org,
 YueHaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, wu000273@umn.edu,
 linux-tegra@vger.kernel.org, Ben Dooks <ben.dooks@codethink.co.uk>
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

From: Qiushi Wu <wu000273@umn.edu>

Calling pm_runtime_get_sync increments the counter even in case of
failure, causing incorrect ref count if pm_runtime_put is not called in
error handling paths. Call pm_runtime_put if pm_runtime_get_sync fails.

Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
 sound/soc/tegra/tegra30_ahub.c | 4 +++-
 sound/soc/tegra/tegra30_i2s.c  | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index 635eacbd28d4..156e3b9d613c 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -643,8 +643,10 @@ static int tegra30_ahub_resume(struct device *dev)
 	int ret;
 
 	ret = pm_runtime_get_sync(dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put(dev);
 		return ret;
+	}
 	ret = regcache_sync(ahub->regmap_ahub);
 	ret |= regcache_sync(ahub->regmap_apbif);
 	pm_runtime_put(dev);
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index d59882ec48f1..db5a8587bfa4 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -567,8 +567,10 @@ static int tegra30_i2s_resume(struct device *dev)
 	int ret;
 
 	ret = pm_runtime_get_sync(dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put(dev);
 		return ret;
+	}
 	ret = regcache_sync(i2s->regmap);
 	pm_runtime_put(dev);
 
-- 
2.17.1

