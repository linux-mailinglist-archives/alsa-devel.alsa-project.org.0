Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6F834A41E
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 10:19:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7060E167F;
	Fri, 26 Mar 2021 10:18:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7060E167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616750379;
	bh=/6ANwlDc4le5tl2ipjxF62e0gu3Xt9Yl6v/gm/2Vfe4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HrmTxBGhzY8vYc63DDnjDVh9eDjNv5AIniIgZHJhYCe9vLInysI/7LzyLtAvxfMru
	 HCbJVW9uRG5ZEniOI9QqqPkrjjoVVOBeRxIalXJmQHCdZXkoeegoGIW7Qg6ZiDHYQw
	 fEg/gey6FxzFbsC2Rom3SEQW1tpS/wWWEIz2YdIU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0553F804B0;
	Fri, 26 Mar 2021 10:16:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 059F8F804B0; Fri, 26 Mar 2021 10:16:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D87CEF80424
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 10:15:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D87CEF80424
IronPort-SDR: MCPZ13slDBpueQ3iJCJw5dshV9VrLvFICK91aSbv2P97WQ6nkCjPbJVJd75AtfRXtzh4vmd/20
 dZrf8PzXrPdg==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="276249459"
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; d="scan'208";a="276249459"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 02:15:52 -0700
IronPort-SDR: XSD5f+12Su5E5ckV7faLA+qNnmQ/U9hChr6EiJCQaYSo5zSEXmHhMlcVN5lp74hkvH40swKIaa
 b1Qpq8uUNYsg==
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; d="scan'208";a="416463219"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 02:15:48 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [RESEND PATCH 08/11] soundwire: intel: remove useless readl
Date: Fri, 26 Mar 2021 17:15:11 +0800
Message-Id: <20210326091514.20751-9-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210326091514.20751-1-yung-chuan.liao@linux.intel.com>
References: <20210326091514.20751-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

Cppcheck complains:

drivers/soundwire/intel.c:564:15: style: Variable 'link_control' is
assigned a value that is never used. [unreadVariable]
 link_control = intel_readl(shim, SDW_SHIM_LCTL);

This looks like a leftover from a previous version, remove.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index e2e95115832a..fd95f94630b1 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -561,8 +561,6 @@ static int intel_link_power_down(struct sdw_intel *sdw)
 		ret = intel_clear_bit(shim, SDW_SHIM_LCTL, link_control, cpa_mask);
 	}
 
-	link_control = intel_readl(shim, SDW_SHIM_LCTL);
-
 	mutex_unlock(sdw->link_res->shim_lock);
 
 	if (ret < 0) {
-- 
2.17.1

