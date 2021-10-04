Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 375A942195E
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 23:37:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BDE8168A;
	Mon,  4 Oct 2021 23:36:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BDE8168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633383462;
	bh=yNGYbZfF0Tsa04SbRIdiQf1HgKBeVdL+8egYLk+5fDg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a8QOWtUxo30BBTPX8tchiMvTPKSZUBD87PR6nf5TvFcgcdu1uLq7E02/xw1sQ4ErV
	 +DrYTYv1nK6DQprgPi1XJ3T13cDjdMD1pWJ49wu9MJ4f/0CVhlH4YhAJNF9QWx3HQf
	 Ms9rgCAADZZlQ+AVcgATrsgyRA715ebN8go2uCdA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C3C2F804EB;
	Mon,  4 Oct 2021 23:35:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FDDEF804E5; Mon,  4 Oct 2021 23:35:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 032A2F80240
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 23:35:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 032A2F80240
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="223012792"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="223012792"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 14:35:33 -0700
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="521588498"
Received: from ksgonzal-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.181.38])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 14:35:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/5] ASoC: Intel: soc-acpi: apl/glk/tgl: add entry for devices
 based on ES8336 codec
Date: Mon,  4 Oct 2021 16:35:08 -0500
Message-Id: <20211004213512.220836-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004213512.220836-1-pierre-louis.bossart@linux.intel.com>
References: <20211004213512.220836-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Huajun Li <huajun.li@intel.com>, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

A number of devices, such as the "Chuwi HI10x" and "UNIQCELL Q15.6",
are based on APL/GLK with an I2C/I2S ES8336 codec.

Add table to find topology and firmware files.

Co-developed-by: Huajun Li <huajun.li@intel.com>
Signed-off-by: Huajun Li <huajun.li@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-bxt-match.c | 6 ++++++
 sound/soc/intel/common/soc-acpi-intel-glk-match.c | 7 ++++++-
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c | 6 ++++++
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-bxt-match.c b/sound/soc/intel/common/soc-acpi-intel-bxt-match.c
index 576407b5daf2..78cfdc48ad45 100644
--- a/sound/soc/intel/common/soc-acpi-intel-bxt-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-bxt-match.c
@@ -82,6 +82,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_bxt_machines[] = {
 		.sof_fw_filename = "sof-apl.ri",
 		.sof_tplg_filename = "sof-apl-tdf8532.tplg",
 	},
+	{
+		.id = "ESSX8336",
+		.drv_name = "sof-essx8336",
+		.sof_fw_filename = "sof-apl.ri",
+		.sof_tplg_filename = "sof-apl-es8336.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_bxt_machines);
diff --git a/sound/soc/intel/common/soc-acpi-intel-glk-match.c b/sound/soc/intel/common/soc-acpi-intel-glk-match.c
index da1e151190b4..32fff9389eb3 100644
--- a/sound/soc/intel/common/soc-acpi-intel-glk-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-glk-match.c
@@ -49,7 +49,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_glk_machines[] = {
 		.sof_fw_filename = "sof-glk.ri",
 		.sof_tplg_filename = "sof-glk-cs42l42.tplg",
 	},
-
+	{
+		.id = "ESSX8336",
+		.drv_name = "sof-essx8336",
+		.sof_fw_filename = "sof-glk.ri",
+		.sof_tplg_filename = "sof-glk-es8336.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_glk_machines);
diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 91ef71c2535d..5332f96eb938 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -355,6 +355,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_machines[] = {
 		.sof_fw_filename = "sof-tgl.ri",
 		.sof_tplg_filename = "sof-tgl-rt1011-rt5682.tplg",
 	},
+	{
+		.id = "ESSX8336",
+		.drv_name = "sof-essx8336",
+		.sof_fw_filename = "sof-tgl.ri",
+		.sof_tplg_filename = "sof-tgl-es8336.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_tgl_machines);
-- 
2.25.1

