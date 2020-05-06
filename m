Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EA91C7B16
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 22:19:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 800FC17B1;
	Wed,  6 May 2020 22:18:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 800FC17B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588796345;
	bh=b4QLlRvINfAr/BNEsocEPHcUzQqBJtESB4ewC9nKlmg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZfR5H75ZWhuCA8WeZTkpNDM0M1FWrMWhpJeI4/ZbtjQICcKvrU8aCrqjY1PfipWxo
	 eX5EI8a2gOdTNX0KuuLJ+ZlAq7sVtg566oX+onx9fygosbw7dga19g2wx6AY3MMkK+
	 3kZhSfYHgXuATyGZX785IqC/eBlfr7bY5IyP7qWw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5C8BF80249;
	Wed,  6 May 2020 22:17:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1428DF80249; Wed,  6 May 2020 22:17:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89ECDF800DF
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 22:17:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89ECDF800DF
IronPort-SDR: iqWpZIOo7O2mtKdtiOHPcU6A83DNBPRvzhL2OQ7lGgWTFAVF3GhvW2wlfPkxNPO82kySnQuTJ9
 wuxtDJVm5WkQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 13:17:00 -0700
IronPort-SDR: 3Hyxf05//Wns/AqowKuZvJVr5Rz5uQib2E4h7tay+ZcVOJmCyzS4q2djdwVtgPM4tJPJDVK9bj
 GdLgw8ZOCsSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,360,1583222400"; d="scan'208";a="295456824"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga002.fm.intel.com with ESMTP; 06 May 2020 13:16:59 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: Allow SST driver on SKL and KBL platforms with DMIC
Date: Wed,  6 May 2020 22:16:56 +0200
Message-Id: <20200506201656.18299-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com
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

Update intel-dspcfg with FLAG_SST_ONLY_IF_DMIC option and use it for
Skylake and Kabylake platforms when DMIC is present.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/hda/intel-dsp-config.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index be1df80ed013..41c271d646bf 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -16,6 +16,7 @@ MODULE_PARM_DESC(dsp_driver, "Force the DSP driver for Intel DSP (0=auto, 1=lega
 
 #define FLAG_SST		BIT(0)
 #define FLAG_SOF		BIT(1)
+#define FLAG_SST_ONLY_IF_DMIC	BIT(15)
 #define FLAG_SOF_ONLY_IF_DMIC	BIT(16)
 
 struct config_entry {
@@ -100,6 +101,10 @@ static const struct config_entry config_table[] = {
 			{}
 		}
 	},
+	{
+		.flags = FLAG_SST | FLAG_SST_ONLY_IF_DMIC,
+		.device = 0x9d70,
+	},
 #endif
 /* Kabylake-LP */
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_KBL)
@@ -116,6 +121,10 @@ static const struct config_entry config_table[] = {
 			{}
 		}
 	},
+	{
+		.flags = FLAG_SST | FLAG_SST_ONLY_IF_DMIC,
+		.device = 0x9d71,
+	},
 #endif
 
 /*
@@ -346,8 +355,17 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
 		}
 	}
 
-	if (cfg->flags & FLAG_SST)
-		return SND_INTEL_DSP_DRIVER_SST;
+
+	if (cfg->flags & FLAG_SST) {
+		if (cfg->flags & FLAG_SST_ONLY_IF_DMIC) {
+			if (snd_intel_dsp_check_dmic(pci)) {
+				dev_info(&pci->dev, "Digital mics found on Skylake+ platform, using SST driver\n");
+				return SND_INTEL_DSP_DRIVER_SST;
+			}
+		} else {
+			return SND_INTEL_DSP_DRIVER_SST;
+		}
+	}
 
 	return SND_INTEL_DSP_DRIVER_LEGACY;
 }
-- 
2.17.1

