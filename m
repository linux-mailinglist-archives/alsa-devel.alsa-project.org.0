Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EF213AAD6
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:25:02 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 243B91F66;
	Mon, 13 Jan 2020 16:20:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 243B91F66
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14146F802EC;
	Mon, 13 Jan 2020 16:13:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76BADF802BC; Mon, 13 Jan 2020 16:13:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E1D0F80276
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 16:13:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E1D0F80276
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="NJ5ycc2C"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=LQ1X6Qf6cMDMtvhJHEFivDie9FfTlKLr75x0YeJgkNw=; b=NJ5ycc2CUVde
 6jzZICJH+YcfR9lyr58hvRXQV0iaoywhjVi6fOMMs9LEmYKLJa9YyICan+5uKV1Mmeic/3vaD42Ut
 LOLE0+OgkFHCr4PMDiKQXmtjVw8MYaAuVOS8e77WTOUUsfzMeoWDTZWs2wJG1WqPE1CDxn87ziKSO
 Vuuyw=;
Received: from fw-tnat-cam7.arm.com ([217.140.106.55]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1ir1P1-0003Lu-Qk; Mon, 13 Jan 2020 15:13:15 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 8CE1CD01AE4; Mon, 13 Jan 2020 15:13:15 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20200110222530.30303-4-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200110222530.30303-4-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Date: Mon, 13 Jan 2020 15:13:15 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: Intel: common: add match tables for ICL
	w/ SoundWire" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: Intel: common: add match tables for ICL w/ SoundWire

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 4313dd3efe5751238f85dd7069bee3a8bbcdbe2f Mon Sep 17 00:00:00 2001
From: Bard Liao <yung-chuan.liao@linux.intel.com>
Date: Fri, 10 Jan 2020 16:25:27 -0600
Subject: [PATCH] ASoC: Intel: common: add match tables for ICL w/ SoundWire

The two configurations are with the Realtek 3-in-1 board requiring all
4 links to be enabled, or basic configuration with the on-board RT700
using link0.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200110222530.30303-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../intel/common/soc-acpi-intel-icl-match.c   | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-icl-match.c b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
index 38977669b576..67e9da4635f2 100644
--- a/sound/soc/intel/common/soc-acpi-intel-icl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
@@ -33,5 +33,103 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_icl_machines[] = {
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_icl_machines);
 
+static const u64 rt700_0_adr[] = {
+	0x000010025D070000
+};
+
+static const struct snd_soc_acpi_link_adr icl_rvp[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt700_0_adr),
+		.adr = rt700_0_adr,
+	},
+	{}
+};
+
+static const u64 rt711_0_adr[] = {
+	0x000010025D071100
+};
+
+static const u64 rt1308_1_adr[] = {
+	0x000110025D130800
+};
+
+static const u64 rt1308_2_adr[] = {
+	0x000210025D130800
+};
+
+static const u64 rt715_3_adr[] = {
+	0x000310025D715000
+};
+
+static const struct snd_soc_acpi_link_adr icl_3_in_1_default[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt711_0_adr),
+		.adr = rt711_0_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1308_1_adr),
+		.adr = rt1308_1_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt1308_2_adr),
+		.adr = rt1308_2_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt715_3_adr),
+		.adr = rt715_3_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr icl_3_in_1_mono_amp[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt711_0_adr),
+		.adr = rt711_0_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1308_1_adr),
+		.adr = rt1308_1_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt715_3_adr),
+		.adr = rt715_3_adr,
+	},
+	{}
+};
+
+struct snd_soc_acpi_mach snd_soc_acpi_intel_icl_sdw_machines[] = {
+	{
+		.link_mask = 0xF, /* 4 active links required */
+		.links = icl_3_in_1_default,
+		.drv_name = "sdw_rt711_rt1308_rt715",
+		.sof_fw_filename = "sof-icl.ri",
+		.sof_tplg_filename = "sof-icl-rt711-rt1308-rt715.tplg",
+	},
+	{
+		.link_mask = 0xB, /* 3 active links required */
+		.links = icl_3_in_1_mono_amp,
+		.drv_name = "sdw_rt711_rt1308_rt715",
+		.sof_fw_filename = "sof-icl.ri",
+		.sof_tplg_filename = "sof-icl-rt711-rt1308-rt715-mono.tplg",
+	},
+	{
+		.link_mask = 0x1, /* rt700 connected on link0 */
+		.links = icl_rvp,
+		.drv_name = "sdw_rt700",
+		.sof_fw_filename = "sof-icl.ri",
+		.sof_tplg_filename = "sof-icl-rt700.tplg",
+	},
+	{},
+};
+EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_icl_sdw_machines);
+
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Intel Common ACPI Match module");
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
