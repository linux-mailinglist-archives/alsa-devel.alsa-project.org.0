Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAF611C2A9
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 02:47:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2CC71691;
	Thu, 12 Dec 2019 02:47:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2CC71691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576115273;
	bh=amrqqRX5wteWEjhOBJjhzJNPzmCqY0Nh2r/8Ag9LLko=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MgmQrPb+2ElIIhfLR64LuRVpOYYli0J6NtUbgtkEXGTlZxnFNEx3yAde4p1f84X4E
	 zOOYgTx1xP7SlyrumNsQvi1wv+Ib3n0ts6HHgP+5lD5Zt6Vx4GMG+y3/65AtiM1xUL
	 4CX20tBydjF4liyLzWkzQ8RzhlxZ3bduJsZCsth0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 023D8F80258;
	Thu, 12 Dec 2019 02:45:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62F9CF8023F; Thu, 12 Dec 2019 02:45:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C05C0F8011E
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 02:45:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C05C0F8011E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Dec 2019 17:45:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,303,1571727600"; d="scan'208";a="296446043"
Received: from gjang-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.252.207.37])
 by orsmga001.jf.intel.com with ESMTP; 11 Dec 2019 17:45:12 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 11 Dec 2019 19:44:57 -0600
Message-Id: <20191212014507.28050-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191212014507.28050-1-pierre-louis.bossart@linux.intel.com>
References: <20191212014507.28050-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v5 01/11] soundwire: sdw_slave: add
	probe_complete structure and new fields
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

When a Slave device becomes synchronized with the bus, it may report
its presence in PING frames, as well as optionally asserting an
in-band PREQ signal.

The bus driver will detect a new Device0, start the enumeration
process and assign it a non-zero device number. The SoundWire
enumeration provides an arbitration to deal with multiple Slaves
reporting ATTACHED at the same time. The bus driver will also invoke
the driver .probe() callback associated with this device. The probe()
depends on the Linux device core, which handles the match operations
and may result in modules being loaded.

Once the non-zero device number is programmed, the Slave will report
its new status in PING frames and the Master hardware will typically
report this status change with an interrupt. At this point, the
.update_status() callback of the codec driver will be invoked (usually
from an interrupt thread or workqueue scheduled from the interrupt
thread).

The first race condition which can happen is between the .probe(),
which allocates the resources, and .update_status() where
initializations are typically handled. The .probe() is only called
once during the initial boot, while .update_status() will be called
for every bus hardware reset and if the Slave device loses
synchronization (an unlikely event but with non-zero probability).

The time difference between the end of the enumeration process and a
change of status reported by the hardware may be as small as one
SoundWire PING frame. The scheduling of the interrupt thread, which
invokes .update_status() is not deterministic, but can be small enough
to create a race condition. With a 48 kHz frame rate and ideal
scheduling cases, the .probe() may be pre-empted within double-digit
microseconds.

Since there is no guarantee that the .probe() completes by the time
.update_status() is invoked as a result of an interrupt, it's not
unusual for the .update_status() to rely on data structures that have
not been allocated yet, leading to kernel oopses.

This patch adds a probe_complete utility, which is used in the
sdw_update_slave_status() routine. The codec driver does not need to
do anything and can safely assume all resources are allocated in its
update_status() callback.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/linux/soundwire/sdw.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 28745b9ba279..cb1db4a7475d 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -547,6 +547,10 @@ struct sdw_slave_ops {
  * @node: node for bus list
  * @port_ready: Port ready completion flag for each Slave port
  * @dev_num: Device Number assigned by Bus
+ * @probed: boolean tracking driver state
+ * @probe_complete: completion utility to control potential races
+ * on startup between driver probe/initialization and SoundWire
+ * Slave state changes/implementation-defined interrupts
  */
 struct sdw_slave {
 	struct sdw_slave_id id;
@@ -561,6 +565,8 @@ struct sdw_slave {
 	struct list_head node;
 	struct completion *port_ready;
 	u16 dev_num;
+	bool probed;
+	struct completion probe_complete;
 };
 
 #define dev_to_sdw_dev(_dev) container_of(_dev, struct sdw_slave, dev)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
