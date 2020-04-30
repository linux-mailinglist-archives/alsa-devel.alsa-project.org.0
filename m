Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F581BFD0C
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 16:10:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E1601696;
	Thu, 30 Apr 2020 16:09:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E1601696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588255822;
	bh=t4pVoz7J8jkAn/McnyM5UibjHvcOHSChe4RvxUmvIPw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WFrhHDWwILl+dMQhaeWFwWkPUkVerXHu3hsE1GS+g8cQY3XCVmnjMqw96bDcYv/aP
	 EcMDTzGmiDQH18u0756OLO90uPS8G/2tflm6aO3hBTggSJlQ4cXqSFSK0gAzWYxJvO
	 QxNEA2hOv+dnfBxCsUtXsFFDsS+C/Nllk/Cyj5OM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0E46F803CF;
	Thu, 30 Apr 2020 15:53:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD155F803AE; Thu, 30 Apr 2020 15:53:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06778F801DB
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 15:52:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06778F801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="i1L6XItP"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 650C924962;
 Thu, 30 Apr 2020 13:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588254766;
 bh=t4pVoz7J8jkAn/McnyM5UibjHvcOHSChe4RvxUmvIPw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i1L6XItPMQGZH89D+v6QbeY1nfH0wyMvryGUwysLP/B97McMSDTa1fEutjt+Ila9L
 yOPej5OSjhQ36zq09htXXXGJioy4MugVn+571FryCSS61nJpHtWn1C+rq/CTrysm1y
 IG0gJZf9xFYGt3d710OHYqMbReluO+Lbmk5Hfdcw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 24/57] ASoC: SOF: Intel: add min/max channels for
 SSP on Baytrail/Broadwell
Date: Thu, 30 Apr 2020 09:51:45 -0400
Message-Id: <20200430135218.20372-24-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200430135218.20372-1-sashal@kernel.org>
References: <20200430135218.20372-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit 8c05246c0b58cbe80580ea4be05f6d51228af8a9 ]

Major regressions were detected by SOF CI on CherryTrail and Broadwell:

[   25.705750]  SSP2-Codec: ASoC: no backend playback stream
[   27.923378]  SSP2-Codec: ASoC: no users playback at close - state

This is root-caused to the introduction of the DAI capability checks
with snd_soc_dai_stream_valid(). Its use in soc-pcm.c makes it a
requirement for all DAIs to report at least a non-zero min_channels
field.

For some reason the SSP structures used for SKL+ did provide this
information but legacy platforms didn't.

Fixes: 9b5db059366ae2 ("ASoC: soc-pcm: dpcm: Only allow playback/capture if supported")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Link: https://lore.kernel.org/r/20200417172014.11760-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/intel/bdw.c | 16 +++++++++++++
 sound/soc/sof/intel/byt.c | 48 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 80e2826fb447b..8ede5fd0d0c0f 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -520,9 +520,25 @@ static int bdw_probe(struct snd_sof_dev *sdev)
 static struct snd_soc_dai_driver bdw_dai[] = {
 {
 	.name = "ssp0-port",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
 },
 {
 	.name = "ssp1-port",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
 },
 };
 
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 41008c974ac6c..cdffdc5d40759 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -366,21 +366,69 @@ static int byt_reset(struct snd_sof_dev *sdev)
 static struct snd_soc_dai_driver byt_dai[] = {
 {
 	.name = "ssp0-port",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
 },
 {
 	.name = "ssp1-port",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
 },
 {
 	.name = "ssp2-port",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 8,
+	}
 },
 {
 	.name = "ssp3-port",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
 },
 {
 	.name = "ssp4-port",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
 },
 {
 	.name = "ssp5-port",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
 },
 };
 
-- 
2.20.1

