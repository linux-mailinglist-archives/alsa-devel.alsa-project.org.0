Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4640C39E9C4
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 00:49:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6B811699;
	Tue,  8 Jun 2021 00:48:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6B811699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623106178;
	bh=2ZnRoc0njd+yEfkPSsN2EFJyfPBfETtMwzqlxrOG5Es=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VFI9pOxqFY5Mn++s5nBy1vkblgpd8X3SJnZ0rBKm+NLSHF+aBNxtBphmgjqownPin
	 gKfXW1suOwkHkSq2yfb8d/esNFkcgkjHFU2FWs6FnFrxpUdjtXT1ok3wWXO924wFt9
	 yi8usO/mbrgGWGYJ3XO3037E8wZ8drzN3syRBkog=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05EBCF804DF;
	Tue,  8 Jun 2021 00:47:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB725F804D9; Tue,  8 Jun 2021 00:47:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45E4EF80276
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 00:46:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45E4EF80276
IronPort-SDR: Alcw8i4qKXraszWe5xu/b7X+gKNiL9Lp0Tv7+uAkpmv8tXEgFgehuV9hUaunFixjM8KkcrbnrE
 LC20am4bRCNg==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="185102178"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="185102178"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:46:49 -0700
IronPort-SDR: Dnqqa5D5yJ4k1AxFLxy+HQkPB6YlaTgv4aa5pdGVwR+ZW/Pq7lIqAtyMpN57jY457dUQ9gYp/w
 ZTFe1cSu9Y+Q==
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="637437096"
Received: from marocham-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.108.70])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:46:49 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/10] ASoC: Intel: glk_rt5682_max98357a: shrink platform_id
 below 20 characters
Date: Mon,  7 Jun 2021 17:46:32 -0500
Message-Id: <20210607224638.585486-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607224638.585486-1-pierre-louis.bossart@linux.intel.com>
References: <20210607224638.585486-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, Paul Olaru <paul.olaru@oss.nxp.com>
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

Sparse throws the following warning:

sound/soc/intel/boards/glk_rt5682_max98357a.c:622:25: error: too long
initializer-string for array of char(no space for nul char)

Fix by using the 'mx' acronym for Maxim

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/intel/boards/glk_rt5682_max98357a.c     | 4 ++--
 sound/soc/intel/common/soc-acpi-intel-glk-match.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/glk_rt5682_max98357a.c b/sound/soc/intel/boards/glk_rt5682_max98357a.c
index 19e2ff90886a..9b92625288cb 100644
--- a/sound/soc/intel/boards/glk_rt5682_max98357a.c
+++ b/sound/soc/intel/boards/glk_rt5682_max98357a.c
@@ -619,7 +619,7 @@ static int geminilake_audio_probe(struct platform_device *pdev)
 
 static const struct platform_device_id glk_board_ids[] = {
 	{
-		.name = "glk_rt5682_max98357a",
+		.name = "glk_rt5682_mx98357a",
 		.driver_data =
 			(kernel_ulong_t)&glk_audio_card_rt5682_m98357a,
 	},
@@ -641,5 +641,5 @@ MODULE_DESCRIPTION("Geminilake Audio Machine driver-RT5682 & MAX98357A in I2S mo
 MODULE_AUTHOR("Naveen Manohar <naveen.m@intel.com>");
 MODULE_AUTHOR("Harsha Priya <harshapriya.n@intel.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:glk_rt5682_max98357a");
+MODULE_ALIAS("platform:glk_rt5682_mx98357a");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
diff --git a/sound/soc/intel/common/soc-acpi-intel-glk-match.c b/sound/soc/intel/common/soc-acpi-intel-glk-match.c
index 8c6264622da9..da1e151190b4 100644
--- a/sound/soc/intel/common/soc-acpi-intel-glk-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-glk-match.c
@@ -33,7 +33,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_glk_machines[] = {
 	},
 	{
 		.id = "10EC5682",
-		.drv_name = "glk_rt5682_max98357a",
+		.drv_name = "glk_rt5682_mx98357a",
 		.fw_filename = "intel/dsp_fw_glk.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &glk_codecs,
-- 
2.25.1

