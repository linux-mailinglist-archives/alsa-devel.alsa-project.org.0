Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 941C1652114
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Dec 2022 13:58:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A8592143;
	Tue, 20 Dec 2022 13:57:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A8592143
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671541089;
	bh=2xUvJppOjrTHGAXye1BLsB5WdkkLABznyEZYkQBE2U8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VghFwk16Hw+1OAHnr9Z/O5S+ZzicP31fiqSPKZiYveAEdQJEpZACxxc3VWDzkUy3u
	 2CJ05M2mqiNSZDozWfUVPhDs4AXsGU9FEvtUinoCfHBpPQO+cx4W2wXZW3d/IXXOi0
	 8LRmT7uFhP5x58AurssksImU7KNW4dO8U8ZmIiRg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3DBAF8052F;
	Tue, 20 Dec 2022 13:56:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2428F80538; Tue, 20 Dec 2022 13:56:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 001A3F80536
 for <alsa-devel@alsa-project.org>; Tue, 20 Dec 2022 13:56:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 001A3F80536
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=akxRB0iX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671541014; x=1703077014;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2xUvJppOjrTHGAXye1BLsB5WdkkLABznyEZYkQBE2U8=;
 b=akxRB0iXEHraoJHWdl04sHrDNewk8qct2V1g/aD6S741Kj0X+R39bBx/
 2UjeCLHmAUl2qiknhAS+x61pMfSjXcqQ+sSIc9rvM92oKxoSfXQtoJsLo
 SH5zPUAXseVM1qqAFttgqNV1fJLs11UINUuosDJrNCm4UD4hxjzSl3UC+
 7mKVgbrIzwHtJfMDzXJdySqlZwwAwU5MObwFKGe0qJDnrGHflJxGJP9eh
 tNy8o/hxFh9+amLoQ1TTQpo9WCXOQqVMxtZ0A0cH1PzxiAXLbnrZwdaEw
 psKoDQZKz5lLBRQKbc8lx+QpKMe4GWEcjnezRjoE+NHZ/6Dn38VNuokEP Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="299280493"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; d="scan'208";a="299280493"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2022 04:56:29 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="825222245"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; d="scan'208";a="825222245"
Received: from vadimbel-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.20.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2022 04:56:26 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 2/3] ASoC: SOF: pm: Always tear down pipelines before DSP
 suspend
Date: Tue, 20 Dec 2022 14:56:28 +0200
Message-Id: <20221220125629.8469-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221220125629.8469-1-peter.ujfalusi@linux.intel.com>
References: <20221220125629.8469-1-peter.ujfalusi@linux.intel.com>
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

When the DSP is suspended while the firmware is in the crashed state, we
skip tearing down the pipelines. This means that the widget reference
counts will not get to reset to 0 before suspend. This will lead to
errors with resuming audio after system resume. To fix this, invoke the
tear_down_all_pipelines op before skipping to DSP suspend.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/pm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 5f88c4a01fa3..8722bbd7fd3d 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -192,6 +192,9 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 	if (runtime_suspend && !sof_ops(sdev)->runtime_suspend)
 		return 0;
 
+	if (tplg_ops && tplg_ops->tear_down_all_pipelines)
+		tplg_ops->tear_down_all_pipelines(sdev, false);
+
 	if (sdev->fw_state != SOF_FW_BOOT_COMPLETE)
 		goto suspend;
 
@@ -216,9 +219,6 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 		goto suspend;
 	}
 
-	if (tplg_ops->tear_down_all_pipelines)
-		tplg_ops->tear_down_all_pipelines(sdev, false);
-
 	/* suspend DMA trace */
 	sof_fw_trace_suspend(sdev, pm_state);
 
-- 
2.39.0

