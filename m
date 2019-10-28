Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D004EE6A90
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 02:47:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59AF01921;
	Mon, 28 Oct 2019 02:46:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59AF01921
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572227257;
	bh=uhPUbi7nrWq/i52LvXSuhUr7h7FHVd5GVfECaq/9Hr4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KpANE26a1w72IllpsZa0iZHBgC4IqY513DEZrcrUqhQrvciSsjPpx0RxSuBnkHB+D
	 WFBjORMnI0Lyk5AVSD3giywEqufGTwWJHgbEkThIZbKXcCaHhgy7Sbr1q0ftwAcWis
	 snWGM5PK2Pbm6FYOk+2y2E/ZW5O5q9vZyTbdiuDw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71D82F805A1;
	Mon, 28 Oct 2019 02:45:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C16CF8045D; Mon, 28 Oct 2019 02:45:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35FD2F803D7
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 02:45:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35FD2F803D7
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id A6D1890E3AA43C01C4FF;
 Mon, 28 Oct 2019 09:45:41 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Mon, 28 Oct 2019 09:45:31 +0800
From: Mao Wenan <maowenan@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.de>, <pierre-louis.bossart@linux.intel.com>,
 <daniel.baluta@nxp.com>, <rdunlap@infradead.org>,
 <ranjani.sridharan@linux.intel.com>, <arnd@arndb.de>
Date: Mon, 28 Oct 2019 09:45:11 +0800
Message-ID: <20191028014511.73472-1-maowenan@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mao Wenan <maowenan@huawei.com>
Subject: [alsa-devel] [PATCH -next] ASoC: SOF: select SND_INTEL_DSP_CONFIG
	in SND_SOC_SOF_PCI
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

When SND_SOC_SOF_PCI=y, and SND_INTEL_DSP_CONFIG=m, below
errors can be seen:
sound/soc/sof/sof-pci-dev.o: In function `sof_pci_probe':
sof-pci-dev.c:(.text+0xb9): undefined reference to
`snd_intel_dsp_driver_probe'

After commit 82d9d54a6c0e ("ALSA: hda: add Intel DSP
configuration / probe code"), sof_pci_probe() will call
snd_intel_dsp_driver_probe(), so it should select
SND_INTEL_DSP_CONFIG in Kconfig SND_SOC_SOF_PCI.

Fixes: 82d9d54a6c0e ("ALSA: hda: add Intel DSP configuration / probe code")
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 sound/soc/sof/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index 56a3ab6..a9b2be2 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -16,6 +16,7 @@ config SND_SOC_SOF_PCI
 	select SND_SOC_ACPI if ACPI
 	select SND_SOC_SOF_OPTIONS
 	select SND_SOC_SOF_INTEL_PCI if SND_SOC_SOF_INTEL_TOPLEVEL
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
