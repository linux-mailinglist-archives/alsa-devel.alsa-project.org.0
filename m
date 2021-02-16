Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EFA31CEF9
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Feb 2021 18:28:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41CB1823;
	Tue, 16 Feb 2021 18:27:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41CB1823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613496492;
	bh=kXGwd/cEZ9PPyDr8DW9gjBOqzzT5zYbi+0KrZR9seY0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RDIHb2MMckp+HhXQwrrQHTPl1GYoXR0yEbqZhdRjF0SeOfkRlehocAhS4xtQcxqKr
	 n7In+e0LFnldq26RaynuaD7Vqgedn/t3BNC4fdG9bVJbPz18QwLYNj3Oqm2m4bxl03
	 cIGV7pVPPQuhuhjkasXFzQxDXFBgjmcPo24OitMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31E23F80059;
	Tue, 16 Feb 2021 18:26:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4D72F8015A; Tue, 16 Feb 2021 18:26:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EC99F80059
 for <alsa-devel@alsa-project.org>; Tue, 16 Feb 2021 18:26:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EC99F80059
IronPort-SDR: gsD+x7hViUQ/XJKvAOYbv03/GKQURNOnwRzah035VtNMu32L92HrlHa6E4tKgnEJGEpVe0MMI5
 B4WrV4obUgrg==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="247021883"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="247021883"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 09:26:25 -0800
IronPort-SDR: yHZFhroZlUMsplkqzacA350k6yChUup7ev16vHaAGEjavTsQ6mcXR4jfwMi+Y8hx/XXRA1IvDa
 pKR+QTI3otgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="399591396"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga008.jf.intel.com with ESMTP; 16 Feb 2021 09:26:21 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org,
 kuninori.morimoto.gx@renesas.com
Subject: [PATCH v2] ASoC: soc-pcm: fix hw param limits calculation for
 multi-DAI
Date: Tue, 16 Feb 2021 19:22:51 +0200
Message-Id: <20210216172251.3023723-1-kai.vehmanen@linux.intel.com>
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

In case DPCM runtime has multiple CPU DAIs, dpcm_init_runtime_hw() is
called multiple times, once for each CPU DAI. This will lead to
ignoring hw limits of all but the last DAI.

Fix this by moving soc_pcm_hw_init() up by one level to
dpcm_init_runtime_hw().

Fixes: 140f553d1298 ("ASoC: soc-pcm: fix hwparams min/max init for dpcm")
Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/soc-pcm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

v2 changes:
 - fixed incorrect text in commit message, no functional change

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 37094aeff440..14d85ca1e435 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1531,10 +1531,12 @@ static void dpcm_init_runtime_hw(struct snd_pcm_runtime *runtime,
 {
 	struct snd_pcm_hardware *hw = &runtime->hw;
 
-	soc_pcm_hw_init(hw);
 	soc_pcm_hw_update_rate(hw, stream);
 	soc_pcm_hw_update_chan(hw, stream);
-	soc_pcm_hw_update_format(hw, stream);
+	if (runtime->hw.formats)
+		runtime->hw.formats &= stream->formats;
+	else
+		runtime->hw.formats = stream->formats;
 }
 
 static void dpcm_runtime_merge_format(struct snd_pcm_substream *substream,
@@ -1662,10 +1664,13 @@ static void dpcm_runtime_merge_rate(struct snd_pcm_substream *substream,
 static void dpcm_set_fe_runtime(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_pcm_hardware *hw = &runtime->hw;
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai;
 	int i;
 
+	soc_pcm_hw_init(hw);
+
 	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 		/*
 		 * Skip CPUs which don't support the current stream

base-commit: 140f553d1298e0ddbe21983efe5789fe8b484273
-- 
2.29.2

