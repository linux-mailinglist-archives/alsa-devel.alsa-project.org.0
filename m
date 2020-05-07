Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D055F1C807D
	for <lists+alsa-devel@lfdr.de>; Thu,  7 May 2020 05:23:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72BA417D2;
	Thu,  7 May 2020 05:22:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72BA417D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588821813;
	bh=HrvcfqRG01OZUNkY/PnlUes2dBz8vWb4ewWMu1FQLd0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TTBvgxb843j+lULyjcrfzQZzUjUQ3s86X5uRJZ+ujyHfGaOKwRWEr9cq9cxVsY7bM
	 //ZnERX0ZUhUzeUGH6ksAm4UxUdicwo7cCB2skZzomJHMC2rv//AULIdUKRqNQDKLf
	 yJqlNstq8VrXoGPWNlVdS5rVWSBRjoAflqwN2Oy8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86CCDF8015B;
	Thu,  7 May 2020 05:21:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B54FF8015F; Thu,  7 May 2020 05:21:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 960DBF800AD;
 Thu,  7 May 2020 05:21:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 960DBF800AD
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 5F3E26763DC8128E49C9;
 Thu,  7 May 2020 11:19:54 +0800 (CST)
Received: from localhost (10.166.215.154) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Thu, 7 May 2020
 11:19:40 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <pierre-louis.bossart@linux.intel.com>, <lgirdwood@gmail.com>,
 <ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
 <daniel.baluta@nxp.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH -next] ASoC: SOF: Intel: Mark cht_debugfs as __maybe_unused
Date: Thu, 7 May 2020 11:19:11 +0800
Message-ID: <20200507031911.38644-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.166.215.154]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
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

When CONFIG_SND_SOC_SOF_BAYTRAIL is not set, gcc warns:

sound/soc/sof/intel/byt.c:85:41: warning: ‘cht_debugfs’ defined but not used [-Wunused-const-variable=]
 static const struct snd_sof_debugfs_map cht_debugfs[] = {
                                         ^~~~~~~~~~~
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/sof/intel/byt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index f872bb1f2682..1c75e4220e9d 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -82,7 +82,7 @@ static const struct snd_sof_debugfs_map byt_debugfs[] = {
 	 SOF_DEBUGFS_ACCESS_ALWAYS},
 };
 
-static const struct snd_sof_debugfs_map cht_debugfs[] = {
+static const struct snd_sof_debugfs_map __maybe_unused cht_debugfs[] = {
 	{"dmac0", BYT_DSP_BAR, DMAC0_OFFSET, DMAC_SIZE,
 	 SOF_DEBUGFS_ACCESS_ALWAYS},
 	{"dmac1", BYT_DSP_BAR,  DMAC1_OFFSET, DMAC_SIZE,
-- 
2.17.1


