Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FC957427D
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 06:25:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2003017D3;
	Thu, 14 Jul 2022 06:24:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2003017D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657772704;
	bh=UpQ/PiWTfgffrul+4T3wofLjGERA+VhB84Fv6WEr838=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f3JiRIGabcjhZoLv9jA0fjIlZnuelELXd42q+tcs5u/4bwRkLt6MG+hkJpQkrKmMA
	 KnhHr324LR7dqAHKKhxnj5cbtj6vd8kOECi557UOV4J1Cs5MOtyk28wUqlI323Gj9Q
	 9NJnVsZFbem0333f6qCZVIdwgmvHvWzU2E8up2oc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BAC2F80570;
	Thu, 14 Jul 2022 06:22:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0F41F80568; Thu, 14 Jul 2022 06:22:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1ED6F80563;
 Thu, 14 Jul 2022 06:22:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1ED6F80563
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AF+qLsVY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8944261E98;
 Thu, 14 Jul 2022 04:22:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263A0C36AE2;
 Thu, 14 Jul 2022 04:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657772566;
 bh=UpQ/PiWTfgffrul+4T3wofLjGERA+VhB84Fv6WEr838=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AF+qLsVYO5U36JlcR9SornLMYDsaHT45SYmaLCM9wFg9416bUBV+VJpJiNIvn+HUZ
 8mDUlsySbH1Cw0EgkytlMFYhQfiDiLth90Rh8MiLbfUqYoJPvcvC7kLbISX/9aOUA7
 5wICy0BWGpRbT+BxokbK7sVUlN0KzExvxWnhGZNLYZFmWhnfpDOxADZ6JglYzhuuUb
 td2c9xKJf0nluRCLQQUlgJP7EXlg/RsOB8Tothp6M+3oRmRwT4Xzt7WCfl/uv8cJIq
 mOmyOOcRrpMx5l/LWvQ/hCLwR1WQcR51j5nVJ3rbu4JrEdQFyPFI/oCCtcoZM9A5lp
 HnA4bBig21emA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 09/41] ASoC: SOF: Intel: hda-dsp: Expose
 hda_dsp_core_power_up()
Date: Thu, 14 Jul 2022 00:21:49 -0400
Message-Id: <20220714042221.281187-9-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714042221.281187-1-sashal@kernel.org>
References: <20220714042221.281187-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, guennadi.liakhovetski@linux.intel.com,
 alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, tiwai@suse.com,
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

[ Upstream commit 08f8a93198e300dff9649bbae424cd805d313326 ]

The hda_dsp_core_power_up() needs to be exposed so that it can be used in
hda-loader.c to correct the boot flow.
The first step must not unstall the core, it should only power up the
core(s).

Add sanity check for the core_mask while exposing it to be safe.

Complements: 2a68ff846164 ("ASoC: SOF: Intel: hda: Revisit IMR boot sequence")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/20220609085949.29062-2-peter.ujfalusi@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/intel/hda-dsp.c | 10 +++++++++-
 sound/soc/sof/intel/hda.h     |  1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 8ddde60c56b3..68a8074c956a 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -181,12 +181,20 @@ int hda_dsp_core_run(struct snd_sof_dev *sdev, unsigned int core_mask)
  * Power Management.
  */
 
-static int hda_dsp_core_power_up(struct snd_sof_dev *sdev, unsigned int core_mask)
+int hda_dsp_core_power_up(struct snd_sof_dev *sdev, unsigned int core_mask)
 {
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+	const struct sof_intel_dsp_desc *chip = hda->desc;
 	unsigned int cpa;
 	u32 adspcs;
 	int ret;
 
+	/* restrict core_mask to host managed cores mask */
+	core_mask &= chip->host_managed_cores_mask;
+	/* return if core_mask is not valid */
+	if (!core_mask)
+		return 0;
+
 	/* update bits */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, HDA_DSP_REG_ADSPCS,
 				HDA_DSP_ADSPCS_SPA_MASK(core_mask),
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 05e5e158614a..b80fa5c77cf7 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -490,6 +490,7 @@ struct sof_intel_hda_stream {
  */
 int hda_dsp_probe(struct snd_sof_dev *sdev);
 int hda_dsp_remove(struct snd_sof_dev *sdev);
+int hda_dsp_core_power_up(struct snd_sof_dev *sdev, unsigned int core_mask);
 int hda_dsp_core_run(struct snd_sof_dev *sdev, unsigned int core_mask);
 int hda_dsp_enable_core(struct snd_sof_dev *sdev, unsigned int core_mask);
 int hda_dsp_core_reset_power_down(struct snd_sof_dev *sdev,
-- 
2.35.1

