Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB44149F8E0
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jan 2022 13:07:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 825261729;
	Fri, 28 Jan 2022 13:06:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 825261729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643371632;
	bh=3VPYEErWl2m4i4Ta/Yjs46fsEP5ZGmBsZoI6SV932D8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RSWAnTeAxpttqVwSDY6PgSYbZnBV17NGLKozPtaWDoqOciDdE+rheSg4u+aIX0W4Q
	 /2SqSfeqK/BjnONwgJ4oAlCukFevwY0+cOy8RQGR+067CMhfIZdGYRtYGxBylhNGTF
	 SeliZQdZ5cjp4+C5mNI8MDxv51CXYLqV3TEdik1w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFDDCF80246;
	Fri, 28 Jan 2022 13:06:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D79C3F8014B; Fri, 28 Jan 2022 13:06:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05BCEF8014B
 for <alsa-devel@alsa-project.org>; Fri, 28 Jan 2022 13:05:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05BCEF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="LJF1IZYx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643371560; x=1674907560;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3VPYEErWl2m4i4Ta/Yjs46fsEP5ZGmBsZoI6SV932D8=;
 b=LJF1IZYx4I/3F8ZrqkdMXxol1nYcHCfixU4xw1xAgrXkOdPqhhAkcm0y
 9OG3vepWFjMB+bc8SJ3vwmXL1oUdFQJR//sDfgQpmJqTCkkXRAjz//9e3
 7mWNxq5ZHXoLx5PYcD5wAD60h1tGSyc1EKYG+HIb0LtUX4jvL0baRGlZM
 kRGFZg7ItF5gHmqkZTZeMnPECOjvD+Kg/UKeW6MJHAhBZSu3LKCO1FIzI
 QuAkoI/1TEoAl3ohFdxJv+bGW48gh9HA+BQnR3zKlRvG+98K0hoBA3K4i
 PZyoB/zrQmWWuR2zbNFaOTNOUKhi2Xr42GlbOn+AJ0tE4IXyvgWd8Fg+x A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="245949508"
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="245949508"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 04:05:55 -0800
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="536109941"
Received: from dlita-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.43.152])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 04:05:53 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: trace: Simplify count adjustment in trace_read
Date: Fri, 28 Jan 2022 14:06:27 +0200
Message-Id: <20220128120627.18443-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com
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

The first count check and fixup against "buffer - lpos" can be removed as
we will do the adjustment later against the "avail" in
sof_dfsentry_trace_read()

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/trace.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/trace.c b/sound/soc/sof/trace.c
index f13024c8ebf2..9b505c4fe794 100644
--- a/sound/soc/sof/trace.c
+++ b/sound/soc/sof/trace.c
@@ -308,9 +308,6 @@ static ssize_t sof_dfsentry_trace_read(struct file *file, char __user *buffer,
 	lpos_64 = lpos;
 	lpos = do_div(lpos_64, buffer_size);
 
-	if (count > buffer_size - lpos) /* min() not used to avoid sparse warnings */
-		count = buffer_size - lpos;
-
 	/* get available count based on current host offset */
 	avail = sof_wait_trace_avail(sdev, lpos, buffer_size);
 	if (sdev->dtrace_error) {
@@ -319,7 +316,8 @@ static ssize_t sof_dfsentry_trace_read(struct file *file, char __user *buffer,
 	}
 
 	/* make sure count is <= avail */
-	count = avail > count ? count : avail;
+	if (count > avail)
+		count = avail;
 
 	/* copy available trace data to debugfs */
 	rem = copy_to_user(buffer, ((u8 *)(dfse->buf) + lpos), count);
-- 
2.35.0

