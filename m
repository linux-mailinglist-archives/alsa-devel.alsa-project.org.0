Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05233546F66
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 23:44:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EF0D1EE7;
	Fri, 10 Jun 2022 23:43:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EF0D1EE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654897487;
	bh=j1mewMGJ5pkpPcp3w0vomTvBOHlASbxgB+gKl4d5FnM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oA5csOtQTJ7/AbRmP+J+6hkv8pq9YnFqPYy7KekhcFXgScSRdPJ/4Ar/JnFhCMBdk
	 nIoxIUDyCux4OSDnb+98evJLGxrRhD9DuTlQariMF7sEeilsyk5c33OwDZHIMDE2Zh
	 ReeHj7MyBoFarY3qD7Hs6IIs43xs/lijQy1hB/0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAA64F804D8;
	Fri, 10 Jun 2022 23:43:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EFC2F804D2; Fri, 10 Jun 2022 23:43:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BE3FF800DF
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 23:43:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BE3FF800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="JdRxKoYu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654897420; x=1686433420;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j1mewMGJ5pkpPcp3w0vomTvBOHlASbxgB+gKl4d5FnM=;
 b=JdRxKoYuTle3+n5mJxy3nbqUhs7a0LEDShXTBVVJXeIeI2tDeHEA7fkU
 rsIlEj2LfrJvaIaZKlG/dIlZ83jYF358Mof9tOMeMPpafblMLz6g38w+y
 J+1zVrXTGIB7cqqpJWmDmLDze+2BclZFUV5nPXNc8ouSSzzWr1tz0pnK+
 iN73si2uHKBMCuwAt00CIm7SKTMRq/w91fMVSMguEXRpkrDHtS96DnqQK
 DR8GXXkrlexe77oTwj6GjTUCVOo359OHkGzRPNGHGnUYguHZhQ6Pfkyxu
 RgrxQ7+398u4zqtsXjIAPEkuDnwk231xgzu7pU7DInYOKBGnJrRMXVveL g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="260874208"
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="260874208"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 14:43:21 -0700
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="586401613"
Received: from andrewri-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.126.97])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 14:43:20 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] MAINTAINERS: update ASoC/Intel/SOF maintainers
Date: Fri, 10 Jun 2022 16:43:13 -0500
Message-Id: <20220610214313.42903-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Keyon Jie was a key contributor to the Intel ASoC and SOF Intel
drivers, but he's moved on to a different role within Intel. We wish
him all the best in his new endeavors.

Bard Liao, Kai Vehmanen, Ranjani Sridharan and Peter Ujfalusi have
been involved in the Intel multi-maintainer team, it's time to update
the MAINTAINERS entry to reflect their contributions and clarify their
role.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 MAINTAINERS | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a6d3bd9d2a8d0..440f3d7c93b9e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9803,7 +9803,10 @@ INTEL ASoC DRIVERS
 M:	Cezary Rojewski <cezary.rojewski@intel.com>
 M:	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
 M:	Liam Girdwood <liam.r.girdwood@linux.intel.com>
-M:	Jie Yang <yang.jie@linux.intel.com>
+M:	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
+M:	Bard Liao <yung-chuan.liao@linux.intel.com>
+M:	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
+M:	Kai Vehmanen <kai.vehmanen@linux.intel.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Supported
 F:	sound/soc/intel/
@@ -18670,8 +18673,10 @@ F:	sound/soc/
 SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS
 M:	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
 M:	Liam Girdwood <lgirdwood@gmail.com>
+M:	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
+M:	Bard Liao <yung-chuan.liao@linux.intel.com>
 M:	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
-M:	Kai Vehmanen <kai.vehmanen@linux.intel.com>
+R:	Kai Vehmanen <kai.vehmanen@linux.intel.com>
 M:	Daniel Baluta <daniel.baluta@nxp.com>
 L:	sound-open-firmware@alsa-project.org (moderated for non-subscribers)
 S:	Supported
-- 
2.34.1

