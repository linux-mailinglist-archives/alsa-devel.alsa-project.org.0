Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B219510750
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 20:43:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DAC517B5;
	Tue, 26 Apr 2022 20:42:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DAC517B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650998585;
	bh=tBERO57s5gS7HXxW/4Kv6JmqI/w4v+iPzhv6H7vrRtM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dm8QKARvjxltcMaGSlLe1spC2y0IuuDMMqKEKFebSO4ArmZtgHjwr8ogJk2mtzo7/
	 c7ehNT/lguRVASY04SiIpLm37pRa9D64CQQx/trlN5UyWV0Vur7DBaCoELWBE78trH
	 YGo3pTNF3RetUe7irVefNsXr+QZMKPREwPloKAKA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DA66F804FE;
	Tue, 26 Apr 2022 20:41:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79C14F804AC; Tue, 26 Apr 2022 20:41:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30218F80171
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 20:41:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30218F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="a5c0X2Hs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650998483; x=1682534483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tBERO57s5gS7HXxW/4Kv6JmqI/w4v+iPzhv6H7vrRtM=;
 b=a5c0X2HsDKO9y2e12Wn2TCVEwb0JmoW3Rctz4VC1ASx1ahUNjJiTe0SK
 iJHtnyFyYvt6PN1min5hgaQr209acvQ51+HvTrO2t1YNC9t18IAMHD4PC
 xmdtsIaqfIr1RixOnjfqbTDF2EkEhIsNk0YmEmSmu8wK1lSRwd+xRftDJ
 yKQKtvSxumus2oTShHAO85OZoUXOIykbD3TiudaYPZ7GGIwHIbjuo5my1
 ygBDOdXlE3wD24W5harHM6oytX1F+CLci/5M4/ermEkA7QtLkz6v2DYaX
 Vz8pdW7lopvN3JEtusnJ0pvlmCmyyYSB0LwMD7EOEvCtL8HxKdpq/m6st g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="326176836"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="326176836"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 11:41:18 -0700
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="513300141"
Received: from jzhang96-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.151.202])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 11:41:18 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ASoC: SOF: sof-client-ipc-msg-injector: use
 pm_runtime_resume_and_get()
Date: Tue, 26 Apr 2022 13:41:06 -0500
Message-Id: <20220426184106.102636-5-pierre-louis.bossart@linux.intel.com>
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
 sound/soc/sof/sof-client-ipc-msg-injector.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sof/sof-client-ipc-msg-injector.c b/sound/soc/sof/sof-client-ipc-msg-injector.c
index dba6cfd7db092..c711981187aac 100644
--- a/sound/soc/sof/sof-client-ipc-msg-injector.c
+++ b/sound/soc/sof/sof-client-ipc-msg-injector.c
@@ -83,10 +83,9 @@ static ssize_t sof_msg_inject_dfs_write(struct file *file, const char __user *bu
 	if (size != count)
 		return size > 0 ? -EFAULT : size;
 
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0 && ret != -EACCES) {
 		dev_err_ratelimited(dev, "debugfs write failed to resume %d\n", ret);
-		pm_runtime_put_noidle(dev);
 		return ret;
 	}
 
-- 
2.30.2

