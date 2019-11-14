Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CCDFCC3C
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2019 18:56:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E3B91615;
	Thu, 14 Nov 2019 18:55:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E3B91615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573754194;
	bh=syBxWHNLgbdqw7c7cJwGJbyivJ3ihuv9AhP3aGYcFvk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uWGdn4h7znT7AM8nk/17mTBjMH2vNQmreIf1vWFKI6obL3WgK9Zi1/bZKQzLY5Z2D
	 Wa3ThiA2PTdIZe1kve//3w4YVNRUqofIZ+kRYfa8M21MbxQzn3cmKkio5P6PmqUjN6
	 P2fubM3FRN1ypyPuT4XMxFiOAgrQNAqPnK8PdgTg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E49D1F800FF;
	Thu, 14 Nov 2019 18:54:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 923BDF800FD; Thu, 14 Nov 2019 18:54:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EF24F800CC
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 18:54:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EF24F800CC
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2019 09:53:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,304,1569308400"; d="scan'208";a="203132956"
Received: from chiahuil-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.228.77])
 by fmsmga008.fm.intel.com with ESMTP; 14 Nov 2019 09:53:56 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 14 Nov 2019 11:53:41 -0600
Message-Id: <20191114175345.21836-3-pierre-louis.bossart@linux.intel.com>
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
Subject: [alsa-devel] [PATCH v3 2/6] soundwire: sdw_slave: add
	enumeration_complete structure
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

When the Master starts the bus (be it during the initial boot or
system resume), it usually performs a HardReset to make sure
electrical levels are correct, then enables the control channel.

While the PM framework guarantees that the Slave devices will only
become 'active' once the Master completes the bus initialization,
there is still a risk of a race condition: the Slave enumeration is
handled in a separate interrupt thread triggered by hardware status
changes, so the Slave device may not be ready to accept commands when
the Slave driver tries to access the registers and restore settings in
its resume or pm_runtime_resume callbacks. In those cases, any
read/write commands from/to the Slave device will result in a timeout.

This patch adds an enumeration_complete structure. When the bus is
goes through a HardReset sequence and restarted, the Slave will be
marked as UNATTACHED, which will result in a call to
init_completion().

When the Slave reports its presence during PING frames as a non-zero
Device, the Master hardware will issue an interrupt and the bus driver
will invoke complete(). The order between init_completion()/complete()
is predictable since this is a Master-initiated transition.

The Slave driver may use wait_for_completion() in its resume callback.
When regmap is used, the Slave driver will typically set its regmap in
cache-only mode on suspend, then on resume block on
wait_for_completion(&enumeration_complete) to guarantee it is safe to
start read/write transactions. It may then exit the cache-only mode
and use a regmap_sync to restore settings. All these steps are
optional, their use completely depends on the Slave device
capabilities and how the Slave driver is implemented.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/linux/soundwire/sdw.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index cb1db4a7475d..3fa8d875b16b 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -551,6 +551,9 @@ struct sdw_slave_ops {
  * @probe_complete: completion utility to control potential races
  * on startup between driver probe/initialization and SoundWire
  * Slave state changes/implementation-defined interrupts
+ * @enumeration_complete: completion utility to control potential races
+ * on startup between device enumeration and read/write access to the
+ * Slave device
  */
 struct sdw_slave {
 	struct sdw_slave_id id;
@@ -567,6 +570,7 @@ struct sdw_slave {
 	u16 dev_num;
 	bool probed;
 	struct completion probe_complete;
+	struct completion enumeration_complete;
 };
 
 #define dev_to_sdw_dev(_dev) container_of(_dev, struct sdw_slave, dev)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
