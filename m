Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3AD46377C
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 15:50:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AA25209E;
	Tue, 30 Nov 2021 15:50:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AA25209E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638283855;
	bh=GYelIzla2ERhaz/azQwsl0n3hYjinxzGDcoQUIxq+6s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZLekWUOWAYDQJMLY/N5XF9Y2AVlISJ81+Dx5u647tK90I5J3g6i6CMiAbZpLh5n/h
	 dZfxjg6QmUJr/N7jrsWts6Z/RVpTnHWJbo0ELDFSluxFpTKC1rELPbXS1kzKO1P8Ja
	 y6yabSWrHkxNiHU8r7sgEg4AJkiHtBUUp91V2M+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAEC9F80519;
	Tue, 30 Nov 2021 15:47:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9CD2F80506; Tue, 30 Nov 2021 15:47:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 230F8F804FD
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 15:47:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 230F8F804FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EsNTq9Nt"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C5733B81A1D;
 Tue, 30 Nov 2021 14:47:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9023BC53FCF;
 Tue, 30 Nov 2021 14:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638283655;
 bh=GYelIzla2ERhaz/azQwsl0n3hYjinxzGDcoQUIxq+6s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EsNTq9Nt6mGxB5wuCXlmUCsqX/nihQpLkBSyaNuwmQ6kRy9ZmeArqUj+9nKBQvVAI
 Rh5iz9/4ZMCD6P3KbEElTZf/czjm1U2AVwf0nPubnfIIWi7RbtUnhOkYQQ/evUA9zX
 PMlyCHCyOXpNkO4O2Dk3hhpryCs+L0gAEFvRoAboThDBkXwbyunYJgp+6xdKAjuJEK
 kORFu+smS9liduj4pnPDLQzg1HD6kC1CwMe++gaSSCx6VcxRw6h3W8U70AOhLtkE5C
 0zAO8NtU+ZzYlii3XEy1bmcbcYetAdMGGMgilT8YxcY5OqRs620Mftv0kzfs1i8fXQ
 BDet1rjyaAiAw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 07/68] ASoC: Intel: soc-acpi: add SKU 0B13
 SoundWire configuration
Date: Tue, 30 Nov 2021 09:46:03 -0500
Message-Id: <20211130144707.944580-7-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211130144707.944580-1-sashal@kernel.org>
References: <20211130144707.944580-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, libin.yang@intel.com,
 cezary.rojewski@intel.com, kai.vehmanen@linux.intel.com,
 Gongjun Song <gongjun.song@intel.com>, tiwai@suse.com,
 yang.jie@linux.intel.com,
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

[ Upstream commit 11e18f582c14fdf08f52d99d439d2b82d98ac37d ]

Product audio hardware configuration is rt1316 on link2,
rt714 on link 3.

Signed-off-by: Gongjun Song <gongjun.song@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20211105022646.26305-7-yung-chuan.liao@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../intel/common/soc-acpi-intel-adl-match.c   | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index 4ce7859a67d98..c1ef176f97600 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -228,6 +228,20 @@ static const struct snd_soc_acpi_link_adr adl_sdw_rt1316_link12_rt714_link0[] =
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr adl_sdw_rt1316_link2_rt714_link3[] = {
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt1316_2_single_adr),
+		.adr_d = rt1316_2_single_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt714_3_adr),
+		.adr_d = rt714_3_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr adl_sdw_rt1316_link2_rt714_link0[] = {
 	{
 		.mask = BIT(2),
@@ -340,6 +354,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-adl-rt711-l0-rt1316-l13-rt714-l2.tplg",
 	},
+	{
+		.link_mask = 0xC, /* rt1316 on link2 & rt714 on link3 */
+		.links = adl_sdw_rt1316_link2_rt714_link3,
+		.drv_name = "sof_sdw",
+		.sof_fw_filename = "sof-adl.ri",
+		.sof_tplg_filename = "sof-adl-rt1316-l2-mono-rt714-l3.tplg",
+	},
 	{
 		.link_mask = 0x7, /* rt714 on link0 & two rt1316s on link1 and link2 */
 		.links = adl_sdw_rt1316_link12_rt714_link0,
-- 
2.33.0

