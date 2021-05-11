Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF0E379D4E
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 05:03:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EBBF1776;
	Tue, 11 May 2021 05:02:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EBBF1776
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620702209;
	bh=O8lf/kyb2Lb4yaiYrREhrggDXAnnRVWdh9Shy4Er858=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qsqj+gyv8lru7RWL9wGqQgboojjTaMckcpHbN2PY3qB6PaoiLFEXnNSo4xqd76/ze
	 qKfzSNS2uutRmh1DmwzuLGhN+DWrLWcf+TXanzGQkEaIacHmAc7oXV0cT4sSGxnTrI
	 MtAVzr0ta9u2hs3R6378Y8VJoPfvBhHGd5zviB44=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B335F80482;
	Tue, 11 May 2021 05:01:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10943F80482; Tue, 11 May 2021 05:01:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33F87F800E9
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 05:01:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33F87F800E9
IronPort-SDR: a+4v62pNgf5QT8KNOsFoszfrNwx9zfMuHjHBBT+K0QuyDekNSJIUUJYCiX+ss5AtdM+DigKl2u
 jZobFuqXi+hQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="186784948"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="186784948"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 20:01:08 -0700
IronPort-SDR: tJP5K7eGhmicQRWS4KhYBSzq2e6FYZQfBD5Bu9oGnWc2jz03U89I4R3rbYB9Un4M9Q53YxOpbG
 4/h/gCfIB7XA==
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="436431142"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 20:01:03 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [RESEND PATCH 2/4] soundwire: add missing kernel-doc description
Date: Tue, 11 May 2021 11:00:46 +0800
Message-Id: <20210511030048.25622-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210511030048.25622-1-yung-chuan.liao@linux.intel.com>
References: <20210511030048.25622-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, sanyog.r.kale@intel.com, rander.wang@linux.intel.com,
 bard.liao@intel.com
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

For some reason we never added a description for the clk_stop
callback.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/linux/soundwire/sdw.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 5d93d9949653..8ca736e92d5a 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -612,6 +612,7 @@ struct sdw_bus_params {
  * @update_status: Update Slave status
  * @bus_config: Update the bus config for Slave
  * @port_prep: Prepare the port with parameters
+ * @clk_stop: handle imp-def sequences before and after prepare and de-prepare
  */
 struct sdw_slave_ops {
 	int (*read_prop)(struct sdw_slave *sdw);
-- 
2.17.1

