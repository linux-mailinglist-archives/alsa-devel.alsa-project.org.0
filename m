Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DC43297AB
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 10:16:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7FAD16BB;
	Tue,  2 Mar 2021 10:15:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7FAD16BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614676589;
	bh=9KT+w93KTy5ENJKgfjnvzdJis87AamX4d4gRLnTV/hA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bz0wRWhxotsGtFMr4jh5bPSsJt/LvVwLTLNVjNQ/Is/ZIxCMnECEG3C0xmR5n5JzM
	 3bg9Kb1u5CLAy0qpOS+LP8P/JSTws4BE//rXJHbMDaYFWeyvEWTquyORCzznFIrq4e
	 itXb0JnSddQV7f4H2feHD7j5ELsC94d6SAy9JkVE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3FB6F804D8;
	Tue,  2 Mar 2021 10:12:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 452C1F804B4; Tue,  2 Mar 2021 10:12:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA480F8032B
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 10:11:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA480F8032B
IronPort-SDR: uvS6dmjygtQZSTiqIebtMNTCCmUozfXZhDE5AHmDA+HuWZHcLyqfIhZkDUBJRauqqFo5GADT7H
 5JUTxvmC+Quw==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="248158756"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="248158756"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 01:11:51 -0800
IronPort-SDR: KgYWTwh08+pPyn4a4PmkGflP+Mvi0ke37e/PsvjTaDOucb/LgfGOWD0bdVxKWJ5EzpR/Fq29wT
 j1GJWUjt0ZPw==
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="506262312"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 01:11:47 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 08/11] soundwire: intel: remove useless readl
Date: Tue,  2 Mar 2021 17:11:19 +0800
Message-Id: <20210302091122.13952-9-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210302091122.13952-1-yung-chuan.liao@linux.intel.com>
References: <20210302091122.13952-1-yung-chuan.liao@linux.intel.com>
Cc: vkoul@kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
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
index a2d5cdaa9998..608fbe3eb22e 100644
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

