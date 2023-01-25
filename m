Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F8867B1E2
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Jan 2023 12:48:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65C4DE76;
	Wed, 25 Jan 2023 12:47:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65C4DE76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674647327;
	bh=1qicZyqFw7SYs7GezHm/3Tfit2mXoOyGtxmQh1LPsZc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kS6jydsCirTzwB5ujz5qmqd/o90zvIxx+ai1Q5vQaNJPjttHZAz3zuQF3U+cxLm1U
	 5YDhhyW5bDiRGApxm2vFiQdDx6N/b8klx33H5OsADQEFB2XCG7MZNn/x7EUABKcFKy
	 2ikCDreDCwWK/X/HMiOoJ68kcqhXUuTb2iFBEUpg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8019DF80567;
	Wed, 25 Jan 2023 12:46:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03282F80539; Wed, 25 Jan 2023 12:46:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57BD0F80163
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 12:46:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57BD0F80163
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EF2tIHLE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674647176; x=1706183176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1qicZyqFw7SYs7GezHm/3Tfit2mXoOyGtxmQh1LPsZc=;
 b=EF2tIHLE5QbrwdTFgXqNiqviba02XUaN8ufcvG6N7qogpjh5iu7tuvCm
 p+lmD0D2JgVRxqjflBQOM/fApYKjKp/r5npRqqKVpDIJv4oA05YNqM+GO
 YB1uQT1/m5TkHBjAmrkATKKnpQl6CDPrPUV0/OFQ0WbZv5UtEKypOqhPH
 WBzf4M+wEQuQCBqkvEyaTl0IEjS6vzjXqaWO0PXaZg3RPne/QwUH/IaWu
 1DONey14ZMw2RwSMqhmbTysPuK3zAVU1rJ6LNPXNMA8QWIddykX2MSr+M
 Np3i3u1ZsfABolcq0ncgpXCUeqRNMQ70KLdgDo792pMXX2J+Lb/3tCH2I A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="324234230"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="324234230"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 03:46:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="612394039"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="612394039"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga003.jf.intel.com with ESMTP; 25 Jan 2023 03:46:13 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 08/11] ASoC: topology: Return an error on complete() failure
Date: Wed, 25 Jan 2023 20:46:46 +0100
Message-Id: <20230125194649.3485731-9-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230125194649.3485731-1-amadeuszx.slawinski@linux.intel.com>
References: <20230125194649.3485731-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Function soc_tplg_dapm_complete() detects an error and logs it, but
doesn't return failure to the caller, fix it by returning the error.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index c35c0c53a184..08dd55f94584 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1563,7 +1563,7 @@ static int soc_tplg_dapm_complete(struct soc_tplg *tplg)
 		dev_err(tplg->dev, "ASoC: failed to create new widgets %d\n",
 			ret);
 
-	return 0;
+	return ret;
 }
 
 static int set_stream_info(struct soc_tplg *tplg, struct snd_soc_pcm_stream *stream,
-- 
2.25.1

