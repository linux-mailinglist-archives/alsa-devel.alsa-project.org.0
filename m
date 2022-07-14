Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D023C57439E
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 06:37:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C0BF1939;
	Thu, 14 Jul 2022 06:36:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C0BF1939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657773435;
	bh=usq1USsPcREg76HCj1sGznaYjx2GHtOqnMyOyEcvLbo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PuuVCA6rWHgjVaqdjW9tiSeHOw7KH0eHovVKSdc9wfoE69GON11TjowuAtXcwRyPv
	 iTezsCojJ7uLaIKXQFhR89QXqA0A07xxnzEqiLEmkSfMFneGWNiiGHhOAz4EYkfypE
	 WDCid5aA0AX5ZiU2zdket+q07OWPIdMfWuA9mq78=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75B35F80688;
	Thu, 14 Jul 2022 06:25:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C6E2F80688; Thu, 14 Jul 2022 06:25:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 975F0F80687;
 Thu, 14 Jul 2022 06:25:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 975F0F80687
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Dm0u6oCi"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7CD9161EC4;
 Thu, 14 Jul 2022 04:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 549E6C34115;
 Thu, 14 Jul 2022 04:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657772748;
 bh=usq1USsPcREg76HCj1sGznaYjx2GHtOqnMyOyEcvLbo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dm0u6oCifGwphEOxZt/i1LNfAOvXtNolS6VHCSaggaXawqaqqOO+IK4Wz7zHam82Q
 YXBC+RfH0ocGFIbQ9Ev3uMk7UFBI+Cb4lEM4wSyjmieuYcz1rbPcWhOCo8H/LkpwMr
 J2hkeW5dGD1UToHTLoYS8b7gZjhBmc6Ukk7iXjbMmQ1c3CAA8F5Cj0AzLsLqceGHCL
 iR5higbIh1v0F+gJgePX8BztURmY5rUm2snXCULo2KAdz6t6Gr8MzyJ4ZxBhSO/0U5
 tstqClPF9qF/4x1p4e0jhPcjR8o3nTL6q6/plMw5oR802FgIYUwsyc2FisE6PPhWd2
 wZF6uq6bou2Mw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 03/15] ASoC: SOF: Intel: hda-loader: Clarify the
 cl_dsp_init() flow
Date: Thu, 14 Jul 2022 00:25:28 -0400
Message-Id: <20220714042541.282175-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714042541.282175-1-sashal@kernel.org>
References: <20220714042541.282175-1-sashal@kernel.org>
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

[ Upstream commit bbfef046c6613404c01aeb9e9928bebb78dd327a ]

Update the comment for the cl_dsp_init() to clarify what is done by the
function and use the chip->init_core_mask instead of BIT(0) when
unstalling/running the init core.

Complements: 2a68ff846164 ("ASoC: SOF: Intel: hda: Revisit IMR boot sequence")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/20220609085949.29062-4-peter.ujfalusi@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/intel/hda-loader.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 347636a80b48..4012097a9d60 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -79,9 +79,9 @@ static struct hdac_ext_stream *cl_stream_prepare(struct snd_sof_dev *sdev, unsig
 }
 
 /*
- * first boot sequence has some extra steps. core 0 waits for power
- * status on core 1, so power up core 1 also momentarily, keep it in
- * reset/stall and then turn it off
+ * first boot sequence has some extra steps.
+ * power on all host managed cores and only unstall/run the boot core to boot the
+ * DSP then turn off all non boot cores (if any) is powered on.
  */
 static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag)
 {
@@ -115,7 +115,7 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag)
 			  ((stream_tag - 1) << 9)));
 
 	/* step 3: unset core 0 reset state & unstall/run core 0 */
-	ret = hda_dsp_core_run(sdev, BIT(0));
+	ret = hda_dsp_core_run(sdev, chip->init_core_mask);
 	if (ret < 0) {
 		if (hda->boot_iteration == HDA_FW_BOOT_ATTEMPTS)
 			dev_err(sdev->dev,
-- 
2.35.1

