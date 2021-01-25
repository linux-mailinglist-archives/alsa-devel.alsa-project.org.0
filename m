Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14834302251
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jan 2021 08:10:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0F79185B;
	Mon, 25 Jan 2021 08:09:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0F79185B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611558604;
	bh=fzduyPyvae/5HXVgaZyCDmbw6F9dlF8QhysEh3pRMRk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X0jIo3KUsMSYVqsmsJMNGKT0dVtWiavAu+b4NwcKA7ADqgRWBKncW2+F1u4iBHsfJ
	 hfbzz8N17dC45cG18JQbkTZxzZ18te59xbKDpSCpSfrNV9J/Dw+P2zc/mMC+Zr1rKt
	 9QAqmTCXhG8y/8pPyXfkXM7/GDNzKMTaI1jo6CiM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CBC5F8014D;
	Mon, 25 Jan 2021 08:08:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 648E2F80259; Mon, 25 Jan 2021 08:08:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A681F8014D
 for <alsa-devel@alsa-project.org>; Mon, 25 Jan 2021 08:08:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A681F8014D
IronPort-SDR: vWm7HhFakcDzLn4enraYjcPC08pH5tJQlxA3DFaPQl2F9yHT6RBpB/wc9XHQM8wrjZF32+YQph
 vqz3X03m7lXQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9874"; a="264497714"
X-IronPort-AV: E=Sophos;i="5.79,372,1602572400"; d="scan'208";a="264497714"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2021 23:08:18 -0800
IronPort-SDR: hYJzcTiofVEK++kaoY3nNgB0L3gQJdH7PhrnutZLKj8F4mdYfU9k3yXV17EYej78rvs0ZgdH6g
 R9cLMyeaLI3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,372,1602572400"; d="scan'208";a="429154817"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga001.jf.intel.com with ESMTP; 24 Jan 2021 23:08:16 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 2/3] ASoC: Intel: tgl: remove sof_fw_filename set for
 tgl_3_in_1_default
Date: Mon, 25 Jan 2021 09:04:59 +0200
Message-Id: <20210125070500.807474-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125070500.807474-1-kai.vehmanen@linux.intel.com>
References: <20210125070500.807474-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Libin Yang <libin.yang@intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com, Bard Liao <bard.liao@intel.com>
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

From: Libin Yang <libin.yang@intel.com>

tgl_3_in_1_default link topology may be used by both TGL-LP and TGL-H.
Let's remove the sof_fw_filename setting in struct snd_soc_acpi_mach
and use the default_fw_filename setting in struct sof_dev_desc.

Signed-off-by: Libin Yang <libin.yang@intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 4933184df5f5..89ab462361a3 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -358,14 +358,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_sdw_machines[] = {
 		.link_mask = 0x7,
 		.links = tgl_sdw_rt711_link1_rt1308_link2_rt715_link0,
 		.drv_name = "sof_sdw",
-		.sof_fw_filename = "sof-tgl.ri",
 		.sof_tplg_filename = "sof-tgl-rt715-rt711-rt1308-mono.tplg",
 	},
 	{
 		.link_mask = 0xF, /* 4 active links required */
 		.links = tgl_3_in_1_default,
 		.drv_name = "sof_sdw",
-		.sof_fw_filename = "sof-tgl.ri",
 		.sof_tplg_filename = "sof-tgl-rt711-rt1308-rt715.tplg",
 	},
 	{
@@ -377,35 +375,30 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_sdw_machines[] = {
 		.link_mask = 0xF,
 		.links = tgl_3_in_1_mono_amp,
 		.drv_name = "sof_sdw",
-		.sof_fw_filename = "sof-tgl.ri",
 		.sof_tplg_filename = "sof-tgl-rt711-rt1308-mono-rt715.tplg",
 	},
 	{
 		.link_mask = 0xF, /* 4 active links required */
 		.links = tgl_3_in_1_sdca,
 		.drv_name = "sof_sdw",
-		.sof_fw_filename = "sof-tgl.ri",
 		.sof_tplg_filename = "sof-tgl-rt711-rt1316-rt714.tplg",
 	},
 	{
 		.link_mask = 0x3, /* rt711 on link 0 and 2 rt1308s on link 1 */
 		.links = tgl_rvp,
 		.drv_name = "sof_sdw",
-		.sof_fw_filename = "sof-tgl.ri",
 		.sof_tplg_filename = "sof-tgl-rt711-rt1308.tplg",
 	},
 	{
 		.link_mask = 0x3, /* rt5682 on link0 & 2xmax98373 on link 1 */
 		.links = tgl_chromebook_base,
 		.drv_name = "sof_sdw",
-		.sof_fw_filename = "sof-tgl.ri",
 		.sof_tplg_filename = "sof-tgl-sdw-max98373-rt5682.tplg",
 	},
 	{
 		.link_mask = 0x1, /* this will only enable rt5682 for now */
 		.links = tgl_chromebook_base,
 		.drv_name = "sof_sdw",
-		.sof_fw_filename = "sof-tgl.ri",
 		.sof_tplg_filename = "sof-tgl-rt5682.tplg",
 	},
 	{},
-- 
2.29.2

