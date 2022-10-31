Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FF7613E9F
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 20:59:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18CE41675;
	Mon, 31 Oct 2022 20:59:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18CE41675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667246392;
	bh=eSXniowtj4fJrVD12N5fAD/q4HhFalYtLHowFUlXNmw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qBfhFoLHkJutyeKcYSBZAYyPemHUE7c2JZN6vHDk92eLk8STjCqsRodsgOHmc5I3w
	 7wNE5hMPGjLdlqaw0HKIpaEuI0Eot8zgwpVrWxBK3m890iFqKSHFkZY7My/oqb1xVN
	 oj0mqzOYMsSigNkFADtLpyTfV78kXUrBbgb9HTuA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 965B3F80163;
	Mon, 31 Oct 2022 20:58:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1767BF8015B; Mon, 31 Oct 2022 20:58:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7FF1F800E1
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 20:58:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7FF1F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KcqKm+Pp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667246333; x=1698782333;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eSXniowtj4fJrVD12N5fAD/q4HhFalYtLHowFUlXNmw=;
 b=KcqKm+PpLcBd/brx0+ETAvGSVuMTuDOj4xg/mBJVL2cb0My5WEWQtqij
 veN6MBJNJuknWKnsbBprd9K79+CEse8IMt3UIl2QVvCJIulNVfLGsmR/V
 J+BzHxDuaYlbYb4UcoJwwDmd2+oJBdIvEZE4QIA/RqvW5RvWAXKv8oe8S
 MOgNwO2p9xlXkORZ4Fl17UsxC7KD5bkmKGw2oSbdPfQsIGqHFhmkYhqsk
 T2BcKNcKeBqOZPpPIaXtM/JX9NpR341Z9xPaj0z2/RIGEZR0fa0WVsh0E
 O+HZbS6OgZIjIMtbkl+jNRyIfFAf5yu/6PtHWkq73i1KpqvP2wD+w5DmN g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="306604437"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="306604437"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 12:58:50 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="628347620"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="628347620"
Received: from kumarhit-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.6.36])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 12:58:49 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: soc-acpi: add ES83x6 support to IceLake
Date: Mon, 31 Oct 2022 15:58:36 -0400
Message-Id: <20221031195836.250193-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
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

Missing entry to find a machine driver for ES83x6-based platforms.

Link: https://github.com/thesofproject/linux/issues/3873
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-icl-match.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-icl-match.c b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
index b032bc07de8b..d0062f2cd256 100644
--- a/sound/soc/intel/common/soc-acpi-intel-icl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
@@ -10,6 +10,11 @@
 #include <sound/soc-acpi-intel-match.h>
 #include "../skylake/skl.h"
 
+static const struct snd_soc_acpi_codecs essx_83x6 = {
+	.num_codecs = 3,
+	.codecs = { "ESSX8316", "ESSX8326", "ESSX8336"},
+};
+
 static struct skl_machine_pdata icl_pdata = {
 	.use_tplg_pcm = true,
 };
@@ -27,6 +32,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_icl_machines[] = {
 		.drv_name = "sof_rt5682",
 		.sof_tplg_filename = "sof-icl-rt5682.tplg",
 	},
+	{
+		.comp_ids = &essx_83x6,
+		.drv_name = "sof-essx8336",
+		.sof_tplg_filename = "sof-icl-es8336", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER |
+					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
+					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_icl_machines);
-- 
2.34.1

