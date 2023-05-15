Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2DE702580
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 08:56:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83A88850;
	Mon, 15 May 2023 08:55:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83A88850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684133772;
	bh=tzzjYf0orwaeoCq1YKwuJr6YmoUY5TgIK1ZLlpL2MUE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gUi2PHAokPxglHssZmvZqlDbu3gLDXTTfC7Fzm8xIz1TlQP/n2bUzMXHugKIPcm9d
	 DXIE9ZxH8wAz5eTrRAOF9Chzb5ykKlzZxyH1cKfBTcYWvE9gzCU57/JW6bDvDVM3cH
	 kV28U3F6hlrXRAXf8Kfd/B+rqx924wqmf45THD7A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C77CAF80638; Mon, 15 May 2023 08:51:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17509F80630;
	Mon, 15 May 2023 08:51:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0ED7CF80605; Mon, 15 May 2023 08:51:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7A33F805F7
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 08:51:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7A33F805F7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=AVg5cqE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684133469; x=1715669469;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tzzjYf0orwaeoCq1YKwuJr6YmoUY5TgIK1ZLlpL2MUE=;
  b=AVg5cqE9LhQtFKeJKvQWIZjfCPZ211Hb0SDuveRs6zjk1SJ6rKcHn4j5
   3w6D7k5YAWQL4+TEBIzfkK3d8KHRoVbWhsOFH1QP3YmUv0XYjQTGjouhl
   zpvqSR4EeqnRnTRkSdI0JodUT9NglDj+pjY6J5GqKyOVv3aDNSxdAWzLr
   YwO8RGKfggwMr/ByiOk7SLM8mOFNaBnomGU7MYmWcUuSESXbwkHlDr3lK
   OTDLMivbZs8gvwHlh64KVtxsm4I7D9d2ily1zY9W7QbBT6jXfuBCYgXpW
   rZhpEipI+eSCawYpYcS3UhmjRCG5c6GVB+uiVW7C+1jrxDFrnuAxCNUjE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="349966505"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="349966505"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:51:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="694908767"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="694908767"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:51:04 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	vinod.koul@linaro.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v2 19/26] soundwire: bus: add new manager callback to deal
 with peripheral enumeration
Date: Mon, 15 May 2023 15:10:35 +0800
Message-Id: <20230515071042.2038-20-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
References: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JD4EUSWRPJKKXJZ5JADISW4EFH7ENOA3
X-Message-ID-Hash: JD4EUSWRPJKKXJZ5JADISW4EFH7ENOA3
X-MailFrom: yung-chuan.liao@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JD4EUSWRPJKKXJZ5JADISW4EFH7ENOA3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

When a peripheral reports as ATTACHED, the manager may need to follow
a programming sequence, e.g. to assign DMA resources and/or assign a
command queue for that peripheral.

This patch adds an optional callback, which will be invoked every time
the peripheral attaches. This might be overkill in some scenarios, and
one could argue that this should be invoked only on the first
attachment. The bus does not however track this first attachment with
any existing state-mirroring variable, and using dev_num_sticky would
not work across suspend-resume cycles.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c       | 3 +++
 include/linux/soundwire/sdw.h | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 338f4f0b5d0c..b44f8d0affa6 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -769,6 +769,9 @@ static int sdw_assign_device_num(struct sdw_slave *slave)
 	/* After xfer of msg, restore dev_num */
 	slave->dev_num = slave->dev_num_sticky;
 
+	if (bus->ops && bus->ops->new_peripheral_assigned)
+		bus->ops->new_peripheral_assigned(bus, dev_num);
+
 	return 0;
 }
 
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index ef645de13ae9..c076a3f879b3 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -846,6 +846,7 @@ struct sdw_defer {
  * @post_bank_switch: Callback for post bank switch
  * @read_ping_status: Read status from PING frames, reported with two bits per Device.
  * Bits 31:24 are reserved.
+ * @new_peripheral_assigned: Callback to handle enumeration of new peripheral.
  */
 struct sdw_master_ops {
 	int (*read_prop)(struct sdw_bus *bus);
@@ -860,7 +861,7 @@ struct sdw_master_ops {
 	int (*pre_bank_switch)(struct sdw_bus *bus);
 	int (*post_bank_switch)(struct sdw_bus *bus);
 	u32 (*read_ping_status)(struct sdw_bus *bus);
-
+	void (*new_peripheral_assigned)(struct sdw_bus *bus, int dev_num);
 };
 
 /**
-- 
2.25.1

