Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F653F750E
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Aug 2021 14:27:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BEBD167B;
	Wed, 25 Aug 2021 14:26:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BEBD167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629894462;
	bh=x4TAbr4Apk/csJADeb3B0Tyjokuptxyh/hWJj31Gchk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Jl6chEJZhbBXMq1xwbNFMb8PyPfnZv3//Hc1i9nzPt0k+Oi41esHL69SkYDupCxSQ
	 g0zY30QY8U9/+7CHV+vVsRuHuHPq2/tf1kp5YjS4ce4jAm4+yG4sufpHbmrR0eSa7z
	 fb+lFYFNfrNdYNbSKry8gaYEMBnn1La6IgeBiYGw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBD38F8020D;
	Wed, 25 Aug 2021 14:26:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5130EF8020C; Wed, 25 Aug 2021 14:26:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F212F8003C
 for <alsa-devel@alsa-project.org>; Wed, 25 Aug 2021 14:25:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F212F8003C
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="217545129"
X-IronPort-AV: E=Sophos;i="5.84,350,1620716400"; d="scan'208";a="217545129"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 05:25:26 -0700
X-IronPort-AV: E=Sophos;i="5.84,350,1620716400"; d="scan'208";a="527240304"
Received: from pujfalus-mobl.ger.corp.intel.com (HELO
 peter-virtualbox.ger.corp.intel.com) ([10.251.213.10])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 05:25:24 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: broonie@kernel.org, liam.r.girdwood@linux.intel.com, hdegoede@redhat.com,
 cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 yang.jie@linux.intel.com
Subject: [PATCH] ASoC: Intel: bytcr_rt5640: Make
 rt5640_jack_gpio/rt5640_jack2_gpio static
Date: Wed, 25 Aug 2021 15:25:19 +0300
Message-Id: <20210825122519.3364-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

Marking the two jack gpio as static fixes the following Sparse errors:
sound/soc/intel/boards/bytcr_rt5640.c:468:26: error: symbol 'rt5640_jack_gpio' was not declared. Should it be static?
sound/soc/intel/boards/bytcr_rt5640.c:475:26: error: symbol 'rt5640_jack2_gpio' was not declared. Should it be static?

Fixes: 9ba00856686ad ("ASoC: Intel: bytcr_rt5640: Add support for HP Elite Pad 1000G2 jack-detect")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 05667a33d919..a6e837290c7d 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -465,14 +465,14 @@ static struct snd_soc_jack_pin rt5640_pins2[] = {
 	},
 };
 
-struct snd_soc_jack_gpio rt5640_jack_gpio = {
+static struct snd_soc_jack_gpio rt5640_jack_gpio = {
 	.name = "hp-detect",
 	.report = SND_JACK_HEADSET,
 	.invert = true,
 	.debounce_time = 200,
 };
 
-struct snd_soc_jack_gpio rt5640_jack2_gpio = {
+static struct snd_soc_jack_gpio rt5640_jack2_gpio = {
 	.name = "hp2-detect",
 	.report = SND_JACK_HEADSET,
 	.invert = true,
-- 
2.33.0

