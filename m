Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A1D31F232
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Feb 2021 23:22:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 307B01677;
	Thu, 18 Feb 2021 23:21:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 307B01677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613686939;
	bh=xXns3d9QowgJVn6VXx0dKyQeh9/V76Iu3fbsMRmuuR0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=noqGApGpQoyPIPLiIPPPoPs6pmB+Sd4i/Qs86JNbcjnP4ztO5ARN2u4r6NpNH+jA6
	 M9sWS1BNHi/qhnVh1/bP06AM32+tvaBJusptSDqHYhs2/H6qtxG98JyammHw2PF+OL
	 bk7iqwY+uVhcGaSEC7ohVWHIUmoLUOQJQVoEYDfI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6215AF802DF;
	Thu, 18 Feb 2021 23:19:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F723F802C4; Thu, 18 Feb 2021 23:19:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AA2AF8020C
 for <alsa-devel@alsa-project.org>; Thu, 18 Feb 2021 23:19:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AA2AF8020C
IronPort-SDR: vwKg3jtXwux6utyfYIxJgegEruE4TpP0G8mbrMap3gT76IpbvbPxmCdIyz57OqmGlkCej+vonl
 U23QHDyMeqOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="170801487"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="170801487"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:19:36 -0800
IronPort-SDR: WGZQPpwNKoxUiIaxBZbH4EkkwLHx64ED+6IZvSN55oHBh4Q5vvBzv/YB5tGht6epy49/TXB171
 obx7wsDbt5qw==
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="581441985"
Received: from tphilli1-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.64.38])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:19:36 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/6] ASoC: soc-pcm: remove shadowing variable
Date: Thu, 18 Feb 2021 16:19:18 -0600
Message-Id: <20210218221921.88991-4-pierre-louis.bossart@linux.intel.com>
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

sound/soc/soc-pcm.c:1718:7: style: Local variable 'i' shadows outer
variable [shadowVariable]
  int i;
      ^
sound/soc/soc-pcm.c:1696:6: note: Shadowed declaration
 int i;
     ^
sound/soc/soc-pcm.c:1718:7: note: Shadow variable
  int i;
      ^

the second variable seems totally unnecessary.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/soc-pcm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 12fd10a6c190..705fb2d548a9 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1718,7 +1718,6 @@ static int dpcm_apply_symmetry(struct snd_pcm_substream *fe_substream,
 			snd_soc_dpcm_get_substream(be, stream);
 		struct snd_soc_pcm_runtime *rtd;
 		struct snd_soc_dai *dai;
-		int i;
 
 		/* A backend may not have the requested substream */
 		if (!be_substream)
-- 
2.25.1

