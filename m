Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED1D31025
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2019 16:27:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B97681612;
	Fri, 31 May 2019 16:27:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B97681612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559312871;
	bh=1vpf/0ozI0L24gri/M10W7kd8otoj3E7OB6Zk+33a2s=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kpHzE+tcw6+xjY91M9FCAIBkiBUtqhOdpQS/nUaB+gvfUCCCSDol6VEEdCzzB+0V8
	 9V3d31auS7/9sqboeLE00fpeZ2aYME1piElJUnr+sHbwmqIotu3LTx+MkUxw8DemOT
	 avotMTvTxMcHR3001qltWNvSxUu/PPnNO2A6OsFA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 664A4F896E8;
	Fri, 31 May 2019 16:26:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18047F896E5; Fri, 31 May 2019 16:26:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BFDCF8072E
 for <alsa-devel@alsa-project.org>; Fri, 31 May 2019 16:26:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BFDCF8072E
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 7962C4FA4D3972CA4A7C;
 Fri, 31 May 2019 22:25:57 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Fri, 31 May 2019
 22:25:47 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <pierre-louis.bossart@linux.intel.com>,
 <yingjiang.zhu@linux.intel.com>
Date: Fri, 31 May 2019 22:25:26 +0800
Message-ID: <20190531142526.12712-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ASoC: SOF: Intel: hda: Fix COMPILE_TEST build
	error
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

while building without PCI:

sound/soc/sof/intel/hda.o: In function `hda_dsp_probe':
hda.c:(.text+0x79c): undefined reference to `pci_ioremap_bar'
hda.c:(.text+0x79c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `pci_ioremap_bar'
hda.c:(.text+0x7c4): undefined reference to `pci_ioremap_bar'
hda.c:(.text+0x7c4): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `pci_ioremap_bar'

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: e13ef82a9ab8 ("ASoC: SOF: add COMPILE_TEST for PCI options")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/sof/intel/hda.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 68db2ac..c1703c4 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -231,7 +231,9 @@ static int hda_init(struct snd_sof_dev *sdev)
 
 	/* initialise hdac bus */
 	bus->addr = pci_resource_start(pci, 0);
+#if IS_ENABLED(CONFIG_PCI)
 	bus->remap_addr = pci_ioremap_bar(pci, 0);
+#endif
 	if (!bus->remap_addr) {
 		dev_err(bus->dev, "error: ioremap error\n");
 		return -ENXIO;
@@ -458,7 +460,9 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 		goto hdac_bus_unmap;
 
 	/* DSP base */
+#if IS_ENABLED(CONFIG_PCI)
 	sdev->bar[HDA_DSP_BAR] = pci_ioremap_bar(pci, HDA_DSP_BAR);
+#endif
 	if (!sdev->bar[HDA_DSP_BAR]) {
 		dev_err(sdev->dev, "error: ioremap error\n");
 		ret = -ENXIO;
-- 
2.7.4


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
