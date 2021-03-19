Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9DD341D7D
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Mar 2021 13:56:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D478169B;
	Fri, 19 Mar 2021 13:55:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D478169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616158560;
	bh=gnsf+CpRg6hObe4PL12srMS3Nvc+83xRXBFRMgTghnY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OHZoYDPrlMXAFSRVtiWlko6Y2no8EmiV58GGgMmkP3FinMJ/Xg64UV+YXVWJKyFt5
	 VWk/CG/KanxCViyUTkLEkUX0gmHiXDp9udkymcsdybxZiMMBa0znVTgFRBzk2FxaCb
	 t7D83gsHBLNAXATr6cvOQ4Z+Ehm5uvbpponR9S68=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E87AF80257;
	Fri, 19 Mar 2021 13:54:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46E6FF8021C; Fri, 19 Mar 2021 13:54:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC41CF801F7
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 13:54:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC41CF801F7
IronPort-SDR: 5XrePCS+l6l0mBN5ZnSIUxDNvw51bLHMOxS0Zs1A3vfhrhj857RPdFP2PdiNOBpEZUjj6+Xp+c
 UIvuJgICresg==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="186540311"
X-IronPort-AV: E=Sophos;i="5.81,261,1610438400"; d="scan'208";a="186540311"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 05:53:56 -0700
IronPort-SDR: AlGCY1roMUyfJbgr6Ir8T1tVDKuuNiQZ2OmQuJnH3XwDA3XvPBUrmGLWZh4/dH+lPXGzXMgIBE
 /4fZxX0aub9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,261,1610438400"; d="scan'208";a="441307073"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Mar 2021 05:53:53 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 1/2] ASoC: SOF: add a helper to get topology configured mclk
Date: Fri, 19 Mar 2021 14:49:49 +0200
Message-Id: <20210319124950.3853994-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 cezary.rojewski@intel.com, kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 yung-chuan.liao@linux.intel.com, Keyon Jie <yang.jie@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 Daniel Baluta <daniel.baluta@gmail.com>, daniel.baluta@nxp.com
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

From: Keyon Jie <yang.jie@linux.intel.com>

Add helper sof_dai_ssp_mclk to get the topology configured MCLK from a
pcm_runtime, return 0 if it is not available, and error if the dai type
is not SSP at the moment.

Export the helper for external use, e.g. from machine drivers.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/sof.h       |  1 +
 sound/soc/sof/sof-audio.c | 27 +++++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index 646a655c3c6b..b93bb8038080 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -103,5 +103,6 @@ struct sof_dev_desc {
 int sof_nocodec_setup(struct device *dev, const struct snd_sof_dsp_ops *ops,
 		      int (*pcm_dai_link_fixup)(struct snd_soc_pcm_runtime *rtd,
 						struct snd_pcm_hw_params *params));
+int sof_dai_get_mclk(struct snd_soc_pcm_runtime *rtd);
 
 #endif
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 3277489fee5e..928d7a46d820 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -433,6 +433,33 @@ struct snd_sof_dai *snd_sof_find_dai(struct snd_soc_component *scomp,
 	return NULL;
 }
 
+/*
+ * Helper to get SSP MCLK from a pcm_runtime.
+ * Return 0 if not exist.
+ */
+int sof_dai_get_mclk(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *component =
+		snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
+	struct snd_sof_dai *dai =
+		snd_sof_find_dai(component, (char *)rtd->dai_link->name);
+
+	/* use the tplg configured mclk if existed */
+	if (!dai || !dai->dai_config)
+		return 0;
+
+	switch (dai->dai_config->type) {
+	case SOF_DAI_INTEL_SSP:
+		return dai->dai_config->ssp.mclk_rate;
+	default:
+		/* not yet implemented for platforms other than the above */
+		dev_err(rtd->dev, "mclk for dai_config->type %d not supported yet!\n",
+			dai->dai_config->type);
+		return -EINVAL;
+	}
+}
+EXPORT_SYMBOL(sof_dai_get_mclk);
+
 /*
  * SOF Driver enumeration.
  */

base-commit: bb9faeccbd6c05c6c2525be90f663f8694dd8bf6
-- 
2.29.2

