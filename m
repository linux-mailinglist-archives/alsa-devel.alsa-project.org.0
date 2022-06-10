Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7C45466AD
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 14:31:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 244F61F4F;
	Fri, 10 Jun 2022 14:30:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 244F61F4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654864267;
	bh=lw5cL6KYoePrz5pxkB4ij9kUl2kncOnWIdeNSEbJmKc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PNZT66DzlR6HgulUUOJaLP2epDLc+KYVkedE9SY8+XhTAugbe7XIsDIvtUPpQdkkC
	 62NwdD9NUbIV3WY2OBAjJ2u0adH1C5kustnqEih6kD8cH6NuudrCR1yBKVFXiOgiut
	 WFrDtmfqjTxZCg7ZzsE7XtCZqkxQW8rfU3GwvMS8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6985BF805B3;
	Fri, 10 Jun 2022 14:26:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2ECBAF805B3; Fri, 10 Jun 2022 14:26:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD0BFF8057B
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 14:26:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD0BFF8057B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XOjJBXHB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654863999; x=1686399999;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lw5cL6KYoePrz5pxkB4ij9kUl2kncOnWIdeNSEbJmKc=;
 b=XOjJBXHBv68JvFBld5hMsrK/1l1v7M05b9R44tSaJbZBupiviws1vSAG
 sxlu1DyAIUBkDtnVejJe7CncZndek28PoB1zJ88kngDqxY5SrLrlzwCw3
 s+yZPnwACG/zx2UzS/pyJ1l3qDMlZV2V+Bxat26iyPGWHr+fsoPH9h2tE
 hw8wIcJgQJWX6qPd95R9VKyEUvCVKQfh3RffWKwFxcKk7vcuIUpRgJlFh
 HektNHBCI1rBfWQkc9HOuGqvCBlU0NyY//bU4Cz4522dN2jixu0muxLAF
 MgVnlSDcZP03mWR4ZMUcZcxHvshN21C0rkh9f23Xo5sVvuTQWFvM/5n96 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="278414488"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="278414488"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 05:26:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="684517945"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga002.fm.intel.com with ESMTP; 10 Jun 2022 05:26:36 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 15/17] ASoC: Intel: bdw_rt286: Improve codec_init() quality
Date: Fri, 10 Jun 2022 14:36:25 +0200
Message-Id: <20220610123627.1339985-16-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610123627.1339985-1-cezary.rojewski@intel.com>
References: <20220610123627.1339985-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Drop redundant 'ret' assignemnt, stop ignoring set_jack() return value
and reword local 'component' variable to 'codec' to improve readability.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/boards/bdw_rt286.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/bdw_rt286.c b/sound/soc/intel/boards/bdw_rt286.c
index e173546b68cc..81da9781c3ba 100644
--- a/sound/soc/intel/boards/bdw_rt286.c
+++ b/sound/soc/intel/boards/bdw_rt286.c
@@ -61,8 +61,8 @@ static const struct snd_soc_dapm_route card_routes[] = {
 
 static int codec_link_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
-	int ret = 0;
+	struct snd_soc_component *codec = asoc_rtd_to_codec(rtd, 0)->component;
+	int ret;
 
 	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset", SND_JACK_HEADSET | SND_JACK_BTN_0,
 					 &card_headset, card_headset_pins,
@@ -70,8 +70,7 @@ static int codec_link_init(struct snd_soc_pcm_runtime *rtd)
 	if (ret)
 		return ret;
 
-	rt286_mic_detect(component, &card_headset);
-	return 0;
+	return rt286_mic_detect(codec, &card_headset);
 }
 
 static int codec_link_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
-- 
2.25.1

