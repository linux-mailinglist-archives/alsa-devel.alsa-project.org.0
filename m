Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 146AD49C07C
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 02:16:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B6141F67;
	Wed, 26 Jan 2022 02:15:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B6141F67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643159782;
	bh=cH0XyDQ4K5w193zV62nuPqzVps5xaLQVLtjpTPjw14E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dn9mr1H4hUjvTrun5ivU7pKrFs+xy2DNMmkYmxiTVTb1pymJpFiZbDv/kqAOMyA3N
	 c0aVsQQb+KkZM2m+QO5TpAzbagdFrxPMmXWewBO8MloOU/CNLM9GhsqQz9aMlDvbaz
	 L7BzkYlFnuBszPtp1WSa9ZCKldy7HidS2hMpkIZI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCF73F804CF;
	Wed, 26 Jan 2022 02:15:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AFF4F804C3; Wed, 26 Jan 2022 02:15:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9296EF80161
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 02:15:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9296EF80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fUgP4Tmb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643159710; x=1674695710;
 h=from:to:cc:subject:date:message-id;
 bh=cH0XyDQ4K5w193zV62nuPqzVps5xaLQVLtjpTPjw14E=;
 b=fUgP4TmbLSH4bSUwwDa4QSqUDqmwKOe4rDiMlncLL1ga9v36QQfkpn5N
 BNAtvyR09hm83+GTAuT+Sh4zDfLGawlwBI0q/pt4jEV1Tv4iT0NM1oBAB
 Jss2VOcEgickp3IhAb5MXLOU5gUafKk9RtaTO4cdKQt9F8ppscBrCYcVu
 n8sJdTgmBy/Mo1lIRhlzjnbupyPERz34DGjPpRpONm6r9O/l8QFfxHcQI
 e9U6yflYxqOMrqLt8pDVN3nIXh0VVGvw+Df0bLGBzJFZMSzrKPfmsiS9J
 oAD1dUafnil6P3mDAyk6oNWLhq33v1hqdfPQ5/SW/Z/ETYRw37XKTUa7b Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="230030640"
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="230030640"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:15:03 -0800
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="479719122"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:15:00 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH] soundwire: intel: fix wrong register name in intel_shim_wake
Date: Wed, 26 Jan 2022 09:14:51 +0800
Message-Id: <20220126011451.27853-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: libin.yang@intel.com, vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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

From: Libin Yang <libin.yang@intel.com>

When clearing the sdw wakests status, we should use SDW_SHIM_WAKESTS.

Fixes: 4a17c441c7cb ("soundwire: intel: revisit SHIM programming sequences.")
Signed-off-by: Libin Yang <libin.yang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 122f7a29d8ca..63101f1ba271 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -448,8 +448,8 @@ static void intel_shim_wake(struct sdw_intel *sdw, bool wake_enable)
 
 		/* Clear wake status */
 		wake_sts = intel_readw(shim, SDW_SHIM_WAKESTS);
-		wake_sts |= (SDW_SHIM_WAKEEN_ENABLE << link_id);
-		intel_writew(shim, SDW_SHIM_WAKESTS_STATUS, wake_sts);
+		wake_sts |= (SDW_SHIM_WAKESTS_STATUS << link_id);
+		intel_writew(shim, SDW_SHIM_WAKESTS, wake_sts);
 	}
 	mutex_unlock(sdw->link_res->shim_lock);
 }
-- 
2.17.1

