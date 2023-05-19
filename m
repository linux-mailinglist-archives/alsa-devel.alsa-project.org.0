Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF2670972F
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 14:19:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3037B825;
	Fri, 19 May 2023 14:18:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3037B825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684498758;
	bh=0mIwdJ2aflRied2pLi3obeU4WZxE26KjNZiOeSb7G4g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Sdl/CgNyrOmB1tKLafjJoBMc1gGqvz49EuaNiwyQGnO2a4QWYrWNZU+CENur+NLuf
	 VWAAMts1kae31yC/ja1LSqfmfGWpcH1GI+enb0e6/tMHx3LWm8GWA3MpFG+wSVedjY
	 g3gzmWSZCgoCf0MBBxsnA+p/h8DeyvgZOwUOPVjQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A7A3F805BF; Fri, 19 May 2023 14:16:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F96CF805C7;
	Fri, 19 May 2023 14:16:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C5C7F8057C; Fri, 19 May 2023 14:16:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04979F802E8
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 14:16:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04979F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OxEOCbvN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684498567; x=1716034567;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0mIwdJ2aflRied2pLi3obeU4WZxE26KjNZiOeSb7G4g=;
  b=OxEOCbvNbaGkQvR3uX9tsnDyxNYrb3DxBTQKn194XvJ9V84cThTyIrow
   QeM3b+cVOPprL9GtVdyAZu7CmfiDo+yA06T4Ri3/zB1YzvbLElP72kvz3
   EFUv95rAYIxKIGX8KYiHhOMuvCDAOy/NJCTJe3t7cIIbGq5APyrzvFXd/
   UvW8erd6/DLFVHbDxyH3gG0r1pW5hwlL6VqGaKTwSksXY/A8GMDsqGxKq
   ehfOwnPTkAHSx86T7sRqCHR+HRf2KEaKZUonehkaVmsBqWJXo/D/vt1Pl
   3fBGvcxaTr+KfJOapWZBT2dhE3urrSeqC66TBUvSOhfT8KT3Z0dTFPQrU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="355584468"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400";
   d="scan'208";a="355584468"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 05:16:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="733283712"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400";
   d="scan'208";a="733283712"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orsmga008.jf.intel.com with ESMTP; 19 May 2023 05:16:03 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 7/7] ASoC: Intel: avs: Add missing checks on FE startup
Date: Fri, 19 May 2023 22:17:11 +0200
Message-Id: <20230519201711.4073845-8-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230519201711.4073845-1-amadeuszx.slawinski@linux.intel.com>
References: <20230519201711.4073845-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: L23FY5NT5ZWNVJDMFSJCEBEAVSSU6OHX
X-Message-ID-Hash: L23FY5NT5ZWNVJDMFSJCEBEAVSSU6OHX
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L23FY5NT5ZWNVJDMFSJCEBEAVSSU6OHX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Constraint functions have return values, they should be checked for
potential errors.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/pcm.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 31c032a0f7e4..1fbb2c2fadb5 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -468,21 +468,34 @@ static int avs_dai_fe_startup(struct snd_pcm_substream *substream, struct snd_so
 
 	host_stream = snd_hdac_ext_stream_assign(bus, substream, HDAC_EXT_STREAM_TYPE_HOST);
 	if (!host_stream) {
-		kfree(data);
-		return -EBUSY;
+		ret = -EBUSY;
+		goto err;
 	}
 
 	data->host_stream = host_stream;
-	snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
+	ret = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0)
+		goto err;
+
 	/* avoid wrap-around with wall-clock */
-	snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_TIME, 20, 178000000);
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, &hw_rates);
+	ret = snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_TIME, 20, 178000000);
+	if (ret < 0)
+		goto err;
+
+	ret = snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, &hw_rates);
+	if (ret < 0)
+		goto err;
+
 	snd_pcm_set_sync(substream);
 
 	dev_dbg(dai->dev, "%s fe STARTUP tag %d str %p",
 		__func__, hdac_stream(host_stream)->stream_tag, substream);
 
 	return 0;
+
+err:
+	kfree(data);
+	return ret;
 }
 
 static void avs_dai_fe_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
-- 
2.34.1

