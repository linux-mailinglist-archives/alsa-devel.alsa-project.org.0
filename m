Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F370BA9AD9
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2019 08:46:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FFA61671;
	Thu,  5 Sep 2019 08:45:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FFA61671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567665978;
	bh=U0RbvbCv3fK+4wNo57AkDLW1lJniDDpdMvfumxZmCIU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XNp7eTiCxcQP3nxdDdUiod4RQuBOAZvgSyuRsxuQzl17MbAVVQ2fWm85cmFzQHfl5
	 AQ0mWNsUnjxFA0+kkQu/6AO9h1PlYKa0ml/M527m7I5vP/rEz4XAtjxV4X9j6MlcGx
	 ENfMGVrUHNaAcF+G1EUQSOhQWgnRq0n5fRqRSlKQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1534BF803D1;
	Thu,  5 Sep 2019 08:44:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93C76F80448; Thu,  5 Sep 2019 08:44:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0137F802DF
 for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2019 08:44:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0137F802DF
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 105E6ECC49D523990C50;
 Thu,  5 Sep 2019 14:44:19 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Thu, 5 Sep 2019
 14:44:11 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
 <kernel@pengutronix.de>, <festevam@gmail.com>, <linux-imx@nxp.com>,
 <daniel.baluta@nxp.com>, <yuehaibing@huawei.com>,
 <pierre-louis.bossart@linux.intel.com>
Date: Thu, 5 Sep 2019 14:44:00 +0800
Message-ID: <20190905064400.24800-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH -next] ASoC: SOF: imx8: Fix COMPILE_TEST error
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

When do compile test, if SND_SOC_SOF_OF is not set, we get:

sound/soc/sof/imx/imx8.o: In function `imx8_dsp_handle_request':
imx8.c:(.text+0xb0): undefined reference to `snd_sof_ipc_msgs_rx'
sound/soc/sof/imx/imx8.o: In function `imx8_ipc_msg_data':
imx8.c:(.text+0xf4): undefined reference to `sof_mailbox_read'
sound/soc/sof/imx/imx8.o: In function `imx8_dsp_handle_reply':
imx8.c:(.text+0x160): undefined reference to `sof_mailbox_read'

Make SND_SOC_SOF_IMX_TOPLEVEL always depends on SND_SOC_SOF_OF

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 202acc565a1f ("ASoC: SOF: imx: Add i.MX8 HW support")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/sof/imx/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
index fd73d84..5acae75 100644
--- a/sound/soc/sof/imx/Kconfig
+++ b/sound/soc/sof/imx/Kconfig
@@ -2,7 +2,8 @@
 
 config SND_SOC_SOF_IMX_TOPLEVEL
 	bool "SOF support for NXP i.MX audio DSPs"
-	depends on ARM64 && SND_SOC_SOF_OF || COMPILE_TEST
+	depends on ARM64|| COMPILE_TEST
+	depends on SND_SOC_SOF_OF
 	help
           This adds support for Sound Open Firmware for NXP i.MX platforms.
           Say Y if you have such a device.
-- 
2.7.4


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
