Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 836171B0B90
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 14:57:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20C8E1692;
	Mon, 20 Apr 2020 14:56:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20C8E1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587387454;
	bh=qZiyP0CEU5dTUgbO9irAYGWwKK0X3o5eVLiD6Yof2DE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FtLsI4cuXiaoQnl9utAGAtfOgkBmI118qoBqcXXNWw8B1CLu1xIKyVIYsJPDnyl4D
	 sLTGc0FEMFX5ajKifd14cc4woD6UubaPAy3WIpBGPaU87bAKUKIaA0Gj3NOJNGX6Io
	 jOprXObDFw9T/5Wo2AZnvZhYjhaFG0yzyJXB0AMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4EA1F800E7;
	Mon, 20 Apr 2020 14:55:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C92DF8025E; Mon, 20 Apr 2020 14:26:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DATE_IN_FUTURE_06_12,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25064F801D9
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 14:26:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25064F801D9
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 1234D41BD4D12F86F4A3;
 Mon, 20 Apr 2020 20:26:29 +0800 (CST)
Received: from euler.huawei.com (10.175.104.193) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Mon, 20 Apr 2020 20:26:26 +0800
From: Wei Li <liwei391@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <rdunlap@infradead.org>, <geert@linux-m68k.org>
Subject: [PATCH 2/2] ASoC: Fix wrong dependency of da7210 and wm8983
Date: Tue, 21 Apr 2020 04:24:10 +0800
Message-ID: <20200420202410.47327-3-liwei391@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200420202410.47327-1-liwei391@huawei.com>
References: <20200420202410.47327-1-liwei391@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.193]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 20 Apr 2020 14:55:51 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

As these two drivers support I2C and SPI, we should add the SND_SOC_I2C_AND_SPI
dependency instead.

Fixes: ce0c97f8a2936 ("ASoC: Fix SND_SOC_ALL_CODECS imply SPI fallout")
Signed-off-by: Wei Li <liwei391@huawei.com>
---
 sound/soc/codecs/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index e60e0b6a689c..d0fec1b90256 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -717,7 +717,7 @@ config SND_SOC_L3
 
 config SND_SOC_DA7210
 	tristate
-	depends on I2C
+	depends on SND_SOC_I2C_AND_SPI
 
 config SND_SOC_DA7213
 	tristate "Dialog DA7213 CODEC"
@@ -1569,7 +1569,7 @@ config SND_SOC_WM8978
 
 config SND_SOC_WM8983
 	tristate
-	depends on I2C
+	depends on SND_SOC_I2C_AND_SPI
 
 config SND_SOC_WM8985
 	tristate "Wolfson Microelectronics WM8985 and WM8758 codec driver"
-- 
2.17.1

