Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5D537FC26
	for <lists+alsa-devel@lfdr.de>; Thu, 13 May 2021 19:10:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7F4117C4;
	Thu, 13 May 2021 19:10:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7F4117C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620925853;
	bh=/LJMrs4AEcpCtSOM9Raemz/RYh/TtTekUkjRXItzDsM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V4H90KA2FZUMeLUF6Or2aI3hKskFBYSMPXOd9OqFG+EZY7E/FOwgTbvhE/Y2sPbeS
	 +PLFCwRD3jWKwPmEIn11B7/jOz9OkGuxM2W8Fi/cmsyJpO1+GVroDwTmYY0Dr7HTvm
	 fRFvmgYzJRqICW7d3BHKErXebunEZh+TfmKz+M6A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41EB0F8016B;
	Thu, 13 May 2021 19:09:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA766F80163; Thu, 13 May 2021 19:09:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD9A9F8012E
 for <alsa-devel@alsa-project.org>; Thu, 13 May 2021 19:09:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD9A9F8012E
IronPort-SDR: BOj9bzOtJA+NjypVUy59ktefS0lOgEBwoXepiy24qewac4vhwczmuzxnxZEmktqDC7nVNPZpcv
 N8rrudZVrRDw==
X-IronPort-AV: E=McAfee;i="6200,9189,9983"; a="285503907"
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; d="scan'208";a="285503907"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 10:06:19 -0700
IronPort-SDR: wc9BUsTBU9jxrNcowe9TY+kQI9pi0S851rZ/WFg2lpXFrzmEAG2rAKvFniaLY6kdA4XOQi1e9E
 cWpHk74wjaCQ==
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; d="scan'208";a="623979024"
Received: from skitaji-mobl2.amr.corp.intel.com (HELO
 rsridh-mobl1.localdomain) ([10.212.29.159])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 10:06:18 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: Intel: hda: don't send DAI_CONFIG IPC for older
 firmware
Date: Thu, 13 May 2021 10:06:11 -0700
Message-Id: <20210513170611.348776-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, =broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Yong Zhi <yong.zhi@intel.com>
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

BE hw_params op was recently added for SSP type DAIs.
But sending the DAI_CONFIG IPC during hw_params
is not supported with older firmware. So add an ABI check
to avoid sending the IPC if the firmware ABI is older than
3.18.

Fixes: e12be9fbfb91 ('ASoC: SOF: Intel: HDA: add hw params callback for SSP DAIs')
Tested-by: Yong Zhi <yong.zhi@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 8d7bab433fb3..c1f9f0f58464 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -421,11 +421,16 @@ static int ssp_dai_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	struct sof_ipc_fw_version *v = &sdev->fw_ready.version;
 	struct sof_ipc_dai_config *config;
 	struct snd_sof_dai *sof_dai;
 	struct sof_ipc_reply reply;
 	int ret;
 
+	/* DAI_CONFIG IPC during hw_params is not supported in older firmware */
+	if (v->abi_version < SOF_ABI_VER(3, 18, 0))
+		return 0;
+
 	list_for_each_entry(sof_dai, &sdev->dai_list, list) {
 		if (!sof_dai->cpu_dai_name || !sof_dai->dai_config)
 			continue;
-- 
2.25.1

