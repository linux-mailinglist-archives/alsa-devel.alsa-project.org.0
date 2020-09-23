Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92419275EE1
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Sep 2020 19:40:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F0A01780;
	Wed, 23 Sep 2020 19:40:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F0A01780
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600882857;
	bh=3IO+knDuCFLTeruAhWehFc+YqHwiVTp3lRuUbVs6qJc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rmjjMl49kwgs/4oyzHRUBCxu46DCdTcvE6B8HuNraH0KConR+OhBccZRNKkXGus4N
	 0dA8NLbRmMrCLodKOO2fPNPNVtsKHqEDsxN47BQnrTUIcSQWXC2Wg6juV4jn20dWKF
	 jens25SXpxASimuNAbfcE/X1AAagwiD8qbi8zdGk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC9E6F802FD;
	Wed, 23 Sep 2020 19:36:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32680F802E0; Wed, 23 Sep 2020 19:35:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3C68F80254
 for <alsa-devel@alsa-project.org>; Wed, 23 Sep 2020 19:35:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3C68F80254
IronPort-SDR: UqyCWQnGvpdXNr0Y72mYfx54DYXsj83i2QWV5mwc3JMN1X6CFFbV8oD8unx2rWi+gWtiGW40b4
 FCYXIZQsBRXA==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="148628888"
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="148628888"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 10:35:46 -0700
IronPort-SDR: YV5jMVM2kJ/j8QREj+ZEK1wqpusGzmDm3/lKbVf1mgG8m0P64ZPThB7oVmRhu0BYoKoKqeWCBi
 4zjrDLkVRHRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="335562446"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga004.fm.intel.com with ESMTP; 23 Sep 2020 10:35:44 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 6/6] ASoC: Intel: add support for new SoundWire hardware
 layout on TGL
Date: Wed, 23 Sep 2020 20:33:58 +0300
Message-Id: <20200923173358.3247215-7-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200923173358.3247215-1-kai.vehmanen@linux.intel.com>
References: <20200923173358.3247215-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 kai.vehmanen@linux.intel.com, daniel.baluta@nxp.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

The creativity of hardware folks is endless, with a complete
permutation of rt711 (was link0 now link1), rt1308 (was link1 now
link2) and rt715 (was link3 now link0).

Someday we will get all this information from platform firmware, for
now let's add the mapping table.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c              |  9 ++++
 .../intel/common/soc-acpi-intel-tgl-match.c   | 53 +++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 8e191a8d5dc5..b56df04775c2 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -48,6 +48,15 @@ static int sof_sdw_quirk_cb(const struct dmi_system_id *id)
 }
 
 static const struct dmi_system_id sof_sdw_quirk_table[] = {
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0A3E")
+		},
+		.driver_data = (void *)(SOF_RT711_JD_SRC_JD2 |
+					SOF_RT715_DAI_ID_FIX),
+	},
 	{
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 76f4eaf684b0..9f243e60b95c 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -44,6 +44,15 @@ static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt711_1_adr[] = {
+	{
+		.adr = 0x000120025D071100,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt711"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt1308_1_dual_adr[] = {
 	{
 		.adr = 0x000120025D130800,
@@ -68,6 +77,15 @@ static const struct snd_soc_acpi_adr_device rt1308_1_single_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt1308_2_single_adr[] = {
+	{
+		.adr = 0x000220025D130800,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt1308-1"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt1308_1_group1_adr[] = {
 	{
 		.adr = 0x000120025D130800,
@@ -86,6 +104,15 @@ static const struct snd_soc_acpi_adr_device rt1308_2_group1_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt715_0_adr[] = {
+	{
+		.adr = 0x000021025D071500,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt715"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt715_3_adr[] = {
 	{
 		.adr = 0x000320025D071500,
@@ -235,6 +262,25 @@ static const struct snd_soc_acpi_link_adr tgl_3_in_1_mono_amp[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr tgl_sdw_rt711_link1_rt1308_link2_rt715_link0[] = {
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt711_1_adr),
+		.adr_d = rt711_1_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt1308_2_single_adr),
+		.adr_d = rt1308_2_single_adr,
+	},
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt715_0_adr),
+		.adr_d = rt715_0_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr tgl_3_in_1_sdca[] = {
 	{
 		.mask = BIT(0),
@@ -295,6 +341,13 @@ EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_tgl_machines);
 
 /* this table is used when there is no I2S codec present */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_sdw_machines[] = {
+	{
+		.link_mask = 0x7,
+		.links = tgl_sdw_rt711_link1_rt1308_link2_rt715_link0,
+		.drv_name = "sof_sdw",
+		.sof_fw_filename = "sof-tgl.ri",
+		.sof_tplg_filename = "sof-tgl-rt715-rt711-rt1308-mono.tplg",
+	},
 	{
 		.link_mask = 0xF, /* 4 active links required */
 		.links = tgl_3_in_1_default,
-- 
2.27.0

