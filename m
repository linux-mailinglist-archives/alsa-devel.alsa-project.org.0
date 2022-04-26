Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9807B510752
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 20:43:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39D3417E0;
	Tue, 26 Apr 2022 20:42:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39D3417E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650998601;
	bh=De2EiuLXwcaEq+Iv5rmHiTmFuHEwNKxBjosg0uobJTw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eCpodF9i7egLVSwXCel5VvqU6rEmwRgJb5nZlD7zJyg/8wk4S9cFK36AcslPv1p/0
	 x/Jlb2hPn5iUnMXB3Ev26F4ThlsBC3otpu1LYFWqUwmQV0moYA7DifYNGdGebZxzHN
	 g+yGCurlSRWe/rnZc5d3SF7b/6TmQ0S/3btVKZqE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5489F8027D;
	Tue, 26 Apr 2022 20:41:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB339F80510; Tue, 26 Apr 2022 20:41:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F37CBF8014B
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 20:41:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F37CBF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ccKsSz25"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650998482; x=1682534482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=De2EiuLXwcaEq+Iv5rmHiTmFuHEwNKxBjosg0uobJTw=;
 b=ccKsSz25LIdZVi4TssNU/ew8h4O5crfAGz7D81iSAocX1tAPi3sTqu6A
 ki7nFtBAx4PGQi18nIGxeuh0GIyL8fFJOGRZef0qMV2XVWq57GBdsMQos
 8fIJYhzIhixa4NPrctvHlXwqBANmqDB/BvJjEO8s/GreIhnXhNJ7GyQHy
 KSDreXX2Bk+/BTOvhT532D2k8AM8pVUbgD0XH/51tHGeAwH+HUhUGs2Jd
 wUP1C1z2qJyzfw6zG0hUCgZpYgXq6/halQxmBc7W04GBYuT5K2N/g6hQD
 FDOMsa7E14oBzu5zG8bq3nXMy3Cvc4QAz1apBze9fp6xymAJiJ2GFHQAn w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="326176832"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="326176832"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 11:41:17 -0700
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="513300138"
Received: from jzhang96-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.151.202])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 11:41:16 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/4] ASoC: SOF: debug: use pm_runtime_resume_and_get()
Date: Tue, 26 Apr 2022 13:41:04 -0500
Message-Id: <20220426184106.102636-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220426184106.102636-1-pierre-louis.bossart@linux.intel.com>
References: <20220426184106.102636-1-pierre-louis.bossart@linux.intel.com>
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
 sound/soc/sof/debug.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index b59619ecfacfc..54d3643b46adb 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -229,9 +229,8 @@ static int memory_info_update(struct snd_sof_dev *sdev, char *buf, size_t buff_s
 	if (!reply)
 		return -ENOMEM;
 
-	ret = pm_runtime_get_sync(sdev->dev);
+	ret = pm_runtime_resume_and_get(sdev->dev);
 	if (ret < 0 && ret != -EACCES) {
-		pm_runtime_put_noidle(sdev->dev);
 		dev_err(sdev->dev, "error: enabling device failed: %d\n", ret);
 		goto error;
 	}
-- 
2.30.2

