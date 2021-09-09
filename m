Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 881C9404C91
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Sep 2021 13:56:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A859171C;
	Thu,  9 Sep 2021 13:56:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A859171C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631188615;
	bh=GiDCcw8EAI/e3m9h772NNoRn4DlkDc9x34kowoRI6tw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PacdVYMwLSHOErt6shultQW+iXOBvZ6DfW134S7dGGERVBabTGEdwtav0sF2AwDDh
	 NWPxzTJz9IptgUODVJbzcWKIMEYaDLUxteEtlUhlPNs2wz/kMhAdXpl2c7vdPJvX5w
	 WkMfwa5CnvPv99SKsj9rbxPiJjswDP4T0MFKLvrc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2041F804CF;
	Thu,  9 Sep 2021 13:54:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9872F8050F; Thu,  9 Sep 2021 13:54:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74339F804CF
 for <alsa-devel@alsa-project.org>; Thu,  9 Sep 2021 13:54:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74339F804CF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UHChcJ+C"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8249F61B98;
 Thu,  9 Sep 2021 11:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631188462;
 bh=GiDCcw8EAI/e3m9h772NNoRn4DlkDc9x34kowoRI6tw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UHChcJ+Czi/WKbL3W7hUI4bMYD4NsdYvFZlF2VpTlyAfaFr5wtyrBt1vQOBrjA+uE
 KGqDwpcUUYacpINA5uTsbqOPLgtnmAFIOXkFOJaYP05dwD6DOzfgCZgrk7YLi7EjZz
 V2e1y6IO3jcyyKvPmCrs5YwRBQ0x/3caUrHVB7yMiTYjCzgJGZ500N8ARMawgFxwDk
 I/iH7LYL6zlEBcm2O77APBUj7hr5oKo6u7Hu0yKYNhYKZGXUPjBUW+IkgyeXwRLCID
 SSlFLgy4eKffQEWmHEWkOcjqJsv4RFAN3ZOVoxmda/1YRqkPLRfcr4UPiOmZ9joDOR
 38dfzf8PGw32Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 142/176] soundwire: intel: fix potential race
 condition during power down
Date: Thu,  9 Sep 2021 07:50:44 -0400
Message-Id: <20210909115118.146181-142-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909115118.146181-1-sashal@kernel.org>
References: <20210909115118.146181-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
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

[ Upstream commit ea6942dad4b2a7e1735aa0f10f3d0b04b847750f ]

The power down sequence sets the link_up flag as false outside of the
mutex_lock. This is potentially unsafe.

In additional the flow in that sequence can be improved by first
testing if the link was powered, setting the link_up flag as false and
proceeding with the power down. In case the CPA bits cannot be
cleared, we only flag an error since we cannot deal with interrupts
any longer.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20210818024954.16873-2-yung-chuan.liao@linux.intel.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soundwire/intel.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 6a1e862b16c3..dad4326a2a71 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -537,12 +537,14 @@ static int intel_link_power_down(struct sdw_intel *sdw)
 
 	mutex_lock(sdw->link_res->shim_lock);
 
-	intel_shim_master_ip_to_glue(sdw);
-
 	if (!(*shim_mask & BIT(link_id)))
 		dev_err(sdw->cdns.dev,
 			"%s: Unbalanced power-up/down calls\n", __func__);
 
+	sdw->cdns.link_up = false;
+
+	intel_shim_master_ip_to_glue(sdw);
+
 	*shim_mask &= ~BIT(link_id);
 
 	if (!*shim_mask) {
@@ -559,20 +561,21 @@ static int intel_link_power_down(struct sdw_intel *sdw)
 		link_control &=  spa_mask;
 
 		ret = intel_clear_bit(shim, SDW_SHIM_LCTL, link_control, cpa_mask);
+		if (ret < 0) {
+			dev_err(sdw->cdns.dev, "%s: could not power down link\n", __func__);
+
+			/*
+			 * we leave the sdw->cdns.link_up flag as false since we've disabled
+			 * the link at this point and cannot handle interrupts any longer.
+			 */
+		}
 	}
 
 	link_control = intel_readl(shim, SDW_SHIM_LCTL);
 
 	mutex_unlock(sdw->link_res->shim_lock);
 
-	if (ret < 0) {
-		dev_err(sdw->cdns.dev, "%s: could not power down link\n", __func__);
-
-		return ret;
-	}
-
-	sdw->cdns.link_up = false;
-	return 0;
+	return ret;
 }
 
 static void intel_shim_sync_arm(struct sdw_intel *sdw)
-- 
2.30.2

