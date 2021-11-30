Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86158463795
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 15:51:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03B0A20BE;
	Tue, 30 Nov 2021 15:50:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03B0A20BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638283900;
	bh=CNAHlOZfnknoKKVJMngtfmRDBMWJvft/cAZzwj2L0sE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j7brJMsO7kk45GsrYNF4BsvgPEDVwoQCvaRSa0plcBh7qUi0952y55SQDVdFPEsz+
	 PYnIwxoFbzB44X4HjNvpHhbG5+R/viq0z/6+uJMp0DlW7zh9PWfMtV2CNVSrUjye6P
	 EgItK+tKFduV0eylbubCdEwwJGdakR71tHIuvuxM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A363FF80527;
	Tue, 30 Nov 2021 15:47:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C25EBF8051E; Tue, 30 Nov 2021 15:47:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC5A0F80518
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 15:47:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC5A0F80518
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jbID+Qe8"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A85C4B81A21;
 Tue, 30 Nov 2021 14:47:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F2E1C53FCF;
 Tue, 30 Nov 2021 14:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638283663;
 bh=CNAHlOZfnknoKKVJMngtfmRDBMWJvft/cAZzwj2L0sE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jbID+Qe8EJWwcxeaBHxhwf+u5m1Pa0sU3KLyIcHQK+mPm566xbjDAigXt1Nn5tuDo
 d/AOBwCBldQ2ZV/dikldo4UanZz5sSo+/cZLvfJzdIiH7ghANs9GzCNDMPuCwM6MZ2
 YT/pTGSn5RZtvUq17u9BbkDl1km+AAaJyKWMRy4njPmA5bj3dafRo0pDlYVI8oalbl
 ZOxUhxAi81Jh9UVAZCBvGrdG+1fe4QE//HRssRwGPdAxnI37M1+co9ItgDiRu9zUA4
 c8GX+fUJiw45IyWcxIu/1xbROXR63bbUi+pSjbf2p4HJHQ9TYwYhgHlhvUA6Cq2Xr4
 EiYZefR2326uQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 09/68] ASoC: Intel: soc-acpi: add SKU 0B29
 SoundWire configuration
Date: Tue, 30 Nov 2021 09:46:05 -0500
Message-Id: <20211130144707.944580-9-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211130144707.944580-1-sashal@kernel.org>
References: <20211130144707.944580-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, libin.yang@intel.com,
 cezary.rojewski@intel.com, malik_hsu@wistron.corp-partner.google.com,
 kai.vehmanen@linux.intel.com, Gongjun Song <gongjun.song@intel.com>,
 tiwai@suse.com, yang.jie@linux.intel.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, liam.r.girdwood@linux.intel.com,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, brent.lu@intel.com,
 vamshi.krishna.gopal@intel.com
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

[ Upstream commit 359ace2b9a411c3bd4b89fdc56f8b60e0f6696d2 ]

Product audio hardware configuration is rt711 on link2,
two rt1316s on link0 and link1, rt714 on link 3.

Signed-off-by: Gongjun Song <gongjun.song@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20211105022646.26305-9-yung-chuan.liao@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../intel/common/soc-acpi-intel-adl-match.c   | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index c1ef176f97600..bf859f47ffce0 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -74,6 +74,15 @@ static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt711_sdca_2_adr[] = {
+	{
+		.adr = 0x000230025D071101ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt711"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt1316_1_group1_adr[] = {
 	{
 		.adr = 0x000131025D131601ull, /* unique ID is set for some reason */
@@ -101,6 +110,24 @@ static const struct snd_soc_acpi_adr_device rt1316_3_group1_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt1316_0_group2_adr[] = {
+	{
+		.adr = 0x000031025D131601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "rt1316-1"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1316_1_group2_adr[] = {
+	{
+		.adr = 0x000130025D131601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "rt1316-2"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt1316_2_single_adr[] = {
 	{
 		.adr = 0x000230025D131601ull,
@@ -209,6 +236,30 @@ static const struct snd_soc_acpi_link_adr adl_sdca_3_in_1[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr adl_sdw_rt711_link2_rt1316_link01_rt714_link3[] = {
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt711_sdca_2_adr),
+		.adr_d = rt711_sdca_2_adr,
+	},
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt1316_0_group2_adr),
+		.adr_d = rt1316_0_group2_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1316_1_group2_adr),
+		.adr_d = rt1316_1_group2_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt714_3_adr),
+		.adr_d = rt714_3_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr adl_sdw_rt1316_link12_rt714_link0[] = {
 	{
 		.mask = BIT(1),
@@ -354,6 +405,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-adl-rt711-l0-rt1316-l13-rt714-l2.tplg",
 	},
+	{
+		.link_mask = 0xF, /* 4 active links required */
+		.links = adl_sdw_rt711_link2_rt1316_link01_rt714_link3,
+		.drv_name = "sof_sdw",
+		.sof_fw_filename = "sof-adl.ri",
+		.sof_tplg_filename = "sof-adl-rt711-l2-rt1316-l01-rt714-l3.tplg",
+	},
 	{
 		.link_mask = 0xC, /* rt1316 on link2 & rt714 on link3 */
 		.links = adl_sdw_rt1316_link2_rt714_link3,
-- 
2.33.0

