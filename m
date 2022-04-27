Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B58851166A
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 13:52:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4A521677;
	Wed, 27 Apr 2022 13:51:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4A521677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651060368;
	bh=SZZ/tQq365b5FngJ9tXGNPjVkyZZ8/nrNVrYWYF5t3M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Cmse/NOJwBYQPzGqHzGNTbGEwg3C14s0huaHcJqekwvW+fDhnqCaMbjJve/TWxHDv
	 /MO3e8PyudIBR27yHmKirruNlmGug8fJeWGlliqmkA5wDRlMzz4AcrJKt7CzhBEs58
	 r2xkDpSyyIHrmXc1+w9SMMfwLUfkFhIisdPhdy8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46D1FF80253;
	Wed, 27 Apr 2022 13:51:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3907F8016E; Wed, 27 Apr 2022 13:51:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8092F800AE
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 13:51:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8092F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="c3G0e7Y4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651060303; x=1682596303;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SZZ/tQq365b5FngJ9tXGNPjVkyZZ8/nrNVrYWYF5t3M=;
 b=c3G0e7Y4U+hVBJzfqua3MNQn44bCb0UVWi/r7QALuXVKk8ZMmUaY8gEB
 GsegZwOr1Sft/wy2axuIf6KCY87YRI4IBmWUIKLSugOircTWGvC6XxhwH
 PeGgwXyKiBXT2UH74DL6IWj1E3TR8W4IreDut9JuHviC+Mo7LKJNmpRDV
 Fd1uYk6n7DBWKbWqif4njW5Jqu6qPWTM1kfK4WLya9PDg4QCGIjuroDR3
 IKZNtuPI545YCZlZ+iGnFJjNux3TBSMMBEHNDEc6C73wi797DT+VzpZzn
 YD47uByu7smHuf0XBAjSFxfv70ECdqfFsFFc5OujUWnfzKEmIUgzsUXDC w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="246465074"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="246465074"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 04:51:38 -0700
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="580550278"
Received: from rdegreef-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.32.27])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 04:51:36 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, dan.carpenter@oracle.com
Subject: [PATCH] ASoC: SOF: Intel: Do not (wrongly) assume positive return
 value in IMR path
Date: Wed, 27 Apr 2022 14:51:59 +0300
Message-Id: <20220427115159.26177-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@intel.linux.com
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

The cl_dsp_init() returns 0 on success or negative errno on error.
Replace the 'if (ret >= 0)' checks with correct 'if (!ret)` to check for
success.

Fixes: 2a68ff846164 ("ASoC: SOF: Intel: hda: Revisit IMR boot sequence")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 7d4436f079c6..64290125d7cd 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -372,7 +372,7 @@ static int hda_dsp_boot_imr(struct snd_sof_dev *sdev)
 	int ret;
 
 	ret = cl_dsp_init(sdev, 0, true);
-	if (ret >= 0)
+	if (!ret)
 		hda_sdw_process_wakeen(sdev);
 
 	return ret;
@@ -393,8 +393,8 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 		dev_dbg(sdev->dev, "IMR restore supported, booting from IMR directly\n");
 		hda->boot_iteration = 0;
 		ret = hda_dsp_boot_imr(sdev);
-		if (ret >= 0)
-			return ret;
+		if (!ret)
+			return 0;
 
 		dev_warn(sdev->dev, "IMR restore failed, trying to cold boot\n");
 	}
-- 
2.36.0

