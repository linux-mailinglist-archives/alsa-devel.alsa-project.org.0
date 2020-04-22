Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EF61B43FB
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Apr 2020 14:07:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D34416C5;
	Wed, 22 Apr 2020 14:06:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D34416C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587557251;
	bh=D9YA1AshKpQRzJ8fv/7d2z6OtqARzoP3Y/p03/SgrEo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=raGAozIhWFfmj1ljnL1TdpppwtRNza6IaECl0GtiTirMHKSFWhVzh1PtS8D3FDk6U
	 E+kNSUGxfnqV4DjnqCqgQMjYmYRUIb1GA+W2X8zeRJ+BxRWxzUm6vyJ3Qkqm7z3uao
	 0mVmg0K090fRxEsIt2C0DUan2mPyiahw5arXwEcc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E4E9F8028D;
	Wed, 22 Apr 2020 14:04:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B677F80290; Wed, 22 Apr 2020 14:04:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6DA2F8028D
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 14:04:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6DA2F8028D
IronPort-SDR: 44ebBkSF+nbWFKSzQCmdzOdrdi4cUcvVXoUem3X7OWA6pnNFUDMRq5neiIAB8vQ22QGaCIIaEd
 0XlA9g9UBwrA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 05:04:28 -0700
IronPort-SDR: 6Cmss8a+jJ1uFDGils4AhiOwHixnXj2dRmhCHKbz0e9kpvJodIQKxgA1xTH7dA85JKAFeIaEGQ
 x9Wp54Qs2JbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,414,1580803200"; d="scan'208";a="255617784"
Received: from mgorski-all-series.igk.intel.com ([10.237.149.201])
 by orsmga003.jf.intel.com with ESMTP; 22 Apr 2020 05:04:27 -0700
From: Mateusz Gorski <mateusz.gorski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/3] ASoC: Intel: Skylake: Add alternative topology binary
 name
Date: Wed, 22 Apr 2020 14:05:30 +0200
Message-Id: <20200422120532.31492-2-mateusz.gorski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200422120532.31492-1-mateusz.gorski@linux.intel.com>
References: <20200422120532.31492-1-mateusz.gorski@linux.intel.com>
Cc: cezary.rojewski@intel.com, Mateusz Gorski <mateusz.gorski@linux.intel.com>,
 tiwai@suse.com
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
---

Changes in v2:
- added <sound/soc-acpi.h> include
- machine driver name is now read from different field

 sound/soc/intel/skylake/skl-topology.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index 69cd7a81bf2a..58f77b6c5cda 100644
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
+				skl->mach->drv_name);
+		dev_info(bus->dev, "tplg fw %s load failed with %d, trying alternative tplg name %s",
+				skl->tplg_name, ret, alt_tplg_name);
+
+		ret = request_firmware(&fw, alt_tplg_name, bus->dev);
+		if (!ret)
+			goto component_load;
+
+		dev_info(bus->dev, "tplg %s failed with %d, falling back to dfw_sst.bin",
+				alt_tplg_name, ret);
+
 		ret = request_firmware(&fw, "dfw_sst.bin", bus->dev);
 		if (ret < 0) {
 			dev_err(bus->dev, "Fallback tplg fw %s load failed with %d\n",
@@ -3575,6 +3588,9 @@ int skl_tplg_init(struct snd_soc_component *component, struct hdac_bus *bus)
 		}
 	}
 
+component_load:
+
+
 	/*
 	 * The complete tplg for SKL is loaded as index 0, we don't use
 	 * any other index
-- 
2.17.1

