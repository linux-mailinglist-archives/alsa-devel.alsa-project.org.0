Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC7524E197
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 21:59:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EE091695;
	Fri, 21 Aug 2020 21:58:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EE091695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598039986;
	bh=ZTSv1T6QTgQq+l9dndeGu/d0ok2KJ1gSygYekp0jztE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AqvwH5Kf+Tc4pqxq4027Ol0T2mmYvmafHwt9v6LyyFGF2W2xWfQWNE7hvks57yVrN
	 s5BZphJGZ/9LeFkvs3Ls9UEAhsg8pvuVzmZONdAoMpG14fAROq2884NOxuMDtySEFV
	 oZrOpoCZCmc8pr0O8EmJ7ZGfkPpgEHGsZzJb+yjg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87D3CF802C2;
	Fri, 21 Aug 2020 21:56:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59A12F802EB; Fri, 21 Aug 2020 21:56:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08391F8028F
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 21:56:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08391F8028F
IronPort-SDR: GzUK+DIh4CTZesq2jwDgGBj4p6dJVAlDpC6OLXt2H1gT3VMC0M1P/60Ge9WcF0pvaXslzzQfGL
 rftYG0OTIUag==
X-IronPort-AV: E=McAfee;i="6000,8403,9720"; a="217158553"
X-IronPort-AV: E=Sophos;i="5.76,338,1592895600"; d="scan'208";a="217158553"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 12:56:18 -0700
IronPort-SDR: 0FIvipkgQlh5AZy19ORNB2bq6pEszBYUGWckk8zyBV5KwH90Ps3N0qJz9orryjNeNF4JiVREU7
 W4Ga0vFAVxNA==
X-IronPort-AV: E=Sophos;i="5.76,338,1592895600"; d="scan'208";a="279002407"
Received: from pahnn-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.176.176])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 12:56:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/14] ASoC: Intel: tgl_max98373: fix a runtime pm issue in
 multi-thread case
Date: Fri, 21 Aug 2020 14:55:53 -0500
Message-Id: <20200821195603.215535-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821195603.215535-1-pierre-louis.bossart@linux.intel.com>
References: <20200821195603.215535-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, vinod.koul@intel.com, broonie@kernel.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

From: Rander Wang <rander.wang@intel.com>

When the playback & capture streams are stopped simultaneously, the
SOF PCI device will remain pm_runtime active. The root-cause is a race
condition with two threads reaching the trigger function at the same
time. They see another stream is active so the dapm pin is not
disabled, so the codec remains active as well as the parent PCI
device.

For max98373, the capture stream provides feedback when playback is
working and it is unused when playback is stopped. So the dapm pin
should be set only when playback is active.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_maxim_common.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index 1a6961592029..b6e63ea13d64 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -66,6 +66,10 @@ int max98373_trigger(struct snd_pcm_substream *substream, int cmd)
 	int j;
 	int ret = 0;
 
+	/* set spk pin by playback only */
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		return 0;
+
 	for_each_rtd_codec_dais(rtd, j, codec_dai) {
 		struct snd_soc_component *component = codec_dai->component;
 		struct snd_soc_dapm_context *dapm =
@@ -86,9 +90,6 @@ int max98373_trigger(struct snd_pcm_substream *substream, int cmd)
 		case SNDRV_PCM_TRIGGER_STOP:
 		case SNDRV_PCM_TRIGGER_SUSPEND:
 		case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-			/* Make sure no streams are active before disable pin */
-			if (snd_soc_dai_active(codec_dai) != 1)
-				break;
 			ret = snd_soc_dapm_disable_pin(dapm, pin_name);
 			if (!ret)
 				snd_soc_dapm_sync(dapm);
-- 
2.25.1

