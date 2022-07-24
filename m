Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4D557F964
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jul 2022 08:28:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B14D851;
	Mon, 25 Jul 2022 08:27:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B14D851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658730503;
	bh=gbq29y0d+3+Tl15HLahqUhpA3FdGxk3TpvbT+SoaMl4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=F+oANtxFtm3/xDu1x43dNCAcNWTG6CNMUinMhSdLmzGdmsPUg0+EmWrYUcv4QYxQ6
	 C8LPFmvqSilvrSGqvSMoHdKVGEX2DvpUaZnW1/DQ+092J56ZicvQ+rPScFLfI0FfOK
	 cCkXn/iyLLGxAZoZo/OsfRlNmIPb5FqsrfqONXCw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF9EBF80558;
	Mon, 25 Jul 2022 08:25:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7405AF8016A; Sun, 24 Jul 2022 13:08:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83037F80128
 for <alsa-devel@alsa-project.org>; Sun, 24 Jul 2022 13:08:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83037F80128
Received: from dggpeml500026.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LrL0f0tnKzWf6t;
 Sun, 24 Jul 2022 19:04:34 +0800 (CST)
Received: from dggpeml500008.china.huawei.com (7.185.36.147) by
 dggpeml500026.china.huawei.com (7.185.36.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sun, 24 Jul 2022 19:08:24 +0800
Received: from huawei.com (10.67.175.34) by dggpeml500008.china.huawei.com
 (7.185.36.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sun, 24 Jul
 2022 19:08:24 +0800
From: Ren Zhijie <renzhijie2@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <matthias.bgg@gmail.com>, <trevor.wu@mediatek.com>,
 <angelogioacchino.delregno@collabora.com>, <tzungbi@kernel.org>,
 <jiaxin.yu@mediatek.com>, <julianbraha@gmail.com>, <geert+renesas@glider.be>
Subject: [PATCH -next] ASoC: mediatek: mt8186: fix Kconfig dependency
Date: Sun, 24 Jul 2022 19:06:19 +0800
Message-ID: <20220724110619.212774-1-renzhijie2@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.175.34]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500008.china.huawei.com (7.185.36.147)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 25 Jul 2022 08:25:50 +0200
Cc: alsa-devel@alsa-project.org, renzhijie2@huawei.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

If CONFIG_SND_SOC_MT8186=y and CONFIG_SND_SOC_MT6358 is not set,
make ARCH=x86_64 CROSS_COMPILE=x86_64-linux-gnu-, will be failed, like this:

sound/soc/mediatek/mt8186/mt8186-mt6366-common.o: In function `mt8186_mt6366_init':
mt8186-mt6366-common.c:(.text+0x4d): undefined reference to `mt6358_set_mtkaif_protocol'
make: *** [vmlinux] Error 1

To fix this build error, add select SND_SOC_MT6358 to config SND_SOC_MT8186 dependency.

Fixes: 097e874ad3fc ("ASoC: mediatek: mt8186: add platform driver")
Signed-off-by: Ren Zhijie <renzhijie2@huawei.com>
---
 sound/soc/mediatek/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 96917743b0db..363fa4d47680 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -157,6 +157,7 @@ config SND_SOC_MT8186
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	depends on COMMON_CLK
 	select SND_SOC_MEDIATEK
+	select SND_SOC_MT6358
 	select MFD_SYSCON if SND_SOC_MT6358
 	help
 	  This adds ASoC driver for Mediatek MT8186 boards
-- 
2.17.1

