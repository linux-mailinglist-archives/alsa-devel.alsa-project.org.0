Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2851534571A
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 06:09:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7C2F1666;
	Tue, 23 Mar 2021 06:08:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7C2F1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616476179;
	bh=Io/EBNVTMrO//pfaHAYNioSnX9bnJyarNMWR7iUKDmY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HoW4OgC09JSg7k23DWLw1BCsj6NcLfuP874ZdjBct7eQwWeXLomGZStLOpAx9TpWy
	 wbvXjJtU59ko/w/AX/0NQqj3e6GZP6fNiufv2emUPEzIAuN1dYEFEwNzVC5sjDUklX
	 GL3UIK3K3ewLPsnGJVhvDlnmCmNpPCMRrWr5qwKA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71DC1F8032B;
	Tue, 23 Mar 2021 06:07:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C311F80279; Tue, 23 Mar 2021 06:07:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6854F80104
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 06:07:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6854F80104
IronPort-SDR: QOu7VG/aNmGNRzuhAYNOJFtKzRnTdo8B8e2sYq8Vz7R7KUgr6kJSiSD2afpCmcwY6WrnbG2xoF
 soo0ADl9tFOQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="189805381"
X-IronPort-AV: E=Sophos;i="5.81,270,1610438400"; d="scan'208";a="189805381"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 22:07:15 -0700
IronPort-SDR: ORhGNnLvWrKqcytRTtntQASQ+7d4gEOfCydSg05SVlLpO+0R9oOy7Geh6uPk7h1FGaNHwVFEaq
 gQAGfW4ALgFA==
X-IronPort-AV: E=Sophos;i="5.81,270,1610438400"; d="scan'208";a="414800911"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 22:07:13 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 2/2] soundwire: generic_allocation: fix confusion between
 group and packing
Date: Tue, 23 Mar 2021 13:07:01 +0800
Message-Id: <20210323050701.23760-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210323050701.23760-1-yung-chuan.liao@linux.intel.com>
References: <20210323050701.23760-1-yung-chuan.liao@linux.intel.com>
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

The existing code makes no sense, we multiply a channel number by
zero (SDW_BLK_GRP_CNT_1), and the result is used to configure the
block packing mode. Sampling grouping and channel packing are two
separate concepts in SoundWire.

In addition, the bandwidth allocation allocates a vertical slice for
each stream, which makes the use of the PER_CHANNEL packing mode
irrelevant.

Let's use the proper definition for block packing mode (PER_PORT).

This change has no functional impact though since the net result is
the same configuration of the DPN_BlockCtrl3 register, when
implemented.

Reported-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/generic_bandwidth_allocation.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index 0bdef38c9a30..0d1b8ee02713 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -62,7 +62,7 @@ static void sdw_compute_slave_ports(struct sdw_master_runtime *m_rt,
 					      sample_int, port_bo, port_bo >> 8,
 					      t_data->hstart,
 					      t_data->hstop,
-					      (SDW_BLK_GRP_CNT_1 * ch), 0x0);
+					      SDW_BLK_PKG_PER_PORT, 0x0);
 
 			sdw_fill_port_params(&p_rt->port_params,
 					     p_rt->num, bps,
@@ -95,7 +95,7 @@ static void sdw_compute_master_ports(struct sdw_master_runtime *m_rt,
 	struct sdw_bus *bus = m_rt->bus;
 	struct sdw_bus_params *b_params = &bus->params;
 	int sample_int, hstart = 0;
-	unsigned int rate, bps, ch, no_ch;
+	unsigned int rate, bps, ch;
 
 	rate = m_rt->stream->params.rate;
 	bps = m_rt->stream->params.bps;
@@ -110,12 +110,11 @@ static void sdw_compute_master_ports(struct sdw_master_runtime *m_rt,
 	t_data.hstart = hstart;
 
 	list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
-		no_ch = sdw_ch_mask_to_ch(p_rt->ch_mask);
 
 		sdw_fill_xport_params(&p_rt->transport_params, p_rt->num,
 				      false, SDW_BLK_GRP_CNT_1, sample_int,
 				      port_bo, port_bo >> 8, hstart, hstop,
-				      (SDW_BLK_GRP_CNT_1 * no_ch), 0x0);
+				      SDW_BLK_PKG_PER_PORT, 0x0);
 
 		sdw_fill_port_params(&p_rt->port_params,
 				     p_rt->num, bps,
-- 
2.17.1

