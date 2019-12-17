Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D4112373D
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 21:26:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 097031673;
	Tue, 17 Dec 2019 21:25:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 097031673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576614387;
	bh=J8Jh0E6BNV4lhY1Xq7Pqhr8dAKECfooEtCwNpM5v73s=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PfmDtEQUfJCo2kMzF+so4HX7IRNyAa7v+ol7cuT8wAeyLfAOBnO7AybTYMH/11LAe
	 Z6AC25eqa5E8oKqf3dysrS0m87QXNpFAb/mYbonAoqHroSTraTorTcUCJpxYIojBWO
	 l7QSg9rBQOu8QQi2qdwdLoWgiqD/7qQorcoaMlsA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDD39F80277;
	Tue, 17 Dec 2019 21:23:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF4C1F80274; Tue, 17 Dec 2019 21:23:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED8C9F8023F
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 21:22:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED8C9F8023F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 12:22:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,326,1571727600"; d="scan'208";a="266679229"
Received: from smcdonal-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.83.42])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Dec 2019 12:22:50 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 17 Dec 2019 14:22:26 -0600
Message-Id: <20191217202231.18259-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191217202231.18259-1-pierre-louis.bossart@linux.intel.com>
References: <20191217202231.18259-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 3/8] ASoC: SOF: Intel: add namespace for
	BROADWELL
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

Define namespace and include it in ACPI top-level module.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/bdw.c    | 4 ++--
 sound/soc/sof/sof-acpi-dev.c | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 39d1c8c7cddf..f017089c7b2d 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -633,13 +633,13 @@ const struct snd_sof_dsp_ops sof_bdw_ops = {
 			SNDRV_PCM_INFO_PAUSE |
 			SNDRV_PCM_INFO_BATCH,
 };
-EXPORT_SYMBOL(sof_bdw_ops);
+EXPORT_SYMBOL_NS(sof_bdw_ops, SND_SOC_SOF_BROADWELL);
 
 const struct sof_intel_dsp_desc bdw_chip_info = {
 	.cores_num = 1,
 	.cores_mask = 1,
 };
-EXPORT_SYMBOL(bdw_chip_info);
+EXPORT_SYMBOL_NS(bdw_chip_info, SND_SOC_SOF_BROADWELL);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HIFI_EP_IPC);
diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
index 6d44d5802e29..d8ed6bfa5ce7 100644
--- a/sound/soc/sof/sof-acpi-dev.c
+++ b/sound/soc/sof/sof-acpi-dev.c
@@ -241,3 +241,4 @@ module_platform_driver(snd_sof_acpi_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_IMPORT_NS(SND_SOC_SOF_BAYTRAIL);
+MODULE_IMPORT_NS(SND_SOC_SOF_BROADWELL);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
