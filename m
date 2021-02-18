Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE8631F233
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Feb 2021 23:22:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AC011667;
	Thu, 18 Feb 2021 23:21:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AC011667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613686966;
	bh=nSj+671JNaZUziyvM5ett3/nv+AL9O2psGwEPcD0oNo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nkk9NKiHfxrOQs7CCMlgnilA6yrtK99xqbLCREQ2LCzUDpLCN0MZP64Qa97pNWNKy
	 7pSG4NJy4NU8Y727vmzKlTj+lxFLvw6d1wfqRvfDuYjMDW0gEr564FyYmVTU4xfVkx
	 Rfv6IzaVXQM2UriULeQCek/r8RImeyYu+JZ8/H6Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE099F8032D;
	Thu, 18 Feb 2021 23:19:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24FE1F802C4; Thu, 18 Feb 2021 23:19:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1A13F80275
 for <alsa-devel@alsa-project.org>; Thu, 18 Feb 2021 23:19:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1A13F80275
IronPort-SDR: T+JKSprEKiHpmFy9BFgS6KIPINy7Ty33Yhtq0yaSdwCD2sztlLM50zF8yIw8QmcJrsdMPdZdk/
 Nc/46PtyKI5Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="170801506"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="170801506"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:19:39 -0800
IronPort-SDR: 9WMWu5N24h2XVGHgVWT07CYsbDRp+0K25Py2kHVEJxkeZ341f8x8MwUhWteba8Q8Dcor4ITxh7
 uiVT/Vw4oT4w==
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="581441997"
Received: from tphilli1-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.64.38])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:19:39 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/6] ASoC: generic: simple-card-utils: remove useless
 assignment
Date: Thu, 18 Feb 2021 16:19:21 -0600
Message-Id: <20210218221921.88991-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210218221921.88991-1-pierre-louis.bossart@linux.intel.com>
References: <20210218221921.88991-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

cppcheck warning:

sound/soc/generic/simple-card-utils.c:258:10: style: Variable 'ret' is
assigned a value that is never used. [unreadVariable]
 int ret = 0;
         ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/generic/simple-card-utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index ab31045cfc95..06c2512b6f2d 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -254,7 +254,7 @@ int asoc_simple_hw_params(struct snd_pcm_substream *substream,
 	struct simple_dai_props *dai_props =
 		simple_priv_to_props(priv, rtd->num);
 	unsigned int mclk, mclk_fs = 0;
-	int ret = 0;
+	int ret;
 
 	if (dai_props->mclk_fs)
 		mclk_fs = dai_props->mclk_fs;
-- 
2.25.1

