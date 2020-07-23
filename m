Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 747C422BBA7
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jul 2020 03:45:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7A3A1689;
	Fri, 24 Jul 2020 03:44:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7A3A1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595555118;
	bh=IugLuwNTnpeyJ/dUIwFp9hin5OK3mhtRj2U7EjPaC+A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a2JFriNY2yUbOVuNtFdqx7IG+/Mv4dIxrd60s6AgLTs2ipY0YK/Db2SxHAvl4GKzJ
	 Lg8MMcqfl3749OYecd+ZhpKn2WMSDVbgtD+caFYfRniFe/L6Gxu6KJ0mhwSMifUF7D
	 a8PMbWVzbax5JC0MLwQNOWgenEkaeeTLS5JMHtlg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2620EF800CE;
	Fri, 24 Jul 2020 03:43:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C78E8F8014C; Fri, 24 Jul 2020 03:43:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48E5DF800CE
 for <alsa-devel@alsa-project.org>; Fri, 24 Jul 2020 03:43:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48E5DF800CE
IronPort-SDR: 8CTL85ct3zJuhW0XQ/s0IQBsOe1n5J7EuOG4vDeqKwcPMZ1qwF7sviTZ45dwX8Npy4pfF7GBKD
 Qtr7flIwQzeg==
X-IronPort-AV: E=McAfee;i="6000,8403,9691"; a="212180917"
X-IronPort-AV: E=Sophos;i="5.75,388,1589266800"; d="scan'208";a="212180917"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2020 18:43:21 -0700
IronPort-SDR: T7YYDmQ9wjOSJPYKP8f87ewHjV5UJCnwN4NR7F+wP9L2IS9xMbwIg33+hd3/h7ojvQvZD3NB9Z
 GU0QbpLoGiCw==
X-IronPort-AV: E=Sophos;i="5.75,388,1589266800"; d="scan'208";a="463063485"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2020 18:43:17 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH] soundwire: master: enable pm runtime
Date: Thu, 23 Jul 2020 21:49:02 +0800
Message-Id: <20200723134902.26290-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
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

We should enable pm runtime.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/master.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soundwire/master.c b/drivers/soundwire/master.c
index 5f0b2189defe..3488bb824e84 100644
--- a/drivers/soundwire/master.c
+++ b/drivers/soundwire/master.c
@@ -154,6 +154,7 @@ int sdw_master_device_add(struct sdw_bus *bus, struct device *parent,
 	bus->dev = &md->dev;
 	bus->md = md;
 
+	pm_runtime_enable(&bus->md->dev);
 device_register_err:
 	return ret;
 }
@@ -166,6 +167,7 @@ int sdw_master_device_add(struct sdw_bus *bus, struct device *parent,
  */
 int sdw_master_device_del(struct sdw_bus *bus)
 {
+	pm_runtime_disable(&bus->md->dev);
 	device_unregister(bus->dev);
 
 	return 0;
-- 
2.17.1

