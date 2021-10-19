Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A264330B4
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 10:06:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB2FF16AE;
	Tue, 19 Oct 2021 10:05:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB2FF16AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634630808;
	bh=FjHndgjZYOn7HZsiOy00G0QBp0VJyfSzKULzv9bxW3I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vs02kutccPopNCPZIhi/K7mLwWNHHG++BYWa88x1VLsPmXgvOLhL6T1vh6KwJqNbj
	 uF65KjuW/yPxmazCBbC3/AMG767YtS+Myy8LSv8pJuO8cxvlrQVveYC/A+ahbJdJDR
	 j9LeCn3MKPqXU9HfrjD3WWGcH0iLevauKRkNTjKo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7D2CF80256;
	Tue, 19 Oct 2021 10:04:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 569ECF80518; Tue, 19 Oct 2021 10:04:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4702EF80111
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 10:04:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4702EF80111
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="208551081"
X-IronPort-AV: E=Sophos;i="5.85,383,1624345200"; d="scan'208";a="208551081"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 01:03:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,383,1624345200"; d="scan'208";a="493984921"
Received: from brentlu-brix.itwn.intel.com ([10.5.253.56])
 by orsmga008.jf.intel.com with ESMTP; 19 Oct 2021 01:03:14 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 5/6] ASoC: Intel: soc-acpi-cht: shrink tables using
 compatible IDs
Date: Tue, 19 Oct 2021 15:59:40 +0800
Message-Id: <20211019075941.2037787-6-brent.lu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019075941.2037787-1-brent.lu@intel.com>
References: <20211019075941.2037787-1-brent.lu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Rander Wang <rander.wang@intel.com>, Jie Yang <yang.jie@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mac Chiang <mac.chiang@intel.com>, Gongjun Song <gongjun.song@intel.com>,
 Bard Liao <bard.liao@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, Yong Zhi <yong.zhi@intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Paul Olaru <paul.olaru@oss.nxp.com>, Brent Lu <brent.lu@intel.com>,
 Libin Yang <libin.yang@intel.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Curtis Malainey <cujomalainey@chromium.org>
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

We have multiple entries for the same codecs, use the new compatible
IDs to have a single entry.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-cht-match.c   | 69 +++++++------------
 1 file changed, 25 insertions(+), 44 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
index 227424236fd5..c60a5e8e7bc9 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
@@ -51,18 +51,31 @@ static struct snd_soc_acpi_mach *cht_quirk(void *arg)
 		return mach;
 }
 
+static const struct snd_soc_acpi_codecs rt5640_comp_ids = {
+	.num_codecs = 2,
+	.codecs = { "10EC5640", "10EC3276" },
+};
+
+static const struct snd_soc_acpi_codecs rt5670_comp_ids = {
+	.num_codecs = 2,
+	.codecs = { "10EC5670", "10EC5672" },
+};
+
+static const struct snd_soc_acpi_codecs rt5645_comp_ids = {
+	.num_codecs = 3,
+	.codecs = { "10EC5645", "10EC5650", "10EC3270" },
+};
+
+static const struct snd_soc_acpi_codecs da7213_comp_ids = {
+	.num_codecs = 2,
+	.codecs = { "DGLS7212", "DGLS7213"},
+
+};
+
 /* Cherryview-based platforms: CherryTrail and Braswell */
 struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
 	{
-		.id = "10EC5670",
-		.drv_name = "cht-bsw-rt5672",
-		.fw_filename = "intel/fw_sst_22a8.bin",
-		.board = "cht-bsw",
-		.sof_fw_filename = "sof-cht.ri",
-		.sof_tplg_filename = "sof-cht-rt5670.tplg",
-	},
-	{
-		.id = "10EC5672",
+		.comp_ids = &rt5670_comp_ids,
 		.drv_name = "cht-bsw-rt5672",
 		.fw_filename = "intel/fw_sst_22a8.bin",
 		.board = "cht-bsw",
@@ -70,23 +83,7 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
 		.sof_tplg_filename = "sof-cht-rt5670.tplg",
 	},
 	{
-		.id = "10EC5645",
-		.drv_name = "cht-bsw-rt5645",
-		.fw_filename = "intel/fw_sst_22a8.bin",
-		.board = "cht-bsw",
-		.sof_fw_filename = "sof-cht.ri",
-		.sof_tplg_filename = "sof-cht-rt5645.tplg",
-	},
-	{
-		.id = "10EC5650",
-		.drv_name = "cht-bsw-rt5645",
-		.fw_filename = "intel/fw_sst_22a8.bin",
-		.board = "cht-bsw",
-		.sof_fw_filename = "sof-cht.ri",
-		.sof_tplg_filename = "sof-cht-rt5645.tplg",
-	},
-	{
-		.id = "10EC3270",
+		.comp_ids = &rt5645_comp_ids,
 		.drv_name = "cht-bsw-rt5645",
 		.fw_filename = "intel/fw_sst_22a8.bin",
 		.board = "cht-bsw",
@@ -110,15 +107,7 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
 		.sof_tplg_filename = "sof-cht-nau8824.tplg",
 	},
 	{
-		.id = "DLGS7212",
-		.drv_name = "bytcht_da7213",
-		.fw_filename = "intel/fw_sst_22a8.bin",
-		.board = "bytcht_da7213",
-		.sof_fw_filename = "sof-cht.ri",
-		.sof_tplg_filename = "sof-cht-da7213.tplg",
-	},
-	{
-		.id = "DLGS7213",
+		.comp_ids = &da7213_comp_ids,
 		.drv_name = "bytcht_da7213",
 		.fw_filename = "intel/fw_sst_22a8.bin",
 		.board = "bytcht_da7213",
@@ -135,7 +124,7 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
 	},
 	/* some CHT-T platforms rely on RT5640, use Baytrail machine driver */
 	{
-		.id = "10EC5640",
+		.comp_ids = &rt5640_comp_ids,
 		.drv_name = "bytcr_rt5640",
 		.fw_filename = "intel/fw_sst_22a8.bin",
 		.board = "bytcr_rt5640",
@@ -143,14 +132,6 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
 		.sof_fw_filename = "sof-cht.ri",
 		.sof_tplg_filename = "sof-cht-rt5640.tplg",
 	},
-	{
-		.id = "10EC3276",
-		.drv_name = "bytcr_rt5640",
-		.fw_filename = "intel/fw_sst_22a8.bin",
-		.board = "bytcr_rt5640",
-		.sof_fw_filename = "sof-cht.ri",
-		.sof_tplg_filename = "sof-cht-rt5640.tplg",
-	},
 	{
 		.id = "10EC5682",
 		.drv_name = "sof_rt5682",
-- 
2.25.1

