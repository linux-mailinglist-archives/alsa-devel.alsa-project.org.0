Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B3749C07F
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 02:16:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91ABA1F73;
	Wed, 26 Jan 2022 02:16:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91ABA1F73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643159818;
	bh=4ie7NmQiHe1ezeLtR9C2w+62rfFvkBb3pIYs6EglC0g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z1hNJEGb/dyVXtwgOP7uQx2iy5iKXV2ZAW6fo4ZaHpBBdBg0OL8S+KnuYzNzdPYsR
	 sY04x0Zj1AdH2QVl4l5lX+SCkR6+R2dnOYxKy0PwDTaX59X+jjplwUthPWyk/9DV+V
	 4vf5/nQlQsQsMnP+/5x4UFeo462F08/0yB6vqxUA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80AEFF804D6;
	Wed, 26 Jan 2022 02:15:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDA5FF804D2; Wed, 26 Jan 2022 02:15:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDAFBF80118
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 02:15:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDAFBF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="k1R8vndN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643159744; x=1674695744;
 h=from:to:cc:subject:date:message-id;
 bh=4ie7NmQiHe1ezeLtR9C2w+62rfFvkBb3pIYs6EglC0g=;
 b=k1R8vndNNZL0xL7CPyHM2UmCgb6fbfS6z7rANRXohSmlN5CXdYdlfpZx
 Yo/poATUdo4GmdRGxsTBQX1PXt203+wih8EC2/KEo6KO27yxBp+yJ+Y4L
 7JLgQjgyss74eVH3rR6VC78HGvABqihEycx7MfK/DR3HkDa1cAlb68O8z
 mrDnLZbqvK+VXUjVwAqq/fiWk6CYc6pa0MuGBe0R9SzLqx0Lee8UdZYld
 cFP/9/BeuEZVqtrCfer3ee08WsHKcgawBkBpu3rByqzQYsEtP6nCwfyPN
 ACT0mvW/l8aNO8sXV4AeSYlLPzMQJN/+V0F8RL1nPXEjHMr1YeAvK7N3X g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="246235779"
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="246235779"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:15:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="520616673"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:15:35 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH] soundwire: bus: add dev_warn() messages to track UNATTACHED
 devices
Date: Wed, 26 Jan 2022 09:15:27 +0800
Message-Id: <20220126011527.27930-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
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

In rare cases, some devices seem to lose sync and never re-attach on
the bus. This seems to happen only when there are more than one device
per link, which suggests either an electrical issue, a race condition
or a state machine issue.

Add two dev_warn() messages to identify the sequence by which the
devices become UNATTACHED.

BugLink: https://github.com/thesofproject/linux/issues/3063
BugLink: https://github.com/thesofproject/linux/issues/3325
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 67369e941d0d..354d3f89366f 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1749,8 +1749,11 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 			continue;
 
 		if (status[i] == SDW_SLAVE_UNATTACHED &&
-		    slave->status != SDW_SLAVE_UNATTACHED)
+		    slave->status != SDW_SLAVE_UNATTACHED) {
+			dev_warn(&slave->dev, "Slave %d state check1: UNATTACHED, status was %d\n",
+				 i, slave->status);
 			sdw_modify_slave_status(slave, SDW_SLAVE_UNATTACHED);
+		}
 	}
 
 	if (status[0] == SDW_SLAVE_ATTACHED) {
@@ -1785,6 +1788,9 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 			if (slave->status == SDW_SLAVE_UNATTACHED)
 				break;
 
+			dev_warn(&slave->dev, "Slave %d state check2: UNATTACHED, status was %d\n",
+				 i, slave->status);
+
 			sdw_modify_slave_status(slave, SDW_SLAVE_UNATTACHED);
 			break;
 
-- 
2.17.1

