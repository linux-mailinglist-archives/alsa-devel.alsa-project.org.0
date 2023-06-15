Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A45BE731AF1
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jun 2023 16:13:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6756D820;
	Thu, 15 Jun 2023 16:12:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6756D820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686838397;
	bh=qV8DkGLMiMzMEFUkwCIiRNz3LWJpxCVBUzV5DfaZgCQ=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UDkjWFXNXiESYoSFuIL4/35uITV7oNpcVj6rvXN1X+aqKkq3/CLEHKDnZm6I8r2lk
	 GxgPOPKeEbXT3PZB3j7ydZVf3nkToi+v4VV0L1n3zI17ZZHNRTu0xLsWvmIALW0o5V
	 wlkXnuWAe5ZM/BaXDUSPHBbjCORmn7OlMxKGqIcE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5F7CF80246; Thu, 15 Jun 2023 16:12:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43AEBF80130;
	Thu, 15 Jun 2023 16:12:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C962F80155; Thu, 15 Jun 2023 16:12:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9CA80F800ED
	for <alsa-devel@alsa-project.org>; Thu, 15 Jun 2023 16:12:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CA80F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=SEUYuhvp
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35FE3pF5025945;
	Thu, 15 Jun 2023 09:12:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=EhJys9uuBbtQEZ3Oj5s1X5sALPRgYIm5gNpiZJZVlEY=;
 b=SEUYuhvpEVlIMtL9a036T+B+GcrI7aU8S7BT3DI254P+KskeJ+Mj0ytg44z4SeAfgN6o
 2Mw9xXB9ZLOXrA864u95Elffgw64iG92hl3NCjtNUaID+3bxTdpnsnmG9duPd0KxSfI6
 baufsgvQ6d/W5MQGVnr/atgJpSSyi0WCqTY3HkYmgdMC7KXiRcDpwy5pGPgN+TuD4IMj
 vxH7Ysp6BVkXEYoZcbCYEQdg6BFuLYUeAXd5eZlfNHndqZbH3Pjbyr2sFBWHqdQHnYur
 zvxY6Olw0IEXWZ1j9WoEBW3/6JPYNE77bg12U5vAPVUppr0xQqwG2Fa9Gv1frZfqLRo0 5g==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3r75nu9xmp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jun 2023 09:12:09 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Thu, 15 Jun
 2023 15:12:08 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Thu, 15 Jun 2023 15:12:08 +0100
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 21AB911D4;
	Thu, 15 Jun 2023 14:12:08 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
        <pierre-louis.bossart@linux.intel.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH 1/2] soundwire: bus: Prevent lockdep asserts when stream has
 multiple buses
Date: Thu, 15 Jun 2023 15:12:07 +0100
Message-ID: <20230615141208.679011-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: C-MgO0yxO_bhSMFH9VvY9RiYw3ycGICJ
X-Proofpoint-GUID: C-MgO0yxO_bhSMFH9VvY9RiYw3ycGICJ
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: NPFVPSQIBDKLN6WQZZYGQH7HFYVAE3DJ
X-Message-ID-Hash: NPFVPSQIBDKLN6WQZZYGQH7HFYVAE3DJ
X-MailFrom: prvs=1530da28e9=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NPFVPSQIBDKLN6WQZZYGQH7HFYVAE3DJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Give the bus_lock and msg_lock of each bus a different unique key
so that it is possible to acquire the locks of multiple buses
without lockdep asserting a possible deadlock.

Using mutex_init() to initialize a mutex gives all those mutexes
the same lock class. Lockdep checking treats it as an error to
attempt to take a mutex while already holding a mutex of the same
class. This causes a lockdep assert when sdw_acquire_bus_lock()
attempts to lock multiple buses, and when do_bank_switch() takes
multiple msg_lock.

[  138.697350] WARNING: possible recursive locking detected
[  138.697366] 6.3.0-test #1 Tainted: G            E
[  138.697380] --------------------------------------------
[  138.697394] play/903 is trying to acquire lock:
[  138.697409] ffff99b8c41aa8c8 (&bus->bus_lock){+.+.}-{3:3}, at:
sdw_prepare_stream+0x52/0x2e0
[  138.697443]
               but task is already holding lock:
[  138.697468] ffff99b8c41af8c8 (&bus->bus_lock){+.+.}-{3:3}, at:
sdw_prepare_stream+0x52/0x2e0
[  138.697493]
               other info that might help us debug this:
[  138.697521]  Possible unsafe locking scenario:

[  138.697540]        CPU0
[  138.697550]        ----
[  138.697559]   lock(&bus->bus_lock);
[  138.697570]   lock(&bus->bus_lock);
[  138.697581]
                *** DEADLOCK ***

Giving each mutex a unique key allows multiple to be held
without triggering a lockdep assert. But note that it does not
allow them to be taken in one order then a different order.
If two mutexes are taken in the order A, B then they must
always be taken in that order otherwise they could deadlock.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/soundwire/bus.c       | 15 +++++++++++++--
 include/linux/soundwire/sdw.h |  3 +++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index b44f8d0affa6..dba920ec88f6 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -69,8 +69,17 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
 		return -EINVAL;
 	}
 
-	mutex_init(&bus->msg_lock);
-	mutex_init(&bus->bus_lock);
+	/*
+	 * Give each bus_lock and msg_lock a unique key so that lockdep won't
+	 * trigger a deadlock warning when the locks of several buses are
+	 * grabbed during configuration of a multi-bus stream.
+	 */
+	lockdep_register_key(&bus->msg_lock_key);
+	__mutex_init(&bus->msg_lock, "msg_lock", &bus->msg_lock_key);
+
+	lockdep_register_key(&bus->bus_lock_key);
+	__mutex_init(&bus->bus_lock, "bus_lock", &bus->bus_lock_key);
+
 	INIT_LIST_HEAD(&bus->slaves);
 	INIT_LIST_HEAD(&bus->m_rt_list);
 
@@ -181,6 +190,8 @@ void sdw_bus_master_delete(struct sdw_bus *bus)
 	sdw_master_device_del(bus);
 
 	sdw_bus_debugfs_exit(bus);
+	lockdep_unregister_key(&bus->bus_lock_key);
+	lockdep_unregister_key(&bus->msg_lock_key);
 	ida_free(&sdw_bus_ida, bus->id);
 }
 EXPORT_SYMBOL(sdw_bus_master_delete);
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index c076a3f879b3..f523ceabd059 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -5,6 +5,7 @@
 #define __SOUNDWIRE_H
 
 #include <linux/bug.h>
+#include <linux/lockdep_types.h>
 #include <linux/mod_devicetable.h>
 #include <linux/bitfield.h>
 
@@ -907,7 +908,9 @@ struct sdw_bus {
 	struct list_head slaves;
 	DECLARE_BITMAP(assigned, SDW_MAX_DEVICES);
 	struct mutex bus_lock;
+	struct lock_class_key bus_lock_key;
 	struct mutex msg_lock;
+	struct lock_class_key msg_lock_key;
 	int (*compute_params)(struct sdw_bus *bus);
 	const struct sdw_master_ops *ops;
 	const struct sdw_master_port_ops *port_ops;
-- 
2.30.2

