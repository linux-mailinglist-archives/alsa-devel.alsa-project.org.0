Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9172829BE
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Oct 2020 11:09:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F9A7188B;
	Sun,  4 Oct 2020 11:08:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F9A7188B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601802567;
	bh=+wrU11esNujj2XQWiIO2JybAQAVOJ73SH/FtBUSFn2o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mWItyQsfkCcPWaAlL43/Bs6sDne2QIXlIjTJppGxetM4fITWAd1aoo5VEAN6UbRV4
	 Q2rPuXBZ6iEYA7uMp7sRNLk5MU7v4HgHK6tZhmGUYpxLwzZTi4HWdHfTsgSFnvcz3J
	 sljwjYDRugAlfZV6QJnaE0Ikn5zNlfgHJPYPSbkg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 883C8F80246;
	Sun,  4 Oct 2020 11:07:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F41FF80121; Sun,  4 Oct 2020 11:07:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A828F80121
 for <alsa-devel@alsa-project.org>; Sun,  4 Oct 2020 11:06:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A828F80121
IronPort-SDR: +F5Yr5BRZ/BJw24QPnsVkKCmPtoexTUwHji7aDMulLBb6tumYVlAB4S+EvlVIOON6dc9RJG4bs
 CHgraKERZZQg==
X-IronPort-AV: E=McAfee;i="6000,8403,9763"; a="151060524"
X-IronPort-AV: E=Sophos;i="5.77,335,1596524400"; d="scan'208";a="151060524"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2020 02:06:43 -0700
IronPort-SDR: 0jej1fLzuK8Dxz9QRFV+K79HCvFYPJZ61+kPsT+F9r8ich/Evw1HxChPNA12Ffd39l+P6aBIQj
 81TK2uQWqm5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,335,1596524400"; d="scan'208";a="340518149"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 04 Oct 2020 02:06:42 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/4] ASoC: Intel: broadwell: Mark FE DAIs as nonatomic
Date: Sun,  4 Oct 2020 11:06:08 +0200
Message-Id: <20201004090609.29066-3-cezary.rojewski@intel.com>
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
 sound/soc/intel/boards/broadwell.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/intel/boards/broadwell.c b/sound/soc/intel/boards/broadwell.c
index 648b47190051..77c85f17aca6 100644
--- a/sound/soc/intel/boards/broadwell.c
+++ b/sound/soc/intel/boards/broadwell.c
@@ -174,6 +174,7 @@ static struct snd_soc_dai_link broadwell_rt286_dais[] = {
 	{
 		.name = "System PCM",
 		.stream_name = "System Playback/Capture",
+		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.ops = &broadwell_fe_ops,
@@ -184,6 +185,7 @@ static struct snd_soc_dai_link broadwell_rt286_dais[] = {
 	{
 		.name = "Offload0",
 		.stream_name = "Offload0 Playback",
+		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dpcm_playback = 1,
@@ -192,6 +194,7 @@ static struct snd_soc_dai_link broadwell_rt286_dais[] = {
 	{
 		.name = "Offload1",
 		.stream_name = "Offload1 Playback",
+		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dpcm_playback = 1,
@@ -200,6 +203,7 @@ static struct snd_soc_dai_link broadwell_rt286_dais[] = {
 	{
 		.name = "Loopback PCM",
 		.stream_name = "Loopback",
+		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dpcm_capture = 1,
-- 
2.17.1

