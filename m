Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D57886E6
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Aug 2019 01:27:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 181EC15E5;
	Sat, 10 Aug 2019 01:26:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 181EC15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565393225;
	bh=r9eUCgsg+XnMEo99TIJzys68ij+OeQGZvBNPUbRDlDA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y7YL3DJqDPV7zV/rbyXKWFMHebJeOfwAsjpCIK2st305ITDQGWKCoMs3eSGMcp1bM
	 5YQNGxwLkYis8/21TpWHNig/vbskcOUhiT/yrrL3SYUwTq1YMx+5JLiJZtfogv7jk8
	 z17tI9dcC1IF0D+BdCSs+uAwKdU6BXI+kE8nvmn4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 033EAF805FE;
	Sat, 10 Aug 2019 01:22:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D86F4F805E1; Sat, 10 Aug 2019 01:22:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4469DF804AB
 for <alsa-devel@alsa-project.org>; Sat, 10 Aug 2019 01:22:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4469DF804AB
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Aug 2019 16:22:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,367,1559545200"; d="scan'208";a="177770349"
Received: from jpfeiff1-mobl6.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.128.143])
 by orsmga003.jf.intel.com with ESMTP; 09 Aug 2019 16:22:41 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri,  9 Aug 2019 18:22:36 -0500
Message-Id: <20190809232236.21182-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809232236.21182-1-pierre-louis.bossart@linux.intel.com>
References: <20190809232236.21182-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 4/4] ASoC: Intel: skl-hda-dsp-generic: add dmic
	dapm widget and route
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Keyon Jie <yang.jie@linux.intel.com>

Adding DAPM MIC endpoint widget "SoC DMIC" and route, to enable
DMIC DAPM support with hda generic machine.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/skl_hda_dsp_generic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index 9ed68eb4f058..1778acdc367c 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -23,6 +23,7 @@ static const struct snd_soc_dapm_widget skl_hda_widgets[] = {
 	SND_SOC_DAPM_MIC("Alt Analog In", NULL),
 	SND_SOC_DAPM_SPK("Digital Out", NULL),
 	SND_SOC_DAPM_MIC("Digital In", NULL),
+	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
 };
 
 static const struct snd_soc_dapm_route skl_hda_map[] = {
@@ -41,6 +42,9 @@ static const struct snd_soc_dapm_route skl_hda_map[] = {
 	{ "Codec Input Pin2", NULL, "Digital In" },
 	{ "Codec Input Pin3", NULL, "Alt Analog In" },
 
+	/* digital mics */
+	{"DMic", NULL, "SoC DMIC"},
+
 	/* CODEC BE connections */
 	{ "Analog Codec Playback", NULL, "Analog CPU Playback" },
 	{ "Analog CPU Playback", NULL, "codec0_out" },
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
