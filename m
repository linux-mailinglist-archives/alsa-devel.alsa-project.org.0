Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DA110B106
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2019 15:19:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFE451714;
	Wed, 27 Nov 2019 15:18:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFE451714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574864361;
	bh=tu5eXIFNGNxppXVS5rqo2o48wGHRUkzJhNXLbXOkCqw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jEjGVg4jZwtvh3kED0mCes4Y4x0Xj/K37j8yWCwI2SRryrCjnoAP4Q/Huup96C+cX
	 G/8XSiqaHR2UmmSTdgVRxLn0CGWS/5mUeqQsus5wMZntBqynRvVKWoisgk6MafRelh
	 o4ILHgWo6Qy6pJmWXJQ5NsloiEqbdN8OHFP62Zps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D63EF8013B;
	Wed, 27 Nov 2019 15:17:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0C9FF8014D; Wed, 27 Nov 2019 15:17:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A714AF800CE
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 15:17:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A714AF800CE
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id EC15AE7AA14F2A1A5D06;
 Wed, 27 Nov 2019 22:17:26 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Wed, 27 Nov 2019
 22:17:17 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.de>, <pierre-louis.bossart@linux.intel.com>,
 <daniel.baluta@nxp.com>, <arnd@arndb.de>, <tglx@linutronix.de>,
 <rdunlap@infradead.org>
Date: Wed, 27 Nov 2019 22:16:49 +0800
Message-ID: <20191127141649.5524-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ASoC: SOF: Intel: Fix build error
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

If SND_INTEL_DSP_CONFIG is m and SND_SOC_SOF_PCI is y,
building fails:

sound/soc/sof/sof-pci-dev.o: In function `sof_pci_probe':
sof-pci-dev.c:(.text+0xb4): undefined reference to `snd_intel_dsp_driver_probe'

Select SND_INTEL_DSP_CONFIG to fix this.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 82d9d54a6c0e ("ALSA: hda: add Intel DSP configuration / probe code")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/sof/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index 71a0fc0..e0b04b5 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -14,6 +14,7 @@ config SND_SOC_SOF_PCI
 	depends on PCI
 	select SND_SOC_SOF
 	select SND_SOC_ACPI if ACPI
+	select SND_INTEL_DSP_CONFIG
 	help
 	  This adds support for PCI enumeration. This option is
 	  required to enable Intel Skylake+ devices
-- 
2.7.4


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
