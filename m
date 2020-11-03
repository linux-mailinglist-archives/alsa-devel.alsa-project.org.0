Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6AC2A477A
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 15:12:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8217D17BE;
	Tue,  3 Nov 2020 15:11:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8217D17BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604412748;
	bh=5w7TN05FWhEQU0sV7JHxt2VJz5mLD4YW6RpGIp50jOs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i/RKvtjwic77mtANHaRDQPUCmeRh4e9+DSnxhYnvvLzW1MVYNn5b8H++x3hk9AeXh
	 0P9GTHuD9jfbcXs4JOVT0tCqvqEjymhyJ4E46PdNXQip1frqrGvMeSlyGUTUS30VOd
	 G7jJDoN5AniK/ZbUFuWuQF/Q9S+xFC09vTk3KTQY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAC31F80272;
	Tue,  3 Nov 2020 15:10:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F03F7F80171; Tue,  3 Nov 2020 15:10:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C703CF8015A
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 15:10:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C703CF8015A
IronPort-SDR: CNXqgpdhzIJWNvTWvL7/PwkZ8DziOdOmbXJyJuUNr3BwwKROCl4pwhxY5DW/KKNWkyE36ZBVzo
 YbQKVJ6RER/g==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="166464190"
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="166464190"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 06:10:43 -0800
IronPort-SDR: DEX41euAnkeSL9SsYWN8Zce+RWVd0TZ5gp13rj38px2ouN2Yq7jnhiRelUXZybFR1O5MbNN+Z9
 TmiXObdr/ZBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="336530104"
Received: from mgorski-all-series.igk.intel.com ([10.237.149.201])
 by orsmga002.jf.intel.com with ESMTP; 03 Nov 2020 06:10:41 -0800
From: Mateusz Gorski <mateusz.gorski@linux.intel.com>
To: stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: Intel: Skylake: Add alternative topology binary name
Date: Tue,  3 Nov 2020 15:10:47 +0100
Message-Id: <20201103141047.15053-1-mateusz.gorski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 cezary.rojewski@intel.com, Mateusz Gorski <mateusz.gorski@linux.intel.com>
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

[ Upstream commit 1b290ef023b3eeb4f4688b582fecb773915ef937 ]

Add alternative topology binary file name based on used machine driver
and fallback to use this name after failed attempt to load topology file
with name based on NHLT.
This change addresses multiple issues with current mechanism, for
example - there are devices without NHLT table, and that currently
results in tplg_name being empty.

Signed-off-by: Mateusz Gorski <mateusz.gorski@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200427132727.24942-2-mateusz.gorski@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---

This functionality is merged on upstream kernel and widely used. Merging
it to LTS kernel would improve the user experience and resolve some of the
problems regarding topology naming that the users are facing.

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

