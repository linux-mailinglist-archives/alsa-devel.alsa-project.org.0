Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D76223183
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 05:09:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC0C91614;
	Fri, 17 Jul 2020 05:08:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC0C91614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594955372;
	bh=ye3OrpTDfCYKMWaoPnm2vwD7mZygWYmTGjzvyjCq9Rk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X3tv6lc7y1XaJx6shCmN4F/6DaDXplpVCQ+6biI50ZMLLCkyiQ6LBiYaA5zq7p39l
	 ZyDNlhGG6StN9untFkXsKqfc+XQO/3QsjDRO+B3u7/NfQvew9rAHbUIuUFS14Het24
	 vJWKyJhcYwYRIg6+U6h6FMEdyP3QUeH3RSD7xYIs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3A6AF80305;
	Fri, 17 Jul 2020 05:04:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45BB6F802FB; Fri, 17 Jul 2020 05:04:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0FA3F802E8
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 05:04:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0FA3F802E8
IronPort-SDR: QH7jsuSyn6b8XJLtQ70aPUESXMIgGKzfCxfUHA+yjV4EsB1I5P0QwVMFgfZRgieWwBr/6ljpmC
 W+4MKmGZwvmQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9684"; a="147518713"
X-IronPort-AV: E=Sophos;i="5.75,361,1589266800"; d="scan'208";a="147518713"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2020 20:04:28 -0700
IronPort-SDR: cWaqfjxiyrLjSXD2/c0orjjtSTuwm51MT4TTEDu85VxShWlQn9eYRKzJ9vlxY45Cpb5vS9pwdA
 e4+8Zx1IlHwg==
X-IronPort-AV: E=Sophos;i="5.75,361,1589266800"; d="scan'208";a="460699722"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2020 20:04:22 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 6/9] soundwire: intel_init: use EXPORT_SYMBOL_NS
Date: Thu, 16 Jul 2020 23:09:44 +0800
Message-Id: <20200716150947.22119-7-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200716150947.22119-1-yung-chuan.liao@linux.intel.com>
References: <20200716150947.22119-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Make sure all symbols in this soundwire-intel-init module are exported
with a namespace.

The MODULE_IMPORT_NS will be used in Intel/SOF HDaudio modules to be
posted in a separate series.

Namespaces are only introduced for the Intel parts of the SoundWire
code at this time, in future patches we should also add namespaces for
Cadence parts and the SoundWire core.

Suggested-by: Greg KH <gregkh@linuxfoundation.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel_init.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index d8f0c1472f1f..ad3175272e88 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -164,7 +164,7 @@ void sdw_intel_enable_irq(void __iomem *mmio_base, bool enable)
 
 	writel(val, mmio_base + HDA_DSP_REG_ADSPIC2);
 }
-EXPORT_SYMBOL(sdw_intel_enable_irq);
+EXPORT_SYMBOL_NS(sdw_intel_enable_irq, SOUNDWIRE_INTEL_INIT);
 
 static struct sdw_intel_ctx
 *sdw_intel_probe_controller(struct sdw_intel_res *res)
@@ -353,7 +353,7 @@ int sdw_intel_acpi_scan(acpi_handle *parent_handle,
 
 	return sdw_intel_scan_controller(info);
 }
-EXPORT_SYMBOL(sdw_intel_acpi_scan);
+EXPORT_SYMBOL_NS(sdw_intel_acpi_scan, SOUNDWIRE_INTEL_INIT);
 
 /**
  * sdw_intel_probe() - SoundWire Intel probe routine
@@ -370,7 +370,7 @@ struct sdw_intel_ctx
 {
 	return sdw_intel_probe_controller(res);
 }
-EXPORT_SYMBOL(sdw_intel_probe);
+EXPORT_SYMBOL_NS(sdw_intel_probe, SOUNDWIRE_INTEL_INIT);
 
 /**
  * sdw_intel_startup() - SoundWire Intel startup
@@ -383,7 +383,7 @@ int sdw_intel_startup(struct sdw_intel_ctx *ctx)
 {
 	return sdw_intel_startup_controller(ctx);
 }
-EXPORT_SYMBOL(sdw_intel_startup);
+EXPORT_SYMBOL_NS(sdw_intel_startup, SOUNDWIRE_INTEL_INIT);
 /**
  * sdw_intel_exit() - SoundWire Intel exit
  * @ctx: SoundWire context allocated in the probe
@@ -394,7 +394,7 @@ void sdw_intel_exit(struct sdw_intel_ctx *ctx)
 {
 	sdw_intel_cleanup(ctx);
 }
-EXPORT_SYMBOL(sdw_intel_exit);
+EXPORT_SYMBOL_NS(sdw_intel_exit, SOUNDWIRE_INTEL_INIT);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("Intel Soundwire Init Library");
-- 
2.17.1

