Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF8376E036
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Aug 2023 08:28:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E9C14E;
	Thu,  3 Aug 2023 08:27:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E9C14E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691044104;
	bh=vGIa0chkbTg20wwAn5D+PJYLJpAtUvruvhIslT2Po64=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BabZYD9PrDQTLzKJsE8I3d0d0l0orwYNqiNktB/g7rbgXj0/g7juJluofXhOBTB1m
	 15JULgF+FGKiYFpTREMPFPjICqvmfR7w2VT2SDi6MnfhK7UkvMlkGTwxBM6kidLt+y
	 +0uhNN6uBd4i1KZSSnTb5me1xl4jFcS4ERdZsy2E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3021F80549; Thu,  3 Aug 2023 08:26:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49B22F80549;
	Thu,  3 Aug 2023 08:26:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37545F80551; Thu,  3 Aug 2023 08:25:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D338BF80548
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 08:25:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D338BF80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BN/+tVug
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691043906; x=1722579906;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vGIa0chkbTg20wwAn5D+PJYLJpAtUvruvhIslT2Po64=;
  b=BN/+tVug3zmsEL2EsTSnf9/QdfACK5ecQ9LZB4W/M+GD1xIQEkBkjEpA
   rr372EbmPUHngMvosN32k1aTzh/90dEfXEWcm/sIQv6CSZ8fyl9lsy+T3
   5XyTba5YLfVC2AL/MIAlYIRNjYFiGp7aciS99cqbIEPFb5/vLv79lPzTJ
   H0b13sZAniv5ktVqmJsFlU/AVqLqWI1Hf+uM2o5dAKg5rpW7/qa8GhmOz
   iy2QcTFCsQz87DmESZcqvyhijBQMTvL4l5iqBQdUhwM63doN1BwbJj8eA
   tdJtZHVf55QKTb9C/cxGq6xcnZOxzPR3ExbRwKf4wfoiTjpSbc9ZSLiZE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="350075341"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200";
   d="scan'208";a="350075341"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 23:24:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="1060117900"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200";
   d="scan'208";a="1060117900"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 23:24:00 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 2/2] soundWire: intel_auxdevice: resume 'sdw-master' on
 startup and system resume
Date: Thu,  3 Aug 2023 14:52:20 +0800
Message-Id: <20230803065220.3823269-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230803065220.3823269-1-yung-chuan.liao@linux.intel.com>
References: <20230803065220.3823269-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: M624DYPI76SALD3SH65ZJ5JWISIDGGNW
X-Message-ID-Hash: M624DYPI76SALD3SH65ZJ5JWISIDGGNW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M624DYPI76SALD3SH65ZJ5JWISIDGGNW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The SoundWire bus is handled with a dedicated device, which is placed
between the Intel auxiliary device and peripheral devices, e.g.

soundwire_intel.link.0/sdw-master-0/sdw:0:025d:0711:01

The functionality of this 'sdw-master' device is limited, specifically
for pm_runtime the ASoC framework will not rely on
pm_runtime_get_sync() since it does not register any components. It
will only change status thanks to the parent-child relationship which
guarantees that the 'sdw-master' device will be pm_runtime resumed
before any peripheral device.

However on startup and system resume it's possible that only the
auxiliary device is pm_runtime active, and the peripheral will only
become active during its io_init routine, leading to another
occurrence of the error reported by the pm_runtime framework:

rt711 sdw:0:025d:0711:00: runtime PM trying to activate child device
sdw:0:025d:0711:00 but parent (sdw-master-0) is not active

This patch suggests aligning the sdw-master device status to that of
the auxiliary device. The difference between the two is completely
notional and their pm_status shouldn't be different during the startup
and system resume steps.

This problem was exposed by recent changes in the timing of the bus
reset, but was present in this driver since we introduced pm_runtime
support.

Closes: https://github.com/thesofproject/linux/issues/4328
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel_auxdevice.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index f51c776eeeff..91c86b46a5a1 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -257,6 +257,8 @@ int intel_link_startup(struct auxiliary_device *auxdev)
 
 		pm_runtime_set_active(dev);
 		pm_runtime_enable(dev);
+
+		pm_runtime_resume(bus->dev);
 	}
 
 	/* start bus */
@@ -294,6 +296,7 @@ int intel_link_startup(struct auxiliary_device *auxdev)
 	 * definition of Master properties.
 	 */
 	if (!(link_flags & SDW_INTEL_MASTER_DISABLE_PM_RUNTIME_IDLE)) {
+		pm_runtime_mark_last_busy(bus->dev);
 		pm_runtime_mark_last_busy(dev);
 		pm_runtime_idle(dev);
 	}
@@ -557,6 +560,8 @@ static int __maybe_unused intel_resume(struct device *dev)
 		pm_runtime_mark_last_busy(dev);
 		pm_runtime_enable(dev);
 
+		pm_runtime_resume(bus->dev);
+
 		link_flags = md_flags >> (bus->link_id * 8);
 
 		if (!(link_flags & SDW_INTEL_MASTER_DISABLE_PM_RUNTIME_IDLE))
@@ -592,6 +597,7 @@ static int __maybe_unused intel_resume(struct device *dev)
 	 * counters and delay the pm_runtime suspend by several
 	 * seconds, by when all enumeration should be complete.
 	 */
+	pm_runtime_mark_last_busy(bus->dev);
 	pm_runtime_mark_last_busy(dev);
 
 	return 0;
-- 
2.25.1

