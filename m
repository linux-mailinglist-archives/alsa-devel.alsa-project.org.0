Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1336B3E08C7
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Aug 2021 21:27:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96652169F;
	Wed,  4 Aug 2021 21:26:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96652169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628105261;
	bh=U+skeesabhkvszZXzoOSdXvST0/+cC1urhbf2yqEkVY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TQb9dLiUhS0jg6rmDLnOcuo66b8rTq2XWb/LzzFUwMjE+AbNC5cvn4LpFTO2pJzCb
	 j0WTcyZAJWQGcSPZoXKL41kMB6iszZOjkqVC+zTnG/tyXrnCn+6IGi9oR8Noji0y2p
	 deT/R/GpccvrgDTPk0k7Bly7PrYBQPi/OvIkvQ+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7643F804E3;
	Wed,  4 Aug 2021 21:25:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 443D4F804E1; Wed,  4 Aug 2021 21:25:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 863B5F801F7
 for <alsa-devel@alsa-project.org>; Wed,  4 Aug 2021 21:25:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 863B5F801F7
X-IronPort-AV: E=McAfee;i="6200,9189,10066"; a="235952808"
X-IronPort-AV: E=Sophos;i="5.84,295,1620716400"; d="scan'208";a="235952808"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2021 12:25:11 -0700
X-IronPort-AV: E=Sophos;i="5.84,295,1620716400"; d="scan'208";a="569142456"
Received: from ccho-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.189.253])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2021 12:25:10 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ASoC: mt6359-accdet.c: remove useless assignments
Date: Wed,  4 Aug 2021 14:24:55 -0500
Message-Id: <20210804192456.278702-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210804192456.278702-1-pierre-louis.bossart@linux.intel.com>
References: <20210804192456.278702-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

cppcheck warnings (and additional issue found by code inspection)

sound/soc/codecs/mt6359-accdet.c:464:10: style: Variable 'ret' is
assigned a value that is never used. [unreadVariable]
 int ret = 0;
         ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/mt6359-accdet.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index aec77f0ac3bb..6d3d170144a0 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -234,7 +234,7 @@ static void recover_eint_setting(struct mt6359_accdet *priv)
 
 static void mt6359_accdet_recover_jd_setting(struct mt6359_accdet *priv)
 {
-	int ret = 0;
+	int ret;
 	unsigned int value = 0;
 
 	regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
@@ -461,7 +461,7 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 {
 	struct mt6359_accdet *priv = data;
 	unsigned int irq_val = 0, val = 0, value = 0;
-	int ret = 0;
+	int ret;
 
 	mutex_lock(&priv->res_lock);
 	regmap_read(priv->regmap, ACCDET_IRQ_ADDR, &irq_val);
@@ -551,7 +551,7 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 
 static int mt6359_accdet_parse_dt(struct mt6359_accdet *priv)
 {
-	int ret = 0;
+	int ret;
 	struct device *dev = priv->dev;
 	struct device_node *node = NULL;
 	int pwm_deb[15] = {0};
@@ -926,7 +926,7 @@ static int mt6359_accdet_probe(struct platform_device *pdev)
 {
 	struct mt6359_accdet *priv;
 	struct mt6397_chip *mt6397 = dev_get_drvdata(pdev->dev.parent);
-	int ret = 0;
+	int ret;
 
 	dev_dbg(&pdev->dev, "%s(), dev name %s\n",
 		__func__, dev_name(&pdev->dev));
-- 
2.25.1

