Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A761B25AB
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Apr 2020 14:12:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97F00168F;
	Tue, 21 Apr 2020 14:11:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97F00168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587471154;
	bh=Jb1k54xRCSwUTs44eeaF/tPuhLwmWp/BFZhTnZr5Wc8=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m/cvQqZYeESXpeqDdpGEGI66j2olYKHNQEc57KUSgjNvhZrZrrREbdkKlVOfe7H7A
	 42+Op2XBGjpYn2hQuhHkbGeFZfQajN1yJvzObmF9H91kyP0Zri90yYr3EHwR3egg4L
	 LfLn4ENnEdL0qC29L596bID2zZ9doq7b3RDbKNtM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A465AF800E7;
	Tue, 21 Apr 2020 14:10:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60639F801EC; Tue, 21 Apr 2020 14:10:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57E9BF800E7
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 14:10:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57E9BF800E7
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 246E4200C8F;
 Tue, 21 Apr 2020 14:10:43 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8FD72200C7B;
 Tue, 21 Apr 2020 14:10:38 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id C567A4029E;
 Tue, 21 Apr 2020 20:10:32 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 shengjiu.wang@nxp.com, tglx@linutronix.de, allison@lohutok.net,
 info@metux.net, patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: wm8962: restore the CLOCKING2 register in resume
Date: Tue, 21 Apr 2020 20:02:15 +0800
Message-Id: <1587470535-20469-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
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

The CLOCKING2 is a volatile register, but some bits should
be restored when resume, for example SYSCLK_SRC. otherwise
the output clock is wrong

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/codecs/wm8962.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index d9d59f45833f..6e96c0c5ad2a 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -82,6 +82,7 @@ struct wm8962_priv {
 #endif
 
 	int irq;
+	u32 regcache_clocking2;
 };
 
 /* We can't use the same notifier block for more than one supply and
@@ -3813,6 +3814,10 @@ static int wm8962_runtime_resume(struct device *dev)
 
 	regcache_sync(wm8962->regmap);
 
+	regmap_update_bits(wm8962->regmap, WM8962_CLOCKING2,
+			   WM8962_SYSCLK_SRC_MASK,
+			   wm8962->regcache_clocking2);
+
 	regmap_update_bits(wm8962->regmap, WM8962_ANTI_POP,
 			   WM8962_STARTUP_BIAS_ENA | WM8962_VMID_BUF_ENA,
 			   WM8962_STARTUP_BIAS_ENA | WM8962_VMID_BUF_ENA);
@@ -3842,6 +3847,9 @@ static int wm8962_runtime_suspend(struct device *dev)
 			   WM8962_STARTUP_BIAS_ENA |
 			   WM8962_VMID_BUF_ENA, 0);
 
+	regmap_read(wm8962->regmap, WM8962_CLOCKING2,
+		    &wm8962->regcache_clocking2);
+
 	regcache_cache_only(wm8962->regmap, true);
 
 	regulator_bulk_disable(ARRAY_SIZE(wm8962->supplies),
-- 
2.21.0

