Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B0C2860C2
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Oct 2020 15:59:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A27A216C3;
	Wed,  7 Oct 2020 15:58:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A27A216C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602079151;
	bh=IsO9uIgM3jAz5GEPK6KyDGcLNabW1GKPAvqmLoD7EwM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IxNmqJVK6AXCO3NUu2tnvi/TOgBnTjfSxIrCcexOplZADUS5GcM5pZiYA/EnT3f6+
	 ptjaLD0yAboPVz7qXEV4Rk6K8QKeoo8bMEjHS3byNMCQifzq6n7HIec4nF/dlNCKB2
	 Lb6eYx4y6pJh7ugRZnePxKI3oiDJ+UYTp4rUHbMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50CDEF8016B;
	Wed,  7 Oct 2020 15:57:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99F86F8016A; Wed,  7 Oct 2020 15:57:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B6A4F80090
 for <alsa-devel@alsa-project.org>; Wed,  7 Oct 2020 15:57:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B6A4F80090
IronPort-SDR: yWb7vHnWhw3KB+4mCK85Th4j1BVsKYdaBYbqXIynpkdob2Q+GzDfwcYH1rKBtllgnoiMNHA5di
 sok124K6ZAwA==
X-IronPort-AV: E=McAfee;i="6000,8403,9767"; a="249657117"
X-IronPort-AV: E=Sophos;i="5.77,347,1596524400"; d="scan'208";a="249657117"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2020 06:57:20 -0700
IronPort-SDR: hXWzB0OM5egy19DPhsrUao72S+bNl3zKcBpfJlV+n0SsFNtCz7pfv0osXXmVnw7cI+zUepPcR4
 TTfJGC3p+QeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,347,1596524400"; d="scan'208";a="518844574"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga005.fm.intel.com with ESMTP; 07 Oct 2020 06:57:18 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ASoC: Intel: catpt: Fix compilation when CONFIG_MODULES
 is disabled
Date: Wed,  7 Oct 2020 15:57:00 +0200
Message-Id: <20201007135701.20372-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, rdunlap@infradead.org,
 lgirdwood@gmail.com, tiwai@suse.com, broonie@kernel.org
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

module_is_live() is available only when CONFIG_MODULES is enabled.
Replace its usage with try_module_get() which is present regardless of
said config's status.

Fixes: 7a10b66a5df9 ("ASoC: Intel: catpt: Device driver lifecycle")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/device.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
index 390ffb203de0..a70179959795 100644
--- a/sound/soc/intel/catpt/device.c
+++ b/sound/soc/intel/catpt/device.c
@@ -81,10 +81,11 @@ static int __maybe_unused catpt_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	if (!module_is_live(dev->driver->owner)) {
+	if (!try_module_get(dev->driver->owner)) {
 		dev_info(dev, "module unloading, skipping fw boot\n");
 		return 0;
 	}
+	module_put(dev->driver->owner);
 
 	ret = catpt_boot_firmware(cdev, true);
 	if (ret) {
@@ -107,10 +108,12 @@ static int __maybe_unused catpt_resume(struct device *dev)
 
 static int __maybe_unused catpt_runtime_suspend(struct device *dev)
 {
-	if (!module_is_live(dev->driver->owner)) {
+	if (!try_module_get(dev->driver->owner)) {
 		dev_info(dev, "module unloading, skipping suspend\n");
 		return 0;
 	}
+	module_put(dev->driver->owner);
+
 	return catpt_suspend(dev);
 }
 
-- 
2.17.1

