Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C583297A3
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 10:14:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C016116D8;
	Tue,  2 Mar 2021 10:13:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C016116D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614676461;
	bh=u8b94Jnzv4/bUuSrQLg7rO+vfKd6le5cSssK0adB2X4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=umrszbnyX/9YeJqMBBV+IBwOplEyCa3o62f9GA5HA4fELcmgbUWsNPVSuRUjc9yRR
	 /bvItAastv/S7WQVzE5nHOK5UUn1QvtcGB38hZ+Fd6aO0Rf3lNV99N/hvjopFQ8UyV
	 8mcYP4GSVobl8K526csWHIM++QpJRiHAaruhUjRU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91577F804AA;
	Tue,  2 Mar 2021 10:11:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A142BF804AB; Tue,  2 Mar 2021 10:11:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6095EF802E7
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 10:11:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6095EF802E7
IronPort-SDR: qaMA6crHUXcF4KiGNt6o96KXftz5TsQ+NIDyjuuTHkyaXfI5tsUuyPel+wJ7dbKn2tL7WWbLK9
 Vl6p1IjoVtvA==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="248158742"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="248158742"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 01:11:47 -0800
IronPort-SDR: diatfcj+ub+2RtUuCq3Qg2XOlluYUGy6NB/duZ1GrvVXEcfghhLbAT/iZguRNPFVRTd4EacJrn
 6yQQaWr8FylQ==
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="506262299"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 01:11:43 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 07/11] soundwire: generic_bandwidth_allocation: remove useless
 init
Date: Tue,  2 Mar 2021 17:11:18 +0800
Message-Id: <20210302091122.13952-8-yung-chuan.liao@linux.intel.com>
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

Cppcheck complains about two possible null pointer dereferences, but
it's more like there are unnecessary initializations before walking
through a list.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/generic_bandwidth_allocation.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index 0bdef38c9a30..f3d13bb2cefe 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -143,7 +143,7 @@ static void sdw_compute_master_ports(struct sdw_master_runtime *m_rt,
 static void _sdw_compute_port_params(struct sdw_bus *bus,
 				     struct sdw_group_params *params, int count)
 {
-	struct sdw_master_runtime *m_rt = NULL;
+	struct sdw_master_runtime *m_rt;
 	int hstop = bus->params.col - 1;
 	int block_offset, port_bo, i;
 
@@ -169,7 +169,7 @@ static int sdw_compute_group_params(struct sdw_bus *bus,
 				    struct sdw_group_params *params,
 				    int *rates, int count)
 {
-	struct sdw_master_runtime *m_rt = NULL;
+	struct sdw_master_runtime *m_rt;
 	int sel_col = bus->params.col;
 	unsigned int rate, bps, ch;
 	int i, column_needed = 0;
-- 
2.17.1

