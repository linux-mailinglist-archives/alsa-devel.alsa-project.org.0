Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE837CDEA5
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 16:13:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EEC482B;
	Wed, 18 Oct 2023 16:12:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EEC482B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697638406;
	bh=VZTOwCCYYwzqElwSzDXTHyXx/ce6rb0ClUyf9Lrju90=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OvdXBeU6HDzBSC7izupobI+EaqZWxeLBISv3dBapBzZgg7Rwh0c7+7Ku4hNXqfMJ7
	 8evSXhdm+7eeq6Mme5kcUEVIZQlCEjb+tFNf34Hltf2zwCnUv+PMFwUEAbSqnVl6dm
	 ALD0kF01nWshuvvShAM8m+cF14Z6hKmpRkf+/ri8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7A87F8025F; Wed, 18 Oct 2023 16:12:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19B26F8025F;
	Wed, 18 Oct 2023 16:12:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77BA5F8027B; Wed, 18 Oct 2023 16:12:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7EF7AF800C9
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 16:12:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EF7AF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=P4haeU4A
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id DF02CB82393;
	Wed, 18 Oct 2023 14:11:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58396C433C9;
	Wed, 18 Oct 2023 14:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697638319;
	bh=VZTOwCCYYwzqElwSzDXTHyXx/ce6rb0ClUyf9Lrju90=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P4haeU4Ao5g88h52kxI8e2hBXGc5oc4us0EE30oHzMnaCTfTyI6aOGJiz+IvxxWW3
	 ugVmRVIgDmgQhK09CMOufeVymicEVYoLeVxW3I/QsTNpGbA//YNxXbIycEi2pZa2Vr
	 MBgXW7ZPxzFfcVrSWVcylKTvEdzdpidweDHwFCs/mImGTXVl/6NZLv8EQeivECDA4B
	 dmh8zIELSnWBcCffAQtSNxcmRaR3tjMu4lmGr17RF4zZnzvrXm8jFf7lgue/bGNB4b
	 7q9/qByOZ0wVIMu7u43gUMbE8ZWmSFydZTW/VjWbS3E/0X+pZ6Oddv/YZLjjh1H5Mb
	 d7tvg3CVuE8HQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Balamurugan C <balamurugan.c@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com,
	chao.song@linux.intel.com,
	dharageswari.r@intel.com,
	uday.m.bhat@intel.com,
	yong.zhi@intel.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.5 02/31] ASoC: Intel: soc-acpi: Add entry for
 sof_es8336 in MTL match table.
Date: Wed, 18 Oct 2023 10:11:19 -0400
Message-Id: <20231018141151.1334501-2-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231018141151.1334501-1-sashal@kernel.org>
References: <20231018141151.1334501-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.7
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GN7ADNC6SQKV6B6QO74NBJ4PL6MWWHPH
X-Message-ID-Hash: GN7ADNC6SQKV6B6QO74NBJ4PL6MWWHPH
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GN7ADNC6SQKV6B6QO74NBJ4PL6MWWHPH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Balamurugan C <balamurugan.c@intel.com>

[ Upstream commit 381ddcd5875e496f2eae06bb65853271b7150fee ]

Adding support for ES83x6 codec in MTL match table.

Signed-off-by: Balamurugan C <balamurugan.c@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20230919091136.1922253-2-yung-chuan.liao@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index ed9821adc1d9d..18da4b7e378d1 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -30,6 +30,11 @@ static const struct snd_soc_acpi_codecs mtl_rt5682_rt5682s_hp = {
 	.codecs = {"10EC5682", "RTL5682"},
 };
 
+static const struct snd_soc_acpi_codecs mtl_essx_83x6 = {
+	.num_codecs = 3,
+	.codecs = { "ESSX8316", "ESSX8326", "ESSX8336"},
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[] = {
 	{
 		.comp_ids = &mtl_rt5682_rt5682s_hp,
@@ -52,6 +57,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[] = {
 		.quirk_data = &mtl_rt1019p_amp,
 		.sof_tplg_filename = "sof-mtl-rt1019-rt5682.tplg",
 	},
+	{
+		.comp_ids = &mtl_essx_83x6,
+		.drv_name = "sof-essx8336",
+		.sof_tplg_filename = "sof-mtl-es8336", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER |
+					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
+					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_mtl_machines);
-- 
2.40.1

