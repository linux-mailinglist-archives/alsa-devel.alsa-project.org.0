Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6FA41F09C
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Oct 2021 17:09:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00BC616D6;
	Fri,  1 Oct 2021 17:08:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00BC616D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633100947;
	bh=1ej1rlZzgqBreKZatKB3D9dEApCf7mu4qAhoF9U3nyo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EIUFc1c6nefEapRZxpsEUphJVYkoZ+vXhvNtqPzDbYX/uHHBtYVKV92ogO7sPdrJk
	 /OL+5LmVpSAuZzur6AkLhduIHkTx8ywD/WJCo+8A/jA+91ioTTRoEhTDGqnxZy/5Yc
	 gjQSYERG6QO0d5eDDsmsc8GS0gTua31rU2CUWqx4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 628D8F80227;
	Fri,  1 Oct 2021 17:07:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7F36F80245; Fri,  1 Oct 2021 17:07:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08FD2F801F7
 for <alsa-devel@alsa-project.org>; Fri,  1 Oct 2021 17:07:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08FD2F801F7
X-IronPort-AV: E=McAfee;i="6200,9189,10124"; a="248022813"
X-IronPort-AV: E=Sophos;i="5.85,339,1624345200"; d="scan'208";a="248022813"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 08:04:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,339,1624345200"; d="scan'208";a="619197543"
Received: from brentlu-brix.itwn.intel.com ([10.5.253.56])
 by fmsmga001.fm.intel.com with ESMTP; 01 Oct 2021 08:04:39 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: sof_rt5682: Add support for max98360a speaker amp
Date: Fri,  1 Oct 2021 23:03:16 +0800
Message-Id: <20211001150316.414141-1-brent.lu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Libin Yang <libin.yang@intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Malik_Hsu <malik_hsu@wistron.corp-partner.google.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <bard.liao@intel.com>, Rander Wang <rander.wang@intel.com>,
 Brent Lu <brent.lu@intel.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Yong Zhi <yong.zhi@intel.com>
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

From: Malik_Hsu <malik_hsu@wistron.corp-partner.google.com>

Add a board config adl_mx98360a_rt5682 to support alc5682 headset
codec and max98360a speaker amplifier. Follow Intel BT offload design
by connecting alc5682 to SSP0 and max98360a to SSP1.

Signed-off-by: Malik_Hsu <malik_hsu@wistron.corp-partner.google.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c               | 11 +++++++++++
 sound/soc/intel/common/soc-acpi-intel-adl-match.c | 13 +++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index ad42d4c7ade5..613662eedd0d 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -1076,6 +1076,17 @@ static const struct platform_device_id board_ids[] = {
 					SOF_MAX98360A_SPEAKER_AMP_PRESENT |
 					SOF_RT5682_SSP_AMP(1)),
 	},
+	{
+		.name = "adl_mx98360_rt5682",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_SSP_CODEC(0) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_MAX98360A_SPEAKER_AMP_PRESENT |
+					SOF_RT5682_SSP_AMP(1) |
+					SOF_RT5682_NUM_HDMIDEV(4) |
+					SOF_BT_OFFLOAD_SSP(2) |
+					SOF_SSP_BT_OFFLOAD_PRESENT),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index e4ff280eac23..f5b21a95d222 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -280,6 +280,11 @@ static const struct snd_soc_acpi_codecs adl_max98357a_amp = {
 	.codecs = {"MX98357A"}
 };
 
+static const struct snd_soc_acpi_codecs adl_max98360a_amp = {
+	.num_codecs = 1,
+	.codecs = {"MX98360A"}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 	{
 		.id = "10EC5682",
@@ -297,6 +302,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.sof_fw_filename = "sof-adl.ri",
 		.sof_tplg_filename = "sof-adl-max98357a-rt5682.tplg",
 	},
+	{
+		.id = "10EC5682",
+		.drv_name = "adl_mx98360_rt5682",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &adl_max98360a_amp,
+		.sof_fw_filename = "sof-adl.ri",
+		.sof_tplg_filename = "sof-adl-max98360a-rt5682.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_adl_machines);
-- 
2.25.1

