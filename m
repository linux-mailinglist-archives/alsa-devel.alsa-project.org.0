Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB081C7B6A
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 22:41:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8E1317BF;
	Wed,  6 May 2020 22:41:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8E1317BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588797711;
	bh=qHxAjasX+iiJ+2OGHTfFcSN9Vx62FWUuUGX8w9C8X80=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CAeaNUJrYAiXxx915M69IgAMhOxad44VXIo2Df152LfZGT8/Rr2Cmk6nS7ckXoG0T
	 MWh/qmalERQd+yXizkgMulElIdx1cXc9SN2iS/1WgrqraSKIxTruZL8uXT2eQyVI5R
	 nb4EWEo5ie/1LeYjKmv+itz5Nb0a0WxOllgmW2No=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6993EF800AD;
	Wed,  6 May 2020 22:40:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAD9DF80259; Wed,  6 May 2020 22:40:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55876F80253
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 22:40:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55876F80253
IronPort-SDR: LdKHhm70CTbtumzcWVTteRzCdv6Us08daweqioCWIbba8bTU1PnnQ/Bh+7DhIvJJpNx2vT9SEu
 16Lslfmn8rWg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 13:39:56 -0700
IronPort-SDR: 9wgRkxaGf/QLvPgBZxkt+GGSsxnq4HdImPJOIn8MSGIoILJuUAGWiTXO7IiAcK7V3rzDNIk/MX
 BewWGc5lcGsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,360,1583222400"; d="scan'208";a="435018758"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga005.jf.intel.com with ESMTP; 06 May 2020 13:39:54 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ALSA: hda: Allow SST driver on SKL and KBL platforms with
 DMIC
Date: Wed,  6 May 2020 22:39:51 +0200
Message-Id: <20200506203951.6369-1-cezary.rojewski@intel.com>
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

Changes in v2:
- no functional changes, just rebased to fix conflicts

 sound/hda/intel-dsp-config.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index 1c1fdab2a55f..20b8f6cb3ff8 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -19,6 +19,7 @@ MODULE_PARM_DESC(dsp_driver, "Force the DSP driver for Intel DSP (0=auto, 1=lega
 
 #define FLAG_SST			BIT(0)
 #define FLAG_SOF			BIT(1)
+#define FLAG_SST_ONLY_IF_DMIC		BIT(15)
 #define FLAG_SOF_ONLY_IF_DMIC		BIT(16)
 #define FLAG_SOF_ONLY_IF_SOUNDWIRE	BIT(17)
 
@@ -107,6 +108,10 @@ static const struct config_entry config_table[] = {
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
@@ -123,6 +128,10 @@ static const struct config_entry config_table[] = {
 			{}
 		}
 	},
+	{
+		.flags = FLAG_SST | FLAG_SST_ONLY_IF_DMIC,
+		.device = 0x9d71,
+	},
 #endif
 
 /*
@@ -410,8 +419,17 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
 			return SND_INTEL_DSP_DRIVER_SOF;
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

