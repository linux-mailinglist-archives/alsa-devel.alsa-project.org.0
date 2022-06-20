Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2CD55125B
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 10:16:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB31418A3;
	Mon, 20 Jun 2022 10:15:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB31418A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655712997;
	bh=X4L5HxgvJhKjA8csEVWyCP3QlR1qaLDSS0PxrRvBsuI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UA1EJFPgw4xO1UN7L9z6r8uPBsLRlaT1rfTmEvtznby+QH+9xuePeNglPTFos09FB
	 rzhye/tirAFnL92nafYYUkWWlMDNOceuD1fKN0MrcJEWQfXtjE5d3S1xx6P6WtJz/c
	 7OXDGang/PkHQhBbqhMxxqc3gAtl7T/+3YZip7cA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B45E8F8059F;
	Mon, 20 Jun 2022 10:12:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCCFEF80566; Mon, 20 Jun 2022 10:12:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A5B4F80548
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 10:12:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A5B4F80548
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="MX1EdnYL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655712759; x=1687248759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X4L5HxgvJhKjA8csEVWyCP3QlR1qaLDSS0PxrRvBsuI=;
 b=MX1EdnYLKBhhjWyl0fsVP4drdlGeN62ui6NDrHRaAoQlPQhzhebk0dnw
 ljda/CIs7fSiWJ9IpsMFcSZrhzn6O3EsqlosY+qDAmIyTQ3ilSKGyK8MY
 hpYIIyAl+joblSNhio5BUolQFjpYnZN65TjHCyd7Z1WKtjnZbplKX8ED6
 aTHWe7fH4bQHfB/kjI+8m23KyvCO1RM5IwzpkUd9FR0CsCErXtGBQuCIb
 loGWgaEYW/ulNT7KZdvK2LbGreX6rnkcVzGgF+EBsMe+S6VCB5sQkhVyo
 nrHQrWhnhoFvoWEjQnNieEcyQ9T+oqfPxf7Q5vmln9g7YxK4fNrZR4ate w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="305270913"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="305270913"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 01:12:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="591067418"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga007.fm.intel.com with ESMTP; 20 Jun 2022 01:12:36 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v3 10/17] ASoC: Intel: bdw_rt286: Reword driver name
Date: Mon, 20 Jun 2022 10:22:19 +0200
Message-Id: <20220620082226.2489357-11-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620082226.2489357-1-cezary.rojewski@intel.com>
References: <20220620082226.2489357-1-cezary.rojewski@intel.com>
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
index a5a425f6d95c..03cc50cb3c31 100644
--- a/sound/soc/intel/boards/bdw_rt286.c
+++ b/sound/soc/intel/boards/bdw_rt286.c
@@ -322,7 +322,7 @@ static struct platform_driver bdw_rt286_driver = {
 	.probe = bdw_rt286_probe,
 	.remove = bdw_rt286_remove,
 	.driver = {
-		.name = "broadwell-audio",
+		.name = "bdw_rt286",
 		.pm = &snd_soc_pm_ops
 	},
 };
@@ -333,4 +333,4 @@ module_platform_driver(bdw_rt286_driver)
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

