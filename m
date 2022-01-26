Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D8C49C09F
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 02:19:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C62431F80;
	Wed, 26 Jan 2022 02:19:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C62431F80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643159991;
	bh=hRyebvpUmOlSx2YqWY7Ev21ywUBSfmUTYJfGzoRDvXo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qDnQB2Olur/ACHpq2TOhyWG5/RQmftSIT/lIcOxmNrRDDN0D/q4NbmFB+cWqsXALn
	 Xvv34/HBVbOwhf5r1eykrwyUSKLdUw4Jz0fve0P9x66E7oyD8BvTKt/0BnEHWgVmYJ
	 COT2eskiuXeiJMz4uoGSF0PgaFIHV/gbeTGEeWZk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A3B8F80169;
	Wed, 26 Jan 2022 02:17:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A748BF80515; Wed, 26 Jan 2022 02:17:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9C03F80161
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 02:17:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9C03F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="bZOWJp5f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643159864; x=1674695864;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=hRyebvpUmOlSx2YqWY7Ev21ywUBSfmUTYJfGzoRDvXo=;
 b=bZOWJp5fCLhHoag+Qbb5azHFvVmCB847zbmZEhWi1ucIQTOY0ci2HRN1
 PJOwMhXaOLBc70rh2v6e1AstgLG3+TZaArdu7oz0nuuFh9Pp73WnJfSAW
 E176xw2Hy3ACSECqVZyli5Nh/c5dKOX/xLoUK3MdovPWnZYzgBJamHR5A
 Xn+3nZ+T91AYM59qdqcG3MOQsnNoLwSaSAj+ZPOMEAkr6lQWH9FQ+vKno
 T+ak82juUwnEKPCyM4E4KRf9LsiGa7vDiPFFxvWVqhtVFW5Jc4ON+Gv8M
 8FYTHx5lwRZjaaWBNIX/yiH6bRuEnSKDYQD/NHC5cJgyjfF9xcOU/pfCt g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="246236143"
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="246236143"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:17:42 -0800
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="520617427"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:17:40 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 05/19] soundwire: stream: split port allocation and
 configuration loops
Date: Wed, 26 Jan 2022 09:17:01 +0800
Message-Id: <20220126011715.28204-6-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220126011715.28204-1-yung-chuan.liao@linux.intel.com>
References: <20220126011715.28204-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Split loops before moving the allocation and configuration to separate
functions.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/stream.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 49d3a8d2fa31..b97c59e71bdb 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1232,10 +1232,14 @@ static int sdw_master_port_config(struct sdw_bus *bus,
 		p_rt = sdw_port_alloc(&m_rt->port_list);
 		if (!p_rt)
 			return -ENOMEM;
+	}
 
+	i = 0;
+	list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
 		ret = sdw_port_config(p_rt, port_config, i);
 		if (ret < 0)
 			return ret;
+		i++;
 	}
 
 	return 0;
@@ -1254,7 +1258,10 @@ static int sdw_slave_port_config(struct sdw_slave *slave,
 		p_rt = sdw_port_alloc(&s_rt->port_list);
 		if (!p_rt)
 			return -ENOMEM;
+	}
 
+	i = 0;
+	list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
 		/*
 		 * TODO: Check valid port range as defined by DisCo/
 		 * slave
@@ -1266,6 +1273,7 @@ static int sdw_slave_port_config(struct sdw_slave *slave,
 		ret = sdw_port_config(p_rt, port_config, i);
 		if (ret < 0)
 			return ret;
+		i++;
 	}
 
 	return 0;
-- 
2.17.1

