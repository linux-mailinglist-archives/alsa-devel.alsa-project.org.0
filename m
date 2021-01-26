Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45549303184
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jan 2021 02:54:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB1B517B7;
	Tue, 26 Jan 2021 02:53:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB1B517B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611626052;
	bh=Upu5JtGBTPIu8a8Nvf/B7wsdHgSfV0tYiyfRuHdsiL0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EoBzBKmxIqdHLrSJWmNrbV5cg3l/L+KZeTgLM2MzVAMfdSLJgBGwfB1dStxiF3vzN
	 HXSvd/WROEMI2f+MwMZA3Fsas54vBv3GbxQWnPncckLIfg3W7uKal5TgUJcy99qGRz
	 CN6bopVfAHoOQTjlTSk9seOlf3fjiI3xvy4YY/hM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17A87F804C2;
	Tue, 26 Jan 2021 02:51:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF97BF80260; Tue, 26 Jan 2021 02:51:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DB24F80130
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 02:51:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DB24F80130
IronPort-SDR: Pr37ADQXJEtk9HtofT3wVRvw8WoAHVKlZyY8F9/Z+5w4HgpL2Keo1h6AiaECDRMlVvxChnEuuE
 k98nLh/ia2qA==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="159610096"
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="159610096"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 17:51:39 -0800
IronPort-SDR: PsuMSi6nHuF40t+aNcAemAanN1HPD3WZJ/BeV6YNQTIYopTQLcGn4Z3bKcg5mOI6G/SnvFEtdp
 JSumL4N986iA==
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="356564916"
Received: from sugatabx-mobl.amr.corp.intel.com (HELO
 rsridh-mobl1.localdomain) ([10.212.73.120])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 17:51:39 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: SOF: Intel: hda: Enable DMI L1 for trace
Date: Mon, 25 Jan 2021 17:51:30 -0800
Message-Id: <20210126015130.1023840-3-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210126015130.1023840-1-ranjani.sridharan@linux.intel.com>
References: <20210126015130.1023840-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, tiwai@suse.com,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

Enabling DMI L1 for capture streams could result in xruns during
pause/release. As pause/release is not a valid scenario for trace,
we can safely enable DMI L1 for it.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-trace.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-trace.c b/sound/soc/sof/intel/hda-trace.c
index ca869038e909..81d76d3debc6 100644
--- a/sound/soc/sof/intel/hda-trace.c
+++ b/sound/soc/sof/intel/hda-trace.c
@@ -42,7 +42,8 @@ int hda_dsp_trace_init(struct snd_sof_dev *sdev, u32 *stream_tag)
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	int ret;
 
-	hda->dtrace_stream = hda_dsp_stream_get(sdev, SNDRV_PCM_STREAM_CAPTURE, 0);
+	hda->dtrace_stream = hda_dsp_stream_get(sdev, SNDRV_PCM_STREAM_CAPTURE,
+						SOF_HDA_STREAM_DMI_L1_COMPATIBLE);
 
 	if (!hda->dtrace_stream) {
 		dev_err(sdev->dev,
-- 
2.25.1

