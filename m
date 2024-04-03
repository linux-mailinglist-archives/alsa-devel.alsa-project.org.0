Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D59896AA6
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Apr 2024 11:32:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDCA72C5E;
	Wed,  3 Apr 2024 11:32:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDCA72C5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712136741;
	bh=dyAOo+VFBsweUHd5Xag2bd447ewOnMyY3G3yMPwcU1o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ENyltJsCWKe86v4L31BmQKgFJplA8bIx/9Nxv5ScL4jZyR8/lgXkSN6e0ha4OMvlb
	 /kxh8tJxCstHxGGhX2NnrzjSVDGGZcPR2eW3E4KKpOqyf4oCr3r57XbCSNQdOHc9fv
	 Z6FFNNTloWy51ENLMp67vcwZq25SbhFANPcSKdWI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3B04F805D2; Wed,  3 Apr 2024 11:31:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67E9FF805B3;
	Wed,  3 Apr 2024 11:31:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45734F80568; Wed,  3 Apr 2024 11:31:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5EC2F8016E
	for <alsa-devel@alsa-project.org>; Wed,  3 Apr 2024 11:31:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5EC2F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RfaLQ4WV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712136678; x=1743672678;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dyAOo+VFBsweUHd5Xag2bd447ewOnMyY3G3yMPwcU1o=;
  b=RfaLQ4WVZMqrkVy4/lZ9NnT6JuWlQUUnrvQ1nVkZb7+T+dVgOK8tu+hp
   iZyG6PeaNZiUI4ImoMCNf0vqpFqsmO6dxGya1HRRWCu6ZF6mMHWUciZjc
   ZZMxAPdUpR4TMnsWtWOMFzraMs0Ylit/zBQeuh/IR9twQyc0vcNNjb0xo
   3zBIe/9xhkgu75YWBTK5mKk6Ld/NrVw3Hj5+T5NfHtu8deOUeollwopCm
   Uu61Jd+1zWh2JExg4lEz3iIW5oDhHifWCufMjSJfizoZHM4A6zL0fKjqr
   zmzBlU/kUT41tRUgX6Ew02qRC2yGGQVeQGEj6Ke6wev9relJ6/WGSm6IT
   Q==;
X-CSE-ConnectionGUID: c1h2YyByQwSH4DlxcXUCYQ==
X-CSE-MsgGUID: vYcRio8xSj+830HwZLcrFw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7218678"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="7218678"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 02:31:15 -0700
X-CSE-ConnectionGUID: 947EalOQQeisSw3SqC2xCA==
X-CSE-MsgGUID: r9tbWrhFRaCAYbzC1MClhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="18797535"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa007.jf.intel.com with ESMTP; 03 Apr 2024 02:31:13 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 01/10] ASoC: Intel: avs: hdaudio: Use devm_kstrdup_const
Date: Wed,  3 Apr 2024 11:31:36 +0200
Message-Id: <20240403093145.3375857-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403093145.3375857-1-amadeuszx.slawinski@linux.intel.com>
References: <20240403093145.3375857-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GLEMEPTIYW2JMBYEFYY3PJX3ZELOTGTW
X-Message-ID-Hash: GLEMEPTIYW2JMBYEFYY3PJX3ZELOTGTW
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GLEMEPTIYW2JMBYEFYY3PJX3ZELOTGTW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

HDA codec name is constant and we just duplicate it, use const variant
of devm_kstrdup to possibly save a bit of memory.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/hdaudio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/boards/hdaudio.c b/sound/soc/intel/avs/boards/hdaudio.c
index 79b4aca413338..2de703b909c30 100644
--- a/sound/soc/intel/avs/boards/hdaudio.c
+++ b/sound/soc/intel/avs/boards/hdaudio.c
@@ -54,7 +54,7 @@ static int avs_create_dai_links(struct device *dev, struct hda_codec *codec, int
 		if (!dl[i].cpus->dai_name)
 			return -ENOMEM;
 
-		dl[i].codecs->name = devm_kstrdup(dev, cname, GFP_KERNEL);
+		dl[i].codecs->name = devm_kstrdup_const(dev, cname, GFP_KERNEL);
 		if (!dl[i].codecs->name)
 			return -ENOMEM;
 
@@ -191,7 +191,7 @@ static int avs_hdaudio_probe(struct platform_device *pdev)
 	if (!binder->platforms || !binder->codecs)
 		return -ENOMEM;
 
-	binder->codecs->name = devm_kstrdup(dev, dev_name(&codec->core.dev), GFP_KERNEL);
+	binder->codecs->name = devm_kstrdup_const(dev, dev_name(&codec->core.dev), GFP_KERNEL);
 	if (!binder->codecs->name)
 		return -ENOMEM;
 
-- 
2.34.1

