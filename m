Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA73156F71
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 07:18:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 989F61670;
	Mon, 10 Feb 2020 07:17:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 989F61670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581315490;
	bh=woiZcTLFw8hSzD3/8xWUmenonxVqlapgDYca/VHrxwg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Q8/c74aUppIZ8h6Of6u/LYCdYsglupEAVpJpeI/fC8NTwihxB1Oc641SA7OpZ9ups
	 HQQuPMFl/Ucj13pWGYAzk5IwIfIhDc/a1icr0RE2RQgmKJKolE9h3i6oCs+Gf60tnG
	 VxY0fbyVgwoVwO9kUWucXUvaXPUGUcaAP65WZI+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB6CBF80158;
	Mon, 10 Feb 2020 07:16:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE303F80157; Mon, 10 Feb 2020 07:16:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4EC7F800FD
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 07:16:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4EC7F800FD
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3918F9EC00137237D55D;
 Mon, 10 Feb 2020 14:15:56 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Mon, 10 Feb 2020
 14:15:48 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
 <kernel@pengutronix.de>, <festevam@gmail.com>, <linux-imx@nxp.com>,
 <pierre-louis.bossart@linux.intel.com>, <yuehaibing@huawei.com>,
 <daniel.baluta@nxp.com>, <krzk@kernel.org>
Date: Mon, 10 Feb 2020 14:15:44 +0800
Message-ID: <20200210061544.7600-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH -next] ASoC: SOF: imx8: Fix randbuild error
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

when do randconfig like this:
CONFIG_SND_SOC_SOF_IMX8_SUPPORT=y
CONFIG_SND_SOC_SOF_IMX8=y
CONFIG_SND_SOC_SOF_OF=y
CONFIG_IMX_DSP=m
CONFIG_IMX_SCU=y

there is a link error:

sound/soc/sof/imx/imx8.o: In function 'imx8_send_msg':
imx8.c:(.text+0x380): undefined reference to 'imx_dsp_ring_doorbell'

Select IMX_DSP in SND_SOC_SOF_IMX8_SUPPORT to fix this

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: f9ad75468453 ("ASoC: SOF: imx: fix reverse CONFIG_SND_SOC_SOF_OF dependency")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/sof/imx/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
index bae4f7b..81274906 100644
--- a/sound/soc/sof/imx/Kconfig
+++ b/sound/soc/sof/imx/Kconfig
@@ -14,7 +14,7 @@ if SND_SOC_SOF_IMX_TOPLEVEL
 config SND_SOC_SOF_IMX8_SUPPORT
 	bool "SOF support for i.MX8"
 	depends on IMX_SCU
-	depends on IMX_DSP
+	select IMX_DSP
 	help
 	  This adds support for Sound Open Firmware for NXP i.MX8 platforms
 	  Say Y if you have such a device.
-- 
2.7.4


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
