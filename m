Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2ECC2179EC
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 23:01:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0ABD16A3;
	Tue,  7 Jul 2020 23:00:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0ABD16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594155688;
	bh=mAfiToesfvz341cKew5cRW/EzL/9sziRc3jjcSBvbuQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FjyvJ/YhTDXVLUpPqOGaIrJMdCrCJrsFium6jp8QIQQwIJusc561OgucTAdYbSRVP
	 IXevzuFU/rSpX5fsfcFzfJDKoixWcoHheLIjzcuzVewrE+5iMuzOp3SWtzUgc06CS8
	 NpwgICLMhOoD2ojcARQgvXjCyNYrbYptlEhrFVek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69358F802DF;
	Tue,  7 Jul 2020 22:58:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BF00F80257; Tue,  7 Jul 2020 22:58:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4748F80257
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 22:57:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4748F80257
IronPort-SDR: sLeDv9H3ydYK7BcJg0YUGVzRkq4Hne9tvizSh6aG92IXapLp6hbfoUQkg5bCPpMmybRrnoH3iL
 KIRk4IA6mHuw==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="146762916"
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="146762916"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 13:57:53 -0700
IronPort-SDR: 30qYnOwhP6jGrnxAPwtv8k4s082mRVv9MoQOdZWf1FPB3T8kQc5HKX/+OQBau/C4p6lQWGmzlr
 wl9kvHd99wuQ==
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="305796646"
Received: from colvinch-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.229.3])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 13:57:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 3/6] ASoc: codecs: max98373: remove Idle_bias_on to let
 codec suspend
Date: Tue,  7 Jul 2020 15:57:37 -0500
Message-Id: <20200707205740.114927-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707205740.114927-1-pierre-louis.bossart@linux.intel.com>
References: <20200707205740.114927-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ryan Lee <ryans.lee@maximintegrated.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, randerwang <rander.wang@linux.intel.com>
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

From: randerwang <rander.wang@linux.intel.com>

Idle_bias_on is used to decide bias on/off in standby state by dapm.
When Idle_bias_on is set to one, dapm will keep max98373 active at
idle time. Max98373 is doing nothing in this state, so remove
idle_bias_on setting to let max98373 get suspended when it is idle.

Reviewed-by: Ryan Lee <ryans.lee@maximintegrated.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: randerwang <rander.wang@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/max98373.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/max98373.c b/sound/soc/codecs/max98373.c
index c3202c1dc517..bf5572fc4f66 100644
--- a/sound/soc/codecs/max98373.c
+++ b/sound/soc/codecs/max98373.c
@@ -390,7 +390,6 @@ const struct snd_soc_component_driver soc_codec_dev_max98373 = {
 	.num_dapm_widgets	= ARRAY_SIZE(max98373_dapm_widgets),
 	.dapm_routes		= max98373_audio_map,
 	.num_dapm_routes	= ARRAY_SIZE(max98373_audio_map),
-	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
 	.non_legacy_dai_naming	= 1,
-- 
2.25.1

