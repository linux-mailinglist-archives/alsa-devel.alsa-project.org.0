Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 938586252D3
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 05:50:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BB6E1670;
	Fri, 11 Nov 2022 05:49:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BB6E1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668142205;
	bh=Eh38dgf3HL7ThcwJCjnQe+u8lgMO5mhrwLZ4lxDcpi4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TiLsLYPGjoLKvXN8TftciYk2bDm31daopLFzPyA0VIgvvhfepSva+OqsHgdKVZZEi
	 VbNPPubC5KtQ6B3R+91ZZhPxXz3DjKnuSxezoiGVAnwXwves9EdWjRo3eTHs4Uoarf
	 Raa3oNZIAi6lUhO/Zu1+83Z2/ZjcoXY/CfFQAang=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93F0CF80548;
	Fri, 11 Nov 2022 05:48:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A092F80548; Fri, 11 Nov 2022 05:48:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4EDFF80249
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 05:48:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4EDFF80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="l/rfMK/P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668142123; x=1699678123;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Eh38dgf3HL7ThcwJCjnQe+u8lgMO5mhrwLZ4lxDcpi4=;
 b=l/rfMK/PZJxDyDi9JN2p/w99Yy53wplrQHgG7lUCcOcXbUP+RaSLqWSk
 Za6xvZkdPayuVm3pGhUOMHUSdt/rXee1KbESXuiNksL/8i571vu+wbE+u
 kXVeZDOABKJGWQl5YM0VpMXICQ59bRX2FL+uWOb1wMUm2p/ilTGShJdhz
 MniU+fpoRDvKGy92SWYhccu3cxT58s/fD3AYFsjB07Xq5Xu0XDdPQkEcJ
 F3jT7aEisN+MZu3sbTXDxlj4SHIVXl695gefC7hbNjTkHNecrZx6iX0ln
 JhZ5CuPhm2ChAelwYWOvo/wcvpwYronUWLdQFTa258JbpRM5fL4L3DbWh Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="311527617"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="311527617"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 20:48:30 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="706420083"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="706420083"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 20:48:28 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 2/4] ASoC: Intel: soc-acpi: add SKU 0C10 SoundWire
 configuration
Date: Fri, 11 Nov 2022 12:50:14 +0800
Message-Id: <20221111045016.46573-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111045016.46573-1-yung-chuan.liao@linux.intel.com>
References: <20221111045016.46573-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, peter.ujfalusi@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com,
 ranjani.sridharan@linux.intel.com
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

From: Gongjun Song <gongjun.song@intel.com>

Audio hardware configuration of SKU 0C10 product is rt714 on link0,
two rt1316s on link1 and link2

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Gongjun Song <gongjun.song@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-rpl-match.c   | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index 9ccf7370157b..371333ed8c16 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -65,6 +65,15 @@ static const struct snd_soc_acpi_adr_device rt1316_1_group1_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt1316_2_group1_adr[] = {
+	{
+		.adr = 0x000230025D131601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "rt1316-2"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt1316_3_group1_adr[] = {
 	{
 		.adr = 0x000330025D131601ull,
@@ -74,6 +83,15 @@ static const struct snd_soc_acpi_adr_device rt1316_3_group1_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt714_0_adr[] = {
+	{
+		.adr = 0x000030025D071401ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt714"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt714_2_adr[] = {
 	{
 		.adr = 0x000230025D071401ull,
@@ -107,6 +125,25 @@ static const struct snd_soc_acpi_link_adr rpl_sdca_3_in_1[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr rpl_sdw_rt1316_link12_rt714_link0[] = {
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1316_1_group1_adr),
+		.adr_d = rt1316_1_group1_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt1316_2_group1_adr),
+		.adr_d = rt1316_2_group1_adr,
+	},
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt714_0_adr),
+		.adr_d = rt714_0_adr,
+	},
+	{}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
 	{},
 };
@@ -120,6 +157,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-rpl-rt711-l0-rt1316-l13-rt714-l2.tplg",
 	},
+	{
+		.link_mask = 0x7, /* rt714 on link0 & two rt1316s on link1 and link2 */
+		.links = rpl_sdw_rt1316_link12_rt714_link0,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-rpl-rt1316-l12-rt714-l0.tplg",
+	},
 	{
 		.link_mask = 0x1, /* link0 required */
 		.links = rpl_rvp,
-- 
2.25.1

