Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 585C9635D5C
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Nov 2022 13:45:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0439E1691;
	Wed, 23 Nov 2022 13:44:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0439E1691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669207533;
	bh=4imCYH/xthfpPEX5hyHQkHeVXRyyrP64wVfPxGymcZM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M+rfIvhOY3AJKXfu0rYWNWplvA9yhJOXP7ZBRTnkgI8R1bHNf7BeDI/Za8gzq5H/v
	 +a2rRaXAaOJyL95YaSLPpiGwtEbV6uNCLux/EkdsGfQmhDZOdqhndBhQ40Bt3T4KkS
	 P9iTgKB7erVwuwBjSjisWVzXL4nua9oJS3lVRPQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB547F80570;
	Wed, 23 Nov 2022 13:43:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51B7DF8055C; Wed, 23 Nov 2022 13:43:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD6ECF80557
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 13:43:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD6ECF80557
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="c68pdVmx"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6A509B81F72;
 Wed, 23 Nov 2022 12:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC37C433C1;
 Wed, 23 Nov 2022 12:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669207429;
 bh=4imCYH/xthfpPEX5hyHQkHeVXRyyrP64wVfPxGymcZM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c68pdVmx96Cfh3Ormsvin1t3AfEL8PwUO3/vT5EsGM4TAcgCyA6crQKKO54LgrdAk
 prNd58UOZsFvJ4AF20t61huWZYnw+SM9LdwTOtb7Z1g2k93s2OsV+fMcoYcjJI0OZI
 IzvSomCJviPDFgRnugCDcILKMIpg3FuKbxheTcOgXVD9O9XNsMKvK07ZyehEPphZqu
 9GZZsCDqsC2pXOC9L5t1N/sQrCqFxI6+MmMPcvZGjci7apbQTWpiHXBC48IWNg2iEO
 ZW/bsCzAjyrqLnTvB/2EJ7U6+i5Hl6j942Xrt94dBnt+XgJ2vTralKzeLC/7E4cqHj
 TeRZcKeYuZdGA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 03/22] ASoC: Intel: soc-acpi: add ES83x6 support
 to IceLake
Date: Wed, 23 Nov 2022 07:43:18 -0500
Message-Id: <20221123124339.265912-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123124339.265912-1-sashal@kernel.org>
References: <20221123124339.265912-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, cezary.rojewski@intel.com,
 kai.vehmanen@linux.intel.com, rander.wang@intel.com,
 peter.ujfalusi@linux.intel.com, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ranjani.sridharan@linux.intel.com, liam.r.girdwood@linux.intel.com,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit 9a1d248bb4beaf1b43d17ba12481ee0629fa29b9 ]

Missing entry to find a machine driver for ES83x6-based platforms.

Link: https://github.com/thesofproject/linux/issues/3873
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20221031195836.250193-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/common/soc-acpi-intel-icl-match.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-icl-match.c b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
index 9a529a785288..80995dc732a1 100644
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
@@ -29,6 +34,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_icl_machines[] = {
 		.sof_fw_filename = "sof-icl.ri",
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
2.35.1

