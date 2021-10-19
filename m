Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9994330B2
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 10:06:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C6D516CE;
	Tue, 19 Oct 2021 10:05:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C6D516CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634630759;
	bh=qunD1LFytCdT94vLyWjP5Qx8in/THn2SM5twip/oBaI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s//BzPWRuE1XGoo2LqMNDSrBa6rQDLBn/vSOvKPweGA308ObjodNMuo29yMzULa0w
	 W3ayAJv+voKNP/i6FwoBZmX6DdsbT5Vo83gbLYTsc/rQMSM65pN+JiOUclo1T0oINm
	 vM8HnjTsF1iiHM7zDEPA+i/7Dk+8wAqLmKfLY6/I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83EE9F804FC;
	Tue, 19 Oct 2021 10:04:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBE80F804FE; Tue, 19 Oct 2021 10:03:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F6ACF804F3
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 10:03:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F6ACF804F3
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="228398763"
X-IronPort-AV: E=Sophos;i="5.85,383,1624345200"; d="scan'208";a="228398763"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 01:03:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,383,1624345200"; d="scan'208";a="493984698"
Received: from brentlu-brix.itwn.intel.com ([10.5.253.56])
 by orsmga008.jf.intel.com with ESMTP; 19 Oct 2021 01:03:05 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 4/6] ASoC: Intel: soc-acpi-byt: shrink tables using
 compatible IDs
Date: Tue, 19 Oct 2021 15:59:39 +0800
Message-Id: <20211019075941.2037787-5-brent.lu@intel.com>
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
 .../intel/common/soc-acpi-intel-byt-match.c   | 68 +++++++------------
 1 file changed, 24 insertions(+), 44 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-byt-match.c b/sound/soc/intel/common/soc-acpi-intel-byt-match.c
index 510a5f38b7f1..142000991813 100644
--- a/sound/soc/intel/common/soc-acpi-intel-byt-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-byt-match.c
@@ -120,9 +120,29 @@ static struct snd_soc_acpi_mach *byt_quirk(void *arg)
 	}
 }
 
+static const struct snd_soc_acpi_codecs rt5640_comp_ids = {
+	.num_codecs = 3,
+	.codecs = { "10EC5640", "10EC5642", "INTCCFFD"},
+};
+
+static const struct snd_soc_acpi_codecs wm5102_comp_ids = {
+	.num_codecs = 2,
+	.codecs = { "WM510204", "WM510205"},
+};
+
+static const struct snd_soc_acpi_codecs da7213_comp_ids = {
+	.num_codecs = 2,
+	.codecs = { "DGLS7212", "DGLS7213"},
+};
+
+static const struct snd_soc_acpi_codecs rt5645_comp_ids = {
+	.num_codecs = 2,
+	.codecs = { "10EC5645", "10EC5648"},
+};
+
 struct snd_soc_acpi_mach  snd_soc_acpi_intel_baytrail_machines[] = {
 	{
-		.id = "10EC5640",
+		.comp_ids = &rt5640_comp_ids,
 		.drv_name = "bytcr_rt5640",
 		.fw_filename = "intel/fw_sst_0f28.bin",
 		.board = "bytcr_rt5640",
@@ -130,22 +150,6 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_baytrail_machines[] = {
 		.sof_fw_filename = "sof-byt.ri",
 		.sof_tplg_filename = "sof-byt-rt5640.tplg",
 	},
-	{
-		.id = "10EC5642",
-		.drv_name = "bytcr_rt5640",
-		.fw_filename = "intel/fw_sst_0f28.bin",
-		.board = "bytcr_rt5640",
-		.sof_fw_filename = "sof-byt.ri",
-		.sof_tplg_filename = "sof-byt-rt5640.tplg",
-	},
-	{
-		.id = "INTCCFFD",
-		.drv_name = "bytcr_rt5640",
-		.fw_filename = "intel/fw_sst_0f28.bin",
-		.board = "bytcr_rt5640",
-		.sof_fw_filename = "sof-byt.ri",
-		.sof_tplg_filename = "sof-byt-rt5640.tplg",
-	},
 	{
 		.id = "10EC5651",
 		.drv_name = "bytcr_rt5651",
@@ -155,7 +159,7 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_baytrail_machines[] = {
 		.sof_tplg_filename = "sof-byt-rt5651.tplg",
 	},
 	{
-		.id = "WM510204",
+		.comp_ids = &wm5102_comp_ids,
 		.drv_name = "bytcr_wm5102",
 		.fw_filename = "intel/fw_sst_0f28.bin",
 		.board = "bytcr_wm5102",
@@ -163,23 +167,7 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_baytrail_machines[] = {
 		.sof_tplg_filename = "sof-byt-wm5102.tplg",
 	},
 	{
-		.id = "WM510205",
-		.drv_name = "bytcr_wm5102",
-		.fw_filename = "intel/fw_sst_0f28.bin",
-		.board = "bytcr_wm5102",
-		.sof_fw_filename = "sof-byt.ri",
-		.sof_tplg_filename = "sof-byt-wm5102.tplg",
-	},
-	{
-		.id = "DLGS7212",
-		.drv_name = "bytcht_da7213",
-		.fw_filename = "intel/fw_sst_0f28.bin",
-		.board = "bytcht_da7213",
-		.sof_fw_filename = "sof-byt.ri",
-		.sof_tplg_filename = "sof-byt-da7213.tplg",
-	},
-	{
-		.id = "DLGS7213",
+		.comp_ids = &da7213_comp_ids,
 		.drv_name = "bytcht_da7213",
 		.fw_filename = "intel/fw_sst_0f28.bin",
 		.board = "bytcht_da7213",
@@ -202,15 +190,7 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_baytrail_machines[] = {
 	},
 	/* some Baytrail platforms rely on RT5645, use CHT machine driver */
 	{
-		.id = "10EC5645",
-		.drv_name = "cht-bsw-rt5645",
-		.fw_filename = "intel/fw_sst_0f28.bin",
-		.board = "cht-bsw",
-		.sof_fw_filename = "sof-byt.ri",
-		.sof_tplg_filename = "sof-byt-rt5645.tplg",
-	},
-	{
-		.id = "10EC5648",
+		.comp_ids = &rt5645_comp_ids,
 		.drv_name = "cht-bsw-rt5645",
 		.fw_filename = "intel/fw_sst_0f28.bin",
 		.board = "cht-bsw",
-- 
2.25.1

