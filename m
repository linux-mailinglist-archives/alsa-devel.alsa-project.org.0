Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FE7379F3D
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 07:38:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 113C31779;
	Tue, 11 May 2021 07:37:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 113C31779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620711512;
	bh=MbfE/QHGPak3hNof3QTE3IItBx2XoFbf/I6uuUloYVQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Szi7H5HjMNc3n0cBls4aCa7/Ksx5lVecZMpyGjEoXf8fBZim09vT5fciRse8ZfJys
	 ckG3jMwJYUB0zbq03cPzN9l6cXRekp/wcFf1yfFQHdtcUMsYsJ8k+T1W56bdPutBve
	 YMBlXydIBR9q5MfLboIp/saFyRR4EYQgvTZoIve4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F533F8013A;
	Tue, 11 May 2021 07:37:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7685CF80163; Tue, 11 May 2021 07:37:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42258F800E9
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 07:36:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42258F800E9
IronPort-SDR: AhRXDPDqMOIaMuBFHsDJyA7HHfipZNWf5HuXRxm9QZRXr+jgcAknEkubPfE3PVOq8+ag69dE16
 uQ56xR7u2z1Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="197378054"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="197378054"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 22:36:50 -0700
IronPort-SDR: SYbQKa5drIbm+oE86mUS4EN3+RL+C3rShrYShk3Yri4qNpU4ttMYi2pEn/Q4OM6otH0bOplS8m
 IFH2tVh984+g==
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="536823754"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 22:36:47 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [RESEND PATCH] soundwire: add slave device to linked list after
 device_register()
Date: Tue, 11 May 2021 13:36:39 +0800
Message-Id: <20210511053639.28550-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
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

We currently add the slave device to a linked list before
device_register(), and then remove it if device_register() fails.

It's not clear why this sequence was necessary, this patch moves the
linked list management to after the device_register().

Suggested-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/slave.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index 0eed38a79c6d..ff01b96c6e56 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -65,9 +65,6 @@ int sdw_slave_add(struct sdw_bus *bus,
 	for (i = 0; i < SDW_MAX_PORTS; i++)
 		init_completion(&slave->port_ready[i]);
 
-	mutex_lock(&bus->bus_lock);
-	list_add_tail(&slave->node, &bus->slaves);
-	mutex_unlock(&bus->bus_lock);
 
 	ret = device_register(&slave->dev);
 	if (ret) {
@@ -77,13 +74,15 @@ int sdw_slave_add(struct sdw_bus *bus,
 		 * On err, don't free but drop ref as this will be freed
 		 * when release method is invoked.
 		 */
-		mutex_lock(&bus->bus_lock);
-		list_del(&slave->node);
-		mutex_unlock(&bus->bus_lock);
 		put_device(&slave->dev);
 
 		return ret;
 	}
+
+	mutex_lock(&bus->bus_lock);
+	list_add_tail(&slave->node, &bus->slaves);
+	mutex_unlock(&bus->bus_lock);
+
 	sdw_slave_debugfs_init(slave);
 
 	return ret;
-- 
2.17.1

