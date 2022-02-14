Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEFD4B429B
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 08:14:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFED416B5;
	Mon, 14 Feb 2022 08:14:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFED416B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644822892;
	bh=I7BC7uehC4gM2EkjutEKUCeYM2QbUvM4xLthNGJb+Wc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q2RX0G90h/shsiyfLNlGffdyo92YsMt+EvlPFg28/gmuEdoOCtEUTdDuUz0eEj6xV
	 FeZCOGOh2IrlrDl3lL2PNqDMJmY4kKdmoDOkx3yDevYiNm51Mv1587WhFE3q6dxo9Y
	 d6P8+uTvKv3XBHj/VBRTUqgEGSLbaUBrhsgNOcMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64CEAF80430;
	Mon, 14 Feb 2022 08:13:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66D5FF80310; Mon, 14 Feb 2022 08:13:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE2BCF8012F
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 08:13:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE2BCF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Ng5Uf84s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644822819; x=1676358819;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I7BC7uehC4gM2EkjutEKUCeYM2QbUvM4xLthNGJb+Wc=;
 b=Ng5Uf84sdihzHPx2jPgQqFkF/SqfUlcoWAoIkAhc9G6Q2WwhmiJFfiL4
 D4K/OkHbDtdCAuyGbFPbkNiFyhHlLs68ggyTJfNiIpUV8eXzRIfHNTT4f
 Jo3hMGCZdduSgmQkE6ZfdsIlSm7kVyQkGq3ATz3u8cXaEuLJ6BMN3/zyw
 H6Y82HbqndO4/RH5sWcOA81pP8WHF2fBwSj9ltp1hFrU36D67Rx1QI9dq
 Fnw457jGF3SrTESjk2TTH0V2xNg9KCVzlL+q5AGZvvNcroCIK0SMHJhdJ
 QHFe+nN7bTjoW8U0j9+Qq6PhabQRAsnJXj9X5BnnvNkjYLhY4z7iVOPIF g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="233578385"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="233578385"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2022 23:13:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="527949550"
Received: from amrobles-mobl1.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.47.75])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2022 23:13:29 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com
Subject: [PATCH v2] ASoC: SOF: Makefile: Fix randconfig sof-client build when
 SND_SOC_SOF=y
Date: Mon, 14 Feb 2022 09:13:30 +0200
Message-Id: <20220214071330.22151-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, fred.oh@linux.intel.com, daniel.baluta@nxp.com
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

Intel's kernel test robot found the following randconfig combination:
SND_SOC_SOF=y
SND_SOC_SOF_CLIENT=m

In this the sof-client object is not going to be built into the snd-sof.o
and we will have undefined references to the sof-client functions.

Fixes: 6955d9512d0e ("ASoC: SOF: Introduce IPC SOF client support")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Peter Ujfalusi <Peter Ujfalusi <peter.ujfalusi@linux.intel.com>>
---
Hi Mark, Pierre,

Changes since v1:
- fix author and SoB from gmail.com to linux.intel.com

When the client support was added we did some permutation tests (at least I did)
but missed this combination.
It is a valid one for sure and the proper fix is via the Makefile.

Sorry for mising this

Regards,
Peter

 sound/soc/sof/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index 4d31282c847d..a0459f06c68a 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -2,7 +2,9 @@
 
 snd-sof-objs := core.o ops.o loader.o ipc.o pcm.o pm.o debug.o topology.o\
 		control.o trace.o iomem-utils.o sof-audio.o stream-ipc.o
-snd-sof-$(CONFIG_SND_SOC_SOF_CLIENT) += sof-client.o
+ifneq ($(CONFIG_SND_SOC_SOF_CLIENT),)
+snd-sof-objs += sof-client.o
+endif
 
 snd-sof-$(CONFIG_SND_SOC_SOF_COMPRESS) += compress.o
 
-- 
2.35.1

