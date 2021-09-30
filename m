Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F6A41D3E4
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Sep 2021 09:06:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CC1E16DF;
	Thu, 30 Sep 2021 09:05:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CC1E16DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632985575;
	bh=ZA9Cvui8oH+KPegvwe+DjgBose27l6F2nYUnZpznoig=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TcYwlvALJ1AaygsTWqENaCp4mp3kXhiN1zs2+phJoeEOohji8D6Wky8P7W1xQg+87
	 Fx4p9d6w4yJmoAKZESJEsi8N8zvaFwgr+po6+74R6g/D8azD1v3r1z6Syqe0MLNSB5
	 qx1FTdCta6r3LJ8MxginSDhNtOo0cg8kd//UQBB0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4D95F800F3;
	Thu, 30 Sep 2021 09:04:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1F4BF804AD; Thu, 30 Sep 2021 09:04:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CACF5F800F3
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 09:04:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CACF5F800F3
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="225191230"
X-IronPort-AV: E=Sophos;i="5.85,335,1624345200"; d="scan'208";a="225191230"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 00:04:40 -0700
X-IronPort-AV: E=Sophos;i="5.85,335,1624345200"; d="scan'208";a="555542129"
Received: from kacharya-mobl.gar.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.39.33])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 00:04:33 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com
Subject: [PATCH] ASoC: SOF: Change SND_SOC_SOF_TOPLEVEL from config to
 menuconfig
Date: Thu, 30 Sep 2021 10:04:38 +0300
Message-Id: <20210930070438.16846-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 bard.liao@intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

We have growing number of options under SND_SOC_SOF_TOPLEVEL as SOF
adaptation is growing (Intel, NXP, AMD and Mediatek) and new features are
added.
It will make the menuconfig user experience much cleaner if we move the
SOF options under a separate page.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
Hi,

screen shots of before and after of menuconfig is attached to the PR for
sof-dev:
https://github.com/thesofproject/linux/pull/3148

Regards,
Peter

 sound/soc/sof/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index cd659493b5df..94d1a859fedc 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config SND_SOC_SOF_TOPLEVEL
+menuconfig SND_SOC_SOF_TOPLEVEL
 	bool "Sound Open Firmware Support"
 	help
 	  This adds support for Sound Open Firmware (SOF). SOF is free and
-- 
2.33.0

