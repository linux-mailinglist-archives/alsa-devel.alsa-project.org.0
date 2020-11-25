Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCED2C3949
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Nov 2020 07:48:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CB6F171B;
	Wed, 25 Nov 2020 07:47:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CB6F171B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606286885;
	bh=mRqHZOQEeYtIMjxy/buEM7vxirHzoTybe8DB10o9lAE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=viJfkyfqdvWZgqQLBmuDsbm4PAMpDnvjccRz93MFfm3dXtOvNlJmlndZmTZvVe8Wz
	 kxVsqrgHM/XCNGfuKcpaAYTZpbGQxSrGpUM1UlRfaF6eziUsBTCLxfkyxxUpICXxxb
	 AcplPTiVKZ8Knny2nS4NSmClB+nnq3eXzVgYWTgA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 086F6F8015A;
	Wed, 25 Nov 2020 07:46:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA292F8019D; Wed, 25 Nov 2020 07:46:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8213F8015A
 for <alsa-devel@alsa-project.org>; Wed, 25 Nov 2020 07:46:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8213F8015A
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cgrxs0FjzzkfbD;
 Wed, 25 Nov 2020 14:45:53 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Wed, 25 Nov 2020 14:46:12 +0800
From: Qinglang Miao <miaoqinglang@huawei.com>
To: Vinod Koul <vkoul@kernel.org>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [PATCH] soundwire: Fix error return code in sdw_compute_port_params
Date: Wed, 25 Nov 2020 14:50:35 +0800
Message-ID: <20201125065035.154262-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Qinglang
 Miao <miaoqinglang@huawei.com>
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

Fix to return the error code -EINVAL in sdw_compute_port_params
instead of 0.

Fixes: 9026118f20e2 ("soundwire: Add generic bandwidth allocation algorithm")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/soundwire/generic_bandwidth_allocation.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index 0bdef38c9..ad857ac62 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -283,8 +283,10 @@ static int sdw_compute_port_params(struct sdw_bus *bus)
 	if (ret < 0)
 		return ret;
 
-	if (group.count == 0)
+	if (group.count == 0) {
+		ret = -EINVAL;
 		goto out;
+	}
 
 	params = kcalloc(group.count, sizeof(*params), GFP_KERNEL);
 	if (!params) {
-- 
2.23.0

