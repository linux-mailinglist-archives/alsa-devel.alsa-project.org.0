Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BBFFCC47
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2019 18:57:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F31B11616;
	Thu, 14 Nov 2019 18:56:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F31B11616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573754241;
	bh=amrqqRX5wteWEjhOBJjhzJNPzmCqY0Nh2r/8Ag9LLko=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fll8BQiMp6n+Jp5xFb/zw6sjpERFeb70jyxROUgHLN+jWkFJ848Z5oc+owCqE/D+o
	 oG2fJLCmsCBP5iolTlDNqdOUZ8hKNSlvSjS8m95/ncLZOvlbgE2JrKxnsKpw2gMeNa
	 GZMTFvJe5eArfkuCorLKU2Xv3ALoXfvZc1ehmIEU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43819F80108;
	Thu, 14 Nov 2019 18:54:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0D25F800EF; Thu, 14 Nov 2019 18:54:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F4A4F800CF
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 18:54:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F4A4F800CF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2019 09:53:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,304,1569308400"; d="scan'208";a="203132948"
Received: from chiahuil-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.228.77])
 by fmsmga008.fm.intel.com with ESMTP; 14 Nov 2019 09:53:54 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 14 Nov 2019 11:53:40 -0600
Message-Id: <20191114175345.21836-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191114175345.21836-1-pierre-louis.bossart@linux.intel.com>
References: <20191114175345.21836-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v3 1/6] soundwire: sdw_slave: add
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
