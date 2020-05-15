Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DD31D48CE
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 10:51:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCB8A1669;
	Fri, 15 May 2020 10:50:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCB8A1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589532692;
	bh=InNyj8kGCCBtWFyqJs1adkUjnVVrLbLTIhoKQrd7C5E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dA4OzZgMBVaHNt0cZykFAE0BUaszvGwbuKbKEIrfLygL1o/04+igQY0BkAHRf91qe
	 Rm0u9EoiaJVkPjMjdVCB6bSxVjbbTGDRQmSy6b3eVkv04j/PzfaiZmrpA2B/yl6m0M
	 wUF4k4TWx4ZPAjbXbddGqIPtj+CajqxhDBv4KGvY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E451CF80253;
	Fri, 15 May 2020 10:49:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1375F80247; Fri, 15 May 2020 10:49:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA2CEF800B8
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 10:49:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA2CEF800B8
IronPort-SDR: awcDyll+mKp8/m/KIlwyojfCKRqbcELe5Iw/qHCdOQf13qWpI8HrjV6r+Q/fQSvB8rwz+yHKlK
 lAqRS0U6Qr/g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 01:49:40 -0700
IronPort-SDR: oDrUNPbiHd/M5RFS0gAHOqivJNzKipyo93L7ifXNQUPET25SufIABw1/kVHAxn1mOrtFP+aEm5
 3ySBv+VoT+hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,394,1583222400"; d="scan'208";a="464838016"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 15 May 2020 01:49:38 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RESEND PATCH v2] ALSA: hda: Allow SST driver on SKL and KBL
 platforms with DMIC
Date: Fri, 15 May 2020 10:49:34 +0200
Message-Id: <20200515084934.28156-1-cezary.rojewski@intel.com>
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
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

