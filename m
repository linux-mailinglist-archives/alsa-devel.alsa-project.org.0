Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B5952A970
	for <lists+alsa-devel@lfdr.de>; Tue, 17 May 2022 19:38:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94B6D91;
	Tue, 17 May 2022 19:37:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94B6D91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652809115;
	bh=/OJeMYcBZekICKoxr+vVHyl07ry9gsvZfA6MZ6flJoc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=baBIQPAzvPr44QtSG0/E0uH3VXcMSSIwjvWqALDewV3thH8lfDn80b0IyFwwismUl
	 eiv0/tWPymPznc2OEY4DFVKIC4xzM0d9hKxJ+FNkFovcXtB9tkQ7rsdQoa1V1IRXuM
	 0rsjM3hjSJbi5Cj/tOBdQDvw1U78gc+0wlBBc9fc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED4C7F80310;
	Tue, 17 May 2022 19:37:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E34F8F802DB; Tue, 17 May 2022 19:37:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F03A6F800F0
 for <alsa-devel@alsa-project.org>; Tue, 17 May 2022 19:37:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F03A6F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IJFiVPwZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652809054; x=1684345054;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/OJeMYcBZekICKoxr+vVHyl07ry9gsvZfA6MZ6flJoc=;
 b=IJFiVPwZwsz5dZg6jJvD1Vif2JxkO9KHH9jVF+2WkETQTLhZlWH6CmyS
 looQimgSnF/e8yeYd4a1PNghvHW9P6+Q/0O18qb7r7/adsYmWMAzvGYqq
 pn7Bv6WXjMZ32WH0m7tczMlbPB+6US2aEpA0oW2XHqT48EUOHC3NOkt+M
 mmAaCT8sYtZvjGyHq5XMARIcvphjycK4FTZMgICG4gkEiQ49JpVL5jGX8
 GS5/h2MZaWsOT+Iehn04EXSyWWS2W3pzkARvTGvraT/hnMQS+3ef73z6+
 L2AwntUX6R9Zsm8yD4Tl6ujVo0MWB9osPWVfsi6bbxp2uCInsH7gTzhGr A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="331879823"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="331879823"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 10:37:30 -0700
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="672961442"
Received: from sfilary-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.67.235])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 10:37:29 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH RESEND] ASoC: SOF: sof-client-ipc-flood-test: use
 pm_runtime_resume_and_get()
Date: Tue, 17 May 2022 12:37:15 -0500
Message-Id: <20220517173715.468894-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
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

Use pm_runtime_resume_and_get() to replace the pm_runtime_get_sync() and
pm_runtime_put_noidle() pattern.

No functional changes.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---

This patch was sent as part of the "[PATCH 0/4] ASoC: SOF: use
pm_runtime_resume_and_get()" series, but somehow not applied. The
other 3 patches were selected.

 sound/soc/sof/sof-client-ipc-flood-test.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sof/sof-client-ipc-flood-test.c b/sound/soc/sof/sof-client-ipc-flood-test.c
index db3a052c5dd2b..4bdecd80248ac 100644
--- a/sound/soc/sof/sof-client-ipc-flood-test.c
+++ b/sound/soc/sof/sof-client-ipc-flood-test.c
@@ -217,10 +217,9 @@ static ssize_t sof_ipc_flood_dfs_write(struct file *file, const char __user *buf
 			ipc_count = MAX_IPC_FLOOD_COUNT;
 	}
 
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0 && ret != -EACCES) {
 		dev_err_ratelimited(dev, "debugfs write failed to resume %d\n", ret);
-		pm_runtime_put_noidle(dev);
 		goto out;
 	}
 
-- 
2.30.2

