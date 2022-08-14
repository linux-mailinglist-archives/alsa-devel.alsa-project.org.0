Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B400A5923F6
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Aug 2022 18:26:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61D411661;
	Sun, 14 Aug 2022 18:26:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61D411661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660494413;
	bh=bfcOz9zsKVPqIE/edsGfGC3+4XG2YhdpQJo5xjBlGBI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qwU5NAl5MxP13EvKG7r8VkGS3+TubKQ8EzW6PSB+7hrzE7biLprbOqkxOH6TyGeI2
	 Ells0y/2axMOnrZ0wyxtmoDpQFKB7f9knp3HHp4QmOB4Pk8EA3dr/ho9ogQXTy9w/F
	 +XbqpLE+oThFxdYkcsvQ7UjaNgrhEe88rX8ExUXE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5789F80589;
	Sun, 14 Aug 2022 18:24:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E70A3F80563; Sun, 14 Aug 2022 18:24:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D480F8055B;
 Sun, 14 Aug 2022 18:24:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D480F8055B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OCezi9lb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A870260F71;
 Sun, 14 Aug 2022 16:24:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD64C433D6;
 Sun, 14 Aug 2022 16:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660494266;
 bh=bfcOz9zsKVPqIE/edsGfGC3+4XG2YhdpQJo5xjBlGBI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OCezi9lbLAOpFOAW9wMS+e+EX7CMW1olijK0e9zOzu6t/wd+qjVBc9Cpv+FySpM5N
 +x7EDdpeAXT+nnd/mvxsS9msKXsTASysIbfcFEjk21/APJ++8c6VnScaNfIyWXI707
 ZslNWpJhLdsq/jEW4gIEjRfGaUHucD9qlmbvoJdRdUuAjlfOVHqWasmQV3F7tYMOkm
 OzokI/4oEdvEXitx28eXzuWSYWjXOZoLmFDUFUBLavdF+yZj5pRgLeWIr3FxmJZpvq
 hSA/bGohoya0EEEn+lAb0LROVzYaH9RoB+UIlikrwFwsGgL1jgfdDE2p/muSSwk3iM
 qVUMR1rOV6FSQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 17/39] ASoC: SOF: Intel: hda: add sanity check on
 SSP index reported by NHLT
Date: Sun, 14 Aug 2022 12:23:06 -0400
Message-Id: <20220814162332.2396012-17-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814162332.2396012-1-sashal@kernel.org>
References: <20220814162332.2396012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, guennadi.liakhovetski@linux.intel.com,
 alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 peter.ujfalusi@linux.intel.com, tiwai@suse.com, lgirdwood@gmail.com,
 daniel.baluta@nxp.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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

[ Upstream commit e51699505042fb365df3a0ce68b850ccd9ad0108 ]

We should have a limited trust in the BIOS and verify that the SSP
index reported in NHLT is valid for each platform.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20220725195343.145603-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/intel/hda.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 9c97c80a7f48..b688caa34774 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1375,6 +1375,7 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 
 		if (mach->tplg_quirk_mask & SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER &&
 		    mach->mach_params.i2s_link_mask) {
+			const struct sof_intel_dsp_desc *chip = get_chip_info(sdev->pdata);
 			int ssp_num;
 
 			if (hweight_long(mach->mach_params.i2s_link_mask) > 1 &&
@@ -1384,6 +1385,12 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 			/* fls returns 1-based results, SSPs indices are 0-based */
 			ssp_num = fls(mach->mach_params.i2s_link_mask) - 1;
 
+			if (ssp_num >= chip->ssp_count) {
+				dev_err(sdev->dev, "Invalid SSP %d, max on this platform is %d\n",
+					ssp_num, chip->ssp_count);
+				return NULL;
+			}
+
 			tplg_filename = devm_kasprintf(sdev->dev, GFP_KERNEL,
 						       "%s%s%d",
 						       sof_pdata->tplg_filename,
-- 
2.35.1

