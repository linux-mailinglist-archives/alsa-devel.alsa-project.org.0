Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E9D5482A3
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jun 2022 11:09:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5064181C;
	Mon, 13 Jun 2022 11:08:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5064181C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655111377;
	bh=H0LRukW6u5Nk1lkb8RE/XO7nsQo8BQDPq19dhHzUpEM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eRUJMSde2nGJmt/xY6yeuQcZi7anhedNqe8URK+KOjyPb9oQR5TO0j0n2gZGXm2xq
	 xRaO12xqypCBFuADXzwq8eikkskN8b9ztqK7gIczNIkIhN2NxinpEZskla6rBl0l8e
	 ngqpy7wvwQOI82B1E2YwwPKVooqMyW2c+mJsPPCE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 280E0F80587;
	Mon, 13 Jun 2022 11:06:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D17DDF80570; Mon, 13 Jun 2022 11:06:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAACCF80570
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 11:06:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAACCF80570
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="dwjZlVrF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655111166; x=1686647166;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H0LRukW6u5Nk1lkb8RE/XO7nsQo8BQDPq19dhHzUpEM=;
 b=dwjZlVrFNi7vntX9si+0ZcT07Q7UW652vQjRb2ihOU+7ZIrUJSd+ehbw
 BzLTYnwiiXcBh7OPmiqLf2clZG2qu82sOWpvwS+ZVwvLSY6Dqion/FwMG
 +2UyigJntWrEX9LE9My+xYnPiq+qJOX/7J5QigsdpnGnsgpmInZ3MnTk+
 sr+Dxtl7PmS0AhiSJjZGGNbb1gLMzCphtJxKr9DkzgGU+nWsfxhpFeQXv
 SHKtlnViUcNXQZCGyIPH8t54zf/1odnJq8iorqx79EOg+9StLR7qyLzBX
 LT/HYJij54A3Lzq3HNhTSCskIosNrqmDlX2L4fXO+7NmAwLQxf/tWL1c9 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10376"; a="275753904"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="275753904"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 02:05:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="639626050"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 13 Jun 2022 02:05:47 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 10/17] ASoC: Intel: bdw_rt286: Reword driver name
Date: Mon, 13 Jun 2022 11:15:39 +0200
Message-Id: <20220613091546.1565167-11-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613091546.1565167-1-cezary.rojewski@intel.com>
References: <20220613091546.1565167-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Align with other Intel boards naming convention and let the name
explicitly state which components are being connected.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/boards/bdw_rt286.c                    | 4 ++--
 sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/bdw_rt286.c b/sound/soc/intel/boards/bdw_rt286.c
index a72c17171765..da570e162f2a 100644
--- a/sound/soc/intel/boards/bdw_rt286.c
+++ b/sound/soc/intel/boards/bdw_rt286.c
@@ -324,7 +324,7 @@ static struct platform_driver bdw_rt286_driver = {
 	.probe = bdw_rt286_probe,
 	.remove = bdw_rt286_remove,
 	.driver = {
-		.name = "broadwell-audio",
+		.name = "bdw_rt286",
 		.pm = &snd_soc_pm_ops
 	},
 };
@@ -335,4 +335,4 @@ module_platform_driver(bdw_rt286_driver)
 MODULE_AUTHOR("Liam Girdwood, Xingchao Wang");
 MODULE_DESCRIPTION("Intel SST Audio for WPT/Broadwell");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:broadwell-audio");
+MODULE_ALIAS("platform:bdw_rt286");
diff --git a/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c b/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c
index 4e00f8f6c521..cbcb649604e5 100644
--- a/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c
@@ -23,7 +23,7 @@ EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_haswell_machines);
 struct snd_soc_acpi_mach snd_soc_acpi_intel_broadwell_machines[] = {
 	{
 		.id = "INT343A",
-		.drv_name = "broadwell-audio",
+		.drv_name = "bdw_rt286",
 		.fw_filename =  "intel/IntcSST2.bin",
 		.sof_tplg_filename = "sof-bdw-rt286.tplg",
 	},
-- 
2.25.1

