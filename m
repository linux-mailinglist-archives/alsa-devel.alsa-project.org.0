Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E5B117BF4
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 00:59:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEBE01616;
	Tue, 10 Dec 2019 00:59:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEBE01616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575935999;
	bh=SfPhqGSKOEZGeeyjANQgCzH9o9Qr9LXTrfGu/836hVo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NzoSOo5ZRAuZ3RXxUQ7uveY9Kp8Z1d7w6WpFq8l5ifmqXCaxIm8V6IoG5VWSjwV7E
	 J9GEwzFeUZN2tMwr3LcxAKNgXjp6VRDyBhiNPbegGMpzrhFw5axe+H7yUNBCSJIbF6
	 jevKMO+NeAuOn33yMmORbvwUwyAv+msgBPc6Akkg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFD3FF80255;
	Tue, 10 Dec 2019 00:55:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2B7DF8025A; Tue, 10 Dec 2019 00:55:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29FFFF8023E
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 00:55:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29FFFF8023E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Dec 2019 15:55:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,297,1571727600"; d="scan'208";a="210273638"
Received: from bbower-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.65.172])
 by fmsmga008.fm.intel.com with ESMTP; 09 Dec 2019 15:55:33 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 17:55:12 -0600
Message-Id: <20191209235520.18727-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191209235520.18727-1-pierre-louis.bossart@linux.intel.com>
References: <20191209235520.18727-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v4 04/11] soundwire: sdw_slave: track
	unattach_request to handle all init sequences
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

The Slave device initialization can be split in 4 different cases:

1. Master-initiated hardware reset, system suspend-resume and
pm_runtime based on clock-stop mode1. To avoid timeouts and a bad
audio experience, the Slave device resume operations need to wait for
the Slave device to be re-enumerated and its settings restored.

2. Exit from clock-stop mode0. In this case, the Slave device is
required to remain enumerated and its context preserved while the
clock is stopped, so no re-initialization or wait_for_completion() is
necessary.

3. Slave-initiated pm_runtime D3 transition. With the parent child
relationship, it is possible that a Slave device becomes 'suspended'
while its parent is still 'active' with the bus clock still
toggling. In this case, during the pm_runtime resume operation, there
is no need to wait for any settings to be restored.

4. Slave reset (sync loss or implementation-defined). In that case the
bus remains operational and the Slave device will be re-initialized
when it becomes ATTACHED again.

In previous patches, we suggested the use of wait_for_completion() to
deal with the case #1, but case #2 and #3 do not need any wait.

To account for those differences, this patch adds an unattach_request
field. The field is explicitly set by the Master for the case #1, and
if non-zero the Slave device shall wait on resume. In all other cases,
the Slave resume operations can proceed without wait.

The only request tracked so far is Master HardReset, but the request
is declared as a bit mask for future extensions (if needed). The
definition for this value is added in bus.h and does not need to be
exposed in sdw.h

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/linux/soundwire/sdw.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index ed42cd79eab7..b7c9eca4332a 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -556,6 +556,11 @@ struct sdw_slave_ops {
  * Slave device
  * @initialization_complete: completion utility to control potential races
  * on startup between device enumeration and settings being restored
+ * @unattach_request: mask field to keep track why the Slave re-attached and
+ * was re-initialized. This is useful to deal with potential race conditions
+ * between the Master suspending and the codec resuming, and make sure that
+ * when the Master triggered a reset the Slave is properly enumerated and
+ * initialized
  */
 struct sdw_slave {
 	struct sdw_slave_id id;
@@ -574,6 +579,7 @@ struct sdw_slave {
 	struct completion probe_complete;
 	struct completion enumeration_complete;
 	struct completion initialization_complete;
+	u32 unattach_request;
 };
 
 #define dev_to_sdw_dev(_dev) container_of(_dev, struct sdw_slave, dev)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
