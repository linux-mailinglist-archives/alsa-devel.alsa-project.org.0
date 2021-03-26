Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA0834A41C
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 10:18:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 123C01616;
	Fri, 26 Mar 2021 10:18:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 123C01616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616750335;
	bh=ENTpHK6VGrD+ljZ8D1fLqkhMfemtgnKSTxiRwa1aUUg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BBr6p7ViGIKZcwEBe+4wbSkp0BgD+PrtMGOZDXVATDv9OX2cbREneGHy2gXIMM8ZW
	 s0jmVIaYnDrbpw2ThCxh9WZiX+nzJxukAVuy6vJNCtXbYr/hO/vr7RIqO58aHOWXnd
	 n7kG8o7+W0kD3GirGiebBc3vhk5e5mnQkuzYxPps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1BDFF804AE;
	Fri, 26 Mar 2021 10:16:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB307F80482; Fri, 26 Mar 2021 10:15:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03E9BF802E3
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 10:15:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03E9BF802E3
IronPort-SDR: 8Rm5261D1HA1qv5U6mVFn/G3qNUX11DOYhs3iFEMD/hBR/exXoKsA+3BG8xGITGu1z/p6U4+2D
 NzzyiMN/PxTA==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="276249454"
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; d="scan'208";a="276249454"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 02:15:48 -0700
IronPort-SDR: gknePH7WVlzzkNOKPcLV7P5BbGCZwE5pT/6APW03UVEmTyT4+2sy2ISqzONPsn/oPruZKDu8tp
 P3t0eGQA3IuQ==
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; d="scan'208";a="416463209"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 02:15:45 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [RESEND PATCH 07/11] soundwire: generic_bandwidth_allocation: remove
 useless init
Date: Fri, 26 Mar 2021 17:15:10 +0800
Message-Id: <20210326091514.20751-8-yung-chuan.liao@linux.intel.com>
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
index a9abb9722fde..805f5b6ebe86 100644
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

