Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C559F4D0612
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 19:13:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7FF21758;
	Mon,  7 Mar 2022 19:12:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7FF21758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646676796;
	bh=+swSm3wPEFZSVw9Cfp5+ZQJFB6mQEStIMYUvZ9tTVNk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CW2Vywx7kLkxXOgkTHtKyn5U4dFhWPgXrwvTuc4hlG7zorxQ8g/KdjjgKv654XPyF
	 wPq5aEzS4QYZ59r5jSArWbDkPeSqeqiJMQ7mbmTtMoCO88OzXmhraKLpRyAttaceGr
	 7oJKkW9W7QV6FI7VHJ6gBPo6dYmLQcQKnibXHwFM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23CC3F802DF;
	Mon,  7 Mar 2022 19:11:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64BC3F80518; Mon,  7 Mar 2022 19:11:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E954AF80124
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 19:11:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E954AF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GWM7xj89"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646676689; x=1678212689;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+swSm3wPEFZSVw9Cfp5+ZQJFB6mQEStIMYUvZ9tTVNk=;
 b=GWM7xj89AgudCQRHxgtboNm+W+R0+M+4x6Ly/fFWH69AJ8eV8Xtc/E8S
 nTmqhsaS/oE0UMRyWMnAeJ7GxJe5yShwXItQOf/1SBhpnYs8BNBrVAnMM
 Zp683AfMyjIdeRuoEMKdbMfFpbvCwudTH18Yx1MPff0NmDtiNbM8wOIWF
 BrAUORuOcJZy5K84F0sXUQGZZVvKJqr0yE2NRQpumdp/YbQN6V15/KoLp
 lFn6kyv6E5dzrrU++kb9ur3qF03Rh1+x35xZ/fBoignIwpt143WfqM6yR
 Nj77Vdsq4WVJIfssDX9XtlrVMbednZv7iJ+wkKT1rt9w5aIj6ULpiz2Y0 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254401311"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="254401311"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 10:11:25 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="495146656"
Received: from echun1-mobl.amr.corp.intel.com (HELO rsridh2-mobl1.localdomain)
 ([10.251.130.219])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 10:11:25 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/18] ASoC: SOF: simplify snd_sof_device_remove()
Date: Mon,  7 Mar 2022 10:10:55 -0800
Message-Id: <20220307181111.49392-3-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307181111.49392-1-ranjani.sridharan@linux.intel.com>
References: <20220307181111.49392-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
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

The commit "ASoC: SOF: core: Unregister machine driver before IPC and
debugfs" moved the call to unregister the machine driver to be done
before freeing the IPC. With this change, we can safely move the call to
snd_sof_remove() inside the same if() block just above.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/core.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 2a35d8ddf43e..95a845d26f6e 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -442,16 +442,8 @@ int snd_sof_device_remove(struct device *dev)
 
 		snd_sof_ipc_free(sdev);
 		snd_sof_free_debug(sdev);
-	}
-
-	/*
-	 * Unregistering the machine driver results in unloading the topology.
-	 * Some widgets, ex: scheduler, attempt to power down the core they are
-	 * scheduled on, when they are unloaded. Therefore, the DSP must be
-	 * removed only after the topology has been unloaded.
-	 */
-	if (sdev->fw_state > SOF_FW_BOOT_NOT_STARTED)
 		snd_sof_remove(sdev);
+	}
 
 	/* release firmware */
 	snd_sof_fw_unload(sdev);
-- 
2.25.1

