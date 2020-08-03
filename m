Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E7723A853
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 16:23:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D512D1662;
	Mon,  3 Aug 2020 16:22:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D512D1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596464584;
	bh=5mdQ2P6w6h10d5BnTU+W0zCmKOJ2hm6MNyfcYSFn078=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gfc9UYYaqZl0/CTE3d6bvjeNa2zG8P1HNCAaNISQiaXVtr4ylIY80gm4llCVi/t1Y
	 +nYcLgK+h4ELS39yPI8jSLzJpnTHLtAS+iGIoUtA688vf1WoGx4N70xDX/is0KUUHl
	 a99cECvoep2n5lu1dd5hWlBWnNHuwU/bMz2vUs2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5A99F802E0;
	Mon,  3 Aug 2020 16:19:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55427F80218; Mon,  3 Aug 2020 16:19:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 021DDF801F7
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 16:18:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 021DDF801F7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E22BEB6B5;
 Mon,  3 Aug 2020 14:19:06 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 4/5] ASoC: tegra: tegra210_dmic: Fix compile warning with
 CONFIG_PM=n
Date: Mon,  3 Aug 2020 16:18:49 +0200
Message-Id: <20200803141850.23713-5-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200803141850.23713-1-tiwai@suse.de>
References: <20200803141850.23713-1-tiwai@suse.de>
Cc: Sameer Pujar <spujar@nvidia.com>, alsa-devel@alsa-project.org
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

Fix trivial compile warnings wrt unused functions by adding
__maybe_unused prefix:
  sound/soc/tegra/tegra210_dmic.c:43:12: warning: 'tegra210_dmic_runtime_suspend' defined but not used [-Wunused-function]
  sound/soc/tegra/tegra210_dmic.c:55:12: warning: 'tegra210_dmic_runtime_resume' defined but not used [-Wunused-function]

Fixes: 8c8ff982e9e2 ("ASoC: tegra: Add Tegra210 based DMIC driver")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/tegra/tegra210_dmic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra210_dmic.c b/sound/soc/tegra/tegra210_dmic.c
index d682414ad90d..a661f40bc41c 100644
--- a/sound/soc/tegra/tegra210_dmic.c
+++ b/sound/soc/tegra/tegra210_dmic.c
@@ -40,7 +40,7 @@ static const struct reg_default tegra210_dmic_reg_defaults[] = {
 	{ TEGRA210_DMIC_LP_BIQUAD_1_COEF_4, 0x0 },
 };
 
-static int tegra210_dmic_runtime_suspend(struct device *dev)
+static int __maybe_unused tegra210_dmic_runtime_suspend(struct device *dev)
 {
 	struct tegra210_dmic *dmic = dev_get_drvdata(dev);
 
@@ -52,7 +52,7 @@ static int tegra210_dmic_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int tegra210_dmic_runtime_resume(struct device *dev)
+static int __maybe_unused tegra210_dmic_runtime_resume(struct device *dev)
 {
 	struct tegra210_dmic *dmic = dev_get_drvdata(dev);
 	int err;
-- 
2.16.4

