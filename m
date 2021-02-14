Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA1931B2F6
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Feb 2021 23:09:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1EF51686;
	Sun, 14 Feb 2021 23:08:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1EF51686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613340574;
	bh=gS5vC2Wn8HoIhZ3ulmYWyWvPqdophGjmHgBua4w5/EU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MWkyqvgJn37q9AoLPqmBb4MCI5159gl+vxApjjenG9hhJzVVueK1niFEI1YJ5hTe5
	 7t+0i0dHSjL9XK1UrrMk8PylrAvGoc2f9SYHQ3JK2uJNio5/Znb6tM2HsTY16uEPh7
	 hpAWjdv1J67zz7R+be8QHH0FARtuMgOK6rMjFsFU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A425F8015A;
	Sun, 14 Feb 2021 23:08:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DF65F80155; Sun, 14 Feb 2021 23:07:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A5D4F800B2
 for <alsa-devel@alsa-project.org>; Sun, 14 Feb 2021 23:07:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A5D4F800B2
IronPort-SDR: BUbZ9HBphsKkCaNLz5raShW2qzJ2E4Cb995BvYFZUxZs/f9kb8qeuA9OQIhrs8RcRxMNn8ckJQ
 +8RDpday8pig==
X-IronPort-AV: E=McAfee;i="6000,8403,9895"; a="179098923"
X-IronPort-AV: E=Sophos;i="5.81,179,1610438400"; d="scan'208";a="179098923"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2021 14:07:45 -0800
IronPort-SDR: mzlMOEDKXl/WMcqYTZkzX4Ed5Qbb55iHtNQ/sEdOxFWtda2dmuCWa92wEzogJQl7v6UcnEBKNa
 UpPqAtshoRHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,179,1610438400"; d="scan'208";a="400448274"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga007.jf.intel.com with ESMTP; 14 Feb 2021 14:07:42 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org,
 kuninori.morimoto.gx@renesas.com
Subject: [PATCH] ASoC: soc-pcm: fix hwparams min/max init for dpcm
Date: Mon, 15 Feb 2021 00:04:14 +0200
Message-Id: <20210214220414.2876690-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

When runtime is initialized with dpcm_init_runtime_hw(), some of the
min/max calculations assume that defaults are set. For example
calculation of channel min/max values may be done using zero-initialized
data and soc_pcm_hw_update_chan() will always return max-channels of 0
in this case. This will result in failure to open the PCM at all.

Fix the issue by calling soc_pcm_hw_init() before calling any
soc_pcm_hw_update_*() functions.

Remove the conditional code on runtime->hw.formats as this field
is anyways set in soc_pcm_hw_init().

Fixes: 6cb56a4549e9 ("ASoC: soc-pcm: add soc_pcm_hw_update_chan()")
Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/soc-pcm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

Notes:
 - This fixes regressions caught by SOF CI. Matching SOF CI test 
   run with this patch applied is at:
   https://github.com/thesofproject/linux/pull/2756

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index b7c90da1820e..37094aeff440 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1531,12 +1531,10 @@ static void dpcm_init_runtime_hw(struct snd_pcm_runtime *runtime,
 {
 	struct snd_pcm_hardware *hw = &runtime->hw;
 
+	soc_pcm_hw_init(hw);
 	soc_pcm_hw_update_rate(hw, stream);
 	soc_pcm_hw_update_chan(hw, stream);
-	if (runtime->hw.formats)
-		runtime->hw.formats &= stream->formats;
-	else
-		runtime->hw.formats = stream->formats;
+	soc_pcm_hw_update_format(hw, stream);
 }
 
 static void dpcm_runtime_merge_format(struct snd_pcm_substream *substream,

base-commit: debc71f26cdbd45798c63b0dcdabdea93d2f6870
-- 
2.29.2

