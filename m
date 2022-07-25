Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8062D5804C0
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jul 2022 21:50:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE93983E;
	Mon, 25 Jul 2022 21:49:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE93983E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658778640;
	bh=tx7lL1ZDgaPvc+SEzQPxnlwHU/wK9pXF0/iQsdZX8VE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WDkhXbkghZBZrT/w6UAHydVzDrxns7TFfC9X3LrdP+v1pdkbOzOy3wocnIgJybjtS
	 W8WqThNbxOYErCDZ9TU+TJTBnuwlG6LanRWYSQsYPlERCHjeSrgE9uqxCF3o48PDQi
	 eV62nLrjMFPf4voidyeUjRP3OhyBzSoS1JYvKu/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06F70F80548;
	Mon, 25 Jul 2022 21:49:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4784DF80548; Mon, 25 Jul 2022 21:49:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37011F80155
 for <alsa-devel@alsa-project.org>; Mon, 25 Jul 2022 21:49:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37011F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Ox2FWnP6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658778571; x=1690314571;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tx7lL1ZDgaPvc+SEzQPxnlwHU/wK9pXF0/iQsdZX8VE=;
 b=Ox2FWnP6DXIeg1Y/BMU4Jclctx3iQe0L2bhaQqd6ktEfP3BUEpJL9x8L
 TEdeyWvtb3mj+BBRpM+lcPMOyvywRfC7F3FF5J7e+K/FgMFKpPcOKrqMx
 Am77tLrL//Y2SPHw2Y/aHllUxowlXx7E2P5z2xaXePW0PIMbgMW6m84em
 +Q5K+ESNMR4xSAmR7BtiRSGXdVjejpIjT0Bc/FZXTgV+wVtxmaaeamDA4
 3gm7rRYb9/dpR5BnFV7SpPiCHhlhwK3DgWRo/JQEv+J0jdaCfweiZ/bOv
 l3EfwPaTD0dVVhD08Nzddr86Y9kcXz54fw1lhXVg4jfkubfDABU9J8YXm A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10419"; a="267553900"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="267553900"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 12:49:22 -0700
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="632479440"
Received: from mbianco-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.71.159])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 12:49:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/10] ASoC: Intel: soc-acpi: Add entry for sof_es8336 in ADL
 match table
Date: Mon, 25 Jul 2022 14:49:01 -0500
Message-Id: <20220725194909.145418-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220725194909.145418-1-pierre-louis.bossart@linux.intel.com>
References: <20220725194909.145418-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 broonie@kernel.org, Muralidhar Reddy <muralidhar.reddy@intel.com>,
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

From: Muralidhar Reddy <muralidhar.reddy@intel.com>

Adding support for ES83x6 codec in ADL match table

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Muralidhar Reddy <muralidhar.reddy@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/hda/intel-dsp-config.c                      |  5 +++++
 sound/soc/intel/common/soc-acpi-intel-adl-match.c | 13 +++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index ec9cbb219bc1..d84ffdf47210 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -413,6 +413,11 @@ static const struct config_entry config_table[] = {
 		.device = 0x7a50,
 	},
 	/* Alderlake-P */
+	{
+		.flags = FLAG_SOF,
+		.device = 0x51c8,
+		.codec_hid =  &essx_83x6,
+	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = 0x51c8,
diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index 6957d801f241..8fccd22b5953 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -8,6 +8,11 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
 
+static const struct snd_soc_acpi_codecs essx_83x6 = {
+	.num_codecs = 3,
+	.codecs = { "ESSX8316", "ESSX8326", "ESSX8336"},
+};
+
 static const struct snd_soc_acpi_endpoint single_endpoint = {
 	.num = 0,
 	.aggregated = 0,
@@ -515,6 +520,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.drv_name = "adl_cs35l41",
 		.sof_tplg_filename = "sof-adl-cs35l41.tplg",
 	},
+	{
+		.comp_ids = &essx_83x6,
+		.drv_name = "sof-essx8336",
+		.sof_tplg_filename = "sof-adl-es83x6", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER |
+					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
+					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_adl_machines);
-- 
2.34.1

