Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBF737B0E6
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 23:41:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE3D718C1;
	Tue, 11 May 2021 23:40:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE3D718C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620769264;
	bh=2ZnRoc0njd+yEfkPSsN2EFJyfPBfETtMwzqlxrOG5Es=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CXUv/TAbymYIoNm+jX3yt2OfhNSFbL76KOIqQWfojPSUhCRKZXmC56tPFELqgczZD
	 GxXY7q5FOE2I6epRcle+mWrV5jj1yCFF3HdB2tvu2wh/Khdc+rRSvShbeucb6+iglG
	 KqOMGbQF3opZlaHoCmfqhnJG+wGs03brf9SekShE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AADDF804CF;
	Tue, 11 May 2021 23:37:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BA8FF804AE; Tue, 11 May 2021 23:37:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 594C5F800E9
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 23:37:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 594C5F800E9
IronPort-SDR: IS3UL/I5T9Jcm6JyTEtf7egftivfE/5PnN/zM7PZB71zIXiVjGXeybUWTFFNKK4IR6U0AuDd2m
 IiVKkqoV2VLg==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="186992063"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="186992063"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 14:37:34 -0700
IronPort-SDR: o1E6oMf8KCMb1RZSQWr/EnsExtBhTN5s318q+mxywhXX0Tz50tG+flwjuiQqomhycWW7VyQfwW
 exKrfXDLbQPA==
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="469098958"
Received: from seanwol-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.100.14])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 14:37:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/9] ASoC: Intel: glk_rt5682_max98357a: shrink platform_id
 below 20 characters
Date: Tue, 11 May 2021 16:37:03 -0500
Message-Id: <20210511213707.32958-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210511213707.32958-1-pierre-louis.bossart@linux.intel.com>
References: <20210511213707.32958-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Paul Olaru <paul.olaru@oss.nxp.com>
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

