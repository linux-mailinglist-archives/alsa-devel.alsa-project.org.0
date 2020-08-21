Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4253F24DA48
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 18:19:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9B3E1678;
	Fri, 21 Aug 2020 18:18:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9B3E1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598026782;
	bh=gWohrytgPPCufu0Y0SdUetLBz+Kc3A0G8R2gLyGeer8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mp1Ej/5euExzLwDUnSOQ4qtdySejf/D7M2Lw7nIv/SReBdH7huvA/K/IfspbL/YhF
	 OHgjjAenHop696koELVPeeVMj9y71BG0Nykh6Xc5qybnW4pqO3cYwIwkGY5UJMKIBs
	 KHBU0IYDyQfHgX6dw2QV+3R7/dMR1wB7DHo70/+Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4D8AF802EB;
	Fri, 21 Aug 2020 18:14:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD131F80255; Fri, 21 Aug 2020 18:14:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 217CAF80216
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 18:14:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 217CAF80216
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BX30BvcM"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E8F3322B4B;
 Fri, 21 Aug 2020 16:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598026475;
 bh=gWohrytgPPCufu0Y0SdUetLBz+Kc3A0G8R2gLyGeer8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BX30BvcMviD5aaJBOaw1W6vcKLChTMHU3rDuM9TswtEPglj+waUKL21hm3FSKv0kM
 R8SGaJsyrqtCI1zkTLsBSx95946XVkKwBSBEq8qvNZYYDnCXYdvNTL0T5vzXdd05nC
 9q/PoYXnFNLQuRT4U53O6J0G40S/nxHofZUzIqyk=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 09/62] ASoC: tegra: Fix reference count leaks.
Date: Fri, 21 Aug 2020 12:13:30 -0400
Message-Id: <20200821161423.347071-9-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821161423.347071-1-sashal@kernel.org>
References: <20200821161423.347071-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Jon Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Qiushi Wu <wu000273@umn.edu>, linux-tegra@vger.kernel.org
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

[ Upstream commit deca195383a6085be62cb453079e03e04d618d6e ]

Calling pm_runtime_get_sync increments the counter even in case of
failure, causing incorrect ref count if pm_runtime_put is not called in
error handling paths. Call pm_runtime_put if pm_runtime_get_sync fails.

Signed-off-by: Qiushi Wu <wu000273@umn.edu>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Link: https://lore.kernel.org/r/20200613204422.24484-1-wu000273@umn.edu
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/tegra/tegra30_ahub.c | 4 +++-
 sound/soc/tegra/tegra30_i2s.c  | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index 635eacbd28d47..156e3b9d613c6 100644
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
index d59882ec48f16..db5a8587bfa4c 100644
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
2.25.1

