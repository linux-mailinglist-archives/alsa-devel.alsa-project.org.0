Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5889956B7F2
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 13:04:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB74B857;
	Fri,  8 Jul 2022 13:03:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB74B857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657278251;
	bh=HttklPYMVqCkBKla4Z5JeQC9Wp5Ab2UuWXTG+/ppt9Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LJE4pu3/yujMVJD90ERXPI68sQa41uN9uz3jb6yy5MGhXJN4x71rl3AeTJ5JEdmKF
	 NhAsAffQEsM3EOourGuS/op1bpA0RZy2nlZWTr6IE2mYTyB2mQwJx1AqI88vES4kvM
	 PHS/oY0cLcoTOAcjYSXdSeXueYbASPm2uVpmYcxo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72672F8025B;
	Fri,  8 Jul 2022 13:03:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B57DDF80084; Fri,  8 Jul 2022 13:03:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01BE3F80084
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 13:03:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01BE3F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="iF3iBtY8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657278184; x=1688814184;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HttklPYMVqCkBKla4Z5JeQC9Wp5Ab2UuWXTG+/ppt9Q=;
 b=iF3iBtY8aVXapre1CSosdy7Kqq8Fs56rkbrzwnGDeFXZnO8b8K4paUCy
 YWApePRHGhMpn9ICMm2qNQwZl93jIvdK/9qNwFfAszG74oq0zDltFhhvx
 I+cYEM/eZJsIh1STeO4fzCA2335NMXt2cQRA/MYxoql2FezhPUIpJCSzU
 yBagOSF62F8FYeecXeNMjisUnflc3cNaj24idXL0DqLXmCFSxWlw++7+v
 KTPU8N/B7scRc6ZPVfnJrRYGeJ+j2MR7Y8pqXi2P+76ldEGh2p9/v+teA
 2SewGS03tFZM63t2uU/DsVVTgDnbn4/GKZVAsfy8gTDYxCwvf54egduS5 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="264035912"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="264035912"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 04:02:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="651526186"
Received: from brentlu-brix.itwn.intel.com ([10.5.253.25])
 by fmsmga008.fm.intel.com with ESMTP; 08 Jul 2022 04:02:55 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v8 2/2] ASoC: Intel: sof_cs42l42: add adl_mx98360a_cs4242
 board config
Date: Fri,  8 Jul 2022 19:00:30 +0800
Message-Id: <20220708110030.658468-3-brent.lu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220708110030.658468-1-brent.lu@intel.com>
References: <20220708110030.658468-1-brent.lu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Libin Yang <libin.yang@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Gongjun Song <gongjun.song@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mac Chiang <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Muralidhar Reddy <muralidhar.reddy@intel.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, David Lin <CTLIN0@nuvoton.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 linux-kernel@vger.kernel.org
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

This patch adds driver data for adl_mx98360a_cs4242 which supports
two max98360a speaker amplifiers on SSP1 and cs42l42 headphone codec
on SSP0 running on ADL platform.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/intel/boards/sof_cs42l42.c              | 11 +++++++++++
 sound/soc/intel/common/soc-acpi-intel-adl-match.c |  7 +++++++
 2 files changed, 18 insertions(+)

diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index 3d53bb420c66..85ffd065895d 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -700,6 +700,17 @@ static const struct platform_device_id board_ids[] = {
 					SOF_CS42L42_SSP_AMP(1)) |
 					SOF_CS42L42_DAILINK(LINK_HP, LINK_DMIC, LINK_HDMI, LINK_SPK, LINK_NONE),
 	},
+	{
+		.name = "adl_mx98360a_cs4242",
+		.driver_data = (kernel_ulong_t)(SOF_CS42L42_SSP_CODEC(0) |
+				SOF_SPEAKER_AMP_PRESENT |
+				SOF_MAX98360A_SPEAKER_AMP_PRESENT |
+				SOF_CS42L42_SSP_AMP(1) |
+				SOF_CS42L42_NUM_HDMIDEV(4) |
+				SOF_BT_OFFLOAD_PRESENT |
+				SOF_CS42L42_SSP_BT(2) |
+				SOF_CS42L42_DAILINK(LINK_HP, LINK_DMIC, LINK_HDMI, LINK_SPK, LINK_BT)),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index c1385161cdc8..fea087d3fa15 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -479,6 +479,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.drv_name = "adl_rt5682",
 		.sof_tplg_filename = "sof-adl-rt5682.tplg",
 	},
+	{
+		.id = "10134242",
+		.drv_name = "adl_mx98360a_cs4242",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &adl_max98360a_amp,
+		.sof_tplg_filename = "sof-adl-max98360a-cs42l42.tplg",
+	},
 	/* place amp-only boards in the end of table */
 	{
 		.id = "CSC3541",
-- 
2.25.1

