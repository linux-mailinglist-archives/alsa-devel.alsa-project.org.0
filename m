Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B87FF19E3F
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2019 15:31:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C8371AA3;
	Fri, 10 May 2019 15:31:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C8371AA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557495115;
	bh=Z3OQ2V0q0c9hYyAUIx2QvFg9ENjZnqiXNzfgl+IFKwE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LUAnHOmcbSyDXbbMBGwFjKVDJsLUT7/BE0iXEcaq7klg1mujkC2h13ehSgnkyBrTu
	 v+dfh4b+er1z9KPURnqmj4f6hxNcdhApF9BIFeH+dwz9cFKg/AbNp/hkkq1jbvWNaT
	 NRbMI1eoh1W3a9FcyXSR10DYOx6LFW+CQNMAyFjQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12C43F896FD;
	Fri, 10 May 2019 15:30:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92752F896FD; Fri, 10 May 2019 15:30:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAA73F8073C
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 15:30:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAA73F8073C
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 088698B173D41A017B76;
 Fri, 10 May 2019 21:29:57 +0800 (CST)
Received: from localhost (10.177.31.96) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Fri, 10 May 2019
 21:29:50 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <pierre-louis.bossart@linux.intel.com>,
 <rdunlap@infradead.org>
Date: Fri, 10 May 2019 21:29:40 +0800
Message-ID: <20190510132940.28184-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
In-Reply-To: <20190510023657.8960-1-yuehaibing@huawei.com>
References: <20190510023657.8960-1-yuehaibing@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH V2] ASoC: SOF: Fix build error with
	CONFIG_SND_SOC_SOF_NOCODEC=m
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

Fix gcc build error while CONFIG_SND_SOC_SOF_NOCODEC=m

sound/soc/sof/core.o: In function `snd_sof_device_probe':
core.c:(.text+0x4af): undefined reference to `sof_nocodec_setup'

Change IS_ENABLED to IS_REACHABLE to fix this.

Reported-by: Hulk Robot <hulkci@huawei.com>
Suggested-by: Takashi Iwai <tiwai@suse.de>
Fixes: c16211d6226d ("ASoC: SOF: Add Sound Open Firmware driver core")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
V2: use IS_REACHABLE
---
 sound/soc/sof/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 32105e0..38e22f4 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -259,7 +259,7 @@ int snd_sof_create_page_table(struct snd_sof_dev *sdev,
 static int sof_machine_check(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pdata *plat_data = sdev->pdata;
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC)
+#if IS_REACHABLE(CONFIG_SND_SOC_SOF_NOCODEC)
 	struct snd_soc_acpi_mach *machine;
 	int ret;
 #endif
@@ -267,7 +267,7 @@ static int sof_machine_check(struct snd_sof_dev *sdev)
 	if (plat_data->machine)
 		return 0;
 
-#if !IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC)
+#if !IS_REACHABLE(CONFIG_SND_SOC_SOF_NOCODEC)
 	dev_err(sdev->dev, "error: no matching ASoC machine driver found - aborting probe\n");
 	return -ENODEV;
 #else
-- 
2.7.4


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
