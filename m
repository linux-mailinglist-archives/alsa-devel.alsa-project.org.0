Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FD0477134
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 12:58:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E1521DF9;
	Thu, 16 Dec 2021 12:57:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E1521DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639655904;
	bh=QCUlNNClbiodoJD4nyQY/GfOfPcuGL7EpggYFxq6uM0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r5o2hIpO92dldsSbqbzybV/kRf3KMQS/TgvqCeNHA+OmoDrCsBoGWSz6RlhwwBX+B
	 NTDJYTu2m7cLB67fEG41+IUGvyM7+Yl2pC9RbwccJg3JQUj7xIYrEO+E43oZ82K/dO
	 VtkhpGEcCgcz4QnSQLDxvzDhb0TSemXee1GnfHig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D66BAF8047D;
	Thu, 16 Dec 2021 12:56:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3850F8047D; Thu, 16 Dec 2021 12:56:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7576F800DE
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 12:56:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7576F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="j3BKnl+m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639655770; x=1671191770;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QCUlNNClbiodoJD4nyQY/GfOfPcuGL7EpggYFxq6uM0=;
 b=j3BKnl+m1V1nqEHqspjYRQ+IsNZ8M0MXq7jiF6jcTLMjQW/roTXQrJCl
 u8XcNVdleSwpLDHpWgmXGlJ1yzSc7q57/BhIKF9Knzel5ZlTApEUtmaMj
 EdbwBuk4wopZYDprsIftll3w/G8a9lFMKdSeoYcPP81pVOd+OEkd74yY9
 3QycUsHIwzlcAZ9cYowtihXKDXivN3kfCjIzWwdtfATlevI6zAifb2ts2
 +zY5NnaZmyiJLN0l67WPjQxJ2rlaLEjO+0oR18ZU47lmwiiahNRKn588V
 At6BFg0btNQ2pB3/u/xNv9lw7fLQXi7XRDpXwQOTM/g4PjBrTZZrrb60K g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="239692052"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="239692052"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 03:56:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="506248461"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga007.jf.intel.com with ESMTP; 16 Dec 2021 03:56:05 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/5] ASoC: Intel: Drop legacy HSW/BDW board-match information
Date: Thu, 16 Dec 2021 12:57:43 +0100
Message-Id: <20211216115743.2130622-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216115743.2130622-1-cezary.rojewski@intel.com>
References: <20211216115743.2130622-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
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

With board-matching information for legacy solution moved to local
directory, there is no need to expose it globally.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/soc-acpi-intel-match.h             |  1 -
 .../intel/common/soc-acpi-intel-hsw-bdw-match.c  | 16 ----------------
 2 files changed, 17 deletions(-)

diff --git a/include/sound/soc-acpi-intel-match.h b/include/sound/soc-acpi-intel-match.h
index 59551b1f22f3..7b94451ab93a 100644
--- a/include/sound/soc-acpi-intel-match.h
+++ b/include/sound/soc-acpi-intel-match.h
@@ -14,7 +14,6 @@
  * these tables are not constants, some fields can be used for
  * pdata or machine ops
  */
-extern struct snd_soc_acpi_mach snd_soc_acpi_intel_haswell_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_broadwell_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_baytrail_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_cherrytrail_machines[];
diff --git a/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c b/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c
index fe343a95b5ff..25758c23da17 100644
--- a/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c
@@ -9,44 +9,28 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
 
-struct snd_soc_acpi_mach snd_soc_acpi_intel_haswell_machines[] = {
-	{
-		.id = "INT33CA",
-		.drv_name = "haswell-audio",
-		.fw_filename = "intel/IntcSST1.bin",
-		.sof_fw_filename = "sof-hsw.ri",
-		.sof_tplg_filename = "sof-hsw.tplg",
-	},
-	{}
-};
-EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_haswell_machines);
-
 struct snd_soc_acpi_mach snd_soc_acpi_intel_broadwell_machines[] = {
 	{
 		.id = "INT343A",
 		.drv_name = "broadwell-audio",
-		.fw_filename =  "intel/IntcSST2.bin",
 		.sof_fw_filename = "sof-bdw.ri",
 		.sof_tplg_filename = "sof-bdw-rt286.tplg",
 	},
 	{
 		.id = "10EC5650",
 		.drv_name = "bdw-rt5650",
-		.fw_filename = "intel/IntcSST2.bin",
 		.sof_fw_filename = "sof-bdw.ri",
 		.sof_tplg_filename = "sof-bdw-rt5650.tplg",
 	},
 	{
 		.id = "RT5677CE",
 		.drv_name = "bdw-rt5677",
-		.fw_filename =  "intel/IntcSST2.bin",
 		.sof_fw_filename = "sof-bdw.ri",
 		.sof_tplg_filename = "sof-bdw-rt5677.tplg",
 	},
 	{
 		.id = "INT33CA",
 		.drv_name = "haswell-audio",
-		.fw_filename = "intel/IntcSST2.bin",
 		.sof_fw_filename = "sof-bdw.ri",
 		.sof_tplg_filename = "sof-bdw-rt5640.tplg",
 	},
-- 
2.25.1

