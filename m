Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03732466B2C
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 21:50:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9629C27A3;
	Thu,  2 Dec 2021 21:49:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9629C27A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638478226;
	bh=lznRPdHEhXUryo1JXUWYGBTZ8N7e7uDs85keRUf70BQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UePjb92xanCIRQXm1SGm+CG15lB3rhdCzREodtAmowUjLZ4pgW3nh+6ByMuU3C/mp
	 awfBHeUqbhQ9Inl/cqhHtHlY1D7TYLrRMSyjKJf7H38dTAToK+n3DziO6EsTbt9TGN
	 HYGzCvAZZt8ZYtUv1gYSsfXMOIiQ9DJ9xPtJw0HA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08A08F8023A;
	Thu,  2 Dec 2021 21:49:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EAB9F8020B; Thu,  2 Dec 2021 21:49:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78642F800A7
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 21:48:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78642F800A7
X-IronPort-AV: E=McAfee;i="6200,9189,10185"; a="297624286"
X-IronPort-AV: E=Sophos;i="5.87,282,1631602800"; d="scan'208";a="297624286"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2021 12:48:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,282,1631602800"; d="scan'208";a="460609423"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga006.jf.intel.com with ESMTP; 02 Dec 2021 12:48:36 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 105DF109; Thu,  2 Dec 2021 22:48:41 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] ASoC: zl38060: Setup parent device and get rid of
 unnecessary of_node assignment
Date: Thu,  2 Dec 2021 22:48:38 +0200
Message-Id: <20211202204838.75287-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

Some of the drivers do not set parent device. This may lead to obstacles
during debugging or understanding the device relations from the Linux
point of view. Assign parent device for GPIO chips created by these
drivers.

While at it, let GPIO library to assign of_node from the parent device.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/codecs/zl38060.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/zl38060.c b/sound/soc/codecs/zl38060.c
index d20ec1571010..6cae0fb08093 100644
--- a/sound/soc/codecs/zl38060.c
+++ b/sound/soc/codecs/zl38060.c
@@ -589,9 +589,7 @@ static int zl38_spi_probe(struct spi_device *spi)
 				       sizeof(template_chip), GFP_KERNEL);
 	if (!priv->gpio_chip)
 		return -ENOMEM;
-#ifdef CONFIG_OF_GPIO
-	priv->gpio_chip->of_node = dev->of_node;
-#endif
+	priv->gpio_chip->parent = dev;
 	err = devm_gpiochip_add_data(dev, priv->gpio_chip, priv->regmap);
 	if (err)
 		return err;
-- 
2.33.0

