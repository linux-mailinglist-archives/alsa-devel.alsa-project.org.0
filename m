Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1848E1C8827
	for <lists+alsa-devel@lfdr.de>; Thu,  7 May 2020 13:27:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78903180E;
	Thu,  7 May 2020 13:26:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78903180E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588850842;
	bh=sj9ixqL7egR1PrNKQy2OTC8x1r/61xMdUP5Zti7x0k8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=j5vFoYEa6BH6yHDhdXqfJOXaYi4xoaDSd97Sgdq6Y4EFD86tj9b/ETr8txhDQi7lg
	 kYn/1Xyg15SjdSRW+d1U/VAwbZA7CwN7xHgGpa2pRREN/JizBE+W8b8I0WKyiRt/Zk
	 3Xvij5Z1+QqoEjlxjAc/0yqG1UvRcu+jYS/FkheI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9337CF80171;
	Thu,  7 May 2020 13:25:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B3C3F80162; Thu,  7 May 2020 13:25:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11A9FF8011C
 for <alsa-devel@alsa-project.org>; Thu,  7 May 2020 13:25:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11A9FF8011C
IronPort-SDR: HEN8pqOecrx0+qgQxsjKaDWitPrdxrITz116/ymW4+Zg4TJb5EC6pwFWwwzR4yLQSdctFXH8OR
 Puur+CHupvrA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 04:25:28 -0700
IronPort-SDR: 6FVrLs9omQwi3e5tj6xA7bugTCt+HI734MocKNjFfaiL9PHggGdrVWqCgIcA6lmVSgC3k+itXB
 Y60MyyYBUjfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,363,1583222400"; d="scan'208";a="284962558"
Received: from pi-desktop.igk.intel.com ([10.237.148.102])
 by fmsmga004.fm.intel.com with ESMTP; 07 May 2020 04:25:26 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/2] ASoC: Intel: baytrail: Fix register access
Date: Thu,  7 May 2020 09:34:04 -0400
Message-Id: <20200507133405.32251-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

Baytrail has 64 bit registers, so we should use *read64* to read from it
and then use proper mask values to check status.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/baytrail/sst-baytrail-ipc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/baytrail/sst-baytrail-ipc.c b/sound/soc/intel/baytrail/sst-baytrail-ipc.c
index 74274bd38f7a..34746fd871b0 100644
--- a/sound/soc/intel/baytrail/sst-baytrail-ipc.c
+++ b/sound/soc/intel/baytrail/sst-baytrail-ipc.c
@@ -666,8 +666,8 @@ static bool byt_is_dsp_busy(struct sst_dsp *dsp)
 {
 	u64 ipcx;
 
-	ipcx = sst_dsp_shim_read_unlocked(dsp, SST_IPCX);
-	return (ipcx & (SST_IPCX_BUSY | SST_IPCX_DONE));
+	ipcx = sst_dsp_shim_read64_unlocked(dsp, SST_IPCX);
+	return (ipcx & (SST_BYT_IPCX_BUSY | SST_BYT_IPCX_DONE));
 }
 
 int sst_byt_dsp_init(struct device *dev, struct sst_pdata *pdata)
-- 
2.17.1

