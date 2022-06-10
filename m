Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9321E5466A3
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 14:29:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 335591EE5;
	Fri, 10 Jun 2022 14:28:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 335591EE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654864149;
	bh=oLw62bFRVUSpkqb9Dtxj1cVu/Jz+bpKq6ce1rwnr6/0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XcExaP5JZzJ4MqWHnCdfYLYgEVg2V0vpqXegCbmUl3YepCqIHfIljPUBdPdvAbRzi
	 HT50HuLPLTRxw2tjvLbjFanWNCF+yraqSKuTeySt6Z3+MxhXcIexvs1ibYGfNGJG14
	 q6LHYWhQjZSRxRQGzSwSsdFD/rHdaA2rDFnJVX64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F28DF80557;
	Fri, 10 Jun 2022 14:26:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E7F7F8053D; Fri, 10 Jun 2022 14:26:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E395F804D8
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 14:26:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E395F804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="T/RLTibn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654863990; x=1686399990;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oLw62bFRVUSpkqb9Dtxj1cVu/Jz+bpKq6ce1rwnr6/0=;
 b=T/RLTibnRhlHdPzZvAWFxK4hUcheLhuk59l2kwH+hCBr8pLWko4UNLBN
 kt29jQmrbHa4IbXT3HXmfo+LlBo9Cua7bGIXBdKmkR56tKi3zmgtm600R
 U0qXW9epY3ycV96CFsgWHWAj8/auwv+pI2nm+nM++yihsTz64zVDhdruB
 7jUyVVEXUFUXO5rjnhuPYIFGWi56lZTciDJeFvcF1ch0djOfsNGe5/KO+
 1OuqsrQNvWNtwUGvt7DrzwbtfxhpFgS35upukXtGK9wPU6bhVZOBNZKmj
 wtuFWHvlxth0F4sMFe7gYecgFHSHXVDWpzSZbBde5dQ28CvvjK8JTjH9T A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="278414460"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="278414460"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 05:26:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="684517914"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga002.fm.intel.com with ESMTP; 10 Jun 2022 05:26:26 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 10/17] ASoC: Intel: bdw_rt286: Reword driver name
Date: Fri, 10 Jun 2022 14:36:20 +0200
Message-Id: <20220610123627.1339985-11-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610123627.1339985-1-cezary.rojewski@intel.com>
References: <20220610123627.1339985-1-cezary.rojewski@intel.com>
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
index 092bc9a45548..0e67741aea79 100644
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

