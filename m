Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AF65B69CD
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 10:46:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B72721742;
	Tue, 13 Sep 2022 10:45:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B72721742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663058770;
	bh=tcax+OJ/SD3UTLDjsdBUQo/VCMUnXdL9ESEB2a/g4sk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HXM3OSLLub4b7FQTZilzLQISTLX4Cdqr+VchnETvoiefeNmMvrppl4MJMjuGK6V3N
	 TZrkoMDyl0zVTky5zenAEmifV+izIxKWxXtMD+sa8luF4nRjO/Vgh5Bo6VmGEplX8t
	 R/lFxOw4FDEhZhQ9bPSQwR8u9cquoxY3jHXvnd04=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07F2FF80154;
	Tue, 13 Sep 2022 10:45:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D99CF80224; Tue, 13 Sep 2022 10:45:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54E64F800FE
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 10:45:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54E64F800FE
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 793671A3289;
 Tue, 13 Sep 2022 10:45:02 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 426311A3279;
 Tue, 13 Sep 2022 10:45:02 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 06C72180219B;
 Tue, 13 Sep 2022 16:45:00 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: ak4458: Add ak4458_reset in device probe and remove
Date: Tue, 13 Sep 2022 16:26:34 +0800
Message-Id: <1663057594-29141-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: kuninori.morimoto.gx@renesas.com
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

This patch fixup this warning when CONFIG_PM not defined

linux/sound/soc/codecs/ak4458.c:631:13: error: 'ak4458_reset' defined but\
        not used [-Werror=unused-function]
  631 | static void ak4458_reset(struct ak4458_priv *ak4458, bool active)
      |             ^~~~~~~~~~~~
cc1: all warnings being treated as errors

Fixes: e9e7df88996d64 ("ASoC: ak4458: Remove component probe() and remove()")
Reported-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/codecs/ak4458.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
index b534212096ee..626310859814 100644
--- a/sound/soc/codecs/ak4458.c
+++ b/sound/soc/codecs/ak4458.c
@@ -781,12 +781,16 @@ static int ak4458_i2c_probe(struct i2c_client *i2c)
 
 	pm_runtime_enable(&i2c->dev);
 	regcache_cache_only(ak4458->regmap, true);
+	ak4458_reset(ak4458, false);
 
 	return 0;
 }
 
 static int ak4458_i2c_remove(struct i2c_client *i2c)
 {
+	struct ak4458_priv *ak4458 = i2c_get_clientdata(i2c);
+
+	ak4458_reset(ak4458, true);
 	pm_runtime_disable(&i2c->dev);
 
 	return 0;
-- 
2.34.1

