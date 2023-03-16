Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0FB6BD5C1
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 17:33:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD35D10B6;
	Thu, 16 Mar 2023 17:32:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD35D10B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678984419;
	bh=wzNYGPQ2ZO9aN05FrHAznKpf3bpWUmj89P5ta91N3+s=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K5QuWLYPJPz0d51SgtSOkM661Fy4COzo+4H4MrHOPugvVVW4NkMYsY13ebUVBQYx4
	 fEWzOw4Yh2j1hSwNglgbL18wo2lF/q5HqHSzqvNmeC37v67ihO37A4Srph/ohrg8GN
	 PcG7X6MlbJ5sW9RlyRiKRhMsndWrELq2F/PRbdrg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02223F80482;
	Thu, 16 Mar 2023 17:32:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E69B9F804B1; Thu, 16 Mar 2023 17:32:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DC0E3F80482
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 17:32:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC0E3F80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KB7oi4iF
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B9E1EB8228A;
	Thu, 16 Mar 2023 16:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA08C433EF;
	Thu, 16 Mar 2023 16:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678984358;
	bh=wzNYGPQ2ZO9aN05FrHAznKpf3bpWUmj89P5ta91N3+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KB7oi4iFQSkgo/sU5242h4Zm6bBKpJDeVIkBzq4KzaLZnIaShKoxRiEZ2VNz8LT6M
	 IKPSIVvDPFmQ+7/68v/g46UlXg7y/wEZoclvQfcREEUzj9HTvlv4CIXqKh+BC+3WSb
	 lsi4tZ5qvK8Ti+qbAunyfZSqC7oUn0plQYhdsn4M/5Ydx/3wB9hzLbGsuUSeUC1pjO
	 RTK+wYI1PDBYiZPoBQLN1MgRhZ1DoVixd3eBF5mcMIT6infEtTaxU2OnoaBpraFyX7
	 SMKbxl1fQJXJEuRa4q7TE5TlOBxj+oCsrYdgUZj5EpxttrnWwqp+rOQ/OV19UTUsZ2
	 o9ViYGg8uKN/w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 2/7] ASoC: Intel: sof_rt5682: Add quirk for Rex
 board with mx98360a amplifier
Date: Thu, 16 Mar 2023 12:32:19 -0400
Message-Id: <20230316163227.708614-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316163227.708614-1-sashal@kernel.org>
References: <20230316163227.708614-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RPUCCO74VPFXE7GZA4O5KTCSTAITABAN
X-Message-ID-Hash: RPUCCO74VPFXE7GZA4O5KTCSTAITABAN
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: "Dharageswari.R" <dharageswari.r@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Sasha Levin <sashal@kernel.org>,
 cezary.rojewski@intel.com, liam.r.girdwood@linux.intel.com,
 yung-chuan.liao@linux.intel.com, kai.vehmanen@linux.intel.com,
 tiwai@suse.com, brent.lu@intel.com, yong.zhi@intel.com,
 ajye_huang@compal.corp-partner.google.com, akihiko.odaki@gmail.com,
 vamshi.krishna.gopal@intel.com, ye.xingchen@zte.com.cn,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RPUCCO74VPFXE7GZA4O5KTCSTAITABAN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: "Dharageswari.R" <dharageswari.r@intel.com>

[ Upstream commit 7e43b75d6a062197b3bf39ddd1b10ce2e2d2a9b0 ]

Add mtl_mx98360a_rt5682 driver data for Chrome Rex board support.

Signed-off-by: Dharageswari.R <dharageswari.r@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Link: https://lore.kernel.org/r/20230220080652.23136-1-peter.ujfalusi@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_rt5682.c           | 23 +++++++++++++++++++
 .../intel/common/soc-acpi-intel-mtl-match.c   | 12 ++++++++++
 2 files changed, 35 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 71a11d747622a..4fe448295a902 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -223,6 +223,20 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 					SOF_RT5682_SSP_AMP(2) |
 					SOF_RT5682_NUM_HDMIDEV(4)),
 	},
+	{
+		.callback = sof_rt5682_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Rex"),
+			DMI_MATCH(DMI_OEM_STRING, "AUDIO-MAX98360_ALC5682I_I2S"),
+		},
+		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_SSP_CODEC(2) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_MAX98360A_SPEAKER_AMP_PRESENT |
+					SOF_RT5682_SSP_AMP(0) |
+					SOF_RT5682_NUM_HDMIDEV(4)
+					),
+	},
 	{
 		.callback = sof_rt5682_quirk_cb,
 		.matches = {
@@ -1105,6 +1119,15 @@ static const struct platform_device_id board_ids[] = {
 					SOF_RT5682_SSP_AMP(1) |
 					SOF_RT5682_NUM_HDMIDEV(4)),
 	},
+	{
+		.name = "mtl_mx98360_rt5682",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_SSP_CODEC(0) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_MAX98360A_SPEAKER_AMP_PRESENT |
+					SOF_RT5682_SSP_AMP(1) |
+					SOF_RT5682_NUM_HDMIDEV(4)),
+	},
 	{
 		.name = "jsl_rt5682",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index b1a66a0f68181..7911c3af8071f 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -15,6 +15,11 @@ static const struct snd_soc_acpi_codecs mtl_max98357a_amp = {
 	.codecs = {"MX98357A"}
 };
 
+static const struct snd_soc_acpi_codecs mtl_max98360a_amp = {
+	.num_codecs = 1,
+	.codecs = {"MX98360A"}
+};
+
 static const struct snd_soc_acpi_codecs mtl_rt5682_rt5682s_hp = {
 	.num_codecs = 2,
 	.codecs = {"10EC5682", "RTL5682"},
@@ -28,6 +33,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[] = {
 		.quirk_data = &mtl_max98357a_amp,
 		.sof_tplg_filename = "sof-mtl-max98357a-rt5682.tplg",
 	},
+	{
+		.comp_ids = &mtl_rt5682_rt5682s_hp,
+		.drv_name = "mtl_mx98360_rt5682",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &mtl_max98360a_amp,
+		.sof_tplg_filename = "sof-mtl-max98360a-rt5682.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_mtl_machines);
-- 
2.39.2

