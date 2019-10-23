Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 224BBE25CE
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 23:55:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7BB71657;
	Wed, 23 Oct 2019 23:54:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7BB71657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571867724;
	bh=khjMBdJovERBuuEj7ZL6sK7b9cvxIj/RrSIkygMRNYY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BvSZB5LWauGPBeqHUbw3vHpmxqdLRHTxI21449QkXNPpK2Pt3B+OXRmIq7WK6mmqz
	 tvg9nodwZsdHwvsCzVITCGjcjrNF6DY3RNKukf8aAD/2m+UhON4oW80eAGGqlcCnug
	 MBpMJOLWMWCOiN0xZmwgSI+DPusrswHKLCQX6maU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D51CF806F7;
	Wed, 23 Oct 2019 23:46:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4015CF806E9; Wed, 23 Oct 2019 23:46:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC7F1F8067C
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 23:46:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC7F1F8067C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Oct 2019 14:46:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,222,1569308400"; d="scan'208";a="196908221"
Received: from ayamada-mobl1.gar.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.95.208])
 by fmsmga008.fm.intel.com with ESMTP; 23 Oct 2019 14:46:33 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 23 Oct 2019 16:45:54 -0500
Message-Id: <20191023214601.883-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191023214601.883-1-pierre-louis.bossart@linux.intel.com>
References: <20191023214601.883-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH 11/18] soundwire: bus: check first if Slaves
	become UNATTACHED
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Before checking for the presence of Device0, we first need to clean-up
the internal state of Slaves that are no longer attached.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/bus.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 17c744c0ff4c..65521c2ed2e1 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1033,6 +1033,24 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 	struct sdw_slave *slave;
 	int i, ret = 0;
 
+	/* first check if any Slaves fell off the bus */
+	for (i = 1; i <= SDW_MAX_DEVICES; i++) {
+		mutex_lock(&bus->bus_lock);
+		if (test_bit(i, bus->assigned) == false) {
+			mutex_unlock(&bus->bus_lock);
+			continue;
+		}
+		mutex_unlock(&bus->bus_lock);
+
+		slave = sdw_get_slave(bus, i);
+		if (!slave)
+			continue;
+
+		if (status[i] == SDW_SLAVE_UNATTACHED &&
+		    slave->status != SDW_SLAVE_UNATTACHED)
+			sdw_modify_slave_status(slave, SDW_SLAVE_UNATTACHED);
+	}
+
 	if (status[0] == SDW_SLAVE_ATTACHED) {
 		dev_dbg(bus->dev, "Slave attached, programming device number\n");
 		ret = sdw_program_device_num(bus);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
