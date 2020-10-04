Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBE02829C0
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Oct 2020 11:10:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0051418C5;
	Sun,  4 Oct 2020 11:09:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0051418C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601802623;
	bh=8I5JjAmmZKKhMqlVIrbMPqVgUkrq6Lzk16rbJ01MhkQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WRdfCVrA2K5Vun1396mdQHOh20jaEPVErA4Blem4WK3A13VqHUdgjqoprQmRZmDiK
	 Zo6rVmQEmDpHHut/ijidgMHh5Vd2yM0Enw2ijmOxgcIHqXzdpVUdQpaa2H3nioCO0+
	 146Zh6GkBPQjErph8k5Sw6ve5mcj+wo8BPidB1V4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 251CAF802E9;
	Sun,  4 Oct 2020 11:07:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 781E3F802DF; Sun,  4 Oct 2020 11:07:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D649BF80268
 for <alsa-devel@alsa-project.org>; Sun,  4 Oct 2020 11:06:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D649BF80268
IronPort-SDR: +zkZgFZZviQwQ2IfoxGM2mZlnLe7O+knNEULHmjeS44SAvpkNAPqPygg+Xr7jq2ULSHtMlkHSu
 LSK1B6d3uxIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9763"; a="151060526"
X-IronPort-AV: E=Sophos;i="5.77,335,1596524400"; d="scan'208";a="151060526"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2020 02:06:45 -0700
IronPort-SDR: oo3eoinwS8SZ9Q72FtkbSENgNH06tK2k7cknguU+Akf9Ev7exyZ1gkjqbhiu+wYyS6IzFy6KH0
 GEH84hCMFeSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,335,1596524400"; d="scan'208";a="340518154"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 04 Oct 2020 02:06:43 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ASoC: Intel: haswell: Mark FE DAIs as nonatomic
Date: Sun,  4 Oct 2020 11:06:09 +0200
Message-Id: <20201004090609.29066-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201004090609.29066-1-cezary.rojewski@intel.com>
References: <20201004090609.29066-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
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

PCM operations for DAI links connected with DSP platform component
involve communication with DSP firmware by IPCs. As IPC protocol may
cause thread to sleep while waiting for a response from DSP, propagate
that information to ALSA core by marking all FE DAIs as nonatomic.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/boards/haswell.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/intel/boards/haswell.c b/sound/soc/intel/boards/haswell.c
index c268405e5594..c55d1239e705 100644
--- a/sound/soc/intel/boards/haswell.c
+++ b/sound/soc/intel/boards/haswell.c
@@ -103,6 +103,7 @@ static struct snd_soc_dai_link haswell_rt5640_dais[] = {
 	{
 		.name = "System",
 		.stream_name = "System Playback/Capture",
+		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dpcm_playback = 1,
@@ -112,6 +113,7 @@ static struct snd_soc_dai_link haswell_rt5640_dais[] = {
 	{
 		.name = "Offload0",
 		.stream_name = "Offload0 Playback",
+		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dpcm_playback = 1,
@@ -120,6 +122,7 @@ static struct snd_soc_dai_link haswell_rt5640_dais[] = {
 	{
 		.name = "Offload1",
 		.stream_name = "Offload1 Playback",
+		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dpcm_playback = 1,
@@ -128,6 +131,7 @@ static struct snd_soc_dai_link haswell_rt5640_dais[] = {
 	{
 		.name = "Loopback",
 		.stream_name = "Loopback",
+		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dpcm_capture = 1,
-- 
2.17.1

