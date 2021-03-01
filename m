Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB16D32858E
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 17:57:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 599551687;
	Mon,  1 Mar 2021 17:56:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 599551687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614617848;
	bh=DV/0smjUkzK8zfhix0PtG/TWcgXpG5v/I/DgL483XjY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jo5F3MIZ3sJpMLf6ENlINNWDh82O/TsqBdX17DoscjIzE7bbwsodsN8hZjRBaHgZz
	 DFQNadQuQLPXRJ0XSCh1eKMbCUYHmdxVCvIdG31HdQpD0le96vZNTubiXI2FYzCtCC
	 zF53Kt2NSAMa/P3eHTimG0JoemhuIY9+Ia8k/QIU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F36E6F804A9;
	Mon,  1 Mar 2021 17:54:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3414F80430; Mon,  1 Mar 2021 17:54:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41D90F80257
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 17:54:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41D90F80257
IronPort-SDR: C/DJJINWM0k1Sr3FTpopm8WvGbOtFWa1HiHyfp/ACeHlz3zU5fxi7EUfwwC5YSK2TeKz/P57v3
 49Vnh1t14y8g==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="186580171"
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; d="scan'208";a="186580171"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 08:54:02 -0800
IronPort-SDR: T+BI8PqNi2/ygMFSW00mh3R5IpHRfWpDyK/pkf7N36mfouZQVwcszfnrxfCrWDk+PxWX4gMUZH
 YsLlEuzWnxwA==
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; d="scan'208";a="505330635"
Received: from mhuang8-mobl3.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.25.220])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 08:54:01 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: atom: fix kernel-doc
Date: Mon,  1 Mar 2021 10:53:47 -0600
Message-Id: <20210301165349.114952-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210301165349.114952-1-pierre-louis.bossart@linux.intel.com>
References: <20210301165349.114952-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

v5.12-rc1 flags new warnings with make W=1, fix missing or broken
function descriptors.

sound/soc/intel/atom/sst/sst_loader.c:85: warning: expecting prototype
for sst_start_merrifield(). Prototype was for sst_start_mrfld()
instead

sound/soc/intel/atom/sst/sst_acpi.c:339: warning: expecting prototype
for intel_sst_remove(). Prototype was for sst_acpi_remove() instead

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/atom/sst/sst_acpi.c   | 2 +-
 sound/soc/intel/atom/sst/sst_loader.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/atom/sst/sst_acpi.c b/sound/soc/intel/atom/sst/sst_acpi.c
index 2c1b8a2e3506..3be64430c256 100644
--- a/sound/soc/intel/atom/sst/sst_acpi.c
+++ b/sound/soc/intel/atom/sst/sst_acpi.c
@@ -328,7 +328,7 @@ static int sst_acpi_probe(struct platform_device *pdev)
 }
 
 /**
-* intel_sst_remove - remove function
+* sst_acpi_remove - remove function
 *
 * @pdev:	platform device structure
 *
diff --git a/sound/soc/intel/atom/sst/sst_loader.c b/sound/soc/intel/atom/sst/sst_loader.c
index 1c9b0c9ec483..eea889001c24 100644
--- a/sound/soc/intel/atom/sst/sst_loader.c
+++ b/sound/soc/intel/atom/sst/sst_loader.c
@@ -76,7 +76,7 @@ int intel_sst_reset_dsp_mrfld(struct intel_sst_drv *sst_drv_ctx)
 }
 
 /**
- * sst_start_merrifield - Start the SST DSP processor
+ * sst_start_mrfld - Start the SST DSP processor
  * @sst_drv_ctx: intel_sst_drv context pointer
  *
  * This starts the DSP in MERRIFIELD platfroms
-- 
2.25.1

