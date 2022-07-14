Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C34AB5742A6
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 06:25:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64CF517D1;
	Thu, 14 Jul 2022 06:24:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64CF517D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657772731;
	bh=Nu25KeaHG2mnQyV9qxyD+sSs3aEncDCtP3ul7XyJKUg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nHb87ZXt2weXtTLUn1KFf4LzrY2CyVc2ctxr9z5YTX+l6Gz9Nyg6jb63xR6rNWWse
	 UNUH+NcnSSyEWa+rfxFWJpLXpwly9cYG0wDRbtXM4am2/xoUXy/vh4zaHxU5gv4qNL
	 SJ2k9jJVOa12OOuY7iQ9Q6wFq0v53f44XdThX/kY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2E2EF80588;
	Thu, 14 Jul 2022 06:22:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09BB7F8057C; Thu, 14 Jul 2022 06:22:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84E32F80566;
 Thu, 14 Jul 2022 06:22:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84E32F80566
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Z3ATAGcd"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BE460B82379;
 Thu, 14 Jul 2022 04:22:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A929FC34114;
 Thu, 14 Jul 2022 04:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657772570;
 bh=Nu25KeaHG2mnQyV9qxyD+sSs3aEncDCtP3ul7XyJKUg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z3ATAGcdUPwz+nXXpeuywy83gbMh4aFXTorFJe39sy38pQKHi314+M8YFTthADAac
 HOPVzQcSTPCC5Pwcgg+6ySnjISc5ycD/QZeU2c0XeHGmzLlwWBf65F2UksDt+mh6NE
 an9YG/ZXStv/EbPbx3vHwy3NdkbhXXFJoNP5jMjvLTkl+6zZxL9TiYPKTQfI+sLPfl
 ct48QndUMNcXKpH3S3WCBF9NKjNbEZq+kXmtjQhSa0al4Zzy5TbHrZRxji/7dweHN/
 oz2NKIU6nUnSBXgdMrvRF6E7gdbRGDr+6FCq+LUKiyEHAI11pYz4l7r7KuvT04hdOW
 3ra5QSm8KyQ0g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 10/41] ASoC: SOF: Intel: hda-loader: Make sure
 that the fw load sequence is followed
Date: Thu, 14 Jul 2022 00:21:50 -0400
Message-Id: <20220714042221.281187-10-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714042221.281187-1-sashal@kernel.org>
References: <20220714042221.281187-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, tiwai@suse.com,
 yang.jie@linux.intel.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 daniel.baluta@nxp.com, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

[ Upstream commit c31691e0d126ec5d60d2b6b03f699c11b613b219 ]

The hda_dsp_enable_core() is powering up _and_ unstall the core in one
call while the first step of the firmware loading  must not unstall the
core.
The core can be unstalled only after the set cpb_cfp and the configuration
of the IPC register for the ROM_CONTROL message.

Complements: 2a68ff846164 ("ASoC: SOF: Intel: hda: Revisit IMR boot sequence")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/20220609085949.29062-3-peter.ujfalusi@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/intel/hda-loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 2ac5d9d0719b..9f624a84182b 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -112,7 +112,7 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag)
 	int ret;
 
 	/* step 1: power up corex */
-	ret = hda_dsp_enable_core(sdev, chip->host_managed_cores_mask);
+	ret = hda_dsp_core_power_up(sdev, chip->host_managed_cores_mask);
 	if (ret < 0) {
 		if (hda->boot_iteration == HDA_FW_BOOT_ATTEMPTS)
 			dev_err(sdev->dev, "error: dsp core 0/1 power up failed\n");
-- 
2.35.1

