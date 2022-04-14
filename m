Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76754501B5B
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Apr 2022 20:52:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 213FF18FF;
	Thu, 14 Apr 2022 20:51:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 213FF18FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649962330;
	bh=GDbs+E9gIjC1X7E6kaIYog2MSHrQ9aFlwFQX4Y+zpKg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MRnyBcdj7I0/D1/7HCeHDJUJ8BP0gdFCDM7Pc9ziv8f3yxs/yWPc5MZQocG5mPs19
	 7KSWlANEE1YRK9PEYD2wE7r40qFlVRyIsB3miGJw3hef1icalRQtwRcROOjxtBG7Zq
	 ++YTNjqsx0j7fFZs3HQQq5lX8JGe70EflBdHrOqM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE5C4F8051A;
	Thu, 14 Apr 2022 20:49:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58377F80548; Thu, 14 Apr 2022 20:49:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFBC5F8052F
 for <alsa-devel@alsa-project.org>; Thu, 14 Apr 2022 20:48:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFBC5F8052F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AoR4eVj9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649962139; x=1681498139;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GDbs+E9gIjC1X7E6kaIYog2MSHrQ9aFlwFQX4Y+zpKg=;
 b=AoR4eVj9pjWqZWIqPb0fPacypfnqRNbstwSGX99iqkCfpK1U97I1sthM
 lYmOeu/1kbcCXz44TFRknnMZRH1mfyfUwmmPbHGo3P3Z8XEJqhXcL6otT
 x2P9zYexaaqOAr+qCvZOVFj9BgHOXNm9N26LxAJ7mAoXRpDOy+88Sxc9N
 Jj3kD1IX2OSlYbvpZBhMV3NU8xRvIgO2XhsDLMJY2yjFQlNlrFK5sL4Kh
 ZVfG5t8fumU9+GUq78kVWwia0QEggcnedWTyC8cTurpugaSTQoW61if8T
 cULEXtf7eqX4PS4E2cAI2nSa1vrbP7jBLlyWoBMC9Mubn6tfZX3XhvNJy Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="349442348"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="349442348"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:48:39 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="560304631"
Received: from rrsolima-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.252.130.212])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:48:38 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 07/15] ASoC: SOF: sof-audio: preserve topology filename
 override in nocodec mode
Date: Thu, 14 Apr 2022 13:48:09 -0500
Message-Id: <20220414184817.362215-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220414184817.362215-1-pierre-louis.bossart@linux.intel.com>
References: <20220414184817.362215-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Paul Olaru <paul.olaru@oss.nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
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

If the topology filename is modified at a higher level, be it with a
DMI quirk or a kernel module parameter, we don't want to use the
default 'nocodec' topology name extracted from descriptors.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index c0a442272ad6..e2ec60887568 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -652,7 +652,8 @@ int sof_machine_check(struct snd_sof_dev *sdev)
 		return -ENOMEM;
 
 	mach->drv_name = "sof-nocodec";
-	sof_pdata->tplg_filename = desc->nocodec_tplg_filename;
+	if (!sof_pdata->tplg_filename)
+		sof_pdata->tplg_filename = desc->nocodec_tplg_filename;
 
 	sof_pdata->machine = mach;
 	snd_sof_set_mach_params(mach, sdev);
-- 
2.30.2

