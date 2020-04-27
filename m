Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1331BA4B5
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 15:29:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E6E21690;
	Mon, 27 Apr 2020 15:28:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E6E21690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587994168;
	bh=mysuHGtNlVze4lJL0JPP+ukt9AFJ8sdO0zF6bDEMHnA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jHCuoTlJ8nyO7epfEcCCUUi06V58Dd5xvHGQoVI4D7xBVmKbbPrlzVz61qz+RFIHd
	 Clfz9CCHDNZBxK2nUzOUuLzXpa9lExwhpF3rEgCiIeC3qNpr9w8E4S0goxMqnM1AvD
	 fk7uC9IWqcwEb0GBjlUTENM56ZGYUSDk3/Mt77Io=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 077BEF80232;
	Mon, 27 Apr 2020 15:27:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 017B2F80245; Mon, 27 Apr 2020 15:27:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4066CF80217
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 15:27:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4066CF80217
IronPort-SDR: fhuU5nayKU1UbidMkLZnfS/M8dFu6m+q7tgR/ZotmdvD60WlclMX3+jJkaCYbijLuzrgL73+BT
 3MGSaBZREP0Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 06:27:35 -0700
IronPort-SDR: YieW0qC/nAqW7E10bYLLH1NQcP3XquWAUnnKRVTa2aorF8LYMI2BxXa+HX7YKkuM3M73jFZCvI
 zqTKG683n7yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,324,1583222400"; d="scan'208";a="458856204"
Received: from mgorski-all-series.igk.intel.com ([10.237.149.201])
 by fmsmga006.fm.intel.com with ESMTP; 27 Apr 2020 06:27:33 -0700
From: Mateusz Gorski <mateusz.gorski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v6 1/3] ASoC: Intel: Skylake: Add alternative topology binary
 name
Date: Mon, 27 Apr 2020 15:27:25 +0200
Message-Id: <20200427132727.24942-2-mateusz.gorski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200427132727.24942-1-mateusz.gorski@linux.intel.com>
References: <20200427132727.24942-1-mateusz.gorski@linux.intel.com>
Cc: Mateusz Gorski <mateusz.gorski@linux.intel.com>, cezary.rojewski@intel.com,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
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

Add alternative topology binary file name based on used machine driver
and fallback to use this name after failed attempt to load topology file
with name based on NHLT.
This change addresses multiple issues with current mechanism, for
example - there are devices without NHLT table, and that currently
results in tplg_name being empty.

Signed-off-by: Mateusz Gorski <mateusz.gorski@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---

Changes in v2:
- added <sound/soc-acpi.h> include
- machine driver name is now read from different field

Changes in v3:
- deleted additional newline after component_load:

Changes in v4:
--none--

Changes in v5:
- addressed "checkpatch.pl --strict" warnings

Changes in v6:
--none--

 sound/soc/intel/skylake/skl-topology.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index 69cd7a81bf2a..4b114ece58c6 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -14,6 +14,7 @@
 #include <linux/uuid.h>
 #include <sound/intel-nhlt.h>
 #include <sound/soc.h>
+#include <sound/soc-acpi.h>
 #include <sound/soc-topology.h>
 #include <uapi/sound/snd_sst_tokens.h>
 #include <uapi/sound/skl-tplg-interface.h>
@@ -3565,8 +3566,20 @@ int skl_tplg_init(struct snd_soc_component *component, struct hdac_bus *bus)
 
 	ret = request_firmware(&fw, skl->tplg_name, bus->dev);
 	if (ret < 0) {
-		dev_info(bus->dev, "tplg fw %s load failed with %d, falling back to dfw_sst.bin",
-				skl->tplg_name, ret);
+		char alt_tplg_name[64];
+
+		snprintf(alt_tplg_name, sizeof(alt_tplg_name), "%s-tplg.bin",
+			 skl->mach->drv_name);
+		dev_info(bus->dev, "tplg fw %s load failed with %d, trying alternative tplg name %s",
+			 skl->tplg_name, ret, alt_tplg_name);
+
+		ret = request_firmware(&fw, alt_tplg_name, bus->dev);
+		if (!ret)
+			goto component_load;
+
+		dev_info(bus->dev, "tplg %s failed with %d, falling back to dfw_sst.bin",
+			 alt_tplg_name, ret);
+
 		ret = request_firmware(&fw, "dfw_sst.bin", bus->dev);
 		if (ret < 0) {
 			dev_err(bus->dev, "Fallback tplg fw %s load failed with %d\n",
@@ -3575,6 +3588,8 @@ int skl_tplg_init(struct snd_soc_component *component, struct hdac_bus *bus)
 		}
 	}
 
+component_load:
+
 	/*
 	 * The complete tplg for SKL is loaded as index 0, we don't use
 	 * any other index
-- 
2.17.1

