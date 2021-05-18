Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9B2387E9D
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 19:43:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E46A8176C;
	Tue, 18 May 2021 19:42:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E46A8176C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621359792;
	bh=/LJMrs4AEcpCtSOM9Raemz/RYh/TtTekUkjRXItzDsM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=grOza0769tXkkX3Eql2G8UOIg9piNCofFiypgfN6YO8YEG6gQSr7y08RlnqDibu9i
	 7hefVCF9UGgXvsgakJVczCQWYRdM+fpnCttK4lPkYeUQEzaNbX8nozjZsmd35OZgyT
	 D5S+Cu8VTDEJKtG0m9FEozlftiRRJ9farhPgDbaY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 369C6F80139;
	Tue, 18 May 2021 19:41:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABAF4F80217; Tue, 18 May 2021 19:41:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA7B0F80139
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 19:41:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA7B0F80139
IronPort-SDR: JBCCTNp3SETc6eEL/eYCuIcA4S0lnJkD/87orb44G7Lk/PZ6aRiPamMU4yEfQ1A/HOHxdMfAB9
 orUqjvgDBi3Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="221831873"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="221831873"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 10:41:25 -0700
IronPort-SDR: fSIILffsOZ4rq5ju9yA/tZF5znRwRQgYv+C0aVBWAe/AlUBpHtbqMIpAdfJYDT3bPpJ/oYGdP4
 AR8bmCnzYKLA==
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="394052287"
Received: from dmallapu-mobl1.amr.corp.intel.com (HELO
 rsridh-mobl1.localdomain) ([10.212.20.100])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 10:41:25 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: Intel: hda: don't send DAI_CONFIG IPC for older
 firmware
Date: Tue, 18 May 2021 10:41:21 -0700
Message-Id: <20210518174121.151601-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
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

