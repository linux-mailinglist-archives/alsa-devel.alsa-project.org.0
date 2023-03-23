Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 237426C5CB8
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 03:38:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46F67EBC;
	Thu, 23 Mar 2023 03:37:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46F67EBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679539110;
	bh=hnhElbRld4txs7kDuoW94BJGsXBT6ijbvQTXWGdEXpY=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KDsRC5fZU+SHJIpy/ezsE/UXLL6h9inTsdgtTdbQzzZ073v2IeHeqvg2+WqCK+GF5
	 mN2JFW0myPt3kQklxY2Q+nRTkn3xYeKill+vt1xR+KPK6CPOwjI4ZeBLU2JL0rhrN8
	 6yaSty4PAYEUOawBTDHP1Q6c2L9M2pg+KdFrqacw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9907FF800C9;
	Thu, 23 Mar 2023 03:37:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7D92F8027B; Thu, 23 Mar 2023 03:37:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5BCC8F80105
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 03:37:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BCC8F80105
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=moe4h+iv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679539049; x=1711075049;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hnhElbRld4txs7kDuoW94BJGsXBT6ijbvQTXWGdEXpY=;
  b=moe4h+ivhH9tfNq3QaS2g3GY9KVGQ/hafOOMQOdk+82ph4tYctykYej0
   8EcUE1NypsWxEI2x0RcPyHbrnAvV6g7Ur6jWLgtHqP+2+pwGpSvBFlJ58
   ax/7kVPdfuRUPTz4sHSWtWNPKUcPxn7cCoGx/X4pRVeLWaGWMymX8ykjk
   fZEq4/9lYd+H8A3jnuqERW1ZH6kiDGHYwusxXuRuF//1jF/Jd0wSmAxy5
   GF3l2ywf8LKokmfSEnzmubOaPe2Kdiv0RmqnLVH+qxSidQRzRPCTsMFWm
   GbnmscR9lWs80Er3wMiwZZfmupUQqbwMIpi9k1FsPXfXSWukBJ3NOJRov
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="340919163"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="340919163"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 19:37:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="928061809"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="928061809"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 19:37:16 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH] soundwire: intel_auxdevice: improve pm_prepare step
Date: Thu, 23 Mar 2023 10:52:28 +0800
Message-Id: <20230323025228.1537107-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RXOCPAMZMPTZGQ6VD4J7P4J5R6RCOSGX
X-Message-ID-Hash: RXOCPAMZMPTZGQ6VD4J7P4J5R6RCOSGX
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RXOCPAMZMPTZGQ6VD4J7P4J5R6RCOSGX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

In the case where multiple peripherals are attached on the same link,
it's possible that they are in different pm_runtime states.

The device_for_each_child() loop to resume all devices before a system
suspend would not work if one peripheral was active and others
suspended. pm_runtime_resume() returns 1 in the former case, which is
taken as a error. As a result, a pm_runtime suspended device might be
skipped if the first device was active.

This patch changes the behavior of the helper function to only return
zero or a negative error. A Fixes tag is not provided since there are
no existing configurations on Intel platforms with different types of
devices on the same link. Amplifiers may be used on the same link, but
they are used by the same dailink so their pm_runtime state is always
matching. This assumption may not be true in the future, so we should
improve the behavior and align with AMD.

Reported-by: Mukunda,Vijendar <vijendar.mukunda@amd.com>
Link: https://lore.kernel.org/lkml/4cbbff8a-c596-e9cc-a6cf-6f8b66607505@amd.com/
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel_auxdevice.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index 5021be0f4158..b21e86084f7b 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -358,10 +358,12 @@ static int intel_resume_child_device(struct device *dev, void *data)
 	}
 
 	ret = pm_request_resume(dev);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(dev, "%s: pm_request_resume failed: %d\n", __func__, ret);
+		return ret;
+	}
 
-	return ret;
+	return 0;
 }
 
 static int __maybe_unused intel_pm_prepare(struct device *dev)
-- 
2.25.1

