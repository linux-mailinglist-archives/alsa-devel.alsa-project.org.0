Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D3A26D9C3
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 13:02:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C71CB1676;
	Thu, 17 Sep 2020 13:01:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C71CB1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600340546;
	bh=F4NJiNqRiE+jYL+CHn3PHByogBCTkqj17SFNTqms6Eo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OByHwWFm6yDEMo6tKxDOlyA0tWgNtCa/tNSZ/X3fH0//NutfMwOiZ0owuUxJdCrw4
	 3eYzIuzRlIoyCr9YOXoyPH+pTTFVCRyX2P/yv6RBZrm+FGqCD5ysI/OVEp+VyI6tBM
	 zzRYXbGBsV1Z38SftX5KCO2DiUWJ8MBofwXaMS0I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3A3AF802EA;
	Thu, 17 Sep 2020 12:58:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F0B0F80134; Thu, 17 Sep 2020 12:58:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5791F80212
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 12:58:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5791F80212
IronPort-SDR: Nh85PVbjd0lnDYYSRtHr5b9HyClmCH1anGZRpHOFopPUV/ExUh5LysoPFaV8Kds/uV/SOQ8vlR
 tvi0UU5HoprA==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="157075350"
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="157075350"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 03:58:09 -0700
IronPort-SDR: zyygQoHMec5O3N8OwFRQbA4NGBo/K4rxSrgqvrysOt4Kf/D3BEwcIgPXDI62Bvq8R5g93ItjO7
 ELroKM8EM9xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="320177323"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga002.jf.intel.com with ESMTP; 17 Sep 2020 03:58:07 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 3/8] ASoC: SOF: debug: update test for pm_runtime_get_sync()
Date: Thu, 17 Sep 2020 13:56:28 +0300
Message-Id: <20200917105633.2579047-4-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200917105633.2579047-1-kai.vehmanen@linux.intel.com>
References: <20200917105633.2579047-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

We need to avoid reporting an error for -EACCESS when pm_runtime is
not enabled.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index 8e15f105d1d5..9419a99bab53 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -405,7 +405,7 @@ static ssize_t sof_dfsentry_write(struct file *file, const char __user *buffer,
 	}
 
 	ret = pm_runtime_get_sync(sdev->dev);
-	if (ret < 0) {
+	if (ret < 0 && ret != -EACCES) {
 		dev_err_ratelimited(sdev->dev,
 				    "error: debugfs write failed to resume %d\n",
 				    ret);
-- 
2.27.0

